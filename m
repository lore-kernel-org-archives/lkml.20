Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE803F4858
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812431; cv=none; b=bFh7z2IEQq1HqXv2oaypoQdCuVf4MGmwxUzUVICdyYYRUYac6oiFJpoMj419o1SJJqlQOfdhWOg5uYeYotXvldh086jWFbEc/tXya0W2Awr0khO31VIx47dOpD4MFfc/87YYYPZhHOamJbEy5AWpidlykdlII6c0k5oQlKi42Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812431; c=relaxed/simple;
	bh=JibSQGdAEYY3mJm8Xkps8m6r7Q0UFNwNv9ID7AtRvVU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c0YeW0h6Q9L4cR8kOlskZwvciPRJ06WTLTtxJPPFoaJucLgemh5bCNZuVKmtRCjMslraWcQZ/P9mQTLv7Gg5wmfLX9KuhbO+MWq0PRikuSOXSVQR56IBdTUc/K8b2Z3UxI67d7W5Hrkb4VeqhA18Wfy8XtjJ+OpXKAKMYNC9ag0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=K9prNAHN; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=NERSi3s0; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="K9prNAHN";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="NERSi3s0"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Ic2Mh2536486
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 16:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=QiGtUshKZxylmfjVR4DIvzvifN
	mZrFAeh+Ui6UZX1lU=; b=K9prNAHNtrZnkjJMLA+8HU3Q+5fjLNfYujvWL99tdG
	gPmP/V3Jy2aWvHgBIXIkxYpUw1uB+YC8eT2FqmW6I+8J2IXz1O3zzDpdEnoZyviT
	TTfvRL1yqMfBq2F92L/2z9BRucX0aHi4q17Qgx4nyGqRydsVkDMB0PABBXu+38/l
	+CrKZ8v2iE0/izEG9J1Se1MWZ/n+2PB62msWOe5gPhRHzkB4QdhimcLPp8ltZsFg
	BRlTS/wt5q9acON/MBoHOJZ4C4nDSYyJm7zWFro6/nLC/zpTD6Hgrepg0pwYRsSq
	lqcfBOZcd+3UUQ4vr7qhrgcD8K9A7bqx05ARtWLUTnTg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4ghbg3ed1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:20:23 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9102f07f2fdso82626206d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788812422; x=1789417222; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QiGtUshKZxylmfjVR4DIvzvifNmZrFAeh+Ui6UZX1lU=;
        b=NERSi3s0X1T1WRAoVI3PWSe/yd7SiZB1y7No3JDvgEuWvX3y2sP8SR19Q6dA0djeYn
         gLtyfeM3/JXw5zBEQgSTDri6Z6ZYhbJQszzPJtUmhPXKKd6Jz3VgWmfboBZRLjym1wPU
         EYfZ3YJq0uR+MfxlZBJGr4QgeKrgfb0jh8JP+YPi8Y3VRyybUk5qhLjq8JYRbu6qkiyd
         nn2kndi/64yz9mGcgRZ136BvHsZ5jXBeam9Lja5Ml9MDe84JrJDWekxQEI/ugD5A+8r8
         K8W8wVt4i+8+ARPsAReG221IDnbRVnLKOEXCr/MiV/3p7BGWPUTYUrsA3JT21bzHWAoO
         f5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812422; x=1789417222;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QiGtUshKZxylmfjVR4DIvzvifNmZrFAeh+Ui6UZX1lU=;
        b=YKWsf6osA1TxuOaAzN9HYv9N1ckq8iFeTlw1Rq2n0l/2ivmr6nNyo44868A2AcT2xF
         N26ElFyDcQgwziAscVZNK2arlOrqdDDrR5laU0uCquoqJ9sjKd2s32UWgq6v4W3vfVj3
         z9IiugwpSzdWIwCyxxfna3zeTrWMgbvYKkSlwwg9dpGNSzAwObWdH32Vd2VkWuKSGFkf
         q06OElpWF0hjwi/74lr2cBpMgBSQVVk0fwEqWV3ezHU2zB61qy2ofQH1AHbZQsVUARYn
         s27XkywV1/WgQg5nwlO+kemyguUcwc2uapLeEaI8JQ6vecdt27ksO5SQsXnik4ZLHWn+
         VtlA==
