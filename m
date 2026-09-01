Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88348821D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283267; cv=none; b=B/esWz39xmApY/ZJgx97u2EwsalS17DFMXzAzzYMYyzwFnCW8QtnNvil1hfg5LqQHHI/1pcbw95bYnWVF0/pBBSsM09pMVbluyTEfSWnPCrWXMo/sJee2UGdRC9TmqiNJWXVSWYHMPJw5CbGlNzaIXjAz/lckhusCvXswtwl4G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283267; c=relaxed/simple;
	bh=jgiUy5eMRpNUM8+bU8u8Yz1LZCFsAgtPKJ/eVtR6FBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ueqDZMAYMhFWvvW9JBgbWzh+8bz6Quu6r/NVEC9lz+/YA/67rNBG9SPZO4o5e4E3urxw/4oTGhY2KYjZ0U7+bfxQtv1Gz4cFrTTNkkW7LCHe2wHbysHBV0Zm3DLSmWi69BqxtdS+MdoGpH7/Rp5pGaDD40+DVFjUnpfu3N6UJjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=CLQ/TUVZ; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="CLQ/TUVZ"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-52d8679c149so176991cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788283264; x=1788888064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t39E3zIzKGyf4z7+xsFY+J4nC1fcBP8I9wZLt31dpDY=;
        b=CLQ/TUVZFAmHlz5Gb5F+4Sa2OX8Btehmjd3jtQI4ZHc27rxFXQpPgQFF3101IEcVEn
         S++bq4xe6sCPD/M6m1GuHPZlqILeehtPnHmyn0h43EGZu+U7mPdyi1hupr+bARY1oB5Q
         BuZF1oYZ9f6ja072qQFj1MpBZ2g0l/KwXNoGuXVaR8g0nOLRi+Qm9H4JYklELnlZVd0I
         lt52AUC37sUIZ7xeKMsXEs1wMs1n5e8zc3AR1ylPNZHOSSrF7V4SK7yJLbkCbRlSRKnL
         UM3rPyVbVuIebY8ZgZzSIVjJW7ooTqlOpwkhp06eK2Jl1arrhX3wXEONsYKdmx0PXfvH
         WN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283264; x=1788888064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t39E3zIzKGyf4z7+xsFY+J4nC1fcBP8I9wZLt31dpDY=;
        b=UlzH+o62emDDd8gk0vcXrCbN47ZMw4o+F37oVKMrOoCmNueAbHepg0iatr66V15Yz7
         S35t2ALD9p7kLeNYHQ2n+P5NTgzcajDU3YMwHGqcuvSjV+4J26IiB9I/BaalM4dMoTsP
         nD/fFSpzgZC+riGMUFk40NxnUX2Qp3jBdyDX08QAJ+89jNqAun1am2y2yQRcV6AkmSCC
         lx9D4XyUoPdNzo9eLg6VdNxYYoXjftDDDaauLziPjnjYU6/9vX18th0NoQS6baBq82Xu
         WJh5tX6kw9+jYwnjIe++GAC/R6OkcW1r5yHe6tlYiXbEQ1d1ujH1fUbyPR5NNGv0pDOd
         KNBg==
X-Forwarded-Encrypted: i=1; AHgh+RqhNA+h/cr/NRg43jxNerkRzLQNdxWyjrVI38DODs/rVFt/Y80LQQU3V56i/CxnwMuawqDgKssAAvKUyOo=@vger.kernel.org
X-Gm-Message-State: AFuF++mbUxpuGGDtObBzayD26WMfcQiOxGClFlRBf/bXg7402NbSAOvL
	bHTMOXM6Uc8VQa11XjFSLKKqvrpStVK2iTsHK2L/0KwN8hlfcgEzgiyua3pDQtvmt4c=
