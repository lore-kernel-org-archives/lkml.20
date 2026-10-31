Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456388;
	b=OdfAAnMHB7lcnqUV+BFazrv1bB5KoA7sExneoZWBrullEsdhfhGCsMuURDRRPifKuoNR
	 3mtdZBSfanqVVCikCaO3jdr6i2wkCA9CdYPasHqZUyaR6TRDRlk93xSYYEEVYN+Gz+SM6
	 ab2/glwolXnlV4faZiKsVl0EdN7p3HrJeCJErgWql5+Nq+WDcASefSBxwR6YsxcEqkOYe
	 g6pUxa4B27rv9QpBHH0nWTF2u+RA9J3O46gogeQQ7m9fmwf8fqkQLI4mTnBSK8QIBe5uU
	 t99IV5RG3uJQvW0TKRdJCtQAE7oVCo9kUoQmSOgNNFrasZvK2116brS6apk67uPS+VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c15yII0Bbqbvlrh2M47suTP3fe26fyb8Izw0IoDwLNY=;
	b=0LczTsbtxsU9yeZB+uqjTSu1F53OZsi370N00GeHaz6ataugUwCr0UtuXn0zVO21UBxl
	 Sb9m7ucYOteQSY4Yctjogs9Pz/33mdaocLV64YlKCJZJoLX1T4g++r1BOkcfaGkBD2zmv
	 4XD9ZhGWj8fsLFvri8brO7KU3NMEOTuFhqAFMzlFIDWtIXHvtQQ2JMd0o/ZSOkUEKerBz
	 ueCrpFSxb7s1hTK5DBTsVJfiDaPRRcqsynWDMA91UImHvPaNRJ8A7XTLEfdKfYCsqjD8u
	 +bLs1F+ON7Oc386PJec6sKw8w6yWvnp2HyOKzk2Q9OWQxF6dZfJrRPjq+GmT7W7DFJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=utAh3K9n;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB1C606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADB1C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=utAh3K9n
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a210470b49so12857615e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793456386; x=1794061186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c15yII0Bbqbvlrh2M47suTP3fe26fyb8Izw0IoDwLNY=;
        b=utAh3K9n6ASkvDKJCVcthNXfPz/IXZukGbpuM7aKzBdZQ/aWHtg41rLYOxQx+vyywK
         WyliRtagefBD3CuNc6cy3qlkAVHtkwKGaf8+h6pxEpjCyTxzOGbsYi+f8aHxns5KK+hL
         iHE05tiSBV2MEtCWBkRFA2TFoP8kaQ7zMHIjh9Wqv8ciRlbItUIUZjjLy84MGZYrkb7O
         SLcFer62IwjVekybP2FP4RyADwVJGSoWqaFAkG+TZDWoHo+uIndqCkm1RKmCQUuflLZ3
         P+vpGJlOQsZDfm9K09G/35yl7q/OuYF8nld6YjFCE0CA6N3tseIpqKhp0KxLk5pY9oZ1
         PRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456386; x=1794061186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c15yII0Bbqbvlrh2M47suTP3fe26fyb8Izw0IoDwLNY=;
        b=Z7ilmhkEDFYD0lyZOJLCJXz0RIGrpEt6nVZe5LrFkpxtz0dn8uWsqcPTdN46p0f8dd
         3XJT6m/Gl4VIXB8tajeX/uvYGr1rGluPPYfh8Iyu8VVxur2UPQiQcZdxDfwByenm3iVu
         yLw6bKUSFrUPbNPJlZ+bsRYmjPrZa9aiSeAHmenU5aQOe6hy4XmUx9hWKfZ4C5PEX9QP
         QeFFu5t7ocbH4IvbSbWD7nzXE/R5gZPlFUEBrKSXLIWgkyyw1ucderMfrC/z2d9k8eTX
         YYOL6t0lJG2RTqLlR2Yi2MfSdELUWLNkAjmKW6Z712hRTVkDine+wjdof89Z2ExvQ41/
         2SfA==
