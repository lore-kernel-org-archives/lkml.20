Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8573E3EA94C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970746; cv=none; b=tiGJDMPwAGCZQWf+h5qvzKjNq7MqS7newYzyO/nQEp1y+CPZ6U3jcTlCcbMart5PNkC42S4T2A3EYXRLcjLaVLlnXOQdRXfvOW9BLqRRyaC0auJ4GhEO2MkVXHOLWa/84HT/6Q1VfBqNWp77O1AVzNArDBXLMYBtK4bEZaVAD2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970746; c=relaxed/simple;
	bh=1pz/Wdo0F/plk/TB9aAPZzG5xY7aJ6XToYfrVOYGCCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0k7jJVNIQ5N7RRmoY/Kl/Dy4pdsdgorEbrLIbl4BlmmzeFpVaSwRUV4l+RPBoFLYQlO1mQhTXLisPtweGWHM4TPiinbshU1Zq4+klVfrsggNmre3w5nWMWfujcpZw/n9pvI9lrENGTEC69nB7RsR1X+XcGb3Gn78vz3UGvYnFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=noroxi.com; spf=pass smtp.mailfrom=noroxi.com; dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b=BQx2lQDf; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=noroxi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noroxi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b="BQx2lQDf"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba42939bfeso2582129e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noroxi.com; s=google; t=1790970742; x=1791575542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pz/Wdo0F/plk/TB9aAPZzG5xY7aJ6XToYfrVOYGCCM=;
        b=BQx2lQDfNia+9V+O5D/Lew7+1GFpDCARUh3CrWyVzOhd5HGhdk7sYv785jY/f/VRY8
         h/bGMUxClnSNj0InCXoknHvhP6Ii7qP//mPEbvId4o8PJ5k7VXavW99GXrTGZmga/XDT
         +tDunV7Cdg/DFN4+j3InV3vU1+h4EmRX0L9QdjN0PiSj88VbeNTxmNRqfCu1sLvXWbOx
         T5GtfrSTpGgEKEc8ePOy92F5VtqWKDagCJqX5UeameD+uD1e9VbrMJJ1+8XVAejPYdh8
         HcmvQ2+ADhtGcDmmPZy1MS+ie1WWd5eRpog6fk3lb4DEP2dIFf7PqHS49q42cKmODSQJ
         oP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970742; x=1791575542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pz/Wdo0F/plk/TB9aAPZzG5xY7aJ6XToYfrVOYGCCM=;
        b=dZ2YiVYz0Tg6GAdzm+A3Gy8OLaK5SCiQTDNwlZXQn9uD/W/voT2QqaRLNbeKRKlPrp
         +MgptBWDOHrFMqTv8FeET/GHe7xjXsOAp9sSXN+pP0A3Ij9geql+jWpk4iN3mAt3z6N3
         43cNjo040gJpkGdoiLRIy6IF7wlAUMgrd3itvTk/E6aTD/E4H6XVPlca8JV+e7bLw0NB
         plmgNmQ8oETGPX/qQxq0Cdh0wHYMAgdnkZ6qoWtLTfHiYQ4vgj0SB5SWusAtj+lHACNH
         pbZ7j4mw9Yrads0bw8S9JTBzxrhOtQFbTw20gXy+R/ufXB/V4dG0ZE2lqcZwAB00b0Y9
         Yh2w==
X-Forwarded-Encrypted: i=1; AKwUvBwQEOCtW279O0aiL98x4VVdLalNBpQAp+a9Lc1LuVJyHGoWsaJTlJpVMqlgVnUJ2WYSQDcRSZE2U82ZRA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYImOXwpk0bVwRSnEp8VFRVWNJMYNtbyCVTt9pIvziXEmjJneTOm
	rve5RIo6isyQedqTW5ShRqgjjqolGp7EiKpiJJAuJCtMrJnSw6w6zNH50ecJGY+TBa4O
X-Gm-Gg: AYBFou0NVM1uVL6YoC1s3qEB3+ialIrX8WcGyGuSd2Yu8Nv4/AUVAyqwXg93PVUzDAI
	n21j5pN8Yl7a5SA7o9SCTseLY2+KkTTbfuMt6rzsrZoyJ50P9uqaM6fHLUitaGJrXmZrBBYNAjW
	v0r/iQeSVf43uP2WVIMS57nelkw5gN90Jwgkby9p8D2YYJVDxmA9bx0JW71wdjGg1Ya803OWEBu
	DCxHST+PFEyE4wNZK0Qrq5GlLiIHwUWtfEIa+LVB5grWwRUu8bqt4GR1FJEiEODk5yLgDoDr52O
	SFAScfJZGRxEiCnz2ykOxlAd2n6SFGEZu1n1x6t3BQTm+htqUoNsZ6+rI+jl1oi4aKwRB0aCiEk
	tcr1yrWqLBU/tCNfNU6EtvA4VXdTV30252FBI7Yp/wwJLhPoTvpajO2UWdNs4XvWb0gUD7Pfr1T
	SnXVntLkJyby8MsWPJG3MEIT4RA8C9h6GjNwzl+O3VX1MP1xc+akT6f20mz9llD5kAJ7nNNY/bN
	Q==
X-Received: by 2002:ac2:5689:0:b0:5b8:eafb:e1a with SMTP id 2adb3069b0e04-5bb93808deamr1308545e87.6.1790970742251;
        Fri, 02 Oct 2026 12:52:22 -0700 (PDT)
Received: from lab01.. ([2a01:4f9:1a:a462::2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7a0b25sm1010928e87.60.2026.10.02.12.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:52:21 -0700 (PDT)
From: Mahmut Emin Kurhan <guvenlik@noroxi.com>
To: linux-fsdevel@vger.kernel.org
Cc: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-kernel@vger.kernel.org,
	Mahmut Emin Kurhan <guvenlik@noroxi.com>
Subject: Re: [PATCH v2] hfsplus: annotate extents_lock nesting to silence lockdep false positive
Date: Fri,  2 Oct 2026 21:52:08 +0200
Message-ID: <20261002195208.1564600-1-guvenlik@noroxi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9f8b8dacee5d24c94185bab75ff905eb51a95999.camel@dubeyko.com>
References: <9f8b8dacee5d24c94185bab75ff905eb51a95999.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Slava,

Thanks. You're right that tree->cnid and inode->i_ino match for the special
inodes. hfsplus_btree_lock_class() itself can't be reused as-is, though: it
takes a struct hfs_btree * and BUG()s on any CNID that isn't one of the three
B-trees (CATALOG/EXTENTS/ATTR), while extents_lock is taken on regular inodes
and on the allocation file, which are not B-trees.

Looking more carefully, there is only one actual extents_lock nesting: a
regular inode's extents_lock is held in hfsplus_file_truncate() /
hfsplus_file_extend() while block alloc/free reads sbi->alloc_file
(hfsplus_block_free() -> read_mapping_page() -> hfsplus_get_block() on the
allocation file). The catalog/attr inodes are not taken nested under a regular
inode's extents_lock (the extents-overflow inode returns early in
hfsplus_get_block(), and the catalog/attr trees are reached under their own
tree_lock).

So the parallel enum + HFSPLUS_FIRSTUSER_CNID check is overkill (and, as you
note, FIRSTUSER also covers folders). I'll simplify to a single distinction:
give only the allocation file's extents_lock a separate subclass, leaving every
other inode at the default. That removes the duplication and the file/folder
ambiguity.

Does that direction look right to you? I'll send v3 accordingly and fold the
same into the HFS side.

Thanks,
Mahmut
