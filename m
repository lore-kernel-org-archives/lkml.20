Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356032;
	b=Ldkkpmy4UKblqVl5V28vj7dBnumyDWETnwuQK0PEnlaE1vEojACBcIhhnvMHx9+K6Pr/
	 x8ye7T6Z9E0uPnuIb/VL3ln0tP6305sZPwWKtV6bYhRaDahUHqYIdBj67Bs46VXjOq2tu
	 QZRbBSTTIJ0Ulcep76xOhf+9+oVyEvUu3afdHxHPtjso1g326rliSWfZmfNU1suUM84Nu
	 BNBTYsLS2LpamSCEcTFsc1KHpDTHYJ4Z+XjmyMqrzrbecMuKOSQigmNY1G635g77dbHGz
	 a+bq9WhMNWHWACtJ7juFk5Qkzw5esSwAoJ6Bmfv45Wbt7nAJ1VQTRcaH45iHI/KlKFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356032;
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
	bh=MGw3BytAYYXwog3YzUbCFMTej27aBtumbxYPUU7c8pI=;
	b=jMoAFayEi1ZaUk4Q8cLQvD8Wil/lwb4dSjehD8mpWCRBtO/cgIEyVWyEDTV+zT2TFFg5
	 5y6ZZhwyjt/O3OQj4IZ4F/IroU/2N0yIXRYt8lEdFW081OxVa+7P8JTOzsBjDFjZAersw
	 J7qJojBPMd50vmDTBfdwvLFj9ETaLBVAXrVDgHeFrOwC07SHIP0tw6YcOfj+SvmXcijXQ
	 ACOKbEBxrV45S3EA7VlUvdAmqc760eZ42HIuh6Paz1a9uAcy/WBu9uK+mLe/kIHhyg1F7
	 TPllUS3qjA6Fjk7CL4NkPqbTGMrGzxfAN3fXN0maKvZjTu6Cl4XA7sbfrGauAip1Hog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=qRQgxQYf;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="vWaA0os/";
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB8F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BB8F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=qRQgxQYf;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=vWaA0os/
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U37ROv380645
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=MGw3
	BytAYYXwog3YzUbCFMTej27aBtumbxYPUU7c8pI=; b=qRQgxQYfaNhFpXufvuPu
	9YNUE8sL8H2cGPgk5dw3fJWai99uQXERbNUZrYEVDr4Q9Wa/mZ9dsUpAWy8zf/Pu
	i9LC7DFGsrfhG+uGWd4OLB23iDP4lhvxrK2nBOf05Q9az6/T8EvNmtXAaQ7p33Od
	hUCAdAeR8Q/TvXk8MV+6ldjEztxXXnr5BLdXcT36g7PpM+zembP51SueDWrG43vs
	i0SbiDuVqw++qNlGozLFOqFub1JOVInUA94OVJC7rKl1COk89Bk2PJ0OvsXF9mxE
	kaCfG9lc7mMJPWiFhtTVYGcm/aKmXu4Y+shtZyD889Zdi89ePexyLPXQTDwTXy1R
	rQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hm7k00fu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:51:49 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so268092385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793285509; x=1793890309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGw3BytAYYXwog3YzUbCFMTej27aBtumbxYPUU7c8pI=;
        b=vWaA0os/dlfVOmNMQaVYAbJlZDhgEddEH5dVNV9se/Tp+bHf9GWjzVrhYbKKyi2HWV
         1mGuK5+aFZ4RJorHnxK3llgXY0BZGeX/UwuuYotQCSR6RoT2X2mPGE/md7ddopDoKQnS
         Ok+IewwscMmFkuFHhn4hbhYrSIMVHUV3a6LT6ZnXoF5RyhC3Z2TyDon1GdylrvV9HQcu
         6WNv8YEzxrActzdaje5etXg5gxU+3ogPg5O0b/kCHTLZvucNUu8IIfhF4u40mBd/a937
         +fUreGXfnQAA0uqGB5lnez4hQZhGUKzlfzapKxJYZE9Qjz5IYn9HQRfOcZ1oNCHb0xtT
         dwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285509; x=1793890309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MGw3BytAYYXwog3YzUbCFMTej27aBtumbxYPUU7c8pI=;
        b=Hf7MiW84C06t9crhwkqKmw27cxUwHLGpWXI2cVg75CXFhAx5cwlQNYvSTHK+Bg4RQt
         y36PSXLNRhujJnt2TdQ4ydFu7Q81BV+IgccJlGf7NhznkLNsvdYIznhIP4FeDc4DV9Vj
         3ywzUCqURgff3yihEorv8Nhimgns7Lsguz0FmleEr7I6GoTNAAGUcesHSzgMBMNiQQIZ
         YzmttAiT54P5ueFe5lYwiy2FVdjr8GyjKCfeWH4cK8ZGKBVOQHmnvHslCa55GcEb6Hvh
         I3FYuhvscDVW+TJv/BJeDByG/xX/HcCS9w/zlBNh8GNCvUZ/1HAXxKSrJ+7VTOFyRZBL
         TS+A==
