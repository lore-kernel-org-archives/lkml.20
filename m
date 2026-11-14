Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622110;
	b=oih7Dxefo+alen2D6qhMnB2gpFCkz9VppTVaOLpnwDNs/xDD12pxxRTzKifIkzaiCpVB
	 NDlcqlHlSCZ9xUvZeC8I3KEc+AwrGR3CdDWxDZPNa5GadnNQMhQXMHgxgnwSlxchEUNfo
	 gQiXIjBLHOTTOftDPti2mbh1kwJ9M4EsTFaNn6POJAiF4geqyOwUrvuLxRSuLoDBJXysS
	 KO4jSIZluJr0biQAAhvZxlUDpuosDZefS+GMNkTNBWnrh1VYl6q/LH5bHRnHFBxUlFqR0
	 Dr2LV6zN6MrJ/WxSHHXEEBnLdCeYwSHtyUc8J+xrcpoEeoAsUhDHcVcsQslpEbTPbTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XeTY8NwbUCIb5XggB4uHl0AKr+krf2v/zuQTgZl5q1I=;
	b=ULyp26JwPITqngXILRoGiZFVgHF5Ji0ZWlRaWx6LTS6NnGtp+XNUZDwOMBoFTGbs2Bnz
	 KXZZzXl4kgElyIi0NnU7APF5jSDFPTx8+XUWc7er5cqdkTHgS8mRo7I73W3ufDDWo34JO
	 c25Bx9S2m9M+8KPISNuYNGDY+ZyVOlRu3/yTje9yVhEu5jhOehI3nyyLO7HEFn1HOkoDN
	 JbTX8pVfDMiilmifZhrgHYp4nvzYXjyB3KLxBlvQtUNMmeGqTeHSdjJqf7slheP02ICH7
	 C+z0xuGhbyejUA/fyj4+5ixmITPYqKf91JjKN4KGrnwdWRseUsPpRIAOMBWcXsXjNxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuOZEsG8;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776E7606A89C
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 776E7606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuOZEsG8
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37071c0f42aso2389076eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794622108; x=1795226908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XeTY8NwbUCIb5XggB4uHl0AKr+krf2v/zuQTgZl5q1I=;
        b=uuOZEsG8WWZxqYAyLJEbOteJLzRbKeB1yMqlQVeytRpsEwgTVKMITpypNt3OnidQoh
         pZCQk0AvcA4scQvJEQ47GwY1deGsW3iMJea2R/8w9RkuFQfsJHfbOn1jpzO/wskJ9ule
         B7tJFz2W/txKyLhqx3l1uCgrgj0XHPur6PYwJHuFOlt1py3U3+H8XizQeUzZGEPuqWMj
         iPG6MenxfXP8YXrFUG9WCRk0OEsXbFgKJSVeXHmaLQEH6LhmJGOSXBKkg2kVEDGaMHVa
         AWT3UjUM9aoW6kZsophhX16E+Ked4761jH6+GYO0zxj6eE89xCJulsQf0MIVTL9/+9Z6
         xGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622108; x=1795226908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeTY8NwbUCIb5XggB4uHl0AKr+krf2v/zuQTgZl5q1I=;
        b=h6YiXqdHRCr1Twpy66dtWoZPhRUIag96hMjuqvGfi4Ze27iEVKbJEPeSedcNa1tMsC
         1hazZX8HL8b0R4A4OJ2672wwtQQc8MTQNxHnqZISBdwTa7GOu/q/2h6jiSFfWLkRkyEP
         nybaYzlX/Co41VrEIFg96u9HO8jv94sCLGbX30N3ELmQ83XuWnC86yKfAIQJMhI5Oh1Y
         IYJTGJcGT9bMMPgO3lDkwxgWUE0Ukm5jDyfm55/PSnx/qgY769BwPY+/VQ/Eyod5U+qN
         q9QefVpNuig0p7jkFsDksgVrMQA9gZSlCCvlsSinp8La9GPBtpZlu3+ipTUZBqVyX26L
         8Pmg==
X-Forwarded-Encrypted: i=1; AL+hErGBaOMzGwiecVqclJqe6K2KKBFhAafnJlbIwoR9BHEci8/kNzTZcvsRO8Qe7uvd1jj3YfTvMbAX8riBeFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8tNIm/fEBeUCBDb6/Q90X7IgJJP3bOOHDg5XO7bKgoImiRQ7C
	RhQl0s6Iq3YdWVsrx4l4mbPoP7gPH9VO5jhjkpYDU4SzcpDTZFHhcdwx
X-Gm-Gg: AYBFou0YjK2aeyVp5TrSC3cPK9ytNaag60o1Z2l4Wo+mpS50s5VGojVZajFReKtK3Eq
	imXG5+T85Rj767fPlW9vGbzeN14ajdbAMEXQwT1qhCmBSt7QYXuigG2ZieG+QfiYol3J+OEyTbp
	V3D1dR8Wc0qnlWJePre50GrnqgSWa3G+vye7xmW3iPR/Qh0B7MlXYOry0eA3BqU7Iapi9bgJDb7
	qm+M6gOb0yr9R5YiugkylCJTBVHvAf71umSpU/7qJScTVm648KjrkdCgRmLGWzO3dki9ApKL0ph
	ZV58F2Eg46RsLYPqXznVDK15+raTSafx3rC8OMv5yFYAdUMht9emYezGhHRM4H+7cbPd/6BBkHf
	rYjXj1FgJa36Z4vXBW23FLO6qwGlz5ombxMWCwQuB3ksArpdI+lAzSprQMzmODAZRG/UY/nHlSY
	uD++IiFXbgqTB3a4DXQSwVU4OUXpusFTnVs+6tEE0qiK22i5lpMZB0CV5qOEMNmqgvPGqY/StPs
	r0zMXhYp3Roxsh3eBJ79F7J8un4cTj09miidIplExUnrQfl0kTx4bf9/DGz9LKlA3AXJWtgFaXK
	sTP22dcMUf4SVsiftjIavFrAeUqoKLT+McHX2MjZgNnUPcHQO86t5skKSbBgNL+4TRxdqGZlSwB
	VXTwesihNjMutUIr9m34nia8BSR2O8900nPlFiIrf+Qzmtmrl5XjEMuEEXjFY8dY6rcMOrP8/0G
	FqyHg=
X-Received: by 2002:a05:7300:f544:b0:36a:1788:3d1c with SMTP id 5a478bee46e88-3796879f0bemr4131136eec.34.1794622108507;
        Fri, 13 Nov 2026 18:08:28 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm18875218eec.21.2026.11.13.18.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:08:27 -0800 (PST)
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
Subject: [PATCH v2 0/2] platform/x86: dell_rbu: make usable
Date: Fri, 13 Nov 2026 18:08:13 -0800
Message-ID: <20261114020815.75539-1-rosenp@gmail.com>
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

v2: remove Co-Authored-By: tags

Rosen Penev (2):
  platform/x86: dell_rbu: Use the firmware upload API
  platform/x86: dell_rbu: Allocate large monolithic images contiguously

 Documentation/admin-guide/dell_rbu.rst |  25 ++--
 drivers/platform/x86/dell/Kconfig      |   2 +-
 drivers/platform/x86/dell/dell_rbu.c   | 161 ++++++++++++++++++-------
 3 files changed, 131 insertions(+), 57 deletions(-)

--
2.56.1

