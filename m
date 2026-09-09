Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C3058039D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970866; cv=none; b=KW8jPQ2FhPGExIg3P6bxea4F57z80ayCP/PUNVRIk6d2CEt52UWdPVMj1ipTmH2lxgzM56wtbPmmv7QAZCl1a4lpCnCECLeuGbHsB14YXEo3fjU6ovoK4rbGS7hY8Lg1FRz55cqsD4ET0Z1LBx07E6oT3WL78npkY84Tr0sY6jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970866; c=relaxed/simple;
	bh=xkYbxYOg02/PDAWI81Kh265hRNWCLTxckeOhfZzaiJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGVn7nOHwqDl06o21eqDHd0pA3DidtcTZRFSi4Gp/s9+05JzOY1/NNzWB1dsKlDMgR6uEv+2DtUfTYfsE4TJPDqTw8oKaqT5dZ4KDCOUiwHknexKkUfFellul9E+raZPIma5wYuTU8a8FyFxQyabrKbEmwlDUXNV4rQbcoPbzPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtMsJnb8; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtMsJnb8"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-86959a6f7f6so355130b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788970863; x=1789575663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzAFJX6yZl3OwKtzJ6LKEeISxVav1Hs+pjBuAYNoKgY=;
        b=HtMsJnb84J1aT/JR4Q+hpfq2kJ+74b5rMDV9zxwiYiFflKqCzpROrKuq9BRm8JHtKU
         ExW+5x5N+HQP9ZRmW7+mcQbO6OXTPe/B4BYIUNIDkOLEuldvRDIoewglE7PBrPjybn0X
         wgnH0FGzyU/FTUZ9CWPukBG6zdWhOyzQEfVXGBff/y4TiOa5mSZKSkMY2nRgZTQ2DGhr
         +C4ty+rTqEwjC8hwSy5NpLrksjqRqE4kNmVuEJqWI0QiCPwysvrw6Hz8pPLojyBPmu26
         pUW2h8fpXzR1D8MUkoiRbWZIQpKiYhW8peGn1R001/NICoelBe+sqM6GRKDsdpsB5Ity
         wqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788970863; x=1789575663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PzAFJX6yZl3OwKtzJ6LKEeISxVav1Hs+pjBuAYNoKgY=;
        b=NXs/Ptb0i2TKFMkNSKVZNvf2dTNOkaZyh2ktsgba+0NefJJa2O/2fT5AwoeiwYCCJw
         3esl8ObUeZO/SRjKNBsvYZ8S/vFegGJH5Yko08Mqp/LGZdeZiDnZGkQI0gd5pSBnmcMA
         W3Us3ireNI5tpVWLll2wPISOeu9WYH8LvY7onUqIpAke45H2F8clkreLkViolrGNLc6b
         sSdGeKLgQRJpGZx8gCooMMcJmwOWNZJF6IKaw3XXKMz4AgVlNuJygYUIrqv+S1QXVYzx
         7W9LmduL1jHjjHSzcu/F/Ptz+VML6rln9wYEK9DyKZbTXUoTzCCCxmk5sFq0m47kQAwB
         7vFg==
X-Forwarded-Encrypted: i=1; AKwUvBzBGqVgoKELOvENdqU3nIynUdXsB9FhycDwv4G8qYEI2DuIKTNeccVjHQITxGfNWzl5cvqg4QvSCC97WRg=@vger.kernel.org
X-Gm-Message-State: AFuF++muPIq9dZJ+/IxIS8TSVtm9YV5nG93kH5UcE6R7k7rfQRAV3giq
	eMBhaVGX0EaFdlav2qjd4EcnCdpHPBdIlEi8ChO6eBpvAGlNlRp0Nj+g
