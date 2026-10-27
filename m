Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119759;
	b=10UB3+ZQJioiqq7vted8smhu6RHXC+lBZ3cRAkDUJ9DQrHW8gDItBcUnU9vHdrK7M+DY
	 XaHnVgeSonHRiX3ZbHYKmj7n6mbRfqpW5DFB4iXujufN7EU07uX24aYVkcnCAozP/cfkA
	 92hIbJKujKj41n81mo6og2chADohpDvUpzuAxlN/Nx17r8dgyJipvVDMb94A6eoiN70Jo
	 xwGjeicBwuCEzcm1NlDuI4Sxxc47j660swzeANl/l/qctWWADndJhgb5HT8Js5eCizmmu
	 fIae92RWjOZh8u2ExuSHaSGLkG8v9zAxWUCGhyJKyEAUw8uMwytKnsVDJb226KaDoHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5h6BBHIqEoVlVYK9N7Wra3yA9g0iuse1t0EMDjWEH9Y=;
	b=Tx0PKp7OZeO8+wbdPq+eAIlp5FCSkoEh5uH5N55cYmLRNMZ1rUD12N7Y4glymIMYXqBG
	 XmsX8ITezdQGn+FXp2fdGaRky8SVfV+HMYKzT5PjrNWw+bsZaq43xZInSq/J4MJQ53o6T
	 kxx6kY8MF/nJEZMVG5ZPLlgWmc2GLVxu0FjaCpRgFJMRL12V4ia8TSuhdNTArZdkYljBp
	 k9XeUae5PCA3S1IK0aua1l8do1bR9d7MLvjWdupU0B8vjnWs/Nt0zdErRtcG9tL0lkMKu
	 wP0Bb+FeTH8CjhYyrbA2Pmj9P/rOwgR51aByuaQq3rSv6MgH5uMuFSusgoeIWZS2nRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UB/oMyps";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2120C606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2120C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UB/oMyps
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so382755e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119757; x=1793724557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5h6BBHIqEoVlVYK9N7Wra3yA9g0iuse1t0EMDjWEH9Y=;
        b=UB/oMypslgUErxwg+EMLW4/2jYT75wR8k/sQ4y9j1+chvoi+4sXibjHZc+ZP4FCwhe
         EejVkr5Nn4OLNRcDUXAzlOSyqyz7ZB6b5iv7fHyXL0ukmPozJ+GXBP2KYx4mAivO3OC6
         32azoh58l973/j9LYPpQdWo5fp1zMXjQxiIZnEQ6wFSd7uWecaZUrfYFLMDKLG6n8Zkt
         fzMjo6UxS/QOpKEn74pb1rGJkwe4UQmz96kG13Sg8JNrTawgIUJDhssCDdWI5pV+GK6l
         om7SbkfCCjv9NUI2POcmovIopR9MmKLLdAqeu4UwUaKNUqcOrmnSNRXWHeT4zDk5Etje
         9qqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119757; x=1793724557;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5h6BBHIqEoVlVYK9N7Wra3yA9g0iuse1t0EMDjWEH9Y=;
        b=BTm6L0DBf331L5fDoe9nNH4R6MwM8R2/ZBRGABDoadsfWuLpWIiMLpbMsSTLDxRywW
         nsabdmWyl34gVVnb4PkY/w3LkaTwvOpmEulWi09dZMfQryFYFgOXZWSPsiOD8K0bTchT
         mbG1B4zT9tgHy6RIXEOm0KOEJtmZMPtv80z3COJIQ2HigFeAwuPCn6SQk9qDZCCqoCH9
         lb4g9gK8taHLtWRi8QIzQzePLPSd++qyopJbdkPzjEqMVFo/B5Y29VwM5gH6ccR0xH/z
         9V/qLY0V1dTEv0jBhN5A9Wn255imJyGWcc+0wS5mhihrfHV+AZbP4DFzXOaEN9jgVtBu
         s8RQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyCuxu65YEyZRJPDILheYJtRzRut0b3emdnsEzByBz0jY0ZBDrTAnLtMGh1D8qdiM7pzf1y1PMO9NGDLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ80PkFaKZhw1iYuE5KwS6+fZx29eQsXkWNbmpxN7sVPEhHO4IV
	hU2MLlm4cRl0zsICFm1N4hNueaB8gTwW5Mpb6TPOqBPF77Dg5qpOWTvJ
