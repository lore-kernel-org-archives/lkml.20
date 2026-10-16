Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF0A47A0A6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157401; cv=pass; b=SAZs1K1JGyWAkZKBh0jV26KE8RW59qxBVANptso4UPfUEe7tClzVAFc2PiZlkzUcd2Wx+kMpbYezHw1cxs88pCgcTJUz+nUUUNYugMblYyzQNp9vqU1c/WXV9u0bmELi49maEEdIBKEzO2KuK6sgfnC2LUv1qkHwqsxWP2noshE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157401; c=relaxed/simple;
	bh=ghSQBNQLHFKFmZCfz5WoBGUzvoX8ZbfSdQ88iO2t5e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzRwDVPWk/k3SDExCoMcgpCI4PgX1rx1l4HBYtsTY4g+xbnOWknrjs/rdCp9OvFfBRF1iM8WFVbmfNTkkNo//4Y+Jz4wpt6S64YYBPUEpRQN0thpL9lOLL2FN6Vrf02RI6s4/sVMBQe8AeDTyTbUI917m7jEDsjgSBn6iGFqgHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=aCWMum+C; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="aCWMum+C"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93efc0452b5so179556585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792157399; cv=none;
        d=google.com; s=arc-20260327;
        b=inDb41Uwx3Ro8NIIikAmelbwtpvl1Rw8oXVwg4AY/+orbXvTBSr2EzFjHAKh3XcP3v
         YTlBJlTABYcJZ7xDFINwqOfmhgFmGQJoYtzRY5/T674Hw5sIgtU4eIIzPruJchczJF2W
         xYq1uIuX/eIZVv59QFYfxQSkJVD3f+9i2ycOkHMNorzn22uRYA1e/iYGO0gU5Kk08SVY
         uNeLMjWTVvlgn8tk+mNbU8ZenaIwYQSKTmhxIgLbUT6+4h6bRfpM6xmn9MQ03FOjrbGi
         WPkple7sbTUJMmAhs5u4VspFBodgi1XaWn8LiG0mrX60evVMdVjOKxuf86KpMgMxyb6h
         3t8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ghSQBNQLHFKFmZCfz5WoBGUzvoX8ZbfSdQ88iO2t5e4=;
        fh=zvxIoYnrsq7nV7OpZqxVIL3587tib5eocS0n49ELxjw=;
        b=nsSnhZppJV0gVLSpUWmNqJOXSYJOC9t0eTAj4Z2n6lNWkrrQy9ia6NsZo46U/bH5yr
         iA9EJDPx4y66utv2WEKDn+ezs9IT02E4CMVvAcM2sdGoJGeT/68OW7YGN1UeA9pDBwEw
         29tbqQWtOagwaKzjhsKPyslElgLE+mYCB43aKbt7z499GwE0Lpsf11fXKoNf34OUyqgp
         0C9AXXbcRRvnnKIyZlYi0nKglwoV5OoZTU7lN300MliG2w/C+vdR8kO6fFP2UpMgrXis
         OigntTUFhZPBODVpGFf753PNv4iWXMTvF8NGbWVQp965eVrLD1l3ZgVKXzm2FxBV2bLq
         Sm6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792157399; x=1792762199; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghSQBNQLHFKFmZCfz5WoBGUzvoX8ZbfSdQ88iO2t5e4=;
        b=aCWMum+Cdo2XuvTLAhUKiMVrIO2b1nqDzL7pZFYRR74ssQyLwwQvaBxZtGH5vyB1eg
         ycZICwSeSFsa4qdDVJ449YvodCCxU0IfujjZpvaZNJI1Rep1HsXnqjFwCvrPvCn2SV37
         JDiM8S61RG/TG1s48exO0jKkY8cbtHSRN86RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157399; x=1792762199;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ghSQBNQLHFKFmZCfz5WoBGUzvoX8ZbfSdQ88iO2t5e4=;
        b=Y0kQt3Vbq3HTMxHjuzFz33AiTWqvLyCMi8lGgIt2VQw4LjDnIuCKMwYJs4Dji4RMwo
         hRh7ucokg3OgVXhJHmOKaXXAyVzLTUVIg0wQkvTs4FJA/gEYHK73wvwDnwGUnfAopYi9
         tK2CcfGJNdWnfbLE28+f0Ub1Npd/HUvEPZ61nvEeuSLcMz8IhU1EHsKEYbMDQvGeHqw9
         YhIwgubzvFj8HJIXaZRffHXAsa1AbZOvhODtysu8kaOkn1u2yRkx2fCN914zB/vS+HbH
         zdJKgbh0O4zZ937n9csMyt+2p9EdWMzDTCo6jBRHRSfXO4t+2p3ukZSFgB8CoNR5BuaD
         Q6zA==
X-Forwarded-Encrypted: i=1; AKwUvBzta+iQZFUt04flP0BPpgx5TQI1+GK/pqIWoMsJt6vpGPmbunBOt+1RiD/Vky5wrvVnr89J7YatvgaYrO8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcjuuHbOlqo3pGt5UfiBvmnu+fb5cJPaIkaRwpmN2729+lO662
	i8mxGbciXlz2w+d4TODjZLnKxN+Lf6lKp1o0PyKE90ywbkUX5Q6LhmR8Pud3+PWKNN3fPNMkf1Q
	0XIc+9oyz9R0knMRcP8ldjDmPP4S0EKf9QnnKxzwG7w==
X-Gm-Gg: AYBFou3EuYIBvLLnvMRWQ7D2S2psP0qgjD930TcWrNol5/i1YSkmBSiKlfW3x62I/1J
	UGvo73YaLZnPfVByAHMmc3B3QCN2SvQ4DT8DLvKk7GfTYIqOkp5+eE9pu/8wylbGEmzVIsD48g7
	TtPMX2ADjtgjJUcmMMMpgv5xlZJN5U3oeh6zxrHTLQaeJR7n3q7cb4QeNlat1kQjR6QDXieC8ce
	pr0AY9ZA3JDzqXZxc+AsFoDsROYnAN3AmL1fvp7aJrC856TBIlwQeuf7XTaL8z9SB4+In8906q6
	5KsSCiT2moC1EwNsZh991KtTDHtvi35eTklAgYiK91J8LJo7G3IR8c4cJhhIzMSkkOiw5rn4QrI
	SQvIjCHxY
X-Received: by 2002:a05:620a:84c8:b0:93e:48fc:aa88 with SMTP id
 af79cd13be357-93ebd24d0b6mr3718433185a.44.1792157399220; Fri, 16 Oct 2026
 06:29:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013090447.1180121-1-nicoyip.dev@gmail.com>
In-Reply-To: <20261013090447.1180121-1-nicoyip.dev@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 15:29:47 +0200
X-Gm-Features: AclHuK-Q2nn0oOoNYqpQrR-8kWZpjdvKCpaqHxulvcgHMV-HyAEfr1ZNOIxPAaI
Message-ID: <CAJfpegupo+nAz_ELWYPezK5QsSEQ4-iuiXWrsme+yHvXrj0t0w@mail.gmail.com>
Subject: Re: [PATCH] fuse: fix copy_file_range reply handling race
To: Chengfeng Ye <nicoyip.dev@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 11:04, Chengfeng Ye <nicoyip.dev@gmail.com> wrote:

> Use args.opcode for both -ENOSYS handling and output buffer selection.
> It records the opcode actually sent and is updated on fallback, keeping
> each reply tied to its request regardless of concurrent flag updates.

Applied, thanks.

Miklos
