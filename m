Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702163;
	b=goyWxd3eZ1fe0Cv0TvJ1QScA0iD4peeka2DfZoCdXqe7roMsyBoY5ceJGVnqmYLHnbXV
	 9XeO33WXNJWo0fhFuSvw3OusyqdVB8ToMDtN9JJPSRuHBHJ8WL4Vc7X/77hLwQdPfUIAc
	 /mx3WN4VYBTAdG768NFxKXmpB5HvrAPcUxBPWLfVT7z/3vRwymmaJQOHTb+NiScRBDaLX
	 4DWLK5k84TxYSlaY7Y4wEmFuY9FSPBm7B/D8Bat9jH9UurGGk+G+Kbf0z4r0U2x/+wL6p
	 MCXQ3NN1Y1HfI7PO4YtjG3N68cSFWMTLzciskZs38oH9bz4zMMvLY6wvle6cRKyOLNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702163;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N4mxJ0Y2k5Qh49aihQ4X/ZoRxoT90NExmpfeJitopTE=;
	b=TiQP2C8Cwj5gEzV1FGJoUsdzHF6EIEHrFJzxXWaH8zk0nZgPtYDyHRgjhKqlsUMZtio3
	 FRiOh8aVhlsNyLbqwtIR9XQCNvMdFTF0Ll9W1erT2KyLYuhUCu6G90fkPBNITCoIHKne6
	 kQbJCC1hhcAvAF3LjV3LiiyX7QAVioP97KSk7gvO4SoLEXkwO4jGAzLGRA/z+ekoociNa
	 /a2YT0inTG32Pg8fW3G00NVG5z2m0r4yAusaPsY312BqgcCBr2lwrLVK5iOXyys0ug43G
	 BzMjZHhw378cS957nSYVnu1UfEd9ONDW0BTqxNNIzhoXS3+sNzkxIH8nAd/j/8XLdjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SJRFr41n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WqYvf/sZ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9BA606FACF
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9BA606FACF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SJRFr41n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WqYvf/sZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAMwU2554821
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 10:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N4mxJ0Y2k5Qh49aihQ4X/Z
	oRxoT90NExmpfeJitopTE=; b=SJRFr41nDTEAa8Vd+01B8axC5RAJQUezRdR+gJ
	ErRBUscEfRFBr3ag0txwWmyOKylWngykDi6su0Jy1A7EQkK4DsSTYdD0PcfAlU4j
	K/E2FCB7ZuB7A02hy3gsYS5q986fWE5u68lPF3XZkFdIBnrlVo/IFGipMSdIdrgt
	XZu1qW8HZxztlJSgnwrlfPHxC6R8qPIPG+qXONcv/JoOrBG885JequIWTTjuZiGy
	13B8xt4Jm40gbOEcE5RZ5+XZoPXDTSGxPOfW2PlA2ZT2cKTy+aiwWl7o5v9y69Aq
	c74BBEqUGLst2X9zJSP3khSoJtIYLGAWfFvhzkkFAHUDjzFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjq3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:36:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so649223385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702161; x=1794306961; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N4mxJ0Y2k5Qh49aihQ4X/ZoRxoT90NExmpfeJitopTE=;
        b=WqYvf/sZ/FMBah33nSgY1Qymex9hBpJ4kaIrDx3XbK1Hg0kot5Xg32VzGoHbaYtygw
         gQ9CSNCyh9LlF7OfNAX3b5UG1hYff5FGeUJZ8YmoKbl5YgizJJc+TJQjhJppDc72j1Hn
         Sp34eM9xrvJvkYJT9d6KknuWJlDOlmvgH4P8mZCOBoumyQzxH2PZyG2jV+M+nwCS7aBi
         c+gWcuecPPM/XiR8ulHiZBk9ktuPVMkopfaLSg2cIUk9bfMvhBrPEBx6u79HW+Y6Atxj
         e9xhiWv8zE6E/abPhOqYrQIcPMtmO/NKBdNDL1GpfvimOyxV0OyXq/8kXa151y+6o59V
         mc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702161; x=1794306961;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N4mxJ0Y2k5Qh49aihQ4X/ZoRxoT90NExmpfeJitopTE=;
        b=dpDVSwMqRMewaTbHQMNZVMzNMl3pnqqHhk9r4R5/A4GlxP1LMHWZEX6idHPL1ZL3QL
         GIGpk1ME7rbogYVNpXIlgSGFToNhteWqZ1iuymFDTJ8q1qlE8LkImUp9gv+3CDbU4M+z
         LSDAb4O0QpKg4VObYb0mac19NwUdw4ErnSBODPPYvxGm/R9eiVWC/b9N8XDE8dYE4H9g
         ojDS2eJXkD22trQchpMrAKi+SpoHChu25WhiJlWrFJepFj/3m/wWlat5eq+zsGN6dV9f
         jbCgA3B3VpDOzL9F657EjBtoKjFlQu+VKWvCShRHmJ6YEEorsBAaJzF1TDt9rMYI6UEf
         7CHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH/VIc2SxTxwiil55UU8v8Fv1eTVk2BMfCRo/1oPYed6a911COe6Ic9dldnRCiDvg5B+LxDXTlv1lxJMM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IHbSysDdy77bKZE31+uxGdtpmpY0QO5yn5vLBUS3O8YKfzGS/
	+pO/k2A9rnhu/OeP3aSnnMgYz+rlTIDaezbFAfS0vUYBMrrokWowQ8eQbWbJXOiAFUlWowj+/3q
	0krMzrxzYKvXpVJuVpksVgeQ2L26kbdMsku70LugPQW+6UyIkMPLuHoHtp8k1D9DGz+Nee8nehR
	k=
