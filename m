Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CBB367B86
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796630; cv=none; b=jTfsuNOvHwX/1p6blzxH/QUSIe3BNZklMk6GtX/Xk4rcRKZqnfywR19vYoxAOZReIYvLnJ/rpjYuBpsiQb5h2mZzRsvZo977ZnPx6eGDL+2VpJd23NCcmIismaKgV18x1CK7kycXWROXaK3lP/jKuff1LZbCLn5CnDE1hO//OSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796630; c=relaxed/simple;
	bh=t83sVHr1wKC8+yaysLXcM55WsgLGm+kgVdHDdB97PJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pIP99hFL+mk2GjJfGu7eua/49bEMShvohu2PLbv81pz7oEO7xADaPURBNvWFi1Yv9ZwE5o+POUUw6zD/QC115XnBY+6JTdCNR0u9GkUFBtW24iF+9jI+5B5Ey9o9oQn5gc7Zy4Glmp9gzV/MU80drKfqcGC34kLTExo7Bf9jQr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DH5c6w4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OrCBldPU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DH5c6w4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OrCBldPU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KmQY1439197
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N4944zQT/7NakQKX3eNjFeImAH/Tf+C6mWE
	Yc1Zq7AA=; b=DH5c6w4sJGJd+usdrXWoAopgMpDPt48JcrcySH1Mr8CwnGQE/Ao
	tE4m+pYCdifB3XdkK3EYCXmUaYQtm1aQemBj+qnq+5Y1gbzPhr870n+FsFcJjx+c
	tzMq0M1l/qftz9W5bDOGSzXO34Cc16m7hpgGGW2XXXqQpNNDQA6I8UOL4E08dQ4f
	GL/85QPUaFNget3Wg4gMnHEEEIpvbASr0wBo/fvBAmg98/BfKibrslS4xZNRO8CV
	IZvn7x81UQadSFS4WD71ioPsOvmj7S8Boyx0Agn9nPMo4VgqTAVK6haDZKdJqMjM
	dXDc7yqHHswI5+WOeHHsErBxVNGmgZzFRLw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkh8w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:17:07 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1665200f4c2so2375566c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791796626; x=1792401426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4944zQT/7NakQKX3eNjFeImAH/Tf+C6mWEYc1Zq7AA=;
        b=OrCBldPU7q6kpd9LuwectKsnVji/7Jt8qYSWwShKdTSy4Zfn/BJxJ1pbNcbCwv3uQ7
         1z/0wcEfgEX24VGswyTEOhMyHO+OXTgzXW0TfYE7WZpOnTuS66ydBOhbNcKyv12EzOkt
         p3pncEvg8on1+zvQneYN6bI/UvQdPaIeRsOINWtpAtJQJ3ahfgIRm+xOqfJKtSLAbCOu
         Nm+mHrh3BWOZqrl7JpQlqcARi6H3vhqKEBqfukU/GicnVqZ0XgtcP2dVT+vZkGz4cfEL
         XAu0gewvt1mXooilO61Tf98GaYFjsGbq7phWPvhpSZDGOM/tNTn2kZy6i3PAKmsBDuQw
         bavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796626; x=1792401426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4944zQT/7NakQKX3eNjFeImAH/Tf+C6mWEYc1Zq7AA=;
        b=rJ+eiLMblzcMa/gcP8a+R7ORpvkpWJGmpk76XP6WN43++zR5+nBj+Pi3CopjMQ7Xxc
         ihN5b5g9f2jC3Z7lZv98GrSuojtda3mGlnPQt6/fdF3VtVKoWqy2gmRZxNIQAiwG1fET
         lez80g4CzVLvWxJ7eoTXa8U4I1SutjJhYIKjKnAhTsUsuVbJQME0aY8RGJlgv/vPQv7f
         ZrEykP2ZUVlJy8ML+AnS3UKlowCDrGhQuzpq/8l0fterVjFU2xpR20VjW3bKUhsUpubA
         f4taeTw35AAiY8nMFF6a9tUaQIPqp0gSDZrNmwQ6bur3BZILj6Da0Cmy56L1i4r7BBaC
         R8UA==
X-Forwarded-Encrypted: i=1; AKwUvBySE0lcO6H/8phPBoQzPA/ueV2+2Ys+JfZKebBVdYBQnS6Va3Xu4waXtQilOy2uQn5VFq+j5Szt1dYvJuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR3bTNReM09oynvPl+YdErxlcWUBfv3JXhuk8z4/ViivYAxRZb
	IXxZQIRbm2/9sO5qLunewAsTdwsRwiXCsI8d6AxEr+m3f+Wn4TGe6bWbXbOtXC37zq6WKb9v240
	EpOa4RXNmuxfv0SSNmvW1Nr5/Lniarhj+zlc0ACaJBPPcgVZFyCt4tBuiQX2p5wANi64=
