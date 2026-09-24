Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD33741F37F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790291555; cv=pass; b=NtpVKGWA5K2XVCrz6E+arSMwxO/wvnYMm6up6ePYYTO63dZNFHcPMN1Vv9mwIlTqS11+JMbrIq/qg3mtKvEpbYQaj8rEIXaKMCxES7XLu0CxSAh//LM68489qo/K0wKtzb5qZgMo9JzWN7FbhDwptfpaWzHBRBAwnX48A3gu0ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790291555; c=relaxed/simple;
	bh=i5gtPL45/HsWqgNnaIaxvWIYAE5RMDtissUXKYWjbRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmFQCcvoKYn4T5H5B0hJYM6c8fywRGLPe2/jBMHUF4X/xRX5p3+0Ok8ZlYC6Sp31vmEAGQ+Sp9vT9YNADH8kdobj0OOtaCEuu41xhTVYZpOskSGSAoPvGmR2iNZ9BBo0mf9HsqQgBiVfIS9x1QpIizNAWT30Igep909n4mCmYoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MNhn+6bQ; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MNhn+6bQ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so37902366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:12:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790291551; cv=none;
        d=google.com; s=arc-20260327;
        b=J/uG5JozUgPFhD5u7DCq2bzkPNaOQX1rPwAnr7bh8s7PhRPwrtNufE8I3uwRGgqWLu
         NR4MqvdT1CMn3rnRuMZTnHNsuS3j4EwLOR6bveZJ2zVI7D0cGbQv6SpRV1evPpHJ/m2+
         JtnAV5JjWEYUuV4MQ0/B7wC+rPalGdxKNStkQgrJ4cchHMzX2jKd1meTRnzEHDw0m8XM
         4LZuTq1G/wMporRZ8iAEpAsJHQyAueTnra+9w3j/2gV3bxjjyH8oF5AlU6oUCtNv68pA
         HMCLUvdg96DzG1IomMJsEoO5V+m4cDQ5Mzo47sLUYjc+Y2+H/HraYUr4vh1kVq5IkJwb
         8uFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1/GtmCck+btFeib66fipBTabB87VzP8LLtE6Qx5AZ/Y=;
        fh=EEKmslhNwOsBhv/zoZqLvlYUBX6MER9y8sDI/ySdbOg=;
        b=e8NEdtbHMfHS+3v+MZ/7zFERdOmufRFl6EuR+aWYc8+O9CIpSCoJJOEvze9mQS+oci
         J+WAbBFidvrYmwSwbp0EQUI9vGaws8GacyjdkxepHADPJzBoE4RlJ1741kttl2C+iV0y
         QEy9cBml1HBq3LHSx5KIujTqOZ5fKFroivRn3QBQbG2njLRTzxmdjlIa3/TTdycW9/UY
         6dVZb0QSPluRFxiHhVqJxhfs4hdzsP3dOay+y5Ap42QdDuoJdIkTZZDwPQOKLsyzY+QQ
         tFcvmfZWEjX4lx7UOYZsnjTid3nDhnjUQrs8yTy7RGOZHtqmwZs0CI+gt6z757FD3AVQ
         vCAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790291551; x=1790896351; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/GtmCck+btFeib66fipBTabB87VzP8LLtE6Qx5AZ/Y=;
        b=MNhn+6bQ0yOwUi7nD6sQIuImLP3dhxaCTGS8dOraKPpILKFlSAkUGE3t4ALNV+KO9Q
         /YU+LtmbbQkpU4iiaBwJgqyWJQh4Xc5wZqldJV6GaIQvRo7eCbQxqIfb7PVDjkXIa7Bp
         7LI1OBOZEb5rgbfLu0eOtxGDw/wihzA4pcYUPoba1k91jZiLyqKwGbcNkHiguyiDuuf3
         h6bxvZ2rvSaeRHTBpuP3msEQqCYBau1I5OWIfkx9/xmqYRzwJ/03CjSzFDJnS8AEBcVH
         s4LMyEZVErV1aRicdWUXf6Y3wEPkcOeDky8CLY0bO7rryhOpKdhL0Hscv50Oitv9sLOG
         s88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790291551; x=1790896351;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1/GtmCck+btFeib66fipBTabB87VzP8LLtE6Qx5AZ/Y=;
        b=hXArMXAix2FlPe4zA5BZhoaLMc3ZKD6luNGx0tO3h9rCeVCt/kqcOGSDGlO+j953Sd
         zy1To4zSvLDVp+Kxt8Gnp3F+0qIGGWbVTY33NeJKUicoKziajBCHZSWI9z5sEVfgm9Hw
         UC7hrrc4+cYg+FBQ8XjXF2XtmTT5gFEy9zQT1PLd4REaQzaWhDJIwZEeeaNzv4V4hNAy
         zOpJem7ML6+mBisZmJU+R3Dn4sbMRebvBiSdvsx09i7JRVdVHH5mRIUDen2tlDUC+Dxv
         QY4a/wWaxZ0b07EW3TcgAVWEGwZvAGLB2B19oz5X7c0EvkeNo0s0dzsPNVcEAb/vvMyi
         kkrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgfJIgIHQUFFBM34pXWqlZRC1NpA5hUEpHj2hwBP1kX0xRXM+cI4YbxDzUI3B4B/1UmUoWGNQR+OWnOPM=@vger.kernel.org
