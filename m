Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E2A3ABDA4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791573206; cv=pass; b=RqfymubFDtLzpRNB1u2n/kK4Y0qVo996CPV+pIx8SwKCe4Zouc8IgZxqBJwVHTiQyDVWF92joRrR3kEg0PhTFh28guwXusZt/m6CbFbZJWGDmXK7Hy5eh086dnbfCYUTttfvALx/v6AzuDEkTAyuu76uRiabSx44qq5LIutKc44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791573206; c=relaxed/simple;
	bh=+m5RVY/Fd1R44a1Q2Ut7yuguyjSg/NovE0vzMnvGQ8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tFz+/8iAfZjv5n2vOiq27OoxxDlRBFPp56Tqyn+WgCsbe6Y4qONgetGLqbMOKoNn+8yaRiPLSugChptcJcSiOOxnJpIzFFprWz845rBdorVfBUr9wjCY9ya9BduiuewByHHrGvMqAA6DGHT9JcKZ+HUbIKv0u6oJdzmdG9MDE5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnjd9uup; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnjd9uup"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab8d96d02aso35157b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791573203; cv=none;
        d=google.com; s=arc-20260327;
        b=RfDA09ZRqyhJzPmZmVRkOEvsEOg8L/SJEc3Yjn6j/Sv9b1jb3qHG4wPaNxDfn+M76o
         K0etcyxlHzsSe+3uR8vs6aRrqERSsybgrxMubLRKjNykiH9xwAjowbufOd0xbJjMFiSK
         TnUfn3OzhsZ85xn23tLu9aW/usCgmGUTEAU4V7/L7Rxlyoqcjk9+cXfpRYpx85+GByQt
         XFkXMMTA8qGhsd74uaLGjXHAJMDXfXg6mmDxKbH55MENoMAqhnrvmB7JD/ec9G7Pwi/w
         LOrqmWLvtuSIRalCfLSFtvTythX71Pjxo6jf34g2+R3zKI04IZpgaM1nbSgIR+LnhJ+e
         gEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+m5RVY/Fd1R44a1Q2Ut7yuguyjSg/NovE0vzMnvGQ8Y=;
        fh=Yj9w87hNKCRyeEvueyMYLr96tIv5olRBZJygiYjVpg0=;
        b=FgQmd1FI242jYKic0HlBuaWyS97x0h///bSi3K7C115bxdFrVKaiLZ99weveJS6nR1
         GDen5RRPeHJV50SBDy7jtusnb69/nSdU7Ha7cOADtXcxz9sf2h5tZQ8ZX92RoDDodN2N
         Uz52QlbUwiQnuBcc3upMNRi/+AgvkmCV71Y2la70kV+dkRRT34nKBAGvXIxnftk7iVms
         PwetLqZkQg49URMj47bnQBCysoAibcvwfVYU4T8t7vD5l+9vA3nhB6zqxge5Yco3bpTA
         UAEIeAabSZkOnjdVgxEYp4AIath+JYfTi63J8EL+h6SBIpifYIOH8U9wYEsz4Zm6NTBm
         TMhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791573203; x=1792178003; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+m5RVY/Fd1R44a1Q2Ut7yuguyjSg/NovE0vzMnvGQ8Y=;
        b=bnjd9uupd6ay4UsAAdEnM0jgI0XHrlwBWHHW/N6ncfADCJPMLifeTVQT0USU/J0EWw
         OtxvWd6zYHvMoEZz2EKvOoZnPrcgPR3EKoOFeiUMdbH5xdcnbKeXAMab2HlYIrsOG6Mm
         DWsmhMtVqd8CVsADGJELQcw/oUwdjSPsrLBjBdMshvdpTUvf4VjDoBMwG6dRC7iQInIo
         8ORfM+wRaCS7ty0NFAP2+hzgqpkdrsnKrnV1Cop73DuF/ZDOF3pq4HZVmiADXoJynUYz
         OwKvC+QOfy1kc7fIcAqgsboczezKMp2Ns5kEv4wqU+OoIiux0c4HxSNKTawumE2hM9hz
         omHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791573203; x=1792178003;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+m5RVY/Fd1R44a1Q2Ut7yuguyjSg/NovE0vzMnvGQ8Y=;
        b=HUw+kot3GXjl4LjBvMcGjB07eN6edrxwoGhWZwFds18SEFpzML6cV/yWVyFvFpEeSf
         p4nrFEzDzTB6bzbOZPgSSXGkqL/oh4Bs5mrj/4Hu7WalXzxMozdHyuiFgtkzTzx6pI3W
         N4WsNOVJ/OvGKqdR7AiBGDK/UxhszPEuIDxFZKWziHvPrQCDzB04y/sIuN/9bvUCqrLb
         1LSdVa+Dfsy/xy4yp2eJNwVbWLVArOI5KzAMj55LKsX6bgknFqsTiCLqtVWGPPIb1IPH
         uaHNZRkKLBPuB2XYRqITReGSwYON741Z3HaHTmVJpCc+8aUyxM57g7xvZuSTXJsLGUoL
         5/yA==
