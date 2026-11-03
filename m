Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711889;
	b=5b7kxXrJEYOSeqJ0ye9FtkX2kfFcQQ53qkbqy1q845xCXk0HlZ62eSylDx0BbWG3NEzb
	 sMp21SUSWod5aA/xwmMvavz9BOQQY4aUhJ9gm3LCta+8Z432g3aGIGktRW6jFNmgslILR
	 WMsu25HL5uxUKt1wA0DFJpa/1DAzQq20EhORVejSqD+u8r2CZC3RNzmy8E2Kf3SPWetz3
	 LleLmVdwAutcAkDEJ6EmpjaIhow73kAow6c/f4l0paZFqSf7dzj0iua9D0azl8yFEA5Dy
	 sqnRnoFttWtUrwiPg1CauhYL76q6M9+L0lt+d1qcXnfBnTR07qpnwRwLkuxNPBITUMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wiq9IEuOjV4mUdZyBFHxQHpB2bj1hUfPhSjTxcnpS34=;
	b=AWU64InTg+ULOJ3gJxC0xaXlUIfZ6nt5qT0YwdQ6dKdodNvWvpqPKyDoZVvmoXJ5DTp2
	 7qv3JAM87iLa/osj7n4SnHTG2VhWOGJafw/5Ygk0gy3QvJ9u8thPykqBQSQ7MUNwQg2uH
	 HxbWa8wFVLbxklOdfjPdPyH3A+qY77cTRHI5dAhh333ququXml3Gq0diSjnmWTAoewIpo
	 e16NS2gYFdtJZKZHeDZ8+RIK7w5+gfSVja1t30/bxZqpB0IETnMpIbjbKwkAIFUBxSse/
	 FCvWUX39EwehISzU2RhzGndFSRgraqADcGwx1Tr48JBoiP2JBZsHL0HBB76sQB3eJAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=jve7xRWV;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=dBNTQNl4;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CFD6085084
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43CFD6085084
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=jve7xRWV;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=dBNTQNl4
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A39h5HG905076
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=wiq9
	IEuOjV4mUdZyBFHxQHpB2bj1hUfPhSjTxcnpS34=; b=jve7xRWVhUdCbwxTsi6z
	cwDHGuGDWp7VJ03Ne6jBXVxqPD4J5+k5vVKtZvV+Cz/5JYYYv9qMhge7aDOy18EG
	PPlYDS1fW54Z29QbG1sOGOXe5d1otbU9jRk0WErYmiuHS8KtjyBxBYAb4ZlX9RoW
	XKjxwlb3UvUHC3sb0eNByQPIH7EyCnwOKDOabUJjqQizqZosyyjKWiRExLB2x7RX
	E3culRdLVxlVHNsCKb6mIbswnc/2yduCDL/gkHZ2GKhta7aR/PBbLtaCWyZngzav
	Vd1yB6WcBajyxET3SIybIw3wf8eNlfVqz53nlzVtYdJhGz4GAD9MSC7fobvBgQbF
	sw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hq3y8b5g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:18:08 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so606652585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711887; x=1794316687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wiq9IEuOjV4mUdZyBFHxQHpB2bj1hUfPhSjTxcnpS34=;
        b=dBNTQNl49b6MMh0+DmKnvAGdNe3Y0qU/TUZiidn00FFTtlwYO/T5oQmQmPXOthIuiB
         nJpEK9erPwPd0QrQxeKn07p79ZP+V767+O1tZY5b8o6AGrNmUiRd/jekek7T4YOWiVAi
         RMqZIhi2b5oZ0aeBVA84VH6T7cHrlMlTY4VLA7vlU0FvNDEm15TJH7IPEyo8GBv5aHia
         q0xzKBwAqEtCzgqRcKjEa9tumdGD2dSHHWhUvH1E0F4Wl0OVt7r2/QSDavOL87481ln5
         elnarMFcjr9WNATErTaz0YNGcaOZUDAWDQoFTW3dcvAwZi9AwqMkMLkDcKHGmLqu9rgG
         N12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711887; x=1794316687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wiq9IEuOjV4mUdZyBFHxQHpB2bj1hUfPhSjTxcnpS34=;
        b=hAB3nkJZeq0OS0fB1pBqFZI61cwIv5FCKLhEmMcYFlN4xh6kZSOZn0R4I8eCa5R/3c
         Rsom5BCs56qUY9Ol52UzNuqym6LC0O4s+S4zarYCUyFSPaKvFy1kWyIFAalWzhPv5Krj
         SKWq4y2vDzPT8apD1VS3/NizXyVCZDXnHOPN+d3G6UZN3g4BMILXy4C56wpemwT8FV1t
         iJutAjUbE0LU4AJTO3bJ2uh93zHRvFi8KjOMMDndZs9+vwsp6YcmSCt3sO+k/QyyMjTm
         AUsKVdxtUo2buG2Dhi7LIOOp5rWrKGeh8Hi2rbF39aQbBhA1gfpMOgNmSHaIejjPLOmX
         qOLg==
