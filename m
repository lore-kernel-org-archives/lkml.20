Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217318;
	b=umPH9mYBd4XgKGc21yNr22k54kxMJBVPX4aK0sTralg55Zh5HElDoTUufejKOhyIcth4
	 23QFCMcrTujDk0peew0DQMvJ/7rB8iiXI/OT0KYUvAHKaQ7ihStEgVeVtBk1evRp6DS2L
	 MrqLn/Xk3n1ABuhqVZtXLp8+K6SasyJGuopplcr13yJlx5D1luVpO8OElQhm5LnUMp53U
	 WuNDyxFwufAimXZtIm6PrHURnBqtg43xmqv+jPZBlnM7TVlPHAerC4QYYalxTF94XDuWt
	 rHXhn7gxwnzMTnmvgw3aThylM7ZyU+rsOlhiLG0yz7jThSfclxXTe0h62Rxl5w5slxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=r93XzVB3Mw5/o9AS2aRrBAkJ8mfk7Pdmi+7Ik3SQfyM=;
	b=NgIn6LzJSicpIdNjoKdR7KKExJ2a9EokCZzSIM0VKXU0U7AS7e1yzseZgWWZyMb9VZgS
	 0CG15Gkdfngdj4Y2DUS0iNVKdSUyNDCESYMLbFZ61Zy/thP9EPR6dZi8A5bd2Wp86Tk+D
	 KlHwDOlZtBBHhbTsIA/agcX/dxWIM94U5hgP32eiqR77V1VnAymvYL+FtkyTe+G87Ozha
	 6jpJnGsP583ZqaNq2U6OMiiU7iZx9LEjElfPXrFIoN7S/Nsec68yl1k7j7u3v9A8STk5s
	 y+XXiI8B1mreG+i8Rzje7q+s6eoibXWgATbcDGfNiXQgH+tGhZEOblL1bivgaINNzIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=cD7VHbjy;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0817606D801
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0817606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=cD7VHbjy
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490a0e72588so318471f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794217316; x=1794822116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r93XzVB3Mw5/o9AS2aRrBAkJ8mfk7Pdmi+7Ik3SQfyM=;
        b=cD7VHbjytBeJwEopqcJf5o5WnJl1cuopzqLaPLHwX6UnqEzoAgozVPUH1ybMFXsLR3
         JlieyB6dDtKzefMui5xiHDk7hiz6zcSZqve8nSNFhTu7ENyul9ThsWQbWyC3vSn/sFsl
         GMAZSh7Gd0umBYIjbHCmUFkprpKQfOik9SMwvCYAR1jLJIclfj5RgeWyOs7kT38TpVto
         +0P5Fkd8BB9zwIKyG5PTImPlFlaL2kafuxRN7v6lYc4gB5rz2+kYYveZ3oi2kgH5jqxx
         bMD8qTrQIzUmBNcm2GtWW1bVBnOWhorXS5WiDIMgbhm/fgVlCQxRKOntq3hJQaeJm9zK
         ImSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217316; x=1794822116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r93XzVB3Mw5/o9AS2aRrBAkJ8mfk7Pdmi+7Ik3SQfyM=;
        b=GlHQ/QS6/ELDxx5tge1WemV6PWYi0JS4RbP2LnTPdetDJ8d1wxgHh/ZjSiX9j9lMWU
         Cwe2a0O6Au6MWEvH/lCYDDWOUsh7HvUbBBpUsIV4ynOQvlI12MLZK7LzLw7m/Lh0WUqH
         Nw/Y1lxgSJlYD4yc0PEjf7u2alQPP3VLjhuyY7PF4DHWnIFW8eR6YJBq6rI/K3N4Q8Sq
         jveFW5Z6PRAE6q4KMEgwAfngdHAJmS+Qak728eIKLwknM1v/Udi5nxA8aHYRx3xHxmtx
         mATugy/mFEk5fheYbHcrGe3dnCcRFrV9u/HMTd+RustUJ2a83JNuLZwYJfCYlSupFcxE
         t0NA==
