Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792866090;
	b=UmZL/mSrmuro4vwmgJggvB6IiiXvW+re5EpbUpT+CdD9PC7jvrUyhzicp6lQG3jDC8X9
	 zc8zG4iqsmPtTzqCb4lGyhIzR8+iXbsSqKb72joKLfbuFSPeLVVTgfwkSF/Cmc5TC/GaV
	 RPTU3ul2FQnWyBWLxVU8iaVGYiLZMkHkwBCnWZWVJIt1VD3JbQ7yzlAt/GHCvF7yCXVWY
	 pHjbBpVbe9cghU5geHTpqMMeYuAdg0ql5onnFnbApYKng4EFZ2ulzg2/8+h6Ae2cY70EZ
	 HNwTdBH6yrRdV/Nyd96I8UGitiO9NDkBVQdeV8aBP44LHQc2V/XNwGp5Q75OfFtbfyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792866090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CrjR2yr02sD1WpQZ29SF1jsEFlUfRLoiaxFwmlPUrwk=;
	b=Cpe1f1u6bBnDfOA3fytFgLA6qVvn8g5xZV0TZVDkc6x/DQfUPNSmLg0RQVxI5aLuOrM9
	 EhbADs03DDfbwUQIMZSJbegaGQByw1YD9YOEMWMbykfZZIjBvo0et2SXxjQcBxhXC7+wN
	 nBjkxZ6jOZXqHHhaaebg46QKxABQ0rygEl3Up0f2UIzyg2kO43FC0XYoHU8x29A+fg3pr
	 gKxWge3gkWBhB8Hw1r8t6+nEFFSB0NPfFBwS500aehRGpr+fXE7Kb6EiiEF5PzdzW0N2K
	 q2XyGU1OUaMuDEtRQXnYb71vNr5eh361fqjObiBpGSdoUgwi0SrajqycDu4FMbtwq0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g4URQ+H7;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6CA606A326
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE6CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g4URQ+H7
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2202932c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792866089; x=1793470889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrjR2yr02sD1WpQZ29SF1jsEFlUfRLoiaxFwmlPUrwk=;
        b=g4URQ+H7F+BveIsuaNM4iDRcC4vAOwnINJwL4pvH0DAcYVoSi98Hu+7xvTNk2feTVo
         PEAqLTZgI8BDe+ZBa4cBlHR8Tn9+vdgT7t2QknjAEU2v8fdD6r7t10yUjJlHY/5PNuHl
         kPzDQXAf9pPV6aZEOWx7sj7faBw8wCLTDZ4dghALO+uUepoADfINxZn9o/ixwAdEpMhd
         Wp0cb4kUjPCSG673eIDRr6CAjUTkG+ONJdMjwZEjtC/JezxYBRDtzoex1XRr9qTZ1pm0
         Km/TuN2xOZTdfZnARQdoCP+bvAOcFY5ng4tquD15CRweYtT7LhYMwZqktcA/RshD3dSN
         pnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792866089; x=1793470889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrjR2yr02sD1WpQZ29SF1jsEFlUfRLoiaxFwmlPUrwk=;
        b=k5tsT6+6MVYshOf+CaADW6iltvoqMivBVdfCa5dObLX5Z8x9VxbzRTLJkPl0W+unAc
         Sz8C+tB9sI/vsQKB5o0/9hTasM49qU/wBXizrAOsNVgs8wf+GKH9NRooeIV20Snc6NIH
         MkwYyx2hQqh0h78SAfugfq8aI8fbvAQiATcIYLpqJFhnt12uz4/SUD+AoERMnXb14/uJ
         Fm0qirgCEFHFdFzCMzE29JHE2/AQUWIWJapykxBCrCy8UpyNIRh9G2UHvrJ+MQkYcPtc
         EUDzOTJY7+KgtE4s5XISs5zpLscoVqZYWuzJUAozEVaqTloV2r487qrJZGM/ZM32GpMS
         ZHvw==
