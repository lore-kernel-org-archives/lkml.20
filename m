Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649211;
	b=hJfONGvCnxDrhD8NXumereJD5qdtzGn9LS8EMA4ynS3rqtvz9AeELlHmDddMAjRjLBK/
	 TrtoRIBtluRuc4wHIMEOfpjmw+wB89BqSzdn6pQstkMafYr91ItftAbRbCyZnbEEywUpY
	 BlHsVjEjpni12Iw7DiFkRBGl+AFu+/KaXuNoxx36CsOhYzowHpgY8rNdF6dm4a2onK37L
	 iayS//8xYhVLbC+qihzZb7KgIusgO1vUpy9lAfA+1Q5sQLKlt0HDb5xST4AtBD9IzY4fh
	 ZLQsSJvp0WiimZxrkzJft09W7lBrgQpC0/rdfgLgqIyy7h/inmX4G2bK/yNevQN3n/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EPAaZGGNqSI21QfU7ABn/z/SpscZtlkI0gz7OCGQWww=;
	b=uvrlmdVLdLKFxQPb98eeKLKhbK7CcTHdnMofiu57LcQ9l57FSaPJO1CIRg56SRBdM2YC
	 +QczDnVa9Erc75wYQGtlhanUiToaaImutVPcxVDPkBJ72zpNkGuKCn36+N4fUzGwPDLTa
	 a9b/rVY+GtdVohyJ4DExGz0raYatkZ9YmgC0HLIXSBPXl0bBlHanH0g9k77Y2wsTP8FX1
	 Ov8OqLL/QSZxzE94GynE+JlJ2F7WuxP39jNNFBrjuw+9lx0BZ6FKETZ8il/ouu5qNa5XM
	 meUzTDy0VPUdyr1QWmkfmBsqOb1Gq+yLxsGkTxv++xf4pkQWkBT9AMXRAAjK1c0NOZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=agc3Jpo5;
	arc=none smtp.remote-ip=74.125.225.65
Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A897606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A897606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=agc3Jpo5
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-48e293ecaa7so1001963f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649209; x=1794254009; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EPAaZGGNqSI21QfU7ABn/z/SpscZtlkI0gz7OCGQWww=;
        b=agc3Jpo58I2Ixi+BIEmWgYoFinqVJUJ4O/KwM72mfQz3ih5s+ae9tfOY4C+cPH19ep
         xSFvRGf0BpJmP1P/MWDCxt/f/P8KHkLMEPVzw74V0wWgVwaHeeY2eoRRytvgcWX8n3Fw
         zqumVZ0jwTwUmO/MhmDXIll46z7z9wZBMaF1BC3oJpuDHdrRhLQhjBpyygO8M3RxEpil
         2sT36+Uus9pnD8uMJsvC6kTvngkhL32fuDmdtly9fip66iaITsrrCTFgH1/EIsMDSAW/
         cWjPE5Ct86G4KBjVmvfMov7shc7/kwVT42RPFEWFDlu9d3D3E/9zyomY9YNoc/laPRie
         Rw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649209; x=1794254009;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EPAaZGGNqSI21QfU7ABn/z/SpscZtlkI0gz7OCGQWww=;
        b=qZ5aqN+azjxs1DSIsjJjU1NhqZ9oG4xL6HQIOGf2WB8sYo48wNGNRctSEiBJQQ499M
         krnsx4OjQPTLGb4b75+kGypXdpqOTFgZlLPFJK73ZpkvZVzoDARJvlmQv/IXeDe4hcsD
         hIkvRySfjI2YOPcpCcATECfNFVEbQTb4uMGn0cso7dQoWNMTKSOMnMbyOyAuw5FqkCTw
         EgwzsUEfWJRq2PpMkoDc6tW1Db5Clus+BUT3HhyT9nDgKyVQ/Rsbx3ekKZkaQOD0GsZO
         ELrHcG7UGyQRfGhtDiD8musbGa3eEsWr3w1ILV08N4hK0T3P+sBLl028SXfOiyCaXKA9
         zDfA==
X-Forwarded-Encrypted: i=1; AKwUvBxh1G36iKekUur1xPLcQQ8Zv5Ojrz0IdBKUJSa8cgLS4aUeH60cG8I5NwShnPKbbtPeum10fOpquzEM6VE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8p5ZhstNSH81tZamWdmIqEfUv+N0X8tZT1qbUoMIMk8c2m+viZ
	NheHMR8ZkjZiu6pywVmb1EGPFMg7wwh1b/GkO6Lp4QeCeB6aBObaRm7kjj28ufF99Es=
