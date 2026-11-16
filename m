Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866906;
	b=b6s1Gm6lAQ7PYQn3ShF2puM24hpDiixYuAzVahfAUB0QMk6FbmxWfF7nj9crf52Ac9cz
	 r7mW23CxHPTCz0k4g0eS9uucnDTtPs6+5O423zIOkOEUI72Nq3gTdDtwLYz9xrpZWySrt
	 ksH8k+fj4xFMGz0VEwctzS0w357JYYIh6v4foy7T414T+dp9CSFNM3GO1T/Ti8mIQti9s
	 3Ukp4N2GxI+60IQe9yvQSfptpxf3rAO3/Bwpefx+NkEF5ZxEIsDSpJS2sdxVzKkezEYi8
	 72NZ1KsEoNN+ifCOuF5lkudBvqiVvC8SIVKcaIpaOtd1e5W6M5I4kU0q6/1C44pF2ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866906;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=60pHmj80O9kNL7Ma8kZphqBjE4OsplJ8ei65X/MZxII=;
	b=ZBZLSyTTK73Q/+p3EgmF1N/443wqHS9vlB/L5kTAjdV9SuN2QuJDCCeqgYe1tPLEH0t+
	 lqWrD2HB37Jdp9bvgkCbn1Dsth7iz4ma4t7p4bdWowPpFxjkHwf8KUMVI1pLeWzPAIOpl
	 BKFx46tRk9h7u/nkMxKNVTNDXra/FN4TPyMmgBYyCJUZICf7K4SwP8OELxxQUoKY23cpC
	 6mwIn4XKJWvfQrNBZp7rD9ZnT4rXCs9mDPO/ZCl4DiuYCp5HPRELmKHq5286V99zCt6LP
	 kLldHkXHpAQbofYESQpd4hJUVLGCKktTJZ//TD1HrIlBTArAZDw4i48vGGIXj/Eci3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=mI9AzHue;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=iu1T06jW;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86838606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86838606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=mI9AzHue;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=iu1T06jW
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLYo9g238176
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=60pH
	mj80O9kNL7Ma8kZphqBjE4OsplJ8ei65X/MZxII=; b=mI9AzHue1mrP9Pn96d3u
	9DqalThhYt33uJqu180jr534PpsMio/QdWisTR/60eTWrX8VcZxqBJyd/U7fIJlP
	EsUVOJnd9knkaadrQUS68WK+Iriuu6FzTonvT9c+pmUWfq5Wm593XlobQlG6Uj5H
	6QFtY7Vh2a1Xb8dSD7YJgkevsInDTBvQUtC/EGOIlFu7JJIe7+xAtYOT4dWZOzxm
	1l3BTw9IBAsVozKXPDE881xZm1LbxtYCk/H+8j7udAZGwfzpYeRisdY7N7gpaNQQ
	6iz5Lx8HlLhrgG0D6F9GDJkvsCStNmk7Ged2uOuu80U3ugm+0HVLo+2NSbmkOhHK
	GQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j059dkba8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:24 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9493e89d4f9so726984385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794866904; x=1795471704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60pHmj80O9kNL7Ma8kZphqBjE4OsplJ8ei65X/MZxII=;
        b=iu1T06jW8kEq0JVxfgo+z0sbMPNQkA+N4lLcjJi4K8Z8KaPGQrh0CEVIs4vhXc12ye
         Aja9L1Q8D8fJBVRV4gCvooIwGAMtgsUgMsA1dRahEn2QBQVOX24g5KymN0A2mlgwEXCp
         /5tbsU8pBawkuoF27KgTPjTXZKMttTYYBfQzg1hzuAKaS03+/c8EmDvriSwDSH8tOvCf
         0xoMs7QA5Xo9hNGU2sbLSshCQKAUMIGsPQDrezYsUWsEGe+6DiuUwWYYg/zfR0WUZgAN
         5tsMu50uz6Z6sXtaAi8QP2awXEXcVvFQnlY2TvxMWg4kDD44ToyVyiQvujnrmEC8HplA
         Q53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866904; x=1795471704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60pHmj80O9kNL7Ma8kZphqBjE4OsplJ8ei65X/MZxII=;
        b=07zHYJB5b63e5dS8jSv5E7ot8oF+lZRhtX4q6Rnd1PDyJ5ppI4nAS6w2LKSa+1sTdE
         ssfMKyCkMMbxQHToAp8UAxEl1ikmRcWHLcN513PkmAFGqWdEZQu5AUVij8YtOsVKityz
         y7SWR81goxSsDz8aZD8zpIC/X+D7+25nOZ+LVtzEsag4KI9LtQr6OdFkgw5npM+pqjnU
         USI9v7Ktpa8wBEHn3+InY3K7wpNaxeN396oNPjJYvemt8dLD3kK1LMDlGm7opNAQmW4y
         FzN5G61W/rsbO869eMvVp4sZc1PVQ0+ZIauFvikR+k+3aJXvY3BmSkYr2SfVEvtjGhKO
         nFqg==
