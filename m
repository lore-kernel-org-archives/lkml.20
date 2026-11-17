Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901593;
	b=k4CoPFKx6j87zXnqBfcKKjHCwo8+bBw1jAWevfr67G6NCaegx6ZbuzseczArGAspuSUE
	 uX8UdHapAotUAhYC8xWtP1Saby0s8/hOSKo53gmVCTMDjLv2rS9p1uSzXDiDeg5c/JxgO
	 n3r1HdItkWetSK9altpZCm7abAcDS5cvHVM2bYfycLiLcrw4L8T2WyDxSJ3FqXegkpoTs
	 41g5SIv87lei62gVclLIODrpEC60LHXIOPSDOwItwsitRrN+eHyZUY6cbpLRNGP+WzO9Z
	 xgZ0Vpsw2Q/wiLus2wBGU9KFzWtuhpud7H8eCNHvBmjgpiZjpKyq2A7RFnfCNhnFqOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eux7kOFR0+YMJVkRb3ZXeOrx6EPrM/mga9ca7cOzUGk=;
	b=RNE8ZaY3fnh6Iocks12LAnKs5tU71+3BHHL+/OeXpHLPlGkF9JWHk5ElOnYLkDJmRfNu
	 KBbpDXhwBGgjkJP/KYruNa/v2Xik53x4AdkMWKdOlLuRbGbzwDAJt9KGSFLzbnXy9SEf8
	 /3Hyy0MZIsCsDcViZRZnV+AxD+SOKzXgPpSqMh3MoEkKGjS+kPcxYI8ByRvqlmceQjEGX
	 KxdxNe5FLmmLE2K0rSKUdUazrIY/z1lBrYsi7sKhLulKbYfDIjVFBgfEkR1MmHUVDE6fL
	 bmd8i445kBIN4jgXtcGyIJe7HeDNQ4JBrkNm0zqJbEBAHLoJYJJaZ/flPTrxFchM11w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=f0C2V8ft;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="D/paaCC/";
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADD3606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADD3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=f0C2V8ft;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=D/paaCC/
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH7Z8Dg3605482
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=eux7
	kOFR0+YMJVkRb3ZXeOrx6EPrM/mga9ca7cOzUGk=; b=f0C2V8ftf4ZmZTjuPakq
	pxe8luiZDADEf+o0XawEuZ7h14pgLrzPf8z5DURfygp4yvnAEnytmVP3LqVnRlCG
	p1bhk0D6e3GuV/UdPPAo42ZaQdPIld7bC3exOIK3N7NgW9wWZXPoamRvLw+Jt+ot
	oCR23uzeoF4YUYA/K80hrf3YeFwYKG6xecua5cdsrQOz7iw7oIvRa3j3PN1598fs
	qiTevVSdraL5g7Ketm9Oe8UiJYv5vI9hR8iCuXAbb6SZrFJc7KYj8ZIdgLmt1z29
	8PtbU/A6NSprffu4pM1/4sq2gHyEBfZ8bFzVnDq/U7zM0uehQs+8+7868bhGVIYQ
	jQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j0b959shr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:46:31 -0500 (EST)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91256a7b7b3so70487556d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794901591; x=1795506391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eux7kOFR0+YMJVkRb3ZXeOrx6EPrM/mga9ca7cOzUGk=;
        b=D/paaCC/i7nj+M9/VCR5+6riSnT8MwJ92Me3w5lH6+8JhDjrwzaxLzTy7ZjJ61OTMR
         7hlylT1r1bF1hxc+Ob6bTfwUDhLmPyppWe/0CcMA7A/lFoccMZsGYTHQxK5IKgn7i2ur
         ZnSYDjXbWNXpnd0NSwg8Rv2odfMGsy8lI54QFuUtHAufLgXlrksWYKx0PlbLlTRBUMtT
         kePQQZmCx9UoN3eoi6SoA3aZJmx7JONkpJBGceQhnFQ3OGNMmKsFnZVXNn5o71KCTKqU
         Hay9DSR7mK2NhfOoqs2FgJDROUdvyRDenU5lD9vDVyspYjXssH8lafzaX/1Kcf+eggD6
         LH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901591; x=1795506391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eux7kOFR0+YMJVkRb3ZXeOrx6EPrM/mga9ca7cOzUGk=;
        b=24zJ46dTFkenWWnGoFN8PDs0pJRJoN3F1Xbugebv/MNVy1wFukToy4XlbKIyEjVF29
         CUF9VQKdcCa3aLFjZnTMMGX69SM0afooQRGQzkIFa1ry64jHwo4TsiiSPGLZNXzwbfTe
         QPnL537Q5ydQNo/SccDUhms8gEoT18fcXomXPIy3x5WTvEw3Kg0eniVwAvw8jU3+13aH
         EpTeCevOzduVv8BttLya2oNGa9z7wXvztPeqcaaLdMj1F8So/rInQEyFVbmbFGLERwdB
         A1UKacsgTUbnKCwGcKTIFJiQcMkz0rrghUl6DBpQyA9Db6bU0GGO/72o0QJbhIsl6/7B
         Xu0g==
