Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934214;
	b=2g1VuWitssX4d64gN1PMmAuVQBx/6lZeh95CSTnejcZ3bNGopUFR2bKwRX9G5XbaIl1j
	 v6znJ9iItc9qt5Pw9DbTh4BLCzxHEml3BZlEZrpI5TEkBIn57D+xQDO59/sgb0L6oBTXG
	 h0C0/+2zgoGZU8ZDWCMSTrWqCTt5b0Q64Tvq4a0eYDCVRHFI8U31vJB/4KOkgP0X+4STB
	 Jy1qQQHoIPgrtHT5OxLYC5ufuJTXNfTqYtX59s/BW0IZrZPJI79oKfzF1jyp5oGe9QlCs
	 3zhOVmLduMcbqfH+w5MqxBhPv5Z5WCtM4QlOKZYnKZmmKlFn7PnAvXUIYqhsxPZf+BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ASBwV8LCp1C0yRJR8yBz3HjgWmYNCn4cK28x1+h41Lw=;
	b=2GEWvtSrkdvmXlC3EKuezQTWKf+htZwqbeaSuG/SymQKsB/DnaBdT5HeBFD3OuI6+0Xd
	 dYW4MpDekluBl93zanKgVbaXTT+N09Byzbqt9vT1KrWNoV8HVtHfXORaejm/rcN6ZMgPH
	 nj4virlBePUSrjeXd8WPticL2f2HzosiOv7np8IUVo9USka+ZVNigCZkUZGqQml4k+LBH
	 +9DlqlKWEn9DVgZIgYndvXuCyF7S634W71kmG+m/EYL8NmfYMGGpzL1XdBZWtexNbYC4M
	 NvOP8D2qpMhNFqpTnA/TbhwVtSPx1OBWw2LM9dPsWSe0BRtxpCHT1dmUwu0MC/wD6Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvxhUFr4;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51183606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51183606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvxhUFr4
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso71775a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934213; x=1794539013; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ASBwV8LCp1C0yRJR8yBz3HjgWmYNCn4cK28x1+h41Lw=;
        b=hvxhUFr4QjKLHfZ4TfBmndqMtfmUMH9y1aDEo2cjz21vhoOIPOFcX7QMM97SXJN3d0
         Q+EdwTbjLM9sqGm341TNsr2i1j78I8Vg4QSgCEQQbn0+oOkrVvwpdl5/BeWFhm2Zq/xz
         eNS5fCJLuEZHL2hDGciZKsxDUrR/OdyfNEAqnmkpz/txOfwTN9TIjQXao9HzON/PITiO
         l6DA+Tjjn/o5ilJ/ZbNRByM6hEIUFFmZyluaoK9vsED1Goxnqu0m2AL6zMwK2ghWVoKw
         uS1HEM9+32te/UQ1p6oCAGtg2IUCyH0/TVyAcnV75lkO6cSEStRoxEt+OKWanhl3U5U8
         rIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934213; x=1794539013;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ASBwV8LCp1C0yRJR8yBz3HjgWmYNCn4cK28x1+h41Lw=;
        b=P64G6SUzCro29HpLLal0lFFi3IFLsY/dXgjZtxiAEjbf93t1IwWXjvNm28rC8Fe8ye
         0Je8afetoPsNv363aCjT1zazKv9NSXWpLPMa4gC+iOf4GSQ0w8jyiu6fvxlQBbTmdwKg
         EksZTm3ac6FWZ7eVKzsMeqWb6vXlrn5Rgst2XYOfrufLCgPbnP/w2RNyjmrQbwQM0Xc6
         nQxiIFGd2FgCGlHzbw4UYZ2v3Emz5qMAhFOD7AAOqEpDQNpI1y/R7JAbZi/bd8mP+vF5
         anXsa8rkh4/bFUfy1M3SlvONUNDsKBxaCnWxja2BFagEflwWGHfKd/UlE3/xr9Gc6pen
         9J+Q==
X-Forwarded-Encrypted: i=1; AL+hErET+R5EtztpnNzBt11KxEWerP/0VyN7NPzVwIqMJLOa0AWKq/+ZNndZJuCmzbmsMf+SmAwYM2ZFkkf5pvw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2tMf8/e1b1y+HjxUm9wQnKY6xHxiKPGiOkuwxwKdVIehJ/58X
	E+KhXf5pbr4bvzpCM/RMvFNdm5UfmlBQHV6gwwn4hMZdQzOEkUVH60QcxkYrQw==
