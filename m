Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2C5361657
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075134; cv=none; b=mQyiTeHdNcFeee6YABfT2dEuO92N9sn2QAPLWnglFSJ/MiOIydqM4xxrDr/8K/uQuwaSj+Q0RcJEOAtpl/gq87j3gtIuTnArpn1AwpCE+gQrsMonhiPVGZqOQKs17eUFqc1fTbWHwkz9ue+lGdu61yyWCEQ7pOSNdKZZrfpt8ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075134; c=relaxed/simple;
	bh=JMGu2iM1quSp3Cy+yK9EW1dG4GajR3ZNEWEAaIoU1f0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRsOJVa+deVZNqUtEWwM3sLKCSCTOgo+OdY+hR81nZ1RMw1LO5/unRTGywdu2ewPHE/LSkYDOpQVyLd1vdAVdKj0LILskdxFKx0pMsk7nilNzjsiWEeElzuMxdsneK6Wf9IqgEhpYeYafhvrJucG++e9VrWUS5QvRRmJvgYADfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=AoDwUjKF; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="AoDwUjKF"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-917b78dfe30so85416636d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792075132; x=1792679932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=87ArKhOz4mXpsOQz0dSA1S5HtkiIocsYKLa7zjBJOG0=;
        b=AoDwUjKFNDMIuLAQpcS31VBM16iaveOUugmbll1thuhLqmTUcZBf2k0csqXga0+k2V
         y77VmHzT57KEJwzkDZC9ezq2aEkpn8cCsCo5vzMbaeFz7RgNxMpLD50irKxpjfdxRIiJ
         pAerW6P1W7PvMLaN7EcUfGmfmN1pcyH8hdKkCpjpfmhNBExaterzBUit5igk+GAWNKS8
         7wZOplvmRG1VipSLmbmQAhzCbWxoRUHKuuDVkQw6/jompkKefOFXM5s5UGgjGgiYDfYQ
         HxqaMyi0/7Xcvhv/Wv4zs8c6kHUkPuLKBNNnCwV1u4aKwxas7MKB57JvvLzvEke9HaLn
         BamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075132; x=1792679932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87ArKhOz4mXpsOQz0dSA1S5HtkiIocsYKLa7zjBJOG0=;
        b=kTMMuzkjZ4EIyM6DDbWLIg7tLHSJC6IH3ABC/9pTI7y5yrIb8N/S5ZoRQBkErUsEUU
         A9BzQiX/5g74m4/0mCSDjxOzw5npg1Unkm7z1hu/i//81r9YMBrwPQ3D7gVZruYq6TJ3
         oiRo8BP1tORoREOPH/aSyYSbrtA+HEIxmygUzEsnpPp9ePoLjbcstuslg0sCtA6+HGDv
         2Bwup86bayvaIAnmUqlJ2ngmh+gOADWkbSJQLYnOW2R7mDzD5rggq884EhSsGSKKlRJ/
         0UU/2G6Yvs1lKSOqqN2sJwZap7oAE+1tuRpN2MYTlfkq4w2ocu8YcIFxyHt1wTI6mC1A
         8OpQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5qHryRwC88LYKXG/GKje3uaaCdE7Fv3z7vPsgIoaLjV/UtOOF7W19bozUiyzb/1zwPN3p7iBnTKmk8aM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ90WKCMjl3LZyfITyXWk+lmZtN6puQF/YOLu71+BYMeQk4Zbvb
	PDbM4D1qD+MdNfyNggbTuwDRUt0YdcZw3srsCRfKA5OJSEIflOmxBEDdl0AaFKMVf9A=
X-Gm-Gg: AYBFou3p4qBmPq56Gj1h7S49e/VB7Vu1sxIm5JJu9SoKrWY8PIWz1eMGl8iwMc5Z+Lh
	3LDfyvFYd7taXVg/hVfqq9veT+Bh1QPolKrEUQ88wgARsUGlz63fmHC4rZryTPD4gYjJolhX5xv
	6lcCu7mzIxDg3Qz1CrfAnMvnlHI0HdzmG+3uyKMyJynWMIaKv1yeci8fbdJ5YIALGrAhr/U/pzl
	pW84doWcykei44djfc5JVMxe3gasjoEHnn8hi5GQlWsoxa+OZHEdPhzK7DlwikDWYiVQ1ebyzQj
	wUbsqFs5SOca4MUy8b9tfkxrLcyZSM8XJMEt7OaB1HW0rpw3PZqQbRF0XDACySeEtOSt3yxS2l/
	zGLzE0ZqloeSa71zLYrvUCULW9iW3h76P/4CVbTrAT2EMaFE9iFXZl5bKU9MX+cpuhr19szGJWs
	DNXf8LtqpByncegmbolHkBXypUk7lY/MFjtPcDKtgz7V0EG+dWPOIzlRvZlygngPd2MeBGknL9l
	rk=
X-Received: by 2002:a05:6214:590a:b0:91b:9061:b808 with SMTP id 6a1803df08f44-91b9061ba50mr181091236d6.21.1792075132399;
        Thu, 15 Oct 2026 07:38:52 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bc6d42sm82581486d6.34.2026.10.15.07.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:38:52 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: ansuelsmth@gmail.com,
	donggeunyoo.kernel@gmail.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	daniel@riscstar.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: phy: qcom: add qca808x support
Date: Thu, 15 Oct 2026 09:38:45 -0500
Message-ID: <20261015143849.483339-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm QCA8081 PHY (and compatible devices) has four power inputs
available.  Not all designs need to control them, and some might connect
multiple power inputs to the same rail.  This series makes it possible
to optionally specify these regulators.

Between version 1 and version 2:
- Add a devicetree binding update that was not provided in v1
- Remove #ifdef CONFIG_OF from the body of qca808x_power_on()

Version 1 is available here:
  https://lore.kernel.org/lkml/20261014172300.292324-1-elder@riscstar.com/

					-Alex

Daniel Thompson (2):
  dt-bindings: net: qca,qca808x: Add regulator properties
  net: phy: qcom: qca808x: Add regulator management

 .../devicetree/bindings/net/qca,qca808x.yaml  | 16 ++++++++++
 drivers/net/phy/qcom/qca808x.c                | 29 +++++++++++++++++++
 2 files changed, 45 insertions(+)


base-commit: 73022f605c447f31610b94ed4a983d2b4bf2c721
-- 
2.53.0

