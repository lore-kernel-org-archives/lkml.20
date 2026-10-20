Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.197
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792530060;
	b=RxpPhxGnqmJG4sant1n1FdLQ+9gQICf/JgPNc3jx70f5Q9Rr9evvx438mkKLpChZRl7J
	 huI2allrJ48n5h9MPVQjIBz8W3Gk39h+awg4+Fj8ptLDOUwS0lkU6qm2+WtMjrVzfn7hY
	 Ckj6WNkZGCwHytKgqc8Jwjl+8X545PqoOT2ctYw9ehhxp3l5BC2L6Fikwq4jWmUO7aXdw
	 5hWay1QSWapbsAbSJejtffsSLJowgWPptJs+mkvUjsKrz+4FeWFqqfRQqYhrpfu1zpK/l
	 WmSKLMYeirjC1n00GcS/qq604J0rxQCC+P0dDHZBRP1gXUHMstXDVILR2pFpD5bfzVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=E3HO4v2ppYBHCxa7uFucK6ln/LBk9azH/BeZ/nONaC8=;
	b=U4yiSGUS2vkmzTpdzcFH9I/WUUO3ymGXawJODzutIZy0MP8fTYuzgIjLl8cJJ5UwkG27
	 FtK0rT8mGa3IaLcosDI+O9KTG2LIkLzEvCVdrV+tXrxSiBp0DjXLa2GO4W2mn4e6OT+Pu
	 eGMZfSosw0fjMTcl5f6iQkUjvDDaXAqaF1JFxxr80JuKZ39KKLK6EaAcXPV6xiN6ErWfX
	 1bjSRouyegjLbntVM/RVm+cKuocoejkcLlcE+Jst6old6PkZP7o1UWX4r0uDncTClCui6
	 xvq1Jsn4fzz+AkU+KiObofpLbEhJXex9xi9sl91WyDvUGQS4JTyW5oPFBGahJ8MHXHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cnu1oGDL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.197
