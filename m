Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173870;
	b=3j2mA/mUDh1zBWBTkl6aYtt62miDXJ70fzm/kPBDHplHuFmcx472c3yXjFHhMo4EWWKp
	 xOdXX/C2/sdvr6Ap8Oa9tlEkduLYPMj3RD4+SO6Z9G8XvqDxA3oOS4b4G5v5I+lzm/xq4
	 Ec0dtpOyCKvPor2zqYJcRlMZ5s6fKlTQzWpOzbTfi9US23cK36d5RJA2zQJu2MdOH9K1j
	 57W4mo2XGyl4lnLJq9rwPxM/Gn3BNZS7/HNJ3IZGTJ05dTl+yYt0Imwpt6jtbxABLI2vb
	 gwlSXaxC3QG4/RYfJlsJS7ylipHDN3aPy/Tq+JekMJbW4gDQu5hzVZBhdKH22rOfRxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zwOSIJQjqu1jiO+D10Z660xd0C1HKGPEar6chOI2AHs=;
	b=i78BAi7vBIqP+JjRJHNDmSSXNX/oUKipMj2e4JgT2z/DRjViNjJGeB9O0ExhhHgau3lo
	 8wNO3E3c7kWANIimXH1A4CxpRfG02K5obd5QrLlIZ0d+LxlXyqqERbnoHUtNUlkJzeho5
	 4jL6IPERbXcFjLIuh3us/WLGfpRILfVhdS0wzOdh6OjAbcZXNysU46nu1PQTKLmp8unjK
	 HVuApin/SDbPRlSFwr82bHRVQ5xSxyizIzeQxrc3f69LJmORk2jEAp3r/PdxIWqalKr9P
	 xezeavWvaBueM//WItI9/QfPlgmXT5NpsAI+JNIKA+Ry5A4R8k/cQwqrV9gi+kTLNQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hE0aSd1o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmY6Thji;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7B2606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D7B2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hE0aSd1o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmY6Thji
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PVas655647
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zwOSIJQjqu1jiO+D10Z660
	xd0C1HKGPEar6chOI2AHs=; b=hE0aSd1o1OyH1owE7CEwhpoMUehIl9Dop7ISz0
	wVLZ/wDDJQZ9GibV8DSUn34BgYXrp+g2AWqtYSiV8QgwDtghqkJSpNSWskVhfYO2
	ETZqLGPcXTPrM8uO2kJ03OjXoc/gJT8zWs0ROcgMSa4So41FJzeQ3poyKKQT8qen
	UeAYxllf9tAgmJqc6kTylmxf1ZVBA8tFN9xoQE1j6TEZKDMqRYG4kQXEPzyuwy9g
	HCdWDmSo3lwH9ZKIPwX6c1iHegBg9lLITLwTJMnSKHpHY2pgQdQLQG1x76BIL2Fd
	mrsX4j6NfnUaOYPbLDi/E+VT5BpjFcHe0gPIoVOGuDSm5VsA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7h5m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:51:08 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so1981013c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793173867; x=1793778667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwOSIJQjqu1jiO+D10Z660xd0C1HKGPEar6chOI2AHs=;
        b=gmY6Thji67U59lpx8Ch/zGGWkmUybnVTONV9oNDoWm2QOyBJPUSEu7FzEzKZvtmhW/
         5wAoAgx0hcN4nLOWLFBGxQ3J/TWcmbCcbt9lHv0APVCrIbHx/m3unaoJmG99edc9xeCc
         p3KounxSZkjKbeWGyo7i41Ginik2vGF3f8Gekeif29SjgNfBMXpH+5LQY5DVRfe7gv06
         kaiJcLDhnGHjScj9kD0L6pAMfRKfYKhQDIsyJBsNI8ZETQZvk+ZoRBGQOVM+8SLT/j+4
         Yrs6CEQVtzh1Z6gbf9tCmrVq+L005GTQYnT5+L2ReCu5nUndBEZySYjzlpql88dRkqRf
         EVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173867; x=1793778667;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zwOSIJQjqu1jiO+D10Z660xd0C1HKGPEar6chOI2AHs=;
        b=nlTjBLP2gkbyHc+RDKo1eqCGYwRDJ7nkTQ1rqsnABwCgDbTf0BGYzfvh7m4gjQa6uw
         J3vXWzy39pkByldBLBq6tHZx9Tjp+422dDOH+uETSTSCClUOSAfTho/U78rFIhDYEFP1
         6spH/w+/UQrR5WkG+toAw9iJ+1w6fsGi3rqF6GaeEmzvUM53jcrQxMxtTO8A7dumEG9h
         jdWob9SUhYx7M9t3zL33vYgJ6QqxERkOt6GJNCt5ug0kYI2Kfa0TCtz3f7f8EtHDZwku
         m3FeSYE7NjSiLGGPA1qarObjcZUSAUqV/lmMUH4ywbE0xCv6AvT4e4Kxd7P8HWDE87ae
         2gtA==
