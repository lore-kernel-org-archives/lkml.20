Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506632;
	b=vUxAYLQZARYkI2dyMp5q9xuEuhNAQbteKMyGEWEhRB9u1h30tVgm2cigxKGklvcZoxe5
	 ZZ8W4fi4hjaA2cbUBBHTBUbuhUY4t8ggBGWTnWQ/tUHJtrQIIEnHLOLObgky3sVdDJN4e
	 8MC8eWIiFrYFFuIg3iuyi6x+9ntbLcGEGudADvkB9nByrOfHiH7sSVh+UxWaInazU1mZ/
	 y4wVJJ0z0DJSYMhRsB0RdwAmSyGktJvG0Ae/dOjZ5vvH7uP6a+hn3hRQ3GqMe72Qi+3Eo
	 onBQQy9RURbfyADZGOFVth6qyOdG0PYlNUR4EXJqQRM92n113ciavbhqTtbo8uTqU7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506632;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=wh0SeQdNWzsZyoJ4vl/0g4hHaNPzl6qxcqRd7BCWar8=;
	b=AG1ucUCO+ci4MRxxSFQ1aYcYx1rTEjkhzB84rQqeOu670YOBF9isG5iUqXbSpnj88hhf
	 JRuho4154t6cZYZbxlV/K14gaeB5rnI/U3xnG5Q/ktCaStTG6wuVfYwN6xx1S0rTt82ne
	 RRhKZXYNhCiGHn5iZfJHgdeXQ+nkJQhdiDdHIqxESSS8k2vUpVk5X0WtObtlJ3NySvrOi
	 Ca9LY85q4F6Sv9BHtR2Ro0IOBzwbDhKcz2QdYPsWRVYYk7FeKQxp1HdBABKvPLAiY/0Nz
	 N+j7IyAHcfRnnOIRTfHJtOO3+qRZ2AqnKP4Mu51DORjyYN48uF4DClVXpukhQ0rMDWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="g8/zVgfA";
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3608606A89D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3608606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g8/zVgfA
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2edd50e36f2so551185ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506631; x=1795111431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wh0SeQdNWzsZyoJ4vl/0g4hHaNPzl6qxcqRd7BCWar8=;
        b=zSu/aVh8/nl0UwlgcGbqVNw7J160AfxwIR54/tycrFYsIrz/A+7OXhHEE/ZX7UCJEt
         h+9p5EZ0SiapvOGC6pr3dcx+rvaYOJM7QfKnCTFKDjt1Auhyrc9uA0gCf0Xz2EKeSaDp
         fA2LyH9RuYo1YtNmc9RQ6b6MSIdYmzW1NiLFQfOhYLmWX1NFD3uSOVJRy4uBNr2mioPe
         wT+pshi9nDYiFEIAsHXjP/vLmh+kzBs6x9SfPUCfeEMLqYPVBNAY1vUIGAR8ZwNb48dV
         l4Kn4rneNNNRrLlh79jvOr0/X57Mcw/Lxu7A//+eDwJSAe/Zk5cowmJXJxUUma6i1k2b
         g3EA==
X-Forwarded-Encrypted: i=1; AL+hErFjPO+gmNap2esbxCvD8MTf194wyjxiIYpBhstIkSwFYoWLNfg/y638tz9WWo1uPe8n2UdMPy2fy4oaaSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VKdRb+V9IjD28CvFmD0NowMHaOm9EAZyyQLxQM5Q2YRvcQF7E
	NSKMxMkwRwPxdVGQHD41gbyOdir9pi/l3szdkoumL5GM/0fI2CV5O3u7LWVM4raqkNDEPeUUUC5
	coHw73M9JCOcqouF5E4j9yrgLoZwKObZqfICFw0tcybRCLGNDXDhqzEXRKy5d3LP/QeIxglP62V
	3k8h10lBmZnQ4fIxsmDqszhHNM2K2bt3nCDuvIupBy5I3i0py6YD+/ymSjUq+z/Gh0+92YCkd3o
	irXZ4GpT2etOBJeyxsW42mJ