X-Forwarded-Encrypted: i=1; AL+hErHkIi8wy+x/r+glRPkvx06im4b44qYFOfP/3TmoZPJVQPcjeZhXJlIqVJiqFbh3D1GnBuROJSiImk0KnYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y+qfYK4/TIq77f9KAi48AdStKR0BXVB/IirDX2AWOLtczQKGx
	WrqZtm5+hyscILkXerSeqoNyuXyGHbHqqtyN3d08h4AczlD86HpNkfadfTmScNI0f0k6fWOiTTC
	CV6/v6vo=
X-Gm-Gg: AYBFou26+AYuYylLI3Xz7f8p4WdxYllDHjvl3VYYN7usP5Rp8aQiYhkfIkuED9tCW4t
	BfSbUxOK3SHbXImT2nPGCDltcMAz6uAVd+WYRXpQE93rKjxR/jV9M5YcvjLQ8zcfr/H1IAX/wgW
	NbJMvQwIudJHFoBBg+0NwYRxlfqYQdLscNPDUMQmVYeK5SzoHudIcYRk5wJSUZDWq62Xv7PSAtJ
	oT2BNwUVtrDsNjq7+nvS0d1IkST0Djk4pOnj92WFaBLlH2QgFN7/MBzeQ/UtI3Zgpvs9IcPqxbR
	9TDSh5dzF5ZnJ8MxjlNj+/Oy1FwnRg2K16o5qXXr/Dvmd+0Ck9PUlMMrmBfgtp45rHZb85yvKx3
	EvbplxbldhFSUAKUK9rXsdyM5TOOrz2DKIMN0AQ0iGgLi3eLMMy1q6JbsiHw2nQe8RbP/H6DnCh
	vxWnYpIJpm36MpVrbk5DSBjdofFB9z1On4ouA2X5z0l9xexilKYiP/h2ZI+ZVRvSvzjy+3D812W
	aK5VFOKGIijT9M+idEFo2pmz10jP3KPfOaeLLQ5IvapA4LRqJYNFK4Of8V3VGFWmU5WLK8w4WR7
	CmErExvg3HKq2QQ2PYdh+r/USMwWmwGJp1Ita797HtA7iI4laiZWYMxKBhs7eAufY7qYFRK1wz9
	0JkJTU/cx
X-Received: by 2002:a5d:5e88:0:b0:48e:6674:3b2f with SMTP id ffacd0b85a97d-49585f85d15mr6285161f8f.51.1794217315632;
        Mon, 09 Nov 2026 01:41:55 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-496150c6e90sm7278409f8f.2.2026.11.09.01.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:41:55 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 09 Nov 2026 13:41:48 +0400
Subject: [PATCH 1/3] dt-bindings: power: supply: battery: Add a charging
 temperature range
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
Message-Id: <20261109-battery-charge-temp-range-v1-1-a967abd8b80c@flipper.net>
References: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
In-Reply-To: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5090; i=alchark@flipper.net;
 h=from:subject:message-id; bh=s+ij2ixxg0Tf+IvaKSSYEw/URZBHqSW+IbBNwTTaFNg=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9nBqv0Nq7YHdWVcC5PobOgwIB1VVbm5Zx829dfH7rt
 52zGThzOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqN15GhjlyUvNjgz4HnwlTjP52Nnz6+gcT/+vohly3ub4+pX2atiwjw6EF39c
 VHF8j9D67y1Tr7aYXZiESCqpH3KXsttpMeF5QwQcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Describe batteries rated for separate charging and discharging
temperature ranges, such as 0-45C for charging and -20-60C for
discharging, often with a reduced charge current near the ends of the
charging range: operating-range-celsius holds a single range, and
existing users read it both as the limit for any use of the battery and
as the limit for charging.

