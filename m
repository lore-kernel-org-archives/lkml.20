Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC1550B8A1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065284; cv=pass; b=SA6mm/rqg4BwjeGzbXM5efc7omacnGqn0yAQqR0+Asm7Ckp0JMYurhh+gZI+O0unXOh8fLnnsICuheT/9L/eZNfSFw9w1QFHOQJpUgNne43h+lzuMR9RDv+s4S/7g5TTA6xO0aE3n5yBrKz23qt/gG+T+rbEdQqi6inI74Hkvr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065284; c=relaxed/simple;
	bh=ttWWCBe5s6LvEvuhu7UMsF9414H3CKAKMZfdr0bsCwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hq+NUJo/xug+ErMVEl7+k0WnZ8OwVotnm7RGOHwKFVNJKgnA2HYhMX9BxxKwIMhwDvU2VuopwUH5+ZOxFEoeaoUZWUDIpGveUrac23yPLzWGOFB3hAWjZB7Pi3r7a7FpU1TEz/y/yXkMq8//8hdHiEDkN/iHjWfrEJsTv7t2jZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=MPLi660C; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="MPLi660C"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5351748222cso12024921cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792065281; cv=none;
        d=google.com; s=arc-20260327;
        b=fV383ZEOxBQfNJvLM7aZcU9eVBeuyJQHM/IxCMGlXUv9jTosaYee3s7V10mVcg+mRz
         XndEIy45RxSsst/PGg4mEyAdQkipeFTDA2emMxOB/EtQm+QBxJ7k18+gbza1uHfOZy48
         niGwvYTXk2uFkFVkFybY9S3J4GFnzfaoja9AxxYLOY7pJUXVyOqU7xv1/1YgwIiv4lhY
         fySwDfW1Bcee61qbvwYdjglDBW0v4r21FsrFxuhfhyQ2xL2vrKi/wl0XWZitMOE9VkIl
         8JjllS7PhSdUDT1ZladWAj+LuA9kp+X/bfJsuVFOKCjmCqij8KpqSN//cpBe4MdcXaFU
         qijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ttWWCBe5s6LvEvuhu7UMsF9414H3CKAKMZfdr0bsCwA=;
        fh=YG/3+NFNXwYqbQN5CmjLxuDA1JuiiQdp5aB+0e5/RvA=;
        b=DPiefgMvv+7d4ouS00mO9SA9N0HbeDXS4OCQVgyzR2zgcNS2b+O3cwxnWqB32TFsVm
         9b+okXm8kQnV/ynPvMs/8n6z2CB80jkxNLjDI7l6zxeCKvJulVwJPcjLv5y6/JyeaEQD
         kI68rAdCk2pEP186/s9K3QgGs22bb2L2hAnvVwATd7cZrxHGwUB0ouYdJhG3fnHKmGrS
         V3nmVL5WbDFVEk9QjM/ibvfNVtfPVWrMaaM1fcsRb4f3ufqcXdUYa7g7xTbQSiuEe9ef
         p7DX2dwr+EvP0midya7VcJhb3PEyvcqkLkaQwsUo+V/uGiIU4iLnH29V5wek2Dk5W+Fp
         dKFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792065281; x=1792670081; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ttWWCBe5s6LvEvuhu7UMsF9414H3CKAKMZfdr0bsCwA=;
        b=MPLi660CpE7iDEQdEqqxCBxE3u1R5P8U6K2n+UGZxK3S06oo3bvGxxYNLTHMYcwPGD
         emTjRLjvcIJ3OfqAqFvo4s0sxpPYEiSv0HCGGYwVw2nu3qhbnFC5M5Iae4HaW4Qoby4f
         bAaiYdtp1Uj8O+IdwrysOZFjeIcm4+qJO2D9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065281; x=1792670081;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ttWWCBe5s6LvEvuhu7UMsF9414H3CKAKMZfdr0bsCwA=;
        b=I0xwD4XBs9ucorxGvTRsx/V1Q9ZodlgGnnCrRGyf61pRz4X4+G5HOs/fOQJ+Z+8C5Y
         2Fd8Aoj1Im+VsPxkrazwPW1kxsYvylxVPWJ23OvfI/WKcRy91vxR7llQtIJcF9GhOsge
         GsT/bsVUJ7EczVM771WxtclDBtmzowWig5doYW9nDMSBZYOISXyMnTTVPk1FY6pWSahI
         fZD/h9wrVXN/6G5lnhYuo86ddkkckh+Fn7IlCqg9wFqJnu5Sn4mww4hwoaeoI859TAdy
         D3GdsKeaAEuB3zVG6G4JBnExvRaQurP+bGSePHO0EqZhAvyl3HFEgeboJWK3mHWZR05L
         S9jA==
