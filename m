Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793685983;
	b=PTxEXWJvCrpg0LCQ8UwohDg48rEph4PLP3c4rl/zKKdIeWJxTjO9olDnb4DcumWpXWSg
	 tmwJB3esM5GCkNo8KvxDkHYm9oHB2AnoXYvDaTbsFbpNXjgb+cOCvzpwV7TlcNQZ+MLTb
	 /J4roykv+4/Iz+fCmLOH/wB/NV5kg8buZ/MLnnaFgBITQUcWuqdvnp8e58Aeww3sjH9MB
	 J+cu4kiAM/17aTzeAHxT0UVbcHKvv8qvNBhDC6fnCSmBJrjL8S7C1fy9dBZfcRTzqxAsG
	 kskEXKctHPSBifML0NrOwVSA/lXy+HZtYGDMEI4LsBju1n+W1ks8Ni9bYKwosrKojyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793685983;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Mime-Version:Subject:Reply-To:Sender:From:To:CC:X-Priority:
	 X-Content-Kind-Code:In-Reply-To:X-CPGS-Detection:X-Drm-Type:
	 X-Msg-Generator:X-Msg-Type:X-Reply-Demand:Message-ID:Date:
	 X-CMS-MailID:Content-Transfer-Encoding:Content-Type:X-Sendblock-Type:
	 CMS-TYPE:X-CPGSPASS:X-CPGSPASS:cpgsPolicy:X-CFilter-Loop:
	 X-CMS-RootMailID:References;
	bh=UBt77OHBiOQQUK9q7qsOedPMK/CRVu9M6LDftAotXVQ=;
	b=vHus92elhjefGRGHkGgvKzomvIUuz0CSNPrdd0KZa3KmXV5dzZX169JVoj8O4xMN8zW5
	 ZbLqbQeVWGAxRs8HLiHoiQ+Nj+lAdkN20Gfo4r3UC22S+QoQoEjuiZ0/K3Cfx2lIjo6YB
	 sxoGMtve6wMfhgJN7RtvyVlxgdQMxKpg7/Tp1ZI6uImwHenaiKjG6e/vsFfcIJsAa0BzK
	 +c/c2iyX7si2qNOQdnOFBZXNZGA9Y9R848AqcnOHtCrXh+5pADn1bjCmfGxdUQgDY/OhT
	 KwkJemz4aHatpZgn3Y44SMbS342J6dY9sBPTlfWdiaocX6sdTYpN6fKexDhPOmL5heg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="DuwdB60/";
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183F4606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 183F4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=DuwdB60/
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261103060612epoutp02487440ba0c22bf51610f9ef987e69097~kc_OGryj21597215972epoutp021
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:06:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261103060612epoutp02487440ba0c22bf51610f9ef987e69097~kc_OGryj21597215972epoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793685972;
	bh=UBt77OHBiOQQUK9q7qsOedPMK/CRVu9M6LDftAotXVQ=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=DuwdB60/hE0FBz3NWwxnD5DWJ7OguNtYHmgefR6Wd3qFeohoR7pMZl0LP9FH4OAeo
	 jLGVKoqdpXuXw1RSJAKxvuoMFbs9z3pVrJPE7xIERzwVjzTS+Z2N5bC/QHTgFpbxVh
	 vWLcF2JQtnsLQtGZstE8xLLCiQ8tIFAhYqiqaCDU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20261103060612epcas2p4c39da0bfc48d537b44ef8c58b48eba49~kc_NnfSfq0354603546epcas2p4_;
	Tue,  3 Nov 2026 06:06:12 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.205]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jJdNz6Cmhz2SSKZ; Tue,  3 Nov
	2026 06:06:11 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Subject: RE:(2) [PATCH] erofs: apply the stacked fs check to extra
 file-backed devices
Reply-To: daejun7.park@samsung.com
Sender: Daejun Park <daejun7.park@samsung.com>
From: Daejun Park <daejun7.park@samsung.com>
To: Gao Xiang <xiang@kernel.org>
CC: Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, Jingbo Xu
	<jefflexu@163.com>, Sandeep Dhavale <dhavale@google.com>, Hongbo Li
	<hongbohbli@tencent.com>, Chunhai Guo <guochunhai@vivo.com>,
	"linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daejun Park
	<daejun7.park@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <auh7t-KdfKXhUAUY@XiangdeMacBook-Pro.local>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20261103060611epcms2p59fa862138fec893e6ead9a35b82113d1@epcms2p5>
Date: Tue, 03 Nov 2026 15:06:11 +0900
X-CMS-MailID: 20261103060611epcms2p59fa862138fec893e6ead9a35b82113d1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261102120211epcas2p3be77fd93564ff4b785e4ae9bb97e071f
References: <auh7t-KdfKXhUAUY@XiangdeMacBook-Pro.local>
	<20261030-erofs-stacked-extra-devices-v1-1-39f7df7ac01b@samsung.com>
	<CGME20261102120211epcas2p3be77fd93564ff4b785e4ae9bb97e071f@epcms2p5>

> > - Lockdep warns about devs->rwsem vs i_rwsem for a device= path inside
> >   an EROFS mount, with or without this patch.
>
> What does that mean? Can you explain more about this lockdep issue?

In the test, an EROFS image is mounted at /mnt/n1, and another EROFS
image is mounted at /mnt/n2 with device=/mnt/n1/blob2:

1. A cold directory lookup on an EROFS mount holds the directory's
   i_rwsem in lookup_open() and reads the directory block through
   erofs_lookup() -> erofs_bread() -> erofs_map_dev(), which takes
   down_read(&devs->rwsem). Lockdep records i_rwsem -> devs->rwsem.

2. Mounting the second EROFS at /mnt/n2 calls erofs_scan_devices(),
   which takes down_read(&sbi->devs->rwsem) on the new superblock and
   then calls erofs_init_device() -> filp_open("/mnt/n1/blob2"). When
   blob2 is not in the dcache, lookup_open() takes the directory's
   i_rwsem on /mnt/n1.

Because both mounts share the lockdep classes &sbi->devs->rwsem and
&type->i_mutex_dir_key, lockdep reports a cycle:

  WARNING: possible circular locking dependency detected
  python3/1138 is trying to acquire lock:
  (&type->i_mutex_dir_key#8){.+.+}-{4:4}, at: lookup_open+0x182/0x1650
  but task is already holding lock:
  (&sbi->devs->rwsem){++++}-{4:4}, at: erofs_fc_fill_super+0x2008/0x35c0

  -> #1 (&sbi->devs->rwsem){++++}-{4:4}:
         down_read+0x8f/0x4b0
         erofs_map_dev+0x2f5/0xb20
         ...
         erofs_bread+0x15c/0x5b0
         erofs_find_target_block.constprop.0+0x22e/0xa40
         erofs_namei+0x1d4/0x7c0
         erofs_lookup+0x246/0x300
         lookup_open+0x83b/0x1650

  -> #0 (&type->i_mutex_dir_key#8){.+.+}-{4:4}:
         down_read+0x8f/0x4b0
         lookup_open+0x182/0x1650
         ...
         filp_open+0x28/0x40
         erofs_init_device+0x151/0x880
         erofs_fc_fill_super+0x20e6/0x35c0

The second superblock is still in erofs_fc_fill_super(), and
down_write(&sbi->devs->rwsem) only runs in erofs_fc_parse_param() before
get_tree, so the two mounts cannot actually deadlock.

Also, Sashiko found that inode_share can nest file-backed reads through
a block-backed EROFS mount. I will send a v2 series with this patch
first, followed by a patch for inode_share and the bio_set patch.
