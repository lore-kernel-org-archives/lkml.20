Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597A341C2FF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812435; cv=none; b=jLxdmhkq09EXtyzHdolxWY/WBXs4oT2/G0qleUVgHM8ezY+plWw4COdoJdR2wiSQZ22Z9vcP7p0ScI7+n2r4lHtxhU+P1cZiiciwL1ewD7+Sg8AWAz5fmZHwLAO3o065qPng8ISWQjWL7aXgxXu4SBbKIOa3/C40G6sp2U/hlkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812435; c=relaxed/simple;
	bh=g2CDSqBl/ImGg6f7xVyfdVp8st71N8auj/JHJ7GqwFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOTEBfZxiNT4/zBdfr+P2UjDfWAr/v3b8849zF8n1aZF3yxJt7TiLFWQ6Da9hoym4lKMu2hRFRn8Pjx+h6xxmkdxX5p/TPIlR/6iY1HpssUPHTiJRu3ImLERCv6YV/d/OZY35tvynKUie0BWfEEcBpfQo9KFE160N/NYK4nu/GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=fA+em0+b; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=XVDD6eRA; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="fA+em0+b";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="XVDD6eRA"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687IZZ4J2956685
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 16:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=3Q0g
	Ra7dtg3Hs8zCimh8kJ/W2lm6+Rg5TzjBLCjf9Us=; b=fA+em0+bkZObRq19/DRE
	UN4XZKGLjycrxEGxHLn4EwjYYncZyRi8Tm5fHbAeia5ZwhfeUvL4shN9NRWUnXZA
	f/Vkfsezl2P7MZAVDJt+nt7aVkvt3mROWfdT6l87BsmrCjCC9+ZdnT8hhFPQMwVg
	NECJ2jEjLq5+TYUl9X9GaarYEhLoHnY73emx2GOdKQs54Yi1NzmPXV4jqJTRAV7w
	ByZdW/HdJTPb+eTA/SMMvCJ/CSlaoAhoakAlprB1G++WDCPIOg/vHj4Yl4aHF3CH
	CxK2z4ciUI1WPqE/rx/v+ywqyadICx+5J9ph/hdbLHWBfS4VW8LTBQosuvraCd3R
	XA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ghf7kwd3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:20:29 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ff59f2c47so91168161cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788812429; x=1789417229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Q0gRa7dtg3Hs8zCimh8kJ/W2lm6+Rg5TzjBLCjf9Us=;
        b=XVDD6eRAkkyA5wRvNI2b8OkWCEDuvN5dFNHUIO6W4gc3bgMNzTcbn8tcsANoSd29D+
         lB41ZAsTjb7NMZCUJ1jOR6Urt7zT0fTeGIzG3NPKHG/TT3Oso9/UAOm60nZUmECOz703
         0AAFivnWLL7tnjQ9hev+yaW33mLdRrYQJWeZGGLvUVnlaRPT77YVxiX4oWFtDKyB8/Jy
         coCF0/u438eEsksFTLXX7cCX2p8GnYSvkcLSFNlDHK75x66LbqvQIhD6bxLS9wd8BSJ2
         kfcMU+CHWT7Vk0gzMMFQB6P9dGPj9wL4x19ptCGZhkkDaRRQsmxnjAN8p5AQReJfqWbV
         uDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812429; x=1789417229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Q0gRa7dtg3Hs8zCimh8kJ/W2lm6+Rg5TzjBLCjf9Us=;
        b=mxxOx18jqkESw+8FtnNxTmWYCGYUR0OFSX3Uele1WrFhb+GwRBrOMu6QWCT83YiIcd
         gDl8WDAuDSmHUFvwkAfl0u0+rFLbDBk9jhBj2+Nhi6MsVCwAzSkBnmz7E6wGuWQfYCd/
         aZm9vZm0azwvivIZssgGlDM3QFBgfqE9D3rMgsqudxn5she3IdrWH8IgK0qmtf2V+Apr
         +GXELUEBdE/iVh9ZroIf7jCfkobRNIxKm5v0tDL2J8xS5YQmhQzQW9X7aZPGH3evh/el
         QvfcGZo956+AN/zfE33Nc8pJzn5FYkpLY5Yy8gjqWMdnsFlGO76pkbt1ZdyJXzZzONcT
         7xiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjdBvTjWScdJjt67PyGDfL97eGBu6As/mkq2I1vr4HJqkZTittdDKgA3aEsLZU+IhnjOD+8H5TmhMojhs=@vger.kernel.org
X-Gm-Message-State: AFuF++nyL1azgWMHN/RuP1ZZ6BydNO+CeU2jjtEupmry5NOqAFjP/4qO
	anjA6yec5wKgf2kfQG5Vv81gbRHWsINLDJb56kRBfpbYTpPiCSePs9i+3xjIeBmcR/ll+h/oLOo
	CCIvgMcIZ3rMJER6VLme8FCC6ytgpAdj70TQj5kcU2nTWUwR5n2+8d4f8UAoIJQ==