X-Forwarded-Encrypted: i=1; AKwUvBykuDxzA6yMO/zMA9A4YgMR4KGaVgueXFcQTwle/Hc+GSdDHlUmcXpg2jFqcSga/WD7BoQKwqR2/w0xwMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u9Sld6EDpJxHUBQBs4/DwiCrPJEAVeVs0TZdJ/t7uT3pAIdH5
	QAeILezyOJez8mukrDrmagXcIxSQ7vRGJNbfqPr1VpjbrshAOwRxMgD7yReIUfx7WlvpiX06cyI
	F+VPf2SCDRQSKj1tt9C/5u3C0EvlKj6lptBAhfJW1U0WehzYvMOw8e/75OFDcww==
X-Gm-Gg: AYBFou3b/rvO48yL04GhpOHpzqFw1hueLW0OjBiTlA6VHMsao0i0lNrH5WG/VQiN2ri
	oHRFs5G/nPlSRecaIv/XpCMVxNjckbJdncPmjnqBWc9Yzik82+LkHWQ9LLeNwWVSIie+OPo0Hb6
	dfX1PRczswIc0ZBoVAdCu+L1/4v4uZhxirLLAASt+S+abfozv6AuPcD7vSuRrHT0g34wmpKqmHO
	K3RdXnFa9UX+f61xmEwBOsVzeHz4mVcmE3rptUb8nWsDVIDBI1I10dYfg112wOEMWuIkyBgrQ/2
	Rjb1N6vMgUfmj2ovg5dkvqakoXiyXlDDZKw3wSq7SPVyFV6ev0W1ZsxCIIHKGti5s4Gyt/Fo7/K
	9AV1pZyDJgNy8pNvEQrvEYfEFZZTnowZZsOS1pWOO67nvyNLml/SP5mtUo38=
X-Received: by 2002:a05:620a:2801:b0:93e:fa30:f1da with SMTP id af79cd13be357-94421698c69mr2255265385a.45.1793711887490;
        Tue, 03 Nov 2026 05:18:07 -0800 (PST)
X-Received: by 2002:a05:620a:2801:b0:93e:fa30:f1da with SMTP id af79cd13be357-94421698c69mr2255259885a.45.1793711886919;
        Tue, 03 Nov 2026 05:18:06 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:18:06 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:14 -0500
Subject: [PATCH 16/16] squashfs: use folios to fill the bio in
 squashfs_bio_read()
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
Message-Id: <20261103-squashfs-folio-v1-16-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=2501;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=t7SANLGtg4RPuasvIE7jOIKBPzC7zGN7qcy2Vsp2lME=;
 b=wIlQnsmLHUTzRc5Bt3Gv7b9xqEq2XIga0BJyOZ1r4+avQz83UCzg+cOU9J6w6FhgPuZBB5ApB
 AfofcL4sPF/CgpHyTWkt7fgBvWwBXWN4zTraQ15sx4+0hwqpyD082rO
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX5+8GaoCxr2kz
 5PyyFz7iNPApdG43eEYnK2fuA4ZDvwhsRh8Pg/vcwBXvVG4YsxenjJDH88e7N4TqcRDRh8p804u
 UXn5B/gYCJyszxFwDbVlQeoE+UGjRU/+BKuyUXShnLj35g6Fjyo0CaI12AmgGrmLoZjllmDFvCE
 2ZsgNepN2tVDLgEPOeavAWfsE2shSOyPzCdxJFu+A8qya3r2IjpbUCzDPZwlAsNknb2U5KaZiXH
 a03I7XtT9hFDNeMhfb6AzBz7vP2bKrJBw70ODy7/wxX0cicA0n2n4nBryIbyxJkalJNScsl1XlE
 DG1iB64E8gIh5zCOInyS78a+a7yr5yxDLCWlnJUYmAJSw0TQBLWpAYp6XAbLZVYXkNr/6C50Sod
 IpnYA4CGCLVCABibxsJ1S9AzxkSJd8wYIZghaHEL0WC45onncR7FFdbO5yUQI9HnFi+IDNChWF5
 v334Cj2IHhe77ozmfDg==
