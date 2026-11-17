Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915880;
	b=ceCVgEKC/JMO9KkT3txBptar3baj0wo9UYYtH27MdXdt1sT2T+YAYHoQCVDrEti24HDQ
	 19Jbz8gCe9npy1Chg3eBlWljvLLT+a26ZvdtxA8JzZ+dwl6NFFXHV/AmMQtlWwgTY5jf2
	 HQZMiUZ9GmyYbfowOS6Sqzx9KYSmeK4YmYadjiVqbTzOUmA6zcxZEsBJAbr43V8lxnjoH
	 LR4EiaIXZa97LOJYftqhaAF5r6jAu8EZu/xmrWonLie2BAURowpPOKYVbKDf15pmKDjxC
	 iSAdAAgHMcxFa7SmbvFId3XgAF8M6noHMpDOn+AYJc2npgmuFxqTQPceDfW0jBNb6BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F3FrqstYoZ58clg3fjTCq4uduDDEeqEHJoKcIe9/fkQ=;
	b=WtVYgecp6HEKJ6RvG955gvHgXcvUS6LsZWYB87IE9y29lkcPD2W7SagJzqPD/toGnDMQ
	 VDfY9sy3Pcn6wEcIylSNWjjYZ2Z8LLAEOjjtvSWkGDp7pfCKYECiIOQExZMz7wM31GMdD
	 +skFGtFsm3uCFTdq9g82vlyVzFqM8Q5quW0lkwQWWa69q2/zSj9teqPym7ooRKFBzlEa2
	 bXDTUzm9gHKWJPpzBqDE6G46gKFxAqbodxHUVRcOpds5a2JnMttSCBDxP9IPUZ9Iy8rl2
	 v+F7pNYw+UVedY0hSXi1mZVVFsBj6CaihgCBpRDWNfnsozL8Gwp9lefXXZzdLa3i37Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bb9NC1x5;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F08606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04F08606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bb9NC1x5
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3acff56a300so39520451fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915878; x=1795520678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3FrqstYoZ58clg3fjTCq4uduDDEeqEHJoKcIe9/fkQ=;
        b=Bb9NC1x5OLMj6GYojtlvhpg2bGM9QkVVZ/Nuze7fFvnPSyiL3TFFk2hjQ5LFSo5/oS
         AnE+Y2WaF5Sg2oRLyvYJldA7T1yXNiUO70MnKqvfH9EXdNc1QGOKS0nRLWyihPRCBmB+
         hHBuPTBFHDRVRVywd9qEV8hRwZPZKWPctrsmSgAxE2nIA6aODanvekNhMQIbqhlV6oBI
         8U3LzEZePp10oSkctiV/9ScXs2dMTD7t6Zj6S3UOcHWbe7R8qOOmrCG8KMM7qCOZt6qm
         lhZBvxEg4WRGMbBij0PyRjtLXnQk3X58KtvjIT4fMLMdyP7EB6dbcqw3BDBVP1zEVeMn
         B2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915878; x=1795520678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3FrqstYoZ58clg3fjTCq4uduDDEeqEHJoKcIe9/fkQ=;
        b=raSMPJrIlFOFCM/38Lz8VLcIKM+0/Jt3NP6CaDQObsmuXMUeWkjfK9xKCNqzqgXchu
         9ZGLmckGha1ERzQo59IYqehcf/4F4wone5l4gLCe/Yif+n3ukyS3brqSAjRsWNVc+r1w
         e0MCP6h6oqoJuIx/3tZ4VssSjwQukOhwb/P4XlnNiN8RzrtQ4Vhjqc6jJxtmYviRFZiL
         DUhNzFhWlFXw3IqAwuTceBnfRHmIK5L/n2NXr7yWwN4hoKlEzkFQ3WeTA98Ekb9HHNLy
         Kb9Gn4jMNeomjVouYbk7jnlKrXdiTLihTpAgw65RaeU6YQ6CSo6PY4pt2EElmhLyCPB4
         wFhQ==
X-Forwarded-Encrypted: i=1; AL+hErGVfAvAHi8/XegZku1140tAXAc255pOjKGsbqnA75CQBL5MfVDsQOygHeqdL6URS3uleIQPc0Re1ne8NSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cVKADZf/y4Fxa8wlHCI9GIz0uBJ86tdYAmwWutMva+qWW/GN2
	7M/YuLjCAADUoddhc5qcT+xPy3EPZyNQqgC5BmtnEvddl6Mennc8F07j
