Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA323F1052
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753091; cv=none; b=mkobGDd7wGmMoYYYgTd4NF13+wLSI4MU49IZvBAnKfOLFzQAYg0Ghl07iHWlrXOtzCHa7jTPNoFTVLJdJNjpkP3HZb7BUbzspP4Yjialaa8DZv8/UMaaTI0yoDNx+aBjk/A/gpXbXFQMzV9T5UE3xv2vg8pUyIE3JQwhpuUZ3rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753091; c=relaxed/simple;
	bh=1MOZYLH2mOkPUvHy4LeoT/VPaMZv71iTepHkt6iO008=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BiWARla0PtFuigmlCD6R1g/tucqojRIVSo5szEJdHfwRM4di+cMVbprjelZYj2wfCRDAxI+AMipgQDeS8yVQKQOqFeGMNxmNB8MqBF9YaRXOJMrKEhxRJYVySFRg+AnCzwF1DYmmTDVrZzPIjn6SZdyOCxM/ByKlQefHc9hnBeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJhcq+6+; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJhcq+6+"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so1679105a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 20:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788753089; x=1789357889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdRZIDgItCQZ5/FdUiskE9UYifheu4uDMl/LTZhZiVM=;
        b=rJhcq+6+8VhTZUcCpGK8NYmiW/DK/sNZAJysW3uaJ9wBPrFnnCMdqwZn3i8ZX/cVKs
         yu1eEtl2GSL5XqRVSLEcpEL231YnnbocTWZdRwyGCLDFWJxRJJFA4YGWR2sHbxH2Ru7t
         KbJWXpMkaR7zoQxkMrV4xA2tQHeRNbDuX967khYp+MO1o2qc36tJUavm8wayUt99s0td
         gOkOk6Leb5vFqjw7dn6jQr6rUVSszpljEJ3gEja3uJfnFkxB4x10dQ3I6LW8ndgF1PD9
         v9//Mk/MMLKpVGxpKJk1KmolXDXqQng+1RaBFB1apZNnC+zs8ZDPvt96WeVaIWWDGVnl
         xfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753089; x=1789357889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdRZIDgItCQZ5/FdUiskE9UYifheu4uDMl/LTZhZiVM=;
        b=pGFNX9Gv6QUfzcdunQ4OPf4ZEyPu08WufnKGhkXcn2xj+Knf9288++E0PrmRsdZQTR
         qe7kcwVYuXTgFabHMYjH8OhFcLjiEBpiZvHw7R6kVG7W3aMNatR5Wu2g+UvnXEgvSIXn
         UvkbJ6n6SAMT8jZUFhbqXevR1egTbl3f/bmILp16KLg2feh3DpWUyako9THG5v8xI4HP
         YpE+OXHmN/y6VFL0GrPTJw2AvN+8qVnKrB4y2NKQtbPVrj/jTU0bL8p869GIF1kwebz/
         OFTSgKXNojVoyYoBCCdfCFEiSty+9rP3GTbzLgOUgK++HwAE3QL4X4e+yQiXeLhqaEpC
         grkw==
X-Forwarded-Encrypted: i=1; AKwUvBwfdLDet44bdgETMNy8ASoi9cY6GRUxYhzp/lelyC8wPehtEi+d9yml/DMfSQ45lBiUk6ElE7lHYmiaIdc=@vger.kernel.org
X-Gm-Message-State: AFuF++kJkZbfKdHM0YoYPMezSdpUqrP6PQZjuTLf2Z7IexFOO9WJSaeo
	jEyaSBMe+dF/47YRUdSkn5ljw05xeyCPFVBWaDiqKOacfcMbRNaXTxcJ
X-Gm-Gg: AYBFou25I7ndkzJiGxrV0sVVr/hnfOcTb3UaxJV6Y71l6TgBIvPa5xdfkezNE/ZJoXh
	iZo/8jh3c1INU2ESvDQrVRtQS1Kif9c8WXMBMvCrCmyBG6Cb+0cy2/AFQgE5vpLYYNh2vC34ice
	QOIUm3YELvM3ZNl3Zm5ZX+3s3/NjCsEOe9gPr9s7wuaKn+P7iq+tynWwSO8/3FYoW5E95QNV0Od
	YpYc1lg8ITkXSsfk2cg1D2qFmBcebD4zy06lSj1gA7+VHZ+hqcf9d43Pd/kJLBXfpiWq3R19SfX
	xFkVuNiBQGHEA0R9dG+QaHBaeSoRR/iu+EifsbVU30lKy8j3jt6XAX7kqcnRWJCP2ydNU/5FBBq
	0SGtQdHEGkpEM3mGKE1Bh38+7HrzjVhMrKJj8mBmepc+x81ctfyVt70oV883jgatzsahdZPO4U8
	hwx8HgQxTQCmUQgluWq3FP49GvKqjPxdTlEPFNYESM5hDj43E32/9fr19xt3uhxNC8gQHvZOviO
	xG0xKRfaaLQtFfu7SCQb3pwCA==
X-Received: by 2002:a05:6a00:981:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-861650e9760mr23651640b3a.0.1788753089174;
        Sun, 06 Sep 2026 20:51:29 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-861527382f0sm3753835b3a.24.2026.09.06.20.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 20:51:28 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 05/14] f2fs: support large folio writeback
Date: Mon,  7 Sep 2026 11:51:20 +0800
Message-ID: <20260907035120.2183257-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <12ab1762-e635-42d6-ab0b-e3358e3b32c2@kernel.org>
References: <12ab1762-e635-42d6-ab0b-e3358e3b32c2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 19:17:33 +0800, Chao Yu wrote:
> We should not relocate dec_page_count() above f2fs_in_warm_node_list() to
> avoid racing bugs.

Thanks for the review, I'll restore the order like this:

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
@@ f2fs_write_end_bio()
-		if (f2fs_folio_has_ffs(folio)) {
-			struct f2fs_folio_state *ffs =
-				(struct f2fs_folio_state *)folio->private;
-
-			finished = atomic_sub_and_test(nr_pages,
-					&ffs->write_pages_pending);
-		}
-
-		while (nr_pages--)
-			dec_page_count(sbi, type);
-
 		if (f2fs_in_warm_node_list(folio))
 			f2fs_del_fsync_node_entry(sbi, folio);

+		if (f2fs_folio_has_ffs(folio)) {
+			struct f2fs_folio_state *ffs =
+				(struct f2fs_folio_state *)folio->private;
+
+			finished = atomic_sub_and_test(nr_pages,
+					&ffs->write_pages_pending);
+		}
+
+		while (nr_pages--)
+			dec_page_count(sbi, type);
+
 		/*
 		 * we should access sbi before folio_end_writeback() to
 		 * avoid racing w/ kill_f2fs_super()
 		 */
 		 ...
 		if (finished) {
 			folio_clear_f2fs_gcing(folio);
 			folio_end_writeback(folio);
 		}

Does this look good to you?

-- 
Nanzhe Zhao
