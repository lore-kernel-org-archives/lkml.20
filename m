Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208270;
	b=itd+RS1QUAzqop1eN0I5e9FiCMt5TEkIjnfjpIiqrevvOqQPUg16OPbXQU2v6zdrodCA
	 bigEr1l6Z3MfzqlzXAWFAomHru2CNESGdrXDKmGTzSlnUVVYbj9Y4H1bi/Nws/55x2+LW
	 et0uw/IBuQTHeSLYqZSijNp0yhJTg8X7pKQT727R5JVwfqecAwm5Y0tHw30RU1+Q3V4q5
	 t7xUqjb0yyX10SoguzKa2XtgDS7IK/O3GUWje+qM3mIssSbipdHddzvjBlo6N9UJ8ku7N
	 hemhsW34hKFrcpezcUeBp88txb2HXG8XpYyN76Xj53eurTlnjoL7AOF4zkavJPVdoUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LrXsda7Q/wV7+l2k+sGQxx8wXojvBKGw7M+uJmFtdYU=;
	b=y9Wz9UwOKmSALJLWTLKeK2LaYeRxDehkLjKMUcxem1M4ae1CCj3YWTWGaxZlqlOIPUgO
	 6cB0FQPNNPrGro52+l5Yj1X03WlR09XXk3vUhqC2llJ+vcSE4tcipDoc5q3GldelEyMZA
	 rba5eI5BrFWFz0JwSXBcmP8jWo0lElXUmFoSEgcOlfA7J2TCmYWV+4GyIoI7Lyl1D3Ami
	 IoRhPLfGYQZ8uR+qYgiQRsjxRz4IDDttILNDt7bZmUC3VeKOkkxGFSBeC8pzTRpjAEIAN
	 E+GWJgyJTXgLO/fyVw+Ke+GMMUWtdHHNnRRq9A1GrhrMY9tinA1Ve+ZtrJtXnfdXHMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a3coknYg;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94A2606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D94A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a3coknYg
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b244fb7fffso583218c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208269; x=1794813069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrXsda7Q/wV7+l2k+sGQxx8wXojvBKGw7M+uJmFtdYU=;
        b=a3coknYg0/9is928kAfp4u0Vmq7Q+SzLiFXZc9jUQ3rdzRY7S4pdGKN+LcYXzwTLkF
         nqvyRSUa1Z7NyIvwl9Ciu+wpnMeevbcig/AZL8Hez6ihonfDQheXaxWg7qv7P1z0hiAp
         Qia8bMGREQf5y9c0vmBMg6OGIKV4kZClYM0zmzuJok0RceLVJpdlNrR0Nazewt2SdD2j
         FmxpptP/USok37rRTtUZ64FVfZGYgbZtkiPCqpKGjqVS/e/qnSm1WW8A5u3/oO5xkF6u
         +5RzUcQfWG6WH2fx0icLfyYVR3iuKye7XL0lHfjZlJ2Pj4282DaIJv1D99eWm4jP6QJL
         nbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208269; x=1794813069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrXsda7Q/wV7+l2k+sGQxx8wXojvBKGw7M+uJmFtdYU=;
        b=zx/yfiMt+uBHIf4dwpjeX+cMBqzPZGfPfTGiRg6Srd7e6U66K7IJRlPRzZ6QvJIjXr
         u/DZ5HnVMlkCVSakvMZP/vnGaUZlp9GE+8Ew8lbcWf/ULgFWnoa/84eDP0JOBXsxZSd/
         Cz7eZ/njTznZ3cU3ot5HSG3FZcmz2kGiYfosaWWkhaHUxrLlT1dw/KclyQRTo1ivml4h
         j1qPFUiX4nMQlLMn6bbrU9Urf/3xBMtmk0peh9KcsVmjeHrc4rIk8G5XrqJ3G3mjVCiV
         vnf6/nveVO+fY97qceGKHCfk5dUVfWh71si3aOiv+/T/8xbrgPw2KGYnLtJU5EYvq1sr
         97BQ==
X-Forwarded-Encrypted: i=1; AL+hErHlOZz73ejMjgimht0Jcca9ZWKYGhnOPumhmAaGUfnRacjUaV3FtF/Fj+Mon1/Tfa74N/mQM1PSPc7RU6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z840xa+SrqPWidEfhrATxV7xep2IwWTLcliTxp1wuYRLjPP4FGu
	OKWFia2V5duEU+DfA+fLVeF6/hiq9OKQbrYGX6iAH8eFUsZ5T1+H2Ll3
X-Gm-Gg: AYBFou13tBlWHmWgKV131P41w25yglFQ9w+AeIxOz2dz+S0Q3R3yvdMto63jsW4a62A
	VHeeaUYV2yS/Vs11Z0GEhXqREYOh7IBA+27gSe37bod9csarWXy7EsOZoUtYyKMNoOI0n4FVAtx
	QNpGGP3yYAT+6Lg+L1py62SipOL4HnjQkt/XWp6xwjGIK3eAM4bdbz9pzoNmXj8FRiiqm42nMbo
	5xENNilAs5VWsAb9eCEzGYmac8eiRZCqoN0DrZkdNQm0h0cGPqd3nl0BIl7PX4NzqH5QhAl/Y4/
	tn0FSc/yPO7u9d+eHqTPU5SkUEBMSPwIpskA/qkE+cGcRJfDc1qLE3Z1L8AOEhd41nAeYi6Kg0l
	IIisvTAUMU6nMRiMPa62VhLBwJTpwjh/aAERrGYQsYO6stkYANank4CS/w+xbY8yI8LqZnHtJje
	d+JJGxbdjyok0EhvIZlLGme1HgZ+Rey5ab3wQKl7YM4wpbld/8oQHlk6iC5IVHu4PjUSNOnjkze
	nsxn9AKdiKc89mVzfKUOWtEZjuKDIZyCFWJQdQBEsSRo4lRE6OBrZIywrh4tm8zF8UIkezxmTpt
	I6PlfiXLQd5vNvotdUmAsxsvzOxZtPwJPDWDMB74xPuLWqMpzc5H/KVP8bnSMJmwZLejHIGIPUm
	dC9+nFHOwcSdMdD/xR3mCV/eTwVAl
X-Received: by 2002:a05:7022:286:10b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b39fecaa6emr4913256c88.38.1794208268937;
        Sun, 08 Nov 2026 23:11:08 -0800 (PST)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:cc96:e14b:76e:f8f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm13443513c88.4.2026.11.08.23.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:11:08 -0800 (PST)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	donald.hunter@gmail.com,
	ast@fiberby.net,
	toke@redhat.com,
	liuhangbin@kylinos.cn,
	j.koeppeler@tu-berlin.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v10 3/4] net/sched: pie: correct tc_pie_xstats field documentation
Date: Mon,  9 Nov 2026 12:40:16 +0530
Message-Id: <20261109071017.438478-4-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109071017.438478-1-hemendranaik@gmail.com>
References: <20261109071017.438478-1-hemendranaik@gmail.com>
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

The comments describing struct tc_pie_xstats do not match the values
exported by the kernel.

Update the delay field comment to microseconds (PSCHED_TICKS2NS() /
NSEC_PER_USEC). Update avg_dq_rate to bytes/second (avg_dq_rate *
PSCHED_TICKS_PER_SEC >> PIE_SCALE).

Documentation-only; no UAPI layout or runtime change. Touch
include/uapi/linux/pkt_sched.h only

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index fef848eaaab2..445a041cd103 100644
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