X-Forwarded-Encrypted: i=1; AKwUvBzV1Cr3WZC67a9bf6kwp5N2ua43t8T/iP7WolOYxSx8TPKxOgghz9sLKQtZff7RETRIJ7htc5gYTWjyh0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYtaOtlxClhS/4qoABoNAcxi7UEl1Ya13l69yVPyJ6ltCKjN8O
	OUcJue1DaeS4oWTelOAgNJS02AI717aKOp986MxuypxiRZeh64ryRnk=
X-Gm-Gg: AYBFou0VoQFxAyWwOQ7vqO0Ft3vPkzsrE9XLAHUURV//+b8XWQTXhwkCiI90mBTlMDi
	a/ln26nRoKbDY+gZhy0ZSxXKJJegrhIwZSAxUfzgAlTg/K/12atGTGZwVx7U4Tlcipz+qn7eZfz
	GsO/fW2ohSFgRWUnrmlpxM2jQZYKlpSYvk9VIhs3zpRJJewW0ObGpHz/4exEiyJ1ieGUyx7Kv8x
	tEanXMqhRpkGUkGliaBVvETRoWZip1gsMsuaB13eilScSgcAJgRWnet6xC61ovNMeAUNBPwdP1O
	whNn4f0ISEE+HdJvhKjqkoaP61YoY/F3RQiXGdsEHhzeHdApjfwAfZdQfAdYeOvJx+qECIfEtgr
	usYecjy2dNsJQS9IsT4WtcWDCrbuYwu2u3RMR+7jKX5RpeAgQ5ZiCtP4lkTnkrYEUCjapwpYiv5
	mjDPuyamzo1JJDhrI5gpXx1yVQeXhwTFN+BwirglaxQmvkukwKsGLQwy2j8ZCshxI+Hqe10JlVW
	PzZ9gGLRSs5tI4HgrFuJTQcRiGyBBU9rUfQv1UHKsmCt+XzLf5khjvNyM+FuHDov9Vgoz6KEv+s
	g7aP0CBngW2vHEyb1GtJ3FRY5PX9SSY2ZaSfoEmV
X-Received: by 2002:a05:600c:4e49:b0:4a4:6fdb:cc42 with SMTP id 5b1f17b1804b1-4ac17b2c38bmr128602715e9.11.1793456386005;
        Sat, 31 Oct 2026 07:19:46 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm209871275e9.4.2026.10.31.07.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:19:45 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: daniel.lezcano@kernel.org
Cc: rafael@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ansuelsmth@gmail.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH 0/2] thermal: airoha: Expose EN7581 CPU temperature
Date: Sat, 31 Oct 2026 16:19:10 +0200
Message-ID: <20261031141912.1664575-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
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

EN7581 has a second thermal ADC for the CPU die at SCU offsets 0x2fc/0x308.
Expose it as sensor index 1 while keeping the main ADC at index 0 and
retaining zero-cell device tree compatibility. The hardware temperature
monitor and its trips continue to use only the main ADC.

Tested on Nokia XG-040G-MD (EN7581, OpenWrt 6.18.55): both zones read
successfully before and after reboot; temperatures tracked CPU load and
cooling, and matched direct ADC readings within 0.3 C. Twenty driver
unbind/bind cycles with an IRQ pending preserved both zones and handled
the interrupt each time. The driver builds for arm64 with W=1 and the
binding passes dt_binding_check.

Vitaliy Sochnev (2):
  dt-bindings: thermal: airoha: Allow sensor indices for EN7581
  thermal/drivers/airoha: Read the EN7581 CPU ADC

 .../thermal/airoha,en7581-thermal.yaml        |   6 +-
 drivers/thermal/airoha_thermal.c              | 157 ++++++++++++++++--
 2 files changed, 152 insertions(+), 11 deletions(-)


base-commit: 2dc1f296b5754dd2441fc8b6613a362a47f6b98f
-- 
2.55.0
