Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111899;
	b=qAEoysHd//2z5eURjc0oLP+Qt/P224bIlmqvdOBWr1GUcDu+vql1Baw7ISlJuQjw3W+4
	 UFVf4C7z8SIgxHjwahIXouYAfnzV2C935IH5TF4H6dR+KSK+fW4v1wddVZ0Q76LzWIYXA
	 LIHLvS2DL5urB2iMOy3ZOrTC6g+N13tIQ+fqre47vKoYQxr5hbzbjfk+jBVFCkF8JS3u6
	 qasNl1xnJis8bI+osRWt+Ko2Ai8ckfxZnVcpKbJ+eSANQxogSpGF/uAs8iUaEL1LxVF2i
	 WQtDD4ToXV/sVEJfhbKUoNEhIRibtLYRDBhYohpAEfRJqDzhU/YlUbnbwT3wxNIe0nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111899;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K+8Bg6EUw3TF1wR9YyKQuQJJAgHFmn9Yf5SnbT8zOjA=;
	b=uEB/CI1RxYW1lWeu/9rRQeKHPUIct6K+pwlIuzl1kNXKrDPbqNAXFaQmNeMx5exMONoK
	 9SLn7RTGHK/mLJKZimN9dwOsgH8f5UOkETsugIO/VIJZV4GAS0M5Hf3siScS7VDJ32Pxx
	 eI3578tjQA3AzBL4L3TRjnBhQ7IuNjy6UkJm/hmEYvdngCafMILwerTUKBxsW80XjeGLc
	 fBEoRwCdOzC0Z3g1qKedKlyd+3dVI5AF4dXQC2bdbwSLmuP1t+IuBk1e9Idj/jmdJXH5U
	 hmUU6j2KK5tRdCcj0E9V1pi5v9tWbiv5G7sE5ZTTfqcfJ6Kmws68j/ysMIP3zpOCOkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=NA+eMRwy;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=M6UZqeGy;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE6D606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE6D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=NA+eMRwy;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=M6UZqeGy
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A83djPd2470259
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 23:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=K+8Bg6EUw3TF1wR9YyKQuQJJAg
	HFmn9Yf5SnbT8zOjA=; b=NA+eMRwysoiN1QqrWsbt0Rr0FUO3Ilui52wc1rcSmO
	en6V7Ir8uKs8LkuguDrcnqd1Kcam+Batzv2jaT1PfxF2nygaoL7XUKJiTz1pry6W
	8B1CVmCDU7meCThFXHtqI1Hzt41QT46OxMOpdeTnbljnl/R5wxhlMeYnriQ3RToJ
	VyLusS52dlctIy2ZDmYtjCfGmKV3URoK5HgPEPNk+6rY6GsYcQEkmDeNOET3wur4
	vS5gdv0f9/sFEGJcIVzbnI8WzF9dMCvDFa1zsOm7jaHtTXo5cXLtQH4KyAGB0hbp
	xpubgBwv3V2nH1+Qq8/je55ze5OKg2jpfWGHBE9C+3UA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ht0rfbvn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:24:56 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ea39a2f8eso2373576d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794111896; x=1794716696; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K+8Bg6EUw3TF1wR9YyKQuQJJAgHFmn9Yf5SnbT8zOjA=;
        b=M6UZqeGyCCs71GXwtMsnjxVweAjJnJbO98QMbCdn3nrbyEqFpypYPEN83l//wHMfDT
         6oacT/xFjTsM16dMuPHGW0o5OoKNHk+m2OB6/LkbrpdEYHIt1ANfZ3Jp4G1zaVKBo0a0
         4xNWOz+MURlXYb+r5HWe1axQb9aRGr6RfZJ/R0PHmgTQlzP733QwJLoa/j2zESUoykfL
         J4CbKibCm0hs0WRCYaRaNSIajE8tQudXpcN7uHMI+dXPw9ALS7jPjxaHGMxwgN05zg+9
         a9I9OyXKwTYHJQSE3DDH6qSA//SMb6VraQA+19N0z9mXTDth4RfOEUfg8NOxbKuY6WYU
         7Lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111896; x=1794716696;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K+8Bg6EUw3TF1wR9YyKQuQJJAgHFmn9Yf5SnbT8zOjA=;
        b=Mo8j3MdmKcr0PCtqgmzdglKcTOLMGTWlsOJ60ws4HPF5HZxk2USnXOqmeA2g9lVGSM
         eBFM0qbua8CKa3W6AaNWo5EB2bTUSPC19z4361IWgASvtAM1fLQMbk8TCFux5YgRlDH5
         KbELcy7+MClVHD4m30hkJN8ZCTVsMH0NeVUUDwuWWRwvnq7J42iBYdIuCpSfxEJ+fSx7
         eatoq0ZlDGUsXwZa4EDImeOlLeDqrAkvu6DGwj+oFh7pX10tf1frnsFV/PcBhQ8dvus+
         bdOpKwrk7EqbprvKRjX8ltC0Dq006TSAQ73UShVN+vDJ4JgB/UnYZR0xebkmVltVJkGw
         +Fcw==