X-Forwarded-Encrypted: i=1; AKwUvBx6rcfn94CCq7FgpRC0F9eFBGwzJa3Y6PlhJYzpZy5hXbT5zPG28W/ZpJsIrgUJtYh28dENrZnET35e3Uc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNVaqnmFgDo2h4AWSenx5U9AsIqacug+g2g2lpku4vNSRaPCS/
	RK6lOvKyHfzHld4sEJXwgb8XtEml9VEOIfIzy5VbLql4Z3D08cHVetIpqNeJHOIf3guscvAS5Dq
	GR1EA+RKsllZCH3u2V/2C9W4q5EYtSFUQtkLiHFPDW5hB0z5AhuujyabiE4QqNlS37BE=
X-Gm-Gg: AYBFou3lLuVhBWNI4+K11W9nd6rZxHqY2aRDf5qk6riJXuJdNuCMwUnRHn3McBGwsXS
	4JdU1WgZAHPaobqjZDQ8WT3RO2X+RtR9ibQIAlvfezAtx/E9WraFHPHW5IMbqbYK9+dCvQ/oUEL
	o7VMTuni4TCO370S77pvK7uPXyjyBUPe2dUV6Ovc63It5yem6jW093fH4cfOlT9qYU/zMRNZaxn
	6lnl09nHPvnyGFk7DZTf1aWAUKRdNg3BS7nmvO+zo1JedMU1ONWBf+3/1RWfXjhRqGfkAxNDmEX
	Un6AKv72r6tsfpH1raFv/jXeI3CQN8bwhz3eWjDNcuSUoSHLFotjtS7V2kc1RGvSc3VylNeCugv
	lZeYcF49OGP7lAOG2+pmPTDG2nQA/yYeBjorcY4BB27qfRlNOE/qXW2aU1dFlaPTIUgA6FRhPuK
	wyBWszKHhfWeOkmb0WEBnlZDtDT8u1avPu
X-Received: by 2002:a05:701b:290b:b0:17b:fea8:1425 with SMTP id a92af1059eb24-1a6cdc492bfmr2054910c88.30.1793173867056;
        Wed, 28 Oct 2026 00:51:07 -0700 (PDT)
X-Received: by 2002:a05:701b:290b:b0:17b:fea8:1425 with SMTP id a92af1059eb24-1a6cdc492bfmr2054887c88.30.1793173866516;
        Wed, 28 Oct 2026 00:51:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c814917sm3430261c88.5.2026.10.28.00.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:51:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 0/2] arm64: dts: qcom: nord: add CoreSight debug nodes
Date: Wed, 28 Oct 2026 15:49:32 +0800
Message-ID: <20261028075044.431228-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfXxm4WTRoK6xRa
 +wT/gVSpJGBHi3X710FfS+PPwjyOkYzgfCY40LuDr/towwTwK01iMLtOI5lHO5fd6phDbrN55Q8
 h9ljt8ehTnzw7IQCfpuKPLaYfCMSGSc=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1a96c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GL7yGNlxQxINzW0oewMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 45V-N7osqaN5VUuDOmWOMOSxwWYM2WfM
X-Proofpoint-ORIG-GUID: 45V-N7osqaN5VUuDOmWOMOSxwWYM2WfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfX+S+g4idFOdl5
 eKJPsHWGsYZwGlC8XFQz2RPmaOCM/17XFfh6HZ1Y3Xbab+92AtLRJomXdFvsLUj1kovlOkdm6F7
 XbTmJFkzeDyVBgvUP47Jybk9cPIQXE09K4ejjjSnSurZuSdEG5cRKFRSPCJ3LQnqjFnuk75h2bS
 y7PJWnDtJ4nxIDYsJR+TWuH3ddo4Bl/sHq8fqZjj9deD71p1v2+2OXkv4rOvSFs+pONHSjs5asZ
 3mS0RMwkTsqvCblo2kpifx7roxx8AbA2zwgpoFSve0F/1GTifI5FxTHtxpHyk/ntFOav5kNx6ON
 P/MwytYf15d9dwZxl9jclZQY2GeA1mR9xTFPGdq/zT4w8MXLpZzZqs+pOO5wC3elh/g2zM2hWBi
 x36htM7wpE2xhyseBc4vtOlUdJ9WUTd8v5ZnfpHTjsLq4eG3vrV373yt5nV/n6lJTa4eZwqknFi
 uAgzAtZMDV/DawepDyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280031

This series adds the CoreSight trace topology for the Qualcomm Nord SoC.

Dependencies:
- [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM platforms
  https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Tag the series with RFC due to dependencies
- Fixed the ddr2 TPDM labels: tpdm_ddr3_llcc_2/3 → tpdm_ddr2_llcc_2/3
- Renamed tpdm-nsp0-cdsp-llm-2 → tpdm-nsp0-cdsp-llm2 so it matches the nsp1–3 nodes

Jie Gan (2):
  dt-bindings: arm: qcom,coresight-ctcu: add Nord
  arm64: dts: qcom: nord: add CoreSight debug nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |    1 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 3088 +++++++++++++++++
 2 files changed, 3089 insertions(+)

-- 
2.43.0

