Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986029;
	b=Bu321XO9isfL8463RGcN/3XseyxRwzbzW+ZK9C00Oetk4CbURVsFzXI67IIHGjNVIuaC
	 aAUV8erAefqyiz+v9wz6NrbFOKqhRyi/NUhbWt87A/OA/wUc6heU+sX6KHqx6LlXtamXz
	 tCxpy6KZPsKXPmY4xLQOo0l9Gw4vYH3hAM+z0v7ZKnIPLLJDSe+F3VlSLKh836UflRmdN
	 RqRERbTltV2mxwezx5+M0D8DB4fGLGDODPQ6+n2cMC/QPzUDqlMYjLgL/xja67rWIfiQW
	 iB7XMXIvL8+LUvzUNzF4+xCacBMqkq0fZoR7ICUMrNjddNMtjNI5VZsJ132SsNk5tvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/6IeFAN+Brr4IgsKEaQkEmx9klkMrgiyQtFnXr2iOyk=;
	b=5ZPO1juV1d5MZUXGwVR+ke0/NPK8lI+GE0vZV1vti4nhbCH3zFTR5u4nIAyt0mpUmuFf
	 TgeqW2wDuTvQJpIvbRAI3KpxO7R/bo9wnuLoXq9gRUE2FBw4Sq0O0m2k7G42SNIZVRTcF
	 Zu0qMu7zlyddYJMpGYkOzTh3ABdBf2LGohzCvBMYdbT7UjVSPD7MptKqROYnp3d/WINGg
	 w10YZmS8wYGuyBBD1qkUH5+ENZ9tMeAXji/721CEzXlgWV9HIrQGJ7IKwelNBIqTKBAek
	 KZEqpQJpBkkqJQWwIU3vIJbb1k4C3+TFb5Kiq8OVjyKandLWlvlQoYJtfog/2AzY1NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7toEAbf;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF07606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF07606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7toEAbf
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae58d17cd9so427092c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986028; x=1794590828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6IeFAN+Brr4IgsKEaQkEmx9klkMrgiyQtFnXr2iOyk=;
        b=n7toEAbfrt1WTfLvOvfykcULME3/FdB0VY+ntYbJKJGgUWe+tqywnlfsOreRP/nX6f
         Pg29nKei466dkdDcFAMVdpBmDQly4UbQBQR6I7JtCeZWv7tdQ1uef1PsBUnGsTg8AXo7
         dTPLSf0MfKFqra2oIe9E0SBZrGPceA/3J7E/SQjFD3VksxKPHPs9P7stGSZ4xLbP7yf1
         Q0sVxUSQ9aQbOJUazxhj/mB6y5EpCORBwgKiO2yFAhfNDKxIm3xyQvRni/LoBFxkVZ+i
         NjhAq4e+f23o9E88jSIJHoH5TAWYcJLsGXxfqSdZ1I+vsY4Aokdy8sF5WeV60i0JmO3g
         OYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986028; x=1794590828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6IeFAN+Brr4IgsKEaQkEmx9klkMrgiyQtFnXr2iOyk=;
        b=xK6hDkWVbU6oVY6eX7nS+GumnI7aoaLrEImREfOsrZuAQQlZTu1GSOI9rYxfZ2PSvv
         boE0/wSGGkgdfj1YgmgWqLVuqIej4w4y9kXR8QUMC6qSt3L5NHuVhmsom6FpNAbeQjzO
         tiYj8E2+PyZx+neAszjmBefdCpaj8q3OqvsNKWvJvjBV7cyeTRszfn7eBUwoQN9bBCnl
         mEoI3WHdWPJpopPjNIUMWf5YVA0TOwQzN/9g141oX9gt4wx7PR04LreF4VsyyvhDse4W
         7nq1GTxRcTVb2Lw4w00QCwaw0tKWEjR5gZvyrVoA69sUHSPSx16Y/RHVoh6Y3/gwR9T8
         rTJg==
X-Gm-Message-State: APuU4Z81B2LET8HrOT3qjHJOf32Scc0v+0C06vPWIFSQY66VTpLYvcXV
	FtWPMRV6L8jVLBkGEslS3/BCgcimLI7BC3kSZSLQl5jbCXMBO4Ibux55
X-Gm-Gg: AYBFou22x5RkYLU1FUWcha6Mz392vuOmtzIcTDdDnZr3YU0POXTM3quHSdauQfFvhkO
	iJSQ4TmKcrSo5mGOzULhK4FveTO4MLJB+a4h8Of8cCFwURZtr6ovIN0pDG3qRCuNu1SYxHz8C6z
	BU/4PP3BHADaMUxtAlo37x3avFY7xbxcy2tYX5OyWfq/6vx5nD+TSyLxhuUUIHlD+5aQZSz8EAN
	mBwGKXnt6yBtRfp/YDmMRs/JzuByWkLDfjeMEbmCaf+zcKw98UOs97DQS6xyBPsyVthum/STU9Y
	ivb+0Z8hdhU86YCRNxF1JNmiaHATY7+iX5a/QhlCBWzHDAvBK6Um6vutNEvmY+T1N+hYbhSiC8m
	9dmsezYaagYbd6WndyUbI1l2VkW2rLn6C/rM2R6ZkR8ZhpCM+Goht8oNjNcJ4KiBd2vpdj/PuxJ
	cueNvSxHSI+M5q2EOeMwni69QcE1/B18HnX9UMk3OBtdy9BZfiZqcwCuKMH6n5DHXZEeP8DZM2r
	V4Qn+9j3e9gNUZSNSUJpkiOo6kbaJvW/sb4Awzw2QTKb2dNn7rJdMYP0poaFCiG+x5r3zhNta4J
	KNZYnLnoIAGeEICoNxdG6rO6E9TqkOJj84JK8HLKtcsC8RKS0L3P
X-Received: by 2002:a05:701b:418f:10b0:1ae:59d6:91d7 with SMTP id a92af1059eb24-1b25d3992c8mr3772225c88.40.1793986027564;
        Fri, 06 Nov 2026 09:27:07 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b26294289dsm7199997c88.4.2026.11.06.09.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:27:07 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: control: Trim whitespace from sysfs input
Date: Fri,  6 Nov 2026 17:26:25 +0000
Message-ID: <20261106172625.4622-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106165531.4074-1-sreekuttan2156239@gmail.com>
References: <20261106165531.4074-1-sreekuttan2156239@gmail.com>
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

The attach and detach sysfs interfaces receive input from
userspace.

When userspace writes a value using echo, the input normally
ends with a newline character.

The parser does not remove this newline in all input formats.
For example, a bare numeric ID can be treated as a control name,
and an unquoted name= field can include the newline.

Trim leading and trailing whitespace before parsing the input.

This keeps spaces inside mixer control names unchanged.

Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add the Fixes trailer.

 sound/core/control_led.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..a640e7835ce2 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -518,6 +518,11 @@ static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, si
 
 	if (strscpy(buf2, buf, sizeof(buf2)) < 0)
 		return -E2BIG;
+
+	s = strim(buf2);
+	if (s != buf2)
+		memmove(buf2, s, strlen(s) + 1);
+
 	memset(&id, 0, sizeof(id));
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	s = buf2;
-- 
2.55.0

