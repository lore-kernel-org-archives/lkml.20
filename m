Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8EC489894
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293116; cv=none; b=AeE66XHp61Q0QFYOyvwz5LOJ4BVcFeHAUeFPfIn4f9LlBKxRnXxXw/MqAfGJq9ZJ+Opzz4886u+RplR3G0GptBvqfewsHlKHKRK5bkSxzVUd1bFZdHQNLjFJwlTYwcWBuFmp3acwLNLwodRDWHk5pF1lAADLs4RWQWKmA8h3Wno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293116; c=relaxed/simple;
	bh=J0BNtkJI/I3krcl4EpRdmNeLqUX9RdjaWd+RI3SKMh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T5KLljonrGdsBZJtxjSrNPYQ5of5qIVjr6Ssyg9mjaiiBF1E2EjZiVwovDE6iqwd+fMgA9PsdwzzujkF273g62ATJTstoYhG4QDb/uyR3zmus1EqMUQcYQgaN2UybCSLTfjBzk21qCDyI1dxgLPil6k8Y4i2NQH34N0RWK19yQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdHmDfPH; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdHmDfPH"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so288340a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790293114; x=1790897914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1nVtiq5l8rv5NNM5qhW8MrGTTD+LOPVZgFHb8BuXNzc=;
        b=KdHmDfPHCZwFTBCXufO1Im3l0hUZ5hJlX8mQSgeMDSFqIe4OKQ0dleh65YyBmJ+a9f
         NhueGJIhAorOmKAoQ5yLa6+OaMdM14rbfBmauHIAzVaRb4/zf1CGiwtVpj9RgUw3Wd4D
         OYm9wpO4Yai6uS6SubK1rZUiZ+Rzub4KICqkJbPWqawsQ3sqYTlHrTnAIcE9gkIDPy+W
         TpFOhIZdsKIfbMZLlsMk7wdPh7kGK11NsmlVdqP3gVcNal5n7gj/2wouUMpgg7LbRnxi
         mWOBAIerdIFlwbKK11azxNtSHVFKE5eppYnoRZSsph4n8O4rMBscv7c2rTVSIkYGN+X6
         ZOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293114; x=1790897914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nVtiq5l8rv5NNM5qhW8MrGTTD+LOPVZgFHb8BuXNzc=;
        b=dy6pSD1y8Of7hurvcYHd4K9F6Nsw2FUVIAKrFwv3eTW1zCd8HpLIDIX91TGT4nMbmK
         /2YReRx1ZpNxoUi4AHXD3Yq3cCV0GN3Zz5s2bhvOgp+UOLCfUXwjUmnx9RdKKv/SZMlT
         N1jmNHyR/o1divD0iGZZ1kIV9Pcav+0lVEqZF4xpeaYcRNHepPiKvZ+TFKSiTBeYIow0
         UaCtG97popyfSzgDPLayufaxs+q7GzRjcmXvhOuop7nsYHf8tcpCdY4R61pq1hI9k9mf
         zK1kx+FThuLy1syQkIrK7LIJqoWHo3GtYlWKXy4fSx2sYGbFB8ZFYDRv31fNfbG6AMG9
         cq6w==
X-Forwarded-Encrypted: i=1; AKwUvBy2wPI7heJ0C0BK/+mf2/cKRpz28R6cczjMnxXhCRxQBiAGm5znaH9LiCbGBIRwwi1TTR4qqviPdj85R20=@vger.kernel.org
X-Gm-Message-State: AFuF++kUKZZAAV+fzcwDsy+OI/DiENrxh70hvGfgscIzeiTs83Nc0GdN
	xbQQHycUa1OZu3rNuxRGzjswFnpMgfNbvKk2fMok9+NpfnUogo4YdMMU
X-Gm-Gg: AYBFou3LL8LAb4dRfJPuESqB1IiUN6y+j0jfhrKR6jhnKttzwASilKHx4OqOKWC6+vf
	DZXnvEO+LVnpW//S1QBHufw4wK3D/dQK5Pdj3QwttbLhq/pEFOa3jKwkl36qCcEz7Q5M89Bmev0
	Dqn7Eg1rTrLVHCPp6/VHawedDQ/sl0CTaGV7m62GeTUjpXVkZlYDcpAY6qZdchUrq2XbjuKU7PM
	AazKfOehv/efZnlMsv8yCF3O6lr/j/42xtknXPLojrH619JqNiEWNB0lUl4qewSJ5W3vM/YjB7k
	bqGc0CjkoRIHG8s82msf3dfQ3Agiyi0MtyIre+H7zTMfYySJariV+vl+7mPou1E7uLZ3ZzWI/FB
	eAxTvUNGsq1b64TFtHowq/Mm+815raoE75brfYLTudfoS2ookgY3S69orwwaa0G3fpJK/jqZ3Pw
	JAhWWfw1e9ndM/lYtIVbYhTGlanNcao2hX7P4WuUop8ZxrX/oRVrPRu/BZNL4vnp39BfEnz11jq
	kchCMQexdBTrUiqclNf8COlCwDM5rqKSKbySW1RprkpJhAjLOtETDl0AXEx9oI94DNK0Ld2KY0v
	WioGxQwpVjZ38eHRy+A3RlYWgxCLIjmRhPCmpbZmejgTwiGb
X-Received: by 2002:a17:90b:2dc3:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3a098da14d3mr3305369a91.36.1790293114266;
        Thu, 24 Sep 2026 16:38:34 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b7d11124sm1307931a91.10.2026.09.24.16.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:38:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3 0/2] usb: bcma: control VBUS via a regulator
Date: Thu, 24 Sep 2026 16:38:29 -0700
Message-ID: <20260924233831.127617-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcma-hcd currently drives the USB power line by grabbing the
undocumented "vcc-gpio" property from the controller node and poking
it through gpiolib. Besides relying on a non-standard binding, this
cannot work on boards such as the NETGEAR R7000 and R8000 where one
chipcommon GPIO powers both the USB2 and USB3 cores: the two
controllers each request that GPIO exclusively, so the second one
fails with -EBUSY and its port stays dead.

Instead, switch the driver to the standard regulator interface and
express the power rails as regulator-fixed nodes bound to the
chipcommon GPIOs. The regulator core reference-counts enable/disable
requests, letting both controllers share one GPIO without conflicts.

v3: don't drop GPIO.
v2: fixup dts and keep GPIO working.

Rosen Penev (2):
  usb: bcma: add regulator support
  ARM: dts: broadcom: model USB VBUS power with regulator-fixed

 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 12 +++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 23 +++++++-
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 23 +++++++-
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 12 +++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 12 +++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 12 +++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 12 +++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 12 +++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 12 +++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 12 +++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 13 ++++-
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 24 +++++++-
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 14 ++++-
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 14 ++++-
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 24 +++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 12 +++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 12 +++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 12 +++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 24 +++++++-
 .../broadcom/bcm47094-linksys-panamera.dts    | 24 +++++++-
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 12 +++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 12 +++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 12 +++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 12 +++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 12 +++-
 drivers/usb/host/bcma-hcd.c                   | 55 +++++++++++++++----
 26 files changed, 384 insertions(+), 46 deletions(-)

-- 
2.55.0

