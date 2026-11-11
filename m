Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377443;
	b=3u1VgSwjPCQ4RhPt2UqDAtS/WzstY0370ltbTfA9/QEmbkVp7gTTRwtrubNrkeski7YR
	 awuAg8QE4jkirfVdPY4jeRa5ASlQHunsZQl6HarsBbilOmqTN1fTGPD+oEkgyWP/yp033
	 Hhn/p9MS/L46Jd4aA99JeA+A286ZCdyjgbf0IP+HB/Z2H7N3f6p9cYzICOY4V7aZZQQdr
	 xcZcpdlUoZeSxk/xcE+HuidV6gxDvXEol8bP4n4i3KVPNUm95TDSZbrNv+s6ADbrL6UHQ
	 nCbq1VgK/Rr0RIgRDPk1d9kKok4774/1mRcKp+dRjvCLgwOSqc76whe3VeWZfJXW7SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6ru8G+wIXDhbYzwCyjB0a3S3bJNBpEm6tGNjXeNvjrU=;
	b=z8NADWDIsWt2791GigcgkUFT4I/1Arfl3zamI2+wIiPdhSCQKJp5Nw9ZDat8FI2/2Oyf
	 XfYu7D1RpmZsGyvJTQkJ5pY3XwEpI5HwT7uHWKPTs3rGaxnfHYTITkL3MIXUqZAoXfTDT
	 eczCZzO3C6nsWexBYqCq4J4dPAOhroaFiqi8rl6cXM9uLwlYsIXuxNSWnZG81T7vK2G+K
	 1wKsrMFYk6hAXqjnANYIifN8n8sxRu7kwABjbP1bxp90D1hlhKrYZvnjPlDjNxybX9fmp
	 V4+e3bkA7vDgunz4F5KaBYP+RqACFQQsuMDst2Yxu0EMnrXzBDNN668ayv1LMgQpcLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMPUkZWx;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E0C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5E0C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMPUkZWx
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1607250a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377442; x=1794982242; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ru8G+wIXDhbYzwCyjB0a3S3bJNBpEm6tGNjXeNvjrU=;
        b=nMPUkZWxTXOw3JvzBF3NOnXBuyHMY3sloUSrbI6h+JLFERmOtcFqAtMKbpwYblcJcm
         oL/1QsD7DVNXt4mceTAqqWgcUAOKKD0EL1O4l0tTv3jjBekPQPgsDC+A5dgN6sP8D2qQ
         c9JQHjN/cxswWAjnNY6/f3ynMQp+toEx/vI1Wy6EvO1AN0XR2+hM3dnkdR+UIFktf/KL
         IpkYiT4oREZ1Q0pYri2nqrU61eqCaVAPQQ4Nej3YMzXfN7SOlHmxTc9SCs1iPvye5xuD
         BzajfxnMjYbXO/meJP2EOfRWVw0DAgjQyfHyXztlVPZvRwqRy9ySrg831xsmIHKN8mhh
         YraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377442; x=1794982242;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ru8G+wIXDhbYzwCyjB0a3S3bJNBpEm6tGNjXeNvjrU=;
        b=I1o8UgdttVAIputiGtW/pdktwcQUGqDucyuKLhpeY/Zor8L9xThHQ9rOKvfRnHeylw
         zM5dzXBzyXIJ+/B3sIKCBFN+2NZORGzyHj+JeKazR4qmsGYtT0Cx3lraT4tDenm/5BZk
         C4fjr9N1mbnAcF9lRvimVWq55pz0G51KgwI9HdVJOnc/0R/kDhpWcvtS59UgWp28PbbZ
         HQybagXAvrV5GCaqMETl3m6icfiSGrUWlIL8DHRKCjpKrmGKz+ILLCk64CiHL/IezE04
         m86v8xdkn40pvleeAeaP92VpqLjauhEAJxSjiUemJ+SdtrvPgzK2Wim6w/AYOUWYbQHy
         XNQg==
X-Forwarded-Encrypted: i=1; AL+hErGi2mExZvXS4wA5DfEnu0guLMiGQmexJkqtb7NNjLF6S7hTwLI70v25ldAzM9bNKTx9z6pc9umeZbemWe8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ois+FQmPn9HxaxHinYkTiwGz9SWHcuo7/7ICmSOJniXkmr5tz
	iUrNziIH73kxe1LGvXHElL1ZOmADKAB52FN0vkd66LTKe/lEASpKNWDd
