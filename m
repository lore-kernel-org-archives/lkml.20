Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13F941D22B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377302; cv=none; b=W19A1PfY2LOgyw/pP/4dO3FKsdsS2Nf2fWluRiI21H4jTNw9dcqn93DaWyqRf/mfpa0a6T7yC7aAeA50+P4njo/mIwjELqqfgjwT2bVkiqGDHqigytlcYOLHpQJAPscAhvdY3xqERuWOmoUayQ92qazlpTW5m1elye90o63HU9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377302; c=relaxed/simple;
	bh=FP5oFiBYbVyY3JVsCwCjRRtGL56Xd97vsRfsO3nXhJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUYO1IVLhrwBDm8fYq1FdxoDo5YOnz67n/fASJ0v7wqYhazJxs3E8QBKsvd70tkWi2SEQOgm3dMjUaUvkPowBCQSYck32Xz8SjrRrkzJO8elmAD3Agu3qOXcmUALFsesce+cau9rkXkoX6qDHlNU85+3o37Nhjx5QlehUR/heYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW4S+Uhv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW4S+Uhv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso12712305e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377293; x=1789982093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eLs2DuVwwmthhfTQvpsHARZ1xrBdjckpgXaXtFhSszQ=;
        b=iW4S+UhvWmezfeAGKr0L+2xuiRjMbQd6M+PhopKnsZUC61vNP25L2lv4pJY+S9wGX5
         qwv4o46Ua9XNn4mJfsa8QQGLXJk+5dAYvHJnrd/qVMhyp0g85ZQBm6Ktc0NJ79OT0+Qp
         VkjUByq1mY+cBsq7QIb8Wdg+IrGnUbrJp9Z3byHwcBrrNxTuW58h7KauSmsLyjyW6Ff9
         f46Qffw97Zjf8AHQK+ZeDMXqkQuZeeWNO+NNfIF1pUl5YWrufFSarSRx3lauZSpE3aG7
         uGsEdNYWZrZyRfDUWj/qJmdxd5zBvADMPXX8RutGXVUycUio2jGzzAm0pSOhCErDRNkD
         dyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377293; x=1789982093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLs2DuVwwmthhfTQvpsHARZ1xrBdjckpgXaXtFhSszQ=;
        b=TLU8rklu8tDybwsaNFY8UPowmntxLLDqkZWhnhLVUKfCDQqfGVRstxAneO71nrWr2d
         Sx0Ey4Av6oBYQKPltTPZz6j/gyl0WiOTD3CpbQ1+THBPGyJwW6vvv5IUuXuN8mm9FMBm
         aHlwnO5E/Zi0vUo3DgA5GkKiOwlKJQHA40eEBUYOGTu2/CtSeWA1HGP9r0Oc5IyskX+U
         VOAeO0Zd5ZcAnE0PcAJRr0DEw6j6I2CkIxHdijt1hUMacRbvQVh0VQaTk/E9Zj6JuAva
         o4JoJTLOaQjjQ+N5tZkUn2ml7u4UtxC3g7u/1xWtjbTgnZk2nlvKZMGXdNQeg2hj+frR
         2Gag==
X-Forwarded-Encrypted: i=1; AKwUvBz0Qw82PbJ1LNh125DZrHGZe6yFintly28LAEoETSEsrRNFEARKxgDg7leix3wZ0FwBdHISZD97GSQV5Eg=@vger.kernel.org
X-Gm-Message-State: AFuF++njxtYhccs2F/93yXi8G4g+ZgxtjFj54oBrXI6h6+17AbqgL92f
	jH8zFoRPGtbTof52LzRx+O2j5i+JSJYLXRs+Wwb75Q/wzfbvQh/Znl0=
X-Gm-Gg: AYBFou1SnwKdF3wpVQvYtauVn+QmSizQJcpS5Ems311LI4AwmtOTdsHBrLCZ/Fkc95c
	CH7OB/6EC4Z+kDThiBJLRG1dGQeIfqy5fCbeukq9rKDH9S4AjCgmGH3kVYW1CLcl6JfcHjCXCJX
	RRkZA7w3+BgWx2TRZpoVLwqO67c+2XlIAvR492q6ISQI+N6p5dPZdYCxhPEIolKRCBNjqU0xyl+
	AT0UiciyKamLuF5J2bTDo8/ICXrjJoPt+Z0xfDUI2Kjoy0vfFErYBZ2HSqP5zdTqX7iWB2FBQl0
	E3ReG3MafFHFeHCTMJ5fT3MMC9dbXOPemSajxVeyXKua/r8KbKOGfb95A0sEJeBcn+OgL6qvuIV
	jD7vTYslZ8Fbae7beIiMXAq0wFXJ+f39Kz5XkMaogK1k89zIsw384bVV6DGjMIaEMDxp8pfzDOv
	WHBjtqYAzo3YGg10H10oqEIWDEVYPh2QnGskMfaWWJI4qBq6qMiHP6OlI=
X-Received: by 2002:a05:600d:3:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49e7a66b64bmr16207805e9.16.1789377293358;
        Mon, 14 Sep 2026 02:14:53 -0700 (PDT)
Received: from p183 ([46.53.134.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6fc9c027sm197705935e9.1.2026.09.14.02.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:14:52 -0700 (PDT)
Date: Mon, 14 Sep 2026 12:19:03 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Huang Shijie <huangsj@hygon.cn>
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org, zhongyuan@hygon.cn,
	fangbaoshun@hygon.cn, yingzhiwei@hygon.cn, jack@suse.cz,
	dev.jain@arm.com, ljs@kernel.org, akpm@linux-foundation.org,
	hpa@zytor.com, ryan.roberts@arm.com, mjguzik@gmail.com,
	joel.granados@kernel.org, jannh@google.com, oleg@redhat.com,
	aleksa@amutable.com, legion@kernel.org, kees@kernel.org,
	joannelkoong@gmail.com, tj@kernel.org, libaokun@linux.alibaba.com,
	ebiggers@kernel.org, sandeen@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] fs/drop_caches: do not scan procfs in
 drop_pagecache_sb()
Message-ID: <c566b9eb-7cad-4a03-bf53-ae3b3e699559@p183>
References: <20260914061449.4024632-1-huangsj@hygon.cn>
 <20260914061449.4024632-2-huangsj@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914061449.4024632-2-huangsj@hygon.cn>

On Mon, Sep 14, 2026 at 02:14:47PM +0800, Huang Shijie wrote:
> There is no page cache for the procfs, so do not scan the
> inodes in procfs.

> @@ -20,6 +21,9 @@ static void drop_pagecache_sb(struct super_block *sb, void *unused)
>  {
>  	struct inode *inode, *toput_inode = NULL;
>  
> +	if (sb->s_magic == PROC_SUPER_MAGIC)
> +		return;

This should be some flag somewhere in superblock.
Other fake filesystems don't support pagecache too.