X-Forwarded-Encrypted: i=1; AL+hErG0QiUrGhADYdzzuIVmxltKkyEJKjEPy1gPA7rjOnCgxLoR5RUnq3JF6ptEhGXc8NFA0vhueiZAncLePYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1D6Z5jlhejYcZFQvpf4PwGWG1dIGRd3rX5EGE/I7e2LHPuGxW
	Twibm3tWK2RZgYQM1dutLg5KaO4ZZsDmduKZfKqtZ+vY86J2imPQ5Q/oxrdfYAGb+Ar7pxS9lgb
	5nIMa+12dL8hSzDOy6QN8FZSvlA8fm9ONV3Sa4+kE3QpEQ/8r3ttugw6+HhNoZw==
X-Gm-Gg: AYBFou2MaaYSlpfVt4kjwdSDN53oVQgPCqznNgrxYdr8EhktgCHmTem5JqkJGQpk5Gq
	7ODJQa63YLGDq/bihf5kFqGgTuIXSahroR6rBkoVQP/3WXLUHI9SZI3o92s2m1ZsxJzh7kIPpX0
	hO0/Aw+WFeOuSzx6HOw43727l61bUu0f1+T9iLbc3UQX/vtKeqnsXqp8dzM4PUiFhI4+eeyxSGN
	U5pAG9j+tNBHtXfzRVwmKNetbxxNOHNUE+npuZZFhwHw9pzZD1TCkTNyKJQlxfXKH77lwK/FvSA
	pWCchMiwrOUH19wO2A8fsT25gjlhK8H0t5sZsLEIgFZeOnF0FNzHkfYLJHdLf1Cqy6ivZENHWmk
	O4E4i2gu3+qu++63yYT822vWUjrOMA9tTdEwXhkfEtCnZp3v5AbqgX8ElY6xzBaLcTOl4HKA4Fu
	efYbwXhEK9w0QWIFkoAQ==
X-Received: by 2002:a05:6214:4b07:b0:91e:8ed6:896d with SMTP id 6a1803df08f44-91ed2476a9fmr5970786d6.41.1794111896388;
        Sat, 07 Nov 2026 20:24:56 -0800 (PST)
X-Received: by 2002:a05:6214:4b07:b0:91e:8ed6:896d with SMTP id 6a1803df08f44-91ed2476a9fmr5970596d6.41.1794111895960;
        Sat, 07 Nov 2026 20:24:55 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91eceb56290sm10085586d6.1.2026.11.07.20.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:24:55 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] block: fail short atomic bounce bios in
 bio_iov_iter_bounce_write()
Date: Sat, 07 Nov 2026 23:24:34 -0500
Message-Id: <20261107-blkdev-atomic-bounce-v1-0-f66344262096@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAIL572oC/yXMQQ6CMBBA0auQWTtJCyroVYwLOh1gAFvSAjEh3
 N2Cy7f4f4PIQTjCM9sg8CpRvEvQlwyoq13LKDYZcpXftdJXNONgecV69h8hNH5xxNjQg25Voar
 ClpDSKXAj33P7ev8dF9MzzccL9v0HmrkbengAAAA=
