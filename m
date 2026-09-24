Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADE947535D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293359; cv=none; b=QeqpaiM4qKHNIJR7T+fPuz54ROMD2eHzdksYM6MwmBo08150VtJ+UQQOXlXZZUFVyYwUBqR7/WeLfT6sRAFODSSL0zg+5eErSNcJe4DKiwr0laVSOMgt8xnTb6AtQiq3MduQmgp27fiVOWzhq7ZcNz53yqD543E4HFH6mwC3sMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293359; c=relaxed/simple;
	bh=XCd/EXrFmFVFNdHJdolFqfiKIkTkg5kCZkDjHJUVVxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FDlvxib3LDVoqq7n+15skMJLeAouepe33H48YzCDIvpvQtqOjc2+58p0BCLV63/lSKVUj8DW/4BFyhGh2wQG2nbZMNehs0jrjU4feLph3EbTdsooUb2RfK8kvswgnORHKbtVLFdsz5JThCVpyPU+1eO3YTjdFdAZa4ORti20O60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ZDcKAs5r; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=sXwPE9mm; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ZDcKAs5r";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="sXwPE9mm"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMXlhc1818652
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=1W8F
	0tnaOtUsZa7C8naFnLEhuPz2zI+t5temLbb6h84=; b=ZDcKAs5rEPRehiRI6EC5
	SH5pomBGrSvHTOK7zzKw9fLnm8wVE3AoqIhD/Wd0ed9N9fwqRtWY+UNAnRt9k7Je
	fN5/lY1J3n7xVMpSErmL1JoJ9KrWaap/IEKDvqwzwmgSf8ChzKpQTFjn7hoiy/ZQ
	D0JAcTAJvTrV2AMEpyOFttL6o4CgwxieOoVoQsFMU29I0/YJlacSENGMR7UGf7uQ
	fLn2lcMFcbF/vHylpUC1T1gk2d85aR65VI8wJvANXVYJAHOsc6NHr5NiW3ZTa9YF
	hwgHdN4i3Yzx0DIpbFrT4VvlfsSU0ZXIAlZgHBYdpgdo9oPVLZmNwuKdTH6yzQmQ
	jw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gw8y9aqt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:42:35 -0400 (EDT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df375fb9b2so2922365ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790293355; x=1790898155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1W8F0tnaOtUsZa7C8naFnLEhuPz2zI+t5temLbb6h84=;
        b=sXwPE9mmsnp0aBJkbK7WdpJXD58tvx4oJBVGwh2d+DkDZhzZUaaOWFpTX3UJkolKJo
         WqzfuEmFP6mV5cctou4NiV2rEf/gm5f56zLFiRcMAMhooOXXbo/kpt7aqaTCTOV2AId0
         KtD/k/z+Czlrlos4vdyFnL3L7K6Lrx5WOzvZLLIRMGBjrSAfSv+s8afBuxVXYpDwbtko
         KyuyNNM4gB7Mqzh4nzjR6IhBscQP/HpqwfgHtfcPY3TrcvG8sK/GOaL1oga3Fub8AmwW
         26JvfZAyKAhOftTU7alb0BkXl0Zh020o/XEtWYk+twzrMPOIoFs0EdDxyt1PgFXDpMFF
         Yi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293355; x=1790898155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1W8F0tnaOtUsZa7C8naFnLEhuPz2zI+t5temLbb6h84=;
        b=cyX+JJTEy8ZIFEnhZzCDysc1yVKKIhGfcAa4I/oYf+kkcSsfHsZwHqSBsiFuSfmYAB
         NO//d+YW8g/Ji7CyNb9fYoWNzQ0Hg1vrDNRQgsJbKn7tdC2cSsvpwrEQvGGB5p2rxbbb
         EnPHaU8PAxCEDgvvybJj0/N0zM6ysiKMLUvPIG6lbQJgsJQFBra0P93WEu8vE7fCy9Yz
         F20rwoW4NoHJLcA+16qGAkUXO7Bp6zrWwx3N/7WEwR2SjraCJ14HRyo4IeYg7jntoj2T
         F/w17tIxY9g5fuRMWPUNKfx0eVYn4WsQkyKEWPNRn+xLJRqhtzFnLSZTXnak8+8FIWeq
         WJ2g==
X-Forwarded-Encrypted: i=1; AKwUvByy5O9P/yIlpdnDOU/iTIs02tgq20WzFGnMJVHTY3bAeb1ZbmehMnvAa3q0wLNM4fs4AvkFrV8QR2h0Mpk=@vger.kernel.org
X-Gm-Message-State: AFuF++nzFVNx52ch+u3sWJflywlDlrlH66LiuwT8Z2ASDQBIpvd7I8r/
	vtWmwJTrqq4mlShIdggyGmHEpCUH+mg5R5MDCXNcXzEIbLfLQwJiGpDRVdfkyZa8gBIlqfVScSt
	379gjpPtO7J6m39IxyYSNu1urUVvmU55nWdMGMhWoEjkIkU/5UyGDbds899CzGQ==
X-Gm-Gg: AYBFou1KzNN2W5GC9yjiK7s903XKJIhW9qfSqO9AN0Xjopr2NNMlRWdy245kYN7ESO2
	l92sqx/orx5s5aDWldhE1sQbdnyiy68nfAL6tvQyCPELHfTG4VSDjMZHei/qKcySmuM73fdU2cF
	197cYIouFBtRnjX3RlzeCm0qljQkoF8SdCKC+vxwBkhlGGfPwhb1MBxwKzs6OpPSCrNKYk5pHlH
	icwm/e3xKQhETWbXlDl23k54q3dPcg/tLbVxBnFpMocuCnU4G2WdrycwDd0Fx7PUV6nhZLJnYuH
	tw8rw1tSxfroNmRpd4kTZBl0LtpGi2MoFri3bP5ibMYtF2XNPGyeaLnhPHCOg7WZ7ehMzODEPm6
	RPUc5Xgph
X-Received: by 2002:a17:902:e54e:b0:2df:8d19:4fd6 with SMTP id d9443c01a7336-2df8d195231mr14350745ad.1.1790293354909;
        Thu, 24 Sep 2026 16:42:34 -0700 (PDT)
X-Received: by 2002:a17:902:e54e:b0:2df:8d19:4fd6 with SMTP id d9443c01a7336-2df8d195231mr14350565ad.1.1790293354338;
        Thu, 24 Sep 2026 16:42:34 -0700 (PDT)
Received: from [127.0.1.1] ([208.115.110.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fc2e5fsm2239605ad.5.2026.09.24.16.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:42:33 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 24 Sep 2026 19:42:17 -0400
Subject: [PATCH 2/2] fuse: convert fuse_readdir_cached() to use folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-fuse-readdir-folio-v1-2-8dd97e71c1cc@columbia.edu>
References: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
In-Reply-To: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790293339; l=2723;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=XCd/EXrFmFVFNdHJdolFqfiKIkTkg5kCZkDjHJUVVxs=;
 b=qj0VabmVO0Fh8bfnWzyDw8KfPvG5Iph/+qlrfsMnDKdCepaL/Y3lJ9jnXKhmWi67ggghjOtfO
 BT4FWElodnaAlJplzRQnehsh0s0BTg7NzgZKEDolDEfdjKi7FvDiZIn
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: 8MxkCCt79kHGAnz7q7JWM-FfiuUEtXeA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5NiBTYWx0ZWRfX/FUNzxxBtUsV
 ovgyMp1sdB3elhh0nFBPKTwLsb3zLd0PDRy8pDus7quZoa7rz8Ho0QuDi1wTfXWwzuZASI8n04d
 xeCHRSkY5gn0t2bdbkrJk7hEKL65n87gzISceQtkHfnEPPz9rE57
X-Proofpoint-ORIG-GUID: 8MxkCCt79kHGAnz7q7JWM-FfiuUEtXeA
X-Authority-Analysis: v=2.4 cv=H8NOUOYi c=1 sm=1 tr=0 ts=6ab5b56b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=AP5Yue2pfywxtTblp62eJQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=zMwUTx3Gsv8PcE88Lp4A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5NiBTYWx0ZWRfX23iL3NcZN4qM
 KWSjrtRMAEaH+ceYOz2eCP1h/Rnwj7QtZalUjsQn0Ay6nmKfpLAvkcS+OsJwSCqT0PhUnsa+Axx
 X2p66PlD5yqGYrjC/57Wuy/46V8stx3XAz2JqencKp/0Gt+apzXkzP8uJyaW1O7TRlhYNMWVAcP
 rHl0vgIBFYgIOBp6ra4QTJrIPJ4BzuOePxkLmUD3Nz7O9oN+xPOArg8hBZ3WzjedYM/bXlKnFbs
 azN+TKYGXZVqpF7pdXrg98lnzbkh5isuELjqQrqFRTDzUj9DzxR93GZU9O6tO0Rpa86yAu3Ysl4
 Qgt4KH6aWu+tM6nvwBh6rvR8E/4K0bL8iMMdQgcuJJkFVuJd0zpWargoMmE6J54iPJHsGO/r6dw
 YRHttJ0yYm81YYbzaAjAS7WFFspHz4PqMXt411bkOt7J15F/UVRY5zOCxPzDrRuVzANadSmmMU9
 aCwpvFPZ3Kosm5A5f1A==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11915
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=10 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=10 lowpriorityscore=10 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240096

Replace find_get_page_flags() with __filemap_get_folio(), and switch the
remaining page helpers to their folio equivalents.

This removes seven hidden calls to compound_head() and the last caller of
find_get_page_flags().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/fuse/readdir.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index e6b828eb41a5..5e6b3f574e90 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -502,7 +502,7 @@ static int fuse_readdir_cached(struct file *file, struct dir_context *ctx)
 	enum fuse_parse_result res;
 	pgoff_t index;
 	unsigned int size;
-	struct page *page;
+	struct folio *folio;
 	void *addr;
 
 	/* Seeked?  If so, reset the cache stream */
@@ -580,42 +580,44 @@ static int fuse_readdir_cached(struct file *file, struct dir_context *ctx)
 	if (offset_in_page(ff->readdir.cache_off) == size)
 		return 0;
 
-	page = find_get_page_flags(file->f_mapping, index,
-				   FGP_ACCESSED | FGP_LOCK);
-	/* Page gone missing, then re-added to cache, but not initialized? */
-	if (page && !PageUptodate(page)) {
-		unlock_page(page);
-		put_page(page);
-		page = NULL;
+	folio = __filemap_get_folio(file->f_mapping, index,
+				    FGP_ACCESSED | FGP_LOCK, 0);
+	if (IS_ERR(folio))
+		folio = NULL;
+	/* Folio gone missing, then re-added to cache, but not initialized? */
+	if (folio && !folio_test_uptodate(folio)) {
+		folio_unlock(folio);
+		folio_put(folio);
+		folio = NULL;
 	}
 	spin_lock(&fi->rdc.lock);
-	if (!page) {
+	if (!folio) {
 		/*
-		 * Uh-oh: page gone missing, cache is useless
+		 * Uh-oh: folio gone missing, cache is useless
 		 */
 		if (fi->rdc.version == ff->readdir.version)
 			fuse_rdc_reset(inode);
 		goto retry_locked;
 	}
 
-	/* Make sure it's still the same version after getting the page. */
+	/* Make sure it's still the same version after getting the folio. */
 	if (ff->readdir.version != fi->rdc.version) {
 		spin_unlock(&fi->rdc.lock);
-		unlock_page(page);
-		put_page(page);
+		folio_unlock(folio);
+		folio_put(folio);
 		goto retry;
 	}
 	spin_unlock(&fi->rdc.lock);
 
 	/*
-	 * Contents of the page are now protected against changing by holding
-	 * the page lock.
+	 * Contents of the folio are now protected against changing by holding
+	 * the folio lock.
 	 */
-	addr = kmap_local_page(page);
+	addr = kmap_local_folio(folio, 0);
 	res = fuse_parse_cache(ff, addr, size, ctx);
 	kunmap_local(addr);
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 
 	if (res == FOUND_ERR)
 		return -EIO;

-- 
2.39.5

