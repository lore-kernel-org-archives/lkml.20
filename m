Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080112;
	b=ruSIPbS0kmxK9l7IJYRxSnA9oqp0/E+glH2dl+ffOgh5ED8JOJ6SKpFQ++dC/nk9sw3i
	 kK4rdGki2tK0qTq5Eko6MR9SNWIV7H5VnvSFmQsfmzRQIt3bVqVkBbtMeeNStSeGTqMTD
	 lxXlctGp5BFpcDsdyr8e4BAgn4qlina8Pc7YAVFzvp/0bCa+feZ/Sp0aqqq5oYXIYJrma
	 xIL5jP+PW2EpZb2YARMY3C7sL4zAHbEC0m+FfJYGJkl7JAVtRnHRylsQJEaK5fuxMpvMo
	 R+E2JGdTvbE/4eI7x2k81/+7zKKYfZSxgVnecrW1bEPHWOsqthwl3SWQqDLoNTDN7nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3HZ4Fm4AG3rsN53yKwwnj0LhzGAfQLgw5WMO8Bj1+J4=;
	b=mmKzLjndzX++sTtwmotjMQPCLBb7oktqGYSnXfDTVzY/jaLg/P0WO14StQSMiedTY837
	 koU+eIJ4NhF2oP3AVIJ5Ql5nWxEzXBqld+tITflYPdSMolIKr/oAXQlGXCGsnHpESW3OO
	 W/+6EXMA+Il9q/wJk3fECgCQDrPTWkoXSKBmUl53yOwJNEzo1WIfn1a+iVEfw5sDQSF3O
	 c9KSGrTf1nxHt79VTDzk44DlVuD6rd6aXABEHiavOr1P4GjwGyD9GlrgbeVR8ifzlPd2e
	 OfXgKtr9Y78rbgWki1e3HESNoViBeY2Y+RzuHinCaml7h6eS9LfXhxTsPcPBUO11ymQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HDjz5Ndo;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE6D606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE6D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HDjz5Ndo
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2442748a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080112; x=1793684912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3HZ4Fm4AG3rsN53yKwwnj0LhzGAfQLgw5WMO8Bj1+J4=;
        b=HDjz5Ndow/w6NxlCJcymZQDpGm0BmMcRcCV8OK9t81srVm9R3PHmPK+cDpTzSdjOdE
         /XbNQ7ppLftgtSv24ygTyWjDVmSMoqsTODDJeAWDKWHbDbv5D9P45TA8uhrHdMKpPNld
         Q50nTNVMBx8kIiT9b9rERbUDGB4k5+NOENtXtE9lRSCGOWkIhqNHpT2dg4YetHdZAszf
         A96xWBlbay7RW1t4Hti63i0YFms2oWRmDYXE6cAf1/9YW5ohn1PoU0ds5k3cfQNGNiIU
         mhYA+skZN5dnB1KVhZ4m/2y1jrWPGeSgNpNk4JIAqD84W48hgAv8L14kVlcLLpcajdVU
         9cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080112; x=1793684912;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3HZ4Fm4AG3rsN53yKwwnj0LhzGAfQLgw5WMO8Bj1+J4=;
        b=SjC6kH2DpEqX/OJDrWCewCt7SO3GzEIkrvraEL9FOLGBWy+aZ3cT5Xma1z2YwZvQuR
         2HPjivIlX0NG2jiW/LwL6TBkBvMGW028IpsTR20ZVWhyMrR9djeTLeEmlr2wsc76DpC3
         Eh+mvWoH8ZK701dJT13e8Kk+ie4W2kGyb0P2vaCK0LQRvzX8QndSgzvltK/nU2ggYuhP
         Of8M0/aYVGQHTP0v8K34qu+F9JUlmSCpDggZHa3hFgS2cg5AnSOdJQjYpL4v6c+qHums
         75AZinxo/NEdkE90BTLbe7u5N5ja/7RwMQT1cVW5lHosvitJDv3jjI9x3Rt8O+aneht9
         rBfA==
X-Forwarded-Encrypted: i=1; AKwUvBynTXLWpWgTIdF+sB1T8Xb4ErxtJVh5K5J4WcXDkXyxzlbQXO8s+UqGK1hraeeM523moLAa6X+0kj+1XsY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/2zG4qivM1mIAZNOwcQzmW67JVpyBojhwLiRtefUrTBiDtOOC
	sQsfnw7puHK0jHJ0a1puCaQ70aSVlG+VFuU42DXzdIgyBFGkxdjd/CMDRlSLKA==
X-Gm-Gg: AYBFou1vf0rCcKLqRas/GMmVEApj/6s0YxTfCup6wUI1rkMawbmx0+R1s83u5HUxhKy
	ap52xg5aeVM9kKuhgJfcDCwy8VFbmBs2QHqerZStF+Jdcr7cnuduSmdaSsb9Uv3Srv2bNs6ZGXW
	UB2BgtMBKLYpnXu6/m8n6xI3H7+uuz2cMi4ER+tIB0hoURdgMjcqj3qCAC1pDr4ZKuRtPGmDDCd
	EC4U5ju5A/tBxjWNkGX9XeY/zAXQC6UJH//ugOQ+wzc1NAgkmCQ1SoSSFI2v0mRr2J+ldsJKIS+
	6ccP7RLCTskirVkr9/YwX2epT2i3bESuFTVKSe1AIqXo40A8lu7wvP9aSmzJY1jw6c2zx5Nbz8b
	vpnNLpR2rUa786t8RwU2/AT3hR4VQ9P0hsk2bNQUUw7ei9Ayc00YTqEtG0lGLLp127Nrzmy8rlT
	0a6coGhmt4ufyqwub/hL93YZbOTLlvnIO1KlsTouS0A5vuZAn/RClmRjfh75RRRkfvynA8Oa0/j
	NL/F1+9iJztbpn23F7utoerB50rLqbn0uDtsK2ix5I65A==
X-Received: by 2002:a17:90b:3e4c:b0:3ac:9e76:aa98 with SMTP id 98e67ed59e1d1-3adeafc8962mr7575012a91.64.1793080111459;
        Mon, 26 Oct 2026 22:48:31 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4064f4bdsm2015679a91.11.2026.10.26.22.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:48:30 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:48:28 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: Re: [PATCH v4 05/31] ntfs: report boot geometry and MFT bootstrap
 errors
Message-ID: <auA7LJX2rUZUH8v9@hyunchul-PC02>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-6-liubaolin12138@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020084421.2196486-6-liubaolin12138@163.com>

> @@ -2802,7 +2822,8 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>  
>  	tmp_ino->i_ino = FILE_MFT;
>  	insert_inode_hash(tmp_ino);
> -	if (ntfs_read_inode_mount(tmp_ino) < 0) {
> +	err = ntfs_read_inode_mount(tmp_ino);

There is still one error handling case where ntfs_read_inode_mount()
returns -1.

-- 
Thanks,
Hyunchul
