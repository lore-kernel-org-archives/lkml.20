Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792449750;
	b=VhwkfMZJev2ZuFDgkMH4vPdW5FBOLgWpK0yQ92Mlxwznji0XdpJrrWU5bTY0u3x+ljGc
	 yDp7C+sYecslnQ0W9SP0slz3DrYQKnyxiBlhWl1qMmtZ1B6bIoxcKCGpvjdSyjaXrtrQV
	 eq4iKWd7AhOx+GgifY0kjBqyMfqREfxgi892cWt9l+DwIb67QgE9MhAAgG5HhJIBnYKXg
	 6RR6ud3sWwjfceXiqJMW6fqkvrVBTVW38j4eMp3ftv4nj9htOJNrmpOfl+PYNeP3YycDM
	 wnrYGnWp9L+E8JIH3Eq3m/07TDcXLwJjCHJfua1CZoXBqqFrVMHhGQ89umkv3kMITjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792449750;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=l7qRcTsO/2UXtwmKxP41sC0aqXAF/l/R34AJf/PVsKA=;
	b=Imi/pIRL8mDf/mgkqVNwu4ISPM+rU0Fme+ftmmE6M8YDrmC9HtZPNQjf1v/a6XWqg8kn
	 FuuOP0R9oEc7B5R0MgK5u8mSJ2qOzGsxIfHP5NqEvq0V3dJnLCbzaF+ToWdNiZNt0E3hk
	 j8oMNKz0QWJcNgifm77XfpUKYHsHsnbr0DtXonfIQgyUcXCJTcJqs1PfE550aosH69zZl
	 P9u9zeX7s8nCCSzX2rfK/k8qjbIxZo/93O0pYjfT2xzU23NzqMqboedkflyDCictD/1Xo
	 aXeLjqBm/o3Ke8WMlrUnVjss4XZhAuR9T29ZZ46o6WqTWAmYrjHbeGAGVsDS7ELzdyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b05ZTDVm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AE3606A31A;
	Mon, 19 Oct 2026 22:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b05ZTDVm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792449750;
	b=FWU6ZjEjcg2e0Sigb4byzC5sv76zcqozl4E4OasIKV0IfEo51NToXuTIrZM1QfWEVbWH
	 8KP3zv+LdQWMPqkAwARQF99Zm2eVeF4X9oP3g6yRURfWrvY2GXIsyxAcmJn45x5JIU8HM
	 Cp5vakT0JEKoN2ZxZw0FYet7OpQ3L4SKYfLOVeehaCA2IG2Mjx1r4uUYrClBdlpL5VMnm
	 KI2ySMq8w45lg/ANVNCY6MIxcfo93QMKWFLYFgzHopxqvWlrkZ3LKFXliDaKSF/PzgTPj
	 tWrpSTIBx0DGEPS7O6MYy1zAHTnXhnAVtCjeNahTJ50JSPGUJnHs0MvqQMpNz3/z6oQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792449750;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=l7qRcTsO/2UXtwmKxP41sC0aqXAF/l/R34AJf/PVsKA=;
	b=ZuTezcheYMe9XPg8QLqcyvVKGWgOoTjoTfNN6e0/rW2RI+DRiLhiwnssbNn7/TDsTFST
	 yAdL96TTVPe0pzZZVu/8rt2CwrAtXmg3ngkIgok8YRjOFkAv/eVkijrJYjQXWzi9JKpIC
	 pPtCqw5CjcEN6Ce/RN8u0Hizo2JwlJxWqdnZ5Un30izfVMVSDGS+HEHFAoeKJPkX8PQaw
	 QUrhQOe/Tht8o+S4qAsyv7vCxzFr4XW22s5bCI9u2PC+LipiijrYJSFawIkuzv8IVHffA
	 WCm4TiVaFFt9r2HRfRZQf7IXu331Ds515TdiB+TpZP3MwO8F6JKgrmGrqEONcqh6OKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA1CC1F000C4;
	Mon, 19 Oct 2026 22:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792449749;
	bh=l7qRcTsO/2UXtwmKxP41sC0aqXAF/l/R34AJf/PVsKA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=b05ZTDVm6WgW3CmmzYbXuJgRL+yY6C+/0kZm0di8ZCYAkheR8B5XE8qfbSw9C5/6v
	 UboVnMYHc/VfaxFb1CmMjYapOzMOw8sRoauzYxxTLph6vZOBUZwRekPXVOA/wu3ud2
	 kcO2YdcZ7c8dMqHAjp3P7+GNSYCw3OTxOofK1dcgXmUk7FDKhHO07aLkTVIXKVNBCu
	 PIPowXp0K67DyDxV72SMYvS9X4mgFIEn2SpH4Lc6O2SKcqqCu+5aFiSy2hxza3nboN
	 sPq4RzFjjmLYxIu8Torwg8AKk3xh88chFCB55VAm3jBR2PL5aRx71Uheqz2WHqjjW+
	 f796rKBMjOnIQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 49CC040644;
	Mon, 19 Oct 2026 22:42:28 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Subject: [PATCH v3 0/2] Add Samsung Galaxy Tab S9 Wi-Fi (SM-X710) support
