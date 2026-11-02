Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628248;
	b=v1GDk+FDpWnv2kxlboS+sxLOGw55tN6XXjw9VeLGEU2NLrQ780Zfro72w81MTJ7wIT2w
	 fc8RbG1l35umwKrzRulDZBw2dymm417r9aPGwAuIudCsNPRjt/AfDdZNBxh0KJNPWxhkE
	 EM+2sobILgz38bixjttHyXEIJznX8+LGvbjJJ1w/2t2HgWqvvvza2p/E+AbP2NJWu9v+o
	 t0loHtYdoOqNTHqOxveLG0P+fgH7IJqEaFpbKSgSz8Wk8+ZDZXB/YOh5mtg2q3yTSBI9v
	 W6+bNsW4QJ+m36jU3LPHH5ugBwdJ+A2WGq4/fq1xkqNnIZAmmNAZUUOt2CQJ8jxk/vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kj8Fda6uHscKvI7NgiMuoDqrKd7/WCO1xgYEpbK+uUM=;
	b=4PEgzwG80gOW2PqgpXTi6O6tNLP3NfXQXZpykQdfMa6JOd+Hl2zKrTCRNdF1pG2Xb4NM
	 rkelBSpgWRoCUUBhww8iotJnuMhswiX5lBNkmYya6vvZqrfWo7ix9AHROz/9vFDFE3A3L
	 UMoG4xymkT92BGWqBi7/kn40pl5sTFFYV3tfSex9/jpqTSUEDPplWfdpFBZq4CPhzi85A
	 3w0+xUh2vobJMITcIMdE6DQbrsxsKrZ1VNFLXP0WoWPX6AdMgocNYc6FSy24X4eYmt5Kg
	 tUSV7vfkgP0uKUzYr9oT5UQI32C0RI19gz7yaVtxEPfJLxnDrU8JMAf6j8NJjlr8oBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrXfdHH8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ML33df1E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2457B60A2619
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2457B60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrXfdHH8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ML33df1E
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpisA3102949
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kj8Fda6uHscKvI7NgiMuoD
	qrKd7/WCO1xgYEpbK+uUM=; b=ZrXfdHH8+h939oqNvWMMRuf2TVYcTjeQJ6dsxy
	Q+phgL939WRtYs3GUxzjgdRoK5qwcKgCGj7zjFd75L+8EIy1t9ZtVcNTOwA8OPuS
	eV6htRKbdPeZQ+bLsUdsgbxAYCh4rR45nTWNxutmtvAHR9Zmhw8FdxUK/5/QKdiy
	AzW6vWbE2JeERHRsOEP5Fd92d3K0VydUkz2K/xrciWUK+PzAmZkGw4x52UDAbH2i
	xhljz4O1f0bMLD9rLmwlsNmlIDrcondlUWIB/e3ZVkKzdVNB5lmAzlHYbg99xvCV
	zuYW6ckTzYgFjJR4Vt2cNT/eFPF1KttOSFFGoE2mH41RaWvQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rj4f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:04:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so2312158b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793628247; x=1794233047; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kj8Fda6uHscKvI7NgiMuoDqrKd7/WCO1xgYEpbK+uUM=;
        b=ML33df1EAtM/4gakNWiF9tXCLNdHsKpHs/bnsVI8KA/3ZlCi40jjNv5dg0hKUgVRes
         trDX/9JjfPAaQxEuPHyUR/U7+8xDjRK/GGh7rKvfguFEOg5vOw78AlO1/4n7G1UZqYvv
         HTQDGecjrS98WIBRb/3gdX+C8+X4ilfVa7EBN1v/8LMvpTl6x/mRRBlk1VJe3xusb4FS
         n+G/9c6M5FaorFl5tbaXLRfF+RcYXk3FXYs2/JjmJ+j0ABtFZPFxMwCTEnKkbi0RKyFm
         MddqDONEdxE8hoCIx9QxC1SeOG/6PVlNl8S3GzeQ+KgbqRBnO3DsN0dnhHJilClryeeR
         q6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628247; x=1794233047;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kj8Fda6uHscKvI7NgiMuoDqrKd7/WCO1xgYEpbK+uUM=;
        b=ozjoq2003LTHOyhRv/7HZ5Cc9z9c6ideb6ws4rGQ/sXcwxlUDufrTyj8e60gGBeNW+
         AWSUUGN4dYUmFmU+LO4F/LT1QsiiFvmUTQPHD+sq+/9Fv/8yZmRYFvgFWgsUQF5reuLW
         vW7V7tHVLiYUuDTYC2ea/d9PvXg162FEBn0A4qdZpB3iBwKMvPi8t6iLr4D+4TBXhPpQ
         NDSjH2Enw3hCd+dhylz5g0qNGw3OuyjdX0ZK/Cu33SXTtj+Zt3e3e1ajzWIEx3GlFG3n
         xepPVnB9XSTCK1gBUSW+0jcXpPD4LS7hH0TtMTk4AaF8X8N7zL7cI0pEs3/zLgCrhWq2
         Oe6g==
