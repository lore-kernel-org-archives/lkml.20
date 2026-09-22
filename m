Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95E6544D72
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081487; cv=none; b=fvT/Jk/WBWHKZhdOBH77pu50EWYD1WWC8Lb1uIuv0sP5pZqnKpFsgTL5L66VMraebqvURjGhDYCsN8qFaEVmrBjlnP1EZI1vE+plXI/d7/23PRqetNThaC63iqJDiDHURdC5JptBxW3Qu1DD9mz+Uf/HmAygxwGzMZIAcsQnoi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081487; c=relaxed/simple;
	bh=1kHbxrDHDoV9Gp60u40KYuFmL3SJ83etztT12QoTrqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dQYbpF8AlfZa6WWLl2H0OkxOtV0QRyY1U46+pLQQ6lovY8/mahvUvdeDXIHd6wYBYGuk+moR4XhG6ZJo5erf8y6Fcnr9jIyi3cl+ScOEXv5dBRAIJ24Ti8XrCidNXjPYC4OHUQP40FWwsvVHR/C8ntW+BMosKWT+2X0/GFQ0iM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=rmIJxAwj; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="rmIJxAwj"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso5579669a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790081484; x=1790686284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeLYcx3Gh4T3X/EaL6eH6T1aKZ2rWDMD/NMdqi5KPPc=;
        b=rmIJxAwjZbp1FAQiAxMMdS6POa26n7tjmKVGS6jEHw+edXVF1sHmvTKH5o6s4m69Oi
         FdI87YhpON3WtCu1V56tgBnSBsKUTDKjcdQQ1jZcoqHg4CAPBH4re0TfxjYk095zKz0s
         6xbVVZibE68eirahXlTpNNgQ+fs/QGfNCZeHk8M3BNcX0Bhu3iDp8SX8SMHMuZ262y0p
         amHcdh3iNf/g2nHXujRvgdf8E8+UNic55WTOtNamTRe0dcvG1UCxYoE4GR1jIu6ceq+V
         gahzkfqB5SFfrKmzUvZtp7dhofe7E15ksp7BRXtOKFMD92XFfxZPjRDM1ZVzyjn9Han7
         rE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081484; x=1790686284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeLYcx3Gh4T3X/EaL6eH6T1aKZ2rWDMD/NMdqi5KPPc=;
        b=yMW2Fy3bEpvILUEgPxJZShCeiM3X8p4tKFXfCE7lkvFuEf5lPkoEXmFHqPr5mzEEi+
         AHBpjo7TK45DEKQ9yWvQY6lEcqw922ikdGj687dj65gLw4vwBtF2VeItz74Bbz01hv4t
         OVHg2RQli6TU6dzagr4+GeIKnOw/e5VfdqcPfTbeUst+kdysbZwhd0zPz4pShyBV226d
         opUuaoFeqZX2PXZWg/jjlsDUROJEWPvtNBjcMvj3Yz/y2GUHmzUlLQksX06cz8rWuhbe
         ZG6twRaubgFmpJVImuP+qX2Ak90mdoqoWxqQIbKo7nq/qcSIsZ8+u03Q/pwr7r//+L9j
         0UiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrFAaBgLSGmjR6N65UnYb1o1nHVgRWELcF1tzq6TfKjaFvvxLiL5roqNPhKATaw4HBBhPN3AZ9rws4pOU=@vger.kernel.org
X-Gm-Message-State: AFuF++kaqFLVENk3GYYhicpnj547Pf/8suBJFUF/9o/cyF62tHPy4FaS
	jD+Z/RVydFVvqm0AmdL6htHQgLH0isu2QVcibaQFJX4jGx3Hn5Huy1DWrgQOGhh2F4o=
X-Gm-Gg: AYBFou1Fd0AKTRx/M0opavgjoXw4qJ1PHZMCPlw003dGD73YgP3qXqB1rE1RDZrAlL2
	+tsD5yPnAszj8c/TQDie2bYNLEvktXnZoePKX7VIfQofIvOuLzgUkwAOFu0dcX3dZuuXaL0ltoh
	/gExZ8EU2LAs+BBGnChDkD6FfQD0KyB9AuJp7PryFazKeYgzn1VtlbNUTLtob8ZaJagBzBONG5i
	IdRK0TknjEbuQ4q2zFf3IyUZtmJlYiaxjF1ooSJnXAU2oYVZHGH8FVjpIngcYjOnqmpkoH+z/cF
	hZiPfUFvkg475ykGieJ/JoZjcHG40f2QXISSUyAEF3q+2XAvgn4rUhCL1cJoqh11oJfautp5jp8
	djUPabT3gXne8XlPFFaJUHQenZv7eaGFLW8XJK2cDyhXDFDm9Nzkk6mq5yUMQMnPGTxoahXhN5M
	eEmV9qVBO/wCHOIMXJe/aKn8q5ItcoJixKxhOJYdigUO2QUmX1WIQXOZFx6EyKd/Q4UDPVlrJwd
	D9WXeKp01xTqWm/eC744QEuijcEo0GztIcObhiFVFcWCgNI/4r1WIXZwmVJH5Ff4SsNIokph1U7
	NW/+DjPloxEAVpG/vKXIFSDB0joR8F4kEyc3NZo=
X-Received: by 2002:a05:6402:23cb:b0:6a9:a628:1402 with SMTP id 4fb4d7f45d1cf-6aa545f2154mr9706503a12.6.1790081483728;
        Tue, 22 Sep 2026 05:51:23 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-163.xnet.hr. [88.207.14.163])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa44d1aa9sm989196a12.10.2026.09.22.05.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:51:23 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next] net: lan969x: correct RGMII port mapping index
Date: Tue, 22 Sep 2026 14:50:37 +0200
Message-ID: <20260922125112.2111256-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the lan969x_port_dev_mapping does not check for RGMII ports
and just returns the physical port index.

However, this does not work for RGMII ports as they have dedicated DEVRGMII
register space with an dedicated instance per RGMII port.

So, check if requested port index is an RGMII port and return the correct
DEVRGMII index.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
index f3a9c71bea36a..bf5320c7a6ca8 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
@@ -142,6 +142,15 @@ static u32 lan969x_get_dev_mode_bit(struct sparx5 *sparx5, int port)
 
 static u32 lan969x_port_dev_mapping(struct sparx5 *sparx5, int port)
 {
+	if (lan969x_port_is_rgmii(port)) {
+		switch (port) {
+		case 28:
+			return 0;
+		case 29:
+			return 1;
+		}
+	}
+
 	if (lan969x_port_is_5g(port)) {
 		switch (port) {
 		case 9:
-- 
2.55.0

