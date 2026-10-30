Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348647;
	b=le/I1cSCUbQF8KQm6MrYt3ky3LBVwITrZanGyDbwWo5iJ5RykcyXN2JeG2uoxIrZTGrx
	 ETLj36VoiO9U2go8h2wy7luXRNdzsPKvampUWHVaZyxfcj5zeWGC41rGOWkYyrDCw8rkH
	 cM9otxbHJSseofRL/K9iC9dNazwTBjgYhdjXKA9CSKNxV61uTzjGPyItzSyogfa/xtKxc
	 whAjtbkwqWULyhiL5JWjIOP9WHiVTKvfy7SAjq+Ni6OL5BzsOdPjFTUc0+FQ62I1Gdy/y
	 N073cDX2acBh/Y2xuuTdfV4eYUU7Pws/OZfR2EoAi6ALhULkSB/qk4A2vB5LJUOXt4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D1AR8fDl91tJDx1vwvkWBduRKTWQCgJOTBIPuh9pgE4=;
	b=VQKDMyHehTU8maPi41lWfSndmBXwS/tKyqZLh7PVqqte9iL/ZMjIfd4jdOanDhHbRPnR
	 6OwIxu+ymwCm/udFZCqmKfhtqBH3HZVtvE/cZlQ/jYhJ9vWFcUtJjhITBlSIbvdKYX60l
	 eCS9DWUO29rAUS9IAW/sqjVP0Z3MwSB/vHcEboxRtq91hwktJKEOXUlmbtGSvmc+xsfyN
	 PA4J7V6VVUlszwQDIno6+w65kqxx8eWopwwmi9oNRXH+GAYcMMoD5/aRxsdivQrv/krot
	 MHxprmzQr609a3ciQ+s6r1ZXl8DjSdYX+eIpZR5Q32toSldnlF+KjzzCJ1lPC+AIVQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7ZmaE3R;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB816606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB816606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7ZmaE3R
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso976101eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348646; x=1793953446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1AR8fDl91tJDx1vwvkWBduRKTWQCgJOTBIPuh9pgE4=;
        b=A7ZmaE3RfG0LPE8kBGaSVieC0gs5b5nK+UtzcJJygdQUTTPiuXqStsbOV2QsgJOXxb
         XPKt16AJVaSN0z6d/tw78l+n9vvhYmsj3lLeBSMjhcFJ6Dt87JNyKLx2bI5T98spLccu
         D0bMqTVq/6LM20SspWi5+Q8JbcC4RMMKMYOZ2kYGWs5RfhWO9WneXY9ZrUfA2YHgObtH
         9/TnMsps9b8CF4JBJYc8F7dRlu46WuBsvNz+XITGbk5zER/nT2Rm+DuZh6mRd+el/zTB
         cNRiFkO1CNEW4Oki+b4YHiTzmVmGSR7cKUTQCfoTOWXbK/nenCGc9NClAapUHcNWJnqV
         b3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348646; x=1793953446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D1AR8fDl91tJDx1vwvkWBduRKTWQCgJOTBIPuh9pgE4=;
        b=u91GvfADZ6msSOO7fft/RykQFL75B3A7L2ji/FYWt50Tlqd6zAs8pc2TZ6nw6jk9o+
         koAgSJM6EKOISIPLrpmPXSJCLAR9rnS80Sv0lAvdn+N4B7vmgokYH602C8vyNCicVIEZ
         wAu1r8EylKTuzWKSlRFp/Tl9+KgMFfktm++ebQt+Hjit0wjDBpxfzJj5Y3u1UkJiVkk8
         DbYwqz1Gy03YIvAe5jcM7hh/CAgb7C4O2p0n4Bt7R5bL/LnVIy8P+f5RBNW/y32bd8yO
         mt8PnG/eB5rWUbMfZBe+GGl70dUq5yXe4wafF9qzRul1SxMSyMCgQpWN8vIYz8j1Twpv
         3+yQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXfQFf761SivDwv04V4l36hPWGOlcZF+mKsSMzud/V89uA/2KV7cVlWfsMcWZIYOWU8f7dTFdZXkmw6yQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW80ViPB3MAoKsDcirjS35Sd4zxHwKiOz7CxwN3o4zuNpPsmNP
	E9KzuK9Zy0TZ1r+i88KewsJo00tGohek3g9+nyq4Bk1y0/zcJKBZ55m5FXB7uPdY
X-Gm-Gg: AYBFou3aAOS7GDjISYwjdUodLIZPrQZMRJ3sFRX2CmJ86AT83OQm4PG3V4YAwfnDQ/T
	0ZvEQktPb5b7UnM2OonmIHNzHw7WXR8vf3Ehr3DSNsWjoeF7s1f+Sb7rByBeNaE8zTAO0MhJzpS
	dE17yuEEFA0+HLLueH19WiM62N7oUXMBdtaTvZOHaUaDAlhaay+A+ps/RqpS41cOgs1JQJzIHLz
	mI+VbMubXia4aq97nPeONxwevK1ur+tH7BRVdCublQuJjXlEBjT9xEkjQDWlMne60wD8GGjh3KH
	KhjKK2+QBoBaDNiGi1wsecAIJ2QZluR7xq7OeAxyMkuy9GOqoBy/Wfkvo7RP6X09TCwGN0J4UdG
	L79Jcp9MBF0lgwGh13aJMG2NnPQsl+j3JWe3udht+ydHclEogkDE0z/5wPPDDznZ+j0zeB/ZmkQ
	17U6uSvA+bb2Qne22NMGxdn9LuW5zNO+qVH7dtTu0RcIYYmcwI3qK/iqYZWqK+R4iMoejNi2vn6
	+lx6wtmBM/zdvjILilgJnuJ48nYN8M/Yx9A8+Aa2LzdyGOu9NQdJN0XDNStsayk29Ygu52gXT8P
	UEsCu3pSB280qHFxu4WNQnmz08PvK1vKMur2N5jNZWTjlq6d84EBw8q3MHiThqgekw==
X-Received: by 2002:a05:7300:aca8:b0:35d:28aa:3ae6 with SMTP id 5a478bee46e88-36a4244e81amr3542769eec.32.1793348645614;
        Fri, 30 Oct 2026 01:24:05 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:24:05 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 5/8] platform/x86: telemetry/pltdrv: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:52:59 +0530
Message-ID: <20261030082303.284271-6-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
References: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() for both telem_lock and
telem_trace_lock so the mutex lifecycle is managed by devres.  The
driver was missing mutex_destroy() calls on the teardown path.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/intel/telemetry/pltdrv.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/telemetry/pltdrv.c b/drivers/platform/x86/intel/telemetry/pltdrv.c
index d9aa349f81e4..70b74a7c6c71 100644
--- a/drivers/platform/x86/intel/telemetry/pltdrv.c
+++ b/drivers/platform/x86/intel/telemetry/pltdrv.c
@@ -904,8 +904,12 @@ static int telemetry_pltdrv_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	mutex_init(&telm_conf->telem_lock);
-	mutex_init(&telm_conf->telem_trace_lock);
+	ret = devm_mutex_init(&pdev->dev, &telm_conf->telem_lock);
+	if (ret)
+		goto out;
+	ret = devm_mutex_init(&pdev->dev, &telm_conf->telem_trace_lock);
+	if (ret)
+		goto out;
 
 	ret = telemetry_setup(pdev);
 	if (ret)
-- 
2.43.0