X-Forwarded-Encrypted: i=1; AKwUvBxDTVtW24oQBoHgPGxpUF1fqdn7mHpJtJi15AK+136OydQZttS1QpuCA8BTY//BSH90+PdnCvcgLeVITKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z++04Oy7pMFP5GX2j7RT5e+SoT4IkWHYaM0ywPYpmyS3LgG83Ha
	Xz/4WAv/fN6MkahX2CxaYuN2wrst3JpxCwppqCsirSsCgswdyZixy1BcA74tbEv5WlcWjNeXg4z
	iyC1/Q1vQtBWwKlRRFQjX3Alk+7sFrW9XcF/7XsueuuwPyycYqnhe/tSV+bqb5byOmMQ=
X-Gm-Gg: AYBFou0n+3gP0Oou2rmBPrWL4MTcT+G8HKtAi9nnTE2biJVmQM0TdvqODe+L70jWx4h
	6s/cXRPVSzNyy5HDDLg2epp02Mp3tgICS39h7lVoi9SVaFg7zpjJCb0kPvq+02K9Vq9senIyw+K
	Dy32fUIxX3Pul/jZacZeouj54hXQdP8UCU/u54mMhhq1VHf9lntQL9jxXI2X5xD3zn7mvvwkOh5
	Rh/Oa5cmz6TTtlzAPqAGhv3+nfVu9WLlx0WZyPjfhyZLgIlXTh16PyZ36mt0WkzPxaWhW/KFzaR
	SQ4OmgM6yZNWvVIpxrgAWIcr/jU86vZKrNv/M8vXGTvhH7lPAx/gvkFudmrJnOy+KB84gIFvx36
	qOKGreKovSJwbE+s9ldUVZK55aKoHrDk14FftiRbDrC+AjH9ritFlJCPkCdcGGSfKXMBAOTmJdc
	s=
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr8213950b3a.59.1793628246612;
        Mon, 02 Nov 2026 06:04:06 -0800 (PST)
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr8213908b3a.59.1793628246113;
        Mon, 02 Nov 2026 06:04:06 -0800 (PST)
Received: from hu-ahari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fd956sm2286942b3a.3.2026.11.02.06.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:04:05 -0800 (PST)
From: Anjana Hari <anjana.hari@oss.qualcomm.com>
Subject: [PATCH 0/2] mmc: sdhci-msm: Add firmware-managed resource support
 for Nord SDCC
Date: Mon, 02 Nov 2026 19:33:40 +0530
Message-Id: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADyY6GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMj3eKU5OT44uTcTF3jZBPzpMREi5SkREsloPqCotS0zAqwWdGxEH5
 xaVJWanIJyACl2loAPCZ+um0AAAA=