X-Gm-Gg: AYBFou1KrEBPfP4LR1WLtgO9IB9+7K89RIgwXyjVnpghiXUmVD2rKd8Uo3N4xRE8Lgu
	58oRe2RlGS+SOOHYPXy123Njo4Bi0/VjZ4ohH/73xVfJxpjKY4Ctn928aH8aCrKhqvqdt5My/M1
	QdcldsSJ741Jw2lVifotLcFhdqSn+sye759h+OA5CmNrAn52nYr+xApLTPmA6ShxTmAOWQ5Wzqf
	q2h58U11fB1zlFFIyay/OdzCyWBEGiE7CVRBHbRFD4TcIMm/zYCBEQTieXzUUL2MGQgA0WLEFIs
	LqVjKSqoOf6/GCEn5vYuPbYMf+GgETPCti0XoGXwsUw6GgcvWO4hKpNcCITXih4Hc6ZPO7qJmNi
	AcCZlzz3srl6ef1xjQNtD2hXHoZmb63U1c4vVY2i6fVSU7b+v36lYSvrplihXr7/2FUD0+h9BKb
	xNhn1iM8IO9HIj1yU7k8PiqK0QxMf5W+iBstPj17wdGC5piOIQNvMXdsx7F2+6a5bDz2qGtfhzy
	d76MrTLLgrImaeoYbkQA9Z8NtFU/FXPthoiPFuidUxp61BvElY1it19UYA9WDDZ7Aef57AOMoeB
	LBZpi3w137Ky1rf4rZhkjLl2qRwCrtptckcaWF0WPJBQVjQ6V5SdzSclGsieAFECOMft
X-Received: by 2002:a17:90b:580b:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3b0db5f1545mr1108730a91.7.1793934213421;
        Thu, 05 Nov 2026 19:03:33 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a04a39sm118179a12.15.2026.11.05.19.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:03:32 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH 0/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs and GPIO
 line names
Date: Fri, 06 Nov 2026 11:08:01 +0800
Message-Id: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAJFE7WoC/x3MPQqAMAxA4atIZgNpwQ5eRRxaGzVLLf1DEO9uc
 fyG9x7InIQzzMMDiZtkuUKHGgfYThsORvHdoEkbpchg41Bqshp9yVijt4VxJ3IbTYqcdtDLmHi
 X+78u6/t+L/W3CmUAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=lolMIAz2iXzBafL/lg43sfocr/VCB+03ulE0SYBkY9w=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq7USVOT8QeKuwr2nO937gkCr2m3czU+Kauuu5R
 Ff/aIhYg0iJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCau1ElQAKCRClg0K3CVbE
 gSf8B/oD1Abx+lgUrMKZp4jqZ4rjfgY7XYOnLkKCQ+AcALPfduyJpsZtMbx22AX5KN7PzEfQHAA
 Q/SfNl0TNPYfvUrUY9jUMgDnO2Q4tmpGbYnknhRIhO74j83UJE6qZtY6ysbkRBXyAO80TDR69al
 QoCoo5LgWgHJFakOvIAssoBw1hLpXHVf9rZOLBp0vNML9TG5qTy1zyzhm8bgi15lHbyGh1ddT7t
 74jl3hmLFNxdocqFABdW5mmyXJiASzCHyGk0qj46Q62UgfFppPcNSagfBYWBcpjCnQtjEcDXyrJ
 E1PXGhN1Gkjzahj/sAwoDUy9ljzq0acArWGGeWU+98BbEuW1
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

This series is a follow-up to the Ventura2 devicetree.

Patch 1 describes the three LTC2305 ADCs fitted on Ventura2 and exposes
the valve voltages read by the bus 3 ADCs through iio-hwmon.

The LTC2305 ADCs use their internal 4.096V reference, so no vref-supply
is described. Patch 1 therefore depends on "dt-bindings: iio: adc:
ltc2497: Make vref-supply optional for LTC2305/LTC2309"; without it,
dtbs_check reports a missing vref-supply for the LTC2305 nodes.

Patch 2 names the presence detect GPIO of the optional COM Express
module so userspace can determine whether the module is present.

Patch 3 names the reset GPIOs of the three USB-to-UART bridges so
userspace can reset the bridges.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Kyle Hsieh (3):
      ARM: dts: aspeed: ventura2: Add LTC2305 ADCs
      ARM: dts: aspeed: ventura2: Name the COMe presence GPIO
      ARM: dts: aspeed: ventura2: Name the USB-UART bridge reset GPIOs

 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 36 ++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)
---
base-commit: f4dcbba2ec358f7079daddcda7594dad9746326a
change-id: 20261106-ventura2-dts-update-f00bc0510b2b

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

