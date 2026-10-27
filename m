Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793120388;
	b=a7vYs0XOWwfwtjaOVMWG/L3Bb2hyGdgMB6fY1tgaBlpcnp7nNRRUdUf/aiStI98I0E/B
	 /h6grCPwmCXR/YgED69PDu7JMNuMv3lHPJ1b+zuZ+JlXPQNTeMalodLgSRJ1qcsC82HYd
	 aOedSCo/2YwgYbdMcp1k3Lu5U1zN1JgwUu0P9aLhzBQQ/eQ/I7J411JWN6bEclb4LDNlo
	 WJo8+PCFfIC0ZAJanFAllnfeoB3nQewmHgX14HC4txxqXU7EMfPjWG2ch/aeKSMss6B8Z
	 AfCUU2fg6G5urp+n/yw0VNzd9CP8RmOu7y7vpJVkMKNDnLp+5SSEYlXs1BC5z4EuBBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=cWqtapXHjLtS+FgSV/2weEkwr/iseo49x9LmRe6BOr0=;
	b=2bg/Q9BfJcd/5FrgIiipUMbzrnuCUch1FpVY9zDq/qmQtyVB9XWUeQ7Tm/ND3OCYWq/C
	 nKS71dZU9jaj34QgcuCg+S3v1+vtCX06vGpDBzFVP9XD08qXBY7cERcw1fIyNCZiHAQN1
	 F8rqVkiK8lYNOFDS1AcCXfHNtX/yo3/Mw1a4Y0/vrWuO2E2cdSGlqlwJAHHmed/3cZDtL
	 poSX80jcC81SJvxBrqIrMvhE4nQLCgkvs2oh8XTgPagKtkAEL8pVGwGdo0NOq8X+TPBMN
	 HY0ZosHABzeNAN7NKQwFugcGHAE9YwCS3k0BZCASIcuCf67LBuet83cqr4+Zn34Gyiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BuDxNJzM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA15606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA15606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BuDxNJzM
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4d648aacso135422e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793120386; cv=none;
        d=google.com; s=arc-20260327;
        b=d41XrMdRrDzcOprQfuc+n1DS9FKgU2dP7c9lUrCnpXcURaps5W5dThZYo1Lt5yoOuK
         KFEuI53CPf2IY8oQ+kSCnvbC7cWjbTJg7KUWdjtrCJ4yLuxjFA/7Pi8+te6N8tC7K3hi
         CG8joX2L6WkigSzdK4GjXJG6eieyAJorItSXqJ/OfLa7q0YbF6AU7PuI/+Uz1K1q4LU2
         yGRYUDdiffGrut0hC1o9iRPdjrI0eNfVdAVd+n59Aw1E/JA0hPRgQqKTWQx9wJw/2mvL
         tGrubRSJNU4rOf9xg0n3n045dqEIcCqcBJ8zDEZFlDOn4ydVhKQcF8swuFCME94ue0Ly
         kkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWqtapXHjLtS+FgSV/2weEkwr/iseo49x9LmRe6BOr0=;
        fh=wqpym5wdywHKX1k4LfSuYEIgziUVveNNjJlYs87qQ4Q=;
        b=oAzyZktfPcF4h9UA+Fo5tTSR8McqUXmUwwqsj7L9YUNVQeCr1tyhJ7hneWOoY48cVZ
         gyzfKK9axQKoseZ2KBK0TlSPQfx7JGXtL2VAXaR5dyfUKoansvyBwdF7vbTzOkgEuZRW
         YlqgIqQyhnVGMfTZsNHWy1ndEsSKaFd/fNkIot7sbE3hyyEHnYlJeb9LT/FVcqUc0rCI
         c7Wyijfren6UOThQVaWxP+Ff0HgEs1BKagfNAV309jb4b7lED2UOt2SgkTPWO9R6Xw1l
         jFxT4kSMORpIYzYeWpRJfJj1aEnw4VBa3JrRAwaAliE6gt/4CEzzk7w3iImsT+y5EBUy
         lH1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793120386; x=1793725186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cWqtapXHjLtS+FgSV/2weEkwr/iseo49x9LmRe6BOr0=;
        b=BuDxNJzMueFtLA12Yei4sXWjYbhJp+sKn1VilyP0aZQPHvWhhuYOxdEYYdB2fliVfS
         hSfUPgKFb5ke5N3OD7lZBxA71HgSdFvz9kAKjYM9d4jz4WBF3Hms70Im6nMI9W46cCH0
         bE1iK8YNTnzVXzqkaL0Wjsg8BpcokdYuMRFBOZG2YeZJV+UOxXrAD5Vr1WCc/TD2U05x
         SydmP/isqmHmgc/6hyVr1619UTDW6S0sE6FhpVUe7ku2prUbU796IU9MlNtFoRQBilg7
         alZ9OS9we7qHKF4FH/gknMVC/BlqNCSEmrE9OAk4cHDlb9KmIlOWI94vsv1JlxQgJ/GR
         E9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793120386; x=1793725186;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWqtapXHjLtS+FgSV/2weEkwr/iseo49x9LmRe6BOr0=;
        b=wA+Y3VMRvh4QzbwppDa1ui07XOC2mjFOR9YyfOA2EOzbIV2wTQ+UNuTa1BhAkG8Mjb
         jDDR6n8JhCIOIIjXs0KBfg0hfYp8HeuO4CDqgRWVHX+nMNp9wM6ytMvQuLGuseAeKU1f
         kq3A9VdDKeVixqVhAc6cmM1NYdb7EL2kWMndkmpKX+/jMEA3YT6hcRJ+t2P998PnWcit
         LXOgEy21V6MdofRtCcgTtb24FAcT+t44WAvoXACKRs7MOu4uaYwM/fHsyCsRnhuKbJ56
         RCVX2XA/BNedh3dI330REmUXaEDhoFILCex5DgLV3uQx5AQWg1s7XAy1L+1i/tHeitkw
         ZS/Q==
