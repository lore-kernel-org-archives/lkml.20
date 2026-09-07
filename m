Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D27C41D4EF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812432; cv=none; b=omqBW8hOBTHnYoHzoWPi5MnyvbjuIo6k+OYnyI7J2Uh3CKJE7Oj4RXdxUOK/9WJAdW+AIi5fQ8/oqKTck/rgwEmX627+7zQ9ekmBDvREsMMxZK9JJLMD6zcm5gXl0RYgrrtMeLlNoMeICC3ulR2HaXbVB29OcNoyOOggVpq4vYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812432; c=relaxed/simple;
	bh=Q8ljCQeoaeoN+ae43nM2Vv6Q0j+dQccM2ug41NNICUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L24fDwIdYDdAj1k9SO+ENiw2uv+HdrllWj1OO00auUhQILH3pX996CpNncliSPBG1c8OKn4T8gpK8AZRsmZU6DVGi5yce5erFPZhyra66ciTXGVMGZX41O4FsJhm3GR/qg7DXejhvtMj6PSNMTZmb0/BuLxzVhoVGebtQK6Hf7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Ol6vKf75; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=xgoRXZf7; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Ol6vKf75";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="xgoRXZf7"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687IYhUL3506780
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 16:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=XJQN
	0uKsYlPtSkjrcSF9XbS467Wd3IrFH8lDz1PZ5Zk=; b=Ol6vKf75F4xp2P+zi7Co
	LUaNmpH6lhq6p1fumZkEBryc1duoY2ZRB94Q5yE43JpDobCHrF05uM4Zh3F92jE2
	zo2kBlAyb234m4wxrD0MAGVgQBhuRwKgF5WhQXnq3BMp+gp4E/HB2z79rXehLvo8
	k5V7ZmEwXe6KZfhOBStbeYYVvPMhiTOHviA7eoyv8LjdLi5WxgGba5sPfnzmcI3R
	rzs1BA8K4w1zrVL3GNqwGRVIPOr+gM40Na32s59afScRTQhq400o0x/u/2QlAR2/
	vGqWKK97qW+hiti0F5lQgaIQBBPsIRmwsu5sXbX1XHlM2QnzNTEPIpaq0yQM6gEz
	Ow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ghxx21yhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:20:26 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52f9e903b02so59295551cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788812426; x=1789417226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJQN0uKsYlPtSkjrcSF9XbS467Wd3IrFH8lDz1PZ5Zk=;
        b=xgoRXZf70J2ihezYa15K4VNEi43+z9Vit/bxl60nkSaYMDgRLk68DSC+WBlViT8nZe
         o+OGo83UWVPIioZjBAh7Yc7hkiaYBrz4QsmgfSGtjpp2B2TNHMkGTZUR6CbDaMZMNm1m
         KSTaEzaxR8MJeexR6M7Nqny1+to0khIBYjm1e7pMfYgc/rHbVwP6d11avZW2DMzlkiL8
         ynLZGyHN9ypbTw8lacZo8Zi8DtQsIG17wUrVSpCBPKyZiwbvSq7f+JSCoATSCvivo6+w
         FLxLPWNcwi0LJw40fsoYxZN6TRf7P5zrR67kBsF2GPdXKeCG8hAB9lertpuJfdMlM1rr
         EEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812426; x=1789417226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJQN0uKsYlPtSkjrcSF9XbS467Wd3IrFH8lDz1PZ5Zk=;
        b=FEtrCJOZoYtQlhpKNVBP2CSagT2sQgStVIxYfXxg7WAyK5zYZ334YrMYlusdGH9RMB
         +LDhLS93g19YjvtZneysQBgMIABCbhB0BQ3kbfvpmEKHYZu3kkZo3ZARu/fHf1AFZkHt
         4bFgAi6mAEJ3LzPSRTAWKqZ+iCN8kYvMLsfK6CO2VP82VoP7xW8IgytEVk7MFC3rKMAh
         RoJm+B+mnGxZUrBGnOUwk8Lw+Bt1PJwU4s29Vh4KAuZDO9S3AyW+gJqBcf2h/JgzRc5S
         NydnDFUwcYGkS4D7aNAJtjzJ5QRTcQNA7QkMMmJu56ujPhkulTg1dnG5hyv2I3h9DD4e
         41fg==
X-Forwarded-Encrypted: i=1; AKwUvBxZTL7mqC4enaG0XDFtNoQePXMnQ+8u9B1VQTQQVUmUU/oLWvDXdTHz+kZXU9agnTH3LrO48RICqvRRO/A=@vger.kernel.org
X-Gm-Message-State: AFuF++m5AEu9bM1t9okqSU/CutbkKIdOqRZh5/Uddxh023pVW5K+zoHm
	TTMiQKTnLVZxf595te9UFPjpezFTNC8+3mQjwHkpZMJcoSV/kkKvcAc9vq3dkVmV/8IVhK5DeJ9
	8AVLl/vdOop5fr9ZASXewjiM0Dyufp/UV7ET+KkhGKlx+cqPNNqU8RYZDuh8UyA==
