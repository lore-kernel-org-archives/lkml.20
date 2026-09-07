Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E332F43E488
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775970; cv=none; b=nXaYCeIZlXfl/LGWx/qKWXXz7p8wLk3VoVANpll3YncT6EXkjLW9ERb6ZGoVxL/LRG7z8XtMXiyO4hRcmhiFuevuMeaYPkJMP7rMRnGnnAqWo6sPpmGYZLwlTJ6dgDUKNkyJNbznkyzZELHhs05aHgk8wu9jzEK3m4TYyW/LBq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775970; c=relaxed/simple;
	bh=OUmhA2H05xyVmpdgyoC1sh5X5yzm/jtOq2yGwHl9G6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMy5L1laFdkPNKWCpH1ixfpArPZIrCPcU3P7PfTyJBcnRQAtnHvC7szTuorxQew2BkPJC4cVUBcusovZ4sTj1xqAAa5XBiDXgyim//OeqWm2SGvhguv6Sy5plLt5gXrIWEmpsZxTjZM4JD1noiuwFU8k2wBFCYnZbQO3vHg/UHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtxWbx8w; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qtxWbx8w"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-cb01d87597cso227952a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788775968; x=1789380768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYit+0M3Anf+oK4LLlIn10R8RMC5TUMRVTb/lweoMsw=;
        b=qtxWbx8wHvn9t+Z+KGGRv0+n66dcA2sDkBCedDYfHmeQQUdwF1IdOHIy1NvlHa9HVc
         aQhuSfx1jJxGgrLnzOwqIivLGMtEHxNnWexTG4OSPF9fTp2sKXJ2bwCXqwmduWPlmyGD
         wVlH+PaD8/qCNzoQY9wei8ba8yrHg6DrJQvasW2ajfGEyLyqQG3YpzvwavBJK3u9uMZg
         OQ4pX0GJU9JfAZK7vgxySxH9Qoa387nMzG5+AsrP4Ng0W+4pmMqIcMnxIVd80PxSAvxc
         oKEQtUYF2FXAr6UsnEqOsl0ysWA6XXN41U7cAbIQFKOEIkqTNm/OmLtIyILkSvDDyOgS
         A02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775968; x=1789380768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYit+0M3Anf+oK4LLlIn10R8RMC5TUMRVTb/lweoMsw=;
        b=PS029KndAQcAyDoiOj+YBCTgIgqeEAYaF3v7dkQDRKWdlIhWuQlmkhU7QtBh7+ra6b
         IuG1Tk9pRXPZgL5wMpwOwG+veBUpijcT1a3+zgP31Q/v541mU4gmOTAYXXDTeWfaPgTW
         cTcf8SK8XJZCon+T6l8DM7lzHRvADQMIUfR+65Op/kAdKzEZ9yUpWJSNDBIifBQ0nUOB
         5kvPn4+R3/PcL+02f0djsdTz2t+Hx+9jGB7wjsnjPsULGKgmJWK5Bdh3D/hUIiUfGkIX
         aqJdSLTa4RdCCqZrJvnm9CJhBzlp7kr4p37CPM/zUVb3NlBfpbHM+ljXVS5Ha4fIwCmV
         DeZw==
X-Forwarded-Encrypted: i=1; AKwUvBy8Fun8jPQOHFkPX1oonfATjtw/9859KhlR0rrvLPA+TJBC1Rhq1b3ivVWyVCREpLmuw+QPZYV8S+nccNw=@vger.kernel.org
X-Gm-Message-State: AFuF++lKTV1btux+M8eNSdSPTWdA/7MeAATvR1HwEzTCyz34v6JkUzTY
	j13w7RegX+ylq3Ytxnv6FjXCUBkogKkyQjPYMx3jDIRbytUsI3cW+/CsNFY3e3D9eQW9Pw==
X-Gm-Gg: AYBFou20sKyh3a8Z4IP6/gRQ0UyDMLJJXAFw8VqNtLnMQvA4+6XzfgNdONgwlFhzWQa
	cVTH85J5I0pOmkbyBhO1wmFcCXo7aBjWGq4CtYL3Byit7FxJwIgRVWc2/AmRAPDpoZBv5t3CUNL
	3hIoUg4RULSLN2HuZq/QP7GJ1EgRgTJy0D2jzt8FhWW8IQn0O4Euu7sN3xHu42Tet0hUuqeTFk6
	yAQYbN+v5y/rNDZgZarmVGYruSB+cfhy/Pqau3lKGhYJbOPLi6W3GX7/zhDlnkKi12mcxLbojgX
	5BaV89/BHtWS7waNWNVgcLrpPpVvto595zeCuGH+NxcLb/pjVHBdpBburzeHfkfWO4G3yemIKqY
	ox6w03SoBvMXVDa9E1UQWSkG5cTjRZ7xsQeC/AsQCLSDiO5G+uFKv2TeqvAH9zfTAbbljMDsg61
	H5iMfFuGehLjf1aGgkeCl6hcVC6dcwX9zQp5OZ4LOAHzgQBiudFid9QTpz3hqj8/O3mmKZL5fV7
	8XLEhQiJECgXylgdi6otNf5MWfR1uTJ7qO3
