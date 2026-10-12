Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2953B48E0DB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810211; cv=none; b=e+4Z7MbJi6u8lVUWnjkJs+U57WpfCaJ/pT22lZNOzia8Gyqyqsu12ocyz5h6Vkf41ySTdVMabHJlef45X6CGR4CqP8/r0n1JZslFvIUwm4vVncpK6IOElwqIpAs/krQebpdIOJ1mS1/UrrmSwQAo1KDbGKSLtm2IKqK7OU2h7+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810211; c=relaxed/simple;
	bh=zkC632+RCs8j2vy5IgxwE37PTmSh0rh7tfcdd7o+YNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJbhPc0rU6XBbxOynQp4UnZ2QFRfV3Zf62o2bBl/XgPWDH9K7zSxpcgNuu49HByggccCPo/itToWfyQ7kzFC+z2xTj8eyRozvDlATYHXPzKB9Jq2Pi2rx7OEpIOsBP7U+rnpjeMdBH5q6D+IE8s19+klG1Kb3c6KnQR3Uvuiqjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=Pd8C7xtS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="Pd8C7xtS"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c411d6615so1245366f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791810207; x=1792415007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJqiAzF2WxkI4SgNTbtZ91E6hshmIIcV6+9m6nd3PZo=;
        b=Pd8C7xtSBv34TuWtGz7NX9AAt7dzjaREJI+07Aj90Qy7n9N+s7gic40+BULQSeyh7K
         +V1sr4dOpah+zWN7H3z+3Tk77cHHmyGRQGQSuFHvHIfWU3GYO909ESaMeUIqopivxP+p
         fIL4gSTpeHMmOjEQBq/6dY7NqMwLA3vl2N75y7VN7TJmRb5m0DZw50yqHwT9HONSHGVx
         Ht4QVR5R2MDmj2rhgIOFsalRTufGFl52p8pSueVIETj5XeFRs9eRuCbSfGexAaOYKiOd
         sAhj0OTrs6baFzF+PHx77p2N+jNxXPIWhR1HXnQLrnh6yQQ0uo575YjENLvQfIV+ajqv
         02WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810207; x=1792415007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJqiAzF2WxkI4SgNTbtZ91E6hshmIIcV6+9m6nd3PZo=;
        b=qoj3WHINlq0FZvymJUzIyF24e4sZKwRj6OLTlsIOzkubVdXeLfB0GEoXbsTcCSRbgi
         ZCuoVi21wJcxANzwXDmsuGPofFTDq9yRP9lnVmgR4uNgRwKTyUa2nzKAgUGTUegYMQhE
         bpAiLE4rSvQ3gy+WHwZEx6aQE5RMMKl2vfLJ8lkZBDPsRQAjh/yHAyEii4Z8jtvqOo1D
         0aQfEDHdVGKL2dcR5E0lPkSb6OMY2yU0RE2btp61hGpF2YFlslqH5nZ3exsbA4PFBYwC
         F1iJvnh+aw4PPd4Txvk+Nlojuds46/rsgMsKs+QZNXdHT5X6WtFOOB3DWLKnQRIP/ZRJ
         huHA==
X-Forwarded-Encrypted: i=1; AKwUvBxeDvQdhVgHTOUXvucyrMX1JzthAEeH5yEm+bFhj/6RsX8hPhjItmVTDuRJpGHx1VNBNV3AJaddrrDMsdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaQQe0hNv3bE4xDKlNdNWybUuVw9HBw8AaJiC2a44f945uStpD
	J+F0wIpCJhSpsdZfgMuZxqJPhHtsH1XnlcySdxrEWaIZYIGvXh8CfiH2h2uG00c55o8=
X-Gm-Gg: AYBFou2voj8vT/oGJHqhuzEuPtMHQMOqcJ2k2UmpNSkmKsSKhkInYbLviE1BYFP346j
	3G+i+UJbFZ2XG1bsZA94xGuzhoKAmjmgLRFP1hJx757llUisr7K2togbEaAmynbrvijbTaVd5Xe
	CNg1ADmJMTtSd6P9GYKD/EK2e5Vye9Yfu9zYkDw4tcmRRtLna0oSoLbapeCt5UZFuoQiD3yEkTB
	IElGiWT82YD4zXko7MVPFxxKEwevzSB3JLMauj33wEMPlO9d5vJDbhWwpeyx9UurdzkYq/Vyi/0
	PlLvXTT0BmpLpcJh2JZYXUa73rPQ4FVfIypc+4GIVuE7fSJF3Zg2A01P4+9q4T/oCIiAOIw07RD
	pUO10iLpRL00kPcM7jKVLn4LJ5s4Gn1EjyUGVO7YK2g7nNmRYBXOlRZBDjLt1yb4dIB8/Hs+NRx
	27Ev4/0g+G4+az5TvpDHzpd1ryVIAxanKVQxKNo67YiZVMPnrwImv+WprvsjYcTrdbx+pB4R/c/
	ESUdyiDbSQy7aJRiq1D0Po94B4irgkmGF8BjdEheG4UHaFlMMKkXDpnWFKuWQClBwJK6eQeRoUF
	rnfATS3wf61iWmwEyO6Yd+nRot6NAz52
X-Received: by 2002:a05:6000:2002:b0:487:a15:b4cc with SMTP id ffacd0b85a97d-48dbaaea8c0mr15810644f8f.23.1791810206335;
        Mon, 12 Oct 2026 06:03:26 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm20088782f8f.35.2026.10.12.06.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:03:25 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:03:05 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sm8550: Add the CSI TPG regions to
 camss
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v1-3-620ab6f151dd@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d21c04b1a306..1270ea8e4fdd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3862,7 +3862,10 @@ camss: isp@acb7000 {
 			      <0x0 0x0ac71000 0x0 0xf000>,
 			      <0x0 0x0ac80000 0x0 0xf000>,
 			      <0x0 0x0accb000 0x0 0x1800>,
-			      <0x0 0x0accf000 0x0 0x1800>;
+			      <0x0 0x0accf000 0x0 0x1800>,
+			      <0x0 0x0acf6000 0x0 0x400>,
+			      <0x0 0x0acf7000 0x0 0x400>,
+			      <0x0 0x0acf8000 0x0 0x400>;
 			reg-names = "csid0",
 				    "csid1",
 				    "csid2",
@@ -3881,7 +3884,10 @@ camss: isp@acb7000 {
 				    "vfe1",
 				    "vfe2",
 				    "vfe_lite0",
-				    "vfe_lite1";
+				    "vfe_lite1",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2";
 
 			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
 				 <&camcc CAM_CC_CPAS_AHB_CLK>,

-- 
2.43.0

