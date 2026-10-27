Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136738;
	b=MiBmmmpqkbx9PHyF6RFbZvhlhdiyE/tcSI+RQjax8kQO9F5B5h7Es/VNjdXaYyv6CEpX
	 xAKICsWDZxpXhz1hWCYHZEttxKwcVs0qSsMtxCAUi7WoSl4n2SLKXh+614rHsmHW7QFfP
	 8+IwvHIZgq7CKwAPjf2K/7x744eAhPf/sLkjWkPcGErsI33SX/jsgxh+jqBLImfxXYMpn
	 YP67bZLMYHqQMT48sAOs2YUut2w+Eo6nbGZA8SrwOpAGo51j0KG9Rjg/HUyf8r1VaXI97
	 +YXcAAADXPwJPEbaw7EbuFmIxKdoPaB3xv1+3D3nf9+ES7mAQGrME/VqgvB2rMh/TkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=s8PGc3rV/nkDLjOBf3Blk9H7tWvd1KHQ/b+xwHLjFYE=;
	b=Ae8K5rdL9TmZYKIan3MVJdrcsJqwPbRsNR4nuWrC8wA1m6K+in/crReivONCarbwspIU
	 qOWh9S7TSbo6zj4z/70kbHy5u7EgANZgStd272725qeHxBIY+O0egv7AYvp9EBw7JEwq0
	 RLalJ6trYRvZGb6rq3ILrr/1qQVyuss0i6dIKz3XNmWRj2S17/2/g+NGemAgUaEAhKZg5
	 BxT4FgEOs7Hm05tT4jz7KLtnIDcG23YIJ2MW6gtR0wVFF5fQg66R4dCnPs3cB6s309l3o
	 yKZX9hzaybsB+mFR01Bc1TW1LS2bBw7yg6UHYmt5NvQTVqhGYUcQdMAvumVdbvD1txA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjfnSX9T;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F268A606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F268A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjfnSX9T
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535a54bed9so433146eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136737; x=1793741537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8PGc3rV/nkDLjOBf3Blk9H7tWvd1KHQ/b+xwHLjFYE=;
        b=sjfnSX9TUcA+Dwn/QuytXXbxVFg9QT5pJdQjYAD59bkWmVGLRXIfO/xgfmWHhM/OzV
         G0B8nZk4iPGQFtsnfP0wlJxXeTzjUXY/uAoPWCSS4E9DvxIUxlmImpWe/ekR8wGYoO6p
         U77vnURTnZsfv60X4Z9KDo43QTcIdDe/q05Z/8MgiVgXnKc+DO1N6/BqbW6jLXFNleRd
         2RPh9kZb59HvkJpGxKAcuWox3r3sXwE0M1YC9P6P1fyWN2BxWkj/LQxNqTgeDXGlxnhe
         FZ24IZrAoS+2dwE25JBB+L3pS6XPtDztNEgs/BSYpCEzXrCnv/+rEz5m7iUEPu/JZxtT
         REwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136737; x=1793741537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8PGc3rV/nkDLjOBf3Blk9H7tWvd1KHQ/b+xwHLjFYE=;
        b=Yo0WfdZpty++4D2kX/+EKE45KBffI3ZXmtf8U0AxXyqP/ah5QKijEnSWMqvI0iHl/J
         CF+gE6ycN41NxrPUhIPDFSJ3ABWlzZtSUYVSewNSelyhOvjVJhLOKpz2nGfzW7gE15ne
         13/uGKjuwsjJjhb2xE4B9rIXZ3xgR/eX/HVd0m0XBBO2hBn9Jyy5eUqVZxdA9pquauvi
         5QKk/ym+Ib/AhB2uwLsIdBkJ9gbSRgLEPf+4Rb7LZZDKQMepxAZ/vdLT3ppJAXc+nbIO
         IsUZs3Ebyhz+9+C0d/RUEUwtWbxLKtQC9o6rbWf0LT58RktW5V0y9Nsxsp4MVH4lY2zo
         fMWA==
