Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4FA30AD05
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056102; cv=none; b=uJHn3nRhP7lQbbULRsm3rBuPuk49DSic1lv6dyg0eiY4VYGedoTwBrCGL5FaeWKFfrF33GZ4s3Oa6tsmDBsDX/ZOGq5KDUTIsB0Zr5MPATNFlZaPG1OTRF4yvfByCN3zr30Uv1Blgm1ZY3515D4/qkwwwEH1BbcdFmVwPihmJZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056102; c=relaxed/simple;
	bh=sr0bSd9ynGbTFgNCIZwrhzTqIlzKR4bDn3xzOgSWMQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejtB+TzcTj9UFx83VBNeZ/XCgR2d7lLRNi/ZByW03ivfodjeY3CoH6bXbWY/+8Wvxc1C4wY5d/2EBVw7j3x9GpFRaaXMKIsblnfiBBDShM6JAHm4KEu8daON4GPbQvt9TVvXCVwGBnl1kfRc//cfqtOm16aolWeJa7/eQnaLGXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrd+/ORV; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrd+/ORV"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398e9698a70so6819533a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789056100; x=1789660900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKB1T8mcm5Xa8kORYrA70kCPtUYorZOcKwhVmBy0tqY=;
        b=mrd+/ORVqatNaAW3HbFq4Tmoff7GuFlHsr5r1rCI7HDVcSAeEw+Yxa+bpyr2bBjoec
         3EpStfQdPhnA0kueZUXkJYFpkuGM/1EHEOg3I7boDfgcvoZN1yyIGn5VxK8YbVWtKiE3
         2GYSGBYA7/4Wf3AKjYS4EYQi0rfGDbYg0yg005n4XEeUAJhAg6V87DVEeKJUVaNrW7+0
         +M8Zlv4KttuxO2Cx2fHryQRi1ztSUF+5ypB01dH+rnFi8PHnh9qAmIJl6JS6pHD5gpjP
         iCkKwLoLQIMq7POdwG8qY6vVfi2lROVDBaXvaw8xc6el4u8h8prU9AtoEZqlguy48Il+
         cYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056100; x=1789660900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKB1T8mcm5Xa8kORYrA70kCPtUYorZOcKwhVmBy0tqY=;
        b=DVrCiLb6NWO7tuNXa8N43UBvDSllYXiuXMDQ/vVu1oK2g5Umlkd+/GahqC2u85xtuE
         h2VJdm5vhjaS0uWJgN2ygdHulclFta9HPgh/5nf9V7bPmu9j5RE6AWrYsdKlOKHzv/y8
         EgUSDye4kaLfFpXTOjnDZHfib971LA8/08Wv/UtZLR4s0llp78eXt1OfQWT3Rm0fyCsv
         53+hJDoCqStO+n7yGhO8pwyQlwAeOtb4QtsapCm4FOXJecF1X5TipIv3gmTJKBGcScFI
         KLigkBu//yrIeZApCGHRCxqo9wSwQ3PggYAFcCqnS0G/Db28cM8M7XDRfOOsmBh1bzwW
         /87Q==
X-Forwarded-Encrypted: i=1; AKwUvBw6Lawi8XVBDgVR1duJTWDwWX/SuqwW1UUDu9LKng5XhCx1x8DVxMT6L/M95MZoyjq+iSjIERI3riNKfKc=@vger.kernel.org
X-Gm-Message-State: AFuF++kpf2LBDzd2L20qoRjwq7CHAmF6K3xqBvsOk+N3gAnKbWd5Ssh7
	pbWSH3d58EzudszFrhoX+hax9LS89ImWz/TCZYbbF/xWnghu9hbT1KhQ
