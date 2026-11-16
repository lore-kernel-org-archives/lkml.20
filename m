Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866907;
	b=QIgIFJAbJbND43CWzSuDrNyKip88NdukilTQXuIaz6Y55EVGVJVZe9eaPgSLxygu2QxE
	 ZQCLHb5M2mRqn4rbrP35pd5wig1lBMkFc2Duh+Oj907VtzZLHzY8nhypijPL8MyFIPlbB
	 W9i6mePr1rTZQvlz8plqGTYw7NFH3uwM7zdQIEasq4FagMuXQzP6hq1bxK529jjyiHzcD
	 IAjD3o7wZDAY4XYk5p15bTbP5bToEjs8sDWE+jl7vfoyaSjqO53ZuOwIkDq3nawNPq1EG
	 3uCaLOdsH+8zJz5XcrouJeyb8IF9P6j3kVhQdTV7YUzYKqRuBpZLI6FPXpW9IEGxN/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1HR2RLdcMRaD9EbSYsw/zZt5bThBAeaFepmhayLTiyQ=;
	b=I4gAg2yu8VEpOk2OjNTVt4JkyMaA7WzNg9tB1M9ZMHT37wVp1fX8D7IGWXn6Eq3n43mA
	 UyHkl5H0rOWFZ0NvVMQsZod9v62msmt3KXsi2jED/9bLhAf3H/J1Uh++oww5sIPV/I6uO
	 oKlQ2YxeNnm2xa7AgdmdF9rmJqevojFLw+M2xpAyW7ygJeKQhp+NlaSI/Mx00slkSFOIY
	 +wMveBHfBAzN9FKXgc/mRbwow6iAhtG1Up50putwFQwtaWhG348l0uP7XSVmzjfJWUUB1
	 zQSsG0fO3y9jRnvaJrXbll2nSIxeUtHMdtXkG6BqDdHDuWc8STI48axNiE6cfo2hB+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Lcn01MkO;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=AxlJQPpg;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494B8606A89C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 494B8606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Lcn01MkO;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=AxlJQPpg
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLYgLV4118738
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=1HR2
	RLdcMRaD9EbSYsw/zZt5bThBAeaFepmhayLTiyQ=; b=Lcn01MkOQnctcq2KDfHD
	2//hXu3P9VxU1MMd/XhRdHcUPTGCoBOQ9SUfERtwU/ZSzi90lJPx/FCADS0GnZte
	JZC2TTJUpeDeahdk70KYtwuQ0i3qEZl8msXqLmtPZ1svLTqbrqvB7mEaSY20PLKl
	V/vwh6oMPrYPJCm19AJ3wBmSPSn4jqPke9Ir/2dNaXLQn42Bb7mfHWGXMoyHPqB7
	UBJHtC+QyKZ8ifTolZ4tV1sSY5wlZZ20yCECvKq4e5C1ue8AbXzbqbbuYg4evJXv
	EWLIOcXoEurHbilveBVO7fpNzXUXVGXMuEQq1jLhjS8zouNxGYwU0SqVvKGHU7ds
	TQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0598uajf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:26 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so1010621085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794866906; x=1795471706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HR2RLdcMRaD9EbSYsw/zZt5bThBAeaFepmhayLTiyQ=;
        b=AxlJQPpg9DO35i6r83bS/cAglUj33fYlpt4Rbizr6rruZi6xdYCaLmmXdDUsFEv5AW
         L+uEkRCYxksVzVBGgfyFWtvLAkcseCgAStN41ByOzb/TFP9Zz+I7c0oumlt4UBGZ4ezi
         ObrEHq4tNwTanI9+yn8OG+ippnssIJx3LYELe8IgSgInyMdRHmO7yAybVlu8NRsrsR3J
         J8pZZqeQ4JXHHm625qAu9tOWkxUXVzajOcaJ081TedlGwLkvjJt63WLWjc6sZdd3/B2h
         htXnT0dC07KOEph3WYK0fhcT99NvDJXmpqIP0orEZd5LR7oYThCRC3jJaEusKXHbB73V
         aqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866906; x=1795471706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HR2RLdcMRaD9EbSYsw/zZt5bThBAeaFepmhayLTiyQ=;
        b=o0mv/rp1wMWBOZ8/5on4LOngNTqkW+qXz+X6GLSdyYa1XgeLeaIREiQJ2GaQGYDhgB
         7OhPEyhWlC+7DEX24H9fHwvUnzMKCOqOnZtw8noVuzRonG6dUzMID7lcxQxqIVez2jYx
         o+Bnkwk037XuWa9BWpTkjXyXEs8iC/Bt/ygEcxPzZCGimGqizrxdl+H2sYWt1SxKtlcs
         tASMlMAI3PrjGL0wvUIXjntt+Btsh8p48BPmZ9U0TfB84PVgKMp7DowjV2B+wFUAQieL
         FZnLg/b2tRgBRqqISB5w26Jsz59pd30+BtLWQkZzHFWQMr+p2EBLuaCB4OzQNnVW7bR2
         fmvw==
X-Forwarded-Encrypted: i=1; AL+hErHLgD7f7imO4PcpN1vhzFtox989ybvOZSRRPLuk7152TgTr9Nig61TjNgi41byjsDjbu1absNMVoYLYfgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+zjt7rT8vhEnIhUsQTkBFgb537jIP2N+3BNhVp5ALFhCqj7q0
	3Pgkzg1a6UZlD/fP4/dH1XvtDVMa7yCHRKHZs1NzwCqeC+xzDEtVzLcg5LK8PcFsgBJXxDVQMoj
	yExp8D/OuXdllghm9wnr402UmCRAjpj9epx+d6vJBrQxtTC2NuUqXGlTeaF6r8Q==
