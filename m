Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936680;
	b=OMB7KRSR9+cEJsfvK0DuyZXtyYnbuJdqUNLFUljnKPH9oRyUbM3UwMUpFDoqHFrclTBg
	 u1+kIRak8fyb3nNvTo+IhKfm+Q9D/yDSLGxSRfXM62F1YVpyaQNA4PFHsFLJ0GtpIkFJ1
	 fxfVSfszNJ6QWg3OjeDYAdQiCQU3jU5jZ3TLkzMziqSBHhc3StOwqGmCghONyQDmzb4f/
	 ZTWizDPa0OpmhqVWPPxCeBqn3K3HqV4r1x7emf/x1pYLo1PYWWGmEnq7rpqqlkk8E2uGI
	 TYKgdM+FgaaaxindELmBTsSyHaDf8eJwTDxAyRxOG7arnNeaUCAcIgIWLaEeopiClAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=PM+gGzOAYa/FTkiyD9xYa10o3sGPOU41PoOWcwMpxkI=;
	b=afLGEdb2X/Ne7RmoPV63GtfSujtOhml3kTFXL70Fw6i6YPaNG1zq6y9UKpoQnZfjnjB4
	 fP7qI3lTCS4VvLYF93Fd2BISeFXoy6HJk5waLiKrOFOFH+wb16SA2MilELCdqIZPEfKwj
	 bZnEz73xHSPldcRdYi8UCKov1OSWIMtTFeAJ0mrMz3LbLeMFFZ/3hIAxV11w1Rqc0/CSs
	 iHeOPgq+0RAFKxZDhO8kmNFoTWsejEK8hN0nLRZ5FXZ6v8zQqz4hCbjQ1xFRs1tAZUXE6
	 u3tV9dUyXHQpc7jr+lgc4He40c7GMud6U+Gn+m18gZDxczV96vjBjMX5HUXtBzqwXgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=B+kqnD5k;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE60606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CE60606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=B+kqnD5k
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so1297275e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794936678; x=1795541478; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PM+gGzOAYa/FTkiyD9xYa10o3sGPOU41PoOWcwMpxkI=;
        b=B+kqnD5kc2/BWpvolwBTSXR+Bk30wcbVAY1oJgbgsqey66UMmoa1kCyF1uR+ZYTfg/
         p6gvAkNR0Do2+bYPWMRwa30Xq/6vmJTDsgGVQ6Bj1wpqQFJP0uGBD+m5YJJuuWMhdQ4F
         mrQxPa3IUb6qWkvi+JMaIlLR06AagJpWF4/iHrhn9Zo0NEnImEEKnUdXsWHjWosjR+2c
         NJXdstO7aIKGsn5HcMGfOHRSYjxr0t13YSYHX4wOD+pTQFFnttjp9N8DoxQrnsPdCWfL
         Y3vEicdZw3G7xQyw01gKc50M+7jCi0AV2pB/70TPYsd3wsZPCsBvOiMitoXb/h72tiud
         44lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936678; x=1795541478;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PM+gGzOAYa/FTkiyD9xYa10o3sGPOU41PoOWcwMpxkI=;
        b=dDY1CGvHCB/3StMUfYmYooMcCAXYsn1nDw3RGOWxzMzE/u5iRmz2djuGCvHwb4cgU4
         UtmAB5jinp1Xaf2RYP/pb7/lFRa7CHcmuJZZX5Ab5UVTQBXj7aWem/Awmw6iGUoveGtb
         5Ov8tIvyjlM2tTyHaGrq44ogXu5JZHg2Kiq44ru2D9/PvHWjm0eDrL/Tf8GR2T7sM4+I
         r4Y0Wo69E1OwYch1ZCHsq0jZXu9U/Gm4nTorVHfzIR2iY1xCi39bJyMjCrpfgtHI1BGu
         NDtxSGSM350uxYYW6zZAZUPaqUnAjhXrduaFx1oSvoQ8VXVAN0w0LGrWueFItv8Vw8JZ
         6fmQ==
