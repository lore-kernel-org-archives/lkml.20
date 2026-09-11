Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6541243801F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109468; cv=none; b=u9JfxjCURMCEAum9pA/BSzVtYr7zVIDcQMIw6Ysun2idQps5JoeyhjACHi+H93zWhZxvamQ+Z22+UPhrUq/NHQ9ti+bMuziwtgS45QCenDbVY2s/hictxz3TwYNu0DymetahLOmewhUD4dyvTrudCWE6N9+XHfPKZaPDty3S6b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109468; c=relaxed/simple;
	bh=54AH0wpcG9YpaT0g+nIZHW5mTY7n0dyJOnTEuoBzZsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AFDhPXumFN/kPn2hPYiiu5lW2gq7QCOUSEfLZ01Pya8vy8ut49ukZC8y3KtEKd1OPPAT3WN5i+lwLO78vhLF/9I2Sb+LZj3019ZN1KM7xXrAj5wJtIlusoEeTQi/1at6XyUJpCGrimZW0AHeAp6sPT9JbcVEKlXcHvw1Tkp2wvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgO2XSnR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZ2+S6Cj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgO2XSnR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZ2+S6Cj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kYni3551623
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESjwPrnEIUlNIc3yLIKrBbkMQbbO/4n7ANjjFBlx9Y4=; b=UgO2XSnRqsQ0n409
	FfkzMdmNSg4faLeQsqjp/TbW1E4eEeZDbXNvKF8ASuiVENXjlwpsLF3f4pGbdBYb
	wIVBIdJUOcPiY15Utf8GfaCA4sALd5Rj2wm53gg/arufny0N6FCLpJCNV3O0cAsS
	IXlbJ290Q6+BoSZpFevzgOhODBlYlN7Ipi8HcSJG2zbdcdaXDzagq4XALJtDorqF
	MGib7O77ZdrCc00AUWR4F3aoDFvm42giyJovSf3hCXuGIYm0XmDTRAzjQuzKVBiw
	Su/wxtBpnquaYO/t82mcQX0iRfvyrKMHdxxuMpf86KAb68rbG8t/f669EPeUMY1F
	9b8LGQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg0gc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso1004796a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109441; x=1789714241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESjwPrnEIUlNIc3yLIKrBbkMQbbO/4n7ANjjFBlx9Y4=;
        b=UZ2+S6Cjr6upZ3rS1ylzBAcaMIrZ+bNFGyRegPUnzZ+bY+N1hrYduNfNz7QnWMS6NA
         +t1d382IWofjXDbIQHduJcpRBReMy+nmwqoNkSLX89tYyUll68FjUAF3xU7bFQAGYuwp
         drM1O7NbTiRRxjvMFn1Zy9WLUk8CzcF/qPM7BK9PU4FDriOzQS70C6rtVauWIG1ioc6X
         7ln21XOi3XKA9ge1SY4SK99FmNeW56in2Ux6EbqGrczysYY73oFKs7F81ZsepNE9jYuF
         KYDPppze6R1LaTKes949WhYQZP47zzaSN9sJvGMRg1foLcDmWLpE88b2kdJ6VyH91+7S
         4SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109441; x=1789714241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESjwPrnEIUlNIc3yLIKrBbkMQbbO/4n7ANjjFBlx9Y4=;
        b=rOovC84dd5B8adTZTP60JDDczVs7Y+VKWlPGBSpOmVOSKQjyyJiSXcExZAKmVJZ/0g
         EFgjw4PsnjJgqiPGgz/K1JVGIBQrM8zh0uiVU+uaMRkA1/zCsg/vmrYfmND4VwWVxo8j
         pcaLu7K9Dka+PflS0eXjY4qIsVmiFwrUMP4NRVVulVcaujClS8muRP32wZjdaf84j2+J
         BeHc5JlVnVG2MjvqgfhehH2Dbhab+sdjlMkByNjxtaNkEf/P8iJphHXr8EDDKv2xXTQt
         xN4myOyEMIjjWKxTylRhwVEmnyLVJtztEvGC30B1e5qS+PGEfX1Tkm2O+o9VHpNi6eXG
         JdAA==
