Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C25A46A5E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298959; cv=none; b=ePnqXcORW9yGzlEtpQ+6+QxMoTJGMkQ8E7NBl89b0IK1SpCzuWTkgP1sqfms5Mtwc0+iy5wAQkBf7sYr83hEe+dgFAnHcghU3AkUtkKxxAmLgZt/dosYlB1/EETiC9Sv67NNsqSo9tMI6MY2KBMRv43Pzsqn6nyNf6kxw/zTiLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298959; c=relaxed/simple;
	bh=SsUQNTNv6kHN9VELJ592cUs8KSzWhnVlCcfgO3cKqSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RN6/00MsvcON/2hhWFFEjN/sKByi2sIYv/kLHR/r/hlBgIvTu1t3n1/03PtpaHbJlGCjdQSjZR+kutyWvdwlfOJRHInU8KK9LELVW2PRR6XYRoNm+QxUCoE89cKqb6szCr3mwdDy3e3TrGAWPBcp82BmTCanV7QKCv2vZhh7jiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjOgPHSA; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjOgPHSA"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b128dd0cb1so219504eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788298957; x=1788903757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m99J5Fi/T1zvsWEGoRtP+MygE1A2m2xBlRSpWOmMB6k=;
        b=QjOgPHSAtD0gdtxOt8CTOEoGunby68CWn935jT727UDFh5lGnilBC6Xr6UQxPlR/tJ
         w/xPSiUzRpFziXhWc2YqTqBxTN/2SgOXNduCPfc1153zZyW67i/iE85wQeQAWtpy4HJ6
         NFfPAB3SlnrUgbbYJ1qFOmQ+BDfYwz6drJnEkALPBWgylfucGA7qPk5QJ/VEv1APLZda
         JtKIzfb6eYYvqChLViHiXoCCWu8zEpxRDc1pGGggOXJTA6ikB5od6vKMF8Lk16TeDz4i
         CYE+aSB8KZH41qoxtTywAxVL5JANwmgqq155e53o3whrhsvHipV6JJnytja5oVzFZpaY
         bkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298957; x=1788903757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m99J5Fi/T1zvsWEGoRtP+MygE1A2m2xBlRSpWOmMB6k=;
        b=MF/jujRTHa1U+uAUopTgFGddVmtyX4SaxHguohdpnoLdni6xbr5oNYhZjUlVaeSCfx
         7K4YO/xvpN8t3HFfZ8ZmELCKII9RIzVYvEC3gapdU3G3gcWlcobuA9IGZBdOhcfJoO4G
         qMNsHfrs7ZwmnkqnjeIvvWvwm+Ty51i9loFRjG9MIAw+6RZPXo2Fv68Xy69MMSrOpylo
         KvHiMB7aBX6LPL44sIpgXl5bVgOz6MLnyMMgKr0iK6vt1eTXJSixwsVQC3QUCMPfxj+o
         mrf3k1x4ys7l7BrEcu4RX6vbmAOk0np8ammqJz1YbYXC52lyAOgqD/9maHRUAHVg093M
         CeYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVoHAiDFzUViDQiSTzNkenBBr7yV0CKuyizmX+frTKDXJFN8Dz3/eXJ0vVR2xKbg2fm3u5oFLtFaFdeNs=@vger.kernel.org
X-Gm-Message-State: AFuF++mwFSMtK3qsaqDjmhQqCHU8dQztYFIqJHHfjfk4dKvcfoSJTvFc
	aV4wZHHcNF0VaVZ7u0aCTk8045EgkjFRGj1H7+waupcH+9LOuGHUWbmH
X-Gm-Gg: AR+sD10IsqlceKzbW+J9WgGLr/u+7nGyb502jlAALuI1WjjSaZWNUxqKm86wqwkwgxF
	/zWowwDxul8uXp7UZBuBVTG8WMZhD9DavUDEFxVcwCpxeGsv9WfoDNpJBTWD5zkkcCgCXFWhFuI
	wuHh/x52hWb/jsXL5/fDbf1qBmOvXGts8eI8emMCSfNrAd9nj5L8oo72NSOLmvfhSpPsbWrN8VV
	nT4ChrvFdjByDJP16jF4wPKyMi7Om3Erl06AN8e/arUabkbhPY4f66wYBmy+qLDhEEUAmKCXAUX
	PVkDpJVnWAR37xoIGoFMmaFjssqlnW4HNqNr6fRynpXc20zickmbZ1E0Utsei9cEtNuI+6ykpi/
	51QOQqYJICegJGmIEcbsWo+yhOCtp/PAHjhBajMog3zOyAbuogte96jC/z430+lPF01dCW9GTHa
	/VTfzyMzgYeQyYFPpkuIZ72YJr58PZkybA6ugK1+xxJX05u/XbQuXsbwEembNdM0f4W+efH4zsg
	X2ZJ0QHaz4A4vg/NIHHUPhbqHuFJf+FBu0ocDrbNUMsNtHmcVL7UUn3qyV6Niu5S7T8pTOkFcwK
	ctnONSB7A9nCW5JEwekHU1HxHON/CK2aIN99Nl00JRKdWw==
X-Received: by 2002:a4a:d749:0:b0:6ae:6484:5f40 with SMTP id 006d021491bc7-6b1c673d01emr27846776eaf.21.1788298956904;
        Tue, 01 Sep 2026 14:42:36 -0700 (PDT)
Received: from [127.0.1.1] (140-186-136-19-dynamic.midco.net. [140.186.136.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40ba648f6sm1094703eaf.2.2026.09.01.14.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:42:36 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
Date: Tue, 01 Sep 2026 16:42:23 -0500
Subject: [PATCH 3/3] arm: dts: ti: Enable overlays for BeagleBone Black
 RevD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-v7-3-rc1-beaglebone-black-revd-v1-3-f521950b777a@gmail.com>
References: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
In-Reply-To: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Ayush Singh <ayush@beagleboard.org>, 
 Robert Nelson <robertcnelson@gmail.com>
X-Mailer: b4 0.15.2

Allow overlays to be applied to am335x BeagleBone Black RevD.

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
---
 arch/arm/boot/dts/ti/omap/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index 55cab3e8a05c..62de820c9b2a 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -190,6 +190,7 @@ dtb-$(CONFIG_SOC_TI81XX) += \
 # Enable support for device-tree overlays
 DTC_FLAGS_am335x-bone += -@
 DTC_FLAGS_am335x-boneblack += -@
+DTC_FLAGS_am335x-boneblack-revd += -@
 DTC_FLAGS_am335x-boneblack-wireless += -@
 DTC_FLAGS_am335x-bonegreen += -@
 DTC_FLAGS_am335x-bonegreen-wireless += -@

-- 
2.55.0