X-Forwarded-Encrypted: i=1; AL+hErHpo2LzKv5LA6atM6khPeODpLAi/z1iLw82qvln+24nCs0PmvX6Ij31yt9DdQ4emLq9isDfZniBfkCTh7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8fVZMXed1LZrUbBxbjVmJ2EiwIReWJntaP+0B04GrxxvzuvYI
	EFC5JAcasaPtcWgm98b4E0Q+04DfeH4Z0CeTYAG+J3clPjdY4Dl4ShG1bRvNRtj3eXAjgBGpKni
	n2Ng/bfxcGc3wcsJfDaRjQnn31nitqwOR9bwjbJCIW5n8QHiSNTXlfg/cVa6YtA==
X-Gm-Gg: AZFdTZfkxk69GCEA0Qaq9zFgkgC3mNIjLjH7dX3DGKWX0JwTNW2l8Qd3oJUt12RRk6i
	uBuwwAMyZ7ZGdtawVFex+T6/hPKFid2s6C97OCO98AiTG73S+9x6fA0NZUekWuJoI2w1L1XzGfA
	3ZHcDaI2YAf0yOmPsCzRQLsrdxkK5LjkJYiC7j+0fcRb5ht6djf1kI5Rl5tecwBr0K8sr4Qgtzf
	opQ+TczG/4cdFR87csmKOqRTvWmDAH6pXW2DyGkOkxEdFCgfCvJ+ibFiXLYuSDy/JDxGPTrJJKR
	M1GKFLcY4iJ8RwHrUsfMyI5ku/NFmKlhHoDTjdRjeWvKsJZ7jOoihpm3aR4y7g8HQWP5TFs1F0S
	ZQwhCdPRdGFinrH6purVSGQppUEeYLvZJBihuwsvnnicaL1C+6czVWtac1OIl0++nEDu6HZlmRq
	bXFSTnVVKUYaq0S1Nzxg==
X-Received: by 2002:a05:6214:4506:b0:91c:6cd1:8058 with SMTP id 6a1803df08f44-91f2418bbffmr205429186d6.13.1794901590796;
        Mon, 16 Nov 2026 23:46:30 -0800 (PST)
X-Received: by 2002:a05:6214:4506:b0:91c:6cd1:8058 with SMTP id 6a1803df08f44-91f2418bbffmr205428896d6.13.1794901590408;
        Mon, 16 Nov 2026 23:46:30 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db0f58sm105632286d6.39.2026.11.16.23.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:46:30 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 02:46:27 -0500