X-Change-ID: 20261102-sdcc_scmi-3c47baa8dba9
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Ram Gupta <ram.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: gq270DL21XvAiRoURFiDMZylCW1Fq7sT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX97lcIg5cDy7V
 VUoBYDlcyK5By0fBkCWqbGrebPBIcKCgYjxpn+hDLbBC4+9X6hSLH3BcLoGTpwsvUil0R+ixMjw
 imvf5QFl6uhYR/EyrJg2utwcqpmrvCA4Evciocgwzl1z2p+BI5gjgaa5XNLaz5kMsCqFLLFKqMn
 0d1ORYzOaZ0r70489O0doNYb+mmOVmeA3UBEFMOhviODzypRxHRCJyKPC9+LOksDirJmfd8rLiD
 V8zDNYmdFjI7BXkGECpvz/zH9QWUeXAfvMS/08sTgyqjChwcn1g0b1/Nfzrq4Pn2tw/4I0DUexP
 i3WItCVfM1n83Ku4EIOgSBiMlHpuuZqEm28LBW7pWnAGYIAfvAo74W30nnqNwWWSFxZAFpdJ3zL
 Wo5P4z9XU4GieNuZjpmc322f+O7GRVofRxgYJ0rYHu+hlr7UEj5DmfwSFHka1fxFHCIEk18O1GZ
 k3Wa6d3h62Hi83YE1dg==
X-Proofpoint-GUID: gq270DL21XvAiRoURFiDMZylCW1Fq7sT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX4Az6Zf0Yf1sk
 fvL5hC47Isk2oXHrncNysFrdcSkkjrNe0v1gaJir/3JHZrwh4D9Nzs84SA5G3a7/FKXClNN+hgV
 qeIj3iIpj63NXCIg0u2Sv3ZFmxF9Pv8=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae89857 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cGx-myOgvVfTzkcdCuMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020055

On certain Qualcomm automotive SoCs such as Nord, platform resources
including clocks, interconnect bandwidth, resets, and regulators are
owned and managed by firmware rather than directly by Linux. The
firmware abstracts these resources behind logical power domains and
exposes control through the SCMI power protocol.

This series extends the sdhci-msm driver to support this
firmware-managed model. Instead of directly programming GCC clocks and
PMIC regulators, the driver operates through two logical power domains:

  - "power": controls the SDCC rail. The driver requests power state
    transitions via pm_runtime_resume_and_get() / pm_runtime_put_sync()
    on the domain device, which are forwarded to firmware as SCMI
    power-state messages.

  - "perf": the SCMI perf domain driver dynamically registers the
    supported clock frequencies as OPPs by querying firmware at probe
    time. Clock rate selection uses dev_pm_opp_find_freq_floor() and
    dev_pm_opp_set_opp() on this domain.

Patch 1 adds the Device Tree binding for the new "qcom,nord-sdhci"
compatible string, documenting the two power-domain properties and the
absence of clock, interconnect, reset, and regulator entries.

Patch 2 introduces the firmware-managed variant in the driver. A new
sdhci_msm_fw_v5_var descriptor is added with its pd_data populated;
probe detects this and selects firmware-specific platform data and ops.
The new ops implement clock rate selection through the perf domain OPP
path and route suspend/resume through SCMI power-state transitions
rather than local clock and regulator management.

Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
---
Anjana Hari (2):
      dt-bindings: mmc: sdhci-msm: Document bindings for Nord SDCC
      mmc: sdhci-msm: Add support for firmware-managed resource platforms

 .../devicetree/bindings/mmc/qcom,nord-sdhci.yaml   |  89 +++++++++
 drivers/mmc/host/sdhci-msm.c                       | 213 ++++++++++++++++++++-
 2 files changed, 297 insertions(+), 5 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-sdcc_scmi-3c47baa8dba9

Best regards,
--  
Anjana Hari <anjana.hari@oss.qualcomm.com>

