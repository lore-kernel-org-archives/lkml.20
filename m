Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714125;
	b=fEdMpqrH0gAN0J1J25VdsNIX97S1ZhBFegjCfU1kJUtqz+hfRCOmoryWZF8lEaUQLe7z
	 Gvk1V08DOUy8AmS4YcwOnpkhBavGHLQg9zZT97PM2eQfMZTk7gkyspXZjWyxXGyucSM9H
	 p6kBllLzHj6oucY8Y6HRVjyw3tB2tbK3pQ+pICpc2Pd4Om+7DuGPuYDsGQMqcO5UiplLv
	 RE3fkjK0N/FpsW3QPMyf8+foCmeu/AgjpnG8f3TgvNzYbYXD5b1ufWFIc34ljg4rs2fG8
	 3SZ+inUTxmgFPiENK31Bk5MCQC8fbuNk/glS2npa7E76Q+6xFbjV8ie4QB2ghNOuIvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PgRBsYalY5lDh4FatExTN9A5QD/wv/3vfmiJFWyWNTk=;
	b=JfEynwCWCzJ6dhoQG6cg5WMVhSaircsLImlrtfYwL5FAPRR+KNjx6BNCwOszvV7ALceq
	 QEqJq0onzJ/Es2VP+kEgq7yYH2MP07elWmhLwUcndTdy8VErPnKOuc6d8njtGxDioibG4
	 BKT3nppTlDGBoFQChgmovfKYk0VY87Cgcq8z3m/wUft2fuDeTV9NPBkZEZ+9HSQsaQKHO
	 4Ee480Dj30yYwyHIXq46CXHXAh9FMMF1waKVReZhFomeutDZfW6Fp34ay2nGbmv7nsZSR
	 47T5EQw8z/vcTOIgtBsmeKQQgG8LobuO2qephp+VaTDcVEC3qGUlTEi/0owViouGwNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6P8ZjL5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLrP5vbU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8297B606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8297B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6P8ZjL5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLrP5vbU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZu5m1926615
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PgRBsYalY5lDh4FatExTN9A5QD/wv/3vfmi
	JFWyWNTk=; b=W6P8ZjL56dLuoHFh3Ml2rKdlVb36Cr4xSmlCm0HJIRQUAs5rS57
	rPBDXmZYnyru8FoLyxdivouQY2j+1qcw7VR6gjJ1dTu+H7L2iXICrRRKZFGrj4XA
	GgE3InhaNMDxq7MhetwA1e+wpuwgHK/SoFWDzO4nqq5iroU3TPv/s447eMBgVRn3
	ul1ZazQslK2cbUSgMb9A9zhivuPvjkCxvQqW/3aOL+8HkfhTqaY5BKYSNPQqjvuh
	U0VDkZLkzTxpQZ+uggn5Eh3WnhJwC/Uh4+jjbQ042LIPRtuf2zIxh2wKPcfqQhFQ
	J1hVpnoqx4CU+k33UYkhaYUsTPs/7jypmlw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5j2s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:55:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so1920052eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714122; x=1794318922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgRBsYalY5lDh4FatExTN9A5QD/wv/3vfmiJFWyWNTk=;
        b=eLrP5vbUsIRkVG63I5BI6kp+XA+SCLu2tAsm8rKDy5vK+A8W9sUe88ROF5MxE+28Ny
         aHlnZ6oqX02YZHkY8NsPzvyZgky0eQLcSan7gJFlz5pW8mVg94CCRnz8vkJP+YhqMlqb
         G8IpYHjXz1Et5/FE2t0YttpAOF9z9a7a2bT8D+08rwYlLkiSWr0HJGVG7nD/0xeIXFWE
         53QvotbahxkGiDpM/D7mqUxfqRQkMa5eA4ydsfTKWGb54Xfaoika6ZzQLj0Ffe5xsvqD
         5jlQbAAFjGGrVv1ZqVRJhbS0iIsN+rM8/2b0A+sdCmmPudR07THJ4EheBVy7U1hHrW8J
         jV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714122; x=1794318922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgRBsYalY5lDh4FatExTN9A5QD/wv/3vfmiJFWyWNTk=;
        b=l9Q0fSE2ZS/7wLypWr90sEOhjmi1/aHaF6eCZGL0LOqRYFsSDUpw3XQPmlMDiPC+zB
         vhRra5BdLYD+5nmUUUEU0LCh2fnkSSmjY6j2o08M56xREHc8PuKZ2EXnbcSkO4+raqTD
         b8w6dvkyMxqqOi7wTgY06U0UfBarOvbtvYhUbISUm7dIOy9YbqodZoilbtmmVx+3UfCT
         ftNHGn6pV8u0K79DgY6HmxVdQKYiXCt1s96GizmObkMqAsROT2VtGUK9cT2AylPZ/YE6
         Uqx5p+T3fE4SiRb3+U7MT+CaHg7ruwjgXYTvEok8UMJx/8Ryo8mZvdMCuk3TKxAHw+qX
         Oowg==
