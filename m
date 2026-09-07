Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5311F3ECBE5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812434; cv=none; b=Kn1aozDBm0o/O1+STyGY27izGLjm4CG7KTGKyq6JmhcU2s/plYAArpsE/ph3+4+ftqtb4CW3OOoEa+hqRqsw6BvDoeItYS8RdonV/jN445R/TAPudWbRLidqCBqOQGrkyD/gofFZPKCAFM1bVqj81+3jx1t9HLsR0RhiI9cKbWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812434; c=relaxed/simple;
	bh=BcX8eAZRyTKOu9anIq4NjYeefUnKsXm3iDN26nTJMHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JkBJVZkfpwb8yjWoaOrhx9pHjhqDGSg36oXYj4PQlLL45svjH3NPAOA+vn/FAg1A6wHnnYbPktU/tfrDkRPIiL6mdINwcK3ekZlw3rOl/gAXPxsdUWUu/l+rx8MJMVRU6uLc6Gr2auOLWZgWtltmWva1CX6+QSjxW6iLf+S0ASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=nriSgN2A; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=thGtT2Y/; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="nriSgN2A";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="thGtT2Y/"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687IZ95D2619558
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 16:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=DZ1+
	6YkyruVGAe1XdJ5/MYgdff65UG0H/MQQoGU3q/A=; b=nriSgN2AxnwodQ+8Uo/9
	fhAeiMtWlgegXFbCZ6mjydZu8+9dlRinqH0cBQq0qVUMlsVJKd5vqM/laPNtV8lZ
	GRF6G7FRrcj+p74B0kw2joQNWoIWsuWd3UpNY71pLJkQHpar9Pj9xUZm6zWfBjXO
	KqYzvDnbZI+z+1yIsHMw4kAfXWm8q7J+LcZ6g5NjvIFLJsnP25jQD/GnrwHiBeyY
	FDyZZ7G55BdtwenCq7uUUGg7B6FcoByCrnpGC3+7Xq8tRUDrGswCXyAyofQuW4c/
	cOx0s124GWmVdJuiThGzB4hggo6QjrpW1y63lAm+Bb9NDjrEk9WVr4ItSso1k6Eh
	Zw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4ghdvq5tx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:20:28 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fb8f67601so47418811cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788812427; x=1789417227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZ1+6YkyruVGAe1XdJ5/MYgdff65UG0H/MQQoGU3q/A=;
        b=thGtT2Y/UMOYIhFcVSMZJD2oD25djin0eRh6sgAjD+Xta56AoV4E0EBlC/qKmjFDfp
         ov+w3eWm9iQnAR/X/F+0h48XhSc96rXPGAt4dSuJd/IKNQj7yjUQi/EJx3w3Umz1sf1m
         XSZoOgl/xbGYyMG4SsGTf4WWv+23sZlgtgbXn9UMdb+2wmR16loen46PqLzqOKYD2ET+
         SxFb3M2fTvnpuOjx7NxR4rU09/fSyrVpYWIaQQqUvKuwJOdw47M/Yd1HVYlIuLT1XUe7
         UGyLD9MsKqzjP8QvnnQsQE5KmQNvenLCTLKlvSXQFdn/Np7B3om7vw+l6yz8Ng/xfa26
         pXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812427; x=1789417227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZ1+6YkyruVGAe1XdJ5/MYgdff65UG0H/MQQoGU3q/A=;
        b=Ei1a21NKvNa6iA29VevVisQvUHfEfhlrrs3Ltq4U130GbUJRlN2qE36an4hlrH9U/J
         KB12ekE7lT/9+CNzWFSvhTtBrMFR/qaH+iu5/WpLO2z8tFVrBMLSpG1rDJxgntNlIoIW
         Byf6GmTtf+NsWprGeZEWuqWl1d1OWY8HCN7eNjnAuc7NLAPROslnWWiiSHNCrrMteY1q
         9C0GZicvxLtKhHOctjPJPrifHRlfz3ARkpeFGOIy9tzURSDEiG98iYMVwIBtHUL/y7fH
         8L7wx54RxIFmmvHcZkhwcFqZVelgo3dL574lXmhmlasMbrR2F4Tt0NTwgbJioyH2qIYC
         nuHw==
X-Forwarded-Encrypted: i=1; AKwUvBw2fvb2aybR9myet7A5qjLU6FB9jiSu6VXuPV2+hsJNmxqPu13quecDQ8N9iZiVHzNVYUJxQW+jK0XLwck=@vger.kernel.org
X-Gm-Message-State: AFuF++kLa4aK9HluIDX67zZDaYJq+4bp9TPRU0fxISKfYkMWjKUFaYuo
	Wn6usnDrlmrDjo5GDRD+CW6G4vmfgl7HkKznbUNhL7U/4kmJwPuuwQADsEYEXtrU8yglT4ev2D5
	S7mbSJ45X3q37X2S5mChkxugtitZJCWqyefSsIKCAKBfNs8r6H3hRCeR76bRrkg==
X-Gm-Gg: AYBFou32qgT08Wj06UafBhQn7YixYEsaDprbiQBpVqa7cavqqW/YShGqwubQGOGxq9x
	SB7op1IKKnVE4iEXQkU/B0hAJddUNYa+e/kS90IlWq/QZDTROSA16GxbupnE0Q1DMH+CcLARTDn
	1V7Zwnw8u37laW0g4Xwiua+L7K9pm8xKQHaUp9vR/0K/xfr9aVboJdtAi+ZdLWpNU2dkvvYAADd
	MavnPPj29JqiUNE8e1A8Aa4B7Q6h1mslW2zevsPwdWmbla3Xpj+Gsq5JQqx3WLLi5oX0Vlzv5MQ
	cL7dCPRH8/IA2/GL87AtnXQpL/qBTQXR6Juf4+OQqPBGpY6lJgnO+DoneZ9uoNAJ2W818Zj1iuc
	DujRhwizynW1l79EwJIThUKQM6jlDoHEN2c4ebN3uCu0=
