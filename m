Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380813AA50B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015499; cv=none; b=dMZdVT5imOm/yzbdEAgOmWqbU+FPZ17hhRQ1tGQ9r7V7py0LlOJZcFf0YtABH4JKsO+TqXmzILR4+5UNzxDNqVS6Ph5AQx26IvSnUhycKmbENqNbXe8qH7qDKzozbuAeJkZ75HZp9yS7luPA4Hwmh2sL9gEuGDHv8aMxGOWX4zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015499; c=relaxed/simple;
	bh=ned8Xd+jYD+au5qlWbCyATJxda5xlf7aMTyVCxHleog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9a3xtOMMW2AUrkmXp/xjuJFGXZdkM161/U5NjVSpIgKZVBnoiKabPuFk6KEhsGQpQAH64xjeAN0JgJ/ucLuGL1W7RWXMbnxOMtZz5n0GY0BEvsu6FYl+mst4zJdzHtaiYPAaEwk9HskBPQcdkkNfycOZMbVh6ROAd2ASaT6noU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DenEnDku; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DenEnDku"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25400so524419b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015497; x=1789620297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/G/XQxY0D9MMJrqs9kzQqPGg+nQIyZT0ewQHseBA1dA=;
        b=DenEnDkuXOrq2rTXjwSA7R4zMnHz1IP+Z+v3uH1HL7EtOIygJeNzpjNVy6lYuCK91H
         x6ED6WZf7/LBw/JYZi6aI7GjBF2tybFwkFgtseH0WgeQBxkPKRbo3K0h8Bb2iOxQAnFp
         5D01ozYlspBCQ2L4cGVy8SZewrkiPb4lhPP/qhqcYdcduBRNaXR+Os+K54lrF2MQnu1p
         9Z09fc6mbF1puMYeqO+BlNqCLk9w/qU7cwltXY0vSoe1ZAVfdCPBSs74nG6FIZ8NTshd
         hK3+k3R/rHsYZjOnbEorqFrBoreGjJYskzZkrgHSOz7Zu9ABAYFamdA2wWwSDle3GeoS
         O2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015497; x=1789620297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/G/XQxY0D9MMJrqs9kzQqPGg+nQIyZT0ewQHseBA1dA=;
        b=Xv01tr9AHjEGk1bbQx6VD0hg4iJgPUO/lRPABNZruZWpsWKkf7AQCRud6LqJSj3GQw
         5wShOJp+wtoKmGFI/eGgqNjnwoYVSWn2cfE8U9hkx/WOI/5oh9Hk+N3Fr+NuNXpy2so4
         HtdycOle6urZTkXuH7pyjjJ842UxhB+31+cgAVcCamR17WfJOuId3B/KB56E+lRqpseU
         y9AYCu+BM/VPGLyoul3/YVSLNK09iTChWmX/6O8Ck1jC8bpgq5oABYQQNx07Za7R8YCo
         U+GhPlGXN9WFcNZyW+UlpHH1kwkUZ3oGf8HQlhkT5zbKQeQC2OUWw9YiIqPWajIDp7Od
         xeUw==
X-Forwarded-Encrypted: i=1; AKwUvBxn5gsSv7sv1E5dWcH7UT2BX4D1yZsxcbe0Biz8pvqs+I8Z8g/DToRdg0V3R80Cuzo7DwcMMSvxv0f2lOw=@vger.kernel.org
X-Gm-Message-State: AFuF++lWyknaLiaNsfjjLuw6uUQI6qQjP41dQzcY7d2B7XaZZwzRtK2l
	ey6dYdrq20hpT4DbSLZ4U4eLxdNrqKjegVq4cf63CJczo7L15oGayj2l
X-Gm-Gg: AYBFou0z80/r4Ww1knzs3SvUqdv7rcGJz8Ich7M7l7sL8ymCO8zP3rhr7XCaZsK8H3K
	XWYFoxdKrpO3N++5k6rU9p/9GCRUj2ius9rKG0JnR0hzUWMhO1lgR30EIkqQfZEL9ewKyLr3WBf
	vIPidJQAJXP5L9h8lC/skgyFT3eEpSWTkKx4kiLpxweZAL11qN/DiSdMcZvqRgJdsrcUgH62GKZ
	WjRvCHegKlCczaz9eia4QeoR425r0JvAlbrwPGsswKuVs+00unKyOvh/mR2T6aqYLLD48V+AxwW
	ZPD5PvUOTu/HyU3Si5xw7eETvnxuPrdLASB45jHVrIGWvbpu/vOItRBf2qTlOOjTiwmbRqbJWkl
	hpUs3FqkxXQCcLJUfaSDdsakMPWJTxGGAVAlQrydFlJoA+4U9b7fyK7k/jgo+YsufKX1WmoTkma
	rbdV4HbunzX7HKJ+cGY63j7pu5U2dQs62s5b9bU0yq2TMkTxUws0l+IZvR3+Iwwee9gcNkezyiw
	Akoi8WOtTRHv5htUqO4yyIGHg==
X-Received: by 2002:a05:6a20:e18b:b0:3cd:9f0b:f7a2 with SMTP id adf61e73a8af0-3dacbdaa8e5mr8493294637.11.1789015497445;
        Wed, 09 Sep 2026 21:44:57 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:44:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] platform/x86: asus-laptop: Fix typo in infos_show() comment
Date: Thu, 10 Sep 2026 10:14:36 +0530
Message-ID: <6a9f827d1135258ac0e75ce2dd6d05e1cded6d44.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "informations" to "information" in the comment describing the
HWRS method.  Comment only, no functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 449addd1ac7a..de607edb9490 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -865,7 +865,7 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
 		len += sysfs_emit_at(page, len, "SFUN value         : %#x\n",
 			       (uint) temp);
 	/*
-	 * The HWRS method return informations about the hardware.
+	 * The HWRS method return information about the hardware.
 	 * 0x80 bit is for WLAN, 0x100 for Bluetooth.
 	 * 0x40 for WWAN, 0x10 for WIMAX.
 	 * The significance of others is yet to be found.
-- 
2.48.1

