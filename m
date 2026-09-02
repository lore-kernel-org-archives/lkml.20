Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C63395ADD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355101; cv=pass; b=Fy/0DzX6uu9PTsYzyb/mKrTg7CEsFIoKtei+4fukym8KttOOGoFDrzzgnfsVyuo7VHcepGOKdX+BUbphMgHcqToR8b62U5dIFtmiCVnLXw63aZE5jRg3IZLDdt/ucVcb1nqVDxZfOdVoSxkIcqWq7V4YmVqcyuFPSCQ8IuMj99s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355101; c=relaxed/simple;
	bh=vml0uNQKeGVnX3dK4hM4ngGTCQ9mhwmQP0hmR3tD3e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvR+MdjHorPX5VkA336RvdqmOarsnJeB8WU7OL8cNiFizFgqIOKQHEGCsf91QGoVDYYLOV/BwdEKxNx8eHHvHoarWA49YFZut9Am/LTHbkUO7WdZpwAxuLKcIULd7MYAoa/J9e6BGzk8ifZA6AcTWO9lLSddAiWTu8Pmaa4UBxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wvb4RYqQ; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wvb4RYqQ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1172567a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788355099; cv=none;
        d=google.com; s=arc-20260327;
        b=cscRIW6B+lgaoa2yWXETzOnBT0Yb6jeNLnw1Oe97tjMzf54+SOJpCOJLheLCl6W34x
         FxuYhdQvbV1QIrtE3a8lh2JSl4/TxZEGx8eEin3N/amNjVWd7wzPqUq1NLSBONpnQ4cp
         dnMjPysKbbq5ZZti16NDpgVuHpr7HsnFn5rimG63R8jCuRtfAp5+s3WjHUUeDZcqkIHH
         MJKoSA5OL+AOOKA2hTh+61LX8T2fo/KKPW74BzTWdZGW5u0Hcuih6+H1+UeAnOWy1gF0
         DOG5HNyTS/XcmIwcTVHkuf5J51EMxHR4Lowo/qnAtczn75MfI7fAIKTCx0p2eaa6IVfS
         Fqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vml0uNQKeGVnX3dK4hM4ngGTCQ9mhwmQP0hmR3tD3e0=;
        fh=HYwUk94Pc9Vl5SZuZ2Nm+jfHwnL5FruYFbDdNPTwPgM=;
        b=WqxQKMh2ZS9kKQetnZmopYAmNu3CVVTtAI8ll1DeILrg5KmSbMZZMjxW9O/lfIUzV7
         bxQGIHcgDV+xC70EZ/1+opZEDrNOq+/s/dLPJe+Tk55zl0sWdn/v30skkWgFcn6vRPsD
         7XqZhkeGJYE+saO+w93LQP2lwzXAKYJnBY+e6Wa03QTi9SFuOq7GjT/S26pojWQf3Jfg
         jhoTzNfGfS7kf9SHG4rEIJSwxfAht8T7oL8aG1yGT2dQPkBFubt2IzSXe9rMFdZHA9aR
         V1mXVe8mzksxAx7ZEceBxOcURvo53RnaAMpawty5TkUhFHmQEjHe4XQQ600Ah0a6E7me
         EJ/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788355099; x=1788959899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vml0uNQKeGVnX3dK4hM4ngGTCQ9mhwmQP0hmR3tD3e0=;
        b=Wvb4RYqQFwFCHrMpp1GICo4nvbSvGkOh/MaUfYQxYApRp/jm9uD8rnxznnasiMJ2JR
         QwgEWjEDatGNNXVqnzuLv7WNaIuaahPg0Vsw4mE01pQf7HKqR1zesLue28mpwudjtFpl
         v9ka0zElcrSOOFUyfUdXWZ4u8wOHdlRBrAQsFhjv4CaOpC4WJlGAIIJKrEF07ghw8M/U
         bFgePv/+Xt8pCTkr78DsgfN1lKN8Q+Ycr0kba4ZJrdvE+JZdBSkaRISS7TUoKIQQgRMz
         b07UPPBn1GbPKHeN9iIAnHXNCehdE2YVBMhk40+nBKEk89vRLYUxKsdPh2Ab6M2GXV7t
         HnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355099; x=1788959899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vml0uNQKeGVnX3dK4hM4ngGTCQ9mhwmQP0hmR3tD3e0=;
        b=iOK2rd2GgQXjU9FIqcp3gluF+XtBlUuZFAouGdRs4RSpO7QRWPbM8DWc/Eiiuu88fy
         GqqJNfIpcFVwehx4QTdoP82UeWVgR7fS+jU2yjfPErqdCjC5JVdG57vXwjAI+xYBfRXP
         AM63Ez6T3mA/oLd2Ujfk4h/AvmAKBBRhycHWZb608Zs5QEBh0ro6H0PZhC7vJJxd6Rbw
         Be5LzEMNfn5rgnK/Gb0ttI1dJIh2retLC9mmtqAfTnosJjpL79ANcDCW0YO7q70Uj4/p
         4t1XfDW7WNLrqy8lowEgdFy41Q62ioDeSuz7JUazUqn5J0ZDboSk6F2wsEVYh/Xrp0Mm
         5Z7Q==
