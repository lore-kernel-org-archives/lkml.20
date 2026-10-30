Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348628;
	b=B4yzv+eC9bBh17Wo3O5Qi/9GNu5j0Z27KaW7+IBPfoEMeAJlUCANi/vUV9u5+0Q6Hrg2
	 DasGAMd8SyxhbMU/XU1p+ffsCXcUjeLJlZEos9Ut95dt0yA2C9EGHMtxX3v8oaUVhxGkl
	 L3HdB3V7/Vpxn4dR3mZ4lkrGUBZQPCuFKwkMJkeEmhrES0LND7JTbj22b9H4Mcohi1qNA
	 5vqRDrt1aLAFfstlfiVwW6uK+YmetQiB/lGtQtZaLU+r+G/BAjzft3gRqBEoQQHlvi48D
	 ieH0j1cvmq46LBC114oCi/Rll7crIBgNm6llqWiVYAkJPGqiYeNVVIttbq0mnqKiQTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QQYBc96PPknTkspwMAYXcF1iUzAhc9SAfvHOe/sWht0=;
	b=nwYLYP/A8tAaofSGTxvmNXmbLnYr2zmlnrKdtBoYzOJcyLVuGjiGFRRkFgE/HczOOjLA
	 o4MiXs+WWJp0FGDNsBRAL1FHp98kurPl+Rd1D6JSy3SiYrpFiN/2N1oPAsKcXP+u2AS6z
	 eu0KhjJ2jyXx6ab4ux1l0hFadboGbNchbrd7oV7cvLBlh6ogeWqPeLFfO10p8ScYXVnLW
	 9UXMV18dhXdN9I96bLOE5y1SWr8Xb8HjEXvgmYtBlJsh2Qj5gamLgzyW/TiemG5ym04MX
	 LZOwhQyGyfxKijx2ljZb4Rvw7X2+ve70jXkl7PluubnTszbpOi67tPou6IajEurOehg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kx82HvRZ;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56F0606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kx82HvRZ
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so1068607eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348627; x=1793953427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQYBc96PPknTkspwMAYXcF1iUzAhc9SAfvHOe/sWht0=;
        b=kx82HvRZc7JDUNM8XzN4w7ecKDROoZmWmUuXvOcSOnlqFwnncePpohyBzpZ40/v7vu
         y0F0pwCfJS8RF13XkOD2UtLcmumqOGMRHSFsg3gEH6vqVP/ZIwWl3df+NwNacEoaarHz
         CeBt1Y8hyWEl1rlCxdhxgtPfAUctFF2hMHBipQshlfzhJ7dclS9zEa36ICc2hWMo8Eez
         EEHUT4G47iXO7Ke6CZp3gvECfp6koR+D+ta9+8MQM0S1wKafF1geLu/rkTjP6nbqNm8S
         f7ZbnJowmRBsj+wpoXbVWhWYfQLePF9Qk+nOl4/68UAp4NMdJPrOwQEsFn3oSwFTpCQi
         eX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348627; x=1793953427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQYBc96PPknTkspwMAYXcF1iUzAhc9SAfvHOe/sWht0=;
        b=QHgyhU3AB1OoERVihC9csc6atr197DKdAom84vPuXAHsISHMu1rqL1zVOiCWkBR/gl
         eSPeNSk4KPnED1HMT4TBBuKZ6LAms0rLE+6QG7Y7pgGZUYodllcYUet7UpmHgOI0Jtle
         L4JoIrNiA1FSYUA/0qkcll6dSvJYGcd6Mm/jvTlJLave0U1VzSy6Xa6SSBr5YhiXBhR/
         HxOHM9nbj9AkpYBa2XNQzkZm54CF2rqB1H7vuQHBfSMqYE7IQ3vsgOhMST5HF984HE4p
         pGjrJcMUOIHIJSBa+MamtJ4hHLqzBIi2iuHnYGMWi73VpAL3e9nvrgn849o4rPqnqz0r
         Jgow==
X-Forwarded-Encrypted: i=1; AKwUvBz78KjB/jlm/L40jA4OwFzjLYOYAoWZPhgSFTO0ZrYCf+mLwFeA+Se8L6+MygXU48CbhbISxG+ZZTcGLfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTc04A2AV7nboc+XuNWsJCof+SpwKPASIt0ni58Kgky2sAEt7z
	4O4tOjqs8X5QAQ04hTNgX68nl47uZc6R75qFK1z+F40Bk6uQ1oQfRdM8