X-Forwarded-Encrypted: i=1; AKwUvByzsPCYlIqus+z8Nbt/Due0blzMqJk5gI1k6PBmVnqdos7d0hqzeVOYTVPqEVhIC0dH88lJ8avg1zjsDxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OuQ2l0vgQqp7wEW329NtSAWNg2Xzmk5ZHoA65LalvX/UvlnpQ
	4TB88Rh4W8z28X7KOwM18WZrwaOhUR9/qC9YiwBammZhJjuh6LQ4DH2T73UzUQ9UhZM+I3r6HAE
	soKc7sa/ME6CqJZ1EiPkiAD/N86bY1rLCtvFwX74HkMsMInAoTBqXMYUb62Go3ShawCU=
X-Gm-Gg: AYBFou3/wT5cIz47bswOaq0qJo4FR3zHRiVME9eIwBvl+NDszc5dDUmJDvlt9KNX15N
	IBhvxIEl1qwbmd7T9SIkdmd3VdZbkf4NDsgSC4Im7yITaDMMW1YqGgTpUVEJiP/orXEzRWeYx2g
	Fv/1cf6ONl0+ymaMVR+wYzbMtH10FFdju8ZteDgSUHf46pQi2IP2LmkMTNLjumk8SF2b/2abzyQ
	D2EST8H4pBj0t7Datbt+pc/ys/ejOiPU0KgcvvsL0dhWPaUD3tELPqehq53DPOX3qi/Aj2xmVWm
	H1/xbTZVQ8yaCUwnj0p1xtEvBPwuA6G/pf2ACX87YzAIaaqPuZ5THvoX3yz9LRPJl7IMB3n5jWQ
	ZR4ZELKMkzdy7b49BBbLKdkOYavFw5aYFoOpdo9hv0KMmeG7yOR+OFTSSvgm0+u/q8ihHMLUDqL
	P8RpsUOsDMdvCngM+mCMT2PWV920AuXAJ1
X-Received: by 2002:a05:7022:eb42:20b0:186:4a57:94e5 with SMTP id a92af1059eb24-1ac5c272744mr20880091c88.34.1793714122237;
        Tue, 03 Nov 2026 05:55:22 -0800 (PST)
X-Received: by 2002:a05:7022:eb42:20b0:186:4a57:94e5 with SMTP id a92af1059eb24-1ac5c272744mr20880034c88.34.1793714121441;
        Tue, 03 Nov 2026 05:55:21 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm41634001c88.19.2026.11.03.05.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:55:21 -0800 (PST)
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
Subject: [PATCH RFC v2 0/2] arm64: dts: qcom: nord: Add ADC-TM thermistor channels
Date: Tue,  3 Nov 2026 21:54:43 +0800
Message-ID: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: 4SIvLHukh4vfYeKMSv6JUA6kCEzaUTUt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX0bZmUHR49Z8v
 Z1nmsEqwvVC1UBnmLWibXVsO+vGd/dXXjQXxhkJAmzazHGR5UlUf7fKl6FeHW80/YlFcP9S7aol
 UiNl+EmNuTh2moSHguhZIyi9gyz/aug=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9e7cb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-jktPZProMVJZdFyxj4A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 4SIvLHukh4vfYeKMSv6JUA6kCEzaUTUt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfXz7OBMkPOw6cp
 O/0onLDd0i8WylCMV7ltDdMgFIB+dikxuDIgZx+VeKM1MjgkzypYa8odtzygBCst+gsfYRHqnB7
 ziD+71uISJm7akTKoZ8zMnZMscV/NoVir7mIOdFz01Kdd7zjso68vUg9uB4ff+AbI18L9RU2qIw
 gHcVbUNrabIbu7yTvomwF4HQZwBXhvEBMWbNjqn0P0NUULSManSyzurCPpGs16ybx34MeZa9SVm
 pxqRcQabta5rqT+JljJpdk61VB0hLYiO0VQpqYVg9iU3PXTJdbZRBCYR+6vpqKxs+AWd7ZFlUVX
 N6WZHC6fWMabtbrZ+u9/GlucNd8js05TneEtaW+egyOEPGrY7Ty2NISDhtPKLIUPYjxdk6VnX5A
 1tIZSDc3Q/CU32uzwo1GQt8CSCxGplfl4U/B2QQtqKwXX0q7k8DX6SXG63pD5fnurXdFqmZU2xI
 9gZN3tVoqQZlQ3urwYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030055

Add the three board thermistors wired to PMAU0102 (Kai_MV) AMUX pins on
Nord Ride and RRD: SDRAM3 (Kai E AMUX1), SDRAM1 (Kai I AMUX1)
and UFS (Kai I AMUX2).

Dependencies:
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Move thermistor channels and thermal zones from pmau0102-nord.dtsi
  to board DTS
- Keep #thermal-sensor-cells in pmau0102-nord.dtsi and set it for
  all Kai ADC instances
- Rename thermal zones to sdram3/sdram1/ufs-thermal
- Link to v1: https://lore.kernel.org/all/20261028150103.520428-1-shengchao.guo@oss.qualcomm.com

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

