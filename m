Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356088;
	b=JybJ4FM14Kgf8Iu3MACUc1oQoK3z0n7iP9oNAUKxDpiUF/jPScvTs+T+VXct+UJFYUea
	 Bbg0MvFCyFnbZqUbvrmxpm9O4RopUwbt6naFgssvsGvEA+KZA1Upk1tH/4Kdx/UFKp4pt
	 jPN0yM+koKq40t6C5pFS3Qc/IdYqySTo33zdFE26E6nRg3C1h2qBEDNUf5TejKV9PaDtG
	 6cXMVKSv7/jhZ7Uytz9NHAbg87e5ppUUsNnsr4hBNznCZrxW3aVghs5quHB2gBzMQGwey
	 ABil97/5UsUFRK6fwO+DvsrWVYLDtjLdRVNyoxdaDUPDRPYHdgerXSE4lxP9NEbpjyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details:X-Proofpoint-Reinject:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=60pHmj80O9kNL7Ma8kZphqBjE4OsplJ8ei65X/MZxII=;
	b=PVRQPdvJSdy6FFOkHZvGySybGGMnz2SGhUHG/zzjbtkTQxZEEXyQLeEkMxQFDSSSwkz9
	 vZdB0kjZ6xDiWXsF7hcaFbqHfJglefji0jc3KbhxMfm7IpOfXrGe3uzAEvqcWmXc0ltOj
	 ZsMEMl4m3ljtKFRT/qxC/BlXlLg+WmSJDHrg6I71Z8jsoYh+CbxFcHlO2EptdXE+oAykW
	 Uw+xIWa+cal7rNwk2hZAk8opN9iQTjS93xiIchiy5T8E7JOqlKz42+Mbn9SciAG+PgiC0
	 2Yg7uZ7MpYfN/KsQZRAgt38y02LNrZU/BL6RE6fefGE9rwa/lI3ynKWMfXmDfzxx0Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=USiiBghH;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=fDvGCPEI;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E49C606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E49C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=USiiBghH;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=fDvGCPEI
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8w3pX3951785
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=60pH
	mj80O9kNL7Ma8kZphqBjE4OsplJ8ei65X/MZxII=; b=USiiBghHauYrBcMLTYEP
	0Hja1/JhbzTNZVclHeokS2UDMFr/KgpoLip0BcdrBhBNNMrRI6FE65lgrLcjMG+f
	HQj5o1kFnLnDRdmGc8tbbIdy5N6g0tKS7eOw+ppQsp63IUQimasoWQrRf+gLuNj4
	SDs36/OEUSgJSgSuQ22TpC9NRjBrQ61GRxAf6qv8P4nmN5jLvkycjcJKwlfWGBws
	ww06QOC6Sj8PSYXTs2T47Bw3LF5hVHVuiKVTCYp96McXRLoHPo9WnxFEOHduEXwp
	3FvTxJnfmOUPGFNF2n9PEMw2N9z4T7qdxmChHhveSVdJA+nUr7ARnIy+hbsvOo31
	iA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hm7q0rc69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:51:47 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9441113670dso252582585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793285507; x=1793890307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60pHmj80O9kNL7Ma8kZphqBjE4OsplJ8ei65X/MZxII=;
        b=fDvGCPEI+HOCDA7IwmeQ4w6kYAvBKbndElZlCu1ktO37nalZOnKc8eAB0o5pH5fq4i
         pgiHLLVwre/7JWCrh7Xt15VM7dzk6Ee2hNStuDFmvttHKKJvySO4hAvonaxdZFMWipaP
         a8PAW6p8Mx30FZAR2XpZutp2YY7Q9fTNJgd0d6NaXGaiSaV/LVHWmswuTXZeHjLuysxB
         3KBwWu2zZNlNfFgOXaXAq/fGLwQeKZmovGEuKOzBmdJURdPQ+0uN8swKQQXxHaOKoj5t
         e1hPGsu1VqtAroa/vMiJAFfrFDzFZ00WzcYk9Hfm0FAbCahwAYdWTdUc9WBbw0NC/yBE
         ELVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285507; x=1793890307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60pHmj80O9kNL7Ma8kZphqBjE4OsplJ8ei65X/MZxII=;
        b=Coo9PlvUrY0LDjwPBdoN5swPSIKMnLK0hHP9lammz8VzHpEzEllcR9ZdEHu4NcdtHw
         +Q/2MaUrrGen7wN0vhwCb1yNX8klPSHfCTfRQU45idqexWvBn9Wqr9ZGsTu41sr3XS/y
         ze76a1a/5D6RCHNxuuyq95VyXxNmuv/FU0qvMzJrdr0Ik9RtgWgIEiqDqSDXXmppvxMA
         YE2Y53xtDSSqNMdZGEu6iYBaHat+fCgMr2a2mjATSQka6wFF3nh4rNR5Bshay/51SHYN
         Av2UIA1fE+E38crMhwiEi029BYk7XqiUh8CSYVicWgBO3UsYkvuTZWM+ya7FayT0MGvT
         F1jA==