X-Gm-Gg: AYBFou0fYGTNSs/aRZMe5ciHG/rvujqG9hNINaEV7qF/TDJBn/bccS1XiGHdSiil3xe
	6N+p9V0euTki8lJ/4UZRvFc7UTO1TGxNprZsXPKpdM8FSp/btoP/dFNj3pJTuxmIAQxfqIG5vyN
	IyItPu8oGCMlIokWPqdKkstTrWXXF/gsDMFRZQSsCcn4KpV61YCdqx1VZazgi13U0UVrWdTEFdy
	UBiATnd7VhAw4X6uJuP0ZKYEgAbwZYHxOXim1Xf/HpdMg4Bg7CaX9Lv6WJyB0FsI6H4hkFBRhWn
	94m1SYqTXyEdGaiIaZuZQDyYz6tdTdV7V7OZJk5C2pd6HV222gpXcTL9G8GecFjEaLU1wewoXMk
	P91fzS45qS/ceFArFApA4pVrfFMveaDMUcgI5y7Zs/xyzn4KvsfEdrEin9sn/JrsC3SZoDW9KOw
	7I1XpX7RI7VmkkLdluTOYZkGJIKus0gLL51liXBJGbiMONFF8QqI6r3qRHgwblHY4GWbdhrOt6V
	yIAm3Oi3HXhi2uLZu0=
X-Received: by 2002:a17:90a:616:b0:39d:8222:6436 with SMTP id 98e67ed59e1d1-39d82226893mr4452317a91.7.1789056099650;
        Thu, 10 Sep 2026 09:01:39 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:ced9:ef96:e152:2608])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9540fd76sm279431a91.9.2026.09.10.09.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:01:39 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com
Subject: Re: [PATCH] hfsplus: fix recursive tree_lock in hfsplus_file_extend()
Date: Thu, 10 Sep 2026 23:01:33 +0700
Message-ID: <20260910160133.27143-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <73cc2e394cc0269a62e2e6503aac5fef2a3ac65a.camel@dubeyko.com>
References: <73cc2e394cc0269a62e2e6503aac5fef2a3ac65a.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Slava,

> Probably, hfs_bmap_reserve() is the proper place for checking
> capability of growing Extents Overflow file. But it needs to take
> into account that if fork has empty extents, then we can grow the
> b-tree. We have -ENOSPC situation only if we already used all
> extents in the fork.

Right, and it turns out the existing control flow already computes
exactly that, so I kept the check in extents.c rather than duplicating
fork-layout knowledge in hfs_bmap_reserve(): hfsplus_add_extent()
returns -ENOSPC only when it has walked all eight slots and the last
one can't be extended contiguously (the ++i >= 8 case). If there's an
empty slot, or the last extent can be grown in place, it consumes that
and returns 0 -- hfsplus_file_extend() never reaches the
"insert_extent" label in that case. So arriving at insert_extent
already means the fork is exhausted; no slot scan needed there.

v2, two hunks in the same function:

--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -458,6 +458,15 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 	if (hip->alloc_blocks == hip->first_blocks)
 		goal = hfsplus_ext_lastblock(hip->first_extents);
 	else {
+		/*
+		 * The fork already claims more blocks than its eight extents
+		 * describe (a corrupt on-disk fork): looking up the rest
+		 * would re-enter hfs_find_init() on the extents tree, whose
+		 * tree_lock is already held here.
+		 */
+		if (inode->i_ino == HFSPLUS_EXT_CNID) {
+			res = -ENOSPC;
+			goto out;
+		}
 		res = hfsplus_ext_read_extent(inode, hip->alloc_blocks);
 		if (res)
 			goto out;
@@ -534,6 +543,15 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 	return res;

 insert_extent:
+	/*
+	 * Getting here means the fork's eight extents are exhausted (see
+	 * hfsplus_add_extent()). The extents overflow file can't record
+	 * an overflow extent of its own, so it cannot grow any further.
+	 */
+	if (inode->i_ino == HFSPLUS_EXT_CNID) {
+		res = -ENOSPC;
+		goto out;
+	}
+
 	hfs_dbg("insert new extent\n");
 	res = hfsplus_ext_write_extent_locked(inode);
 	if (res)

First hunk: fork was already inconsistent when read from disk at
mount. Second hunk: fork was consistent but genuinely ran out of the
eight slots during this call -- your ENOSPC case. Both land on the
same tree_lock recursion, so both need the guard.

On the severity split you described (consistent first extent + garbage
elsewhere -> construct + flag inconsistent + read-only; unusable first
extent -> hard error, mount fails): agreed, and that's the direction
I'll take the fork-validator follow-up once this one's in, applying it
to all three trees as you asked.

Both hunks build cleanly here.

Thanks,
Thang
