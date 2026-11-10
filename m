Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342351;
	b=dPS4dF+AsriNIcbmedyt6Evghxkj0mf1MmHe5A6/LazPuUwy8LY1iIUQ96z6uAan7KDd
	 D+78uByFHfISkqYjZWqgdWTxpca3/zJLYRiitZyr8TCkOCykYFLUQbzhe+Ztkm2GuJVNT
	 n0HuvYWicqPTo5dax/txfN9WaPA/wv/jyvcP7y4I8AIJWGZ4bcsGsB29r81ml0rZmsZhq
	 PfTK+AcAtolzQNCB125eZWdDcI98rVkUFxVpPcnvZDYHHSRTQSArkCUbtDtsHINIzHlr/
	 7+D0SO4Hu7uNWSEyaJ14hs+5113r6A3l0F+V6nokflMcrXckGO7sJY4WjLraZBkYYaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RoyEoopnifFOj6tGri7N/w21DgtNJiN2PVsWRCx8KMw=;
	b=Jyk+kz/u3PiXfTKXs/gYU4nNanB4tvnbMQPuh9xXw1F12TYdoBN+ZlqFgS8GG4EKCePX
	 JG6Bm8fnHYAbvOlMR8gaG9CLZkOpslXeCNJth6Qy2G9vk072Fgd/4kSanZ0l2jDV+Yw0C
	 O96ythGWsGE47xUksBugdrDogDRLNvvPDZFeK6muJFl2fx5zhYAwbTJqQAAqEhhFMEpyj
	 Gg0VDD+Mc6O1v/7qj9va650+EtbR4AAPj7l9G0ukAo+ZDN6DGOSvdGTfZdsgAGEpv0Vl3
	 c2eMSOcWi4TyVnQr8Ru03yeZyciPSVtvX9mP0pO3/MMGSIprrffNxxTlJ0LbtggkS4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOHw70Pw;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CFF606A886
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66CFF606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOHw70Pw
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-854e904005cso1566367a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342350; x=1794947150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RoyEoopnifFOj6tGri7N/w21DgtNJiN2PVsWRCx8KMw=;
        b=kOHw70PwAP15j3Lih3uGj+Agkqt6PVJupz/DSiNlxtGHbcyMwz6ohmZzL1xhKFAUdc
         q+hTYB6agrxlHVwWiKgq29QdFZH2GTVKpOspnwfAeW1ASXEKw8eKHdoEWGCAKWK4FLQN
         khxvT0O52f072MND6mEAqIigRYy49pCaqnMKdwCM549pEanbWsE3WSH5e1sdIixSIbfY
         ywRB/itephbCvt7FlqFXU3nI8z+C0odRGWDAIvJXVOqYlH0yZeV9/98b7IOs7j9A/bdr
         pjqKA7vhcnlybYDrhVCWWsX16Ga0JV2YcOsxyNLvdioUfJzo1hg0pVdpFTxQUX61X8c+
         pVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342350; x=1794947150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoyEoopnifFOj6tGri7N/w21DgtNJiN2PVsWRCx8KMw=;
        b=mxZB76uNAapeV9UTn6ntfntqBFxFxiVHVidL6kFOX1OTanA9EU1tjm4Z+OYyrvBwUV
         bXCRMuKGcvuY6kRgcpPDTZ4HFG/w2PjOgGqP6V4gT2dRawgxsZLSWeHdFM4bim2SYcx3
         vG05DvI0ncoZMt7VJVP2GBcgWGcBIJWLGAQfmIRr53QUD6Xa+FyD+2Cy0KRwH4/iJ1qz
         UHAN2AMxEFHMzVnOuA3MAIC2gM8c+KQp0pFgA/9tnf1ofSwOCExqnOegGXbh6+svnENG
         d68uIIskkiiBDW1lG2n4RSRxe6MaeVWpel39/lFNBH6GKOrsoCIsluw99Eb9nyvUwNkr
         Teug==
X-Forwarded-Encrypted: i=1; AL+hErFX9iGcEuIwEX4XP52GROETWNCBeupQzJtI+8yIuHx66tWFr2jGyk/u/JH3TH05yPS+mZyEYMMg6ySxwnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R1mCC6Tzp+by9YBKrQWLZgpmBX9RNlFXtu6ZSIkwLlLs0e2PL
	cd1lGDwP8IQJHqCF6EyM+X7eBmMd2/DlwIHB+CrOMOIT9F7QBRSH63q4