X-Forwarded-Encrypted: i=1; AKwUvBy3+DyDLrpGOxUIjiydO38OTtXwUiIX1nGu0sQTZ8QlSofpcY2OJBhvaLE7dWRiTECZWq5HRASPILyZi0w=@vger.kernel.org
X-Gm-Message-State: AFuF++luY87rD2XUZbwisMQQAOqRx9gz7buVhVEeDfS17uwZ8VZ5wMbe
	mZkHa3GJKyQPpivAt2gltSXQ0aPmX83YKP6IBugQKQR7Uh3xINVQ+ZJn/rYwetrAw+P/4bUV11s
	0KZ/JoiWptS5QBdaQ8/5GyH/E9u/YGFEoaJtZAnWrDLDhycPXLb6ebePsrEQ9SA==
X-Gm-Gg: AYBFou3To8m2EZDGzFBYshV/ZEHj4q2dde+nLz+a0GaOMKUDyhs3KFdo+RLq7Dr9t7r
	iTQIRQ4xVbuwwyNe1Xin4zKXBmr/bm4ps7mi2YW6KxCmD1IZ6erTEvpZvuO0O8oNz0YXGrP0S4b
	DQgFgPJ0msZ/JBK++R4+SwQ+qRq7ln2CNrUPD57ZxA5oFVBozuOq2z+BqVceoHp/Oda30ERM7D+
	n2XvobmJE77HH1jcfymNHm50CRgsrn4AgDu6BCA9HIeKjxIoYf1uYJ+RMsD8WTKJk0FQTiyWQq+
	PHaFOVbExH7dFQQgZNmN9q5NE9bRYFSks2sXP627AL6FuScFw7j+YLWIX12yCs6H7iu0EqcFnCR
	pN/BRV3BNIJj3vA8eRsjcGrCtX3eNlKrGME+sgXqKUVE=
X-Received: by 2002:ac8:5fd4:0:b0:530:4773:113c with SMTP id d75a77b69052e-530477313e5mr235126311cf.26.1788812422361;
        Mon, 07 Sep 2026 13:20:22 -0700 (PDT)
X-Received: by 2002:ac8:5fd4:0:b0:530:4773:113c with SMTP id d75a77b69052e-530477313e5mr235125891cf.26.1788812421885;
        Mon, 07 Sep 2026 13:20:21 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-3.net.columbia.edu. [128.59.176.3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413ce9dsm95062351cf.11.2026.09.07.13.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:20:21 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/7] btrfs: convert some struct page users to folios
Date: Mon, 07 Sep 2026 16:19:54 -0400
Message-Id: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGocn2oC/3WNyw6CMBBFf4V0bU1BHsLK/zAs2mEqY5CaDjQaw
 r9LMS5dnuTecxbB6AlZNMkiPAZicuMG2SER0OvxhpK6jUWmslLVqpBm8paldQM5CW4M6OOFZV7
 VhQJIrQYttvfTo6XXbr62X+bZ3BGmqIuLnnhy/r2nQxp3v0r5txJSqeT5lJu6q4wqbXEBN8wPQ
 /qI3SzadV0/JjF+09MAAAA=
X-Change-ID: 20260905-btrfs-folio-conversions-47950cc1faca
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812420; l=1970;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=JibSQGdAEYY3mJm8Xkps8m6r7Q0UFNwNv9ID7AtRvVU=;
 b=8osdwXZDjj6YE5G9b482rUbacFI0PDcoPP6GGCobKDiiYr/Tzmc6OEboHZZYwGReopZAK0BY+
 /y91BEgM3RaB+J9NrQ8ABTr1XxO0MUHLHzAEFGQ9e7afqmW7cnG5Xf1
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXxYkEwWdPm8nb
 4OLbKTmGcZlZLnoaf9/NdJ5yebu9NszXSYc0uPkyOUR49Jt+983qRqBtvwZuVOS2RtkcSiy243B
 UA87jFjw+odLiyBm3ysOG45VyIsD0d4ROtilRa8KXmWz2CTD05Be