Date: Tue, 20 Oct 2026 00:42:08 +0200
Message-Id: <20261020-gts9wifi-dts-v3-0-afd06fb2d9f9@dxdmail.cc>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ6CMBCF4auQrq1pSxHrynsYF6UzhUkUTEsqh
 nB3Cys1cfle8v0zixgIIzsVMwuYKNLQ51HuCuY627fICfJmSqiDFELzdozmSZ44jJGD0rXCo6l
 UqVkmj4Cepi13uebdURyH8NrqSa7vn1CSXHDpBdQAukZtzzDB3dJt7xxbS0l96upHq6xdaZ1ph
 DcOmy+9LMsb1kUwv+cAAAA=
X-Change-ID: 20261004-gts9wifi-dts-d2472e895234
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792449747; l=1748;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=LGWx48KWENRO2ONxIsS6866CNjCiod9zDcwxdMYqT1g=;
 b=x5/x8Bl8ozC1qRbpYRfgIq9PgiUGgPrc28MfNFtOoth2MYcZNWScSAHdpqiITwRFl1lXiIDne
 Ehg3poKbYBdAYHlBp7jVOATXuS8m6RanF7iesyQLajNBj5rdbz7eMk6
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc

Add devicetree support for the Samsung Galaxy Tab S9 Wi-Fi (SM-X710),
an SM8550 tablet. Two patches: the qcom.yaml board entry and the board
DTS describing UFS, microSD, USB 2.0 peripheral via eUSB2 with an NXP
PTN3222 repeater, keys, GPU, video decoder, ADSP, the CS35L45/VA-macro
audio path and WCN6855 Wi-Fi/Bluetooth.

Tested on hardware on top of linux-next next-20261002 (boots to a shell
through U-Boot): storage, microSD, USB gadget, framebuffer console, keys
including the book-cover switch, CPU frequency scaling, GPU firmware and
render node, video decoder node, speaker playback, DMIC capture, Wi-Fi
scanning and Bluetooth firmware loading.

---
Changes in v3:
- Add Wi-Fi and Bluetooth (Konrad)
- Test microSD and audio, update the commit message (Konrad)
- Add a blank line before status properties (Konrad)
- Expand the GPIO36..39 and USB comments (Konrad)
- Add Krzysztof's Acked-by
- Link to v2: https://lore.kernel.org/r/20261005-gts9wifi-dts-v2-0-c3ac9b0f9ceb@dxdmail.cc

Changes in v2:
- Use my name for author and Signed-off-by (Conor)
- Link to v1: https://lore.kernel.org/r/20261004-gts9wifi-dts-v1-0-1f0d7dd47e4a@dxdmail.cc

---
Nizat Mikayilli (2):
      dt-bindings: arm: qcom: Add Samsung Galaxy Tab S9 Wi-Fi
      arm64: dts: qcom: sm8550: Add support for Samsung Galaxy Tab S9 Wi-Fi

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/sm8550-samsung-gts9wifi.dts      | 888 +++++++++++++++++++++
 3 files changed, 890 insertions(+)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261004-gts9wifi-dts-d2472e895234

Best regards,
-- 
Nizat Mikayilli <nacht@dxdmail.cc>


