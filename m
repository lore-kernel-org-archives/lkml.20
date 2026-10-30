Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.207.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336654;
	b=GmBSlfFv8jLIaZgNIUvUdF1E+XfndOW8N09a5cPjtaWZ5p3k3Cag/YexAoHkiwBucVcV
	 AqATgwk/EJ5sIh2W7JD1GCOzXba8PxJZwvjtM+RUpVCj5eEGeEUY9J4++LyHTWxGirGwV
	 wV6bz/BMcteF+TIixOoyMIjuq8HO1Xaal4/ajbNYSdQaGnu7F0UOJXSfohD+HrvXM1sFQ
	 JrPQinN4fIUMgHClSzbQIFfHYurRsaV1qOFN3UdN7lKT9gpkRh3IkR8uAgJTIEDGd4NyF
	 0f2y99SMjmqiZW5STxWy4fkRPYD1Y5FCzvQI/NwHCOCiF2itPYGcjdxDv4zP89IS1Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336654;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=9MW3clqg5v18pZwU63c4oEVpjzsyxRxNLjxrPy28qGc=;
	b=WNnq2p+hhztg9pp4k40E3ymTkVZri5V6PneShScnG+YKAOuzodt0WqHKwvCDfX0vHUEh
	 cSKEmNafGEvP4JzGS0qi48CZ2R2SMx9GInX/wkj/lulBHu5bQ3bbAPYn2EM+Mk251XuZy
	 FbRxAGhnzxEnUGU7MEuB/CfdBkVeydAYScjQpGciofIeakBHLSmIgW1SFO1hpUyjEPW6q
	 zBqhxC58dytI6DWJLXncgAHPgZZ1X9ESDvBRp+KD8fmJslF6tGVv3TBHw4niRD+8Ixg2T
	 FtReEpjBcw2xshLOqThP3cZVi7VE1Ghjlb2vcEPGeoTlr88mCDpbGBTbfA7UKj7+Adw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shangen.org;
	spf=pass smtp.mailfrom=em879706.shangen.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=N+Q+5iL+;
	dkim=pass header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=T+vrfl6g;
	arc=none smtp.remote-ip=103.47.207.181
Received: from a2i949.smtp2go.com (a2i949.smtp2go.com [103.47.207.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C942606A326
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C942606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em879706.shangen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=N+Q+5iL+;
	dkim=pass (2048-bit key, unprotected) header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=T+vrfl6g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=miusa0.a1-4.dyn; x=1793337554; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=9MW3clqg5v18pZwU63c4oEVpjzsyxRxNLjxrPy28qGc=; b=N+Q+5iL+izCuRfnrbkJuSKsUEP
	oI77NQZHjruQegwNkG2aIoDhNaHMKbI+T/pnCYSmFT+3S2hkq6jiPG7nabZdjlGjrUj0zVkXB8/A7
	GNTZB9LtKyhu32tXJKQdje4tjvVtFPr1a8yrkPqfOfABgX3hyd/vTTVs4wsafqfUwhtfcd2UAg5mY
	Qy+vrlUwCmcvtq+AIa0ZLG7OxFO+L0i2F98AUNbvy8gGCq1ZIfNwcBusSaxy03sRiY25nhA65f8sN
	UQRJIt2vlQy5Fegkt4mO25t7wr1UpQlBoTm4aTHaATjEYV+XRKNN0mCBPrGczEQTrI6tBn2ZuEPIj
	MHkRdNVA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shangen.org;
 i=@shangen.org; q=dns/txt; s=s879706; t=1793336654; h=from : subject :
 to : message-id : date;
 bh=9MW3clqg5v18pZwU63c4oEVpjzsyxRxNLjxrPy28qGc=;
 b=T+vrfl6g1RV48opUH5B4La7f31dAVtET10PFA2lGk464/kFS21dqt5EUmQZF3D5yTB6fq
 atLIkhjtfcVP2di2kmL+vK5DlbHlGqncTjc+VKi7Y/GsrHM/ZAgPrlxLHDb9NsnQMHnTZeO
 hpwwLaVs3cZaWNaLBANit70WKe0AOpcW8915aETXi7LYgC/+24JwqRUHFRRFy00zbAT5p8m
 U/ZVtbvMPwO1puGfPUMfhjdYC9409I8FaCjDdvJA+pDLLtj1yjDfRfjWAJ2XWfKFLhw8bR5
 z0jBY1HyRs3T4FuBX5XLuFhfa25YqhzSHwc6eVZKYOLn7jtmk+Bc0X5RJ/IQ==
Received: from [10.143.42.182] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <sim@shangen.org>)
 id 1xMemR-gL4QGD-Bv; Fri, 30 Oct 2026 05:03:55 +0000
Received: from [10.195.244.224] (helo=sse-laptop.lan)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <sim@shangen.org>)
 id 1xMemQ-FnQW0hPtGB2-jeMa; Fri, 30 Oct 2026 05:03:55 +0000
From: Shang En Sim <sim@shangen.org>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Shang En Sim <sim@shangen.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 1/2] io_uring/cancel: count all requests that a CANCEL_ALL
 cancels
Date: Fri, 30 Oct 2026 00:03:16 -0500
Message-ID: <20261030050319.1448530-2-sim@shangen.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030050319.1448530-1-sim@shangen.org>
References: <20261030050319.1448530-1-sim@shangen.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: qNORzD_XjFdV.9ptFRcSJ5GI8.JjhqPgJ6ImB
Feedback-ID: 879706m:879706aL5FzMA:879706s3PvtaaPe7
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

With IORING_ASYNC_CANCEL_ALL, __io_async_cancel() counts one for each
io_try_cancel() call that cancels something. io_futex_cancel() and
io_waitid_cancel() cancel every match in one call and return how many,
so four futex waits cancelled with CANCEL_ALL give a result of 1.

Add the number that they return.

Cc: stable@vger.kernel.org
Fixes: 194bb58c6090 ("io_uring: add support for futex wake and wait")
Fixes: f31ecf671ddc ("io_uring: add IORING_OP_WAITID support")
Signed-off-by: Shang En Sim <sim@shangen.org>
---
 io_uring/cancel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 79b5c133319b..50a65fbc6ff0 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -198,7 +198,8 @@ static int __io_async_cancel(struct io_cancel_data *cd,
 			break;
 		if (!all)
 			return ret;
-		nr++;
+		/* futex and waitid return how many they cancelled */
+		nr += max(ret, 1);
 	} while (1);
 
 	/* slow path, try all io-wq's */
-- 
2.56.0

