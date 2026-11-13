Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568964;
	b=5daGO4J82NbHn71W4Zkbe10ML7Zz0CKlySwN9WrbpcA2lgmwJba8WLb9k063v3gZMl7/
	 X35AxgKFRwhZFcmAk3BpxwlZTAc9kb2nKOlNrruiblXFaK1p4oPYY4rDIHAGA1KDbD7Cu
	 FDJ86BZQ2ZGX/0F+pwGXnX6Jio/ro2TxpUzcWSOxYNepdwsq0ECGLiM4qGJ6VkTZin2nj
	 ZlMMeEks6ae3j1L9WVzQvAUdenynUMUPe2+yY2iho98hI80DpgHPu+yc9D4t+oJSy/5aP
	 POfRQTqfZtQKW6nk8a5lW/p5DIYIqLLHKA9BdQ6xQ8O8kdZZGxFxJJKoplijOaOFOdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=P9cljPUoqRCp8iQx8E6PP9Ijpsz+IopB+BeFDzWmoxA=;
	b=qaJEc9DpUYHsAMrOK7V7OiT4Y9MOdB22i6bVz2ksZsgoCnIYRcySENmGGwgNvvT1dT2e
	 gia8N/UStjzHGqzDrSbFIrTfsxDE6sseEd21R4s4WfBsUJ34tKw+W/E15VEoY3QYua8RH
	 YF0QiUTRc2sYjHgRUY7sV/mOoZVGD2suVcjdtrxW4k4Rnc/r1LH10zby+E5C2jtl6kE/D
	 jRPuNZ9b9Yfhi9J2BXHs0qKsZvmAQRs7mFvUFIwrCICetlq+Sod/hTz9hoSTKqgGDGm1o
	 fpWyW4IjisTxacSfawPOP4ls0SzgZMOt3BJCf/qZHG5hpPm6KQobAu539Rsq/2pTJyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tyDx3rEe;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A7A606A337
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64A7A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tyDx3rEe
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so996106c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794568963; x=1795173763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9cljPUoqRCp8iQx8E6PP9Ijpsz+IopB+BeFDzWmoxA=;
        b=tyDx3rEej0eOLwfvK4itRoSmGb0qAKV7J6aBqVlqyENDFtjUdEEV7Dn1ZtNx7+VxVe
         lz3PaaEboAB2QO3SM59uqMfM4YCf/aenDSIQH9xXq6lquWyoMVNmLOWzQsOZPR7cPV0D
         jAXNE5clc55+rsWFEe8Vfhpfdt8jIhUnkAWOxPyD1vn966twQinv5/DqeR98kqEU0jDp
         Oh7HtTjH5QVLnaxvZq/OpADu3j0CSen/LTaliMaRFQ6vzzYHoQF0rVPSDJ0mD0zJ/j5X
         d1NfFd9/Eair7J3cNxjvf2o5ycbeOdFJuMjN4hvNqKeAKFWfLPRTXtDeYgPK9FBAjSFq
         HYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794568963; x=1795173763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9cljPUoqRCp8iQx8E6PP9Ijpsz+IopB+BeFDzWmoxA=;
        b=q9Fx53nJWaAlCARHXAQleWwgcUgCSF3Bn/byfNm61CAfekCTji34udYx8uuH2pLXmZ
         ZYN7si7fsZAYkNslYXqpFMDb4MDkpKJNnYZ0/Kd6DcLFllxypkqedj548cQny4SwJhe2
         dnHTgVL/5B4FThj5Rbh9rX57llZ3sKGqhjLglOD9/YpstJDwun1eubg7koN2byke8nxa
         tCRL2Y/HmdVE9ErJQZhDq9t70ptYg6u4MDMUy0OBr0Dt7T9gVSymzdLaBevtTlBVhONA
         djeSa1XjuDgEZiwpxYrfVMOWmBXC3OuYQGG8yR/apabRaW2enwz9ER3W5geK8xR5LHIT
         v1sw==
X-Forwarded-Encrypted: i=1; AL+hErH8EY+5ZLFrpEvT8w64NToIVKyVhS8xfLcO4Q9EWWM4graSIXxTcQqfKLMjr6wrdS+SyC2m31LNAhsy53c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WQRtUapYgmNYviCUZh7E4EscSi27r4hUayekZMeyZzn/4hl2J
	mOg84MW03t41SUuAkOoPO9lnYIESDTlm+sLPz5fv49+eLXP3wT87T3Q7
