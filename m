Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753464;
	b=Dcxc1pQsa5DwE1juYT2tl53d6F/e7ySTQfJw49w0VE5RdhZ3GVIz6A87kJkwaBBwEQ3L
	 iP3JNEEyjV08fl2D9q3vZQSYET+CHQf8T9yL7bt6LaIv2HBi54PzjU0mcrjW26j9sYYp2
	 Tv4Z7PKemJWOFSfAKPHVyQ3t3OxgjEHN9Kjt7yxXaMq6Tuqykv2k3TB1VrOXVz/o3X39u
	 /56foml/u06mVyIIHKq85re+D8TNIf2aOU/3HGbKcuEonFcEko3A9xAZNoGH4UOt+g8lC
	 rp0eWXY9w8Wu4baq9rDW869d4yp/jzLnXTPxDyLiol+7xx9ZwXxquNZZV2pyI5bgnCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LZrrte1o5NSIPT2kPnWiRAF/yUTjYoJq4hLlMOko4J0=;
	b=tveX6rC1vtBN3lPUpdyJAqk1XI248xZqegqSwEJzZOQ2sfd1MIfTYGvGNxoeLpATbdPq
	 9EpBfsYUgAY8kdlaDD6AUwZvXJrX4NmcaMX2Mbv08mq8XR8w6gkStIPGNu2Q9+MfmKEou
	 N5PAybi78APlU2B/pvmFGEAzijWIpZn9VgSjCaxe8fRQwwzicr1PVSx6EseKkQafvYE7n
	 Zi4Z+CWpslu3AJEL+R4o7M9CJhy2VsU05HWuyMffmnmFXspdbH4h289eK0hHteNrXPlRT
	 EberocKi/cmJuJZdRp5YQayG9pN+KYnjk41GNe/MPJCYheUIFDr3ijcCSSZTJspdiTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JIGObF5+;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B73606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0B73606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JIGObF5+
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4922523d1afso1225019f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753462; x=1795358262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZrrte1o5NSIPT2kPnWiRAF/yUTjYoJq4hLlMOko4J0=;
        b=JIGObF5+n9z2rF2DAEPIH2wEAG3uYTfbAus5HXg0lWmaFmYAMCO4Q4uM0BUtPHeg4A
         GPyH/Dr0LX9Cj/EkDbK7Slo/ruNLFYLk+ahuPHjUnLKBw0jjG7Z1njYWhFvhBj9UihxN
         UICSUPnKvcHJ4+4lSH0rEhuQK8PCcjMpwmCDjtumC/7XZY5PWWkA/gAb8v9nKkSbxrV/
         Y9ThN/v4ygArVzLZAXb3YM7BxUVKfigR84V8gBR45JeqbTPR2CfifN2+sENM0bcHdFtM
         lj61zu7W35zudlmbCik3sb15ddV3QrjhbaumMuJP4SWZ2/FHSVE/m0/Qf+yUjxTHpyeM
         Qc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753462; x=1795358262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZrrte1o5NSIPT2kPnWiRAF/yUTjYoJq4hLlMOko4J0=;
        b=Ew8Rixc90GR+6Y/G4r8KlEbAT51eFdAnlD8NfcRKjS5GYoMfVF3kTCUj0/DDe31VM/
         /MI4gTBbvq7++MZ/2tVbvKlmmtbY8/40HLSmJS6oeEoy3053nWzvdAnBUCttGgEKcwyI
         Ld6SzkvbYlp6UNbO1I/dwa+5MEGcdaZ+L1s9C9TefNf/BDS/RqK+n+KyQ7TO4WakUbIs
         saaTqgKT3VS0OJLTKGst6Y82zxIz2oMSgfaqGz7gGSTqbx/yvtArb2Ug3OSuZk9GvA6z
         fVRh+u9disudolYwC5YFAY3o4+eVTBHVCxuCcwYZlXRt4xfIpFNYRWkoYx++3NgbjEw1
         k6hg==
X-Forwarded-Encrypted: i=1; AL+hErHQ7k6fe9dIPOXHIilGDZ20vVXtiWWHD5dDvBztT5ESHJcHKAjal1VaN/B3kpsTvEGCmHms5+bX61yktvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ooV8HrXJKLIXSgdT6AFVrKpYnK1oJ8NO9oNJCe6TR5QAsKceB
	EI0hEt58jq6uJN2w8KSL7Qz0nngYM8SPTPyn4kUqI2RTRH9ZyirquzHw
X-Gm-Gg: AYBFou2PI06S8htbSTIiAoLwwTcumVr4y3dBfae35ZZ5fUNWMFN5AuIMJ0HtJR9V+4C
	XMhGv0M/KMKTR/q3UL1graTqjGmw1Q8mk9NHF/x13mosSYGhW0dKOfkYirrng4t88thNnKNCWd5
	nTbLdBP4afJL87XmVGvHh23QvnYEethWACdQnJbuiPaLvoyHb7PK6NE6IgWPVDNEYAoKHoStUm/
	H3oUvfEfCBMo53aTWj7OGRebMKxb4lg1a09lF63Gtjwz6bUoe1sLp5bYqrm3SXfG/PbKZHacBKn
	cRmwD90FwZ0MMgrqyU+2LGZX6VjMFlg9kyYw2lQcTDe2W7iPWLJE9WXy3QpupqrzyPfubIOWZnA
	rHuSsGaMa4OTF4pPMry+hRSawU1nlgNqzZ0gvLwNXSp2lMRmfHqdcZdcXzPnykS5YIB6dhSvc98
	g0iAc9X/S5LLLA84PMfVdZyulC5Es5/sfBQgF9/OG8ge+KW6x6v0QoA4VBqqEblET7VMnrs1fvq
	KFnXfj78+Nxxk7SoF+hVSemBZWX5rkb/a2XOanoTcblGKFvZ7ZLwDGsPaJn4BqX8pGMLP2Zbk2E
	hntWUzfioC9F3MOM0LtZ+l5iJo5r65OPpL+TvqggNDSKYKRTnY5rK31kkhViByTloN6MyvXHP5f
	A5YK2fDg6aVxJcwI=
X-Received: by 2002:a05:600c:6092:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb55a44be7mr159448425e9.8.1794753460960;
        Sun, 15 Nov 2026 06:37:40 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm196174025e9.4.2026.11.15.06.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:37:39 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] hwmon: add three more board models
Date: Sun, 15 Nov 2026 15:25:37 +0100
Message-ID: <20261115143708.492883-1-eugene.shalygin@gmail.com>
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

Add three boars, submitted by users via GitHub repo.

Eugene Shalygin (1):
  hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E DARK HERO

John Roden (1):
  hwmon: (asus-ec-sensors) add ROG STRIX X670E-F GAMING WIFI

Kostiantyn Korn (1):
  hwmon: (asus-ec-sensors) Add support for PRIME Z590-A

 Documentation/hwmon/asus_ec_sensors.rst |  3 +++
 drivers/hwmon/asus-ec-sensors.c         | 34 +++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.56.1