X-Forwarded-Encrypted: i=1; AKwUvByLoiST4VFQnk4Jx6kobm0/Sxke5o1zQ5JXdE2Ra1Cesnxmgi1NOfllwSKDcua0wSpSgtnQeK4LZehr/+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaQ1suQUMAZmUOpIi7yT/jUKJr3+Sh2zz2meZ3jWn5RY4jXXLE
	R4fRKIqmzXwQrIs0ragaapcowKZ4kiAhPOcpt5In4a1RIDMuDyPq3WCEFDd1Y0pY98LoP2kVLpH
	8qWjV+YLRTkuL/HBgCrm7oc1QL2UcIt4=
X-Gm-Gg: AYBFou1GGD8ES8daCkJJpVYKCVr7ZVMAVNxaACm0A/6YtqFkvt805Kxyj/Mum47MyNq
	rI99J4uxdABKsM2tBGNqwKgKGIq1znZhX4SaPCHcGzE7E1UaUNSnHPkfGcQVV3NgwdAPeRkTV0v
	iTrquYiBrBdJxl6fJkx+4aW0ObWjvIfZH031392MLdvFenm6UAV7yLc5JIDVk9kBtjssCE1SpCI
	ap+tqNDiB4JxODkss781L4vKWz8l1MwQQJj/fpcN0NjcSfVOKcsPdgTnIuVW4lqrJkDoAfgpE9+
	H7wF/vWabOfFUn+S7EAGkdOvqHJ4WWP79dE6adXTnR2rHhYq8Q0c66RM562zHPWhB4AipD2tr2L
	1y9hEzCMjCBph6gIcFBc7SqxVhnj1F+zhyKNaA4JSpiDDq1VGRu6j4Y2zY1Uzk7Kb+NtiZbU75Q
	==
X-Received: by 2002:a05:690c:1d:b0:8b0:8a9c:fac1 with SMTP id
 00721157ae682-8b08a9d034bmr1353337b3.21.1791573203443; Fri, 09 Oct 2026
 12:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009032616.432392-1-0xiviel@gmail.com> <74b15e57-1387-e37c-d343-eeba1de33ceb@amd.com>
In-Reply-To: <74b15e57-1387-e37c-d343-eeba1de33ceb@amd.com>
From: Eva Crystal <0xiviel@gmail.com>
Date: Sat, 10 Oct 2026 08:13:11 +1300
X-Gm-Features: AclHuK_cy9U-CWUp8mwYJvruBGY0UqEQuD2c3_YFDBhDH3-C0Ix51_bl-Ikk4B8
Message-ID: <CA+pz=kL0a0BpNf_ozK=MUntN8EjtAzb1Z_5MS4TLEV+sTLEtWA@mail.gmail.com>
Subject: Re: [PATCH 6.18.y] accel/amdxdna: Bound the sync_bo flush range to
 the BO size
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: stable@vger.kernel.org, Min Ma <mamin506@gmail.com>, 
	Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/10/26, Lizhi Hou wrote:
> It needs to check if size is zero.

Thanks for the ack.

The zero-length guard from dc1475366424 is already on 6.18.y as
45962da5821d, shipped in 6.18.52, moved into
amdxdna_drm_sync_bo_ioctl() because amdxdna_flush_bo() does not exist
on this branch.

My check at drivers/accel/amdxdna/amdxdna_gem.c:947 runs before it,
and the clamped size cannot reach the drm_clflush_virt_range() at
drivers/accel/amdxdna/amdxdna_gem.c:966 as 0: with args->offset below
abo->mem.size, min(abo->mem.size, end) exceeds args->offset whenever
args->size is above 0, and an args->size of 0 already returns 0 at the
guard.

That is by code reading. The arms I measured on this branch all used
size 0x40, so I have no zero-size run.

A zero-length sync at an offset past the end returns -EINVAL from my
check, where upstream reports no error for AMDXDNA_BO_DEV, as my
commit message notes.

So no second patch is needed. v1 applies as is with your Acked-by, or
I will resend as v2 carrying the tag if stable prefers.

Eva Crystal (0xiviel)
XSource Security
https://xsourcesec.com
