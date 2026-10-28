Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194436;
	b=GEefhWREIY28pF5gZonDlQ8rM5XHOSR/Ghe8a/IFjF0L+GcZx6J488WDHqEvUQ95qyIv
	 sksqAwbnmx/j2GXzzt8elNzeA1Wq4wAJJvNxDA8K7E8IUzu4FwStjSxWml0URnUGmmSMx
	 R6cpgE222VNioSqOOjGoXP6uzXQxKBpUeqosV/zxSh57w+pHSTFcR8AqFnDi1TZNIFj2B
	 OgK2pH1no+4ePUNrRTkMh+SrfXM8NOKZsTtCiT9DYrBja5m5O2VmMDiSdtfJQ0YfT0rCV
	 S0564WwZVq00lDJNNrLHCS2x8cPSyU4aM2bvCVz9Mtq/4/NVkwTcZqtlO/OFsnjxlTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mHBWVyhcqxaC5vumFhxxpKEuhD3213M1GsePKvUPh1Q=;
	b=yavbcQzY6NK18QGgvD57hksJyeXg4iHE5K6oYgqTtze4r++dj9kT+LrkVE8FIuwkLNCj
	 g3V2CvSeeMmNcQ8MWdR7LBo+uSmuncNoQ61gy/kSoUHQ+3qJaHPgPcea+vaBIP3R4dWwE
	 Sw8RacL0KGVHqWwzpYI+w3z+25jKw8rpWryG6v/H8rUBc6elzvPqBA5ayWLlgz2gzpxrI
	 trvI/OXcgowIfgsa45y+DWPj7D98KXqM0gTMx3PUbKDa5rPvSmx0tB18x4ExjbA0a8dj2
	 OD1pxzcXfuUbQ55p9e+fen0qzIB7+NFNqwCDdnnuqEs1mzHVBRSB4bjuu+xhMjl2rCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a0tLEIZV;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240FF60A2635
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 240FF60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a0tLEIZV
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6798eb0d13fso1114699d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1793194435; x=1793799235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHBWVyhcqxaC5vumFhxxpKEuhD3213M1GsePKvUPh1Q=;
        b=a0tLEIZVYyhkTlIJHtgGbFZONiiDQraHICSs8nIr1Mw8HVsHHaim+W21SJOURks2cx
         61LO/g8DvIxgQhaGuocD17ZH/DA4iaOHyjQrLqvDuajbQoadCuwEJCYzv6ytYZ488PyY
         6RP5RF0HmPdnKboB6PcfpwOn894vMmmRnBEgJgJHkKN20mHnSrwCmpTy9nNQaa76UAWN
         NpNmbx2oRjFr0n7ImcBB7NpIjIxHAYO1AHWj0PGm8ai11QqqZC4jA1qSo7eoPgwI0ndQ
         cBlclyvHvowc6wQkBzpllidO02OCyWxupMHOBYWp76zlmeTbU415dVFYLCJd5WjoD/Bk
         ik0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194435; x=1793799235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHBWVyhcqxaC5vumFhxxpKEuhD3213M1GsePKvUPh1Q=;
        b=j/5+6zn501Jk5B1J73RrE4ci89L/HWxidnYtDiE0nQMtpZkyygzaQqZNS5zyk0PQuT
         vzNkKwIQKG31iOSJmTNXzMH9kTNUG0BQ0VW2+nDx2ZDBlT4pD5L5CHQcvQuphux8Pt5s
         KaNe/XDVJphPJ771DNRvFMXkYtoVpJmKC/ZvEjoAko3WzfSEZS884Ct7+9AqjPA9UX/p
         lgVbSOnbYo4HWzjbKhkLTRIVt0e41xWkmO8saVzF97bgqi3sNAxN6Ch3IqmYvAnFUhKg
         jQ71HdgE2Hk95s0QfvMrAkRQGC0H/whxfjVyh5cPxligCGLzhdrYRHKJwuP7i1u159du
         5MFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMmj6pe68UzLCpVSxpGaWLV0JmD9qWT2rs/atlrdazKSAy6gUiT96UJaw0tVizTjwkGUt5Cv7EDn0FHRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIguH0Hz4ccaJsw4WEU0iKq2vVePplKglAo+R3b0kYv0Z9S5N+3
	aM1cMYoiqUeVW3V05w8lvsJZldmj5CvxmHrp1kLkYq6zW4LejIHqg8CQE7XOuhQ5Ngnj
