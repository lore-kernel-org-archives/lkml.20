Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5FA231C91
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775089; cv=none; b=YqdVKL+L4gBth7f5hiHhErBOPom14GOOU4+SqRnuCHG8ALezwMo3z0Xjc9TUz4qgOUvsnidwTN6vSpoGQpSEAfi3mLTw+DnVkLYmgNzN0ArP9mPIGMwQ53xjDkZVBkihLDMVDqXc1HEKB+WQ0oM40PgKeNWOpluBVzsBv/LZv0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775089; c=relaxed/simple;
	bh=ETYuyN4whc9yovikqPJKM+9RAipeEvmeAF2KG9SGHQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PqjDwheDHDQiKwx0PBVm4fxlCPwZusuuUHkNLX2/MuwyV2sTX627AXMTtDUFZHOghF52IT+3jqqCfQY5MqkQJYjVEsii9QnCMycbKttadLDBRyoXoHFRlxnu3fXDB7cK53zEK5Me3YXfYF6FJCrpT23vWTfxwkzoCPz9d3Fxp8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ci94oCON; arc=none smtp.client-ip=74.125.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ci94oCON"
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-cc1bf4744e6so1640717a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788775087; x=1789379887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAp4ART9Vww7RNr3R7LHs7YtaKcM1bWQu00EHChcxAI=;
        b=Ci94oCON18ZL7XG6tX9LfIrUzs0qWGYdmLr71GRP8IVlSusXMvmZg4B2wbFbR+SfSU
         /LYCseng3oE49N6FWAKuKFT7rbAfESyfS/lOlyKe9JHOeWxlkUw8Axb3vygM+WH3gb9E
         nevzKSIdDRIfCiBVUobeq5DUSXxgAUahmRVAZHFHbHmxfYH1hMlHbfKUhebd8JceZZ23
         0apcO+s4vSOs5tXV1UZttWsJ7gA2QQQGUiDOM54XPH/yMJVdj3H1xMkwpMIE1jtVPZGJ
         pPx49+lrwUFUgfb1rQ9mDGYBcFhkP8Ht4/b4IAdr0mpBbSVdkvnlagemSoiN/V4+fuWj
         fUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775087; x=1789379887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAp4ART9Vww7RNr3R7LHs7YtaKcM1bWQu00EHChcxAI=;
        b=eJIkIrrnoKyrJB061H3ZePIOtsgYijY9K2OOrlgZ4eB3i2V2ZWu0h7DG0+A8eHzm9o
         lMrTHB9nCHE+GcjCuPmMTpXZuk+xw41gMIWGPT12RySNJH/Dfmf3tYy+Z8/NdmNPFjgg
         y7PziRn5ZUPogBnAk4InG6G6fdeCyiIhkW+/aFAQz2AwWXYStpGZsSuBnlVnivtCRqs4
         ARfaNXyqM1CRAXI8w7eHF6zfeHvhtMzSlTH+RkrVe4hZ4l3W6lN730MoRCqHohPzLlvP
         REMUfM73g11A8dKTfYkmRUIDXXnq9+Eh8njEUqFsrF2jGdCJM0mpvMpEyBxtZkarWv2T
         Pnow==
X-Forwarded-Encrypted: i=1; AKwUvBxTYySr7mKaUp0mT11sn9Z1NMVBjUC0CE09UHuNi/7l/8wT9c55hZ9zwQhyPtV2l7aRqVSy95AKKTo4hAU=@vger.kernel.org
X-Gm-Message-State: AFuF++lNou1SPOmFTYcGnXk9NaERN524BKzcXoYQf/hVJE1sS5+OJdPk
	Aw6hYaFH3if5+TePdBMdE/9RN9P+8Q2TEzN0riK+4kljOFYriWdBZ5lX
X-Gm-Gg: AYBFou0h1hqWzGbm7F9UdkTPgOSjP0MSKfPMYi4bJLGj6a9Uilxrrsv8bvCjrk1xOp9
	R/CXfFgmbuUPKcmgcAld/XTtAb8IOuYJRccBToDkByruCy4bsazvkOjce3L2lCQefxNwDc5WYL0
	NgsbRpn1jlqmpzTA93pmXsAzZk9KbPtoQwnG1PJfopyiLSb5PERApgKcUnAwK1dJuHA0/xucouG
	nAMDjO+iQA82J1vM5nXrOcs0fjDgoFaT+/WIJEWBAMGne9w4nUkJnHOcsEJQBbm6u4GeYg95d7u
	IzE1MuP+j2EWOB55qT67vVXR6MTKP8nXqZhrrU0pZ1cUFEgbtSGSHu36W79VjhPk9g+xwxtxR26
	JYcVOGeX9APCIPZ1PE3Dv7tkC9eOEJbF/4aWCi9oB1C2ZeQUBvVH14jY+yBSIvOX9QAkYcfCRE9
	BQJypa1i23MtiQe0XsY01MWnthxFYMAkA9sB4dF0pfRofRUipoqQEA0F5sJOl/XsBtdV6FSkby6
	qe7z/nVgCZUVVvE0XBxPK9SZA==