X-Received: by 2002:a05:622a:a06:b0:52d:6c37:6853 with SMTP id d75a77b69052e-5305483db56mr276581941cf.16.1788812427328;
        Mon, 07 Sep 2026 13:20:27 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:52d:6c37:6853 with SMTP id d75a77b69052e-5305483db56mr276581321cf.16.1788812426875;
        Mon, 07 Sep 2026 13:20:26 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-3.net.columbia.edu. [128.59.176.3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413ce9dsm95062351cf.11.2026.09.07.13.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:20:26 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 16:19:59 -0400
Subject: [PATCH v2 5/7] btrfs: convert heuristic_collect_sample() to use
 folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-folio-conversions-v2-5-b5fe79f7607b@columbia.edu>
References: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
In-Reply-To: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812420; l=1718;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=BcX8eAZRyTKOu9anIq4NjYeefUnKsXm3iDN26nTJMHo=;
 b=gs4Q17e52omuNOjSXOnvvJSvaHUJrhX1NAIyHnz9G84ICSi0uRS80PwzKfTt9PGXV42BB8f3l
 Rcow9nqNT+RDCMnmO8/6MAs/1G8EQHeIDsu2H2HI+733sgKpXd/TiiF
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX76MUExjOr6uR
 GhAYuLsbPEVf3f/NoiYmXAot4Gd/FC1W763BsPtV96pSpwD+IxM8oloHMjUQjtbYvIiFKzq3ksZ
 Ft/wMven0c62Q32wrjvJcBqeqwxGuJaeeix0zWuNyB8gPiRdfsOH
X-Proofpoint-GUID: V_osxmMGxbVhJUeZkQqBEuAAm2Hv3ARG
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a9f1c8c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=92j1mJcILCjWExuphHMrQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=iox4zFpeAAAA:8 a=Ih-HaCMmXATMOsCFYvIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXwEDdJgwfiX+B
 2xEWGSUUafDUN48NKKjzLpDDL0FDmdB0n2BswVHsS+KWH6HUOdU+T2nB6mykgJ79AY7+4bhdJq8
 XeptCvQ897njYDOgj0u66qYoXiOXK3S+q5t3K1XSkr3p93zTRNyX6xBKC/eAb87GBwSrVWbbXur
 61Ebr24VjAtFH8bFpUuiMXbadx5upgazvAYudellKNjPqIiOY8oAZxXnBY2oWni6Ieml6v/YKuo
 dKB3vxpqeWxV3kdyfrPVjFM7tT5EYGuacApxzwvkE8W9Kb7y37yUixUQOpcuheafMCG9FVqu80f
 93/HI6+WCMfzR9yUTearfipFxGKkoS1mPjTUo9xBvYJ2cpbZ6llHw/wJuO5RW5iyP4Q4QHGRc0u
 X0m+O9bO0zzwNAlpaSWLGDMRze29t3VQG7scZM1MhpHQ8jkZ085NhNUKDYLsVUjZ7PgkJsvRGdx
 VDUK4ZWISxE6KmOz7Ig==
X-Proofpoint-ORIG-GUID: V_osxmMGxbVhJUeZkQqBEuAAm2Hv3ARG
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=10 priorityscore=1501 impostorscore=10
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070224

Convert the sampling loop to folios. This removes the last caller of
find_get_page() in btrfs and saves a call to compound_head() per sampled
page. Document that the lookup is not supposed to fail with an ASSERT().

Reviewed-by: Qu Wenruo <wqu@suse.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/compression.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index 979b2ffbd8fc..fa8b92592321 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -1488,7 +1488,7 @@ static bool sample_repeated_patterns(struct heuristic_ws *ws)
 static void heuristic_collect_sample(struct inode *inode, u64 start, u64 end,
 				     struct heuristic_ws *ws)
 {
-	struct page *page;
+	struct folio *folio;
 	pgoff_t index, index_end;
 	u32 i, curr_sample_pos;
 	u8 *in_data;
@@ -1514,8 +1514,10 @@ static void heuristic_collect_sample(struct inode *inode, u64 start, u64 end,
 
 	curr_sample_pos = 0;
 	while (index < index_end) {
-		page = find_get_page(inode->i_mapping, index);
-		in_data = kmap_local_page(page);
+		folio = filemap_get_folio(inode->i_mapping, index);
+		ASSERT(!IS_ERR(folio));
+		in_data = kmap_local_folio(folio,
+				offset_in_folio(folio, (u64)index << PAGE_SHIFT));
 		/* Handle case where the start is not aligned to PAGE_SIZE */
 		i = start % PAGE_SIZE;
 		while (i < PAGE_SIZE - SAMPLING_READ_SIZE) {
@@ -1529,7 +1531,7 @@ static void heuristic_collect_sample(struct inode *inode, u64 start, u64 end,
 			curr_sample_pos += SAMPLING_READ_SIZE;
 		}
 		kunmap_local(in_data);
-		put_page(page);
+		folio_put(folio);
 
 		index++;
 	}

-- 
2.39.5