X-Gm-Gg: AYBFou1qzeK2OxrAYTkJvEKyM7efgaXPh9bQL+YzZQFueZ+zQ4fGvHh5UikVYr84KIn
	Q0Zkj/2o4JL1wq30D4hCVz2Zmmqm3DteDqNW6MYKg3x8zLDSLwJjen/io0lVNFFivouctxvlv0Z
	MoY2mN72puITe8lk/Y+HB8H5eZMMsHsl/lTAY9Xu24N0jEcuiKZyq2gnQmoJfgVSyzNhyeMupyw
	dkJDByvMhLJUS1z4vM5BL3XF2HVd8PFGDmzwcl8ee4d36T0ya2cDqVPLIWCbaD0l4YVp+jhKzK1
	0rtHUk1H7YyN/GiR+SzxQCqR27N4gNxmnSlJSa4ThXFBNI3kbU/cAC5ulXj+LlYpo/tZwj3yzxI
	/CtWvJ8olnYzwQwn3pBBQSpKBTcjmIobtVw/cpPoNBsWfonXt3XqzDTMAuLBsp3u5w8g1kJN0mi
	RTVXK4jo/Rc9iTaXJ/8uZXG+EnT3T6pAp68eHW/zRx4WyssbS48GviT64oUElcPFM8foK9ZEDM0
	A2zn1Hn8qvVcBGjvRNrJv/lSSB0QzwybVDR00oX+9hdpA2cAbems9IXlCRvYBJ+hY1xoAsJntLU
	ir0v3VFpheums/S4Cg==
X-Received: by 2002:a05:600c:19d4:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4a35acbbcaamr198161485e9.25.1793119757306;
        Tue, 27 Oct 2026 09:49:17 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm24388392f8f.38.2026.10.27.09.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:49:16 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:49:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Reid Downing <skibletz@gmail.com>
Cc: Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Darrick J . Wong" <djwong@kernel.org>, Eric
 Sandeen <sandeen@redhat.com>, Christoph Hellwig <hch@lst.de>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] xfs: fix wrong compat fields in
 xfs_ioctl32_bstat_copyin()
Message-ID: <20261027164911.578ef6e7@pumpkin>
In-Reply-To: <20261027161748.2760321-1-skibletz@gmail.com>
References: <20261027161748.2760321-1-skibletz@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Oct 2026 12:17:48 -0400
Reid Downing <skibletz@gmail.com> wrote:

> bs_blocks and bs_xflags were both read from bstat32->bs_size.
> Read each one from its own field instead.

It would be much better to do a single copy_from_user() of the entire
compat structure and copy the fields to the standard one.

The function would need to be 'noinline_for_stack'.

David
 
> 
> Fixes: e94fc4a43e5c39 ("[XFS] Add compat handlers for swapext ioctl")
> Cc: <stable@vger.kernel.org> # v2.6.29
> Signed-off-by: Reid Downing <skibletz@gmail.com>
> ---
> v2:
>  - Also fix bs_blocks (spotted by Eric Sandeen)
> 
>  fs/xfs/xfs_ioctl32.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/xfs/xfs_ioctl32.c b/fs/xfs/xfs_ioctl32.c
> index f6875a2cc70..77bc936bf0d 100644
> --- a/fs/xfs/xfs_ioctl32.c
> +++ b/fs/xfs/xfs_ioctl32.c
> @@ -143,8 +143,8 @@ xfs_ioctl32_bstat_copyin(
>  	    xfs_ioctl32_bstime_copyin(&bstat->bs_atime, &bstat32->bs_atime) ||
>  	    xfs_ioctl32_bstime_copyin(&bstat->bs_mtime, &bstat32->bs_mtime) ||
>  	    xfs_ioctl32_bstime_copyin(&bstat->bs_ctime, &bstat32->bs_ctime) ||
> -	    get_user(bstat->bs_blocks,	&bstat32->bs_size)	||
> -	    get_user(bstat->bs_xflags,	&bstat32->bs_size)	||
> +	    get_user(bstat->bs_blocks,	&bstat32->bs_blocks)	||
> +	    get_user(bstat->bs_xflags,	&bstat32->bs_xflags)	||
>  	    get_user(bstat->bs_extsize,	&bstat32->bs_extsize)	||
>  	    get_user(bstat->bs_extents,	&bstat32->bs_extents)	||
>  	    get_user(bstat->bs_gen,	&bstat32->bs_gen)	||