X-Forwarded-Encrypted: i=1; AKwUvBxqejGMfoAlXiK5USrJWojdphCiN4MEOBI1tIPR8YXz8LhOl2q/gmEJmniqZCrpdxYFkxmtUwUmMJQZ590=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLqop0sqwd21VDguLSiiiByy0/pmLIIluqNY1bPtjgPN6Zth0w
	N17UUtLSNP34Oi2BIbPm4gy9o94PdUHWPTFJ7rJiGTCObUZBtLstjO/l
X-Gm-Gg: AYBFou1n9huzNifMgmm50P2iks+VewLR8L/cobGd5tttT8p0thDaZWAGtWV9AnWdwNC
	N0i6xid3+sdkXya4ZTQULfJgmbXaq0FSzvw6kqteujkAr9PFYaAoIjWMJ1T9XJgYbqJqk7FupiE
	Hiwn1zmvnTbVw01fb+4D6Ha7+ldtQ5VWLr3vjWWwoM2dQ+2h/1rhZfR2LQfUR2fPNbWHQ+JjnSY
	yZY/o2c6ZShBHHLdgV4KEwgRMWDM6ff6jijlpE5H/Ac9JJPomTG51sIKV7sCjoeDWNJPK/i7wjY
	Zz6PU+L0GQC11IWeebZC5tfp06c7/Y9cXc7qnyKAPpIhM7db0XtfdSspqE38//P4afXhzc/2FPB
	yAPhpjNqAXYbM1sJ3/RwMoTYdo/VjScxb87L0oIWUBE1ZZ6o0xliLq1NuJx36HYTCOQyjGHBj1O
	FypYfg0hUkxpEBJOeHl3bXZhxcVxYa5Tn6PgM9bAply5nSf5bYCaPKlsPEJqpwlNm3YkEK5msJ5
	4a7tfBSppeo2gVi5vH07wWrduHxrla/GVu2qFwCBtG0/r9Vl//VXIBdYFsJR1Oy7qfFbBr+P0HK
	hOluhlV4uCB9FH5xC/ZZKS07UpmQqtw3ySWSr7/y3hbk
X-Received: by 2002:a05:7301:fa0e:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-36a203d417emr1224861eec.23.1793136737039;
        Tue, 27 Oct 2026 14:32:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm61693125eec.25.2026.10.27.14.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:32:14 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2026 14:32:09 -0700
Subject: [PATCH v2 2/2] dt-bindings: mfd: twl4030-audio: document preferred
 name for external mute
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
Message-Id: <20261027-twl4030-extmute-v2-2-c7e0c90509a1@gmail.com>
References: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
In-Reply-To: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Peng Fan <peng.fan@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Proper names for GPIOs should use "-gpios" suffix. Now that the
twl4030 codec driver has been converted to use GPIO descriptors in
commit 178c169a30b0 ("ASoC: codec: twl4030: Convert to GPIO
descriptors"), update the binding documentation to list
"ti,hs_extmute-gpios" as the preferred property name and mark
"ti,hs_extmute_gpio" as deprecated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
index c9c3f7513ad4..399693bed077 100644
--- a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
@@ -39,10 +39,16 @@ properties:
         description:
           Enable the use of an external mute for headset pop reduction.
 
+      ti,hs_extmute-gpios:
+        description:
+          The GPIO specifier for the external mute control.
+        maxItems: 1
+
       ti,hs_extmute_gpio:
         $ref: /schemas/types.yaml#/definitions/phandle-array
         description:
-          The GPIO specifier for the external mute control.
+          Deprecated legacy name for ti,hs_extmute-gpios.
+        deprecated: true
         maxItems: 1
 
       ti,offset_cncl_path:

-- 
2.56.0.307.g5fe7bd680c-goog