Add charge-temp-range-celsius for the charging range, falling back to
operating-range-celsius when absent, and state that
operating-range-celsius covers discharging. Add the charge current and
voltage to use between alert-celsius and the charging range limits, to
describe a reduced charge rate near those limits and none beyond them.

A missing half of an alert charge current and voltage pair falls back to
the matching constant-charge-* setting. alert-celsius is expected to fully
fall inside charge-temp-range-celsius, but when it does not,
charge-temp-range-celsius takes precedence to ensure no charge occurs
outside the allowed range.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/power/supply/battery.yaml  | 45 +++++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/battery.yaml b/Documentation/devicetree/bindings/power/supply/battery.yaml
index 9575ee1491bb..d2f2ed9a01fe 100644
--- a/Documentation/devicetree/bindings/power/supply/battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/battery.yaml
@@ -111,11 +111,21 @@ properties:
       for each of the battery capacity lookup table.
 
   operating-range-celsius:
-    description: operating temperature range of a battery
+    description: operating temperature range of a battery, in which it can be
+      discharged. Charging may be further restricted by
+      charge-temp-range-celsius.
     items:
       - description: minimum temperature at which battery can operate
       - description: maximum temperature at which battery can operate
 
+  charge-temp-range-celsius:
+    description: temperature range in which the battery can be charged, within
+      operating-range-celsius. If absent, the battery can be charged in all of
+      operating-range-celsius. Outside this range the battery is not charged.
+    items:
+      - description: minimum temperature at which battery can be charged
+      - description: maximum temperature at which battery can be charged
+
   ambient-celsius:
     description: safe range of ambient temperature
     items:
@@ -123,11 +133,39 @@ properties:
       - description: alert when ambient temperature is higher than this value
 
   alert-celsius:
-    description: safe range of battery temperature
+    description: safe range of battery temperature. Where a limit of this
+      range lies within charge-temp-range-celsius, the battery is charged
+      between the two limits with the alert-low-temp-charge-* or
+      alert-high-temp-charge-* settings. Each of those that is absent falls
+      back to the corresponding constant-charge-* setting.
     items:
       - description: alert when battery temperature is lower than this value
       - description: alert when battery temperature is higher than this value
 
+  alert-low-temp-charge-current-microamp:
+    description: charge current in place of
+      constant-charge-current-max-microamp, while the battery temperature is
+      between the lower limits of charge-temp-range-celsius and alert-celsius
+    minimum: 1
+
+  alert-low-temp-charge-voltage-microvolt:
+    description: charge voltage in place of
+      constant-charge-voltage-max-microvolt, while the battery temperature is
+      between the lower limits of charge-temp-range-celsius and alert-celsius
+    minimum: 1
+
+  alert-high-temp-charge-current-microamp:
+    description: charge current in place of
+      constant-charge-current-max-microamp, while the battery temperature is
+      between the upper limits of alert-celsius and charge-temp-range-celsius
+    minimum: 1
+
+  alert-high-temp-charge-voltage-microvolt:
+    description: charge voltage in place of
+      constant-charge-voltage-max-microvolt, while the battery temperature is
+      between the upper limits of alert-celsius and charge-temp-range-celsius
+    minimum: 1
+
   # The volt-drop* -properties describe voltage-drop for a battery, described
   # as VDROP in:
   # https://patentimages.storage.googleapis.com/6c/f5/17/c1d901c220f6a9/US20150032394A1.pdf
@@ -200,8 +238,11 @@ examples:
         ocv-capacity-table-2 = <4250000 100>, <4200000 95>, <4185000 90>;
         resistance-temp-table = <20 100>, <10 90>, <0 80>, <(-10) 60>;
         operating-range-celsius = <(-30) 50>;
+        charge-temp-range-celsius = <0 45>;
         ambient-celsius = <(-5) 50>;
         alert-celsius = <0 40>;
+        alert-high-temp-charge-current-microamp = <450000>;
+        alert-high-temp-charge-voltage-microvolt = <4100000>;
       };
 
       charger@11 {

-- 
2.56.0