X-Gm-Gg: AYBFou14wTWamYqJFDCZy2YHi6BmwpAVedkI5QoYDYyJEOlAgOnxpELumBUaINr4MXz
	e4kKZbCG4rkr8Iav+POHnY996LJsEFqMhOA/x0MsQdKA67WT8RiF6jkJcgf5hpiFW9uEw0oMTXF
	xpBjNpUNW5mD7/AyzsuL9pQgjGt6/WsFtBFNYfhsyH8EsmN31pGZp1JGenrPks8pqE4BDZ6KHtz
	d/tWMmtCqZR9N+7lH4lBDLW1Kze6ihc+KPO/DHaogJuhDIpn7xrAY7qDtaNJbmhc70HoLogtw0E
	kuz1C7KCFB5BdLqK/Q5CJrZf8r6xS3M41H+vwFKrzbD6OR+XQuRMFiv8blsEGn2Fag3s0jo6t1/
	eOt9BNSulh5WPqNcFKW/gKxZv3gCMVqZ/Zoc/QhW2Bmi4KB/2S9D/LdMSRfhS7gCAgr51kgIxr2
	p9xJk/SQyZ63ivZ4wGzt+sHrdeyd13dgLhrrP1l0Vo
X-Received: by 2002:a17:902:ebcd:b0:2df:8382:918b with SMTP id d9443c01a7336-2ee0d54b0ddmr1807095ad.0.1794506630826;
        Thu, 12 Nov 2026 10:03:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2edb62e8610sm2350215ad.5.2026.11.12.10.03.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:03:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd652c0385bso75051a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794506628; x=1795111428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wh0SeQdNWzsZyoJ4vl/0g4hHaNPzl6qxcqRd7BCWar8=;
        b=g8/zVgfAu/jBC/XooHrOpDYMfG6DnWh+cJ4aXNdmeuzII6718IICtvDwF7SDvx9jFL
         qMVNN/5gn5nuZdQ5qrWTbRRkMyLwTQwGBdIXzPYtcDNjEL3Yb0LqemIXyX80BsJBANU9
         P8or8LF7u73YEhHBd5UqrfcA58ticfqkJB9QU=
X-Forwarded-Encrypted: i=1; AL+hErERJ9YGFg03+QwRy+mvLhUrbKUn+/IhgEjMi3LscY49VqGaLtaS4Qczs3beYT8aNLPG7glWEeWd1DtYAFU=@vger.kernel.org
X-Received: by 2002:a05:6a21:1643:b0:3e2:e341:8a55 with SMTP id adf61e73a8af0-3f2fede7567mr6551604637.71.1794506628465;
        Thu, 12 Nov 2026 10:03:48 -0800 (PST)
X-Received: by 2002:a05:6a21:1643:b0:3e2:e341:8a55 with SMTP id adf61e73a8af0-3f2fede7567mr6551575637.71.1794506628033;
        Thu, 12 Nov 2026 10:03:48 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18abc06sm95004a12.22.2026.11.12.10.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:03:47 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v5 2/8] net: dsa: b53: fix the SRAB grant timeout check
Date: Thu, 12 Nov 2026 10:01:56 -0800
Message-ID: <20261112180202.324504-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112180202.324504-1-florian.fainelli@broadcom.com>
References: <20261112180202.324504-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

b53_srab_request_grant() polls for a grant up to 20 times, but checks for
an iteration count of five to detect a timeout. This rejects a grant
received on the sixth poll and reports success when all 20 polls finish
without a grant. The latter allows a register access to proceed without
ownership of the switch resources.

Check for exhaustion of all 20 iterations instead.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_srab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index 83a03fca142a..f4689078ccd5 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -105,7 +105,7 @@ static int b53_srab_request_grant(struct b53_device *dev)
 			break;
 		usleep_range(10, 100);
 	}
-	if (WARN_ON(i == 5))
+	if (WARN_ON(i == 20))
 		return -EIO;
 
 	return 0;
-- 
2.53.0

