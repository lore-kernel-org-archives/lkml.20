Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501970;
	b=tjk6rAJJqGbtL3qZ/CSDER0xIxRM3c6vfSfWvomv4WV6GfwPMEq8ilH1Vt6Y9gKLw0uj
	 Bd3MSVVhd7nHJXzZMd5IM3vjPP9e1vMZuv+z5gJk4SCDsX5MRJDOYUNf0H+EsQO+46Kol
	 qqf32XPAHhJzM17pko8eM7LaBEmBF08xaGEBwzQFzVyI7G4j/iVolZTnX45Z7oPZvmFrZ
	 8FY0LeMNeqGReNCtzRv/hWYMi/mOMP/2e71cTZM6V9KCWal6cNnEtTzK09a/fzTf6hoc0
	 hVavI8FzJcuQHv44eaP6yL0eE90lMfqHlDDnsrF8r+fOKa0yGSZfdHAhpqka2qtydyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yhQBP+6CMdb9Wj5EapIjlvPpI2vkMSvK5yEcWmZpYJA=;
	b=k0skB17z9FyowHbe3MrF1pBJ0vFtvoDY6XIdilO25cvFIsmxrbKhrdCUi/jTmo/Orcgb
	 sERlCFD6IZEBfWWZqGeSLy4FW9uqDSdWhTTIh4PppyDWCGFYwsdiCGfhUo0Z6fXrb6nzb
	 oLNlI62JTHr4qHJgIRMKqZGOKkuV4tVi2MY3bzat+7ToAxsyxcNLBb+UWK5311DFBVzeh
	 s1KNeslQTr+zVyBAVktyNDNfHxZap9TZxfT3iGgJxOENReQTRWEReMqgHRosXOS11yly4
	 6haRDxp2erQBakFEP3LzDj+SGYOIiiznqdLawa1LTQ/gSa5h9fsJHWQKlnte/1mjstw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oikBrh3D;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63688606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63688606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oikBrh3D
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-170135e43c7so3283667c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501969; x=1795106769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhQBP+6CMdb9Wj5EapIjlvPpI2vkMSvK5yEcWmZpYJA=;
        b=oikBrh3DDBEvzfKdV6/bIVo/GToFgXf60OtSMB//nPGJfNUxVYF6twGnSDk8Jw+p4Y
         N4UWe//VCevNUdVxGiWOCDq7PyVkmV6YZ1EFMYmAej1TNr2hYMVdAWZaAeFCyuOdwEtK
         zw6E/HfCYHFhMts/U2U/sPVZ4iciyt3U/jXkc+yZ9TzQOV8WQ7cSbBuL98CoQUpoIiSw
         lzcPkv05JY5uBlmQLmGS/bhczlLtXjts4DUH8wCJ29qUI7tqJkgl2Zh01gJze+jWeT0L
         CoD7uQnsNzrVnaU7zH7RHecqk3PeLgjcfrQGVpllxmRzAxiVlNqkY1MEX0o1pBt+EXjm
         msOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501969; x=1795106769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhQBP+6CMdb9Wj5EapIjlvPpI2vkMSvK5yEcWmZpYJA=;
        b=emGs8Jnnp9x/JQMyBo4676nD++Zl0Cxd0p28ucVUBBE051GV+SSl2ntnEeo04aHmfL
         RTOcgBjqYWNG599EjRSA4wiwBYM1mw/CT2T1I2mCKexGNYHrktf/1BcOqLv9xl+oNYhD
         /XlRWH5F3qAWFR5cyIFSTd//3H7yYDlCjWfn0fpiUYtCa3/PLy7Pz2yHMkKQbL6mPH+e
         583Z/1nSGrumJ0wE+Ih8vUhJK8tPtQp0mz6xBsR8TIaCXBbYN0poHRqSkYBNYmWGhu/D
         uRYxTV6i/4GMmaPYOCtoslTQRR2PPZkHNtfux/6k96rzbtfk8mLfoYpgYhSRnKqnb0gj
         NyRA==
