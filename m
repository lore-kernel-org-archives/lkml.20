Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13323F0A9B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908588; cv=none; b=mDlvGqmwv7xIJ5cv4KA3EWQCGUJjYttyocerUCqBCDXqHQOdtvxKwPNo/csCQ+EI9a+J6pkfLXEvm0BBJHLgaBA+AQojN+t3tNSYKQYvwxSyF5Jq5wjMnN3DcQfZtAExsB3wCkkJAvwTCmSCJD8ynrfXu+SrC2PrAQpEHgW+A6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908588; c=relaxed/simple;
	bh=ykCJHQQsOWnyaRzz2WFnkzTvYpyE+YIcHcea6L9ly50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m2jo+6Fk0h42m27e922zJyCbT6vFQsfPg4hju74k5+TDpu0Vlrc83p15EYDpJEV+vkGDQzljesp5AXz/KPURoyMcGwCK7DEh9w8iy0cHostVUW+P+XYoMp4V2rKiiglubgpSDdbfJHHqMJNOEEGm70kpLzwLWA7m0AsOu9kk6HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=TcWjHbVo; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="TcWjHbVo"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f432ac553fso3649782a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791908586; x=1792513386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdfePyZSQWfxzgU3i6fr/xLSfsEJRbhkSMrdRwEcqfk=;
        b=TcWjHbVo3puoItC8phATIPJQRj7xaL5TNcdZUU5RN6Kg/qcicVgJwUJhVXn0gjUcjG
         SaGhBqOXJHmhBxelPtKmjLJKx/yoIUYoNkAgp0SxB9oN+5MvInjf90OBKeJKmbf4C2v+
         a1Gk+6nUc95qEgafJa4AaGYFYIk9DRTMdJ0UHnIH/NQgiLGSkyXKYsi79EJ9x9yFxs9G
         VQ9dNS4kBsJILyiQxAMeFm4PnGvs38Y1GnfE8aw/fDHYS6jrPme7nhSM7p+7GJQmB5Fd
         wz7wrSt8Yi8v9j31hhn2ohCkFTyDpifmEMdQk0fssofadxG7e1NhPX4pZNmNZn2T2STC
         Ju9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908586; x=1792513386;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QdfePyZSQWfxzgU3i6fr/xLSfsEJRbhkSMrdRwEcqfk=;
        b=xfJo4dK/aMnpl+9NZ2JCuuPvp6wtlT4U3yfgSKgtWYzZFphBcp/rXKGz0OjtnSjVqA
         Ch/hto+D5iod9ZtBMWDKVYEjSBRSZ58WInR7irbBwPa52QHITRviHidrZACAzatIzhAc
         wBizn9S/JHvrTKEA8cS1ybf75jffXfOBCcY8sHR1jjOYSY0KnHIZtHDCzvHQBlVTvNQD
         3H4XbkiA3HiEeMtKBqBZNxZP+sBPyybTc1y1/+1G44RhWH1JFYWzmHc7ZCd2K61fqvQ4
         3uPtbajrqij74tJsUcx9CdoOnx98gvFz0QPsJEfK5HE2EdoQ5m4XRANSHZBcRZ+of2I+
         Irqg==
X-Forwarded-Encrypted: i=1; AKwUvBw0qvxQ+kGMJAntGtQxjvCJhEkaSZy+HdLIpWSxn7Q5cfsSzfIawaT2lyUSG2Qivxsh4wIvCgyVtN5MDio=@vger.kernel.org
X-Gm-Message-State: AFq9FYJch5+jsOjudFwfF4X9Aevvya9qbUXnoPjW2HZNDZQW/7+1nb1w
	uK8kAmoQx5KnWiUmTHA7D6qkr0Jq1Xz0BPdCwJuB7paMUbO1LJWwG54ZE+ay2vtAL0X/eEBr2Hl
	Up56b4A4=
X-Gm-Gg: AYBFou3gnzOsobizd+ZJM8orVH5zZnghc/o48KA4RWxq7i8EXew7S4739n1omt2Uf3T
	a51REzbeFJKzUB+OGXQ+KXTVXuYkBpEtbVeazL6TH+lfvbsZAo0OmOaCq5ZhqDrCVbQJsS7HK45
	MhO5DwVSQVezObblrJzN01oruk3aj8L09KRHQEYdOPBm9d1BYocubj9GFFdJ0sjbppqbwLuChmX
	Zaa6nHJ25bVfbDxzbLipQ3U5/VI/ut1Ryj4fsuOtbHMqLWq3tyEKGSQPEP+odBnPfefQ0kaHpkd
	PLQgxws5kiwbAo7NXhXddCgt2VVgVMd95CfcBVQ+PMG6Bq+AdlkLaenBtiP+2zbgwEAOB491Ung
	31I265yXYGjWOidruuRRG8loATKeXP7HN5nyoz/qfCvx1lRpoejCkE0m1sqyq74R1OQdNcwgFkX
	Wn2/ao5/+SLv9P+jiNhdyqq2Tc5Zc1w4rn3CSUya804yB+2OGJl1BD2BYyHDRtACH3Sx19xBIrj
	nNJfAjlsUdtmisuMx16FD98yvaGUM0QF9xAPzaTiUySYizjRcMdYjw=
X-Received: by 2002:a05:6808:c40e:b0:4d6:92b3:c1b7 with SMTP id 5614622812f47-50c5b46d515mr12233699b6e.58.1791908585582;
        Tue, 13 Oct 2026 09:23:05 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6df871f44sm161125fac.1.2026.10.13.09.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:23:04 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, 
 Sasha Levin <sashal@kernel.org>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013122417.3-1-sashal@kernel.org>
References: <20261013122417.3-1-sashal@kernel.org>
Subject: Re: [PATCH] io_uring/rsrc: fix build without DMA_SHARED_BUFFER
Message-Id: <179190858434.473157.10312300937470839616.b4-ty@b4>
Date: Tue, 13 Oct 2026 10:23:04 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 13 Oct 2026 08:24:17 -0400, Sasha Levin wrote:
> io_register_dmabuf_desc() calls io_register_dmabuf() unconditionally, but
> io_uring/dma-buf.o is only built with CONFIG_DMA_SHARED_BUFFER enabled.
> This causes an undefined reference to io_register_dmabuf() when linking
> kernels with CONFIG_IO_URING=y and CONFIG_DMA_SHARED_BUFFER=n, as reported
> by KernelCI for i386 allnoconfig and ARC haps_hs_smp_defconfig builds.
> 
> Move the configuration check from io_register_dmabuf() to
> io_register_dmabuf_desc(), before allocating the resource node and mapped
> buffer. This lets the compiler eliminate the call when DMA-BUF support
> is disabled and rejects DMA-BUF registration with -EOPNOTSUPP. The check
> in io_register_dmabuf() cannot handle this configuration because its
> object file is not built.
> 
> [...]

Applied, thanks!

[1/1] io_uring/rsrc: fix build without DMA_SHARED_BUFFER
      commit: 1127f017f33d9e9dbbadd1c230a0640f9a326055

Best regards,
-- 
Jens Axboe