X-Forwarded-Encrypted: i=1; AKwUvByFnuF+JU/ujXMzsVhFnyoZfEbsRDQ3ThKRd4NrI8iAR0UskkMB0ITB9HAPZp6quHG/FafSm2v0+PuIzok=@vger.kernel.org
X-Gm-Message-State: AFuF++l962LmdBQ3nFVlOACXvGU3MHW2p5FyU9R0DmZMM2qv2o5mGsRG
	LFf9Ll31OqGs5aWwEynr/KsLW+sHNc/rhVy7WogoTCKfZ1rF0p5qs7JvXrppQCWsXn9OSVl6ol8
	QVlpMzB+Z76rOouKcUg2+6wDkBVFiVh4m99UDaGE5
X-Gm-Gg: AYBFou1qdmEAi8RL/YFyHEzw/Auu99wmfly/YrRS1L1jW4f3XElTwxD+/sRF+Qc9rHE
	rjA2yaQ58s2N3Vbk0fLlNuLzaGiIQlTwwVPNEXMFFDVOhKWPs1xGvdtCrrjIfRM6jQnspBda1S0
	s307lOTirKLFudNBWA8WLe1mmfnkc/3k+24MR0n+pLzWU4KEef2d2FHbQ/d49Pkge0SRyqgvKfX
	zx0QmHc8enxq2P55dgNptVFi9ILe6hDRwTDXOGW2nsmpK8wluPpnQKws82iRzBDXhdFO1PsPDxK
	2koEvfs/qu9S9mF4K/MDITtluOhcJF7rKQO6AlF3Kx3OanHCyhcuCcfhjafxksjB/1ck3MYDdA=
	=
X-Received: by 2002:a17:90b:2750:b0:398:e73e:5a0c with SMTP id
 98e67ed59e1d1-39aedf5d887mr7396769a91.1.1788355098217; Wed, 02 Sep 2026
 06:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901124013.1098560-1-xiangzao@linux.alibaba.com> <20260901124013.1098560-3-xiangzao@linux.alibaba.com>
In-Reply-To: <20260901124013.1098560-3-xiangzao@linux.alibaba.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 2 Sep 2026 15:17:41 +0200
X-Gm-Features: AcwNN1XM2BzITGqUSo0D8HPYIrUbNX9N29u8ucC8F6Zcs9BqkJ7UZhQH1J-LCJE
Message-ID: <CAG_fn=U5we-NBw=8j_dKJzoHU5V2bDOh3OjJ1arqZQusKRy=JA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] x86/fred: Fix stack depot filtering of FRED event stacks
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, xin@zytor.com, 
	luto@kernel.org, jpoimboe@kernel.org, peterz@infradead.org, 
	rostedt@goodmis.org, akpm@linux-foundation.org, rdunlap@infradead.org, 
	elver@google.com, andreyknvl@gmail.com, gor@linux.ibm.com, 
	brads@mainlining.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Xiang Zheng <xiang.zheng@linux.alibaba.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 2:40=E2=80=AFPM Yuanhe Shu <xiangzao@linux.alibaba.c=
om> wrote:
>

> Reported-by: Xiang Zheng <xiang.zheng@linux.alibaba.com>
> Fixes: 14619d912b65 ("x86/fred: FRED entry/exit and dispatch code")
> Cc: stable@vger.kernel.org # v6.9+
> Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
Acked-by: Alexander Potapenko <glider@google.com>