X-Gm-Message-State: AFq9FYKJFSgm1Zqc/Jq8PlsU/kafZ5jpTUFp+kXU3OEnIu/nD2kJanxp
	jQF2R53Z9w9mITiCSf+ZDN8dHp2oqCJWuvQzuoPjhy6kvWgCubrs//Mp874czZUB0LqXo2DGDLC
	8tAo6wqJLqs1WBoeukSvfJWnF7iZcS7Il7gm0C43anA==
X-Gm-Gg: AYBFou3mCnTOd/ULXrFRNbHxycDS82LJ7xEgaCkqpH5RYFz2rf2Dn/9S/GjXrf4fmEi
	h8olf5/94rVGplgxe6pacaM67pyKbewajlKIxhHlsvQ0arEoxlnLs2dEYFzyplx+hnoZaClBSLx
	y1KiT2XVd6SHNpzRRaqzCcSI1ZXCZi3TvZQnNkatXK0v7kZ94knKzc66FfBgCcytMIvHW+QX4Ci
	grO9ctgb+C9vq1o+dVrzWI0+YdG5mzZYllFdkEmevza7yraesH3STEWjfQhGcjJwcUsLJh9lt2e
	h5+R34KcPb/SAT6wt+zQmcBwvDpZxyTZhTJashLfxEa6UDIiGiT5Z2RaErhEeiMxPEyIjeqgzY5
	frpIzJA2KbZKfcpubJkLLFcg0+N/gEckeyY3O0YEgut69/SZu9b1XTaUmBI9XEdhNDrUyBkak0y
	eCdMYj20y6EoHTuf4=
X-Received: by 2002:a05:6512:3e0e:b0:5bc:f2d3:f940 with SMTP id
 2adb3069b0e04-5bfcadaf1femr5414e87.56.1793120385577; Tue, 27 Oct 2026
 09:59:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015140148.231126-1-marco.crivellari@suse.com> <2da5c0871093ae68069e60889a0481ca@kernel.org>
In-Reply-To: <2da5c0871093ae68069e60889a0481ca@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 27 Oct 2026 17:59:34 +0100
X-Gm-Features: AclHuK-mcr4sBR5O55aqAGK26Tq4c3oWeP_Lony2Z-EH5-zJu7zPqEiFL7CQQSc
Message-ID: <CAAofZF6bPpWvpBZvQDjT8hHB5K+90D93C_Xm=C0nLn7g7Bg33g@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] workqueue: Make WQ_UNBOUND the default behavior
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 8:03=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Marco.
>
> The following is a Claude-generated review.

Hello Tejun,

Thanks for your review. I will read carefully your feedback to
integrate it into the next version.

--=20

Marco Crivellari

SUSE Labs