X-Forwarded-Encrypted: i=1; AL+hErE54ya1ptsMRrUVMDw7X7YxBCHbElPduTLtjauIcPr4uqP4YWWOxq79okYFYfX2qw6YRCLi4Dzq4aXl11o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9H5YZ3BuTpljQU5JyzloWtJ1alLNrspDIBNLpGtNd9w2MPZqp6
	69NOATnItdn+4DyMk8WUlX0X45tdTynppe9sSh6I+zm8/SilNYyxdyKEDGEqFaKpxgLEOKiVj/4
	CMpfOfrcaKp8n6sVKvdDk3DgdBMAMTdqEaot7rmi3cNNaDdhw0xrjWvAhxJeYrA==
X-Gm-Gg: AYBFou3FkY1YfUe6rx0z0wVjv3Y5juiW7h52NCNiPB9nRjjgiaIAJxBxGYcO4qsnjTM
	RQqWx/xpBG3VGSln5Q8erbfyWMxR873VMtWhmPcvFu4E03zxDDc1GpE1qsoE4AEU85Qo7QZBYwO
	vIIPHZMY/dFcf+JjKqGNRw0vNw2gA3VtK8CHpUI+M0P2tR0u88E27+hBk2qMuxq8OxCtTd5cRBp
	TeeaJPo0C/CXMg9NTgUZnqQa9FEUKUYYvcXKI3Niq461AksNm2KQpG+vuU+qiiiCjQw2gQSIsx3
	fUHN2sQDRTd6/+rcvQ0ZvF6Fj1GdsWAvKsxoyaFkl0fYXf5sGUJ/kIayctOOQUWWh9aDULpTokQ
	LKp1q36AvMUTZA4JiLTwzgT9boOPACk2rQvCdGlim168FaMg+mdIUtN6jQRmT4Jac++ITQIErW2
	u90qwR4qlJgG1yo/Z4eI4n
X-Received: by 2002:a05:620a:838d:b0:949:6ec7:68e1 with SMTP id af79cd13be357-9496ec77643mr1165873685a.18.1794866903966;
        Mon, 16 Nov 2026 14:08:23 -0800 (PST)
X-Received: by 2002:a05:620a:838d:b0:949:6ec7:68e1 with SMTP id af79cd13be357-9496ec77643mr1165869485a.18.1794866903580;
        Mon, 16 Nov 2026 14:08:23 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c86c946sm951838885a.25.2026.11.16.14.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:08:22 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 17:08:08 -0500
