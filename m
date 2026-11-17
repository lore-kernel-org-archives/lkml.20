Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933711;
	b=m4Fc2ihuVn5VS0jbCijctYkMaRMfojWaVXdZfLzaJ7G0wB01iwgYGxXP3YfeJGPmIOwC
	 9THKdK+XWOunAMRxe5zoFdWeL55GxEoJ8+FApgvqKZ1bZUrR9Q2JxJZls0OQwZzc4W/Ir
	 CciPv4EwdPSL2Lxtp2E2swhMYg+qA03xh0KqiyOUv+hbI10l0lWR2j2Ki7hlhpVOUV+EE
	 PyjkzonMdVBeFr1WR55c6k8HtIMA1v8+kyRi/rhV1xCkQM4HIrRxjhEtEuFLU4aGxDTBx
	 9tX6BWhjIL5JSD+GkMTxrYyMqERC3+yH/KljhP5ws46JDNEz6RfswlvsxydEcGmkFYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E9UqG8kgoxzr/OXnuk/9PMtioBhC4J7rDT1g5ReJcaQ=;
	b=EaP5k3Y3pDDzkhb6+6C/vi/E/sVIWu7NFth8Y2cGaXHS5qKZb/XK7YVAzL+PmoHVaBYc
	 TWfDi3ltDd6ax04v6Y7k10rYnUL0ZejMbc1FscAhptk2xDz8iD57lHRo9kkZ9NXgLAfQ8
	 kPhe3zz31s3puJ54HYOU0bcz3VMckbRjGbcOcnqpEc0kP9sIuqjRWZ6EdVu2gY5gOu6qR
	 cWwzixnHKzuXIuCAj3omww3dwtOEsP+fckAr6qiL59caS08CSNZjirpOY/BkRaVOgjan0
	 khilZR9wn3aE0GIlXPYtmEO8Nbh+pvD7jeU3HL2c5d3uJAUOSuKLZ3RBti1BZ4OA+Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLuUHnZp;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7305A606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7305A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLuUHnZp
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so15245795e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933710; x=1795538510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E9UqG8kgoxzr/OXnuk/9PMtioBhC4J7rDT1g5ReJcaQ=;
        b=hLuUHnZppPhy/Th6btQWxH3Y1idAk2DUmxE3csbcvOL4WPJtEDyOtKiMqDPCv4zs7z
         H1YGm6j32rohyNx59bNyLs2gexyMGcUwn/D5gDnBwTUxKDaus9E2ic2phRPpNXPHWL3v
         UTAM4IcMyI56YDOeTulD4LVRL7DGEUsD3GbLEAuaLaSxMwIGSB+vC0lkZJuyqOzpokuV
         a6cahj9NsKekQbKC71QDL1FREYe6stFQREX0J9VICqTgbLT6Ra2+xXzLxaVGvmwechD5
         u7ve/hUHQ+yGQdtUtR4gLk99ZFyaPEGln7Z5I+RSkWi0iXOlipngsrRFy9gFhfiI/bRL
         pPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933710; x=1795538510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E9UqG8kgoxzr/OXnuk/9PMtioBhC4J7rDT1g5ReJcaQ=;
        b=Qc0GZzMyMp72gne+mtCjoPZ6oDYKTTrDtTQxnkHRKGMuHiHOxnN0RMmwj7iRvv9P8V
         s7xj8kHmdP4cayZODDIb5aIelkmKu3V+KTOkEtOM1EF9L25dgHIZ6mLalWEUuf3x2Ab8
         CN12+xQwhySYlL/qnHi91zyGtVrmN1K/Y/ydCHHnYvzJkYifYi1xUPq6N+bbOGNZzJ4q
         jsw3NbYiXgcNZf3U6I4vKcJ/ujmlL9I8+DFh0MgHVYRb5pu6zy1rSf+gusicyIcuJMXd
         m2Tw/etovE2kIN/r/jtKH8/XR1ytcjHl8wMz/8HrCyH9jRfu7Sey9ZbNiMhx2/hyjLp8
         erbQ==