X-Forwarded-Encrypted: i=1; AKwUvBwZxazCZcJ2RrK2vPlM9R6IwnFfZSZkV62/EsbqBkP4dFx2d16s5FaL2ugBKQBvG8l9y7ceNP3WvMTWK70=@vger.kernel.org
X-Gm-Message-State: AFuF++lg+NsRJf+5IHfxxciBkPkD/Gp4+fqPwGHTD+HRtRDEh+RuG/uR
	wZ0rCuDvDl1Vj1xmPRt4hp692vI5aRCFiLo0WpVgY2A3wztMWxfhejZR8CseDuGF3UFp2ki0UfG
	R1CRkSy+jTgfKzJ+h558VTyQoQS7WY0gx6W9rrYc9BmvGWedhzxV4vIuIIPClTqU16vI=
X-Gm-Gg: AYBFou2DR+okqjN/Mivhj2QhOzXQcSaDmzJNSTxD7r4S/E/Dn20x+qJfeNOdzOsWXXQ
	SIqb9jsmv6oF0OIYJ+9Tu3E46YzTcjZnRquRRoWKFZCkUdEZES0uJ2Nqm/Q5Ch9ces2JAwtehWP
	1cnyP6FwSi5PRM3sOx3grA9k1Gn7cO9mHV1NbpEMd3ddUrWS2ZnWPDZD1PX1q9QAj07FqBl4gRk
	54+pbhZwTqoaBHBtSEpZhFUJv0VWKPh+utIa/DhpyzfiH4OzxVUdai14JuFa8EU5IKhstV6u59q
	RIzSXd9X6+Qonlc/jC9KVSbPkyU0d6SoWWuRcxZw2BS7P2jAv4+Nd99qw2y8fxBivGZ7290wLlO
	Pb9GVRDwzcDTcQ0VzImWLS/+UecC4mfKKZVU=
X-Received: by 2002:a05:6a21:1f81:b0:3d1:8876:fb1e with SMTP id adf61e73a8af0-3daecb1c625mr5367907637.0.1789109440988;
        Thu, 10 Sep 2026 23:50:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f81:b0:3d1:8876:fb1e with SMTP id adf61e73a8af0-3daecb1c625mr5367829637.0.1789109440431;
        Thu, 10 Sep 2026 23:50:40 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:40 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:09 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: kaanapali: Add t-power-on-us
 property for PCIe root port
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-8-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=822;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=54AH0wpcG9YpaT0g+nIZHW5mTY7n0dyJOnTEuoBzZsc=;
 b=qDSjsEdHpTfGxtuogt9jV6+RP+yCcb7lMWPeldQM0K/9pIz6VebA2GJwDl96hTcq3lOD7cNa2
 li9LqTd40rJB1YTzfWxGbzGZY+iZ0kzHi+3bnvh6ERWnwp6AD9InFuX
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: VcxAXp5qRwqA7Jd8mTwvrItpXk7z_7Dl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXyVKM6CG2n9YU
 U4Gdud8P6PF8QciZhxgXm6n9rUNqpwHuP1DH//6exhGaWb0OxommXOdHQpEMG0RvP34D2KV2PmP
 xL6aP67EJUPkVrc1FS2OVTjpttzw7YE=
X-Proofpoint-GUID: VcxAXp5qRwqA7Jd8mTwvrItpXk7z_7Dl
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3a4c1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX1+vPjLcTJ3i1
 fCHBsSrHV4MtZkhH31fVQAQI8Kc25fFcXQQ0Qnn+Ye9JIeASvLPE4ovc0lVaOyTVlsQiEqt052C
 pLcyZuJfi/S471LIaFp31PGFbdDS+dJVowU39+TWcFr+28w+nkDtiY74792jM1Q0lcnGzv0ozdM
 kubIxbguN/5R2h7o/WpzikzJJ6Cbwo+9qhfqb+kDGQ+CR98RrgJZ+IzsjN4pnrU1o9y+pZijOaZ
 vYCNFwikX2UPrVqEtmdOupjAqQn6NiWNOIYhLCeW1o+o5AOVdZV1b/UcIUsCGGkgTU+9WQP8wQh
 84nG3W0iXhjoOaBefZAodzpdOmuXddnjJwr+XhytDbYilpDiDs/V3UbTRyNEibPhlN7wW9NJpCu
 xS9ExD4aG9K789sdTIj7mjBXkNRK5kOzZ9TF6UgQy8ZJKj70VGUCwcy+3SNMezSWp3FNgsv7uSQ
 Ix4iM7QvlDlJklJzcRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root port so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..1a47fafe7265 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2456,6 +2456,8 @@ pcie_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				phys = <&pcie0_phy>;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