X-Gm-Gg: AYBFou0eFjOA5XS69tgfodZMG8AoL7tIQ0rjLv9x1490r6PVVS+7B29eYPA/ZG3iRBT
	eZg/nqzRq7OZDLpuuVePGg8EyHqcucqy7EbVz5OS4OaQWols0J/cxtZaan4tI5pIr+CTw5cvs/K
	K3UMn24WRoWjSWRErMB8zyLFwLZCVmaN6Zl1g2K0I5eIXIgt+7vW+EGm0AREtYT1Tx07+e1a9Au
	7cs8InOs5reGacd1Rd84pTLqEiRa0EVQreHr8q9rIWDag49nSpapkapqJQpMlL6C4fQ1ZxCoSPV
	BWts+YsuZxpvPi9nRuBTZ6mny+1Xr1E4BB+5ioUhEiFWP8HvMFMh5HEJpGKZhZRNoZEeMMvf/HP
	WgGrqSflczuqZljYLv+PmYKokQAyR
X-Received: by 2002:a05:7022:296:20b0:159:aa67:2893 with SMTP id a92af1059eb24-16a5d642d08mr11145410c88.30.1791796626336;
        Mon, 12 Oct 2026 02:17:06 -0700 (PDT)
X-Received: by 2002:a05:7022:296:20b0:159:aa67:2893 with SMTP id a92af1059eb24-16a5d642d08mr11145386c88.30.1791796625710;
        Mon, 12 Oct 2026 02:17:05 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm34502575c88.16.2026.10.12.02.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:17:04 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] usb: typec: ucsi_ccg: Add CYPD6129/CYPD6229 support
Date: Mon, 12 Oct 2026 14:46:56 +0530
Message-ID: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX29gfuw/EmKpm
 liSRMfml9c6DLnOnp9ZA7miWDMVeI/+0FQW07xAkIWvFT+pittW0uXTRptYJ6lvifWBNY5gTaAD
 c1pSLMX0v3PDYhApeWHRgKSE1NTDsH3H08aQsZmk+LiwfNYIyC6IxuXiQp835CF981eZIqDMl5i
 90ROLN5g9E6vVpNbrxZcv2/0nKLIJ6FFyWj0PCfcO2e+f95NS8oB2prcPvEUeZvBJgQ3pjlPzcQ
 7cyL964Xb6+mck3lo9II1mO0wGmthCGP6w+raeO9ooylN/BHDP9Pr+mv9PYA0yrjVR5lGC5+Xt8
 9PLXk5uOLu5ytex8GmNh4hP7lZCpfr8H5dUCQmsh9HcmdIN96ukSucirZLrpIR5lK57/UJ9wOBh
 h34JiY2njC6tScnZlhKSikZM3wlemRVGb6epQgyWh1oYm4r4Y5q8scgobTrVZJTBa0iYO/+HdFR
 L+pfVpOR5VkD5rgeRug==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acca593 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PrD5CQMRHxEyf_1mFesA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfXzKJClam2iZLS
 OE8yfMHM5fM1Mazs7ZEWFPZHNrmwy1BS+390ojmUA4ZO1BQ+Xn2FqofdTWa+uezJ2xJZ8ec2m7E
 tbyFREWS4mjhHXcpJbpFAhWUSND0ZKU=
X-Proofpoint-ORIG-GUID: nxVBsxxynN7tuXx1i_Jq2sLYauggUWYe
X-Proofpoint-GUID: nxVBsxxynN7tuXx1i_Jq2sLYauggUWYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120036

This series adds Device Tree and driver support for the Cypress CYPD6129
and CYPD6229 dual Type-C PD controllers.

The controllers use the existing I2C-based UCSI CCG interface. The series
updates the binding to describe the new compatibles and controller-specific
properties, and extends the UCSI CCG OF match table accordingly.

Patch 1 updates the Device Tree binding to:
- Add CYPD6129 and CYPD6229 compatible strings.
- Support the CYPD6229 fallback-compatible relationship with CYPD6129.
- Allow controller-specific I2C addresses and interrupt configurations.
- Add pinctrl and wakeup-source properties.
- Preserve the existing CYPD4226-specific constraints.

Patch 2 adds CYPD6129 and CYPD6229 to the UCSI CCG OF device ID table.

Changes in v3:
- Fold the new controller descriptions into the existing
  cypress,cypd4226.yaml binding.
- Drop the standalone cypress,cypd6129.yaml binding file.
- Drop the Shikra DTS changes from this series.
- Add conditional binding constraints for CYPD4226 and CYPD6129/CYPD6229.
- Address review comments from the v1 submission.

Link to v2: Link: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/

Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/


Akash Kumar (2):
  dt-bindings: usb: cypress,cypd4226: Add cypd6129/cypd6229 support
  usb: typec: ucsi_ccg: Add cypd6129/cypd6229 OF device IDs

 .../bindings/usb/cypress,cypd4226.yaml        | 90 +++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi_ccg.c             |  2 +
 2 files changed, 85 insertions(+), 7 deletions(-)

-- 
2.43.0

