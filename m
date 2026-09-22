Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DB154DACC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097593; cv=none; b=mpyJOCM9dqMPMc+irmInEyAI4aR/ppI0polV+gIuXbeaiLh357YZ/u09N9Ztuh2P6mO/I9XEC8IOG9bk5WtGowP/5roK4WOand+o4hYl07JaKwL7DbyvdBxQd4pe6OtW1RS5TzvgZ2V9kCER8Woii+uu0lfrHGcvCSvY6iW6634=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097593; c=relaxed/simple;
	bh=a3sPdyHcHprVQwZOqHIoUiv5J6nmHku9niqJCOzNbB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZdnUHzxtIPWVs7EO/tWp/sP09yd2larHmuBgaZWhpUhH2GMha3e+G9zRa8d10XoG+0jaskWPSJxhdq9Tk2uofzKss6R9s5B3krNCW06f470mzVkrncD6t8cOa14IZ/bEkQ5swunMcIFXSbZYUfxBRiSYYgYkAxA/5s9Jyr/tlfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YP1F/gx1; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YP1F/gx1"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398c066106cso116798a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790097591; x=1790702391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXAQgXk9WXyXBlox7Yojnplh6D8AEqEL+5pp8xq9FJA=;
        b=YP1F/gx1S8rJjeGWtdAUBC01pMp0cZlcRBwPjY0dwSEH4gBg3U2Sl8sj/88ZZp8y+t
         ep7LhCjj9UJOD+zqwj0YS+SWDVJjM1cqwOZWKXBy1nVLbdX2OC5+mYsocyK+lA4Pv6qp
         KAcYGPPKW3yI4s+NlHeWVHTmTQ0J8T0zFa6OQf8CWkscgcvMRWD7M/RaupRXapUwkpeG
         /8zpypvs+gdYzoNdbqYeP++7nalIfstJUJL/l3FggclVbGMzAXPG1NlSO0cjX0lkiWmH
         vNsW4HDzaW0sNq/lGGeDYU9P7i/8oscWum3/klzUZzRI79lXh41HrBvzOTCa++amRx+0
         3pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097591; x=1790702391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXAQgXk9WXyXBlox7Yojnplh6D8AEqEL+5pp8xq9FJA=;
        b=K3TcPJ4srT84YZly5/q1EPYtWNRrzz15G94ERtD50M3Bd/48vXoPFIn2K0gR3A9/Ai
         5sa90RdrDOeAVRu2C5pFJs3Cogyf1rBw4eJesvNK4owtAcYEebSpONAwPibUSutVHQOG
         6pXBGtfMd+/4TsLtrb6kTyTIC2Okomw5PJj9Jt61TWFXilgqESOSCRuLxelOVpCzNohk
         isDcEGGzp8rcKFXaeQJhiirFC9XzEfZ2Or7jncdMVMBpIMQGP1o+9g8YOMdYyvEPkMcJ
         lFe/LVdXdlcv2J6BCcy+07j87yGMpekiswPCjGMc3LT57H6sIQFFd9ylXLNqIEcTL+U2
         lN3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy99D2RD5DTEVrzV7wnxPFHUdGl3ce+toe0OKx2yaKbRZp9WbDsbQecPlA+Wyg5CUoPf2gA7RgO3McJ0vY=@vger.kernel.org
X-Gm-Message-State: AFuF++mncdZNgm+YNJ5Dg2uwXcd92pkfIk8haLZ9B7uwtgE3KKX5itDL
	GNn7Ukj1ccd/hsgyCS/ZuQipcPCnIuB+0oswgWIPEUfXUQaYdfhxNGxB
X-Gm-Gg: AYBFou0u4+tfKAR1F2IZkdC0WLGSmDSKjtn9GiSiMCDn1iL/Kb+nngxQOUiqGY/Yaj/
	EGsW//DFZJlC630zqL4GmUAKQ4+1LCYyFbLzbDmedWAG8AB9HvThfFyx8voHRzLSwPcCYCys9AK
	9qrUaST1d4CgfRUx9Vp02GVFR1KZuQyLonoRj/BmhMD4saCR0HW7EM6BNU2CrOTjuot0kfzO1mp
	rDdoyVBBxSW9RyQcmmHuFhnVJ+DrWGA2cqLJuGPSYTJkd+HwboJkBBC/nCn78w29I08klrU6M2J
	uJyRcemxSZKyS1v5YziEy8vZljmzaBfqKpZAq+x3yC+WQX+gjdouvDdRLpKw6T55yny0UE7nYx2
	yzMAXB2IE/p0PPbm4HGSmAVhaW/0/oVN7+vgu1unjgOt0P4j3wlL2Zlc5JyYJrXyWvjdwh44iR0
	KF7jN8fUbaaJcLjJ4Zwk/CFERMQp02Hankk7BY0xnhusOK6yyfy663ZPkx9cVNYdkI9ZdXkwKr
X-Received: by 2002:a17:90a:e704:b0:39e:6a81:c923 with SMTP id 98e67ed59e1d1-3a07e642712mr129398a91.22.1790097591215;
        Tue, 22 Sep 2026 10:19:51 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db88298sm438333a91.4.2026.09.22.10.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:19:50 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH] arm64: dts: ti: k3-am62-mcu: Add power-domains property for M4FSS
Date: Tue, 22 Sep 2026 22:49:42 +0530
Message-ID: <20260922171942.201947-1-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assign the power domain to the MCU M4FSS (Cortex-M4F) node by following
the device ids info published in TI-SCI public documentation.

This will be useful in future patches that will attempt at abstracting
ti_sci_dev_ops's calls such as get_device and put_device via pm_runtime
calls.

Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
---
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
index 68e906796aefe..1ae0870893c16 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
@@ -181,6 +181,7 @@ mcu_m4fss: m4fss@5000000 {
 		      <0x00 0x5040000 0x00 0x10000>;
 		reg-names = "iram", "dram";
 		resets = <&k3_reset 9 1>;
+		power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
 		firmware-name = "am62-mcu-m4f0_0-fw";
 		ti,sci = <&dmsc>;
 		ti,sci-dev-id = <9>;
-- 
2.34.1

