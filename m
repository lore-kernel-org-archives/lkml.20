Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C88391E5B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018945; cv=none; b=GQjj4arspOxuzHVYVwwD5db9qtH8KnpgJWRxoERTPh6oJB1TljCFlgMkVgTfAHh4LduDRgV4l5sQzpcbGPlx+NGwZjp4XgywynjAq10Hu7AFtGDgG1IhLnPxJ7HRpZmCukWVs4lHhDe/YPjLdXOZRd93SsvC2Ag2lE5GDZ/4hDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018945; c=relaxed/simple;
	bh=5Amsj13Ypf+VNbZXqe2Aip4i68WKcfoJI3MkINWORYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rE4xI1W0CKPaIXzmOMHtslJDO/1AS5gxI5a37OHAphUsoeS7pZJMPp1ZKPVZBxibwGlm/9/9N2bBQ96jb1FwV3ldNRtuHkGbLuv+DJycIhB1DC8cPwyCFExygIB67Zn8lr/MhWKYfmhHsullMgZNHD4nD85rK2pfYvDKj/7Lc/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuoQv8oS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuoQv8oS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so94365f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018941; x=1791623741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EL7Wt7gCvxigatArl4vYdYfYVLxu4uqJTJstEATQ4Rk=;
        b=KuoQv8oSidVn5GsKfTxOq11yuq8ZhuV1nwJ00BuiMrqVHuHD1G4mWS6cvwiPJZptEO
         qzQTTAd5cFrF9MAjvoKNOZgS/K7TmSUfDhVbHrUnstp6T/Igou1ATf/lwUaEo+3SDbHa
         xcO1wuUr8NvjE/9MubWS0sVij+uXZMQt/WJW0IBfvJjgGZVSJYs2C90rnyGDA9GnDLU6
         o6aQKSZukNOsEP4cMqNUN3NSeu2+blA76zvg1NVhAnIadlgmgEiB3j+D5vDDX4VcdBYX
         5TmZC69xKbWzQlxIpHWhzn2cjifKY3oN1yXXaM23Iy/EOa0ii+XZ58duPNkfFCshk5r+
         sdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018941; x=1791623741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EL7Wt7gCvxigatArl4vYdYfYVLxu4uqJTJstEATQ4Rk=;
        b=mESZrbZ/NVNw+oAB5HzcK3+q2eOqovaac6vGB1BzddvHAynIJ7T7b5Z+nqdVsN4+dg
         2cPl4qQKnSvXNsBN/yNFrWkdECxezhE2K3iiyJdSSr9ECuUJ/AhSMjhugutKxD9ACK3c
         bi1tC4+0+6GLWbTly6JM2YQJwR9N0/QYPnD+TSafYLcs5+cMscokY4rkws8sHHYhyXr1
         I74lD2jXnRowDVG1/Y0CkJ3HTMoBtTIOeEee9iQbfdv4YcMVpGheY2ft7o9raVW9aBbT
         nK4HSb2V8aQXPBArD11HMeSVyKYY/yqjRO485pfxU8buSbt2eJVe1C19IL9lo70Snuxi
         705w==
X-Forwarded-Encrypted: i=1; AKwUvByx4VaKK7lIUbjJaq4SyPm2UZhs7y1f3lMhqfBEaDQkV3ZMLdZntWIrm15zOKBBMI2Kb06un22t9+noL3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/tT+p+M8h2G/YzDTJYE1Rzjfm4ekIk4tzIs/AZRhXl81QPNbf
	f1FEVuCub9F6Zp7Ed41MZq97F/qYsRrSHN5cpt9aNGaoHVTpKsYvvzAm
X-Gm-Gg: AYBFou3IoFyOB9WaXlif8Xz7U1EwmXtO6H/5kiIM2dbMbD1JaXRGT7vKkvXIUJ/kjTN
	yLZDbOKWfrwUEqrydfFNfcTNp0oltILo70UZo3fFj6gyw9/ttBs5CMns3wZzX1PmSYz+q2cU2vo
	evsg7r7HLcps6R2yHZDfljUNRNMTPo2aK/+wFDeg3ChQmVaJvfHeQCnj8WmQlEgw9xVIxoWLEqQ
	mN6VOO2xrVRDzPixZotxOgQ9xyjJU/qxYFvk28BL5kikipKFd7/pL/a2UIkWcWhUR4uNwzJQthZ
	WQzV5vHyNuxBM1y4U8FuBzmq/+mqAd5ENX+pOuJpK6swqAiuP54pbJQwZKJLsRG+R+jnLNoRb7E
	B5MNJJjzdxUO337uLrvfYtU/MOXEgztrsZ8LBImcBIquVuNDF3BzYvHvZIZGUczAKW9cT/SG59H
	39fusng3foNs4o2MZ3yCf+r+Ju6FT0w3SmRpj/LfVMg+eDEfye0KVAcLKW98j7paLarDdRzieQD
	qclykAfuqc=
X-Received: by 2002:a05:6000:2c0a:b0:48b:7179:59da with SMTP id ffacd0b85a97d-48b71795ad8mr8328190f8f.1.1791018941391;
        Sat, 03 Oct 2026 02:15:41 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253dc9sm11336161f8f.3.2026.10.03.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:15:40 -0700 (PDT)
From: Franz <franzelfranzel@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Abel Vesa <abelvesa@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 3/3] arm64: dts: qcom: x1-microsoft-denali: disable WCN7850 hardware rfkill
Date: Sat,  3 Oct 2026 11:15:09 +0200
Message-ID: <20261003091509.4822-4-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003091509.4822-1-franzelfranzel@gmail.com>
References: <20261003091509.4822-1-franzelfranzel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WCN7850 hardware rfkill input reads as "radio off" on the Surface
Pro 11, which keeps Wi-Fi hard-blocked. Mark it as unusable.

Tested by adding the property to the installed DTB with fdtput, on
next-20260929 with the matching ath12k change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Franz <franzelfranzel@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index a71c29762..36592b8ed 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -1009,6 +1009,8 @@ wifi@0 {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
 		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+
+		disable-rfkill;
 	};
 };
 
-- 
2.56.0

