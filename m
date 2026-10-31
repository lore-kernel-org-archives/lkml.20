Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793479518;
	b=2+b3odbvKSR8cQFFEIMCyafJIHqz+XisV8puBCdR5uKz4Jq+3yGLoIzRFhkS3iGMV62X
	 eGajXXFhq5R5KpTWS7nFZGqQIavx2NZhluzzOlugy2jKzQgCmXTf1M6ylNmGD4lWnxb2Z
	 bnP1vDsyYRtwetBuJ0UTaC72RNzrzom7jcplh0ELv1sFNJEq6a01HFGdEW7Dv/kH7aAMB
	 kIDAdx/k+EFttIDlpzg6KV3Tx9tWXqVAFVOvYS7qhG0Qx2+rnfhlGIkMNYalxJ1uuL7oU
	 6GkfQDdtmM1MBBA5IA1T7x7tzAVDv5ZmW1bPyVU76UvERz0FarqeL2ErHQPHalnvJ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793479518;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Uz/Fqze7vjXHXkw3xCMrYU6OhmBnb9pnskloOWPqElc=;
	b=MGQWWcTw+LFDqpKTDnIMAzFh/Q9ojcH3JkqUpNwmi7LEntWoD9PToy24c9DrX7I3wpTW
	 htPyCbQ5clrM8iYHj1Ec1yH6F1HS2H0fj/+2rgkBOp+sTbK8iID4+V2B0+GXBY2lxL0zH
	 J6uT0dcU+ng6AN5dJTlxKGEoHwoRDVjZhtnHgvmkSN63f7JETXVhuW+8NSg3RkSuMVZ8f
	 Fddvrf/KVkxGsJXS++Csfzc4fjeBSg/RyKskCcEI6h3HFBAqPJ93v7BRnzit8w27/fx9o
	 87eVx/MKuf+qvtGEuKcDnvrr0SoURWFSxRQ+G0fc8y3km4fxLrpx9od3KyANpDLuXOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Au9zxSNX;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=o86pMxh7;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F7B606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F7B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Au9zxSNX;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=o86pMxh7
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDoAOu3699299
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Uz/F
	qze7vjXHXkw3xCMrYU6OhmBnb9pnskloOWPqElc=; b=Au9zxSNXPrPM62rbkt+E
	zqPdQF4JQblJl4rrMOcFHPen9286VgEZzE7phKxVeFhJTkoPUsCTsUXeUnDax81u
	ZgJoVSDUM9iKa6VPh8SjqfxIIP3glCiwcy/14xQwQtCCxF/pi4eQ8e4OiHAlvWjh
	8I4Od1RUUrUmZaDp6XKaJJsjIDnNCpLepxxvXHaB1LvlTd7aoUITXobQM0Icr5h4
	blCSMbtyxYXBiLjYQxNdORgCUpOTaTM0TadWkeTYW/7oaOrJqfWE1wfmnpocyyv6
	rNNzJJXo1QZKhtR6gccroyyxKXMbbptbzdrK4bl1bujha8rnYPbjm6JcQfEoixtJ
	4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hn2xhw932-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:45:17 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so456337185a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793479516; x=1794084316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uz/Fqze7vjXHXkw3xCMrYU6OhmBnb9pnskloOWPqElc=;
        b=o86pMxh734DstvoJ0wDehkvLdMNzv0MVgr2LU0qYkWTsONkEu3dddjJZ7JzZ1zxc6v
         TgAQUfXKxixKIkxt9ZuIihvF2RAZ//hRtO5l5ej9i3wLttYV2rw6CtDWdoUgtnYoGaCj
         lu+UAFILvnVEYTKA9OAaso4SMj3LyPo2Xr0ED/NBOhySz9dzCFDMArR4+1QxJPRqxUuJ
         pQQnRVWcVm27ajGQ5AX9PU0Lh3Useb7jp/SD2tzNJRsUx1QpEgYfyPn5VzO6qr5FWN5+
         lFJpitailBhjthGswLYRFI9NERXyZqx4aIEfARdT31CA63zh9ReTXQef05AW7fxA9QK+
         +TFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793479516; x=1794084316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uz/Fqze7vjXHXkw3xCMrYU6OhmBnb9pnskloOWPqElc=;
        b=nTefIS3+FZlQPv72iJ/aIm/Fe4WQ7Q7E0hJYUI5+aj41+eKmJH3bPk63zjLIKc9gte
         YHNXfrBcd9EgYE1iXEsitVozCcwyBrMQ9pReW0bOc1r/Mi677PQlK/p1mr+WOl1Pu7Hy
         eXibKMEiGOUTSWRWs2zS/r4+zlaD0KevFik3Ccb3jmdjvbLcB5OjWbKqA5KYSISjF+ie
         NDot1CCNwXSZupuaYyUb/L2Z8RreNM8YQyDOYeLdp5Xevjx2+GDeTXmecx26usJL5GsC
         W9hKg8n7D+SNrzrNr8QVpxPt0bkDcX6UtSgukSyay5XeG8Vfe3dxoshczsTvxznS+Xnh
         inkw==