X-Forwarded-Encrypted: i=1; AKwUvBw2/JTbsX296B3Lckf+RilwIOgV8R11xQKwWdJTZsQoU3SjYuz3V6Z8JuvezOGnHMUAK0FVQmxzmm44s4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZjynZHJR+VDv6/SVy/MKcoSHPi7R3z1V8allVm6hW/Bhque8S
	EyeuUW8dCIoSqHmY6g4ew8J07o4rFFIiEIKUCb91yM3EdMU2hLUT7mfTuqO6mqJdPMdRakXftdq
	jAsSupNV21cbiddtJxFqE2Tq5iz+V062B4HZPMV45eA==
X-Gm-Gg: AYBFou1gBqrPm4znRILHOLxKsUztIF/DHBA9lLtHWUVHlNO2AbZjW8FISf7GoRthH+P
	NEARYEWEb6rYqeVZbxM6/fMOM9M7Qq6ceAW1n7w+MAeq1JSZ59giSxbASyJf/XFSbWPFDvrn7PZ
	Fle/plqi0mfvC9J9nMeQqarPvLLyf6q9TmumtSTzGQXrKy1i0wHF9lt0Laj301KeGKwtngRkUBb
	iz41MLy1gLXTK2Ebbll03/mV14GV3i+ZoJl97yFU/U4kCnHDaFT85TOQlM+68TcvFIOJKgVNIoQ
	VihvCYdfGLqxyNvyhqA5gm1iBhEpY9pNBIYGnWolhvC76u9/Tmy1kBTup6mA/V8eWMn7wUfs84L
	dlbLgaGpdod3Vz1Q0SA==
X-Received: by 2002:ac8:5705:0:b0:532:f0a2:ef4 with SMTP id
 d75a77b69052e-5359fa9f9abmr292049781cf.26.1792065280681; Thu, 15 Oct 2026
 04:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929094812.93374-1-tkhandelwal32@gmail.com>
In-Reply-To: <20260929094812.93374-1-tkhandelwal32@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 15 Oct 2026 13:54:29 +0200
X-Gm-Features: AclHuK-b14bcg6mR4vOtm8iYsjO-WDFkkV-OiklyH6IKsJTNTAuDKd92iU3RYd8
Message-ID: <CAJfpegs1Zq1zKfGDOucL_PZMUwVuHjandRn-rrNrBPnKex8hcA@mail.gmail.com>
Subject: Re: [PATCH] fuse: propagate SB_POSIXACL to submounts
To: Tarun Khandelwal <tkhandelwal32@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	virtualization@lists.linux.dev, German Maglione <gmaglione@redhat.com>, 
	Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	linux-kernel@vger.kernel.org, Tarun Khandelwal <tarun@supabase.io>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 11:48, Tarun Khandelwal <tkhandelwal32@gmail.com> wrote:

> Copy SB_POSIXACL from the parent superblock, as is already done for the
> other superblock fields inherited from it. It cannot be set in
> fuse_sb_defaults(), because fuse_fill_super_common() checks whether the
> flag was passed at mount time to decide fc->dont_mask before setting it.

Applied, thanks.

Miklos