X-Gm-Gg: AYBFou1OVFa//suG20n5JhWiLtfjRx2tgfsQ1VyaNeVSu60n9Vlv92zrATOLc2uVUSk
	qYmGlZpCIrl0fUXHVHnd4+94o3M945QQOeo1o8MiqQLio1PAvv2dboWnR80LDfxatYrWdNgiCt9
	FPF5muayEYFGDA+c9heq+coS7lKZA6pGWhbDX4SVbLhkRuELGqFlg0Snf1VWP1/RrEUVVqVV5Sl
	Nv2BazHOMyYVZ/gwML3dD/vNLAjTkizoHD7HVG5M/tLVay9A9MPzqc3s3lln3vFdpq2ZCEoMUFy
	UP+4LU5oQmbsRz9ygg8Rlhc7i4ydxvcnePdXDlqIThAL2weqIwerSti2igA9s6Rb1Rl2KRUbxwy
	+671+R5tNiffr8iysrFqj/IIQO8HZTBUJf2V+OHiv/AekpULV3sQDHWFft95qE7uCL0izW3CAKH
	TJtifkmokV25Yt6XNkX7wQYpXEsNqAnf1UkRUpvZPd7Cnv4sbRn8oBejeOvIXAfCkTwb9/R3q3Q
	oAz8stokQ9vDKNv007SW+lvCN2cQB6kcSGLfWHBZdgW1mmZyz1ieJQIs3if1uxVjSSORC8sHmU5
	Ie7sBd5hzO7Zsi+tgBMvwCxZTkj968AWimfeOwSvqn6cQEV9xQ7+a8+0qGlf8g/mELI/JLURohl
	7m8DHjTA2HHmaHT4G24lZU6KNNzuIjxtH4GP2LLEQYxKDvuc=
X-Received: by 2002:a53:d60f:0:b0:679:992e:3ad8 with SMTP id 956f58d0204a3-67a7bd3cbf0mr1120504d50.132.1793194434760;
        Wed, 28 Oct 2026 06:33:54 -0700 (PDT)
Received: from CC-KJQTV599DQ.attlocal.net ([2600:1702:7b5a:ab90:103d:30e1:1f09:a9ae])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a79f38dfesm1694911d50.1.2026.10.28.06.33.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 06:33:54 -0700 (PDT)
From: Ketan Bhardwaj <ketan@armoriq.io>
To: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>
Cc: linux-security-module@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-api@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	linux-kernel@vger.kernel.org,
	"HARIHARA SUDHAN . R" <harisudhan@armoriq.io>,
	Ketan Bhardwaj <ketan@armoriq.io>
Subject: [RFC PATCH v2 6/6] MAINTAINERS: add an entry for the Kernel Assurance Plane
Date: Wed, 28 Oct 2026 09:33:35 -0400
Message-ID: <20261028133335.75899-7-ketan@armoriq.io>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261028133335.75899-1-ketan@armoriq.io>
References: <20261028133335.75899-1-ketan@armoriq.io>
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

Add the KAP maintainers and the files they look after.

Assisted-by: Claude
Co-developed-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
Signed-off-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
Assisted-by: Codex
Signed-off-by: Ketan Bhardwaj <ketan@armoriq.io>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047a..0946d15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14118,6 +14118,16 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/radio/radio-keene*
 
+KERNEL ASSURANCE PLANE (KAP)
+M:	Ketan Bhardwaj <ketan@armoriq.io>
+M:	HARIHARA SUDHAN. R <harisudhan@armoriq.io>
+L:	linux-security-module@vger.kernel.org
+S:	Supported
+F:	Documentation/ABI/testing/securityfs-kap
+F:	Documentation/security/kap.rst
+F:	include/linux/kap.h
+F:	security/kap/
+
 KERNEL AUTOMOUNTER
 M:	Ian Kent <raven@themaw.net>
 L:	autofs@vger.kernel.org
-- 
2.51.0

