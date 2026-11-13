Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585901;
	b=FApXU1qACoItlsILP1b6Lb7QhWYx9xMH0WU/mSC+myu0ZvWKz+obPQ+LKxd8mgZiM6fG
	 3T8y95Q4EFxEGzTkD4uuTy5E8dWfhMaxCbGlA82tu2xutITY19/Xf1rAJE5tsp6L1k8uW
	 XGDlBjBKXM/UfSOk+LENvrEtVRm8SMTn14eg154bYuqL8dbO6oi/dcQFT00Vtlgq6V+fL
	 fhwhJiWHwU+cwIIC+7VN3WkFmkGxGoyOTokwLmWgDT1OLlGltYvPhtXNGN/rHQAzD7sC9
	 rLM+Xid+EaJzowY3/DUbWryho2HYzSoPg3+/aAs0wLj4Lw04UgnX8uNM2b+kC/x6R6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=HwMUb4dEkzr3j3kYrSUeFqOaaM2WvdCtqrwakPH61UQ=;
	b=DCZDwcPE9kdq+OBLbuSiIVudiXE2uRxsmL4t195OZiWrGl2iwWeDeE61w7gKfIA6Hyo6
	 JZw0ru7mtrVTX6baIcV6fqYflKBCeg50IXXWZqHyRYAPW4vK1ND4T3Dpz9rcIWkVB4O/B
	 pPxlsTsr/EKkw1jpwQqZuu4M8JrGHUwcSKi0FZ/hD9mS+u0g1nFxekqvQA4eFhRfq1ndg
	 OZm05gbN/XMTIBEJpO9eB/5u7iQXzx3MxsbedguyqWGM6OIt+Yq3rFVRFf81wVMlsM8DE
	 zMhiA8LWD6mKI6wRkpbLnKZJeCih7lVZX2Pco92z9gSGJDPbLyKGhXttYml2JcmkQMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=TMizCCmw;
	arc=none smtp.remote-ip=74.125.228.71
