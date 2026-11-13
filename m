Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794589141;
	b=qLXgZahcqkmQG4TksZgiH/3pjMjWqwSMVRwB8G+iYRjUlwRPdwzof1WROUjZF54Iy8XQ
	 si09FrG/Gn5Sg0u0fCU83KFqQE0XycTbiSpr/FseoTmgxmfjUYdUNvBzn1wMJdXsiXnDe
	 MejMkgoqjq7Fs33ePUbGB/cyeg/NcdYhGYdHM2AsjnUfFrgmY+p1JWv2+5a+JThhqyB8X
	 00R3nbpvJ2nbBX8Av65Ih/l4WAyykphJ3A7mboM7YvBQ91pu4qQ12Z5E+GIkyVrToUmZ4
	 VhmpO48vHUa47aNRtqmSIg0cI/SyoWSSmyP/BoQPT/S3FBclIUTWJZdRniTvafLRNqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=MVb5iT744tTyx+u4e9UrULc8qZkgleIykKXyvixHqbk=;
	b=bQMCYablw4JLn8osczF+JW2Gmz6ZsJ79z/yljIqft7JMwMOE7fN3VUVdjTbPZ7dx7xnX
	 SyqoRFN4Gpf9Ks61VhOnH9vOiziADBjI39wHlG0pv4yQRA9+Ca6OwJGKUJU2o7+SqJVS0
	 2P5bBzY63S0smUW6ZhecjN34fG/vKSfULl5A7n0yhe6Fr+y8tCj62u3grsLP2FUqAyHlN
	 9ML/kzZ+Fe0WrgJi1zGMbMl6EMe7ar/s+3/WulV2hEW5nLoPBpeg3UAEwiQEJot8HoqVD
	 iQVvYJrCUYwcLSDx6tlYIxji3VOKMxkulMqQugJ2IUAajY7ThcyQo83DgJ794cyE47w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DbsQb1ZZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C73D606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C73D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DbsQb1ZZ
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 880032000E3;
	Fri, 13 Nov 2026 17:58:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794589133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MVb5iT744tTyx+u4e9UrULc8qZkgleIykKXyvixHqbk=;
	b=DbsQb1ZZMcZohZghIEo83MUlDZT9gSSsi/r9Hg3LR6ddCBoBwX6lXKxulLCc+oaZl/J+is
	bcrc4pz5YZySzmFJiVnzQxnoGYVePd9zwJhgKUq801TOBuXt7zrGAoRa65ah+pz2yS6t+y
	PrBT0MZQRF6k5fXNQGxJMezSeuw30o69Q2tP+POUYMPzTyab0D7jiyiDgjls5lznCXPBDo
	KpGtlYc05zMzJotGHWL7NHm6qiaYE4d9Oex5alRoJu8LvK4BjW/nj4UKKXuwNFKYH3yXI0
	f/8dWkMqlc+VxII0P1h0bssTg9EOAcYa/MqkpBviOTB1N7PrD8YesHMKbQCQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794589133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MVb5iT744tTyx+u4e9UrULc8qZkgleIykKXyvixHqbk=;
	b=NXfu/agVijYtFB9Mg+fJPOOZ70mT6ScK0MEATod0pno9XOcAEYRrrFcwnIurmvgDLmB6Vm
	f7SYniphHwe0T/FcByOj/0m892mZ5upnmawmAtlhz17IkEy3Jh0YJirozJTiWK3Asr9bZJ
	j2b3soCg4AVtaaiJx4tlF7REWgf/Sfontmw3gLlexnQbseldcBHg27jklwtUXaDnFiZkN2
	9HDoWRUE1jc1USKP3UuDzQbacVk4mJpiRbIKYp6tE5V1rlZG7odmUG5jF/9OFkDuzoOaTX
	uq6JOxNkNIv2vCiYbyBY+wFy6byqBYfIZQwrzsCLlWlFGxfyjmVumUB3y4WpLQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794589133; a=rsa-sha256;
	cv=none;
	b=R6OPrkEVJrFpySZXnv4NcUsLi6Gbr+JfUsLa89AUKOMj3ELDAZOhqeHyRKl3jTO3wfx6z3
	2TMez/WfjXn44AmjCxufIrqW7fmWH8Btac8frthRRdEPkqx44rTB26dQvnYTmEWOyW0sGF
	jqui/XMuvV3NwOFM5IUvs5dK8zenSFBRxwuURH3ri92/79K85Hz5XotJ6UX2Icz6gq4nnX
	hm9y9m+aTXK039Cl178aJ4HEX5ZINDmX+dsuRlFPQhH+pdMJ8Y91s2RVsTnWGkRNMeAlkM
	9+OnvNliCy3kBhmnYkRs6wBOg8wCkBJ0m7k7U1CARDtIh+KklDMEGxnJFhsY7A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xRuc1-0041Ib-1X;
	Fri, 13 Nov 2026 17:58:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/3] drm/panel: ilitek-ili9881c: Fix Ampire, Startek, and
 TDO panels
Date: Fri, 13 Nov 2026 17:58:52 +0100
Message-Id: <20261113-panel-ilitek9881c-lanes-v1-0-9d9320cc1387@pengutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxB92oC/yXMQQrCMBCF4auEWTvgNBCjVxEXbTLV0RBDpkqh9
 O5Ndfk9eP8CylVY4WIWqPwVlXduoIOB8OjznVFiM3THzhGRxdJnTihJJn6dvaeAqS2Kg/PkTtF
 HayO0d6k8yvwrX29/62d4cpj2HKzrBqrWUrt7AAAA
X-Change-ID: 20261113-panel-ilitek9881c-lanes-b68167d8d33d
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.16.1-dev-53874

Those three panels got their number of lanes set to zero. Set the
number of lanes back to 4, to make them light up again. Tested with
the Ampire AM8001280G panel.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Philipp Zabel (3):
      drm/panel: ilitek-ili9881c: Fix Ampire AM8001280G support
      drm/panel: ilitek-ili9881c: Fix Startek KD050HDFIA020-C020A support
      drm/panel: ilitek-ili9881c: Fix TDO TL050HDV35 support

 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 3 +++
 1 file changed, 3 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261113-panel-ilitek9881c-lanes-b68167d8d33d

Best regards,
--  
Philipp Zabel <p.zabel@pengutronix.de>

