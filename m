Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934543;
	b=BYkTznmpPsJDiB/AQxhPOcAVSQaDEhhbnZaMGkWoD02z3BpGIoSuaS0BT3KLCB1TSjhv
	 7AKQxoGkawtVjFU7QK+eZ2fAFrfgD+1knPd7wxQcUxUlNDyHAwcWjGIv20gepz1nBsCTC
	 W7oVJFPOVD73OaUQR0rwo74MZKMwpbJ5l32uT6LmWgAioS3COn/6ATR6u9WXM4Dl+pP9F
	 isVGCURGV8Qc3SChoXt6AckqYCxldwcbkCxhOx8yHFyc9P9x/fQXNmnymiLrfiplv01Cp
	 u9a8uKBIGB1AaJEOVhWA6wX8XKOVt5JE766CPBUE/AnjECMU81j5z+UV6dP4f+jY56Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934543;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Sender:X-SRS-Rewrite;
	bh=ZaGGZnhuc9FBxa9mYl8TE2MbUbvHjCRcm+GPgzuWTkk=;
	b=vFaokcP65X0NJvUExsvxsEGEADKI2VvJMtZRfAXlyODNFyWFwisYIt/o2+LOOmPaazMR
	 4cmf38kpQGWLRiNN5n/Ko4/bUbh6DbKiq6mIyZsrppu7fPvd5pzDWDdCV79N0TN1rhPIP
	 QBmM9PkevkUydQ0tOAClMWaN7g6MKNErzlL75p8CJnSSziCmAZr9f4GH8EVNF3eNCTRBR
	 66u1bTJo9QXYLVccdWACq94pugnTIXK2RvuQyoTce88ja3iRI411zRrcGIHOVYUQH1oUv
	 66FNtEVtE//kOJ5wJdVqWkg2O7DQLM1RgHtcBGIt2DS0qWkQLczZ+RLn1XVHId+lgMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=none smtp.mailfrom=casper.srs.infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b="L3F/mO7V";
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D5A606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D5A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=L3F/mO7V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=ZaGGZnhuc9FBxa9mYl8TE2MbUbvHjCRcm+GPgzuWTkk=; b=L3F/mO7Vgd09d6vLzeDZ4whp1L
	QCmIXfYHDdpe9TWQgWI/aTQmoUjClpkytRN8XcnVJRlrDCGIb+wbv4RKsFvsBOIL9jd8nyPGPlnPR
	6niQgJdH2F9u59O1UtibnV5xGMmoK5SePyzGavDeDIGUdGBojsOnLg5np6aGpKJX/aqPzqOuGHoT7
	4YJO+rtZbjWjr9mvZzPO2J+1bWxezSREOdnwJBPGdS3Zmm3L2cYROqhO84aye4ICgjxHL5giaFInG
	byuIUYIo3roWF8E3bSzOOUSjbpjUb0woGppU2yzkizAnSFBECdPc0kaHdbdxwiTaxbRnElxPOngVs
	fYTFp69Q==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAK1-0000000FwPw-1vqC;
	Fri, 06 Nov 2026 03:08:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xPAK1-0000000AeGY-13KF;
	Fri, 06 Nov 2026 03:08:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jie Wang <jie.wang@intel.com>,
	Yuan Wang <yuan1.wang@intel.com>,
	Ryan Luu <rluu@amazon.com>,
	Julien Ridoux <ridouxj@amazon.com>,
	linux-kernel@vger.kernel.org,
	nh-open-source@amazon.com,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 5/6] pps: Always use ktime_get_snapshot_id() for pps_get_ts()
Date: Thu,  5 Nov 2026 19:08:54 -0800
Message-ID: <20261106030856.2538039-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106030856.2538039-1-dwmw2@infradead.org>
References: <20261106030856.2538039-1-dwmw2@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Without CONFIG_NTP_PPS, pps_get_ts() fills in ts_real with
ktime_get_real_ts64(). Use ktime_get_snapshot_id() unconditionally so
that PPS timestamps always come from the snapshot machinery; only the
raw timestamp remains conditional on CONFIG_NTP_PPS.

This is preparation for the next commit, which corrects the snapshot's
::systime for the accumulated ntp_error. That correction should reach
*all* PPS consumers, not only those on CONFIG_NTP_PPS kernels.

The cost of the snapshot on a small ARM board (Cortex-A53, 12.5MHz
arch counter) is 38.8ns from the pulse handler to the counter read,
against 23.4ns for ktime_get_real_ts64() — both small against the
~2.8µs measured from the pin edge to the handler.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
v2: New in this series, ahead of the snapshot correction so that its
    effect explicitly covers all PPS consumers.

 include/linux/pps_kernel.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/pps_kernel.h b/include/linux/pps_kernel.h
index 00b840970d56..35d6ac06a0c0 100644
--- a/include/linux/pps_kernel.h
+++ b/include/linux/pps_kernel.h
@@ -100,14 +100,12 @@ static inline void timespec_to_pps_ktime(struct pps_ktime *kt,
 
 static inline void pps_get_ts(struct pps_event_time *ts)
 {
-#ifdef CONFIG_NTP_PPS
 	struct system_time_snapshot snap;
 
 	ktime_get_snapshot_id(CLOCK_REALTIME, &snap);
 	ts->ts_real = ktime_to_timespec64(snap.systime);
+#ifdef CONFIG_NTP_PPS
 	ts->ts_raw = ktime_to_timespec64(snap.monoraw);
-#else
-	ktime_get_real_ts64(&ts->ts_real);
 #endif
 }
 
-- 
2.43.0

