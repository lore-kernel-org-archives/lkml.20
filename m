Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355986;
	b=FoZPQ4mmceS5jvAS9TZjUZ59wg+/BSjD/FZ/QsWylJeEhfk5MVmRs6BfI7TUR62fHbhz
	 mM+CRgWteUg3M16otu4WUi48/V3xofRiD7971I7Pmmgolxt+R5BywLhv63Rwo1bHgw9lK
	 +IcUp1ryM+xp4tQjmc/BjOsJqyCzAsehFrQPKzDtDj8mUWOafd8wVWEb5CqpyBuXzpp/2
	 etZCTOMMASsXdUcFuDvU3WH745DxbdOc2Tt/S86zSaMSAuwnLtXr47wNjYNAYQEulZ+uS
	 e9AU36EN8SEIJ45DRi7FyRczNyYrntGKm6CJ+dI4NJ61+hKiNJgOCePZ/ElaLGM4qQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details:X-Proofpoint-Reinject:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cQPjKdWMy7S1oYqCkDx7X4TDyODbJDGxE2F3oqdGrUM=;
	b=FZC8qIUylvMfVkIkUcgtH+k3jTsjAWoKeDOi/qUGq8OzxLJJTphPaUkEd64zYjXZ2hDz
	 bQvSqHe/dky4zWcscQYn3a1F0U4GEDKG3OzZwaebUTpAtpwJpXD06cdULJAl5gg68jA/j
	 CqVMA9mfmon6F0PTGVB6/XyvggRVNm6tLZ8qZCFKsyaZEOxWOt1JPpdAwr2xItFBjAvmv
	 HrMG8tShA9MYAogepIM8e6tjHn0iDjrRM7NXkAX1oCemkh16ze/ePq43g6/h12OggOv5X
	 Ndog2OGng/pc6ywSV9cB8JeuE6i67dShUXO/55ehLOD+uZHtsx5jJbuBufONENwO/pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=SzYmS8Kt;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=rvf5gfM+;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F490606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F490606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=SzYmS8Kt;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=rvf5gfM+
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8U2XC1013660
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=cQPj
	KdWMy7S1oYqCkDx7X4TDyODbJDGxE2F3oqdGrUM=; b=SzYmS8KtomEYRhXgVYxZ
	/WOyQDuLlLWpDlsL1jee8kgPSFdcAO6DbCuDZ0lTCRarvqp8bqw5WQMyZ0dtiiuv
	QqHyNVfhN95LecaXASZhekhVhX2Fgx0gS6EwvRzak0zJFB3EZcVBNg3Y537B5H9B
	sfU0yxOj4izwKCngXpcTSXinxhLNO7Xz3DFHUwVyX+pY4qWD3lVSEslnRTg8FJbQ
	LiUZ3mJkIMqP1rx68IBpui5+14936UYbjOlx5smVcGuv10TixnZKcIYl1/iDoJrT
	63jxeNyLAUhUmA2FUTIknkO6w9BRtktBogCH1kjSjrjbC0jdiHCm5ZJeoYavxi1X
	GA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hks0ecr2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:52:01 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so268125985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793285520; x=1793890320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQPjKdWMy7S1oYqCkDx7X4TDyODbJDGxE2F3oqdGrUM=;
        b=rvf5gfM+pVHLaxNI44qTrcb1snfU+vrYUfRJiTMF/xI5l4IvrL0wQTDZGbAfzHA5vL
         xOfoSSEBPz4hUBj2nZe0c/8tW7NAooCCU9sjbMdekXbO8v5FdHFsfyeX//8MC6tqNFwS
         hSzQA1LRDBDRgiGauy/hATOtWgBCR0M3fBm8HNDQwKQKMb7ql8X5tv0dyunNBRy8VuOo
         w7myhc5ZfD31ZNqGzMQdd5mG+IQf04prH0zWZjLwZuxlF0bP/dt6GXS0mEzoc/ctwjh+
         zP8Oqwqof8TZ/QO0a5NgBjOVkNL66gA6+8+DHcLYqaKTD6WQYoMuFX3HrZurRiIW5TmA
         M0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285520; x=1793890320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQPjKdWMy7S1oYqCkDx7X4TDyODbJDGxE2F3oqdGrUM=;
        b=DQOZyh64DOEi4epJeeBBFp7T7ZAiYCNivImFwwXTDuaQiDPhthglLd17KHUqtH7a2p
         Isv0AXXVfFtS35NqHq2JppQ6LABuhvNT8BqQGMc3BQffqDamIjcDkpPY9j8aOEUAUjG4
         cWnk8QSpRARmkM/6CyxebPp5AVmfcRpVEQ93F5fRBIlHnBogXbNbtI0gLw+/DcUTkzok
         PgEWVUiALm9xBcZUesHm2HQLn9XIXu8NxQJITtoL4IK1v4t0y2nAjX78zb5eXlTFgz8S
         QF8p7Wfaf+KsfQnkJEjllCcekMFc8g5ANuJazxRzx4HxiTCmIllXNOkSquZ1IagB45ON
         ywBg==