X-Gm-Message-State: AFuF++lqM8MeQbSAr41quVs+0KdLpIICm6TAzMMY0JiTzaw1VeBJkVJq
	6XAvK1JpV37LOH9aD/n5+p3vemcoLZc4QzWMfuMgZE2up7nwOtdoavl23hBi/LpCoIFIwFqGl4W
	lUTjvTZXylB3dIzjiaKyzYFCg7fEE8S7hvvpRZIa2
X-Gm-Gg: AYBFou3psYuqK2tVoq3utLYY32yS9VKhpEatFkmA+L3PJZby07UJ48aalph+K4ClEL9
	N1m23r+kZPkofDByvcy93OYeS5E7o1nYRiPSOyB0K00FREu2d8mq4cWzQmHmNmy/NR7m45tAz2i
	Z6zFrDDlU+IVJbAHd3TA+EdntvtyJVLnTsniaEtIl79ZGRM0M4EmN/pIvoAFskZ4a9iH3fWhVCr
	UCBJNcz5ADsvNUG1wts1orvfgwWcbTXVALv7ACR5KNOYh+2DluD1sbQQdL3KSSFUC0XatskOcPb
	VfyK8Rf+v7UBh2AqZd8VPj0kYo1UyOC0rc+1b+yhjw7Xg4Au4LF6by4A0I/5NjdnWuk6U00YHbJ
	4JQbv5eSg+lVOriVaj6ML
X-Received: by 2002:a17:907:7a8b:b0:c29:3b7e:3a94 with SMTP id
 a640c23a62f3a-c2ac53d2785mr321958666b.38.1790291550387; Thu, 24 Sep 2026
 16:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918025416.604297-1-dhavale@google.com> <2ednz67kpd2ikrnerrmnvol2mdfntgqhakuoiu7x4cnrlpiugm@ojqolvlfmpnj>
In-Reply-To: <2ednz67kpd2ikrnerrmnvol2mdfntgqhakuoiu7x4cnrlpiugm@ojqolvlfmpnj>
From: Sandeep Dhavale <dhavale@google.com>
Date: Thu, 24 Sep 2026 16:12:19 -0700
X-Gm-Features: AclHuK_JnRXmc4okmBH7-69dBKIYOYrVopgPbSH1OLPpNlpiiv03zV98rUrU7KA
Message-ID: <CAB=BE-Svy3yoG+nJ7Z6Us5GG2Rj-7dyCY+EMpR9Y+PtyXUKnCQ@mail.gmail.com>
Subject: Re: [PATCH] ext4: fix race between inline dir conversion and folio read
To: Jan Kara <jack@suse.cz>
Cc: "Theodore Ts'o" <tytso@mit.edu>, kernel-team@android.com, stable@vger.kernel.org, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Baokun Li <libaokun@linux.alibaba.com>, 
	Ojaswin Mujoo <ojaswin@linux.ibm.com>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Zhang Yi <yi.zhang@huawei.com>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> Good catch! At least the first paragraph below would be also useful in the
> commit changelog - the realworld impact is important information. But I
> guess Ted can modify the changelog on commit if he wants. Feel free to add:
>
> Reviewed-by: Jan Kara <jack@suse.cz>
>
>                                                                 Honza
>
Hi Jan,
Thanks for the review!

Hi Ted,
Is that something you can add while applying or shall I send v2 with
just updated commit message?

Thanks,
Sandeep.
> > ---
> > Note:
> > This issue was reported by an Android partner encountering kernel panics
> > in ext4_dirblock_csum_verify() ("No space for directory leaf checksum")
> > on 16KB page size kernels mounting a 4KB block size ext4 filesystem.
> >
> > We verified with a standalone reproducer that the race reproduces
> > deterministically on Iteration 0 (< 1s) on both ARM64 (16KB page size,
> > 4KB ext4 blocks) and upstream ext4-tree/dev on x86_64 (4KB page size,
> > 1KB ext4 blocks), and confirmed that this patch resolves the issue.
> >
> >  fs/ext4/inline.c | 1 +
> >  fs/ext4/namei.c  | 2 ++
> >  2 files changed, 3 insertions(+)
