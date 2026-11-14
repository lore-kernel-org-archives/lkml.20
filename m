Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637615;
	b=NfMVhB6EYlaqHzax90ufMsNoZFJW0Y6eccDTKVjmrE0wZmlpIYao5ZaBHMgIa/ivNMcl
	 t43OiudUlzUgdAQJVHL4XsI2r6t2j4cKWSsAcEK6rQihJ/QkRQn7UMGZmEXCtTHHedOki
	 XsUArf71vLR5sseL2dz0WrLnTCokO2frGIR0H8NO01YxL0C24fCdBqB6e1Z0T4D2qtNwO
	 HWp8wFLR2dLXN4SRdWEIlRaoGzViJw3NJ7P2/XfFMDAMqXJJB40GYJpgdRB1DMvYnJjR6
	 AvSMxW9FPDtEDvVNayJPz71tfS1EldVtUY9lkuNZ3dN9Vc+atTO67rBm9UfA3JeuWTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bxBLjEs863AOQJyjFQT8wZX0uAHa+N/y/eBxALEdB90=;
	b=pzwV3zpBwlQu5RKHyt1x+6//++KBgICsQfuJH4V0v0ojoEb8kuhJugC934vQ50XAwwZN
	 axNi6k5QBL5so+fGOoEusNUr7V6eFQBKhUTr/QxyqQFEcGLbWScSqtY3eZyxjHpEUOywP
	 zYnjOjytEG82V4gwsd0WAk+x8cbGLCAnzAH5JITMQY9j3AhiCqaRCjNJotM8LtzgDfWEM
	 87riwiWHm9sPb7mqqUv9SvqvzIAiP9mjmyNn6IvrDU/+qMNwSrCKSgmDNovwGqvlnDJ3R
	 8H6oj5HeBfhjqsOo+cH+rW/33nQI5mXmQccJqmbxYT+0DZeR166gdNqzwX4D7GnVf3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VLHfSk5r;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27486606A88C
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27486606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VLHfSk5r
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so1394974a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637614; x=1795242414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bxBLjEs863AOQJyjFQT8wZX0uAHa+N/y/eBxALEdB90=;
        b=VLHfSk5r3zezAWag9cJkqsAK8egkEX2cdFSYA/LZTrWyWnEMcQdNqXtbzbPQq/cBFh
         FiMIdIhp+WBAxCTJikQGiUAFYcUCK5fVM0DFuKknI5KI8Ch1l4OytOo11HmKqW6T9+dD
         SSzefxz5zBO4CVsOSGjGP7Cgx5QOwhFZca6nC6yejBc1XgPIMpdfR/UYE4/HWnsD6HSs
         dhUYaPX71/dZTwCrc38YyoCQbFUvQNwFzRdYR6TbtRch2qX9qGjEJI+5veMb8BEAI+zF
         6DcCuiwcbYnW5FVcMf02tG6AZoR4ZxJCyUpNuZv1lYDbkTCTO4Ja1dsW/5za7SsPuNdo
         mGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637614; x=1795242414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxBLjEs863AOQJyjFQT8wZX0uAHa+N/y/eBxALEdB90=;
        b=yPMGi6/hbpbxnCVI1COYBLOXkBHeSea5q5WP8yA2jmd+2UWv8XiKMvGnce0lQxKcEi
         mlZpMy2OaiiGL7jorNWHtl87fFVPIIGZcJd0P8ZOhvsCKjhfMaLyJU49bCjCNTJP6Kps
         dzyaeehNm0ZBK0MNltRThjFE0kCL+Z5DaVOH2QqsDRWKgx6yDmeWeMhXqRzxC3yPwtaO
         sM3c2sYg25JsMQhnwr14b++UeMQdC08e01JHD7h23L77YfOvAsza51Hbf/D4tw0BjeUy
         HPBwjkt/CPkiBrdCBagH8LdiqofJajABQ5/1VKNo6AEey7zSpkC6BDXBqTZOmZdGC3K/
         SF/Q==
X-Forwarded-Encrypted: i=1; AL+hErHdmHSugsLi6TeyhS1kmio42J2bvlZ04mn07BJ8/DClfIKryxsmYlrV+LmbSYopYrVUxrPEk+Zlj0Pj6QU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mEiH9Cw9hvAonVD00HoHwGklQJ0NJ18bqdzXwkXK9Xwtw3n0g
	SeBXQdu2wB29L49La52a76NoWRf0+i9IV75/pRDJL+RVKn29NZVy7p+I