X-Gm-Gg: AYBFou3NHgM95G2r4w+wZJHQHU4o668nC2cdAp/x0D7Aof7n4zFR0GPwVXRk47Q2Cis
	dreZQ+PyT1CPEWhyLNFPwbYnAkYOI3pyWAKG9vIADL2iWJJAAf44Vq9mczre8Zr0kUbUVZ17jvh
	MY3GaCHbvS2QQpOwo3S+t9NNKHXl10drKIVpknF9dKWGePYXhrjRfIgGylTlEgbWpZ28A9X6Gs8
	UEy8IKNXPJOvvchTTFlba6Cm3D5ZSt/BnjTRCffu5OicdNR6MwN7YTxUPRYQOxOOzLS2nboVNg3
	v2KDlRpwkjaajE4AM47AXRZWmHsLGS6gqXPNvUAJ2GQ9OUQh1wfQneChcKYrzK4UVGiVGvIBXK/
	jtFMxy5CExI8jOltHUX5a4atyO8Tf6R0tdOVt/gyItpE=
X-Received: by 2002:a05:622a:1f98:b0:530:42e5:f39b with SMTP id d75a77b69052e-53091348827mr40841371cf.23.1788812428378;
        Mon, 07 Sep 2026 13:20:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1f98:b0:530:42e5:f39b with SMTP id d75a77b69052e-53091348827mr40840811cf.23.1788812427764;
        Mon, 07 Sep 2026 13:20:27 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-3.net.columbia.edu. [128.59.176.3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413ce9dsm95062351cf.11.2026.09.07.13.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:20:27 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 16:20:00 -0400
Subject: [PATCH v2 6/7] btrfs: fix stale function references in compression
 comments
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-folio-conversions-v2-6-b5fe79f7607b@columbia.edu>
References: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
In-Reply-To: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812420; l=1315;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=g2CDSqBl/ImGg6f7xVyfdVp8st71N8auj/JHJ7GqwFk=;
 b=QGa2pMLlpq+DSLcMk7QnBSVbClmGfxhOaq3KwEPUvhHGJBO8hnwiP7nn1EEEYTU0zV66FhgYy
 NJYxeH3zc+/A0xk5FJjHdOAyFQ7lGYHoBhiRuGPHND5nM9WpoQWNjlV
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: CfSelVj6DqRSCo-aB-ohA9pXzOZCw-O4
X-Authority-Analysis: v=2.4 cv=RrD16imK c=1 sm=1 tr=0 ts=6a9f1c8d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=92j1mJcILCjWExuphHMrQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=iox4zFpeAAAA:8 a=wS94dJsgKqXJMQyBkfsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXyAitDItSPOoq
 3tjyAukgHajS2gIlhXF5GACUkuIzHEBx1iEIQ0KzMLi7OfDChKXedlXgo2kEIaqkYosItzX4lHS
 YpMT14eJn+vy6AgsJT32YbaBC7Y7jt5+3JpY1nWBWr0R8FUgBh4YEXWzqtPaAN14l/uoNZkYcuF
 etqetrHExQ3lOUikHEsnEqppvtuLs1Rhqk/RL2cYnuQveP6CYTMfItDql0Q2MyjKSo3QlnJpvIc
 aH3tdQwceTFvHEGWEbgduFt7CJWMxSGDvpNM7D7lxhevRh94N+Kq0i0pErqPXTgZShfTOopCfuU
 jeZtPOrIelC8eA0V+GFRhpAVwz5BKp3a4QYRxHDMJ/SsjAldO9YwWoYUiZdvMJBoo7fXqYfkqxB
 jG//sgEDZIw6p9vcZjAKCNbNTpmP9PNyIL65tdO/RjsurmqfoLyEKAIArPJFFBXawsS6pdOY6rF
 HoUdz8moayyVDnfK0+Q==
X-Proofpoint-GUID: CfSelVj6DqRSCo-aB-ohA9pXzOZCw-O4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX2Gn6mE7ptaaW
 0TWKZYwBaunnihBWRETnsBkp+GQnj26NL8OKyn0DyWD+Rz/qgNvjm3VqK/uaq4HkIGMuZSeFQW5
 P6gzzh9+YN8KzRizOj586/c4zFvEUwyUc3IsLDNYRadpyAnhmHrn
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 suspectscore=0 phishscore=0 bulkscore=10 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=10 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224

add_ra_bio_pages() was renamed to add_ra_bio_folios(), and
btrfs_compress_filemap_get_folio() wraps filemap_get_folio(), not
find_get_page(). Update the comments accordingly.

Reviewed-by: Qu Wenruo <wqu@suse.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/compression.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index fa8b92592321..20169d028961 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -431,7 +431,7 @@ static noinline int add_ra_bio_folios(struct inode *inode, u64 compressed_end,
 		}
 
 		/*
-		 * Since add_ra_bio_pages() is always speculative, suppress
+		 * Since add_ra_bio_folios() is always speculative, suppress
 		 * allocation warnings.
 		 */
 		masked_constraint_gfp = mapping_gfp_constraint(mapping, constraint_gfp);
@@ -960,7 +960,7 @@ bool btrfs_compress_level_valid(unsigned int type, int level)
 	return levels->min_level <= level && level <= levels->max_level;
 }
 
-/* Wrapper around find_get_page(), with extra error message. */
+/* Wrapper around filemap_get_folio(), with extra error message. */
 int btrfs_compress_filemap_get_folio(struct address_space *mapping, u64 start,
 				     struct folio **in_folio_ret)
 {

-- 
2.39.5