X-Forwarded-Encrypted: i=1; AKwUvBybwZ6rGesysceVzUj7opI/5ywZ1R6/it+riw3wI6J0YbGIiAiZ+aJWA2JW+yvAI29ElGAbJMAIydo0Luw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAtqs1PEOqhfaV0Tv573XBoKrq3tmG3uI8jjBrGSVlJu7CnKTC
	wntTcsAUcBv4E6ElkvNlSZKKMRIChi3o3cF45jOkww9uEN5McLQ51wpsIPSNT8LKol5bRZ3JpBq
	R6sZMHGxR1pJJhUi3jgAe3p+J1P0xaqrfy8JvRUhlSPOgGryaRV+impEbN4q5wA==
X-Gm-Gg: AYBFou2oaCiJd7n3FK863YxrMvhUj5oQPKyx9kFtyV3BDgEmIDZ54oaKF5W3SwmjVk5
	tBOGkjL/sKUpPcMXzPL+zqir9xH3XZ77BBsPTkY7Hl2OpS11GPljR/B1TqpPFW53q91/GACIgiG
	2cyyDIDUmfPdx2khbA1Em/f3KfJKPYQkBG5oTq3G8YDfMUc5jc1RdLdnrB6c3w/96VULitVvkab
	4494VuGTo/FHhv1+vs3QInw1TcuL2QVmpYQrwz8uKIdZQ50spGiMxCSagf440q8abJ57y94iHWU
	9aPfUtB+KBictJSta5kviHS7LakyQqbKjXI03LErJPknhzhE1rHz7tN5PdW208CuWlsw1XYQ8fC
	wDDKHU1RoQgTtdRwXb0zTTWwjK2S5LQ1IXpTLVF6b23g+mRquUlmxo/YUMWCc3guYPV94yokfrd
	poL37JD2RYxsDUI2k=
X-Received: by 2002:a05:620a:2611:b0:93c:6507:a6e2 with SMTP id af79cd13be357-94408de7631mr837872485a.65.1793285506906;
        Thu, 29 Oct 2026 07:51:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2611:b0:93c:6507:a6e2 with SMTP id af79cd13be357-94408de7631mr837867885a.65.1793285506347;
        Thu, 29 Oct 2026 07:51:46 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm78153515e9.5.2026.10.29.07.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:51:45 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 29 Oct 2026 10:51:22 -0400
Subject: [PATCH v2 1/9] ecryptfs: reject zero-length encrypted session keys
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
Message-Id: <20261029-ecryptfs-folio-v2-1-dc53f1d47d9c@columbia.edu>
References: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
In-Reply-To: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793285500; l=1720;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=a+HBd1agQSrDWNNuzP/HbD49+xH+YgjHAS6T3xiz06c=;
 b=wAYF+u7froYMQ9mKuuSsj8W+yYgbnMf0aGrGakJYXq/pZNQAqt/Q5v54YS9zGszXpQYi8c/lI
 MCLyabBMaXEC7hJmycnnkVoWfJXR/tlrtv3wkdVQtg4B36wUrv2h7+f
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11949
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 clxscore=1015 impostorscore=10 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290058
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: hIg7upV8FBXPTHu91T8lzr5kMhT9GodV
X-Proofpoint-ORIG-GUID: stmt1wbHmN8Nh4bPfBV1yPMzSRKQOmc2
X-Authority-Analysis: v=2.4 cv=GfuCDgXL c=1 sm=1 tr=0 ts=6ae47136 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=aH2rPlVYf5PhSe4MZfIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfXwAG5w4PuC2Sd
 58Tl1HE/xDyQOLxcVlS+T8YrtP+WoCiaqh554/lPcT3mifXD/3L/dJWGfyoDxAeEi5WkC5mya1J
 iqcwBh2fmhTt36QVW0w2I+/4X8EMTYCZUwreaLSZkKps+GGjeG3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX5tNbYyZExi6T
 DR3PgxtxZhN64aoXmVc4xHO1MBynv2neWrYcBx79YbfatFPiBKvFfPNXz6BGGDWPzTdb4duNQtM
 BI1pT/HF7aEjn+K/+7XF7M5LJocyzl7nkzHHxvALUwClPKovDD5xuK2Ru91+5yBjYD7orp4nYKY
 eFrPoweUzovzfCkOVv4UWh1zG24jxnaZbEbkgq9D73co1HKywVQdKrKG9mlxJNCGtLZb1tHA4II
 FgdyfKxEqOSyog26mLZp7+ix4Gb9qr0KVwOrLRtbhiV9B0lXjMmKBBhafsmoK7dpcSipFX7mTXj
 bU62nUaiEnSr7CFtK3aDQThY6H/qaa4hj/lB08gLsRBhrbKxvVG4xGyp5AgahMWQ98PUa3wumPh
 Tt/jptQTfDxXbKbOV3fI6EWfAkbuL15uTmCTGkY/C+Fev9zxQMM5KVOjSRqvQP75Hljs+SC3bB+
 rRX9rI0yAQ56D2/Y0/g==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11950
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=10 lowpriorityscore=10 priorityscore=1501
 malwarescore=0 bulkscore=10 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=2 engine=8.22.0-2610190000
 definitions=main-2610300041

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

