Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312D2547076
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175499; cv=none; b=Rf6t68Ch58EUeAVJDo6PvyGsaCCtUAkkOnDMWRPUepQdXQRws0H8eqt/Yr4fsixvhSbxHuR/WtX1DN30yiuyKQ0d32PDoII3pK8XBZS6nZZCj2yDTSL4pftHZijwMTGEeyhqyO8PWX1azrWisC3yHTcPmVvzJPnN80DIQ4h8E/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175499; c=relaxed/simple;
	bh=x8vvF5qS8YMr2iEJTC+QZyR/N21tB0QY5FgJ/RCzKxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKyIOq/UeV6tgH/LdtftFrBwJMDiVh/ZtoL2gKe3RzXjbc216UGJ/I8GvduqWHpKxAPDYzY1zrSZnuuTpSUhq28Ddwa/y5KPCSvC5iv0TL7L11eFhAgt1ctkqbpiZyogl/0ioGB7+iMjYT3bKpJ2jmiA6uSbd3+SjTNV/aTZO9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=jp7yFhpm; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=31IoIEmL; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="jp7yFhpm";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="31IoIEmL"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GGXx9l1375564
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=XIiA
	j0L1SuTmikxb99uSi4FdXmLmG93cHg4VqspIFQM=; b=jp7yFhpmpzE7wvYpFb20
	64XHZXBPcBnzdMqPqOr7eVpzsOOE/zHakYpECbVlQ4Fu4bXRGtLUOUICjRIQUKZN
	Cwk3qgEX2gf9zw/WFpyooaR6Baeg8WLYBuZbAhqRU09QqQaVK+zWxrKY5GtnC3up
	wBIVcivN356Kd4nJ6ZgG8jDSasqA8IRv/3Dp63gW3q7eKGMpYipykUlyxAeIMQm3
	3ExTeuVLZ1lPo/Al5jnU3x0jRXb+D7cDlVo7cdci5D31skNd8VUVPto/2WzGg0A1
	MFNTsxA5lZI6SuY2TTXCLLVw728aHnRZcB9pfptu5EkrSQlOVNjV73KezRm+IPFO
	kQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hbpkq9hn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:37 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a556c43so4963806d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792175496; x=1792780296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIiAj0L1SuTmikxb99uSi4FdXmLmG93cHg4VqspIFQM=;
        b=31IoIEmLZuwKlRNjwQXrxJeTguedXuOXQFNDfww/5+D/RnQV7lZKxSPHMxckKHchJR
         oALL+1K5PFAYYJVUcFfe8kQ0OuvyQYElbe3CNbZLJyzPcnHWJazSVXwIO37VBPC3dYci
         bZKuUrNoJc+UWITZkL5AoSKt5tDJuMU0fjvR3UxVZ6RuNkGoGu6F/Upe6Dfzc16WRmMi
         5ZwwHYug2c8C5kdmWH9y94+mSz2jwhUdBog/oXn8qU+6EVhefNP7SYM95GhWpDKgr3Xj
         5pZGqFC0yVxxKnOPEw4EsWxTjxi6vYjlQ/85RWOwqlwyGNTU7nBz+1zj1ZBEiunursxR
         D53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175496; x=1792780296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XIiAj0L1SuTmikxb99uSi4FdXmLmG93cHg4VqspIFQM=;
        b=uHI9WaYYZESJbhcgpz6JzNpOW270eYRHzUiP9MdChj/5j5+/Hdjcu0dHFG27qxaQac
         N9XbRigdrunqkXJ9YIEGrLohVgZYBXja7G2Ie+czgdJTW3gahm5GMnMo04K2h6R+Ser5
         VbAyg8H0dtiIFZzhVOTKVQb3TLU1GGUXI5YR40cPhcO4IdoILOLRYdKFgBFETDIMLg2Y
         jNNB7t2Mk5ct02ctaxHyTYjUo192TwtO7A8yI7hQ1JdExxZt5TSPpBwz1/LR0pjj2f1X
         TSm0tF9I+UzyFRSPqvRE4ueGTjVV3kL2ZqNPRFySg8ebgZLqXGcq5pGGcH2DLuYl6Le8
         R1ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHO/X1ZxUiWU/8tY90h2tgDIcxYCqMeyvXLJ8N48U80TjIcqvQlfi3aGglTrUVBqUY8GmKAjY86tCVCPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD1RT7GwteiKYcV2RZv6j1umvg0bdUnby4Pxggu1qYQcXw1v+0
	NmkGZ0zWWF7JQz5qKn5dR7/9VcSjLEPFc+0xPy6ltFVwTfyBbQkAABCkXXAVaHGI60+fNVeHidv
	rpMNEFyelKFe2/GU7WRDtvz7YpTyOcG0So4UreUOqqCPiN2EHyXEJ198e7H3q1AVKjBgIuw==
X-Gm-Gg: AYBFou069/9BPzORoZU11OW2/6twybDaPyt9kkOOtaAtVrf7APZCzll5zpuQfkbWWcN
	eORAA6qLUheUD8Wpk2obbinp3kyp/tpPV+LGwtfsUKSIMreFj+134PdEf54+7tBK8bPDIES7iSb
	g1eUIPWywodHk99/NHQlNx3E67yAUUam/qasWjwnPx/9SyLSMmjuleGkb80LXo2bDHnwZyd9yu1
	r+Y5Ny0HcdsZjqYG51ioScFThXg6d0wlcUeXCiekJDINIWsqVC9EZCnlxIpKDH1Kn8gLC0Tl9Eb
	DJswEArINFHTl+vRqlW/PNjAthbIh4anwqx0rTG7qXOMYUv7yL2z0NeFk9Ciho753ch0I2F6v/t
	Gk+LxyMs3sQtyTezPJdNR6854ClIwLznPnoGJJOxzrrWFcrc=