X-Forwarded-Encrypted: i=1; AKwUvBwvYcfag9sU44Rof7J5U24cg2OB0HVuVYW8fO+e18NIOCICGat2aTARLz0zgY7Czetn7iMFyp7YJtcqJQg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9KmKfnNADmIhHnsnedITRRR87VYNe48B0+W7YzGdfexUntZCC
	O3rwm2U+fAQlYZuuHJlwfTfyA0YaXzZ2Hh77O12AuMyHBP3HlzlgzHmtE5UvyzNP
X-Gm-Gg: AYBFou0d5rLNpAVtVKWEykvIQIlr3rn50wZn8gZVZfmNm5hwvc69ZO5sMbqIg7BXEPq
	R+laupb/MQDw/8gDiXxl58pszMnovQce8kFi512mj9aRXVpUMA++8Qme+EmWeWmuoXDXct8vEYp
	zkuNJRMDbwKzr6K05tLXDKB+JUbPyNWWg8bsnYlfjyTkXgoxJ2DRM/pFTUiaySvKio7/5Q+fPyM
	VbM/esK+ldr1piFtvZf1CSWvvN2H2gd/+nzGVc5jcwKETo27rPcL7c5oS1/hP8HSFLK/YXTkLai
	yIMCGwcRAVfpTvO04+DEnJrILLtyk9UZg0X2i3f21O+938IJlzR0y406247XQMA6OSkURA8L8mE
	mWj7SvMZh7Miy77DZemrzcYUuXaJWTH2kV+sAtG0c2UuILm3gL8FnYmEw+KHBtpAwuhfd9vuNLu
	9BpCSdvLTVS7WNaSd2g6XRo7Ldc7fDU4qDwULKNihO39clRtMS5j+NWyFJTwOtEaUSUx4QSDYpo
	hy8tDdtjcVMchlmzk5mXAnTwHmXrX6Hn9BnfqXrZG8XmANkzPTlibOJFF7szXJrWPCPzEpUh+vm
	uGgVdL8=
X-Received: by 2002:a05:7022:2088:b0:148:722b:7cbc with SMTP id a92af1059eb24-1993505df6fmr3235936c88.14.1792866088809;
        Sat, 24 Oct 2026 11:21:28 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm8174893c88.21.2026.10.24.11.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 11:21:28 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net 1/2] net: dsa: mv88e6xxx: fix 88E6171 statistics snapshot
Date: Sat, 24 Oct 2026 11:21:23 -0700
Message-ID: <20261024182124.296988-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024182124.296988-1-f.fainelli@gmail.com>
References: <20261024182124.296988-1-f.fainelli@gmail.com>
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

The 88E6171 belongs to the 6351 family and takes the port number in the
low bits of the statistics operation register. The 6320 snapshot helper
instead encodes the port as (port + 1) << 5. On an EA4500, this causes
ethtool -S to return physical port 0's MIB counters for every user port.
Traffic on other ports does not update their reported hardware counters.

Before the snapshot operation was moved into the chip operations, only
the 6320 and 6352 families used the shifted encoding. The refactoring
incorrectly assigned that encoding to the 88E6171 as well.

Use the unshifted snapshot helper for the 88E6171. Tested on an EA4500:
pings through different switch ports now update only the corresponding
port's hardware counters.

Fixes: a605a0fe7115 ("net: dsa: mv88e6xxx: Abstract stats_snapshot into ops structure")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 7f68a0c55802..67daf3b9cb48 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -4610,7 +4610,7 @@ static const struct mv88e6xxx_ops mv88e6171_ops = {
 	.port_disable_pri_override = mv88e6xxx_port_disable_pri_override,
 	.port_get_cmode = mv88e6352_port_get_cmode,
 	.port_setup_message_port = mv88e6xxx_setup_message_port,
-	.stats_snapshot = mv88e6320_g1_stats_snapshot,
+	.stats_snapshot = mv88e6xxx_g1_stats_snapshot,
 	.stats_set_histogram = mv88e6095_g1_stats_set_histogram,
 	.stats_get_sset_count = mv88e6095_stats_get_sset_count,
 	.stats_get_strings = mv88e6095_stats_get_strings,
-- 
2.53.0