X-Gm-Gg: AYBFou28Bpalc0d0mmmi5nzegmT8ECd7AFjXCSoXtTDQsmPk3xHjupZjyROdaoLKcmQ
	HSLLpjPn4LRby0xRfWyQ0SDExQu8pcDzfySEtdHm2daoG0Uz/foxEgGool11/HD1Tp5FcLdgjlz
	v0sN1fqXrU3rNEKza9mzPuUJhAKnLqLJ1eDSlRhCvlCf2YZAKQl+bXtAyMlnMTlUNlyKf8K1lsf
	2kOkSomXtwND2Ygoz70fLxkUdAqFJ/o6M10S8gBypazEOaZLANcwR2VEMN7SXf+mcyencfDEqgo
	JGJo+W4PpjxkWcfwHrrdD9AysC4cx4pdL/w1LRTLLQP7tnNuueeQWL7WDRGjPPCyBHiCR6OLHjB
	PCBu/hCdR4wrMgm2TalVHXWhA+0ViQwG53/nRSLupGiKSoAUE2CgiHGzou4fWJoXTo7pYU3Bypq
	J6MnEAoWZXiXP7wUovb+VRuya2FrN+ucIqDiQ/rF3ZrGDHRSJD1zOvDF307Hx8EwxBqdq+Z/INA
	PXjr+Wmqb0Rd8aIBPL48NDzXXAsMbQqkTSu96Wy3zg1i4BKdiPxyVVuzmDQDVfomE6csy0U5eby
	yFJ0MfNDJMQeOmh73O88WZDHzaWeWSi1O24pIVuhvzpHCPBNZSyCcI+K3qKH8AA+KhC95kVoTli
	Z9QCv6iUkP2M=
X-Received: by 2002:a05:7301:7d06:b0:36a:1870:2240 with SMTP id 5a478bee46e88-36a423f12e7mr3068838eec.29.1793348626993;
        Fri, 30 Oct 2026 01:23:46 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:23:46 -0700 (PDT)
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
Subject: [PATCH 2/8] platform/x86: isst_if_mbox_pci: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:52:56 +0530
Message-ID: <20261030082303.284271-3-chitranshmandhaniya@gmail.com>
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

Replace mutex_init() with devm_mutex_init() so the mutex lifecycle is
managed by devres.  This removes the need for manual mutex_destroy()
calls in both the error path and the remove callback.

Since the only action on cdev_register failure was mutex_destroy(),
simplify the tail of the probe function to return the registration
result directly.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../x86/intel/speed_select_if/isst_if_mbox_pci.c     | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_mbox_pci.c b/drivers/platform/x86/intel/speed_select_if/isst_if_mbox_pci.c
index df1fc6c719f3..ea0b396d35cf 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_mbox_pci.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_mbox_pci.c
@@ -180,7 +180,9 @@ static int isst_if_mbox_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	mutex_init(&punit_dev->mutex);
+	ret = devm_mutex_init(&pdev->dev, &punit_dev->mutex);
+	if (ret)
+		return ret;
 	pci_set_drvdata(pdev, punit_dev);
 
 	memset(&cb, 0, sizeof(cb));
@@ -188,12 +190,7 @@ static int isst_if_mbox_probe(struct pci_dev *pdev,
 	cb.offset = offsetof(struct isst_if_mbox_cmds, mbox_cmd);
 	cb.cmd_callback = isst_if_mbox_proc_cmd;
 	cb.owner = THIS_MODULE;
-	ret = isst_if_cdev_register(ISST_IF_DEV_MBOX, &cb);
-
-	if (ret)
-		mutex_destroy(&punit_dev->mutex);
-
-	return ret;
+	return isst_if_cdev_register(ISST_IF_DEV_MBOX, &cb);
 }
 
 static void isst_if_mbox_remove(struct pci_dev *pdev)
@@ -202,7 +199,6 @@ static void isst_if_mbox_remove(struct pci_dev *pdev)
 
 	punit_dev = pci_get_drvdata(pdev);
 	isst_if_cdev_unregister(ISST_IF_DEV_MBOX);
-	mutex_destroy(&punit_dev->mutex);
 }
 
 static int __maybe_unused isst_if_resume(struct device *device)
-- 
2.43.0