X-Forwarded-Encrypted: i=1; AL+hErHIiPJn8DZ2CAwTXiIvUashDy4H4zZBTN7MhgQj5sXEtbzRY3N3dg130P0nEbfbBBL0Sj02QPX1XmTBep8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qAMfvgkyrV71dP52Difq2fLPIzqPv7P7xghkqzEeNPsHcojj3
	YAzsPEJsvZf2KiW8Ngz0IGy/SQ+EjOxphL/ZfDIlVujDU8PTgGrg1KKp
X-Gm-Gg: AYBFou2X+hwM1IcH5shBeFdL300q0XZj42q2GkzyZyaWZcHwN7cvtDrnEsnkvklX9Ns
	hS2aYilqO5ZrZ/k8uBz7EoV9VSQEj4ubLLyWuqZqwqpLRmFbs3w1KrEjEKLsin5jGo3HoiFdVco
	x86THtVDbiZeD1HaPkV83iGoft/vBH6+qODf99OUfsPbqrTWoA+ak5/2U/I0ZF3C/JF4weoInE9
	Gybqrsqu/9dPk3qdQ8t760gU8Rv72nX6Kisah0+VDKLyaeWkW4uU21UAi6qL+j6oL3A5nCRWHBZ
	N7rVQCwn6mi9/sKDnV4PAVBfrsdZV86PA5TphwASCIrzxliHIR8pjUSh2XmuRWlDyrk5Qcm+uit
	KYfwqdM0n/5tyc9RehrMcWbXnD00cbMNV/7SbgRLxc77n3Z09FAkw7E1uC33kYztdatKvWwmS0R
	kC9Py2lK451nCHNGukjQ6Zudj0Dv4f0OY95HblxqAXM5yVwfVK+rXIJGOXTR+z5rq6gT+RYfNcY
	4yhVzAM6HPLOV86Izv8lydEEKlHhAFS3dMimDn4Vj2RhIvsQIs/+NZ6R3Uj6mSDh1PhM+T2f0d2
	DK6Co6wwJwbkszfye2TnP4HO+o5R3XHXm7fwMv9YpM6J64KPQTJPlCjnP2hBwO+cTe6j1lFsK/v
	CnK3ZnCDC+yxXmWaf3tg7ySc1yVYOMPw4Dc8vObvv9BbT5BClJ/IKcTs=
X-Received: by 2002:a05:600c:4584:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb7837a4b9mr69213875e9.7.1794933709681;
        Tue, 17 Nov 2026 08:41:49 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:48 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] an8855: add MFD driver
Date: Tue, 17 Nov 2026 17:41:27 +0100
Message-ID: <20261117164132.47167-1-ansuelsmth@gmail.com>
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

This micro series is the AN8855 MFD driver that can go
parallel to the DSA driver.

Changes v3:
- Rebase on top of linux-next
- Reintroduce switch part
- Add already reviwed switch and phy part
- Use fwnode API
- Use __free for mdio_np
- Use capital letter for node
- Reorder header list
- Use ret directly instead of ret < 0 ...
- Use macro for u32 shift
- Use full 100 column char
- Use unique ddata instead of nested one

Changes v2:
- Rebase on top of linux-next
- Drop switch part from DT patch

Christian Marangi (4):
  dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
  dt-bindings: net: Document support for AN8855 Switch Internal PHY
  dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
  mfd: an8855: Add support for Airoha AN8855 Switch

 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++
 .../bindings/net/airoha,an8855-phy.yaml       |  83 +++
 .../net/dsa/airoha,an8855-switch.yaml         |  86 +++
 drivers/mfd/Kconfig                           |  14 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/airoha-an8855.c                   | 568 ++++++++++++++++++
 6 files changed, 928 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 create mode 100644 drivers/mfd/airoha-an8855.c

-- 
2.55.0

