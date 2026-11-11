Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369646;
	b=aI791idU9NL1KxDYYkOw/vf1iE4hkQROldaMlqmZJbCX9qeHm1wwBET5+xRJvGgphfbY
	 ev/ri2TffrcOwFS9WgxXHsXcgs9I8nsEhJnOHK3P0I2L7hfitrUIPpOjelNN5Ji1GDBzI
	 XNxZmsIkGptRHPljSJONi8u6gLuoudKJamSk9Xij0GlKFwu22YXP4WPhIeILTpkDVnqev
	 SYevotPt8q0k5FkAREtRTZqousK6BpSWluZomanhdse+HnilfcxXEtDG/si6G7qw8tBA7
	 znzFx1AUXcL51bsgfPt3drz3tjWgfxBd/n5jVuN+HKM4tgfGk9uG54GhrwXORM++2LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qlr228EuIzXhz/N5k30rrxvQvI1lv73pvJhSOTxy21I=;
	b=fYsjTusr6htMFA70gLH22gZ3Ny2G9X+zUDTGSRM5Ru/5BDOUrfZyQxGnYTKAUGnGihht
	 S7DyzzW+h1n98C0jP3KY9Hxh5K6g5NKN0Tb0odzWun4dXH264N1WDiaO8Hg/t3VbVK5wt
	 mMKHgkmrAJieCJERwHcSRlLABa2nR56RtrP8H8wCltuONRyJidNfevA8wxNEWBsR518LB
	 taPjkUMJR92Bt2+RaXQqlBFBv7wOh/Ai3mvZrenjeLtiY1NBH0vgb1UxWoSHg+6GhdJV4
	 FPJaOulmZtf07KEAwxwq1rK344TWrIDCpicpEYnbYML3gpIqOx8DqqSCc9O8K0qX4aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FH2Z4Cpp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=izKeNjmg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0240606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0240606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FH2Z4Cpp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=izKeNjmg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1teD31569907
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Qlr228EuIzXhz/N5k30rrxvQvI1lv73pvJh
	SOTxy21I=; b=FH2Z4Cpp50sveYA9YR0ZNB9Gwvy745VBjhwlYRsIhZikOFq5p3j
	kXU4mwGf5GNYAeauUytxS5Xny5LWwATbquA15HEW0/zGQCM7eO/gBp6A4DM8TtNu
	Ss5gRsPHJgDW3rZOtnsHGFuMOGpIrhFWIjXQRDjpxnKn1WQa6eXANUUtnyuj3Nj9
	6tm4zlinmG1GETMYf4JvDiW69iTOrq01eO4Y0KxDth1Hz7TLeez0J9hhqPWgLlZU
	WCPnxR4rn6pGKxOZJGavmH/akD4s3JZlJvYNL7oHJiJxOl/mhphp5Wy+4ZrL0h4s
	I3oeI2Ohu9i73AXnNByIYjNd77x9xEGOSLg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97c9sps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:00:44 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4fb73e868aaso3845096b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794369644; x=1794974444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qlr228EuIzXhz/N5k30rrxvQvI1lv73pvJhSOTxy21I=;
        b=izKeNjmgGEb+ohQD0Lo2MAj/aQnsOQBqGfHNjKP+5ahwFvmAq8ETD1AtOpQfQqZkY5
         3Ccfku4MgdWRhiqeryy3U30ZPyIcHWkE6E10kp/hy60LDsJC+W45uW3U6MPZKb3NFMGE
         TU7GYYYUWkF8slxjOWFa9MOBF5SSQgoSRzcj/nH60b96PgXijTmJwNzWYM8PsB4hisZC
         6KtNdCM+Di9U6fUFETUdxFuu0MDbvA+OM4tQfomqYUix9Y02DXSft+LOK9tHSMR3cRhq
         NGJ4cXp8wySDAs4ThKvo7+sLe7W9Oax5OYv9Hp0qYGrqjSDm3YmS8lyFmQ9R83uE68Be
         ATiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369644; x=1794974444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qlr228EuIzXhz/N5k30rrxvQvI1lv73pvJhSOTxy21I=;
        b=m3bqkXIkDzrqXN1sqZQAMnUNt6sEhV5krX5XCPZjD9nxPBeoYBRB+JXsAII+Rk+D3R
         533SCideKyUqbcxFqUyg2KwWMFRjtjxDt/zEQEGER5rVCMnCs1psS6DL6w/basicQmCe
         rvBUKk8ZUbWhtr42gqFTNa8su3v08lm++WPmNZ+8I753gjrfN3w5Vx90YoFndlt4s5Hq
         sZrPWNAAD8M3uojLRHC/k+E68K+IW1k8/cFI7E4aUHaDAIdmniGBe6HIey2BRrhQhSjz
         oR+FEI6cJONK0tvUs9C8Nndp81seXeMCmqJZrxRDko/Hz+BxVawjctP9j/UPR2v0Okln
         vlRA==
X-Forwarded-Encrypted: i=1; AL+hErEhr+v/VU+sECBfGJBhdK6jZq/n7XlfKFKYfloU2KDO93MC1/LPPj5Ca9A4DZ8Xw99wdvol5qZM3ulZgwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dyHd417V2FWkd4DizK0Ke58gNzETAnOzXl+zpp8c+GlgeBjK/
	QD6kAUXCiL/qjcIi05N+AncMUkQX6n2oONGRxGQx8TwQ57WDzrnKV7brdEAbOEu8XH6WCkkokkn
	wVF21aG+IPz+ZfOjrOwzMhd4zWMdK+3mGBT+sePmuj5k2Xo2ZRfGSEnb223VCDTijfyA=