X-Gm-Gg: AR+sD13Bai0AIg+7wtwI0qMRqosnchnvHWqSKEqbubVH/92ufw+gpotQ9GxmTCQjzW/
	fDAwQilBLOr2EFUDRGl+BA3tBYQ5EMq6xcI9Xvq2x2BUte+DgbHxlDNsAD0XHoUY8OOkW3/1pdq
	J9DnhJPaTnvVsENan75nGzcXpBwqpcOIrFJnc2WRP00mRMG6FDIhzJK8XD49FwfEYIdfky75L6C
	HdGHFXOmEdRS0U18vPOARoploNe6wksVlnHcRKNqw3SMx3kxdse1vgG28P/ucPEM4hf8ftl8/ZE
	kSurRIqLX+Xig8+RXNI69A7thHRFtrlTx+Kxc2VbyRbS6wc5NJj2IB6EogDq4cMuttgLXJ7ebIp
	75tF58/4WjtJ9tjBFFsHGh6YCulDdEdsh/rAmrl0F9h8n6sKLhpf+/CmQF782TY9+yZjzZ1nL7l
	Khd1Ac/DZED/SxeQ9P5vkWDqzlHiF7SjY5Hzj3rpqu7Jl4aopsnRiLfS3WcgWnqw2WOqJj3gb6X
	8A=
X-Received: by 2002:a05:622a:1a9d:b0:52d:70b4:2e1a with SMTP id d75a77b69052e-52fb9373ffamr417632911cf.1.1788283264448;
        Tue, 01 Sep 2026 10:21:04 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331d9cbcsm1423661cf.16.2026.09.01.10.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:04 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: use pci for device nodes
Date: Tue,  1 Sep 2026 12:20:54 -0500
Message-ID: <20260901172058.1512508-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901172058.1512508-1-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
be treated by the code devicetree as PCI buses, which is incorrect.

There are three TC9564 SoCs on the RB3gen2 system with an industrial
mezzanine.  All implement a PCIe switch that includes an upstream
port and two downstream (external) ports, plus a third downstream
port.  The third port has an embedded PCIe endpoint with two functions,
each providing access to a 10 Gbps capable Ethernet interface.

The first TC9564 is found on the "interposer board."  Its upstream
switch port connects to the QCS6490 host PCIe root port 1, and is
described in "qcs6490-rb3gen2.dts".

The other two TC9564 SoCs are found on the industrial mezzanine board
and are described in "qcs6490-rb3gen2-industrial-mezzanine.dtso".  The
upstream switch port for one of these connects to the QCS6490 host PCIe
root port 0.  The upstream port for the other is connected to the second
downstream PCIe switch port of the TC9564 on root port 1.

   ---------------
   |   QCS6490   |
   |     Host    |
   | PCIe0 PCIe1 |                      +
   ----+-----+----  ------------------  |
       |     |      |    TC9564 1    |  |  ------------------
       |     |      |           DSP1 +---  |    TC9564 2    |
       |     -------+ USP            |     |           DSP1 +-----+
       |            |     DSP3  DSP2 +-----+ USP            |
       |            |     /  \       |     |     DSP3  DSP2 +-----+
       |            |  EPF0  EPF1    |     |     /  \       |
       |            ----+------+------     |  EPF0  EPF1    |
       |            ------------------     ----+------+------
       |            |    TC9564 3    |
       |            |           DSP1 +-----+
       -------------+ USP            |
                    |     DSP3  DSP2 +-----+
                    |     /  \       |
                    |  EPF0  EPF1    |
                    ----+------+------

The third downstream port (DSP3) on all three of these has an
embedded PCIe endpoint with two functions, each of which implements
a 10 Gbps-capable Ethernet interface.  These devicetree nodes
representing these functions were previously named "pci@" but were
renamed in the interest of consistency in commit e806c63ba51a7
("arm64: dts: qcom: Rename pci@ nodes to pcie@").

Unfortunately, when these nodes are named "pcie@" (as they are now),
of_node_is_pcie() causes them to be treated as PCI bridges, which they
are not.  The previous name "pci" matched such nodes as "default-flags"
bus type, defined in the of_busses[] array.

Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
bridge nodes by the devicetree parsing code.  This restores the
previous behavior, and allows them to be used for PCI endpoint bus.

Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 46bb52c667a4d..14c64439ae1e6 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -130,7 +130,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -138,7 +138,7 @@ pcie@0,0 {
 				ranges;
 			};
 
-			pcie@0,1 {
+			pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -225,7 +225,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -233,7 +233,7 @@ pcie@0,0 {
 				ranges;
 			};
 
-			pcie@0,1 {
+			pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
-- 
2.53.0