X-Forwarded-Encrypted: i=1; AL+hErHVomLGf9HCX2GlffVKSCD57DXcXjG3dZH9JDYpPx5HriBCBJHbwQx+zK4g112To9e+nSwBKOt2TflTV7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ty4/eEW3P21z5IU30YUF1Tg/Wam2dtjd9Hs13u85yVXVs75wm
	DtltvI3iJh+TDCPvM4EWvN27qFipzsvzQFvAJAKetoZiTwHTXixOrUidZeUrAQthfV1n0/a7wTr
	ckK7MqzQ=
X-Gm-Gg: AYBFou0bp5pcFj2NUVtJtcO8V/8tW794ePhcozAWcIRmyW30wbXER9Sz0cpj1EDsiRd
	mADiwJZEbyUNPwsPv9InE+XPnq1re5SSESmG96ZV6kvJ271md4MyyFFUeMp9mlGMg1LDtV8LqH7
	z25URnaxzsoYWhUcec6KWJkdfTuqFanEjRxdD8aeDnnqnkZnvji5BI08Hb1P8PkWs4H+/9ar4Cl
	GSg1LlmM6FHYI7rWEu7gIDmA5/c9VEI99/LZxBGvXIBSSuV0hxrjLO581dgwwui3twvKtEMBgj8
	vZnYJULHZCA43lzEbfR7ead0cblZwCGKvgBoulLjOx03Oui7pSb6f0QiZMRTxOB1jtMKwQGFA+q
	Tw8pywELcdPJ0M2BGPWf8hW42bhy+2p3ulPW+8oTFjKHao0d7pVuZMfnaEsS2GAFUuw1G3DUw5E
	snHn5dX9kNhlderpLgc8FOCxB/50Ggynnc1EQ3CNxdK1WyRGhxO3yzRTzpwEyoJk0Mp5yE+UIUf
	lRKpm2I3mT0LwHcOuXqujUtPM3Ho1Imfe+Y+gh7P10EGa/j1eEHdx3MF3DItTEJjOq278ce7/1G
	JFc8BMViaWhLSKHTpFl1NS8ZrFMTc317LqSRkfW5/2v37UK4sD9ll+xm
X-Received: by 2002:a05:600c:6986:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb6a2db52fmr181094395e9.0.1794936677610;
        Tue, 17 Nov 2026 09:31:17 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm46870735e9.4.2026.11.17.09.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:15 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/2] Add MediaTek MT8196 SMMU wrapper interrupt controller
Date: Tue, 17 Nov 2026 17:31:03 +0000
Message-Id: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAFeP/GoC/y2NQQ7CIBQFr9KwlgQoUOpVTBcf+FVMaCtQNWl6d
 9G6nGTevI1kTAEzOTcbSfgMOcxTBX5qiLvBdEUafGUimNCc847GYnivaY5xpa8Ey4KJGi+Y5KN
 ArRypyyXhGN6/6mU4OK/2jq58U38j4WOtd+XQiIWM1M0xhnJuACwTKPuRWSWBmbZDZZzutOJOg
 vXgObSCGTLs+wd5W3VKwwAAAA==
X-Change-ID: 20261117-mt8196-smmu-wrapper-8d2041f2e65c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

On MT8196, the multimedia SMMUv3 comes with a MediaTek wrapper that
merges its interrupts into one GIC line, which stays asserted until
each of them is acknowledged in the wrapper.

This series describes the wrapper as an interrupt controller next to the
SMMU node and adds its driver. System suspend is not handled: the
wrapper and the SMMU lose their configuration if their power domain is
turned off. This is to be revisited once arm-smmu-v3 supports runtime
and system sleep [1].

[1] https://lore.kernel.org/all/20260929034510.2023173-1-praan@google.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      dt-bindings: interrupt-controller: Add MT8196 SMMU wrapper
      irqchip: Add MediaTek SMMU wrapper driver

 .../mediatek,mt8196-smmu-wp.yaml                   |  70 ++++++++++
 MAINTAINERS                                        |   7 +
 drivers/irqchip/Kconfig                            |  11 ++
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-mtk-smmu-wp.c                  | 145 +++++++++++++++++++++
 5 files changed, 234 insertions(+)
---
base-commit: aab02e49f0b54a0837e58c67651c4abdad1a3208
change-id: 20261117-mt8196-smmu-wrapper-8d2041f2e65c

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>

