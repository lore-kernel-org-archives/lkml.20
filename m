Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662725;
	b=4S4gOI2gBAVLCjw9z1c8Br5w+/UrdcqaaiPbim5jtdH2KkvigXk4a/Y8uCxTSujfoWJf
	 fAHMaxJfaHm7LDudle86iWR4YMC5PhdGdTfbaZJDfn3zXo/POIfa05dfrnDtwAYO20tJv
	 GzOL+2yLNMFz/4fhPCcjBcwWLEQKNlfjQF7a/J7yodbbA2arK8/NNpABRKXBXSK/7seUM
	 +4to9rESTYE0zlSpuQXWY4NgWjAK/R8gwL7eIvX88SKxea5hjN8lEst2/9NeMjFJQgJhf
	 b11oofPbZO0hP++j8qqoUNM+29/9BLkH51aYH5DdeaPYUO4XLW6oN33RfFOoXqlFYXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662725;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ibZbAM6mxwTviQGJE6mRb86msHnx1wYpor8WMO/JeSc=;
	b=bPktY5l5IXdyjUA1ymIiHO32dS9jZBM99etaI+tB/+DuX/rIwoRCqLgQ+FHR6tENBXmS
	 Uq8AFPay8Z7j9Mzyg2Vi1BkSTwvVHfw4g+OAr4PGiSRIUAkjTD+2uJd6OUiv9anXyPHaH
	 m2ORGO8mFVILTLPj9m7S6z8LAD9spFGhnpynymuNa2l6IZMyN5F34VkNtxx26GPJnNts6
	 2f5GccBHDZdAje/VycvmtzOaMpEjAjVvxGQGmHhIBpOK9HZx173MJRFKKA7hNZLAGiyld
	 QW+QxCNbWv8/3mIGTIuFUjeK7X/BmkDR4SihubEHYNCNNHvZLqHA2gXloOmIieGlBjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C7Xzwrny;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SmUBGrpg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118CD606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 118CD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C7Xzwrny;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SmUBGrpg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M702fV2714430
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ibZbAM6mxwTviQGJE6mRb8
	6msHnx1wYpor8WMO/JeSc=; b=C7Xzwrnyd9b9GwslpMsBv5OubS0kInrGpENouM
	O6O3cNuzljTdAxD09OxwUiu9GneqxHbEdsZjGn+jfoKED7NRGKTKE2fcQ6uk2aU4
	aHOx5/8peflJn1j+eN+OtdzZRFVnGN402bn2b01qb0jENTsOk8cFPAKUjrA9M4CF
	nS7R/CdRSOAi8y1VzfipC/szB5xyyTx0ARJsDnGY525C1AtpcvGwLttpLkH5wX4m
	EqH7G4D841pyLMsaPNtpE4lRa3bYiFa3bqh8MiIBBpVdm58gp93QijbUw3MKu+Ym
	d1QydRW2CzCnCszkW12IbKIYFmwBjD0AZ/iFiJJApc2T4O7w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsrwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:52:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so2807587eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662722; x=1793267522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ibZbAM6mxwTviQGJE6mRb86msHnx1wYpor8WMO/JeSc=;
        b=SmUBGrpgJUf+Tq9+aT80UlaXIpb35ocvWF/8JPjhbZZwzP5H1GhnQn3w2vKhsVB9aW
         mwML6HYM43P939haimf0VL4Z/F3Snrw83eywgLTyx0w6tqQ9bOFfqjMmEhfqak4llGxa
         sUGAq017CS18nXPZz4rfLqj41UdNuxNsCcOL5CwRFYacvVjjz+lPIYBQPSg+KDC/UbIJ
         zxnHu8nxZr7BOp+G8ZeMhD4kSm0jq8qNpWTtmr+XaU8W/lJ3nN4gAYzhyOae8XpS2pPV
         zOAmzanlrWrLyi7kDs5ulX6mllRZVUr+Owr98kqBFzA1rZfC5aZD2n+6bRg8sq8d47hf
         2Tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662722; x=1793267522;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ibZbAM6mxwTviQGJE6mRb86msHnx1wYpor8WMO/JeSc=;
        b=KqYh+TaAail4xDbetJtJ80I+ytVrSscl/0uZ2ayAkrhIjK/dmS+leKRBlM577ejcX6
         iG+2T0gvcmW8jPtOga3w5RsCDgJ8q3b5zbZW5P/HgFbuwvugvqX+x5di5lCc7a8MvND3
         tt6j/tasYsbBYaRPR8xq4hbQqFHtVFvTWNyKV8XQVwtp8lxcVhI46B+MCUp+z7KNQtQ2
         KIepHim9Y+hzzOdJLX6Dpjf48iKDnf/xfZJ31wRhmWsV8uSuJAtLDWiib7iLf6eN4ppF
         lnizueuZdswFoVFG2h9OwJxnpJhC/iaOXMgTfFsAM8jSjyDFCGCSCbF+NelHiUVXv5FM
         bLVQ==
X-Forwarded-Encrypted: i=1; AKwUvByb8GT36qTP/zyIGl6nq0ItxE4Z/fE9TXncTtnfY+ezWqD+MlWjOxlR4GToXKH4fIDTGgx0OMbt/lwVTJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpOLn+2M/jTtGIjmBibv5uaFI6N+d4AgG9c+A/ywzSZte57u2k
	UxXB57+u1HNSiF7jCzFjO6LIX8Ybkk24DfBAlc6EiWbuS42bbXVbJinhJKkYy+I7OkXlCBdx1Jl
	b4mIvzbcWcLNqyDvW/pVjTzeWM+1YCfj6RlSBlxJmAj403gNJXx5CGKGmTSCEQ7J6neo=