X-Gm-Gg: AYBFou3mcd5wsJQAwTAoqMXRUXjjw1p7AzTl0TUvBxcJoPsrGiWT8Ae6OKh+cGnoEZW
	OVWR8PoW8ZAKGVjSKiYOci0HmQQ4ZY6Cfd3akACJvoiKPpwzbhr2PtZqgip3ghDXpDLJ2aUr/tK
	77qu/hcm1/1BGGZV6CWRjFFghFECxruYhQmlUr4wuqS2+7MKITJy7pmtAlr5WjB2Phl1IyFUA/4
	/bMykYfmjddbnZf9JiCJmvdJLbMI1WSipgD0bzquXCGvW0Njd6mqwkDCuN07if5mP34erIHL3C8
	odVwxAl3dEAanrl07RJx6YPC1YvLFJBcN2UEHJzJvKA5ixP9mowSvC8AgdgJcuTt6OXbxpJPHBJ
	ExzvYnXtnoI8EfM/CplyYbrhtM+4g3WwNMG52UZAzoH53obTsk/5ggGckRykuDhLwN1VnSb6f0/
	2K07fPCpMVxNxkj4+jETwRPrEZNWjRvcC++Z8/FxtcFbylEnbsI4Guz6WiFEW9sS3U+UN7JoV9j
	a5+1H5tN4klDgAbYVv09DkMZluVTexFuPmrlVnuVxCFTgon8CcmXIiq/0qkAHfqmrIHPUEggzMt
	eGeRXciZXDiwHNhYGmxr251Q53XsUxAghEzuD0dWd+HR1eWO
X-Received: by 2002:a05:7022:3a87:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1b5030980f2mr2439664c88.13.1794568963315;
        Fri, 13 Nov 2026 03:22:43 -0800 (PST)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm11023797c88.3.2026.11.13.03.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:22:42 -0800 (PST)
From: Yuan Yao <yaoyuan0329os@gmail.com>
X-Google-Original-From: Yuan Yao <yaoyuan@linux.alibaba.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vishnu Sankar <vishnuocv@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuan Yao <yaoyuan0329os@gmail.com>,
	Yuan Yao <yaoyuan@linux.alibaba.com>,
	=?UTF-8?q?Jingle=20Wu=20=E5=90=B3=E9=87=91=E5=9C=8B?= <jingle.wu@emc.com.tw>
Subject: [PATCH v2 1/1] Input: trackpoint - Add new TP JYT_NDT device variant id 7
Date: Fri, 13 Nov 2026 19:22:02 +0800
Message-ID: <20261113112202.10304-2-yaoyuan@linux.alibaba.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113112202.10304-1-yaoyuan@linux.alibaba.com>
References: <20261113112202.10304-1-yaoyuan@linux.alibaba.com>
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

The new trackpoint variant id 7 is found on Lenovo Thinkpad X14
Gen1 laptop(Product Name: 21XMA006CD), it belongs to JYT_NDT with
confirmation from Vishnu Sankar in Lenovo. now it's incorrectly
probed as Generic or Logitech PS/2 mouse.

Add the variant id 7 to match the TP_READ_ID command return
value, probe the device as trackpoint correctly.

BEFORE:
input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input63

AFTER:
psmouse serio1: trackpoint: JYT_NDT TrackPoint firmware: 0xa1, buttons: 3/3
input: TPPS/2 JYT_NDT TrackPoint as /devices/platform/i8042/serio1/input/input8

Signed-off-by: Yuan Yao <yaoyuan@linux.alibaba.com>
---
 drivers/input/mouse/trackpoint.c | 2 ++
 drivers/input/mouse/trackpoint.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 3bd8fdf56cd3..2dde8cc5cab1 100644
--- a/drivers/input/mouse/trackpoint.c
+++ b/drivers/input/mouse/trackpoint.c
@@ -25,6 +25,7 @@ static const char * const trackpoint_variants[] = {
 	[TP_VARIANT_NXP]		= "NXP",
 	[TP_VARIANT_JYT_SYNAPTICS]	= "JYT_Synaptics",
 	[TP_VARIANT_SYNAPTICS]		= "Synaptics",
+	[TP_VARIANT_JYT_NDT]		= "JYT_NDT"
 };
 
 /*
@@ -285,6 +286,7 @@ static int trackpoint_start_protocol(struct psmouse *psmouse,
 	case TP_VARIANT_ELAN:
 	case TP_VARIANT_NXP:
 	case TP_VARIANT_JYT_SYNAPTICS:
+	case TP_VARIANT_JYT_NDT:
 	case TP_VARIANT_SYNAPTICS:
 		if (variant_id)
 			*variant_id = param[0];
diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
index 3e03cdb39449..2aa76311e400 100644
--- a/drivers/input/mouse/trackpoint.h
+++ b/drivers/input/mouse/trackpoint.h
@@ -30,6 +30,7 @@
 #define TP_VARIANT_NXP			0x04
 #define TP_VARIANT_JYT_SYNAPTICS	0x05
 #define TP_VARIANT_SYNAPTICS		0x06
+#define TP_VARIANT_JYT_NDT		0x07
 
 /*
  * Commands
-- 
2.56.0