X-Forwarded-Encrypted: i=1; AKwUvBwSSZ+MPpg31vrpehIdzDWv8JO71MDfGC6sesyljx5skas5AJfP8DlFkilDs1NhGEAHH6K+b5TVUHMyk5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRwygmVK0bfB49g9mlya3SXU+oNpGCFds3m9f6j0k0N8+a6V7m
	zieHhchRqwKv82cU6hFgqj5RbhNEy9tbKXomJogWcMEBiAvObB+S7RpNARY+u6sF2LtF8RHBwJ6
	IvPe1O5TlmwDiUaunBr9lHG2u8V3zgvFs2UJK/jNBWAw2agtGrDrPZurIdP9qegdaU/pbiw==
X-Gm-Gg: AYBFou0hTXTE804vRhqgJJXepjT/9K7Ua2SuHhO4fUGU87n5isIYSz8HLPFsR2JvQAj
	kXKpcZX+jYnVydNB4uBC6YCJjXayI1cXtohSFacmgibjcbNqjUC7NxqVu1NIejFSGu7wFNeEBXc
	QHQk79nhdujvwJLFH+TWKRztOh/cy9jTLrpAukWQOZq3D0Af9B+9R2JkAwZcjtdwmeH+2qXUPtB
	ppT7EBVww/t7w6Zhrxyiowp7mfCkpNBg5X39Bv3k/B7IXPJKqbKwn9yhOJvmhkOTvS6OPeCBv0R
	sQVNOOSKeGuQtGzJ7u6zd8gbsrGhNjzIom4Y1z1yNhpxaDJBYpAcKhkMHt2R/FjqV8lHY5kVLLQ
	4tNvrsdOfrmdaX1yuL7Igdo5He6jqKbsY09IQqQmW0Rx5r9rfCQdKd5BONl4=
X-Received: by 2002:a05:620a:1793:b0:93c:c96c:a592 with SMTP id af79cd13be357-944216964edmr1075239985a.36.1793479516252;
        Sat, 31 Oct 2026 13:45:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:93c:c96c:a592 with SMTP id af79cd13be357-944216964edmr1075237585a.36.1793479515783;
        Sat, 31 Oct 2026 13:45:15 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.155.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad35fdsm104242845e9.2.2026.10.31.13.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:45:14 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 31 Oct 2026 16:44:53 -0400