X-Gm-Gg: AYBFou1mfqshoc4BPkD9Oy96EXPwVj9rtTXmen3M/mkbjRQdlxYwQhNZMuy+B8cPj+g
	rIAI7FYMT4eo33GYfhcCtllg7j1iTIps4vuMMjhVu00afh+6oxTpqqt3S5fEYQL7ZqXxvBHwAAt
	5GWPuEg4yIAeLg7AXaIM8vxjWXUevmRVvtSLYujSyNO0gwHRBUaXAy9jaAn/l6iUnw/DGecYc/6
	EFKHLHV9pny+B9pMU/j5dq85CVIEZekNG21qQcCmtv0ok9NnLQ4v0E69jgDcCGb0kGLkboFQsSw
	IEPZtnpUBfKxJbvsA4GqFhFsJqbap4EI+RU8d5gwjUrZ39s4T0piA56q/k8hiuB3FPfpxu7pIo5
	4o/y+P81fVU6WX9VHH47o4whS/GMt/8JuHqw2+esPhGfS1KH1zcJcsZVbGudrIPOqa/L9QntQAp
	rHapJMFrD1L1NknkCYucW+
X-Received: by 2002:a05:620a:27c5:b0:949:7b2c:671f with SMTP id af79cd13be357-9497b2c6976mr748372785a.82.1794866905683;
        Mon, 16 Nov 2026 14:08:25 -0800 (PST)
X-Received: by 2002:a05:620a:27c5:b0:949:7b2c:671f with SMTP id af79cd13be357-9497b2c6976mr748370285a.82.1794866905252;
        Mon, 16 Nov 2026 14:08:25 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c86c946sm951838885a.25.2026.11.16.14.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:08:24 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 17:08:10 -0500
Subject: [PATCH v3 04/10] ecryptfs: remove struct
 ecryptfs_page_crypt_context
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
Message-Id: <20261116-ecryptfs-folio-v3-4-1aba8e620eda@columbia.edu>
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
        Randy Dunlap <rdunlap@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794866899; l=1031;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=8nNsMMmNdcqVbMlIKq9eZpT/6NpoMNBQA7psRulhB58=;
 b=sdDdsOb04BJGImGvRcaS3h2apUzwX5ol2azcfjms1C33PJmTtMwV5ypen5E+kRDOGFGXDJ1Ds
 lvUrAPyKb/HAK7uqtIR7alJB4aAadSi8hS9BnXRq1u8Axb6u8da3K5l
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4OCBTYWx0ZWRfX1Snrq/RnswFv
 tO1uOMV8GPyv5TdepGWjRHR/CThZYGjz75XCXf03J8V8NrEUXfnSPST/hvvqrEWfFZFQloq3YLU
 g7xQeJFqP/1m/W6SFee4K2auFqTl5asCOI+FomUWv5FrwuNMwEtR
X-Proofpoint-ORIG-GUID: QbMxXiKq3M0SuFQ3zRlLme8PGKUhv6rx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4OCBTYWx0ZWRfXwxTHWYoi8RH7
 NQTf62ISJgW/dZIY4tuO2l0Hd68h8hk1jTe7EJcoOnDzA1E59wIdmIPaYrJG2hAmNCt+Qfw0ZOG
 uZZtFp+DqAPkmJepTiuKytglGWqePXBeF29iM5w4FvMvSz9CPClAIj6sBahrQ48ZJK4LO6fmyY+
 V/C4S+WGn24/Ub7jxmX4mEFTdt/hr8elG4k1NXVnW4b6kSla0wVztAqjLYooOn+rkX/iKgDyJNe
 JNld0S6l3nocQxHhbi0j83zOMIO/p1gPC2/RV/MONyFjWhmOKXx9cq2w/BaLmijl1tvUYXNK3Ei
 doPGImEUUNE2AfFnvK+VidJ4ghP2hRb18N5dbkq4TnqSARMSb6fdTjqFh56fwuOC190Hl243oKe
 O9f3wHjAWgLKzQp17Y9G5rNWHUT8B8Qc4+pfIL8/QkOM+zPFGEsSnq8XNiJsidsBKQ+LSdlSkLK
 8toZ9BvbfmpPldxDAmA==
X-Proofpoint-GUID: QbMxXiKq3M0SuFQ3zRlLme8PGKUhv6rx
X-Authority-Analysis: v=2.4 cv=R/aWitRX c=1 sm=1 tr=0 ts=6afb7eda cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=4zUkhEILHW4tcmWJkwUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=10 malwarescore=0 spamscore=0
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160088

This has been unused since commit b6c1d8fcbade ("eCryptfs: remove
unused functions and kmem_cache") in 2007. Remove it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/ecryptfs_kernel.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 4315c18ba1cd..d828040ade89 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -64,17 +64,6 @@ struct ecryptfs_auth_tok_list {
 struct ecryptfs_crypt_stat;
 struct ecryptfs_mount_crypt_stat;
 
-struct ecryptfs_page_crypt_context {
-	struct page *page;
-#define ECRYPTFS_PREPARE_COMMIT_MODE 0
-#define ECRYPTFS_WRITEPAGE_MODE      1
-	unsigned int mode;
-	union {
-		struct file *lower_file;
-		struct writeback_control *wbc;
-	} param;
-};
-
 #if defined(CONFIG_ENCRYPTED_KEYS) || defined(CONFIG_ENCRYPTED_KEYS_MODULE)
 static inline struct ecryptfs_auth_tok *
 ecryptfs_get_encrypted_key_payload_data(struct key *key)

-- 
2.39.5