Subject: [PATCH v3 02/10] ecryptfs: reject zero-length encrypted session
 keys
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
Message-Id: <20261116-ecryptfs-folio-v3-2-1aba8e620eda@columbia.edu>
References: <20261116-ecryptfs-folio-v3-0-1aba8e620eda@columbia.edu>
In-Reply-To: <20261116-ecryptfs-folio-v3-0-1aba8e620eda@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>, Erez Zadok <ezk@cs.sunysb.edu>,
        Phillip Hellewell <phillip@hellewell.homeip.net>,
        Badari Pulavarty <pbadari@us.ibm.com>, Theodore Ts'o <tytso@mit.edu>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Stephan Mueller <smueller@chronox.de>, Adrian Bunk <bunk@stusta.de>,
        Michael Halcrow <mhalcrow@us.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794866899; l=1720;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=a+HBd1agQSrDWNNuzP/HbD49+xH+YgjHAS6T3xiz06c=;
 b=vTinei3NYNuv3Cv3rUkazssBbXmnH82BNwNm1+s3HPYI3+HUQp6/M/dmQBEJw0ok2epNOyPoC
 8UCEY0R5wgcAByL+q0yMda/FpXxWHZFvrR1bpWhrh7Qfsuzqq77OS2R
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: rmA4JXlAxjo-3qBwsCN9kzK4z_BngTS5
X-Authority-Analysis: v=2.4 cv=Utf2pOwB c=1 sm=1 tr=0 ts=6afb7ed8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=aH2rPlVYf5PhSe4MZfIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4NyBTYWx0ZWRfX+4Ol5Tox56cf
 3DgEsQh/Mlli79w4ymmXObX0PHIOqTbq7E3mhGYrtRXbBOBeaN8E2pioYtBu5Cp5U0CBq4woEwl
 PmvzebabHinwS2lvSIYG/WPN1aBIzDat365630lVew21Oxs/PxolRsPZGZESIAJi7RyNLEiy4Ac
 ufw9yt0ScRw3yej1AYimOMq/6/3hcxsFKDZn1gA0SDUxgNGViMyo1b6ytcQRVZVJyujxvGZcVhM
 Br3GQLPFXzc+foTykb3+oSrjT3lut89kAAOLKZtCJXsItB7nU2tSZwnTc49p11v9yDlv+RfyTLS
 YshHs7bOv5YJOIfeZ2ngdbteFsOJ1X1M1n6bxSXutXs8QSycpK66g10It8mGd7CuhBolh90t0R/
 BAEIFIEvTiflLqsVzXjlk4oTInVQvJiInPBpavMaNoZhWXvX8bJWPCBHdA/ZEluWvEgyu6lI+4E
 DVm6DEl04UhDcZgHHcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4NyBTYWx0ZWRfX6mcDR3hNHjG+
 pNO53LBmANcT7uYTMsb7gIdRRlYk8QneWO1b7zvv/N3GXoxzJ3SdHZ+Zl2hPXVTU/oo6qRMRoSc
 SyNrnKBJnemtJ8YekuKGMT46jmOz0CycMUi0YcJ9WkAWvs6ImDCp
X-Proofpoint-ORIG-GUID: rmA4JXlAxjo-3qBwsCN9kzK4z_BngTS5
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=10 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=10 suspectscore=0 lowpriorityscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160087

parse_tag_1_packet() and parse_tag_3_packet() accept a packet that
contains no key, leaving encrypted_key_size at 0. The decrypt path then
fails its scatterlist check but returns 0 anyway, so the file ends up
with an all-zero session key. Since file headers are attacker
controlled, someone without the passphrase can plant a file that reads
as plaintext of their choosing and encrypts anything written to it
under a known key. Reject these packets.

Fixes: 237fead61998 ("[PATCH] ecryptfs: fs/Makefile and fs/Kconfig")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20261014-ecryptfs-folio-v1-0-f4412187b1d3%40columbia.edu?part=4
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/keystore.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index c2ba230c71fd..a0989e3c8aef 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -1250,7 +1250,7 @@ parse_tag_1_packet(struct ecryptfs_crypt_stat *crypt_stat,
 		       "rc = [%d]\n", rc);
 		goto out_free;
 	}
-	if (unlikely(body_size < (ECRYPTFS_SIG_SIZE + 2))) {
+	if (unlikely(body_size <= (ECRYPTFS_SIG_SIZE + 2))) {
 		printk(KERN_WARNING "Invalid body size ([%td])\n", body_size);
 		rc = -EINVAL;
 		goto out_free;
@@ -1384,7 +1384,7 @@ parse_tag_3_packet(struct ecryptfs_crypt_stat *crypt_stat,
 		       rc);
 		goto out_free;
 	}
-	if (unlikely(body_size < (ECRYPTFS_SALT_SIZE + 5))) {
+	if (unlikely(body_size <= (ECRYPTFS_SALT_SIZE + 5))) {
 		printk(KERN_WARNING "Invalid body size ([%td])\n", body_size);
 		rc = -EINVAL;
 		goto out_free;

-- 
2.39.5

