Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206376;
	b=SPsFAI8ZqkMF4LRF4x7G6CYryXWhXlwsns4ktZytLgdQv1u6Vh7p0xLJwWbuMej/Nuoj
	 PatHTUUCZI5gvS/4Cbv7fZL+TDQz4xyAIgzVDIf3S+uFenFKjeliA1M61uwfBHUQbMEzs
	 ObE7i1PB8GYun2v5taoT0FFfHDDuD/841mpDCMxOy7/cnr+ETebBp+zYjKZ7qfCNDolgB
	 jDmAXB5yd5vGn9cXeJRUw3zJG6SEBBj1nb3tNvro/XSKIm/fSoU+faHMJdzadi3slMwLq
	 /6pSJlwLb+SCjAVEIFojCpc3DyM/hCxB8KTwW5StwFJNh1jxMpi7RLVOToBAmoIZb5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206376;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=dYiYEdpZoBCk/m+9m0NoamFhEFSafaE8QHgqSYW70HI=;
	b=vTbMArMwZStP+zUxDLKu9dEPpunKViVfU4/4Qdwyhs77b/E4gAh8aCLjilPSpcc+fL4k
	 NgXEYESkQUJ014zcwvrK3bQeafFYPEndkogHL0k/57bhA+4IWq2ZqlLNGM4b8oN1J55hM
	 sOapZj8CwqbqYlAa9E+lOPdcftdl3nIZJlsbVtmsNOvFueNmXsr1KJtB7MiKGJwSs8FOa
	 5QRRlP0szLr+Lgov3cCkLCBTfD0g3fDSMYBQjwQGpakDZtCQR47nuo0XQPocwPGWbNSEx
	 FIURAZyf+gXpFNgDkcA2tOdjwMXSyUQ5qLCFegtcFIzUbCIWFhIpuG8eBwK3A9FyhqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=i84quMsR;
	arc=none smtp.remote-ip=91.218.175.193
Received: from mta0.migadu.com (out-193.mta0.migadu.com [91.218.175.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECE1606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ECE1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=i84quMsR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MU0CJ6RC8bf8Bdd4IOlFxpmM1i6C8HxAoRfmw4Mt6r0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794206372; v=1; x=1794811172;
 b=i84quMsRuLJYop7oepd5gPfqt+J7kJJDjapa5Ge51muaG+1VTtGoRYF9q+HmgouRVo/ZfbCu
 xdc/BAIoAuwtO6lMgs7pUeQrNJzrAij1mL0zsAJ0G0jJ9RtRIkXB0XHIrD28hZ3ATw2e5xCAfEe
 rrqVbvLS18iwIW4G8SXtFQWY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ef5496e26729f04f;
	Mon, 09 Nov 2026 06:39:32 +0000
X-Mizu-Trace-ID: ef5496e26729f04f
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 06:39:24 +0000
From: Akhilesh Patil <akhilesh.patil@linux.dev>
To: jic23@kernel.org, andy@kernel.org, akhilesh@ee.iitb.ac.in
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH] MAINTAINERS: Update Akhilesh Patil Email address
Message-ID: <20261109063924.GA118887@u5ce4748bae3b54.ant.amazon.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Move to my new linux.dev email address akhilesh.patil@linux.dev
I plan to use this email for kernel development going forward.

Signed-off-by: Akhilesh Patil <akhilesh.patil@linux.dev>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 7fb33babc931..54238d2f04dd 100644
--- a/.mailmap
+++ b/.mailmap
@@ -1030,3 +1030,4 @@ Zhu Yanjun <zyjzyj2000@gmail.com> <yanjunz@nvidia.com>
 Zijun Hu <zijun.hu@oss.qualcomm.com> <quic_zijuhu@quicinc.com>
 Zijun Hu <zijun.hu@oss.qualcomm.com> <zijuhu@codeaurora.org>
 Zijun Hu <zijun_hu@htc.com>
+Akhilesh Patil <akhilesh.patil@linux.dev> <akhilesh@ee.iitb.ac.in>
diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..3aa8fa3c068f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4095,7 +4095,7 @@ F:	Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
 F:	drivers/iio/chemical/ags02ma.c
 
 AOSONG ADP810 DIFFERENTIAL PRESSURE SENSOR DRIVER
-M:	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
+M:	Akhilesh Patil <akhilesh.patil@linux.dev>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/pressure/aosong,adp810.yaml
-- 
2.34.1