Subject: [PATCH 1/2] arm64: mte: use a folio in __access_remote_tags()
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
Message-Id: <20261031-arm64-mte-folio-v1-1-a8bc2960d11e@columbia.edu>
References: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
In-Reply-To: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793479509; l=1922;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=umaz6XtbnXVNpH/k5rdDfLFgb6VcMXDTiPejDNlmohE=;
 b=gDvQQkEeZ9SjHt1/v4NbIHqmAV6DCAIWWIMmD2WSp3mCHc6fo/TgbTc0H5mDpRgcqzSHu+S9A
 g0CNvPZ4J6EAySnpfH9w/eH1aV8BpNzBYziCfogQ6eBBex4eCpIqmtB
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: gvxJXHjDDztv6qQ9otUH8o70VlHQSleg
X-Proofpoint-ORIG-GUID: gvxJXHjDDztv6qQ9otUH8o70VlHQSleg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MiBTYWx0ZWRfX6J/IFgRef2JY
 KEcP6QKbvbX0yvfjfgdCXGbZZp3L82r6ZUEg9xiE6WCRI5Yma2VTnkznDaMvD9O4pAFwNs4iXCo
 I8xNnwzjl4cNAcS0lybMhYYToBztvpGhgideB8qOWLVFG086a97XPOs/V1HhOSFoDIgQcE8fwvA
 UIOZ+6rTAC7xjmNBpklsJjEFUuyIXRanWrS/pJDOEGJFae/k8K/X+FGLD4gUB6Wxs1DTSxzYvpf
 c4brCDz5W0hJrXpNRCXeOnbzfj5Yk+EQ/1HUMjCaAVDDKP0Ev8b1acL1b5brGH4vwtbVrEZR0E/
 ICSqEJVn6zvNTv83FwCuV5byGVcogKkDuMYpyO2jsb+LnQk2JqWP5DXEi5EwD+4GbrefKCMEpuO
 VP6Th/ySAk7ecXTcHZwH8+9cxLyPcctFo98Za+z5nxJK0ZXv09S1IDzd4vgh1l+SaAFOfY7jATE
 myeSEnkBno0G1//nZTg==
X-Authority-Analysis: v=2.4 cv=LPLz05W9 c=1 sm=1 tr=0 ts=6ae6535d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=OyQKmhT2Qqi7aVZxTY5mBQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=Bu24Ljrm87nzk03AsjUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MiBTYWx0ZWRfXx2XYH1uA/Pf7
 6gG949n3vB3eVLyl164I9sYv76ClZBhCIIC9O31JMsMUhntpCbUR7pl4/ejgLXkGSA6oSXBNoXG
 xxUTwgRtDvS3BdRTapyUhrzK3bd0LXtMWp61uqx1Xfl0DDkbgnSV
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=10 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=10 malwarescore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310082

__access_remote_tags() looks up the folio for the hugetlb check but
still uses the page everywhere else it can use the folio. Use the folio
for the rest, which removes the hidden compound_head() calls.

This removes the last use of set_page_dirty_lock() in arm64.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 arch/arm64/kernel/mte.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 31f5c6b0510e..f8d39e70857e 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -467,6 +467,7 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
 			err = PTR_ERR(page);
 			break;
 		}
+		folio = page_folio(page);
 
 		/*
 		 * Only copy tags if the page has been mapped as PROT_MTE
@@ -477,16 +478,15 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
 		 */
 		if (!(vma->vm_flags & VM_MTE)) {
 			err = -EIO;
-			put_page(page);
+			folio_put(folio);
 			break;
 		}
 
-		folio = page_folio(page);
 		if (folio_test_hugetlb(folio))
 			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio) &&
 				     !is_huge_zero_folio(folio));
 		else
-			WARN_ON_ONCE(!page_mte_tagged(page) && !is_zero_page(page));
+			WARN_ON_ONCE(!page_mte_tagged(page) && !is_zero_folio(folio));
 
 		/* limit access to the end of the page */
 		offset = offset_in_page(addr);
@@ -495,11 +495,11 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
 		maddr = page_address(page);
 		if (write) {
 			tags = mte_copy_tags_from_user(maddr + offset, buf, tags);
-			set_page_dirty_lock(page);
+			folio_mark_dirty_lock(folio);
 		} else {
 			tags = mte_copy_tags_to_user(buf, maddr + offset, tags);
 		}
-		put_page(page);
+		folio_put(folio);
 
 		/* error accessing the tracer's buffer */
 		if (!tags)

-- 
2.39.5