X-Gm-Gg: AYBFou14KaaK8z/1ZXVAo1/FSvzdAcb4jNe2Pr8jmR7N1QqfRlbJUTnfuq451NlFpDj
	CECoClxTc0N8q0OOYc7a0YxsWnicuQAS/EcQMH93tE7V09AesEFFswBrWX8fF4PAE/wXXiTcdYy
	nvX61xgyyPNMp4Vh9nhfC76emJqnJvL8cdHCBCDSUR+3HYYSNu5/888PRa4oAjaebb1BkOdSj2J
	fXjMAj/4f1QBYvnlchR7pQxfLjAUm20Ntkgeqi7wNGOXHN0NpLKBpwZTFJAgi6IkcG5vn/RIgzW
	b3ZacqnPSN+ln5c8kvEi0XV6Y7PcvhNhg4K2KG9ehpQQ66IXunzUqUBDOGOlTv1NG6kwyCWk1w8
	naWLiCogDRqquOq3wNP0eWXyf/9lJB1oNwLAr8R1a7EV9hf5DMJShNzodX/iGRsObUKKa+5/T+X
	Yz5WU/EBx9sitPn4CsfBcSEqLx+p66jDPLsfHjDSbAUxhn0PWOaS63jpadJuusuCo9sSoOAciZ8
	TMNj/Tkrb+JAPXRB0I=
X-Received: by 2002:a05:6a00:6c9c:b0:857:727c:a1f6 with SMTP id d2e1a72fcca58-8616997ee79mr51866444b3a.24.1788970863053;
        Wed, 09 Sep 2026 09:21:03 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:24ba:44ee:a9ec:98f1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8638c51f316sm5547812b3a.43.2026.09.09.09.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:21:02 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com
Subject: Re: [PATCH] hfsplus: fix recursive tree_lock in hfsplus_file_extend()
Date: Wed,  9 Sep 2026 23:20:57 +0700
Message-ID: <20260909162057.28071-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6adf8403f623448ffa8647b9b5e91397a8256315.camel@dubeyko.com>
References: <6adf8403f623448ffa8647b9b5e91397a8256315.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Slava,

Agreed on all four points, and dropping the btree.c/super.c hunks --
you're right on the specifics too: hfs_btree_open() is also called
from xattr.c when an attributes tree is created lazily, mid-operation,
so it has no business deciding sb->s_flags itself. And re-checking my
own super.c hunk: it dereferences sbi->ext_tree/attr_tree
unconditionally, which NULL-derefs on remount of a volume with no
attributes file (attr_tree is NULL whenever vhdr->attr_file.total_blocks
== 0). Glad that didn't go anywhere.

One clarifying question before I attempt that piece: you wrote both
"it needs to return the error code from this method" and "set the
state of the btree as inconsistent". Those lead to different mounts:

  (a) hfs_btree_open() returns ERR_PTR(-EIO) -> the tree never opens,
      mount fails outright (same as every other check already in that
      function).
  (b) hfs_btree_open() still returns the tree, with a new inconsistency
      flag set on it -> mount can succeed read-only, existing (valid)
      data stays reachable.

I'd lean towards (b) -- read-only recovery only works if the tree
actually opens -- but that's your call, not mine to assume. Which did
you mean, or something else?

For v2 I'm narrowing to just the recursion fix, changed per your ENOSPC
point below:

--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -458,6 +458,14 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 	if (hip->alloc_blocks == hip->first_blocks)
 		goal = hfsplus_ext_lastblock(hip->first_extents);
 	else {
+		/*
+		 * The extents overflow file can't grow past its own fork
+		 * extents: doing so would re-enter hfs_find_init() on the
+		 * extents tree, whose tree_lock is already held here.
+		 */
+		if (inode->i_ino == HFSPLUS_EXT_CNID) {
+			res = -ENOSPC;
+			goto out;
+		}
 		res = hfsplus_ext_read_extent(inode, hip->alloc_blocks);
 		if (res)
 			goto out;

> Another direction is that we exhausted the volume or volume is so
> fragmented that we cannot extend the Extents Overflow file anymore.
> [...] we need to check before extending [...] that we have free
> extent slots or we can add some space into the latest extent. If
> there is no such opportunity, then we need to report -ENOSPC.

Right -- that's the same guard, just under a correct errno. It fires
identically whether the fork is corrupted (this report) or the tree
has genuinely run out of room to describe itself, without needing to
tell those two apart at this call site. Sending this alone as v2 so
the deadlock fix isn't blocked on the larger validator design; happy
to follow up with the fork-bounds/consistency-flag work separately
once (a)/(b) above is settled.

Thanks,
Thang
