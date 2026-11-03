Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711863;
	b=2Ulex+zuXZoSJ4Pmtroh7UGh3hkaPvlKAfkyBVV9Drkwjq1n0ZPn0iDZHGu0c+OgWFKQ
	 oX5MDT5VgJQmcmLKjDpYASOfGHi1/wnc/sopYIW30Kh2uAdt+lA4Z6kq8iiwDqwfZm7hZ
	 h20vstawESf61CHlmOYHo64Iq8qP/6Poa9CtzGoyRG8B1aZEvEvnTzinLUoHMib91RtSm
	 Rn8ofj3BW0WUGmz3qfm7aFfgwr5GUCfuaK+BOMJl/XIqzU+7OMXqRNL5jKYYLZGWpN564
	 sGTF5uzCZldOdP8Q21GZNl6hjKB6z1GImawt/oe3h84qF4fUEuW1NrPkg26rrgd+YjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HqFcnPyfzSuZm59WBilsmjvYcFmuJCpEQX4tF4/vjSw=;
	b=frAzEvuKgTAYqevG5ZrGsKZcAqJ5l6KKX1HRO60m6XlcrIS+x04nCrjhNYkrOaFQqkBz
	 NVgqR3Z/NLgtBmHMeoysWb8cnK7hO9rhT1wObQcwnUH9ad7PgOSzB30gaW3TJv5UxNo9R
	 K7GazJ7GCEdgQaIL7Z/gLYo52OQUZtV9T+I2Ls47Go9sjIczPiPrH/ESgwZ5pNQuvEz+d
	 18mtSfpd8EASu5Sfy3l8Bo9CKQxe1vBfN6OZI8hpYydeJjnjb1Mc+Qdp3OJNkxHpsSvMT
	 TSxKDlHdV5hl/tAfIzVXiA48NVaAoY6ENSCQXKNrneeuPWSOEPb0ZA1EZpJ3uvYcVhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=vNxJXHN4;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=4QFHTuLR;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDB4606D817
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DDB4606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=vNxJXHN4;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=4QFHTuLR
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A39ICX4866991
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:17:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=HqFc
	nPyfzSuZm59WBilsmjvYcFmuJCpEQX4tF4/vjSw=; b=vNxJXHN482xPl/cjLJOY
	Lio3IkcX8tcrmsiG2Ev5ugRoa6KcgTIgfxQDp91cA2nnfp+HoaoMJtmxSXoxBEIM
	2dLBRyQrKr8v3hQzuRur14cuiufQZObRudXqGqTAu8DQUW6vwslTKhBs2UgcNr1G
	S2jRz5HLeg8xX6TaM5Z9Q6zv5MpmLB8v5V6aovGzAxX//5vMTePCGzo3rwlxIhae
	kYXAtbs0WfLOhE6Wy0hl7+abDFfOnCnwHxNjxIOM/Cl0MAyq7qT1ypaN9D+pSBBH
	T4zDR2S2i++Lo6YqnyB3VoJI8m8rIOGGFkdEwnVJQqvINF1WQLKoh31ixQw5xp/y
	Ag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hq3y8b5c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:17:41 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1e62510cso912551485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711861; x=1794316661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqFcnPyfzSuZm59WBilsmjvYcFmuJCpEQX4tF4/vjSw=;
        b=4QFHTuLRDO3LmCZX/JN0SRplwjARIYh9He4gmkExQF9rRa/WNzc73A+LcqyaEQoc6C
         BGI0vITi94sZtdco5qBwOTb6PuS0pOoqfD8exW2OxU0i0EUG7mxqf9i9PX5gihHNhOSZ
         k9fAmD5rAHnlGOlqX/j7MzEuG7UdQG1wwSepwWVhA3qL96w+YifirnqrxjEMrpQtMEt7
         reTaRg9oOkStWISNtIPBHkIQGcNwhfL/4ZLQwFnoNRuLjo38cerme+/YFe5ZP9Wmbvk5
         xcnZP5FW/cOOecWEINt1dDjHw9M8s6tGGhhVrvs1thKROpWAkFPpUOvZmq4uS9/GuwDL
         i80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711861; x=1794316661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqFcnPyfzSuZm59WBilsmjvYcFmuJCpEQX4tF4/vjSw=;
        b=tO+LrvXl+PTkb2kpHBaiXy2lwTKYRJ9vGUOVW7B2dhOMjO0gDsPfTcUYpLttvtiF2v
         luNwzAtURT/9jMkzrw+iZeX0titdRdULSABqqqj9/N0+LTakicbj3G/6Lm4y+056P76j
         Tpt0zDgsnaOdvnKUAxqbyjul9W2Mu3T76vWud+LmXaTw4LseOK7QnyySPL0y9JoI6bkS
         089GHK+HFru2s7xAZtMqk7V8pSC0PNuczrW0Iv6F3Hh+pYl301a76RHRatkKkO5eBbRg
         sr5vnb5oLhkEAXqm/MrRR88EeX0arOf+cNjuHoNNTNLE34nQmvAplZvopLzBjfw9sjHN
         f4ag==
X-Forwarded-Encrypted: i=1; AKwUvBygZ+QBoRqKgvvikJzzlh9otAUwnvy9HbOuEfyl6qMtabvbIh1ji/MhtGmKHHNr5jcF4Ux5Jwd4A9CShuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hGK8vPsjctQeNzOnbqH1AX0U61xODHRazDOXaMDeOX7KySLXM
	p5osidkrXgHc7xIAOE3FvROrwZ0nztVmEWhQLcguax/W+pfY3GfuhW4EgDYnljU+LihnmZkMShY
	6Onm+5uU5KW+iFFiQY/ATfbJLt5nCMSWYqWV9czL6hY45d6iuDGPnBZvB5aL0rQ==