X-Proofpoint-ORIG-GUID: DacEso2aKeejtOQur50RNVRwM8Q2NsyO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX5oVToHqIvUuK
 4BiPRsPYDDwBp8LXf9QoL+Mc/xIiNCWQmeocKmSHF17g5sm4SOTPNn3yO1pRet0+ecsMBxtcfED
 Pv9iSnzdG2r8d7oAntPxdYWzv54fvJVEZ+8PLV+IpESoo42DXK5j
X-Proofpoint-GUID: DacEso2aKeejtOQur50RNVRwM8Q2NsyO
X-Authority-Analysis: v=2.4 cv=TLrQ2Fla c=1 sm=1 tr=0 ts=6ae9df10 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=ZXDhCeJCSTKtkUGRDg0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=10 clxscore=1015 impostorscore=10 bulkscore=10 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

Fill the bio with folios. Use filemap_get_folio() for the compressed
data cache and bio_add_folio_nofail(), which adds one vec per folio as
squashfs_bio_read_cached() expects.

This removes one of the last callers of find_get_page() and two calls
to compound_head(). No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/block.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
index 3c81999ae441..bf0511c7b82e 100644
--- a/fs/squashfs/block.c
+++ b/fs/squashfs/block.c
@@ -186,24 +186,24 @@ static int squashfs_bio_read_cached(struct bio *fullbio,
 	return 0;
 }
 
-static struct page *squashfs_get_cache_page(struct address_space *mapping,
-					    pgoff_t index)
+static struct folio *squashfs_get_cache_folio(struct address_space *mapping,
+					      pgoff_t index)
 {
-	struct page *page;
+	struct folio *folio;
 
 	if (!mapping)
 		return NULL;
 
-	page = find_get_page(mapping, index);
-	if (!page)
+	folio = filemap_get_folio(mapping, index);
+	if (IS_ERR(folio))
 		return NULL;
 
-	if (!PageUptodate(page)) {
-		put_page(page);
+	if (!folio_test_uptodate(folio)) {
+		folio_put(folio);
 		return NULL;
 	}
 
-	return page;
+	return folio;
 }
 
 static int squashfs_bio_read(struct super_block *sb, u64 index, int length,
@@ -231,22 +231,23 @@ static int squashfs_bio_read(struct super_block *sb, u64 index, int length,
 		unsigned int len =
 			min_t(unsigned int, PAGE_SIZE - offset, total_len);
 		pgoff_t index = (read_start >> PAGE_SHIFT) + i;
-		struct page *page;
+		struct folio *folio;
 
-		page = squashfs_get_cache_page(cache_mapping, index);
-		if (!page)
-			page = alloc_page(GFP_NOIO);
+		folio = squashfs_get_cache_folio(cache_mapping, index);
+		if (!folio)
+			folio = folio_alloc(GFP_NOIO, 0);
 
-		if (!page) {
+		if (!folio) {
 			error = -ENOMEM;
 			goto out_free_bio;
 		}
 
 		/*
-		 * Use the __ version to avoid merging since we need each page
-		 * to be separate when we check for and avoid cached pages.
+		 * squashfs_bio_read_cached() needs one bvec per folio to find
+		 * and skip the cached ones. bio_add_folio_nofail() never merges
+		 * with the previous bvec, unlike bio_add_folio().
 		 */
-		__bio_add_page(bio, page, len, offset);
+		bio_add_folio_nofail(bio, folio, len, offset);
 		offset = 0;
 		total_len -= len;
 	}

-- 
2.39.5

