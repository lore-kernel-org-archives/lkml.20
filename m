Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729DB353A67
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321805; cv=none; b=oHWwe+W4dmO5MM1BbIhCYvsPrkCKsDbiQSwLXJA98ou1GbA51qs5M/LQlj4mjM9/tiPDSU8p4ZRqoAfqpYnmG0b7VBmOK4Aytw4EtauiJAp4eEhtYXAJ1auqFXe+TgzBS98KYNMOi6PjDxE4PGLhKR02vnpPm6jdqStDzqQ9vds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321805; c=relaxed/simple;
	bh=BJ82qEZX6k4O1D821wuWjRT5Ni/zDBh3SF9te58rf/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q1gEGJKV0DrGPtFtkpb5J0Ml6cZhaQfgVJgMBYTTCNl+4DY3VP8dYtNyqXZdsUATiLbPRpeT8v5kWmtjZ7UctPTHwS6X3zYd9pemVFZ5xMZWjnjXqwtNJSevSr2S0BSkF+uIehRPQXxyOdgCLyfhrI0Tc1I5wCuIeFTCLlCd6XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGipKqop; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGipKqop"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso502558a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788321800; x=1788926600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSdYkhbRTezSkFkWLoI11mcSPh2b10Yb/gYreO5PKeY=;
        b=NGipKqopDW53DL5tQiDK+O9iqBYxLLxPH093uLgpHVrjhqSt8kmtr9PBC17X5tNH++
         AMLuHNarr6wt5fnRbc2Etg6+IUkcmL0bV573S4TcBFzHghdcL6JpW1zkxLfXMFuqoUzI
         inC4feXh/RgdCviATmF4DbPcp+TpJAzqdtJj6JW/Tdprn3w4K0fE8MEhPDMvqa3/ZyGy
         J/f8xiJ5KtTx4NI+NzbmeBlaAgMGrK0cb9552rL4IyjT6sVMXGov4qByNmmvDPbFxaJh
         MV/W3bdmHrP3TA4xoU3wE9YUk0MwZ1TzyZTnW8EpkwuKemSUrYHpxVOvyU+RKnh1/C3c
         H+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321800; x=1788926600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSdYkhbRTezSkFkWLoI11mcSPh2b10Yb/gYreO5PKeY=;
        b=fA8ztm2+BnIxEUI5QVks/hikEYcXgeHetBLdR7uBgRGWYkT/tNLeuO8iAG48GvGTjF
         kn3Od4KR3Zcq53r345UO2UksxKOAE7gg0tEtp6/sHDtByG5DPEammun5vWHdpU5+sKny
         pidXVKy2rCLNGScEKyIhCmxOLtfOYg3fea6KHbTFyGxsFxQE5T912MkN2e5nx6+rmn97
         asInCBjs0KEbxNHX4KdO7/PMKt0hJPrqmsF4wlBbUbXkGZC1jD0gwuEHxZTA81X2KXiB
         dceDpqKsLATHERPNxIPpsaCNp75P69aks6VwNKsxv50i9BOcJE5IkgckDJtI0M5yH4bV
         ISHg==
X-Forwarded-Encrypted: i=1; AKwUvBwb3eTCzq9EUXGxEeQQJEFFfTVLdt4LAijHttXZ144H0yU/guIXEgtNktKwh3HwDDvUap8FKfmt2WUozrE=@vger.kernel.org
X-Gm-Message-State: AFuF++nYg6yzegkDR/EpLhEV0eRRDTkO7UUKMEqJ1kwXGVlHOVaKpm8W
	+9Jpk5J2ua62hXDR93HFNwqwiEl+4WSKZyYWz+6s6XRbcmXCb36NJnGw
X-Gm-Gg: AYBFou1ZPCUeoWF/mNUmAa06bN2pcdCoo0qoYn/k93bHo6pAbZdZNlKYWj+aZzWU7sE
	vbQbabKRy/E6PxHHWs87pbGx3PejhKxM4MbX9iu7ay4bR96vt+UFOAGS3LRisDhxZkmubkUzWd3
	r4YiOCf3hk/Boey0TwisnQjSrSRpDf7HxKM9cVVcTM3rY05APkjz/EPq3qXJ6t1kX34rFKmSR63
	9Qpq8Zw8b8rulZqFsZH/Z1PoI+7AaZvjBgmqyxjjaCKVhyZOlsxaH+GMOsTzglXQdClB4dQfR7O
	LFMVZ4sUVTySqXUHpVEt8xfc+OpeaqyaQsGY6sZpmpCd65gcA2z5/RShmcMnE3GZj/olnDpTWxY
	jHbYVw2PQS02bSt1ikx7gqL+BopSLkCh8CsBIBKBkmqqTSj9r9Z7ugLR9Zjr95CYe5bQlRZnkbF
	ncq7rS1RvjGNqMDSyjfmWb+HjbgelslVIy4FI79stncZu7rkHvYTHrnR+2nnbboOQNIFh1ZpDo9
	nnDwYlnwLYffS8TBLABgXwxX7iPTwwv+wdUCKh8CjwO3Vt72pKB5jFS0pg2s+MO
X-Received: by 2002:a17:90b:2552:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-39aedec7bbbmr2995232a91.5.1788321799689;
        Tue, 01 Sep 2026 21:03:19 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:5fdf:d463:f07:1882])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07baa594sm3364529eec.22.2026.09.01.21.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:03:19 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v5 3/3] tc: correct tc_pie_xstats field documentation
Date: Wed,  2 Sep 2026 09:32:21 +0530
Message-Id: <20260902040221.83734-4-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902040221.83734-1-hemendranaik@gmail.com>
References: <20260902040221.83734-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the comments describing the delay and avg_dq_rate fields in
struct tc_pie_xstats to match the values exported by the kernel.

Update the documented units for delay from milliseconds to
microseconds, and for avg_dq_rate from bits/pie_time to
bytes/second.

These are documentation-only changes and do not affect the UAPI or
runtime behavior.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index 776e86e5..1a3b32e4 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
@@ -920,9 +920,9 @@ enum {
 
 struct tc_pie_xstats {
 	__u64 prob;			/* current probability */
-	__u32 delay;			/* current delay in ms */
+	__u32 delay;			/* current delay in microseconds */
 	__u32 avg_dq_rate;		/* current average dq_rate in
-					 * bits/pie_time
+					 * bytes/second
 					 */
 	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
 	__u32 packets_in;		/* total number of packets enqueued */
-- 
2.34.1