X-Gm-Gg: AYBFou1sF7TxkQoMExkcNemQe3Gg5H0K0wz2gPAgvV7P4S1X0BfL40unFwyu6/NGsPX
	G6ySzCKovBXwEuyCYWZ4D00Zk2TA4AJXU7ZbyzME3980hJiY4AUnm6jj/IoakJPA8zs8p7ivThJ
	udbah8ldHMU28ETUHWM7dU/RE1CuAjLpzIafXVfC9iZSZQdOsZerP6Hxe1apJT8Rhl/uhzIZJ9B
	wgYMbGGppMnd3O7yebLJj+748U3pbb77voDsGeXmUqgPJ1WTAaYpxMRT/sKoE7fg6JnP0cEdXld
	iUb9oMPGXilz7f1OVub1fNqssE15Grt81wOXIbNBJD36qOZ79AGdOPxFT4JCaDsCnWZybxkORPi
	8nYbTwDJiPY8BV7oFNaH3ZMkd5Py8DksXNG88d03OLMQibuHljkMUes0ihcadwv6G/rK88dPNrw
	DJ9N/5rodkDMTlmQfymo0n7w809Uy8RfiHrc59kq9jmZ334xtZb5kj8i2madUDK9mZZGhS4VWy/
	1X7qGNzjbbCLzt7/xCrgbOv+nSsgMEHqTy6Ik9mtn5ZnLxNxwyt4Cdes+0Fh2FiNN4lXsExpshi
	pUhYAGrDboKwWnHApXlaqP27lq4/uQS+NuR++BooXczhv29nAWE5QvFQicnxKZiVzJfm8/RJ70Y
	S2aBvsXGsKoLAaQMo8paOB5zzl74=
X-Received: by 2002:a5d:44c6:0:b0:487:a15:b4cc with SMTP id ffacd0b85a97d-48e6e4fad74mr19327972f8f.23.1793649209253;
        Mon, 02 Nov 2026 11:53:29 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:28 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Subject: [PATCH v3 0/9] ARM: dts: omap: dm816x: fixes and peripheral
 updates for DM8168 SoC
Date: Mon, 02 Nov 2026 20:52:46 +0100
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBCG4auYrq1ph7YWV97DuIAyQP2hpMVGQ
 7i7BWOiC5ZfMvO8IwnoLQZy2IzEY7TBui6NbLshpi26Bqmt0ibAQHHGJe2LwbQUr4PzklZ3zZW
 m1RAoiDKTRjOe14qk795jbZ+LfDp/dniUFzTDzM0XrQ0JeS3pyOe7b0WtViKnjJbCYMaA7xno4
 812hXc75xsyZyL8QKDXIUiQkEIIyEFyhD9omqY3MYyDOxoBAAA=
X-Change-ID: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=2941;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=/zToKwQTm1t+VyPJvHbpStnNft3Pne07RC2dktu4oxk=;
 b=G0KWPNDEdZFaQJ1h9rp2gNIuq5r/X6WNHQpFFKlZFbFyWDTVZqmxnjbGt4Z4C2+kJeiZr6TcZ
 C/pGNRbhFcuCtpX9ipEFYMG5d03ldaCXX/ODi1VObVVP1auFfkjOCrI
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

This patch series collects several fixes and peripheral enhancements for TI
DM816x SoCs and the DM8168-EVM board:

- Pinctrl: add correct pullup/down enable defines for DM816X SoCs, which
  they appear to be inverted respect to OMAP2/3.
- SD: explicit pullup disable in DM8168-EVM SD card pinmuxing.
- Storage (MMC): Update MMC node settings, dropped mmc1 hwmod.
- USB: Update MUSB node, enable multipoint mode, dropped usb-otg hwmod.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
Without upcoming Andreas's patch (not yet on the list) that silences the
WARN() for the missing hwmod from DT, commits in between the hwmod DT
and the code removal will get a harmless WARN() during boot.

Tested NAND on DM8168-EVM, seems the pinmuxing is working fine.
GPMC_WAIT is left with the pull-down enabled where a pull-up would be
preferable, and GPMC_WPn is not muxed (reset default). Neither causes a
functional problem.

Changes in v3:
- Collected R-b tag from Andreas.
- Split "Update USB node" to have separated hwmod and DT edits.
- Removed mmc1 hwmod, splitted in the same way as USB.
- Reorder USB reg/reg-names to match the binding, rename nodes to the mc base address.
- Dropped patch "dm816x: Correct speed for sysclk5", it requires more
  investigation.
- Link to v2: https://patch.msgid.link/20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org

Changes in v2:
- Removed useless "Prevent USB being put into idle" patch.
- Dropped "Match up capability flags for USB" patch.
- Refactored USB node patch to use ti-sysc instead of usb_otg_hs.
- Added "Remove hwmod code for USB" patch to complete the ti-sysc
  porting.
- Using DT include instead of dt-bindings header, dropped patch.
- Link to v1: https://patch.msgid.link/20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org

---
Andrew Goodbody (5):
      ARM: dts: omap: dm816x: Fix pinctrl range
      ARM: dts: omap: dm816x: refactor and align MMC node
      ARM: dts: omap: dm816x: Update USB node
      ARM: OMAP2+: ti816x: Remove hwmod code for USB
      ARM: dts: omap: dm8168-evm: Correct SD card pinmux

Christopher Obbard (1):
      ARM: dts: omap: dm8168-evm: enable MUSB multipoint support

Ettore Chimenti (3):
      ARM: dts: omap: dm816x: Add specific pinctrl config defines
      ARM: dts: omap: dm816x: use dedicated SoC pinctrl
      ARM: OMAP2+: ti816x: Remove mmc1 hwmod

 arch/arm/boot/dts/ti/omap/dm8168-evm.dts   | 17 +++----
 arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h | 20 ++++++++
 arch/arm/boot/dts/ti/omap/dm816x.dtsi      | 78 ++++++++++++++++++++----------
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 46 ------------------
 4 files changed, 80 insertions(+), 81 deletions(-)
---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
change-id: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>

