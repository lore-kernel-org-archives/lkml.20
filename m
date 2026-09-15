Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE4E3F484B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462150; cv=none; b=hE9paPqMMaDaLLVz0uCZwuw56dNr/tHlkZ2pTmAmVQQuAr3gZ8VeqiuunfWPyx0lR5jz8M0fyJtgZ2kaXj4isgkWzEwq6NCPNm31eL0GZU4DZI7BQTOStsDa7AjEtznAxqfMhtF/Nocp2tbQqYGvBWGgY8Y2uB3T+KDpRsE0Axk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462150; c=relaxed/simple;
	bh=mESwcUgnY4hSuLD5wUfdmAvrd84CKeSJFHVV5uh2x24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m0p29mDtFgPjo+JWnvUJz/qVy7P07xao2RU+socSkrdLRyzaVe9J6zLcjsFfbtNV3iak3u080p7PJ23UxylxuNlCUc3YY8YHevst9/B2c3gSbqaOp/dNMJg/+/hPpUuesdBtSzRtuNIgdEW+t5yLTLIGVVe2kNfUQllale9LjSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMh+ErFI; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMh+ErFI"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294af0caa8so4526066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462145; x=1790066945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=91cDWVzZq62wwmW7HgfZRk/lOzzdMa8vn0rrhB9d7TI=;
        b=WMh+ErFIOzp+ESrO6ukFMpCsIbKECAWlngncFaUtwGlETK1y73eFs57MowX75YmU/a
         wrFS+0SxHmvDuEyo54/tE5bhwmlvNkxvMglTugX/AYmwLHmzdF6Vgm2pllqaGYtQQYw9
         /9Z3NeepOfywYgBtBaCMWw6jIBvwJwxNIUnmtF7XE/8jIDvjiseTdAj1081cCrFGiezU
         16d68dOEiSEe0USvZKdxdnjG2sYqsoCRIsBsieVu3cdKb4Lrs33JB1IDh5t9xchwvMdL
         DsZuZ1I+ClR99xJrOl8UQOf8CfjSw4RPgwWZF2MiYPIz7wmoLiFGGDKhUclfBBGVKzB2
         jL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462145; x=1790066945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91cDWVzZq62wwmW7HgfZRk/lOzzdMa8vn0rrhB9d7TI=;
        b=DquSZJpIznOl/X7g2L8xHvSmK8YbrAaDs7dmRLvaIJ5LTyZy3V/pVBPBYZF62INq45
         YZptj9oPMNWu3JtMEwfhg4t3sMexhUh4o8HBfgw/zO/FRZwzEDTkn+9cj6Q8suEk/0xO
         f3oJgCaw88aVM+p3ehJSLq1gElwXuBUJ2sTVvHRffdx9g6fT/H2vVtnc5pn5/mNq4nRA
         mgd61P23rgj74YazJo1yQJIPD4GAxIrQLNRcAx6Zlaumnlkybb3L6p1mPKk0/IsiCvZV
         ODmiMaDNKNv+WC+f7gQ4apgLbQcqY2LQzIrK72znvLOW5PHDp1zJv45YSIQuwgUgjGk7
         kaTA==
X-Forwarded-Encrypted: i=1; AKwUvBxBMruZ1NWDVE7qThM/fGmDgq9cKA0oTr55Oip5/BrwFo7DtGravKAuzt8hoC8CH8Vn0ba3oJi6RIqIdko=@vger.kernel.org
X-Gm-Message-State: AFuF++nOyamw/W0hLHY/x229QX5xCiKJhDgAnyDjPhilVD3VQEoto/rp
	XCV0009s1XsVf8YWJp3BNxEma6rlqxrzwVEDFUGBYbhLbXhTOqofv6QN
X-Gm-Gg: AYBFou1PUp/8v9MkgBcbfZNMg5wjCUA7qBSzNfLwAaR0qhLH5QJ0cssJNttNNcrw8EB
	W8uaLReHBSt9PVcF2HfWtmVMUUm+Yq9Bk59e4Ge1EjzNNHUENzJdDi2Vc9zvF2damdjhlIZ0TQU
	pSbBh9SAz1S4ri4DM0J4PPU+4Gex0Dw67SkvJTqClv1PaH+Vm4NiE++RkkyPSxLI6SzdHpx3m7y
	HcITmefzWxarY8dTdF2bPGavTQHEWhK1nzjEx9GdUt+7oUFkwb9M+wdgUgGNWZmbmxI0QDjm0H1
	a5dDpzhhFQYZV9Ad89OA0aBbPvZET1ReDPJVK4+64kWmb6XIYoSTQr2vkFEQGSf6Q9dcDneivUe
	Wl/zIYD/xtfEiXLEmPDuv/BLKUyaXvy+AhRaM2GNdUcN6fGRkwcc7FGcU1F/93J9TH5WH5Tj8Ki
	2rME9iO6F/LdD5147LXJpkJUAs/ujYPdPBR2tHTggYEa6unIkjpdud3sAzuxfSilH+Fc2NC1S4T
	a4LuKpubmZunwvFqNqhYtzRBLRRw6dG
X-Received: by 2002:a17:907:a689:b0:c20:1c9d:8d4b with SMTP id a640c23a62f3a-c29d7717430mr16781866b.2.1789462145411;
        Tue, 15 Sep 2026 01:49:05 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966067101sm552702966b.35.2026.09.15.01.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:49:04 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v4 0/3] Add Xiaomi 12 Lite 5G (taoyao) battery support
Date: Tue, 15 Sep 2026 10:48:58 +0200
Message-ID: <20260915084901.56622-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xiaomi 12 Lite 5G (taoyao) has an additional property with ID 12 that
breaks the parsing in qcom_battmgr. Fix that by introducing separate
maps for lookups properties in both directions.

The other approach that I tried is manual shifting properties:

+	if (battmgr->variant == QCOM_BATTMGR_TAOYAO && prop > BATT_CHG_CTRL_LIM_MAX)
+		prop++;
...
+		if (battmgr->variant == QCOM_BATTMGR_TAOYAO && property > BATT_CHG_CTRL_LIM_MAX + 1)
+			property--;

But I found that more obscure.

Will be happy to switch if the maintainers prefer this one.

Changes in v4:
- Added Konrad's r-b (patch #2)
- Dropped RFC tag

Changes in v3:
- Fix QCOM_BATTMGR_TAOYAO enum ordering (patch #2)
- Order in qcom_battmgr_of_variants[] is already right (no change)
- Revert the qcom,sm7325-pmic-glink SoC fallback (patch #1 and #3)
- Rephrased commit message (patch #3)
- Design question from v1/v2 still open: lookup tables vs. inline shift

Changes in v2:
- Keep the qcom,sm7325-pmic-glink SoC fallback in the compatible chain
  of the taoyao pmic-glink node (review feedback, patch #1 and #3)

Stanislav Zaikin (3):
  dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible
  power: supply: qcom_battmgr: add Xiaomi taoyao support
  arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific
    pmic-glink compatible

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  1 +
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    |  2 +-
 drivers/power/supply/qcom_battmgr.c           | 86 ++++++++++++++++++-
 3 files changed, 84 insertions(+), 5 deletions(-)

-- 
2.53.0