X-Gm-Gg: AYBFou0gt/RZvSu1QuhhzeNRLSuCAcntuaH2mbwDeOQYpVeLjql8Zs19onEncBnygZc
	h3QjDigJSRdTCT5ioJ41PAfzfx7UJ/ze+DKGLqpchzm4EPGF65plcyeFEzsQqS+BaVZRF9Z1WmB
	LJnf6HKCLAl/L25LbmxojE6zp6BrpuC3CjcR+33rm155W3YaSmoMTLCjtK5qMNdwdGziJ7y6tBp
	ywA+hLXEMqjNhMbVhmFGf7Sxf8cG2dLg3HV4TP0rM2vFlm0fErDAlTzm3miAnLhSDHxo/oGulaJ
	NWY2PzigtjsFgrXq9rNtT2nAShtxgZRSujdgl02C7lLBqvkE1TIJjHj1aZ7RNDDkarzq++kZ07i
	3VcZMUFVQB3gti2b0s1b0D+1haKWAtIrwf2LJoVgfFdUQe+pOkmZEel4/hf05cODzmPJWGBu0aw
	5Yvvk87kZuXF0335J3trSGLDyj+aoFaUV9
X-Received: by 2002:a05:6808:3a0e:b0:53a:d128:4021 with SMTP id 5614622812f47-56b96bd580emr1045799b6e.15.1794369643972;
        Tue, 10 Nov 2026 20:00:43 -0800 (PST)
X-Received: by 2002:a05:6808:3a0e:b0:53a:d128:4021 with SMTP id 5614622812f47-56b96bd580emr1045783b6e.15.1794369643526;
        Tue, 10 Nov 2026 20:00:43 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-568f083d000sm4089276b6e.0.2026.11.10.20.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:00:42 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: nord: Add ADC-TM thermistor channels
Date: Wed, 11 Nov 2026 12:00:18 +0800
Message-ID: <20261111040021.3636059-1-shengchao.guo@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfX5Sza1713ZXVV
 wzPImPqyVCp5T/2s0LAQXVH/QM8cWiU7iPaOusDddlEGVKdz53Pp0cUyUHq8hPQhe+kcE0BShZR
 LnXFBdlMU1lcoNxTe+nzd469kz3Owkec+I8P27k3Es+J2woEYetpFjff2duoLuHCNHsRJpoL46h
 4uU9P/la2M4e1zxW2QIUuEvBTZN+xQXqZaPRZCgfTCqnnglbFeD7aVY1rJ11/tcCnIEyZiYEyIs
 cOpXh3PR6c0O7Q6q2zkEtY4cXRAnegLevi0geTCUqFTktFGdh5dCxXoBJZFvx9JQyRh7O8gO/8i
 LfSB/ugHrwQCAAkBGiXb4iAjvV4KJLPJWpk+kxd5N0OJaWuBZAs32gYkizV61nbEYqpLOigTDB9
 oPmDredRRrFf70RCgWfzFzlQOw2K0i+y0O2/oQtBehrYer6k2iVAMatSCzKV3CFr6840cYGdHTa
 9nGglXCuAVnLQjGjcIw==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af3e86c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-jktPZProMVJZdFyxj4A:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: 5nP17-c2qPLOE2zqW-eW9VqpEpqRlmiI
X-Proofpoint-ORIG-GUID: 5nP17-c2qPLOE2zqW-eW9VqpEpqRlmiI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfX3avZoht7SwDm
 nQkZYmmpd3uVZxOF7S4/kvJs06ydxEIHQebxmfFkRQ4D8pC9ofWax92fLkoEPvAFYDKcA4lx+dJ
 8mIVbG04f2WyYNbS5+YrluXJJlTgK8g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110015

Add the three board thermistors wired to PMAU0102 (Kai_MV) AMUX pins on
Nord Ride and RRD: SDRAM3 (Kai E AMUX1), SDRAM1 (Kai I AMUX1)
and UFS (Kai I AMUX2).

Changes for v3:
- Rebase on next-20261110
- Drop RFC tag as the dependency is cleared
- Link to v2: https://lore.kernel.org/all/20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Move thermistor channels and thermal zones from pmau0102-nord.dtsi
  to board DTS
- Keep #thermal-sensor-cells in pmau0102-nord.dtsi and set it for
  all Kai ADC instances
- Rename thermal zones to sdram3/sdram1/ufs-thermal
- Link to v1: https://lore.kernel.org/all/20261028150103.520428-1-shengchao.guo@oss.qualcomm.com/

Dhruvin Rajpura (1):
  arm64: dts: qcom: nord-ride-embedded: Add PMIC ADC thermistor channels

Shawn Guo (1):
  arm64: dts: qcom: nord-rrd: Add PMIC ADC thermistor channels

 .../boot/dts/qcom/nord-ride-embedded.dts      | 84 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 84 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   |  8 ++
 3 files changed, 176 insertions(+)

-- 
2.43.0