X-Received: by 2002:a05:6a00:4408:b0:857:72f8:dca7 with SMTP id d2e1a72fcca58-8669b422078mr12409b3a.13.1788775967843;
        Mon, 07 Sep 2026 03:12:47 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615273da5fsm4112935b3a.26.2026.09.07.03.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:12:46 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
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
Date: Mon,  7 Sep 2026 18:12:38 +0800
Message-ID: <20260907101238.2475724-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_yjqS5DDUxQdiqbQZLdXW-fQzHmVPHf32bdBhwth=kLOw@mail.gmail.com>
References: <CACOAw_yjqS5DDUxQdiqbQZLdXW-fQzHmVPHf32bdBhwth=kLOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 15:39:19 -0700, Daeho Jeong wrote:
> If f2fs_write_single_data_folio() fails on subpage 1, jumping
> to `out` unconditionally clears the dirty bitmap for the ENTIRE folio
> (0 to folio_size),
> and decrements the inode dirty pages.
>
> The unwritten dirty subpages lose their dirty tracking and will be
> discarded cleanly
> under memory pressure, causing silent data loss.
>
> Fix: Only clear dirty bits for successfully submitted subranges (`0,
> pos`), and redirty
> the folio if unwritten dirty subpages remain when an error occurs.

Thanks for the review. Agreed.
My change hunk may like this:

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
@@ f2fs_write_single_data_folio():
-static int f2fs_write_single_data_folio(struct folio *folio, int *submitted,
+static int f2fs_write_single_data_folio(struct folio *folio, int *submitted,
 					struct writeback_control *wbc,
 					enum iostat_type io_type,
-					u64 start, u64 end)
+					u64 *pos, u64 len)
 {
 	struct inode *inode = folio->mapping->host;
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	bool atomic_commit = f2fs_is_atomic_file(inode) &&
 					folio_test_f2fs_atomic(folio);
 	struct inode *dn_inode = atomic_commit ?
 					F2FS_I(inode)->cow_inode : inode;
-	u64 pos = folio_pos(folio);
-	pgoff_t start_idx = (start - pos) >> PAGE_SHIFT;
-	pgoff_t end_idx = (end - 1 - pos) >> PAGE_SHIFT;
+	pgoff_t start_idx = (*pos - folio_pos(folio)) >> PAGE_SHIFT;
+	pgoff_t end_idx = (*pos + len - 1 - folio_pos(folio)) >> PAGE_SHIFT;
 	int local_submitted = 0;
 	int err = 0;
@@ IPU/OPU common write_done:
 		err = f2fs_inplace_write_data(&fio);
 		if (err) {
 			if (fscrypt_inode_uses_fs_layer_crypto(inode))
 				fscrypt_finalize_bounce_page(
 						&fio.encrypted_page);
 			goto rollback_no_dnode;
 		}

 		local_submitted++;
 		set_inode_flag(inode, FI_UPDATE_WRITE);
-		continue;
+		goto write_done;
 	}
 ...
 		f2fs_outplace_write_data(&dn, &fio);
 		local_submitted++;
 		set_inode_flag(inode, FI_APPEND_WRITE);
 		trace_f2fs_do_write_data_page(folio, OPU);
 		f2fs_put_dnode(&dn);
-		continue;
+		goto write_done;
+
+write_done:
+		*pos = (u64)(data_idx + 1) << PAGE_SHIFT;
+		continue;
@@ f2fs_write_cache_folios loop + out:
 		while ((r_len = ffs_find_dirty_range(folio, &pos, end_pos))) {
-			err = f2fs_write_single_data_folio(folio, &submitted,
-					wbc, io_type, pos, pos + r_len);
+			err = f2fs_write_single_data_folio(folio, &submitted,
+					wbc, io_type, &pos, r_len);
 			folio_submitted += submitted;
 			if (err)
 				goto out;

 			nwritten += submitted;
-			pos += r_len;
 		}
 ...
 out:
-		f2fs_ffs_clear_subrange_dirty(folio, 0, folio_size(folio));
-		inode_dec_dirty_pages(inode);
+		if (f2fs_ffs_clear_subrange_dirty(folio, 0,
+					(err ? pos : end_pos) - folio_pos))
+			folio_redirty_for_writepage(wbc, folio);
+		else
+			inode_dec_dirty_pages(inode);

Btw, I think the name f2fs_write_single_data_folio() is misleading now
that it writes a dirty subrange of a large folio; would
f2fs_write_folio_dirty_range() sound better?

Thanks,
Nanzhe
