Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252684;
	b=n+e8uqa97OMJAnRyoZhE5DZ7LHrTU+r4safF0zMmZLW+FvPtzArLslcV5cLrpkmu5OIK
	 S4VKZzWzWIjX1WrVFbZCHERHG9GVIfwVEbora2ui8Y+w3b7dykWlogA3jT7CA+Jxy7DFH
	 7LIE9KNOohbQ55vK+4uMKmuUOkT2f03T3OKAVhXSRQXYuRfwwMvtr78OcwrgVp7RRc0J5
	 iCuGaEaC98RmfhllNz+diZRX2HAMD2F/Rxi7lGpzMiua45rRenTMNWIkHZBea4yYwDMS+
	 cCgGZqo/fLB9KmCN6gey7Apjdunh9eFoyRAZXvv4BrwzslhY+VRklEZTekBiI9fDRLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ec4/N7zw6HP65LFOCU/La2k3iDwpzO2wT9iw6qkE45M=;
	b=bIZSxOlEOvoLE+Yg8CTE+Ye4xm1FF3mVqrDK/YZZbIB401My6vJK8a3clySyxrl+9IOI
	 GwBps0T6gpnfVN3a+4GKMP4Jo/5o0iM6n7CdWHT2Q2WkOpnOJXpQToNFPQpEeVkuH4itL
	 IEx9jUMMQzKJQLQvJMUw78FTN2BZDToKE/JxbcLDZGNQR5/VVXP49xlATlzBmP0Oj1qGw
	 8ppyxMKxkB7Q0opTkCMUDBQO3CDopcFK+zVQLlCkOwsd+kmYWymgDEwGqdYvQYXrN0CIV
	 f2i1JaDCxeG3wHg/j7Sf9NZ+dhNASBmBy/r1yWAgsfpCHriyIJKlHmHGrqldkCDVP4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fciZAA34;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E5A606A329
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E5A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fciZAA34
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so913786a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252684; x=1793857484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ec4/N7zw6HP65LFOCU/La2k3iDwpzO2wT9iw6qkE45M=;
        b=fciZAA34a4I1RZJs8RsFDiIMKniW/z3FeP9xw5Hks/lF5OLVsWVGwRkRKkQzPZoALB
         huE1gh6wMHvzQfgT7HkIK7px8J2gpVWDhIqVGh8INY8jhjoRbP1k2W+YohWAew97m0rU
         TnB7ZKfq66LaeBYudl/pyf13iUQqRrW+YQnmTOq2FADZREe3fQ4HsrSV5pqqwVIU+yCM
         UNG5KOujfexHJASwOJuE/MhOMWQfB4TsYq0oFrrnUZXgstswWIkqDoOOEJA+4dgCFUQI
         HCsqLIdmhcXgH829Ov2HtBOWZLhUTmV+HYRocbOiTrtNeRWwtvsJYud+v0cSgXVWG2L0
         1fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252684; x=1793857484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ec4/N7zw6HP65LFOCU/La2k3iDwpzO2wT9iw6qkE45M=;
        b=c8AZMTfKkxvlt+BPdYzPlaH7GlXQpsWAX5MzeP5Mgo/I7q7YUAVjA0u/ZdQ7II9FV8
         1QSKet16pKmLf7zW1O+IlTns8kCbVRO11+C1ydSZsiNjBGGZy2q6yxQpOs20kA2R+eVq
         45ENoCyD2EDjd7ZM/+lJa7LOJrFKRuWiEl7co5wSVBOPVal2QFMelyNpIcHfzKNdz/FZ
         GO2DNxbZrlTQCB5HxxGUkJqczTG/nXM55obBIq6dqkyOyjH/OQjjh2kxjGMPJUJ5m7Bs
         bwnlxpgL/S6iGQ0wnKCIkhbmMjuScrqJ0ugbbHOgA2Ac1aFIIGoSoSi67FzdiGpeiXYB
         GWuA==
X-Forwarded-Encrypted: i=1; AKwUvBwU1ucOuXbPfLPRREKRB/bO9mI+cdYixgoMXIIzNlU4JMbAI+MJD5gHFJzvv3foHE25QqWdzNW/Cc+edQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMwDuL8H5PrxlegpxhzlD+es7ZHhDNhXzKZXYalngH5J6gjx+R
	nIPmQznUh3PjtVZbFQOEExeXfudTcNI2XdQ3jiGIKqbUEzcWtrucvfcA
X-Gm-Gg: AYBFou0MSllrBabK0gDdLa2Oxv0pRndDDCwONUnlomYTN7aFBA0UgICO/qsRHJhJoNS
	fakLpmRvBmgqius7oCp34awfav2RyIwOUtjWYJGACD1XP89CGukZjZ4e6nwXV7S27ZOmHT9pGB9
	QtqR3FPQXleUzkEcYqycLa63JV+btSV+6nHeEcsHQlHEVQaYkvMbj4VXBbf3oF9OFkoJf8eRsvU
	xi4JTv9LKpzJLK/011OfQfA9PHWZO5xxrev3xituU4iqERnkepvz47WyUxUvXpbhhE6sRYVooS+
	szPJrGiI3bHynUz8EY63FkGwHnP3KIaTBhXdb4PA28jGLvf/+QxcYlDD3sDOsq9pzKEykzuY9h1
	z7YbO/TCq4orVt9ZRWw3jkfpzSY5sRqeo3et84ZP14eCLQmqql4zSc+ZUbygYh8q/B14nC2dLDq
	R7LjNBGzJiGju1wcYG4NXzRz+lrewNyoykO8XGWi7sVXe3qXUP61jY2dNyRul93zllQDcAEuInw
	UI5nhpCZdQQWXw4Zols3xOCBbSJh+DrJgZk0NZK0IzhqEvdgAC4Uk9kfJH+7nwx42rQ9DqqiONX
	6yDlYp+MLyGsrRDQ6urD1ZitNEdTBt4AFefoVSUJcPx0Ek7Rg5fRtp2Wh/8B2xSF5Or7dDn9ygj
	KrgjtuhhySvcVrncEJbT46uTuy92ryOfFaFrlKd5OiwYDgrG9ezu0kzeuvNiqykrDCwdL
X-Received: by 2002:a17:90a:d603:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3ae5823f4eemr2777102a91.63.1793252683601;
        Wed, 28 Oct 2026 22:44:43 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:43 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v8 11/14] docs: describe virtio-sound capture options
Date: Thu, 29 Oct 2026 14:43:51 +0900
Message-ID: <20261029054354.2931-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

Document the five opt-in capture module parameters introduced by this
series. All default to false. Describe the startup-empty, short-payload,
packed-status and pause-restart compatibility behavior alongside staging,
and require validation with the target device.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f..6c7b1b3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@ Kernel parameters
 			brightness level.
 			default: 1
 
+	virtio_snd.capture_allow_empty= [HW,SOUND]
+			Retry a bounded number of empty startup capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,SOUND]
+			Accept non-empty, frame-aligned short capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,SOUND]
+			Read status immediately after the returned capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,SOUND]
+			Release and reprepare capture streams across pause.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_staging= [HW,SOUND]
+			Use request-owned buffers for capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
 	virtio_mmio.device=
 			[VMMIO] Memory mapped virtio (platform) device.
 