X-Gm-Gg: AYBFou2DZj3CEbM4sokfzklw+ne26zM68dIB5anfRDX48Bxj6NyAdoSZP1CEJFgxnm1
	tILJtbPrhrBqfRqt2D4xzLRPfozrNy6d6DMRqrrA4yFZvOJNCFuNVq6lyMF0HtDQFhJPm3T/ZpV
	7Mo95pBNAU9Zl/zdK/Cx/YuQcRqUgZd9ovpmE9S3oqo9VvMt3VcTG58Q5ucxw5RGdfrHIH3PnCJ
	nOv7h4Omd1ZFjrZjVeHlpZ670UhKLLyyRq7a1oLIGbDCQKPD0e3gVnfG5DzV9yVXBKETKIQScRF
	aW1fo8yqEAvOtKq4sBWZya2g26KK1qGsdQ6ZMTBvxb8BPfH251IiU2C0WFDhvotsvfCLYRZ7H3f
	EG5vKZoU833PXwDwYFGbT/fzQ5iIUMwmKpZVDQS6jDHHNMoSQHlQGLpSVcKc=
X-Received: by 2002:a05:620a:3188:b0:93f:3646:7a53 with SMTP id af79cd13be357-944218411eamr2071253685a.83.1793711860742;
        Tue, 03 Nov 2026 05:17:40 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:93f:3646:7a53 with SMTP id af79cd13be357-944218411eamr2071250485a.83.1793711860327;
        Tue, 03 Nov 2026 05:17:40 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:17:39 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:01 -0500
Subject: [PATCH 03/16] squashfs: release the grabbed pages if allocating
 the page actor fails
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
Message-Id: <20261103-squashfs-folio-v1-3-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=1334;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=efypQrpn/b73zsQU3Coq95Rqi0HpSFUY7KMlLGRCohI=;
 b=NRvIh1TO5PCnhNbCmzYalH3vkmpetuN+RN9XHYgN4rNl2WOHXYiw781pYLY6j2LZqtIbma9/8
 8POCiINEc/RDpp18fKizbLEYX50yD7IQUhnDq2f3Hjw8zY5KCbYq/uc
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfXxezvVlboobTO
 ONxN9VMkTa6jcovtGrYsptC4h7UL+VZuzcjedVnlDNaj2XEjGPbhG94fsUu/1SBInGTacgpnptC
 jEq+qQmYmWrRh6eUiT8dtX2Y7RDgnSyn1l6ejvi0R4iKQr+lywoZiyb+awG3WFGRzjJEz20BbUf
 vA27q5L4bQD8DK6+JcMTgZB6dtCr83siiOjNTELFUep87ARkSCYuq6Egtaq6AHZMSAEgUjTWjU+
 DuEwS2nHb14cuM+dRl7bi50eJofigDOro00oNab1AtniN+8bNTwSvv2gCpfP8sBHuGkt6CCF0Px
 o8S1qiSPCHdvB5ZJZtwNzFCr+ZcSqDoCSGn7+dwX2zgEFSSy/ehQsx+qkSy7/rLGavfP+gBJz4o
 D8qJDXAP04SIR6zjBPBK1D3NVuCrjKm4wR5kDXYtoYc6sIaE4iQjcStpKk0kM5uBg7imwXZiACu
 saqb+gKyBJRSwH8p+6g==
X-Proofpoint-ORIG-GUID: TkmztFFiwHmF9GRDIeXmlbw9iXVs8VIa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX3jS1aUSZ+OVp
 rXosmUSd7BOmLPKXQD3iKTD3AUGb2jp9F4nlJizkemB8bftnRf84kgnC6r8XQlXAu1UyE2lDN2z
 eR4feFACtZHaIrxHXR/BpayCy8+SLYRZoL98D5YPGWRVnnvvMw9K
X-Proofpoint-GUID: TkmztFFiwHmF9GRDIeXmlbw9iXVs8VIa
X-Authority-Analysis: v=2.4 cv=TLrQ2Fla c=1 sm=1 tr=0 ts=6ae9def5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=VwQbUJbxAAAA:8 a=U5fOvYNq48yE9kKlttIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=10 clxscore=1015 impostorscore=10 bulkscore=10 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

squashfs_readpage_block() grabs and locks every page in the block before
it allocates the page actor. If that allocation fails it jumps straight
to out, which leaves all of those pages locked with an extra reference,
and anything that later reads them waits forever.

Go through mark_errored instead, which unlocks and releases them.

Fixes: f268eedddf35 ("squashfs: extend "page actor" to handle missing pages")
Cc: stable@vger.kernel.org
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/file_direct.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/squashfs/file_direct.c b/fs/squashfs/file_direct.c
index 2c3e809d6891..3b6aa4727c79 100644
--- a/fs/squashfs/file_direct.c
+++ b/fs/squashfs/file_direct.c
@@ -70,7 +70,7 @@ int squashfs_readpage_block(struct folio *folio, u64 block, int bsize,
 	actor = squashfs_page_actor_init_special(msblk, page, pages, expected,
 						start_index << PAGE_SHIFT);
 	if (actor == NULL)
-		goto out;
+		goto mark_errored;
 
 	/* Decompress directly into the page cache buffers */
 	res = squashfs_read_data(inode->i_sb, block, bsize, NULL, actor);
@@ -118,7 +118,6 @@ int squashfs_readpage_block(struct folio *folio, u64 block, int bsize,
 		put_page(page[i]);
 	}
 
-out:
 	kfree(page);
 	return res;
 }

-- 
2.39.5