X-Gm-Gg: AYBFou1/BtZCkw+tis8Kzj4f7bhA4NuQevpgR9xeCp8OpqbD+++UmNVuTzW9YkR/ZaB
	nTG3MB9HG54cHRcX+qiofRWYAS4NaoB90eHeaLSaI1vQt/Iw3WdDe66zh8RBQ0tJQQMO+DjXKdR
	8x72c7v+r+DNcHGuhrxpHxsJkFJwAUAFPk549cmHBqu119/6qUhcKgpY+SaBm1YoswbSCt6fmTi
	1NFMMBAXarUdcyjvqtpwnS8JN9FI4zZAyl5kb6sZqVekf2HAqmIfMfwK12EsEwhkiPXTUa/WsC7
	CRw58XQxoRgBRAz+0dp8xXfu+p0LF1ajmU3BD/2U4+eeTotikBN5M0V4kRuIJJCOppuT71GVsbT
	XwayM4J2bpyQr32lcnP+ZN/S8s3yUTv196h+U8dcGsNvq0Q6nQNoS8DAgz3kvuC/XHamvpAC21u
	6kTJ8GVv0s3Lt3s4hRk+BjSY+WwPHWEMaQiHhOtrUry3JYveznl/HKeWp5p9HzmyxkYQVulf2TJ
	WSGUDR9cz6AVOwYDJ711UBFSdgP2FkoHv6hDVqm7zxVYxMWlAhPZWfM8+aWCb0PP+QL4VZZ5F9X
	4X0BUZof8kExnyanfLPnuEY8xmAPesbiGJA7+Eam/1jVUcaTBxh8glraIDdn05SMezmZ
X-Received: by 2002:a17:90b:518b:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b182f28620mr1681142a91.29.1794377442187;
        Tue, 10 Nov 2026 22:10:42 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:41 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v2 0/5] ARM: dts: aspeed: ventura2: Add ADCs and GPIO line
 names
Date: Wed, 11 Nov 2026 14:14:41 +0800
Message-Id: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIANEH9GoC/32NSwrDMAwFrxK0ropsSPpZ9R4lC9tREkHzwXZMS
 /Dd6+YAXc7Am7dDYC8c4F7t4DlJkGUuoE8VuNHMA6N0hUGTbpSiBhPPcfNGYxcDbmtnImNPZB3
 Viqy2UJar517eR/XZFh4lxMV/jpOkfvZ/LykktHSt2fHN9vXlMUxGXme3TNDmnL8eIuWptgAAA
 A==
X-Change-ID: 20261106-ventura2-dts-update-f00bc0510b2b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=UzoFWGQnfmpYqsdMkcV1qb1KoSKhE64W4DhfwwxJNuk=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af0PHWv50dwK50Uy1itNGP7amluCEuos33IJ
 m8+J887J8iJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9AAKCRClg0K3CVbE
 gZRhB/0S77Vr9H7trUM/qwYjhEcN9EtmC6SAmi4fnIDqkTAG+l3Eqye63n8IOtLe7b48MdNSsbl
 qifRmlBhCqswPil5JAdCsOEW9nST16A+6pZEiO0jU5TZoivNh/VZbGrdMnHPKV8N6T/ZgL9Fs0X
 V82DdR1/gQ+yJ83UbiQIQeZuC51KwIenWTQEWWqszLtDl3FIO3CqmuWA4JF/S31uVEfd3cgwWn1
 fIGjKtlB36OGnqOG3ljRqPEsEb4YR+ItMMaQWXB2xIYDcCTA92fICinPRGiIX65S2hZffCOMuWp
 4qP+FkignX2Q2cWH0lhE539UmhWlBfqIMqOOvz8IxtCe9oHu
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

This series adds hardware description that the Ventura2 devicetree
applied from v10 [1] left out. Patches 1-2 add the LTC2305 and ADS1015
ADCs. Patches 3-5 name GPIO lines that userspace uses to detect the
COMe module and to reset the USB-UART bridges and the 88E1512 PHY.

The LTC2305 ADCs use their internal reference and describe no
vref-supply, so patch 1 depends on [2]; without it, dtbs_check reports
a missing vref-supply.

[1] https://lore.kernel.org/r/20261016-ventura2_initial_dts-v10-0-a546659a084b@gmail.com
[2] https://lore.kernel.org/linux-iio/20261110-ltc2497-vref-optional-v1-1-35c9657f3c0f@gmail.com/

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v2:
- Added the ADS1015 ADC (patch 2) and the 88E1512 PHY reset GPIO name
  (patch 5).
- Reworked the cover letter. (Andrew)
- Linked the dt-bindings dependency.
- Link to v1: https://lore.kernel.org/r/20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com

---
Kyle Hsieh (5):
      ARM: dts: aspeed: ventura2: Add LTC2305 ADCs
      ARM: dts: aspeed: ventura2: Add ADS1015 ADC
      ARM: dts: aspeed: ventura2: Name the COMe presence GPIO
      ARM: dts: aspeed: ventura2: Name the USB-UART bridge reset GPIOs
      ARM: dts: aspeed: ventura2: Name the 88E1512 PHY reset GPIO

 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 45 ++++++++++++++++++++--
 1 file changed, 41 insertions(+), 4 deletions(-)
---
base-commit: f4dcbba2ec358f7079daddcda7594dad9746326a
change-id: 20261106-ventura2-dts-update-f00bc0510b2b

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