Subject: [PATCH 2/3] gfs2: plug the log writes of a flush
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
Message-Id: <20261117-gfs2-log-folio-v1-2-35db3db42e35@columbia.edu>
References: <20261117-gfs2-log-folio-v1-0-35db3db42e35@columbia.edu>
In-Reply-To: <20261117-gfs2-log-folio-v1-0-35db3db42e35@columbia.edu>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794901587; l=1958;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=vcAK97ti8eOI21AjNZH7KTwZn8FBRACshzWgbyOzMQE=;
 b=B1JxC4mWrRP+qGn8YAdgYwaqpg/5hUgBfBXd2REKqjknNaDrNqsMYv9kgcImWCv3B5qV8Cx1M
 /VFzvVOH8M4C5TrfGMBNTQGlVlnShqANL+g36h+ZtZ9rhohfED/50AF
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX60X7JquN2bYo
 bAXMdh30p+2GMENqvcdsR+EJ8FBu7VncXYfaCm81k/yRrllcstq8R0gi5qAI8cMN4AFzVPXqT/D
 kkJUr0qboMIGq32NnuW/rPhhgIrKHCj4JH4vWbN3MDJG/rS+pCoTMfMCUAO4adMs55te2VFRtiE
 T7+zLMRGP2RD7rK1bt2IuQZvF8J5qhEQsXB0Rgb1nLFH2tratn57VysZ9l2bv9hPm80xKeT1ws/
 CACaRxvJ+hsnAp0zS8OAf1ySSFhKBN6x6vKpcRlN8+Dj0NnkwouEygRndHwcCRtefxxR+oh1SQp
 bhtaGQLwBlJ1gos0xwwX6Pq2iX5VNrpb4cpz56MwJR61g8UUPJSitEKv76rb/eeS3GDUCqAHYVL
 3b9+7UpBNyXi9TMvMDnWsOqbH/xzadq/j+tKdh0AaocHN/Zz0TAj8PHmqEb6oIApglk09C5sNqS
 N0mg8aijBDFiPgfhgng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXwIDaSMJvvShK
 3vClknsHJIa9GuTUPYMvdXHp4cfsDn6f1UsDO7QyrjZG0EaezFUK/aivulomBaNtAQP7+McykrT
 A2FTkxvShXRBr/rTAwNtrAYtr9T+sRRB8inQgIYGzlEcUovZq+/7
X-Proofpoint-GUID: ZggS2pR8syZF1DuynQvaPlSbGUKxGLLz
X-Proofpoint-ORIG-GUID: ZggS2pR8syZF1DuynQvaPlSbGUKxGLLz
X-Authority-Analysis: v=2.4 cv=TsBzFzXh c=1 sm=1 tr=0 ts=6afc0657 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=69gLQDoYLLJtuS-kOWQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=10 malwarescore=0
 phishscore=0 lowpriorityscore=10 bulkscore=10 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029

__gfs2_log_flush() submits the log blocks of a transaction as several
bios. lops_before_commit() starts a new bio whenever the next block is
not contiguous with the last one or has a different completion handler,
so each descriptor block is a bio of its own. Most of these bios are
contiguous on disk, but the flush does not plug, so without an I/O
scheduler each of them reaches the device as a separate write.

Plug around lops_before_commit() and the submission of the last bio, so
that the block layer can merge the contiguous bios into fewer requests.
The log header is still written after the plug is finished.

With fio 4K write+fsync and no I/O scheduler, this takes the write
requests for 32k fsyncs from 229.5k back to 196.7k, and the p99.9 fsync
latency on null_blk from 51 us back to 41 us.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/gfs2/log.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 238f6655e15f..9b05db20921a 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1088,6 +1088,7 @@ static void __gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl,
 	bool frozen = test_bit(SDF_FROZEN, &sdp->sd_flags);
 	unsigned int first_log_head;
 	unsigned int reserved_revokes = 0;
+	struct blk_plug plug;
 
 	trace_gfs2_log_flush(sdp, 1, flags);
 
@@ -1148,11 +1149,13 @@ static void __gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl,
 	gfs2_ordered_write(sdp);
 	if (gfs2_withdrawn(sdp))
 		goto out_withdraw;
+
+	/* Plug so that the contiguous log bios merge into fewer requests. */
+	blk_start_plug(&plug);
 	lops_before_commit(sdp, tr);
-	if (gfs2_withdrawn(sdp))
-		goto out_withdraw;
-	if (sdp->sd_jdesc)
+	if (!gfs2_withdrawn(sdp) && sdp->sd_jdesc)
 		gfs2_log_submit_write(&sdp->sd_jdesc->jd_log_bio);
+	blk_finish_plug(&plug);
 	if (gfs2_withdrawn(sdp))
 		goto out_withdraw;
 

-- 
2.39.5