X-Forwarded-Encrypted: i=1; AKwUvByIxQoJoHc+mzqfmYp4ISCvv4BvOkRIDQrRq5tDoAhdU02Zx82DaWOUxJ9B3Nyg/2UmytQAqISXyo5/l14=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDVH2HU5IrJ+8OGyw5V/Ct5DAXFUmp1i4GbPK8rbGdj+EIR+z1
	KgyQjj2ZmOWJnoVXjR8pcR4UQA/oVEeXBjXFJFBDk3klaJpOnGPj07k+3jZLwykXMobtWMJgHCW
	9lCp/NT4q3G5o56N/v5/UTW3kVP+IzEJ2/L/+aiAnEMXZokYMyocDgSPRA/a7dQ==
X-Gm-Gg: AYBFou3+C3sP0yhXuzz4C7B1IhiliZmwEzA2ckirYrQOvh8Zbb4f78IFtfTJbNB63YB
	sN0CzqK1ieXVWz/fmyIpWe504SMIsHS0d07jW5bD6zszzrlr9Vr0R+HHHjeUb0bb5XAZkZiuvO+
	pIEInBP8E8/kGiSE6XqbMYenkoSOit+k8ZIt7yMiCBOmvMoSOp30uh8Kf+vldFOUnLeWt0TR5Pg
	UHuqS8TWGp4UQ3rCNXgFAdPTnaz89RSrIWytKFCnEG3jexVone94rlZicKEaN/2noChDvBsLSDe
	NUxgjIof/f9v7EHF6F6u6nLCTMIfe7TcLu477zy1Ei2JWQNMj6LUpVJBByavhF+cZHd2fEQ04o0
	OLg3wp2gp3f87NDit+AKDqRgv8gH5Qp0UlITh39U/7BkNNuCtVJkGCgN7N7+4z+eUswWAjEDmqz
	T/8bBXAXSD/Kiedvc=
X-Received: by 2002:a05:620a:17ab:b0:93e:60e8:c9ad with SMTP id af79cd13be357-944089dc305mr880516485a.12.1793285520238;
        Thu, 29 Oct 2026 07:52:00 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93e:60e8:c9ad with SMTP id af79cd13be357-944089dc305mr880512185a.12.1793285519690;
        Thu, 29 Oct 2026 07:51:59 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm78153515e9.5.2026.10.29.07.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:51:58 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 29 Oct 2026 10:51:28 -0400
Subject: [PATCH v2 7/9] ecryptfs: zero the tail of the last folio in place
 on truncate
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ecryptfs-folio-v2-7-dc53f1d47d9c@columbia.edu>
References: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
In-Reply-To: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793285500; l=3389;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=tfML2l/4cmHk3rjgjwPjbvyNbIjUB+q3HfZTghlUFyQ=;
 b=PF43qTififwjcXJsXJOD3gXoOymbNv1ze4bqNcgFDjb/PnkpWSOyQOUsq946gDd23ZgIQJsoM
 8st4Kt+ZMD1Ct2LLvC7TEkMvsesO9zlX2vYiCfBfyUPrpy3Bfu1SKr1
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11949
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=10 suspectscore=0 spamscore=0 lowpriorityscore=10
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290058
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: C_fFGrC9XQjcFxO5qabzhrJyfDGtc3Cl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX17Lqp3CajuLg
 CRISomj2SRNrJZyTUq/pcC5XvG3CbHbCrxn8j385Cib9vI+xpdwxdaiFmjK2FE5Vu9RPMkEUSIx
 ZlNtPjgqG8PL1Naoy4IRMB4icAA1PebLQwXFGZW2nZsVz1E7oPl8