X-Gm-Gg: AYBFou1PpdypPVXyQ5aJU+7SVHiIj+/2oRHvcNVNeA7am0OxERX2ylMzEfEusFU7IDh
	h4dSaI6wsYjCRVNUobz68iuXrnjSubXMrVg+B90Lgcnkj3ZjqDcOn72Xp7zKSzOd/60QrSSv0VL
	uV8CUEu7Fjr9e9UKEzUHIpMacP2Z74vKeZD0abROWZO+xjwGa8XHfOiHGMzFl83V9s0pKgvS8ro
	WGQ1+3pRNN//+EnsLHeUjkNEextNfDtSsyiFmkq4G3P3yLSy35OVUPARpauw5qNS4WRRwOB32tf
	e7TszE9knRgARtXO/Y0ab14dQk3yx8KzKUpxa2Uod3Juwv4LEUXAN5JWJTQBm+8bYHf/0VLhncp
	T0g9hyElIUpqE+zTy8fKyhFmViku9zUzLCj5MQEGW/c43eV/rDEI49qWXUyWTmHU4/eEduN72HT
	HK8du8lcBRfWIqO5ymAPleDAp1y0N+EEMqiR6ElaITo6x/ilVtTXXljr7nCiwdGMf4js8bMdXcu
	M9AJBSTenyuqoTl/tVlGiT7QE9HTQ+RfCfw3HSwbkOdB2E9HI+WeNvNrqNCfe6dyq8UJqHh1M6c
	KWzFoHkJseXPVT2h/p+c5UIXbjCv6DZUVOA+7vshKpybsgg=
X-Received: by 2002:a2e:a105:0:b0:3ae:68:d07b with SMTP id 38308e7fff4ca-3ae2b5399b8mr37245611fa.11.1794915877954;
        Tue, 17 Nov 2026 03:44:37 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:37 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v2 0/4] net: phy: dap8211r: add LED control support
Date: Tue, 17 Nov 2026 14:44:26 +0300
Message-ID: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello,

This series adds support for LEDs on the DAP8211R
Gigabit Ethernet PHY.

The first patch fixes mistakes in kernel-doc comments regarding MDIO
locking.
The second patch documents the optional "leds" node in the Device Tree
binding. 
The third patch introduces a small helper to write extended
registers, since the LED registers are accessed indirectly via
EXT_ADD/EXT_DATA. 
The fourth patch implements the LED callbacks
required by the PHY library.

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/dptel,dap8211r.yaml 
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/net/dptel,dap8211r.example.dts
  DTC [C] Documentation/devicetree/bindings/net/dptel,dap8211r.example.dtb
$ yamllint Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
$ grep -i "dap8211r" Documentation/devicetree/bindings/processed-schema.json
    "http://devicetree.org/schemas/net/dptel,dap8211r.yaml": {
        "$filename": "/home/a-shimko/patchwork/linux/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml",
        "$id": "http://devicetree.org/schemas/net/dptel,dap8211r.yaml#",
        "title": "DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY",

Required:
CONFIG_NEW_LEDS=y
    CONFIG_LEDS_CLASS=y
    CONFIG_LEDS_TRIGGERS=y
        CONFIG_LEDS_TRIGGER_NETDEV=y

Testing:
$ ip link set eth1 up
$ ls /sys/class/leds/
stmmac-1:01:amber:lan  stmmac-1:01:green:lan
$ echo netdev > /sys/class/leds/stmmac-1:01:green:lan/trigger
$ echo eth1 > /sys/class/leds/stmmac-1:01:green:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:green:lan/link_1000
$ cat /sys/class/leds/stmmac-1:01:green:lan/offloaded
$ ip addr add PEER_IP_ADDR dev eth1
$ ping -I eth1 ELP_ID_ADDR

$ echo netdev > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo eth1 > /sys/class/leds/stmmac-1:01:amber:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/tx
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/rx
$ cat /sys/class/leds/stmmac-1:01:amber:lan/offloaded

$ echo none > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/brightness

$ echo netdev > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/tx
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/rx
$ ip addr add PEER_IP_ADDR dev eth1
$ ping -I eth1 ELP_ID_ADDR

--
Best regards,
artem shimko

ChangeLog:
  v2:
    - add a commit fixing kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
    - move LED child node down below tx-internal-delay-ps in dptel,dap8211r.yaml
    - add blank lines in dptel,dap8211r.yaml
    - restrict LED reg index to 0..2 and fix schema properties in dptel,dap8211r.yaml
    - fix kernel-doc comment for dap8211r_write_ext()
    - add LED brightness (force mode) support to driver
    - remove rules == 0 statement
    - add TRIGGER_NETDEV_LINK to DAP8211R_LED_SUPPORTED_TRG for dap8211r_led_hw_is_supported()
    - clean up switch (index) statements
  v1:
    - https://lore.kernel.org/all/20261113110546.173624-1-a.shimko.dev@gmail.com/T/#t

Artem Shimko (4):
  net: phy: dap8211r: fix kernel-doc comments for extended register
    helpers
  dt-bindings: net: dptel,dap8211r: add LED nodes
  net: phy: dap8211r: add extended register write helper
  net: phy: dap8211r: add PHY LED control support

 .../bindings/net/dptel,dap8211r.yaml          |  50 ++++
 drivers/net/phy/dap8211r.c                    | 243 +++++++++++++++++-
 2 files changed, 291 insertions(+), 2 deletions(-)

-- 
2.43.0