X-Gm-Gg: AYBFou2Icsi0W4Un0XKun5KKsZM+W31hLRg5iw3Y9z/4PSyY1WnhsGm77NGthi1QNyC
	s2M1m3+dqK7ioeErx6nFyp9aUPpQ1ta6OMjtujvX47M5JIKOeoxgj5IkhARyL0ikYO1WkgaWE4y
	siat1j80K97WpsWLYg3PhlhzwCkY0X9kyDxXsw5CL7kGvgw3gMOxu1GM1FWqMOBbS+g8X1SrTpV
	nMPa24RBGNkmq2dy7lpbS9hhokoShh1a0GLAc9Lrt8vhitXhCGor+GBmoiqIWeeG8Cw+hAHHf3B
	H0Y4QdYl89CEkHztboJQ4q8ZWPtdzC68Jr75enTZRHniAVgb5Ro3XnjGp18sbtDqmp/2/rEBA3N
	62aUw2Rlu1v4GUO0wGVG3bSkU9TRk+LiZ
X-Received: by 2002:a05:7022:f512:b0:187:efba:9ba2 with SMTP id a92af1059eb24-190a84c55a9mr4905127c88.44.1792662721797;
        Thu, 22 Oct 2026 02:52:01 -0700 (PDT)
X-Received: by 2002:a05:7022:f512:b0:187:efba:9ba2 with SMTP id a92af1059eb24-190a84c55a9mr4905106c88.44.1792662721247;
        Thu, 22 Oct 2026 02:52:01 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm15742170eec.3.2026.10.22.02.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:52:00 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/3] ICE: Enable runtime PM support
Date: Thu, 22 Oct 2026 15:21:49 +0530
Message-Id: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALXc2WoC/yXMQQ6CMBBG4auQWduEDmqCVzGmocOPjpGCrRASw
 t2tsvwW762UEBWJLsVKEbMmHUKGPRQkjybcYbTNJi75bEtm85ahdypwY+8QGv+CqeTUsvV1jSN
 TDseITpf/9HrbnSb/hHx+J9q2L2ZT2vp2AAAA
X-Change-ID: 20261022-qcom_ice_pm_enable-3c5d21b99e42
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 4Rvl0ZkF7PZgh006cI_TH-hAysUKJTiy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX61qqOlgQr8f+
 bxxwi6uhQ3FCbcC4LFjDC8bFdnHJ/OY1vJVfSsRMlmscTlzyKk3Dvr9bVGLLuGfTqckK2oYvCeE
 +D/wNDc224EkZxaFnvO8H5JPirgbAnp2fJu2t+tQ8pMqedUqqHOyiph7ALY1wGU4OyvPUBAW71U
 ds5RcLs9g5WOn3OVQs+uqJi483RgWHooH2W2DumRQHnUUEZeLuAw/EEW2jN2eLCpq1zW3m7KKM2
 rWFsDnOSIoglu8FibmPsLVk6AZgxSisMpkZxvYoYE+GRiNwz7uJjNqnGVDpmLlzHujAINdtmh5L
 Wt4fklpr/ec7XGB8NI8DJfIuhh5iJkhBKBHp+BbvDc883FZSNAcnsDtHoNXh004X3nfywsRW0SY
 oxXcoWGyJsxiaLKk+F2lroZL/ZL2kVP78hl+J5myaYbaVGkbr8SnlEv0eTejzLaIigg74vjruZP
 dXqdFlw1XVzt1qOPRtA==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9dcc3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=q2l7TY2mCMnZi5pTjLMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfXwNJGHFjoj+Ot
 aeLWJ4ZluSBqeU8pJ1fChKtYMmRFy0nhTCOQbJOiHR0QmZMSPTXQHl6NKfsEdXAwiLPjk/KD1hK
 tnrNsOxWA+IrNxZGNOlXacxkL5TQGxk=
X-Proofpoint-ORIG-GUID: 4Rvl0ZkF7PZgh006cI_TH-hAysUKJTiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

This series fixes ICE clock lifetime handling when ICE is modeled as a
standalone device and referenced by storage controllers through
qcom,ice.

Currently, ICE driver enables clocks during probe and keeps them
prepared after probe completes. This keeps the ICE clock voted even when
the storage controller is idle. Add runtime PM support to the ICE driver
so the standalone ICE device can enable clocks for probe-time register
access, then disable them and remain suspended while idle.

While enabling runtime PM in ice exposed couple of sequence bugs in
storage drivers(ufs and sdhci-msm) as any key programming call used to
go ice and never complaint as ice-clocks were always on.
Example, unclocked register access happened from ufs/mmc in
qcom_ice_program_key().

qcom_ice_writel(ice, 0x0, QCOM_ICE_REG_CRYPTOCFG(slot));

Fixing this issue require ice instance at early ufs/emmc probe so that
correct sequence is established and ice is ready to accept key program
calls from blk-crypto or any explicit storage operation.

Merge strategy:
Patch 1/3 and 2/3 are storage driver fixes and should be available
before patch 3/3 lands otherwise will result in bootup crash.

Validation:
Tested on shikra-evk, kodiak rb3-gen2 and sm8750-mtp.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (3):
      mmc: sdhci-msm: Enable ICE before enabling crypto support
      ufs: ufs-qcom: Enable ICE before enabling crypto support
      soc: qcom: ice: Add runtime PM support

 drivers/mmc/host/sdhci-msm.c |  21 ++-----
 drivers/soc/qcom/ice.c       | 139 ++++++++++++++++++++++++++++++++++++-------
 drivers/ufs/host/ufs-qcom.c  |  29 ++++++---
 3 files changed, 142 insertions(+), 47 deletions(-)
---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20261022-qcom_ice_pm_enable-3c5d21b99e42

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