X-Proofpoint-ORIG-GUID: jNYW2vgMLqE52dD0h4pT0wU-X-e57BgD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX1AtQMcDZaMwb
 n4c+0GQYaQ0IZe9TkCZOhA5coFeQC07c+MG6fLIuI+XGhRtBglt7Z8SVc/ZccbTghhBqP6Mfk6a
 xM1lpKDm8xfmJuDaX3zm6mCF8hJw73v1wTndm9b/o6ZoxBKBwGvPRPn/0Z6ZP+K1Dn2WHYkHZ62
 s7kr7O33DHaBuHZSXZTpr0puPUa2ACP2SvjBeJ461545ygrtGYoLQEMVdjkTsb37cZb+9cEiLJg
 qP2pz6c/N4iiDepqDp+5aVu+0JJD8QVezhp64+KBwLQ1gZvH/JlCNNE4QWfrvWmsshA9X/bwFeu
 mKRmJMi988VgdFWERmPjOzTW+AVEnzoIxHOTO/kK2XnkysLEk+iXK37xLKTcVrxf8aRNqXnUViW
 XharvHaNUXxk27n3+aeQYb8HfGV+HeYXm4/+MD/DTun4GCIFCQv/ZjwxsZVwKznyH7FBSAwMQMb
 IpWq0sx68ZTB1kkOZ3w==
X-Authority-Analysis: v=2.4 cv=cpQOAF4i c=1 sm=1 tr=0 ts=6ae470cb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=dGUJCdGidsCb5_L8LY8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11950
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=10 impostorscore=10 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=2 engine=8.22.0-2610190000 definitions=main-2610300041

A shrinking truncate zeroes the rest of the folio that holds the new
end of the file by copying from the zero page through ecryptfs_write().
Zero the folio in place with folio_zero_range() instead, the way the
truncate helpers in other filesystems do, and encrypt it to the lower
file. This no longer bumps i_size to the end of the folio and writes
that to the metadata before the real size is written. It also removes
the last struct page usage in ecryptfs.

The folio stays locked while it is encrypted, as in
ecryptfs_writepages(), and is marked not uptodate if that fails, so a
later read goes back to the lower file instead of returning zeroes that
were never written out.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/inode.c | 51 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 525297c7ebd8..2d6f4f440f65 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -718,6 +718,36 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
 	return lower_size;
 }
 
+/**
+ * ecryptfs_zero_tail
+ * @inode: The ecryptfs inode
+ * @pos: The file offset from which to zero
+ *
+ * Zero the folio that holds @pos from @pos to its end, and write the
+ * result out to the lower file.
+ *
+ * Returns zero on success; non-zero otherwise
+ */
+static int ecryptfs_zero_tail(struct inode *inode, loff_t pos)
+{
+	struct folio *folio;
+	size_t from;
+	int rc;
+
+	folio = read_mapping_folio(inode->i_mapping, pos >> PAGE_SHIFT, NULL);
+	if (IS_ERR(folio))
+		return PTR_ERR(folio);
+	from = offset_in_folio(folio, pos);
+	folio_lock(folio);
+	folio_zero_range(folio, from, folio_size(folio) - from);
+	rc = ecryptfs_encrypt_page(folio);
+	if (rc)
+		folio_clear_uptodate(folio);
+	folio_unlock(folio);
+	folio_put(folio);
+	return rc;
+}
+
 /**
  * __ecryptfs_truncate
  * @dentry: The ecryptfs layer dentry
@@ -739,7 +769,6 @@ static int __ecryptfs_truncate(struct dentry *dentry, const struct iattr *ia)
 	loff_t lower_size_before_truncate;
 	loff_t lower_size_after_truncate;
 	struct iattr lower_ia;
-	size_t num_zeros;
 	int rc;
 
 	ecryptfs_iattr_to_lower(&lower_ia, ia);
@@ -788,19 +817,15 @@ static int __ecryptfs_truncate(struct dentry *dentry, const struct iattr *ia)
 	}
 
 	/*
-	 * We're chopping off all the pages down to the page in which
-	 * ia->ia_size is located. Fill in the end of that page from
-	 * (ia->ia_size & ~PAGE_MASK) to PAGE_SIZE with zeros.
+	 * We're chopping off all the folios down to the folio in which
+	 * ia->ia_size is located. Fill in the end of that folio from
+	 * ia->ia_size with zeros.
 	 */
-	num_zeros = PAGE_SIZE - (ia->ia_size & ~PAGE_MASK);
-	if (num_zeros) {
-		rc = ecryptfs_write(inode, page_address(ZERO_PAGE(0)),
-				ia->ia_size, num_zeros);
-		if (rc) {
-			pr_err("Error attempting to zero out the remainder of the end page on reducing truncate; rc = [%d]\n",
-				rc);
-			goto out;
-		}
+	rc = ecryptfs_zero_tail(inode, ia->ia_size);
+	if (rc) {
+		pr_err("Error attempting to zero out the remainder of the end folio on reducing truncate; rc = [%d]\n",
+			rc);
+		goto out;
 	}
 	truncate_setsize(inode, ia->ia_size);
 	rc = ecryptfs_write_inode_size_to_metadata(inode);

-- 
2.39.5