X-Proofpoint-ORIG-GUID: uEX7imNeOtlSuvxjIyxllsMfJYOT5KAl
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a9f1c87 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=92j1mJcILCjWExuphHMrQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=bC-a23v3AAAA:8 a=O0ZaTJuHp4YmI9DrRTEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXwQWrnqF65cj6
 NfccGdTwRc7g9b1eh47gaPZL5EUtkKYVMO/Ia1AIx0L9v3XuakevDV6XLhtTGVMUqqPqye/Rw6S
 lZxw9kCZg8jIZX4uSycebPP2ohH63+3qXe1SFEQYdpZ5f8ytvXimh3uB4dq0I/1//p918XIyTm9
 66y7RDLJgtNcBkgYZYYPleYv2JxFkp/R/pPtJzfvgJKo4ldw9yrZXTwjA8t5j1JW5OvV+3zmS14
 79gZmqzwG0WJilPyxpm5QconPIMJjeTlV5TU6wNxihwfWetmNoQ24OHmmgCmz8dgbH63c32Bxzy
 ErPoT6iBwZLoVcZPHjLEs2wPYAsvs/THboebREL+RKDlk6q0GQPmhtFCRAWTJh8T5Xnia+YmqFF
 R1R8NiFUXLPNwzMGuU7GKmwk+SIohIh7yGvMiRXJPnmK1wnGyb9A/4SxM5R4oxM3zo8gqHhGhyZ
 1unG+lxtQrfwigdKq2w==
X-Proofpoint-GUID: uEX7imNeOtlSuvxjIyxllsMfJYOT5KAl
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=10 malwarescore=0 lowpriorityscore=10
 suspectscore=0 clxscore=1015 impostorscore=10 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224

This series converts three areas of btrfs that still use struct page:

1. The extent-io tests. test_find_delalloc() uses the page APIs, and the
   extent buffer memory checks assume one page per folio.

2. Compression. btrfs_compr_pool_scan() walks the folio pool as struct
   page, the last use of page->lru in btrfs, and the heuristic sampler
   is the last caller of find_get_page().

3. Super block reads. btrfs_read_disk_super() and the zoned super block
   log comparison are the last page cache lookups by page in btrfs.

Tested with KASAN, lockdep, DEBUG_VM and the btrfs selftests enabled.
xfstests' compress group under compress=zstd and the btrfs group both
pass.

---
Changes in v2:
- Add tags (Thanks Qu!)
- Patch 2: Assert that test_find_delalloc()'s folios are order-0, per Qu
- Drop the v1 free space cache patches (8-10), per Qu. The v1 space
  cache will be removed instead
- Link to v1: https://patch.msgid.link/20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu

---
Tal Zussman (7):
      btrfs: tests: rename process_page_range() to process_folio_range()
      btrfs: tests: convert test_find_delalloc() to use folios
      btrfs: tests: use eb folio helpers in extent buffer memory checks
      btrfs: convert btrfs_compr_pool_scan() to use folios
      btrfs: convert heuristic_collect_sample() to use folios
      btrfs: fix stale function references in compression comments
      btrfs: use folios for reading super blocks from the block device

 fs/btrfs/compression.c           |  20 +++---
 fs/btrfs/tests/extent-io-tests.c | 131 +++++++++++++++++++++------------------
 fs/btrfs/volumes.c               |  16 +++--
 fs/btrfs/zoned.c                 |  12 ++--
 4 files changed, 93 insertions(+), 86 deletions(-)
---
base-commit: 69b26c13e520480d1869171e2c2b8a59f0c857ec
change-id: 20260905-btrfs-folio-conversions-47950cc1faca

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