Received: from mail-oi2-f5.google.com (mail-oi2-f5.google.com [74.125.231.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC77A606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC77A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cnu1oGDL
Received: by mail-oi2-f5.google.com with SMTP id 5614622812f47-5413fa881a9so27801b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792530059; cv=none;
        d=google.com; s=arc-20260327;
        b=N2FZdOSFbkc4ZbcMS17fI1aPunf7T5oSf9gdCEUhPz3fprYU0ojjkFdqAeBmPZnEJ7
         sAvIqds97pyVLhQLC6ZJaEu6dqf0RTiIaGSH+AGwaQKzBEtzrbWh0c4cO9gF1+ue67me
         Orki6RR4TvE+jebwonasW/JjjMbcXp5jV9hVcp2AYZH3Z5fcpPVyfk2z/k0L8NTpcNrz
         0PLLyB0K1CNieRKnjdO+l6Q+uoTo5C/g9KX3LU1Ky2lG0xbyv2TBh/RO+UJtA5CR+k1+
         5hCFfbu12WVfkMBYoDLoGuuBrh9AHA5fsodMu6SaGxbqTICmbRsAYLrKqXv2zSrGVnlw
         Kcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E3HO4v2ppYBHCxa7uFucK6ln/LBk9azH/BeZ/nONaC8=;
        fh=j9k1N60BuGthH1Mt8LyqHcnUG2aRJlgvg4PL1AshKgI=;
        b=Ny262bBHaVS6x2OXRc5aZjhNO5RT1kGTq8b+zTwJjhs9z6Ns1sSjahrQl9uoITt5v/
         E4ARjMqCQRYdIvpZU6sS9YYYLAuAjhIS8ZyRj6+YuPG3k/fUdUgsyHAXW8UvQgIceDM3
         ndl2sFVJT6wR0d8hqplifvBwdLCYfz6COUYk1169cDPnKG9p9FSX1Cik2fQJ+0VExNo+
         qXpas6G/RPKI40MJI+nxx9W313c+geviU14D1c/W9NM3yBA/h+Atta3ZceJ9G+GiLnx9
         fL/3PTtzisjmIOqU4jRBEDD+IMQVqeHzNrZ/FhnwTdnPnkgVaLKxUmu7D3yg/ZymuajS
         ZWkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792530059; x=1793134859; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3HO4v2ppYBHCxa7uFucK6ln/LBk9azH/BeZ/nONaC8=;
        b=Cnu1oGDLo7LAUHnjnLp+M9CEh6hDRYzv2QGVj3pIytf1lXkACHjzPeoHCw8JKNGI6T
         P2b8MIv/5o61z2vodC6IhJHZQ8VjJqjP/5C8/H7uY5TLV8CY3INHsWo0Dd6PxcBssU5a
         NGPnwQNpiesd4lTubKFfxh80+nJj0QK8RuGR8gW7llYlQmXwzhpLcjbkWVUK/W5mxo9G
         de8Fr0srtEs3Jy2Gn2fb65FDgxi2c4a5zR5Jn8sm4wxTYbNG+yzdeeTm9z/1/uu+eIx7
         B29eqO1L44ryeh7YFGJ6ygqjC5P/bDYlcU8V9Ctjs03Yk2XRDP6L6FD7fwtntdvmf5dc
         VXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530059; x=1793134859;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3HO4v2ppYBHCxa7uFucK6ln/LBk9azH/BeZ/nONaC8=;
        b=piGVGFxYTRq42dv9TA8DhwD0K25ub7EYWRi4rha01TH1B9ql8p+QY5+bKv0gYG8ApV
         VsqY03GJVhBHlzIhRIRS+MqgJ020+hkPRLRNQUIQCJCKNHqTDNMSP787hDJhChDnUWeQ
         UlmPKKiIuyXaZI43mXUMhCom6/0FMNuH+lkWg9sM92KdtxdjrAXFfWHAgUjGC8AhghEZ
         kuO98/f6czTRQINe6CXnZz38NREbZghW+Y6c4OR5Oy+AuhSQEFlA8B7Tbm8FdFVvdoCJ
         5sXPHI968734WrgMbSr2chyvoAxQE7IW7kUfSzbkvHmNE0shVhA8PtNLxGCtXLgyjIQZ
         f2eQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8y582Y63zbW0JcRaQZvDHIpya1hAQBGCWWrLS9MVqdIEEGPF4Mic/pCcVej4oQI6zXxEVnjXVa/ek96Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK3RqhPG9M7IjSlD3FE575PuRBrV+j+09O51nmicVh8xvLcxQL
	hWNdRuq4nYGd2CN6m7tIfX7Yw8hhpK4XgaOp2dg7d9GCgZx09Q90fiBzMcfkpbGUbdhzam9qMAz
	vHadCpScZ6f7paVqbIpimdmBrE5Jm5gzfY4TwqWoBHw==
X-Gm-Gg: AYBFou1dfpTC1KGOFRyY47n6Zj4G4fRroSXFsGgYE/by8ru3SnWSGX085anSwk1g5kd
	QrtTcVO+hbFssBKiNM/crMsWrjjP5EBAcWnxSBtTGUo9GODcXF7aSiglidvhqr8W7uf+eCLLZDP
	VMQ07r8WPtjGe8SI4TnL/gRrIDWA90smcU1DOtYES8j3x9FNRvkjT5mXqK1lJFnYW0rzSEG14rs
	JScMT7+YbYugCpda1rhjLSVMXN0c3CZR0S6onTiJb8MGXrEAVP+JOV8ArHdlOYf/tAEAYa2htnZ
	4IuIEVXEyCWi30tZ/6dx2wdM8PKLV3+TNms5Eadm+7IaDqYDCK55An/9xx5UxzaJIevaCHAFppv
	EtNAkVdfs9XSHNIvqjPpmt9Yf
X-Received: by 2002:a05:6808:1b0a:b0:4b2:8ee8:8a38 with SMTP id
 5614622812f47-553400a0bb3mr51174b6e.0.1792530058614; Tue, 20 Oct 2026
 14:00:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019165103.5990-1-dennylin0707@gmail.com> <9bde49a2e7794e4fb6bc3ae104eef87e@realtek.com>
 <334c6e785a5d242c6f168d57d042d63b777a242a@linux.dev> <4f48c50cab1145fd9dbd6df6d424c877@realtek.com>
 <CAGEkeHevidTtTNj-qfy6kE_O0wRvqT=F=sG+Hy83BOkRjCUqeA@mail.gmail.com> <CANQ=N_C3+gpQ3O=SXYpRCGTh_MC1y4TEfnxF90SWgUVF_wYPUA@mail.gmail.com>
In-Reply-To: <CANQ=N_C3+gpQ3O=SXYpRCGTh_MC1y4TEfnxF90SWgUVF_wYPUA@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 20 Oct 2026 14:00:47 -0700
X-Gm-Features: AclHuK9nvE03u4OiDejZFQMMS-WdqhkSgofSrM6bnKNHfObbE9P6OAasARHTMnE
Message-ID: <CAGEkeHdT1-WwJnF1wTkrrRQRzrEYESOoDeAYE+fiV0gROG+6sw@mail.gmail.com>
Subject: Re: [PATCH] wifi: rtw88: allow key removal when the CAM table is full
To: Shagor Khan <reza1234khan1234@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Luka Gejak <luka.gejak@linux.dev>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I can help in testing if you want. Since i do have rtw88 hardware available with me.

Thanks, that would help.

Best regards,
Hungyu
