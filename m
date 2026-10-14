Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E84B471416
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960372; cv=none; b=raAw6+vwCA7yu69Nexdk1sOU3C00sYANd1aVnJGS1vBxYK8Dc9ZddXwH2oZHaN6mlYHEs2mN82EWDCGFDM6bQa8GjTWPGG6um5wxlomABAtVt3hyrjwAbkv/mIUqllBGz7Wmfy+hOa1WKLpKKQfKD9QhNEYpAMq16mnGRaAcAv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960372; c=relaxed/simple;
	bh=h6qSAty50ZjhpdBlyxDqW2A8q4uhT9WJLCFnEegZgYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhHy6cBdFqQ0BuSys43+RbQ/EAJDcs5993x8SuSgOYoUDK0N5chyKgfYsgFNhBGR+8/7vDWvk8vsxiq/ZfqoNDJ+ZeG88BHlZNFvW0xLcD/THMl7SQ2zQ80LU3HDviVRlrvYBQS7Zzyz2JNq3b408GrVovHVSiyc6GXlQO6U/2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8CbDjlO; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8CbDjlO"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4fb64d2so1652994a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960368; x=1792565168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BSqO/zhHgRFW/+OIlp26uOSe1RZSVmBUuUAxntrjdec=;
        b=Z8CbDjlOwTwReShzvFQYyEPB+zngezsnfxkDgNLA/SIaFEnXwMzQWKCogM3llsCum6
         hZ6IzhrdT3cbHrskfzQA/chzkiNzvzPJk+e2qNR/nwWQ2ESOUwqsUo3FAAWGU3B4XkdK
         IRYAGUKaJPIBtvUonviJDazDD6f1O80Hl3YNEz5kVi5NMq4RFefghsJgcPNRe30WNPU5
         eYFFNjWk8dW+ts5h0vVJsmaigvpyksWiNrHLlPXmWW/wmDITCp1zdJPi1S3uGsz4orXN
         794NK98+LrGBIKP2XEUPVSOCzj8Z1/JeaVSUH7AyB16UaT0f9c78RV0jTRGqcJ4qP5h/
         8SaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960368; x=1792565168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BSqO/zhHgRFW/+OIlp26uOSe1RZSVmBUuUAxntrjdec=;
        b=dnKLECp4RPTtIZiviMi4uXiRghh/64bWJq2ziRNk0MZkPSb+JPgQ0GP2Py/UFTJLa3
         s18ucIcYmWupGVDwZU5vp0x5pWufmzEhMH64+q65VE1h8UBz38w4dJHJJNgN+41WvZSJ
         MDWWHFhzp7TC3buiWcFN8m3bofpZaDN2iaigumGnGiNJuXHZJW2vLEy7/BKg4KEgbUVX
         I0pS3KCuSdS3PNsWwlAAmrWEl3pYAtonyOH2u7VtIlgjUkt66pDN5B6ef+JCUiTpaD2x
         pIg3o888rxGPR03NKoV/fefYQBSGPZ6geAXEC+sviLIyM2/72PGSGYz541q72Ib4Zfd7
         9yTA==
X-Forwarded-Encrypted: i=1; AKwUvBwIE8u+tM5UgPJAYco0Sm0HB+mnhxJm8ERoOX5ninyqA7nxx7EuiNK9MsK7RbPOHvUrA66oNDOKDdV7/fM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgGoddEsG5tjhUgB9XY+o0r6Z7km27/64bJQslrOQN00yL5gW6
	LGEW2A8YeVYH8ggOmV/vVhH7DHN6Zx6X7dZHSCZcmE8Tmr7k6Drnpw8S
X-Gm-Gg: AYBFou2A/CPIE63K9AjIs0tf6WCiLTQZhfAJj34mjwRHeN1C1gprEzb6dfUK1eZaWee
	iV2yyOYRlj6e83Y2S6aL53KohYE/cW6Ja8cV+sceF8pRrPX2I6DQswAMlLoGScj/qNouDLi7b7V
	F8Ciwa8Cnh3t4gYcZq9Y59V74LM2s4nehD1EnMswMUst8yWgMNp59pMDe0C/0SPt6mKnU6z5NbS
	vmZPr1QmhhH9O2JqxhkofhRLU2Y8sdoRFZE2S2+KK4XOUcKT1Wb7ACdInrM7smLV16zRO39+hwz
	tBUaNYCTNpSaBG54YG60P2pPXX/K9Pb5VUpCyvVo+FrGQtRtCkkToe9zn9ptkhrJL42jjd0zFbo
	k4kr6ewCpcjw0JQxjv5+i1ohxyq7iNQUsBMnn0SkLOoK6TqZ3Etrozhv0WaC863Bjyj0tXsHzaz
	lJy5/EPNAHnnp8PIfCpP2r0VaqIzCorc+6UTbWADg4t5qoBRj9Ntm8mjtV7gG99E0dojnesQqPl
	qyVpEE6vzEqiuzO0Tk4YB6uBx7ZMgs9UaQQ
X-Received: by 2002:a17:90a:c10:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ac7556a3ffmr429550a91.26.1791960367573;
        Tue, 13 Oct 2026 23:46:07 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3236371a91.2.2026.10.13.23.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:46:07 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	kernel test robot <yi1.lai@intel.com>
Subject: [PATCH v5 12/16] f2fs: wait for folio writeback before ffs_detach_free
Date: Wed, 14 Oct 2026 14:44:41 +0800
Message-ID: <20261014064445.2835813-13-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

truncate_inode_pages_range() can invalidate a large folio that is still
under writeback, which can result in the following use-after-free:

 CPU0 (writeback)             CPU1 (truncate)
 ----                         ----
f2fs_write_cache_folios()
folio_start_writeback(folio)
/* submit bios */

retry_out:
folio_unlock(folio)
/* all bios submitted; folio lock released */

                              truncate_inode_pages_range()
                              find_lock_entries() /* locks the folio */
                              truncate_cleanup_folio(folio)
                              folio_invalidate(folio, 0, folio_size(folio))
                              -> f2fs_invalidate_folio(folio, 0,
                                                        folio_size(folio))

f2fs_write_end_bio(bio)
ffs = folio->private          ffs_detach_free(folio)
                              folio_detach_private(folio)
                              kfree(ffs)
atomic_sub_and_test(nr_pages,
    &ffs->write_pages_pending) <-- use-after-free

Wait for folio writeback in invalidate_folio, then we can free the
folio state without any other remaining user.

Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202610081027.b13dcf10-lkp@intel.com
Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4228c26bee0d..9cd1c34fe6c8 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -5470,6 +5470,14 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 	}
 
 	if (f2fs_folio_has_ffs(folio)) {
+		/*
+		 * The folio may still be under writeback with bios in
+		 * completion that need to access f2fs_folio_state.  Wait
+		 * for the writeback to complete before freeing the state,
+		 * otherwise it will result in use-after-free.
+		 */
+		folio_wait_writeback(folio);
+
 		f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
 							folio_size(folio));
 	} else if (folio_test_dirty(folio)) {
-- 
2.43.0

