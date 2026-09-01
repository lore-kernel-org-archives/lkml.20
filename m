Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7026D368D46
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226629; cv=none; b=tfvwmKHyqSYg1QnYqtvED0VWQ00FM4K95+KLt9FQlfxlNdOj2a3rsc6wkeM4u/Cs20OEuRMMDzrlFK2y8FtvIpMYnsN6Ab18ydmnXc4dUneoYp9d+7hSSTwRKvtoXg/8mf4PJ/ZID21DZXd0u3Anr+CK6C+Vxd2c0c3Lq4V4IMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226629; c=relaxed/simple;
	bh=Rux3sdXj3VDwxYn53lIo+IwdAPJhr8/dj2W3Qm3wyFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kaf+ltcSfdUP6vKlU8SkxzWLLk7XX08dwdK7SV9r7l3qAxTgggWK3b0W6lLeL63KrpASsNrOvPTRPd1qOWN9t36eH3D5wwIn4reMMEV5ei4xEuRUrmF7LJ2/6LKR6FGhEwROAKc69G8LBUYStfe6y+P6Zxcr2d2WHOQcfY5vAxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=id9k1C0d; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="id9k1C0d"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9390c3ade1dso23601885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226624; x=1788831424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nNvsaEQcRTultSSBuVd+REzQYtjIe97pxmt20zLlCw=;
        b=id9k1C0dBEfzrWu1piSRmdCDtn/STJAUdw9MZC6lWet+sg/4J+zdJMMMHUFgfXfzgH
         JVxtVg25RzlKTIah4Y6EOc0mJX0rSQl7xXjwQitPg2FBtGk0u/urlDKzm9bDNgvt+epX
         0AQmnIRgcuJkvsMtG6JUQjAyTaSgJk/+f7JrsxcAzSLTtfjLWY+nZBFcsf6PVuT5Ptmx
         YEr2nHrREOMMbjTse2Co7LtpYTs8CO974rw9TM9gfsowQrpu1ZavELsELoZpkV92Leb7
         ly+sI6FsRbiU93ZVJ9tVCSNiHEkZMIhWXUoKMqxrGUWN8XyI5OH7W1lB70o3zCvE95XE
         vK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226624; x=1788831424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7nNvsaEQcRTultSSBuVd+REzQYtjIe97pxmt20zLlCw=;
        b=CyuvWL2hBVzLU/IPSOMagMdloe+UtDSWO4xBbDlojwE+Wq2eVGBH+u/eHsBkJ2L7e1
         AaU/yx4XHDj+6SGNYOu24j59S4DhKTbJ5WY4vzZYTxXxpULylTrF9ScnUZLpVj8t5YKX
         UhpXS/0VA8DPeSxxDsePF+PB9QuJq7d9WlqbJ8kawHIP26qVZG8kcjL7r21j3SzrvT92
         0VkurqcTcDwBQjRjW5onDExMckglFNtEIX6JUejG6cH0qPJysNiYtl0moyM9sMbcKR8h
         8VUFN303dCr3YLxy7JGCCPiV7mQxE9rFRoVO490gfDbIe7+v+IjG12x65facQanqtshg
         ilyg==
X-Forwarded-Encrypted: i=1; AHgh+Rqn1nDwzNJy+EU71ygJ5AdlsiJPBlud8Zs0ykOs01KzXag5kQ5eRmUlUwW1idKYhw0ozw0DYchZvgLOo5M=@vger.kernel.org
X-Gm-Message-State: AFuF++nu3+IQ+BqcU2vd4//a4vM2xl+ZgLWVyUhDQNsruk8S8y4kgjF8
	AI4rtoK+hLvO4GTrWH6L9Hg2A/WVo6NegbqwCyLAEZnxARq7gIJlzdJClQM1hLkOf6I=
X-Gm-Gg: AR+sD10ajoX14mm7C0DqEm/0Rb/vQ8CJPmcg8BT+qqP3F5oIsUIaNDPu+VpxC/udqct
	4bBKA/VWB/UfizRTYsTUJ42joaQZYRhIrwd21bONWa+KLbAGicwnlSv3UkiNplzZOSRTlhKLrmT
	MGbSC7CO/UU7tuIXSY3Ykjd5yJI05tkUvJjBucd8393/RrzXGIYSlh9Nfflb7TgIcT9v+tNzUQW
	Ds1G3A070ExyQbrXfKop9lnpo5Nu7STfBs2mMIeWFd3993VSiidOqGKYkm8h5TADe5+X+x9QsvY
	uKAjXGzxyaWVvWAc0zotWX/Q1xrxWCul1jfuiLDfj7MStDvaGnWTjWdqlcblK7yroXa3j2djHSh
	pIYd+IEmFJOJKlRrt1zW1rfvbR/0UYwrHnsmWcvYM5WiWDx9qWGUnLuS4WS+nDyuynC7QnuC/E1
	euy+Hy1+ckqr06t4iZiWZz46xmPzvT60ldr4X1mQRL4aBIiH9aeg05Q6x7cBzLVD76
X-Received: by 2002:a05:620a:45ab:b0:92e:6637:da3 with SMTP id af79cd13be357-9391394836dmr3178329585a.38.1788226623956;
        Mon, 31 Aug 2026 18:37:03 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:03 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mani@kernel.org,
	krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	jsandom@axon.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 3/6] arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:50 -0500
Message-ID: <20260901013654.1343537-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901013654.1343537-1-elder@riscstar.com>
References: <20260901013654.1343537-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lemans-evk-ifp-mezzanine overlay defines a node representing a
TC956x chip which contains a PCIe switch and an embedded endpoint
that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
these properties as well; they can be added back once they are actually
needed/used.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: b64abb26a2916 ("arm64: dts: qcom: lemans-evk: Add IFP Mezzanine")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
index 6cfa0bc1440e9..9edb447ee990d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
@@ -273,18 +273,10 @@ pcie@3,0 {
 
 			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
 			pcie@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 		};
 	};
-- 
2.53.0