X-Change-ID: 20261014-blkdev-atomic-bounce-fc9c583083d7
To: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>
Cc: John Garry <john.garry@linux.dev>, Christoph Hellwig <hch@lst.de>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794111894; l=996;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=MQysUVjlstPiGv0HFbdIIHEKVGY3qk9oBru4ywVAac8=;
 b=ZFIpiuUVZQBRB9X/AYDUXtP1xkrxSWzeG52xXn4uDmJFAT+3ouMLtp87i4lyR+EjUxAB/zX2n
 numf/QkOPTuDfVi31ykeyiHjhEgiSSSyJiFjO0NEm0fExmh7ItRJ5Yy
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX8t1dTfaFFpU0
 VY5MGXkRl5X2x1fculQoK5y+nA7alOe2zopv0ReRQhDOLRi6CMLQd1LPTC0nHv6jrq8lr1ofPb3
 3tMhDuTOB72lf+Ff2G6L7GPNIAZ2/ERaTllEn10Tbw0Ggjs8owShK5SC1jiJBpiiCTuLAuzkcUY
 s0+lI1FUnDTqirX0hS7LNKVDQdamjV4o9MaDYK+rhjqBs78HzTbDVcSrSby9f9pJK1YFpb3jkHq
 dmhtLKBI7LO7U3shxzHS1uloCW9trnzxmpL0Ozawj40fPQnmz0ktgHim8q8Pcsn9ULVDjcZN1BQ
 dVtW7JXwwO/ET91HV4Rff1fPGqT0nfQlNmsB+CvEIVJrt3k/9pLrvwRY9FEOMCvyUxTA0YsLSMt
 EaVG5P8DSij8XzOcvv9d4h0jc6UAhC88vVPemsKVkN2sqnumsOasl7BKqUBh3Cxf+BPoxyJWoH3
 xjHTjxjPSmz50yEDk/Q==
X-Proofpoint-GUID: ERqb5CMt6yRNydq3kj1EjNAQcqoSJvqc
X-Authority-Analysis: v=2.4 cv=P+ivFSAu c=1 sm=1 tr=0 ts=6aeff998 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=kv0fz9X2Bfwy0Ckj0RYA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ERqb5CMt6yRNydq3kj1EjNAQcqoSJvqc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX79jD8HJ24Q2Z
 dBc1/ej5jGzhaK0AjQTZ4BtEflhN4hcHyxFy7s4w8Jbk8UmfI0uVo1YMqJPMOtL+U6rgWN48PN8
 8twp7YF7ojBPcnJDwrMc8JYQIbYqlT/Gsn6axT6FjwmqK5wIYk0T
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11959
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=10 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=10 clxscore=1015
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611080017

bio_iov_iter_get_pages() fails a short REQ_ATOMIC bio. In contrast,
bio_iov_iter_bounce_write() doesn't, so a bounced atomic write that runs
into a folio allocation failure triggers a WARN_ON_ONCE() in
iomap_dio_bio_iter_one().

The first patch makes bio_iov_iter_bounce_write() also check that a
REQ_ATOMIC bio covers the whole iterator, and clean up and return
-EINVAL if it doesn't. With both paths covered the iomap check can't
trigger, so the second patch removes it, as suggested by John Garry.

---
Tal Zussman (2):
      block: fail a short atomic bounce in bio_iov_iter_bounce_write()
      iomap: remove the atomic write length check in iomap_dio_bio_iter_one()

 block/bio.c          | 10 ++++++++++
 fs/iomap/direct-io.c | 14 --------------
 2 files changed, 10 insertions(+), 14 deletions(-)
---
base-commit: 839203759f536e6ef1267c80309c3532a7d588cc
change-id: 20261014-blkdev-atomic-bounce-fc9c583083d7

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

