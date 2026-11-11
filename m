Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426281;
	b=mr9JSg4oQsw4Anu0pJAyhR+LaFB4ufbX/8rtThu8k9cqX8tdSyirsBVAj6s3qDC8j/Xr
	 fPgvZ+ub8Y0iHFf3b2TAUinrxT/lEHvGUyzkj0COFYUvICIrqYewstA7/a+xFJAwY+ZS1
	 jHI75YsWvLwm0AWntfrM0sRpOojr5PPsZLh60Ni5TrYhJSFME2x2UY7Dl/Lxll8Dt56O3
	 g6LGaBTqu+b4zmo8s11TGzlpu71XPsFthCWJ9X+PogQAktdF0HoA+R1t+z4Op+TCNex2r
	 rZzdHhhuTF9hg8anGAAHMPsO/R0LMvMFKbgFuA3c5xK++H0A8ZgORL5BHliSB8FKang==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426281;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=yxDwlowRXj+Slu4vqivQluXlihnRgzelIMa72vyyFyg=;
	b=LlVQqo23KbTvj0bxUfpVCWb+XR0lSYOSpR/ZeX2kVhEC8U9T6S1fJf4YKxekS+eh+C1x
	 11uLuw54N/l4lUGxiYgm1ir+hBIx2hXCVnIxKvPnj0Xho6UHgwje9b33hw7+fii8qUu3i
	 P3AjdVDnS5U1q5qTkp6INbWSroPfLkR7WyNDUO6iLTozPTuy4nsSg2/W0cCEGmHrD5kXo
	 9Qy/boRjLs04X9hDwFmFcO+9CkLUm3q9nOMbncvrQwRNGx3eax1S2eOPiSrlzFkXEBYqU
	 c7itmQOxBtZOypbK41E9V5oa1TMC8PP9mPgTAvzQ56XUcYltIzBhtYSeoZor/i7JlTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HBFXkPmZ;
	arc=none smtp.remote-ip=74.125.82.99
Received: from mail-dl1-f99.google.com (mail-dl1-f99.google.com [74.125.82.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B59606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B59606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HBFXkPmZ
Received: by mail-dl1-f99.google.com with SMTP id a92af1059eb24-1438d9363fbso114430c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426280; x=1795031080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxDwlowRXj+Slu4vqivQluXlihnRgzelIMa72vyyFyg=;
        b=Kr9MEETi8DXigQRCb/mDETURx6J8rq83uQH8O9jH9w/qUpgl0ks4wUMR8S6xHG3o6c
         mtiUlmZ+jmHMQjAbb0Q5MtRJj4DVJYjZlHuPR4Lgc0+Nj4fvtwuqkQXAfBkNBiKHcXow
         X0/Dp9NmZuWDqsTJjANfJMikSicBD+E513Dac4804a5Pdoa4f0AApvSOhyJf4xO/19gQ
         d+FxMPgVjzGgpx2Goa4251vuWQVreq8UbKMljioDplNYLbw/5hOLITxQ/ozDH1wBaD7L
         iSTVt5MPcb1OqADcxS8LZBqhko0g/B8JV8+fCpYyOweO9CWi2wITGgfBeHl5yshoYudE
         wQ5w==
X-Forwarded-Encrypted: i=1; AL+hErGvTrW1P8ix4F0UfHTFYObgkzpgwKLTb8w42gUOk8ysVgDPjpVyVfD2LHvN+vZo+CLR8gVYNlvcWhnj3AM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jbvplYx8lZdk3hnG0IYtXkB94gpwhrulv5LKXLP5neS9eTqk3
	Y/EIOBewaXXIgl8XVpH32/VEeo0AdVVmkiEIRskQUHCgIt5p+YZkvF1zrVV+zW9IzRdsxqUhmdr
	oYSgPh1zX+BRjJkhJevR1PQk0pikpt3QrYqQ+mw3jpcJhEwAaz98cjee9z68NQ/2wC/MCZQ6rCa
	njmV6cNb1yaOqWpfYTsqBC8wxo873tB4RzXsP/uqzK4MNMUhQK6yn7HU0ViobLLCfsQ7A1YvFLF
	LxNAa4JvXDt/MG/
X-Gm-Gg: AYBFou1a49gsRkts/0scnSEADjIykfCSiJa+E2qROW4xeHtnU4jzN92HHUWtgK8w3hP
	60tSmuT6BB+SKrQbSnIe51HyeV1Uo3VL37PTnA2kU1ZadrNm8RPjvn3NdjK6nVKvDdZ5BgbBKyb
	dY4guQQapz+aGHOPq6HTjum/KL+oLqpGhJwM6sN0DT81KvbSZE8uhpjR8K+yztAGI6WAXpv29WM
	8B69e/ei/xvN4D/ZBV+5+7QYhZQ2zBhCEAhZPm+0gjrS9VyiLcakmID3YYw4BQ7sv5oo3FJkr2a
	aaRtn+zYuyiPKRukXRVallfpno9UWktfFMeBP6LHVqL1HgXJkMK3j9p7H6CJjFVSWfzrYz6FlrI
	NmPmvSXPTPgdEqpp78jpW/5G+2Kcoo3PxPitwmD/NwAnReAtg6qfirP9GqLs4x+BFtjpOAl8WXd
	yRsJmxP7zBzPtojU/b6E8j18lIJytjGtDu
X-Received: by 2002:a05:701b:42c5:10b0:14e:61bb:ec3d with SMTP id a92af1059eb24-1b4f5eb2338mr388075c88.16.1794426279362;
        Wed, 11 Nov 2026 11:44:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-1b3b55b94d5sm301491c88.2.2026.11.11.11.44.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso143798eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426277; x=1795031077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxDwlowRXj+Slu4vqivQluXlihnRgzelIMa72vyyFyg=;
        b=HBFXkPmZ4z1sEy4//jj5YWIesewdqhX+n5LKP/wpke704q2Gyb+J5Ss3tyU62FnDvS
         ypWo7OL1oRZ3oGk0rlKl928/jwonSgXWtf3lt0HKYILiwuq5wj4eIJA7VpUeF393Y9ii
         iHA9pImpAXWnuqACUONhgE3/CYVjivnn4wwMo=
X-Forwarded-Encrypted: i=1; AL+hErF4cK+cc2FudJckCO6apqyhz9GviZH1+WNaNWzAP811CrFe81NULhOdPyKkb+Vf75mmF1QXXZGzEHlwTxQ=@vger.kernel.org
X-Received: by 2002:a05:701b:2313:b0:13c:f65c:d5b5 with SMTP id a92af1059eb24-1b4f5ea8322mr355062c88.3.1794426277275;
        Wed, 11 Nov 2026 11:44:37 -0800 (PST)
X-Received: by 2002:a05:701b:2313:b0:13c:f65c:d5b5 with SMTP id a92af1059eb24-1b4f5ea8322mr355034c88.3.1794426276383;
        Wed, 11 Nov 2026 11:44:36 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:35 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v12 1/6] dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
Date: Wed, 11 Nov 2026 14:44:21 -0500
Message-Id: <20261111194426.1652644-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
References: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

keep-power-in-suspend is currently documented as SDIO-only, but the
requirement it describes -- preserving card power across a
suspend/resume cycle -- applies just as well to any card type. Drop
the SDIO-only restriction so eMMC and SD platforms can use it too.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 8b9b3b036129..2fc8e06d5ec9 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -301,7 +301,7 @@ properties:
   keep-power-in-suspend:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      SDIO only. Preserves card power during a suspend/resume cycle.
+      Preserves card power during a suspend/resume cycle.
 
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