X-Forwarded-Encrypted: i=1; AKwUvBwrk71mKfc+JxuiJQJJlr3Iux2yM48xGGe9hmT43S1BQ+KgHueUmxP9nDVcRiCqBVoj/HW5a/3JXDxDejQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+KcroVdhFpzdHs1owrEqC3vgWb/7fzUvhccntDY8/qq4PXk11
	qjjB18X2b8atjR5BDqOrvUmfPDOvR6+1tM5fTKQzwLzgOAWdvesinIq3K6kyK2TbLqtEKz6WULB
	ubJq/GQS1BL4ZKzGWLLz60hnoJagFDiNM/V4BgsQFeT3rP5+Z+rNgHx1xGBNUkQ==
X-Gm-Gg: AYBFou2fr9bxAw3df2KLwIJ0zphetrFdGGr8hjT2qoOhxl9/6v22zaR/ubqr7HpH1Mw
	eL+vqfIsypLSDoUZksQdD333AcH7fFbfvl5tFJ5JcRQ3F5ob/FAYOT/Cz1gFKfbjElD1IQdRUSN
	1Axgz8McWCOrpukAdbXloPqXOYq1qPCJpy2cPxPVL8lkbsobP7OVFVk+tYdjdNZbh5FsNY7byFb
	9VjThcxWmsG69ZwcaAUyD6bdigqBv+4LAIUeVCul0RyypEkPNiNxe1DKJ82F09Ff+TTAKp8ym7U
	cxrpwQN3pSSyL4ubNjtKA15qlBbFjXuPD2MWSRDmzL+hVVhey+NYFJSP6rN2Dm2ALit15DUsch+
	Kof01LhRBq2VUojbgOHJrL03qUU5cCP0Bj9tCghjLuzZmuTbecgqXSHcdFhFKy5yNgM43f0cthD
	Q4yIGb2r+6hmKk0ig=
X-Received: by 2002:a05:620a:2907:b0:93f:34c9:9248 with SMTP id af79cd13be357-94408cf4109mr886616585a.22.1793285508918;
        Thu, 29 Oct 2026 07:51:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2907:b0:93f:34c9:9248 with SMTP id af79cd13be357-94408cf4109mr886613185a.22.1793285508491;
        Thu, 29 Oct 2026 07:51:48 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm78153515e9.5.2026.10.29.07.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:51:47 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 29 Oct 2026 10:51:23 -0400