X-Forwarded-Encrypted: i=1; AL+hErG6t6yqmwyn1ZioSfaJI9NAR5UOjb/iPr6mmU4CH9eOQeFJyiw+p9kOQusB8GQKivOlLsf14fvdS0txhTc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+otiud0NrauPRsKSQzm5Z/ubzb4SPamdbfpZKMbdy5UwUsWWCS
	IpE6lwEIeujEfBazAZ+cxRkjWiM+rw1XREOJ31EsZRtvvzdrXR4B+eiX
X-Gm-Gg: AYBFou35VujQ+fEHucBm0hA+1RuWIG5eTdFO1YQBDzakXbwZASkQTgVHAMJhzCIBwZ+
	Px8pMdBi+EN6s+41wCQRGYaBbedT/KhYH9Efh5xaxezsTFJq7J4jxLzgkxDPflR6FSDL6ja9ppm
	6ofCBVuhus3+DkSS329IaifUoeEaXFbJdHYaLk85T8GGRIQ1t7P1hhs5j2826CoOUZBl43sC/pQ
	EZSKbJt0PRFyM+75iq5AFUrHaxyleVavfS3dp2B/FDLVJ6RKjWUIIm5kW+ivgPaHu9cRNbaa7fi
	nf5dmHjqzQuRdQXrklWa856Vog7IRPJGT1Bqon58MxwGInaAj3WIsWmkuLx981svQvM06sxCScz
	ywQQ1KzMBIyvbNUrvWS+m/0Jjfm4rA5rRo/LqURAr2x3hlhApyJVbvbCGYFlD8JrNo9vw90Fy/9
	iLSURqsNjSlL3/AV46vP1OvGu52Qm8h9d3EXV5Bpmy5U6X2js8fGythyaWYLVZJm0RtjgMExxJT
	bCcrlElp61JodEmehAfdDfiSy0IsW7hl/yZRTyXWT5YJMA4YgFLs/TZPcJAvQo0QQOkxpZfenWV
	m1Wji7sg4jD6XitUeJXub5BfjB2qEWhwZetOx9aTngLQUDAKSHiMNCTyWEX9uOMQHrYNyEV9pYy
	mPjcpiCzrxcjfklJ1exg+8yAA8jzQwzGbGCMvtJpPsxd3
X-Received: by 2002:a05:7022:2513:b0:1ab:faad:cc9 with SMTP id a92af1059eb24-1b503115806mr156032c88.11.1794501969159;
        Thu, 12 Nov 2026 08:46:09 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm287090c88.0.2026.11.12.08.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:46:08 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH wireless-next v3 1/7] wifi: rt2x00: start the link tuner when an interface is added
Date: Fri, 13 Nov 2026 00:45:35 +0800
Message-ID: <20261112164544.3176458-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112164544.3176458-1-hjf3108@gmail.com>
References: <20261112164544.3176458-1-hjf3108@gmail.com>
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

rt2x00lib_start() enables the radio before mac80211 adds the first
interface, so rt2x00link_start_tuner(), called from
rt2x00lib_enable_radio(), finds no station or AP interface and returns.

Start the link tuner again when the first interface is added, and stop
it when the last interface is removed.

Fixes: d96324703ffa ("rt2x00: merge agc and vco works with link tuner")
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
---
 drivers/net/wireless/ralink/rt2x00/rt2x00mac.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c b/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
index 3bc0c1c906..86547ce81c 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
@@ -264,6 +264,13 @@ int rt2x00mac_add_interface(struct ieee80211_hw *hw,
 	 */
 	rt2x00dev->packet_filter = 0;
 
+	/*
+	 * Start the link tuner again if the radio is enabled before the
+	 * first interface is added.
+	 */
+	if (rt2x00dev->intf_ap_count + rt2x00dev->intf_sta_count == 1)
+		rt2x00link_start_tuner(rt2x00dev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(rt2x00mac_add_interface);
@@ -289,6 +296,12 @@ void rt2x00mac_remove_interface(struct ieee80211_hw *hw,
 	else
 		rt2x00dev->intf_sta_count--;
 
+	/*
+	 * Stop the link tuner when the last interface is removed.
+	 */
+	if (!rt2x00dev->intf_ap_count && !rt2x00dev->intf_sta_count)
+		rt2x00link_stop_tuner(rt2x00dev);
+
 	/*
 	 * Release beacon entry so it is available for
 	 * new interfaces again.
-- 
2.53.0

