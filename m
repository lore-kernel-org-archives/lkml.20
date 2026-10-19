Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7307945198F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792383511; cv=none; b=JpnNADa6vAYoqHVKVNKKuVlUmJ6Pi50dM5P03UNQHx+TreMD9TnzfOkqUriZs9gpSMRx+gpH7+SQDKzqHmP+1S7ySZs+QcSdWGLp17OI/RyusbTDkK6fU5qcnISexPvD/1HynXnksCFDctlwQwP9ASHao8y+KRp5Rrme4WDKMzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792383511; c=relaxed/simple;
	bh=7n2GUVavWCaznIULC4koTaKML5uMo1SBp+OgkDs0sgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BlHE8eVxg+HPEeyJs5clkPBNbwjbMvGvkOCyGmqt+24hi9ZIg3lTcVw6ElQEoNrVo1BCOIe3qDmEXx/g+yUuJakRuYfaNFd3c7rxiXAYN++uzKXnUWIRxcrMUV7wxd46dd2RxL/NFH7DvmC33ZLxw6xyMPxYT0uN0MgXv7viD1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hackers.camp; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hackers.camp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1e776845cso138835e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792383505; x=1792988305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8yTvohyfHN+LGgMhB7OAI4MKDO7ZPXP+V+3d2M470U=;
        b=YOIvGTqxsSp2ZFrY7edfy1hxndNSE1BCRKmr/EHcMVAc3/lILAlCZ/dXz5xB7L9gts
         4laERD/bhesWRMcYTadtAGzTiaoQgvAIX5UAMR0fAOIHECiGEAEcrY5CdNoh+8OuPy4R
         CflAjL7akTHSug65SUnihYlCDEdb+oKVHhqC5mmM/tkh/KKHlSsQAT7e4iBtoO1rZqpp
         8S/5qBOlGLH/5A4maTMpBGlmJ2wnaWFTaEjDpNmYNeE0WTlP+w05tlH37rfCp06QfDXt
         zFAmkjDRs6Z7HvfME4qA41kxjSj1mSVmQcIgJvgieEhWgdbewIh8ExwaI9oOUr+sO1iK
         Hv2w==
X-Forwarded-Encrypted: i=1; AKwUvBxOSfe774GC24a/EffOuzL1oLj1IbT1h4WwJfINu2iA/SOSltH51lxo0XH4Xini7wZ62znl6hDYuwehsVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGWyCHGWWidT/Q5OJQZI8lCquSkfI7MsDZ1ZPCJTPeHPTn8vD6
	7HnexojSYf28+K0vHFzPa/qkGMv9s2hfqBDy0ElWp2BFHH/ZH8EsZGKG
X-Gm-Gg: AYBFou0XzibWQCYSr9NEKziCXdqgp4020+GB5g/juEhtLjApA4E6Mkil009LXq6UIOX
	UGXbSHC0JirRSjBKX9NrcV1g8YsPSQ0JURU//4mW785uxvlgz7pUf8OlGVHysXLxRJDuG+M19SD
	RBMIERAGvspBnhMrCmbx2iI6CTpKOHJ5uzpP8OYt28r162wAKPaAe3NvFOR2OxarCJdeiExi8+A
	vKe0OqIVQhWANMeK8sl74Wtda3RZVeJ6K+raZAOv4NPh2jI9eIdAKr/jBxQYauANG+iWSVl6LEZ
	8vyMLCSy5peL/KDMOSfYeb78en8j60DoX07ddFmx2QoWcU0pm+/HdGWhRwOcakrxn8Mrk1JO/Qa
	GJaJOySIvKrPllHuWPUV4SiTMRq0GeZQZVpm1V6e7ZGpYvPXIcJOEOqnDPhae9NpTWA5jvuv8zS
	vsWXwBeShjf/H+suSeRrKsIqYa7BguRqkPGOUXL36azpHpc863gio4P1xHtcVugju8+P8gK+FB2
	1KgNxYiiY+ynb3u7pMlAk4nCfpSVGHwSq1r
X-Received: by 2002:a05:600c:4ecc:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4a1e0156660mr91288055e9.0.1792383505145;
        Sun, 18 Oct 2026 21:18:25 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm20090449f8f.42.2026.10.18.21.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 21:18:23 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: Aurelien DESBRIERES <aurelien@hackers.camp>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	aurelien.desbrieres@gmail.com,
	linux-api@vger.kernel.org
Subject: [RFC PATCH 18/18] MAINTAINERS: add beamfs
Date: Mon, 19 Oct 2026 06:17:28 +0200
Message-ID: <20261019041728.327785-19-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019041728.327785-1-aurelien@hackers.camp>
References: <20261019041728.327785-1-aurelien@hackers.camp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for beamfs and its documentation.

Assisted-by: LLM
Signed-off-by: Aurelien DESBRIERES <aurelien@hackers.camp>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 62744835f86f..e5b95458da43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3082,6 +3082,15 @@ F:	drivers/usb/host/ohci-nxp.c
 F:	drivers/watchdog/pnx4008_wdt.c
 N:	lpc32xx
 
+BEAMFS FILE SYSTEM
+M:	Aurelien DESBRIERES <aurelien@hackers.camp>
+L:	linux-fsdevel@vger.kernel.org
+S:	Maintained
+W:	https://github.com/roastercode/beamfs
+F:	Documentation/ABI/testing/sysfs-fs-beamfs
+F:	Documentation/filesystems/beamfs.rst
+F:	fs/beamfs/
+
 LPC32XX DMAMUX SUPPORT
 M:	J.M.B. Downing <jonathan.downing@nautel.com>
 M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
-- 
2.55.0