X-Gm-Gg: AYBFou1lTce8ifXalYrebJ5HvaEEy7TjYCuJ95yKqgWOLKiRPTCs4Vs+zJw9pa16OFP
	lncW3N5wXcmxk3D/xjQWLSqtmIsuagxbJy3imZiUkV+GnSJF77UkSfx0vOh5VXPCdwr2iGGJC3F
	UqP71/EMJVU73LEBX6TMxfdVrvXSiHkPA/nikxkOlySAlhIj4O2LcWNry+2aSeO5LATtjCvF2Te
	Cbl1DuvCG4ro3V52PVUG+1wpjpl1kPP7J9Va7boZzg3kraHZvRVYe0ffF1DamSM/dTW2Yo7okO3
	HNJB8GDJKJH1cIK9QhwlHJEGcaRZ4fEXDYPSvLBU+M1Tpq3SL9zebQYe+oOflDMTRoTLtsDJL5Q
	zrgmuZ/mCZHejvPzb2apJ7Nc1VTT5Twb0UX4Bf+ZxR20TbPTAhkG1t5kHlww+uaZocdIHc9TLvf
	p6oJNkAO1odDOzHgPQY97J+rQWQVgCDaJK11aGue26ym948GOyrxkNoE1Jffz5O7EHJMwXhlnex
	iVeRKIMuAiRaRlxAc3wLEgZqI+lQJ8mqYk9krTXZ3E4uB4CTvD17TIlDo5QWbthM3wLMdGanW4S
	4NnNOh60nMgJff5cEvdj+6Xs4r39fr/rDxRdMOn13RyFPjLsjS/g6JBUivVIze25mQdJf1PgGlw
	=
X-Received: by 2002:a05:6820:f00b:b0:712:b60d:2ed1 with SMTP id 006d021491bc7-71917857699mr90043eaf.10.1794342350259;
        Tue, 10 Nov 2026 12:25:50 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f645d4sm2353252eaf.5.2026.11.10.12.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:25:49 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Tue, 10 Nov 2026 14:24:43 -0600
Message-ID: <20261110202445.14100-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This adds a device tree for the HP OmniBook X 16-cp1 (board 8F46), a 16"
laptop with the 12-core Snapdragon X2 Elite (Mahua).

v4 is rebased on qcom for-next, which now has the common Glymur/Mahua
regulator settings. Tested with Ubuntu's 7.3-based linux-qcom-x1e
kernel. Everything listed in patch 2 works there, including suspend
(s2idle).

Notes:
- DisplayPort at HBR2 needs "phy: qualcomm: qmp-combo: update DP PHY PLL
  programming on Glymur" v6 [1] (tested with v5). Without it the stream
  runs at half rate and the monitor shows no picture. With it, about 1 in
  4 plug-ins still gives no picture; replugging fixes it.
- The GPU is disabled. It works with "drm/msm: Mahua GPU support" [2]
  applied; I'll send a follow-up to enable it once that lands.
- Audio needs a topology and UCM config for the "HP-OmniBook-X16" model,
  which are not upstream yet. The headphone jack (SDCA) is not described.

This series was written with the help of an AI coding assistant
(Claude): the device tree started from glymur-hp-elitebook-x-g2q.dts and
the laptop's ACPI tables. I went through the regulators against the
ACPI power votes for v3. I reviewed it and tested it on the laptop.

Earlier bring-up report: [3]

Changes in v4:
- Rebase on qcom for-next: drop the PMIC includes, &apps_rsc, &tcsr,
  the SMB2370 repeaters and the phy supplies that mahua.dtsi and
  glymur-cob.dtsi now provide, and use the new regulator labels
- vreg_l2f0 is now 944 mV from the common file (was 936 mV); tested
- Keep refgen-supply = <&vreg_l1c1> on usb_2_qmpphy, which matches the
  ACPI power votes on this laptop
- Move the pcie4 endpoint under &pcie4_port0, since glymur.dtsi no
  longer has pcie4_port0_ep
- Link to v3: https://lore.kernel.org/r/20261028191800.27829-1-jeff.roach0@gmail.com

Changes in v3:
- Set vreg_l1f_e1 to 904 mV (was 880 mV, copied from the EliteBook) to
  match the ACPI power votes on this laptop, rename it to
  vreg_l1f_e1_0p9 (Konrad)
- Add Acked-by to patch 1 (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20261026154001.9323-1-jeff.roach0@gmail.com

Changes in v2:
- Add static data-lanes to usb_2_qmpphy so the PHY uses USB3-only mode
  (reported by Sashiko)
- Drop the Assisted-by tag, describe the tool use in the changelog
  instead (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20261024044650.9936-1-jeff.roach0@gmail.com

[1] https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
[3] https://lore.kernel.org/all/CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com/

Jeff Roach (2):
  dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
  arm64: dts: qcom: Add HP OmniBook X 16-cp1

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 657 ++++++++++++++++++
 3 files changed, 659 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts


base-commit: 14825c9204bad7f4e0bd3a528cbf4a7e24e757d0
-- 
2.55.0

