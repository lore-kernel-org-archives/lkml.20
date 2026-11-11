Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433725;
	b=A1W8aDGZokdu1W8IWUSbu/EtpTp1F/z0s9re/f8lArc9YJV8gNKiSMpsbmdrdkI0VlOs
	 ygh/5U6q7bidxNDw0ayztHteD49SK+LVDLmwDUE857tu2dwdAP5xuJ85ifuJ5Bm5hv3uO
	 bQGQEbf5xbwc4sBZMwD7X9BAeNdYHd10WP+ICZTTZNumuMWiyMtBxk9maVqkWZ9v0UjdW
	 TMQKFw1XuQKCtJVGnP7nYcQfJdv0lWLhGtZ3vTp/WH9qSPfLRQdozxQvAtf+mOu+cXfH/
	 Y4PFKb9O/y5rpSge3Bw9gfOO0UsvIZMyn/tOiMMo0by5g5NOTPoA5o0ERxLevfABQFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KqvT//ywRZvyN5aUarjR+h8osuwosZKu+ejEl3vYsLU=;
	b=A8f0T8DZFaVUkOYuMf+E2ymHgBvdCHEoIQxrjTqY+EBiwIzJUAz5iK3XbKt8m4cac6fP
	 bMn6liBNYx9wyAnhhMuKsAWlS8EqUS0SXCE4+QkqKkRsl/51DCWuCG9mKs14WaQTnTWub
	 84woHGGAmdEF6jRGyGViYlFOdjLAfuGBHW92m+3/U70Qr/eiEDJiq/wA1I8RFkZGeaRRe
	 38mAmK1TSp2mxMhGiqzdMImWG9tmklMx1iroKWTnTytPqwR4Xu6mqKadUDsPNU4bpYAKr
	 aAjwKkCINMNSixgasiDuJo5dicdQKYnSqJScucfMTMFdqP3KA2vetxuXFTcdAaIMcOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ake94c02;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109E1606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109E1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ake94c02
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1746232a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433724; x=1795038524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KqvT//ywRZvyN5aUarjR+h8osuwosZKu+ejEl3vYsLU=;
        b=ake94c025Pcg8BInjOErVqxBlmWTqqVgqg2H4GFWuVtFOV/VA8AOF5EBhpeakZxZqM
         giPzK+C4b4BCW0QcvuFW+11krFPw8NRmt2qHNei4AJA+wEGJxHcLoCbUetZYQN0+RQEQ
         auoNJD0qDQ1224vXtoxj4YIhPRw3Lwz6jbl+AmvKRfENbmldxiMBKhxW4swAovAv91d5
         xBs1BjwShouGoiwRJcn4uqBK8DGCmnrpCbNWOh8ohmFQSP5pQ7p3KJU5OqgwSdRBgKTm
         AGTXCghXyc0r2OUchoSUzlmzorZbSOFkVWhPW6QPwyDlfQU2bB7OREnhzMFMXYii55Dv
         YgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433724; x=1795038524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KqvT//ywRZvyN5aUarjR+h8osuwosZKu+ejEl3vYsLU=;
        b=0C+UsGUv/31gNKK0OIjiYyaLa/EPocUagIUpyV5MdKU3moRQbPImYAzjBOdqS7DoIy
         kH1ZNmpJ76u5kGW/ad+3KmjOh28PGeLnYDnhIGupGamFhE91S65juKnmRpQPGTAx3Qps
         ee3uaxZ2sCHam2g3QzM4ykbsk/Ck15NkEpyd0ajbtAnEC7tSTuPeukCg9UwfG6Fju/yj
         Q98boknS1o4O8q1rvoVzSyQ3nyDlPLBMjgnuIhaD2N8tjEJQT//4Y1h2AcH8sei+1gYV
         ljvzFNyHMRQz3yzuFGTq1syZkgY/YHO+l0bRa1I5ggHOeVhK4w2seIYBq37x51vgELcD
         1+nQ==
X-Forwarded-Encrypted: i=1; AL+hErEp+vCRuyrHWJFf9uuVRhO76vS8+HWhkl3HTbz9EHX34fprb4A7moq1Vg6IfSyCtNS1JmkCIPtOuZXmEYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kLB9vspAEyJqoBiVz1vnePeK9/MFTGg6JPpDDR4ZrajqL79by
	zp5LtJmB9p8wWNybWTD/uwFt8E4OGmExrzUlY4HBSL1LsaFsEfz1t8jK
X-Gm-Gg: AYBFou1mHgXjlHpW3SVBs5qDYrmQORrs89QInOZT8M7qaVUtP9LxY8spxZEXGvjLD3V
	TV3S15LxM8eJtGcSdrkh17Ed3qWfDQbwdzxTp59/KgS4XX8ICxHexDnx8KP7+dOOXFdTFpm6283
	Iu8cisrOzRWOgrL4At77D/KRKxo0HDuj8MB1T70BhSbhUFp34r/9r3FS++JarjUFDuECnLODYA7
	Z5vRhKZQLutW9g5dMj6UUwR/CNcAheqzNa971DlGG0xTkiUEyMRYz9ejO+OX1I8WUFL7MCVONUl
	LUR+OU4ipsaiEdF45xsleqb/6UB/tZLhwOlKIfarJLKH2tXDqIKNz2CARbVk01hj1JR2h0SgIll
	0UsWowdQAzBIvPvslVaxATE78Mkja5F7l0FugLh9K0qyqi5spjttYuEeNRMvmsGvMaXbOt1fwLK
	2osEnDjTFPpINgkLiLg4YrEDkUGMI/Fg6vzEm7V8yDjra/FoJCl0m7j7RJQHry/TWiwKkI+APnQ
	HldD2AiM+ZK91hUkoil1x1ARZWZ+sa+Ag0FBwJEP9NgiGmXxqR7uqPmwofA025OjjNnCNdQfuhb
	jTN5GrhgYek/R9dmhH/OHH38nNqNtbtGjodwiZ2UFoz/8TCMNAHETI2AcvB11eHvm7KMlQQtDWs
	JGvd23tFsRuAsIGI1hOJjWVrKAm30noqlgLzMJ3PPqpFGzU9ck/r3eLypDqMaopyZV96FbRe7RK
	/ZflCUq0RHL1AVLpmZ/Jmwpqc=
X-Received: by 2002:a17:90b:2649:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b182f235c3mr3064154a91.33.1794433724406;
        Wed, 11 Nov 2026 13:48:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182de1dafsm2754761a91.3.2026.11.11.13.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:48:42 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] platform/x86: dell_rbu: make usable
Date: Wed, 11 Nov 2026 13:48:24 -0800
Message-ID: <20261111214826.6577-1-rosenp@gmail.com>
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

First commit updates the API to one not disabled by default on many distros.

Second commit fixes upload of firmware more than 4MB in size, which is most
modern ones,

Rosen Penev (2):
  platform/x86: dell_rbu: Use the firmware upload API
  platform/x86: dell_rbu: Allocate large monolithic images contiguously

 Documentation/admin-guide/dell_rbu.rst |  25 ++--
 drivers/platform/x86/dell/Kconfig      |   2 +-
 drivers/platform/x86/dell/dell_rbu.c   | 161 ++++++++++++++++++-------
 3 files changed, 131 insertions(+), 57 deletions(-)

-- 
2.56.1