X-Received: by 2002:a05:6a00:2c97:b0:857:7337:5db9 with SMTP id d2e1a72fcca58-8616af6486fmr28939025b3a.23.1788775087454;
        Mon, 07 Sep 2026 02:58:07 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152d32addsm4065080b3a.34.2026.09.07.02.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:58:07 -0700 (PDT)
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
Subject: Re: [f2fs-dev] [PATCH 12/14] f2fs: handle block cloning within the same large folio
Date: Mon,  7 Sep 2026 17:57:59 +0800
Message-ID: <20260907095759.2461366-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f1ffd3a5-9fdc-4f26-bd9d-5f55e563f800@kernel.org>
References: <f1ffd3a5-9fdc-4f26-bd9d-5f55e563f800@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 16:19:05 +0800, Chao Yu wrote:
> A lot of codes are redundant, can we add fdst = fsrc;
> So that we can replace fsrc w/ fdst, and clean up the redundant codes
> below:
> Thanks,

Thanks for the review. I'll restructure the else branch as suggested:

--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -56,25 +56,66 @@
 			f2fs_put_dnode(&dn);
 		} else {
 			struct folio *fsrc, *fdst;
+			size_t src_off, dst_off;
+			bool same_folio;
 
 			fsrc = f2fs_get_lock_data_folio(src_inode,
 							src + i, true);
 			if (IS_ERR(fsrc))
 				return PTR_ERR(fsrc);
-			fdst = f2fs_get_new_data_folio(dst_inode, NULL, dst + i,
-								true);
-			if (IS_ERR(fdst)) {
-				f2fs_folio_put(fsrc, true);
-				return PTR_ERR(fdst);
+
+			src_off = offset_in_folio(fsrc,
+						(loff_t)(src + i) << PAGE_SHIFT);
+
+			/*
+			 * For same-inode operations (collapse/insert), src and
+			 * dst may fall within the same large folio.  Detect this
+			 * to avoid self-deadlock on folio lock: in that case the
+			 * destination folio is fsrc itself and only its block
+			 * needs reservation.
+			 */
+			same_folio = src_inode == dst_inode &&
+					folio_contains(fsrc, dst + i);
+			if (same_folio) {
+				struct dnode_of_data dn;
+
+				/* Reserve block for dst before copying */
+				set_new_dnode(&dn, dst_inode, NULL, NULL, 0);
+				ret = f2fs_reserve_block(&dn, dst + i);
+				if (ret) {
+					f2fs_folio_put(fsrc, true);
+					return ret;
+				}
+				fdst = fsrc;
+			} else {
+				fdst = f2fs_get_new_data_folio(dst_inode, NULL,
+							      dst + i, true);
+				if (IS_ERR(fdst)) {
+					f2fs_folio_put(fsrc, true);
+					return PTR_ERR(fdst);
+				}
 			}
 
+			dst_off = offset_in_folio(fdst,
+					(loff_t)(dst + i) << PAGE_SHIFT);
 			f2fs_folio_wait_writeback(fdst, DATA, true, true);
-
-			memcpy_folio(fdst, 0, fsrc, 0, PAGE_SIZE);
+			memcpy_folio(fdst, dst_off, fsrc, src_off, PAGE_SIZE);
+			if (folio_test_large(fdst)) {
+				f2fs_ffs_find_or_alloc(fdst);
+				f2fs_ffs_mark_subrange_uptodate(fdst,
+							dst_off, PAGE_SIZE);
+				f2fs_ffs_mark_subrange_dirty(fdst, dst_off,
+							    PAGE_SIZE);
+			}
 			folio_mark_dirty(fdst);
+			if (same_folio && i_size_read(dst_inode) <
+			    ((loff_t)(dst + i + 1) << PAGE_SHIFT))
+				f2fs_i_size_write(dst_inode,
+					((loff_t)(dst + i + 1) << PAGE_SHIFT));
 			folio_set_f2fs_gcing(fdst);
 			f2fs_folio_put(fdst, true);
-			f2fs_folio_put(fsrc, true);
+			if (!same_folio)
+				f2fs_folio_put(fsrc, true);
 
 			ret = f2fs_truncate_hole(src_inode,
 						src + i, src + i + 1);

Thanks,
Nanzhe