X-Gm-Gg: AYBFou37UGFtDCQd0dNPTXEewkA1h6z7ruQjljFJFj89vo0h9vVv+RSXJ3+hKCPvJGr
	Ju4AuzPrWE494cz6LCnVLYf8jfvl5+QgFonwIeOgFC7zGTnkDzsA4HWQ5VXkASD1O2KpT3nKTAI
	M6GgItGKZubcENkCsMzS2qvEiqseApnATzcaR84cnW7ks5PL5dF2DD9eOQggn/8tonjN4C5/pKY
	seRxzAm7YmlmaC14+Q2s1v8a4j4csRDxwfGKA1BwQTCYI5H/YsUUX8y5En7tcGqBGrsM6/eKu0Y
	HTirktBHPFHFQQEEiNuUt4tCe5BtBJzqX2ZPVjl+D2qaBsmblV5vtrC9vp1uFEX1OaLh95GQf8g
	eakZjEkETMGkaiadftpobYaG3jVXSoM2LOs4Sr2rYh0Dr1fPMMVVy6+8+5Bxo4JKgx0GtTLAptG
	GQ9WW8v9gWPccIJJaeD/sJcI6ZVTBekA8NbSwRrhhDQJTmcqiI2uy/2dkf8SrJ8NwhtcuRtEUkr
	9gJqz6+kJjlQ7lpG2yxDYXjf62ux0HlldLhFn76I+T7rneQ0ZOxK6EQl6MgTDDyBdsrzAtnXNlK
	TWveHMfH7Sj9hFXxjeX/vd6rtkBw3IhH5RRoQxJAi+XJ2/mSahoZ2TiKUnfL0ULDmG7T2Ca8V9U
	db75C91sV5o2m2MpluK9D5ceSqqAZeHOYLN2ZOLXL1s5wNP6G5l9DOcE6EnlLXclgg8ilh2zysH
	eZ0g==
X-Received: by 2002:a17:90b:1d03:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b1b0b4cdf7mr4172862a91.42.1794637614509;
        Fri, 13 Nov 2026 22:26:54 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197b76ccesm12817446a91.0.2026.11.13.22.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:26:54 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Lyndon Sanche <lsanche@lyndeno.ca>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-pc: Read the AAC mode from cbRes3
Date: Fri, 13 Nov 2026 22:26:46 -0800
Message-ID: <4fa7525f8f8d4c85aff4ee7320e5b5a86e79cda8.1794633180.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

thermal_set_mode() keeps the current Active Acoustic Controller (AAC)
mode when changing the thermal mode, by reading it back with
thermal_get_acc_mode() and passing it in byte 1 of cbArg2. As
documented at the top of the driver, and as libsmbios'
smbios-thermal-ctl implements it, the current AAC mode is byte 2 of
cbRes3, which is output[2]. thermal_get_acc_mode() reads output[3]
(cbRes4) instead, so every profile change, including the one done at
probe to sync the mode, writes back an AAC mode taken from the wrong
register.

Read it from output[2].

Fixes: 996ad4129810 ("platform/x86: dell-pc: Implement platform_profile")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
Developed with the help of an AI coding assistant (Claude Opus 5.5),
which found the issue and drafted the fix; I reviewed it and am
responsible for it. Builds cleanly with W=1.
Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules: switching between all four platform profiles works.
I did not independently verify the AAC value read back.

 drivers/platform/x86/dell/dell-pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86/dell/dell-pc.c
index becdd9aaef29..3b2089e5cf6c 100644
--- a/drivers/platform/x86/dell/dell-pc.c
+++ b/drivers/platform/x86/dell/dell-pc.c
@@ -162,7 +162,7 @@ static int thermal_get_acc_mode(int *acc_mode)
 	ret = dell_send_request(&buffer, CLASS_INFO, SELECT_THERMAL_MANAGEMENT);
 	if (ret)
 		return ret;
-	*acc_mode = FIELD_GET(DELL_ACC_GET_FIELD, buffer.output[3]);
+	*acc_mode = FIELD_GET(DELL_ACC_GET_FIELD, buffer.output[2]);
 	return 0;
 }
 

base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0