Received: from mail-ed2-f7.google.com (mail-ed2-f7.google.com [74.125.228.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27CA606FFD5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F27CA606FFD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=TMizCCmw
Received: by mail-ed2-f7.google.com with SMTP id 4fb4d7f45d1cf-6b587ca1306so662604a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794585898; x=1795190698; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HwMUb4dEkzr3j3kYrSUeFqOaaM2WvdCtqrwakPH61UQ=;
        b=TMizCCmwf8mG/JV9eviD9QSmLpeGVHgmSZsbfOa8NLMU8Cpo5WfKMUv5tUSq40GbS6
         NW4O3S+jnsPLGnT4w4iq0qzMEYdjeX2nbriDhkrMAHHfJQ698tj7hGF7R0M8jC3rd2iO
         SkoVNWx48RiYRJ47mP4wm2SHgzlALTJyfvl0pMNE1mauqdQ2uvGhABKBFyFE8GN3JfJI
         l8kN7akXW9XitcAD6G0l6ZlbSoW+JSzA67VXa1FIGwJt+qRprMEVYNPy7gzNiIxNS6gm
         WZKvHmW3b0NrID67oek21Rl6lvTGGiN494NIjDdFneMtyDg5W5w1StgNvvCuJnD4YOzF
         3cAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585898; x=1795190698;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HwMUb4dEkzr3j3kYrSUeFqOaaM2WvdCtqrwakPH61UQ=;
        b=qpouQvFVOoukBm2x4tB89BaTgdWD4RG3QHEXe1b093wN2tuR9wA7G47nlEB+ax6lsF
         5bFlz3sdMve6ljaQg5/CWaQuId1jWmAueVk1v/6MZevgYzvXh9K/5aAzaTtM2cdOdwB4
         4NHEdQNT6pj+jpN2W8izFhgZWh/e8fU66VVGLiGCURAMAK2coHlFMp5/F+ZKrWKmr1Bp
         1NgABM4XWpkKTd9Ge7sbs3WzMqr5ojrmJSKFIqG0M5d2pIYo1/NPFeXerjZCZtHDi/sP
         TYzSdVS96g6fu8acaw5MJuo3LW3k9ioVY0sydedGdk3/nOxbNXARVA0kw94nOthZuTnO
         JYOg==
X-Forwarded-Encrypted: i=1; AL+hErEUYR+citybTtwQnrDm+/AGfrI3z98BpMrc502s4XnVHJTATVPr1hqCXTNSJvpigGTZ82UGM9zMwp1G6z4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IcRIv77YQ/14LPDNkbTnXpnvzJhrLyiVtUT3SlA3ds9uZBatO
	ACF2jckbVP9ANsouIY4iCw+OBbWx6kbOmUY1dPu30OC/mvfbrJUgjFftbaS3vhLPgQw=
X-Gm-Gg: AYBFou1zIDJYh1nr2VvACTy2fun+g8e3b058J0FPodumAmJLkeXrgSCgo9FWQwehAmZ
	z784gajSRbItYLu3GulKFqcDeVAAVT4pxDlgukOn5nJyrHvUvNgPm7ngGJ/6U9cN5M0CM6ZZ8WV
	9I1CRztr2wWvbNGqhDgIqVQdVFb5LBNjfOUl+PGTkiW92Pcpzj9CRS7Y+jfPxKZkMWGv7xHoxcB
	fA/oaGvXvwOAE8SNrbyCPVyF8FMPnpSzHhqoT8MdOU9G6aKs7frp4R11ug/2kSpZETpwB7FDz/C
	de/f2ig76I83MfAsOgWYyY0abo+L6duxqAk2MIvYUfefumQEVVf0BCOPpJZUfMiBOrHXjVdsHBa
	obkUldfw98G/FefUf6/QKrRJBAvqQQnIjTkLQTQeV72wzfEro2DEc2nWR54Aq3uzHqImNgpg6nz
	jqa9u3gJKe56lKoA16Txteqc5+aGD//3AiY79wOL/1DABzCQd5ftUfSPE9TZSZpGPXQKCo3d68p
	SiwlISWOq4BKy5TJzs0zhKo8f/RURyqjp92HPApEEHxV7JlvVQXPJcDg/TqxT00YjBBmAakL0vd
	k402XgS+LAA2SyqkzhJfvsabgylc8n8LwJcycxuvVa+fmRt1pL6caYBiLkMPRRKVYOHGXUasjtD
	VlEjzj48=
X-Received: by 2002:a05:6402:e9d:b0:6b4:9c38:a990 with SMTP id 4fb4d7f45d1cf-6b7c0c75afbmr2983164a12.31.1794585898224;
        Fri, 13 Nov 2026 08:04:58 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm1123946a12.36.2026.11.13.08.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:04:57 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/5] Battery temperature ADC plumbing on Qualcomm
 platforms
Date: Fri, 13 Nov 2026 16:56:41 +0100
Message-Id: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Oyw6CMBAF0F8hXTumLZQUV/6HcdHHVLrgYVsJh
 vDvVogb4uzuJPfMLCRi8BjJpVhIwMlHP/Q5lKeCmFb1DwRvcyaccsEoo6BVgoTdCMoakKJstKN
 aCm1IrowBnZ837nbfc8DnK6tpXxKtIoIZus6nS9HjnCDLNctDvoXWxzSE9/bOxLbG/8sTAwpWM
 DSyEVaZ+uqUD2M79HjO/IZN/AfUlPMjwDPgsKzQVqikYEdgXdcPJZAI/x4BAAA=
X-Change-ID: 20251010-bat-temp-adc-8539bf0b85bc
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585895; l=2567;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=AnCETj31XseSXn+d00dwl6t6SQEdfssfzEz2saX1ad4=;
 b=B1fAUfgQCruIJjGIq6oviNi2fMjyU85Otv492YGAgSOdFhXiv+VZQXayVf13n0Q3YFM8+/zB+
 WQwi6BTRzcyAnpZTL2e1Z2TszEbZKLJv/y8QbvXZ0G4dhmqQIRrjgEB
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

This implements a solution to get battery temperature readings working
on (for example) smartphones with Qualcomm SoCs.

The solution chosen in downstream Qualcomm kernels is exposing
ADC_BAT_THERM_PU* in the ADC driver as temperature channels with the
lookup table ("struct vadc_map_pt") for the specific NTC found in a
device's battery patched to adjust the lookup table. Patching a kernel
per-device is obviously nothing we can put upstream.

The high level solution proposed here:
* ADC driver provides temperature channel in (milli)volt as IIO channel
* generic-adc-thermal driver converts voltage to temperature based on
  provided lookup table from DT (driver has one IIO channel input, one
  IIO channel output)
* The fuel gauge driver can use that temperature IIO channel to expose
  battery temperature via the power supply device

See RFC for other variants or alternatives considered.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Expand commit message on dt-bindings patch (Rob)
- Some commit message improvements in generic-adc patch (Andy)
- Fix dt node location, move higher up (Konrad)
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com

Changes in v2:
- Rebase on linux-next (a different patch to add IIO to
  generic-adc-thermal has already landed upstream)
- Un-mark as RFC
- Link to v1: https://lore.kernel.org/r/20251010-bat-temp-adc-v1-0-d51ec895dac6@fairphone.com

---
Luca Weiss (5):
      iio: adc: qcom-spmi-adc5: Add battery thermal channels
      dt-bindings: thermal: generic-adc: Document #io-channel-cells
      thermal/drivers/generic-adc: Allow probe without TZ registration
      arm64: dts: qcom: pm7250b: Define battery temperature ADC channels
      arm64: dts: qcom: sm7225-fairphone-fp4: Add battery temperature node

 .../bindings/thermal/generic-adc-thermal.yaml      |  4 ++
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              | 24 +++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 83 ++++++++++++++++++++++
 drivers/iio/adc/qcom-spmi-adc5.c                   |  6 ++
 drivers/iio/adc/qcom-vadc-common.c                 | 16 +++++
 drivers/thermal/thermal-generic-adc.c              | 20 +++---
 include/linux/iio/adc/qcom-vadc-common.h           |  3 +
 7 files changed, 147 insertions(+), 9 deletions(-)
---
base-commit: 6aa7dbf8ad5ebd3babf53a4d6209018f86939f17
change-id: 20251010-bat-temp-adc-8539bf0b85bc

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