X-Gm-Gg: AYBFou2msGdjfXFpC6g9HgOKJ4SDOomQvPCRUcUwY8RhCKLFxStdVZXECl0oKtdoKJM
	8SMmqJrlCsRWASQ9vdkbLWSTyerLmNRuZtur+XgZEi8Yq6vZWR6aHUK0LSl4oZPjSoEIgpkKk4J
	78XtI1yrWhJ1LsP8xqlId08Q95ntLWVy9zevJzPb+40zVpztnoHR6Ago0RcVOQW2tiHV99UEVs7
	cCOcXOjxyRPluUQrQ6ivw+vhd4Le2i/eaA4WjbDkXtzbPRqv57RymPuQq7efDPN5vlobfL0U7ZS
	EvYNy8t6SiBP/cV/c0WIA5PPL5TuPS7wsurwIGEMoFZeq1zWEUAGnnNRpSEob/cEQq5seK+SbOS
	82ZkHZRdB1GyDJaFMZ3iIWlEU7tDvRdlZ4RHI2REtzWrwV0V+JdZcHRiHPXda0GeTBxRqWfKaNn
	lbPg==
X-Received: by 2002:a05:620a:3181:b0:944:907:8f64 with SMTP id af79cd13be357-9442174703bmr2045666085a.67.1793702161460;
        Tue, 03 Nov 2026 02:36:01 -0800 (PST)
X-Received: by 2002:a05:620a:3181:b0:944:907:8f64 with SMTP id af79cd13be357-9442174703bmr2045664385a.67.1793702161005;
        Tue, 03 Nov 2026 02:36:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e0fe6sm55210015e9.1.2026.11.03.02.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:36:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v18 0/2] phy: qcom: add the SGMII SerDes PHY for
 firmware-managed systems
Date: Tue, 03 Nov 2026 11:35:51 +0100
Message-Id: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAe56WoC/23OwQ6CMAwG4FchOzuyDjc2T76H8dDg5pYIww2Jh
 PDuDmLiQS5N/qb92pkkE71J5FTMJJrRJx+6HEAdCtI47O6G+ltuEM64BMY4Tai4ED01g6O9m6h
 EJrW2WmGNJG/10Vj/3sjLNWfn0xDitF0YQa7tLwbHPywPUEZlBcxiI7hR4hxSKp8vfDShbctcy
 IqOUP8g2PkqD2QIESpluQaObAdaluUDBon6QgEBAAA=