X-Received: by 2002:a05:622a:2293:b0:535:20cf:96a5 with SMTP id d75a77b69052e-53645c4106amr5449291cf.7.1792175496471;
        Fri, 16 Oct 2026 11:31:36 -0700 (PDT)
X-Received: by 2002:a05:622a:2293:b0:535:20cf:96a5 with SMTP id d75a77b69052e-53645c4106amr5448831cf.7.1792175495905;
        Fri, 16 Oct 2026 11:31:35 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb30509sm29187696d6.36.2026.10.16.11.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:31:35 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 16 Oct 2026 14:31:19 -0400
Subject: [PATCH v2 1/2] mtd: rawnand: nandsim: use a NOIO scope for cache
 file I/O
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-nandsim-nofs-v2-1-f705c8819d11@columbia.edu>
References: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
In-Reply-To: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792175493; l=1940;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=x8vvF5qS8YMr2iEJTC+QZyR/N21tB0QY5FgJ/RCzKxw=;
 b=/fZ6YuNI9nC+fDTLTqHaqFZ+n68DizBKtmZjXDMAb07/IisxLEovqXWlWX/A9KHSE3/O8+e4a
 O4OBsNTS87FC+hPA+hasmbmBALLwr/6l6R1wYxJ/y5/4wLRXvIrhV9a
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfXzFsFg2E2hjK6
 E88IteWFtccNsQAnfzBLoqoozIShtdqxhV5BXOe6wf31QtgfCFkr/5Sreowm2jagnHwHwQhfJqw
 8Gmt6MmccYritdk0FTnzVA00CyIFwsrgg5O062887g9hDZPOhpc2
X-Authority-Analysis: v=2.4 cv=bv7Zl0ai c=1 sm=1 tr=0 ts=6ad26d89 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=xz0OrRJCyJRxHT_uhz4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: I4E61_HVJuXLcLUc6IokcI7JXwfjlsdG
X-Proofpoint-ORIG-GUID: I4E61_HVJuXLcLUc6IokcI7JXwfjlsdG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfX/RTP+BHwXKS6
 wa0tNdb+uTtdDF/kpo6ts5/OLT4bAY7zULZ+ftR17L10kUThK8XvXOhUUt1hqs4E5PRlpI75uOY
 0NwIb501Y2kf8CrKfVQkB+Hrxvtzh/eYPcG9HBkwgTmRG4zVpoRPFmWLJim3n9WrsU3Q1OkmgVK
 /M+CumeCBSBw8pL4VcjkJDg9+tG0PnYzg+MPZDuzO/S8aEiXaHKqi1ubapTsgVjlhUyKgzJ5DuT
 3Qjn8mGYDhV4Yvp2PPxCDAF8LAlLefjx7yOMmORTW9Q4AlnPLpG+1TxqQF9S8LEZYAAd3AVcCZu
 peKg5GJnImPmGkrMTmgNIa4e/HVil/AVSxkSI6n547ITYb+VdKsYyzqIrmKy7O5CmDpbRdP7myD
 uuGq0O+kfWV/rCZxJVgNp8vzebLqpb/9FxSSzU0w+gnza75EvbXX5wntuo8WgGRO8kSaRBbKRJN
 C0AvfujoU/ghNcHdS9Q==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=10
 impostorscore=10 phishscore=0 lowpriorityscore=10 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160073

nandsim reads and writes its cache file from inside MTD operations,
with the chip lock held. Reclaim from an allocation in that path must
not issue I/O that can come back to this MTD, whether the superblock
shrinker evicting an inode of the filesystem on top of it or swap on
an mtdblock device over it, since either would take the chip lock
again on the same thread. The driver ensures that by running
kernel_read() and kernel_write() under PF_MEMALLOC, which is more than
it needs. Use memalloc_noio_save() instead.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/nand/raw/nandsim.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe968037f75a..586f4622b59e 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -1342,14 +1342,14 @@ static ssize_t ns_read_file(struct nandsim *ns, struct file *file, void *buf,
 {
 	ssize_t tx;
 	int err;
-	unsigned int noreclaim_flag;
+	unsigned int noio_flag;
 
 	err = ns_get_pages(ns, file, count, pos);
 	if (err)
 		return err;
-	noreclaim_flag = memalloc_noreclaim_save();
+	noio_flag = memalloc_noio_save();
 	tx = kernel_read(file, buf, count, &pos);
-	memalloc_noreclaim_restore(noreclaim_flag);
+	memalloc_noio_restore(noio_flag);
 	ns_put_pages(ns);
 	return tx;
 }
@@ -1359,14 +1359,14 @@ static ssize_t ns_write_file(struct nandsim *ns, struct file *file, void *buf,
 {
 	ssize_t tx;
 	int err;
-	unsigned int noreclaim_flag;
+	unsigned int noio_flag;
 
 	err = ns_get_pages(ns, file, count, pos);
 	if (err)
 		return err;
-	noreclaim_flag = memalloc_noreclaim_save();
+	noio_flag = memalloc_noio_save();
 	tx = kernel_write(file, buf, count, &pos);
-	memalloc_noreclaim_restore(noreclaim_flag);
+	memalloc_noio_restore(noio_flag);
 	ns_put_pages(ns);
 	return tx;
 }

-- 
2.39.5