Subject: [PATCH v2 2/9] ecryptfs: keep the folio locked while
 ecryptfs_write() writes it out
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
Message-Id: <20261029-ecryptfs-folio-v2-2-dc53f1d47d9c@columbia.edu>
References: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
In-Reply-To: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793285500; l=1456;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=RFR1FzT010wbKCiX8EdHBWtcRcxwB1aPkK+Mmqg8Yz0=;
 b=l3bCNQnSwEryOzEQmY5HiywhzsjfoSFgUgm3g3A4JHgDQcxZDRMSDVvlI+lkXzOUW4Pt+9mLj
 25xR9NzMkpKBDZwsucJ8CwJ0EKJe+Py1Fo0sqoXh8ygoxZkhG3RySl3
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11949
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=10 impostorscore=10
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290058
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: -RWsnNrknTNAofWVLqmJdpABLErww2db
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX4CPXUfO6SAMZ
 ywsRRAt95z6Kg68yZNpe2qdKIKyk4NRKZE7FEHDhzlPercycf2e8KDIz7wuG/4OQcv1WKpLGJFn
 uOdRDLMO/aHAZM/IIUp12ffLvXFxE4aSyVxtdrjPdNDb2DGPHswV
X-Proofpoint-ORIG-GUID: GGaJ6bPUcnwWXaMCKXYjfeKqhqCnAN4i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX/8rJ6w3R2vjq
 Ixf//GhdekklBOLtqA+umYE4FojMoHS9nzJpO9a6uMeZUdfjc3avphghTHjIJFvR5b9zIxjanPK
 GsH81HLp4MY6UTzuR+FdrBRMO4R6PofISUexR5IjdiJOu6ZtieklaiQoue7WJEcW/MCv3OC07iW
 YK6lM2djn1Hb5fvsJcxx5U+tgZ0xp0oxe2ba0Ml0kz03eyh5Ib089yiaDr+a8y1wqEJWiPYEbr7
 T4OL3GUJhnv1sol6AmqMBKEXmubTPf4u0ZHDUnTorw7z5dEEm2e3znHbblp7dDJs6ZzKp1/Iy2A
 xOcWt8AUXQ6TNGeMKv6OqL1thERUa0XBBqhkNoFOq2VPfY23B7c2kmStKRafsiUd6rA761JwIOQ
 nMZixi/6HdXWtFwqnxfzjuMrKKmJGlQjHTh/sk1xz4wVgWwnqIqTdldGshv5gBQGQ5uT3UlDA4K
 lpWnmOSuT6scftNyiQQ==
X-Authority-Analysis: v=2.4 cv=cpQOAF4i c=1 sm=1 tr=0 ts=6ae470fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=lBfB42ZMJ1NEXrBLYOAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11950
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=10 impostorscore=10 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=2 engine=8.22.0-2610190000 definitions=main-2610300041

ecryptfs_write() unlocks the folio before writing it to the lower file.
If that write fails, the folio stays uptodate with data that never made
it to disk, and reads return it until the folio is evicted. Keep the
folio locked until it has been written out, as ecryptfs_writepages()
and ecryptfs_write_end() do, and clear uptodate if the write fails.

Fixes: 16a72c455a67 ("ecryptfs: clean up page flag handling")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/read_write.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ecryptfs/read_write.c b/fs/ecryptfs/read_write.c
index b3b451c2b941..a31f1e90c40e 100644
--- a/fs/ecryptfs/read_write.c
+++ b/fs/ecryptfs/read_write.c
@@ -166,7 +166,6 @@ int ecryptfs_write(struct inode *ecryptfs_inode, char *data, loff_t offset,
 		kunmap_local(ecryptfs_page_virt);
 		flush_dcache_folio(ecryptfs_folio);
 		folio_mark_uptodate(ecryptfs_folio);
-		folio_unlock(ecryptfs_folio);
 		if (crypt_stat->flags & ECRYPTFS_ENCRYPTED)
 			rc = ecryptfs_encrypt_page(ecryptfs_folio);
 		else
@@ -174,6 +173,9 @@ int ecryptfs_write(struct inode *ecryptfs_inode, char *data, loff_t offset,
 						ecryptfs_folio,
 						start_offset_in_page,
 						data_offset);
+		if (rc)
+			folio_clear_uptodate(ecryptfs_folio);
+		folio_unlock(ecryptfs_folio);
 		folio_put(ecryptfs_folio);
 		if (rc) {
 			printk(KERN_ERR "%s: Error encrypting "

-- 
2.39.5