X-Change-ID: 20261002-sa8255p-eth-phy-6a0699f98a7a
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5985;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OSH/nSegAY4/sUehIxakgb1AuxxbhMkC5070iHnGOGQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6bkO/tSQu31z/oZTDK3/mEWEb8wNRfecbFn9R
 Do3qyMqmkOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaum5DgAKCRAFnS7L/zaE
 w4MvEACb8Fq90GKKmgqJLWoeI59fXDlpFqVmQWUxutTSnpvWY1QWhJc2cyXGuU+Kv+PizTVr4Ot
 h1RRFaSzPVAUK1N2xcLAUIm5yYBQ5fr3GFNAmUfjK+8A/gGKl/GH0cejAMmyDVWxV8LG58xTm5N
 6D60t6LSnC4DMZgBGlxT+k0vl+RUfYcA9DjUY2UdMwvMvF8DseO+HxRHCOW909Dt+tlNdkAfl0W
 rwvIFqDK+mPmi1E1TzQj5NTKqsbPqQDQlOk+rb/oaDV8fyvBF/OVxi9bKKosx2NPEwT3zNdZchw
 yS4cb6hoeLBgg0ba1TsAzTmzu/SbQ6rYYH2vHBfXOTLTXwstwpk9qBud3k41+QdYCcAFeR2+u63
 SrDco4OC/mWZbqZnaaa4XvK4wvW4xbFykmWLTjZ9YdJSyx6YO5kqG22nQ/KaUsi4omBXDN8ZjyQ
 bF/n8AWZKscJAHs6eVRHrxz9rJ0mvManvzVgiYm5WnswFKhERvpukybGstnST8YIuTR0VdqrLTQ
 LYQ9uwoZzw5x5E5e11II3F0Q20CDAQYW3nYXCcs2i5k/DPr+YzaedulZdlGwXS4cRPx9dNxDjjR
 sTSBElDF/pVa5wJFr5OoMnXE8YG0QhkHQkDge6ucrp1rzdB7brw41pxQJyweKqAXrcZo/+cszGS
 weuxSC9A+0HWwyQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9b912 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=h8s98YD0dNPsP74th3cA:9 a=ETV7lutk0qaDVqJI:21 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX2nybbuHU2DYF
 +xEKW4+Tz7GsfTL3o8GZ2tWCVn9gc9OB+x3614yOF2Gg99y6wGSyPGfKaxFsmmswCh6Cr8dldIL
 lTq06Wj1aDYLKXo6IVyzdz/YLPWtHfrfxBvzfG24YES6U0eh1yZtqOTYSEgqK+U/Jrn3ulwYsvs
 4JGH6hJvvmeC2MBj+UrQ5zoNmTfxq3a49q062w3M7EJQmLa6l9z+IFwm71hbQLhp/Fkub3JQzda
 U2TiaIAEDb7eksk1b6IL+TbGkoOXPss7NSnXmvEQNsd7H4tEGX21Vjt7SSkzcAx7c7Bsy6kgub8
 OZ/M3CKNMIVUVJBQH6izqIZbtMlXCJeeFb4pmiyYhPQ0qWK0xlxCmgLqrsJolnsIUcdE69IW/jY
 DtJJ2vU1MnPPHFfPwmFiO4QJul+d+clCv22S1JgzhZw5XMtwa4q6rzAzdtnx0uU/tnrHI4wZV99
 WtGdAZe9VwDa5/i+RXQ==
X-Proofpoint-GUID: zNoV1zzSXHhvvZnkxulPk3hoOdXMZNQK
X-Proofpoint-ORIG-GUID: zNoV1zzSXHhvvZnkxulPk3hoOdXMZNQK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX2bgkb2EJmX49
 iaTQ3hylzVvhtKKbxg5tZSg5aIeLW8mgAuQorhwexnmlS4GzbRmhbrKkersnXgwiS2v6qJ455rO
 KAuzEcBe3jJeeBrOYeb68X3XWsROSDA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030042

Vinod: Sorry for the noise but sashiko pointed out I forgot about one
comment from Krzysztof. This still should be good to go, there were no
more sashiko comments and this is just a rebase + a commit message tweak.

Add support for the firmware-managed variant of the Serdes PHY present
on the Qualcomm sa8255p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v18:
- Drop power-domain-names (Krzysztof)
- Link to v17: https://patch.msgid.link/20261102-sa8255p-eth-phy-v17-0-aa138f2912a0@oss.qualcomm.com

Changes in v17:
- Extended the commit message for patch 2 (Manivannan)
- Rebased on top of v7.4-rc1
- Link to v16: https://patch.msgid.link/20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com

Changes in v16:
- Split out the PHY patches into a separate series
- Set the SerDes line rate through the OPP API
- Link to v15: https://patch.msgid.link/20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com

Changes in v15:
- Squash patches 6 and 7 to avoid a potential hang-on-resume regression
  (Sashiko)
- Fix the AUTONEG_DISABLE early return path in forced mode (Sashiko)
- Fix Kconfig dependencies on generic power domains (Sashiko)
- Set the performance level back to 0 on unbind in the PHY driver
  (Sashiko)
- Use devm_pm_runtime_enable() where applicable
- Link to v14: https://patch.msgid.link/20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com

Changes in v14:
- let genpd's own runtime suspend/resume callbacks own the perf state entirely
  by calling dev_pm_genpd_set_performance_state() in set_mode()
  unconditionally in the sgmii PHY driver
- drop usleep_range() from the PHY driver when setting the state as the level
  setting is already synchronous
- add missing power-domains limits for ma35d1/k3-dwmac
- fix ordering of clearing the sgmii loopback
- configure the wrapper clocks synchronously in scmi setup
- Link to v13: https://patch.msgid.link/20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com

Changes in v13:
- Reapply OPP on speed change in the PHY driver
- Use linux/device-id/of.h instead of mod_devicetable.h
- Fix the "invalid PTP clock rate" warning on sa8255p
- Add commits necessary to allow correct link speed change with SCMI
- Link to v12: https://patch.msgid.link/20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com

Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (2):
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems

 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  45 ++++++++
 drivers/phy/qualcomm/Kconfig                       |  11 ++
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 113 +++++++++++++++++++++
 4 files changed, 170 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261002-sa8255p-eth-phy-6a0699f98a7a

Best regards,
--  
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