X-Gm-Gg: AYBFou3qSRV4rJdPYSpDSH8juKWAyVRcMcIOr6doR9GJHpInOVYA99r4HIxKwPIkVAM
	Mdtl2UX80wKjDhxrDcvkFidhpsEoY2tWkreH+XIBsyzIEUFghxz3BoJHybkhaTnXVGLiUowUZrD
	qiwYfJkcfABCY0geXqyXm7y687/hhA+Gsbm9FgOg9YFmNnV3W1kJPgDXQTdjEaOcaHNNIkJq3ea
	ELE8Nqce4zpcv1U/IAAFrXCXKmKZbBcFQGsgj0s24PACH5JTEIgDj2hpTYieTzTI6tu228ZrnhR
	6haXWd/5NPxoRyz3Wf4sDxJey7zgZFBermue824B33txkx9NwH9cNw9q42teTFLGeZ6IPI3DGaj
	uN8a+1/JaENiSfW7He1bJDf3mb2rBQfnCSnrsIynpa10=
X-Received: by 2002:ac8:5756:0:b0:530:4773:1142 with SMTP id d75a77b69052e-5304773137emr248442151cf.32.1788812426386;
        Mon, 07 Sep 2026 13:20:26 -0700 (PDT)
X-Received: by 2002:ac8:5756:0:b0:530:4773:1142 with SMTP id d75a77b69052e-5304773137emr248441821cf.32.1788812425889;
        Mon, 07 Sep 2026 13:20:25 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-3.net.columbia.edu. [128.59.176.3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413ce9dsm95062351cf.11.2026.09.07.13.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:20:25 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 16:19:58 -0400
Subject: [PATCH v2 4/7] btrfs: convert btrfs_compr_pool_scan() to use
 folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-folio-conversions-v2-4-b5fe79f7607b@columbia.edu>
References: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
In-Reply-To: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812420; l=1104;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Q8ljCQeoaeoN+ae43nM2Vv6Q0j+dQccM2ug41NNICUI=;
 b=2RXfdIhT6KuiqFb0u1aNi27qH93hxs1M9rXGGcYK2FV81QV9J1dkThrohMqPvhO7ztYr9AdCt
 S0qobHWeNoNAllmsgkxqYm3KvELi80dIIFXuMlPbKUYx4oO6RnU4h95
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=YcyNIQRf c=1 sm=1 tr=0 ts=6a9f1c8a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=92j1mJcILCjWExuphHMrQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=iox4zFpeAAAA:8 a=HJL5WrqY3U93294rNdcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: Bgbaq3mWx38hhr8T5k1Kp2DNVJTiGb5d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX/W98x2iaqYIs
 JCjMW4m++H8tlp+cssWjvyyPdCrO7JUADQnndYCF03rdHyll4rbHRpGvrRffRHSTwZydoJMqJfY
 0eaWJX8EckXlJVnjGyU2GVn1eCSsRtEaEgje5aCqVc4fti22ZJXu
X-Proofpoint-GUID: Bgbaq3mWx38hhr8T5k1Kp2DNVJTiGb5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXwcqtnVF/g9ts
 87QUsnYEYJAPkllnL5PZwk+F1y7JGyNjmV7bOS9kfyk4SaJ5FUQuSJMwFhc8TgWyVJC4FWcstz6
 6mVOt6jlJC6YJgT0UkNcuUnR9+vOOXDgMsPcjKoUTFJladpM1IZp0K3/CNZMAU2GvjZdmFL+uDV
 1IMwnx9DCnphO0MctnTDvOwVMeYj5nq7fZgZdmL3vVA7LNFDJDYCWYwxXci5D/8oLV/92B4s6A+
 2IMY7MG3IgYrdv4t7VnoIFeq9TF846DirHf0KbeU3RpAPm7SK/feE7u0nDHcj3azz/3ySxnqFAy
 B6GCPKG0SOg79x3wsDXN49ll5fE3oxacSHLfGAu9B7Jy/4DXYGzk1stk0FSnWMBG8YUrFcg62MM
 BFzJVETbnxARmIAybl5qFVvajS76aCXR7YjqCHhGlA4gJqWxDIqPO2jg5ZINlHo4xOAk18nlPF+
 +TzNcHlgq0R4Ok6gfHA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=10 bulkscore=10
 malwarescore=0 impostorscore=10 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070224

The compression pool holds order-0 folios, but btrfs_compr_pool_scan()
walks it as struct page through page->lru. Walk it as folios, matching
the other compression pool functions. This removes the last use of
page->lru in btrfs and saves a call to compound_head() per freed
folio.

Reviewed-by: Qu Wenruo <wqu@suse.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/compression.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index c62b5148d5ac..979b2ffbd8fc 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -168,10 +168,10 @@ static unsigned long btrfs_compr_pool_scan(struct shrinker *sh, struct shrink_co
 	spin_unlock(&compr_pool.lock);
 
 	list_for_each_safe(tmp, next, &remove) {
-		struct page *page = list_entry(tmp, struct page, lru);
+		struct folio *folio = list_entry(tmp, struct folio, lru);
 
-		ASSERT(page_ref_count(page) == 1);
-		put_page(page);
+		ASSERT(folio_ref_count(folio) == 1);
+		folio_put(folio);
 	}
 
 	return freed;

-- 
2.39.5

