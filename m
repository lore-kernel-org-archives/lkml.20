Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558046;
	b=tMrXOj0HH9C9Gc7+zoaKElWpo9qAnABoXlFLrGsxAqEop34rt5xZn1i5Nh3JQJIx6nJW
	 yw4+NPuxILZv68SFMGnKjeKcVS1GURuOXQS5521nEsoGirnMPTvpqI/fL28cQ/lAt5Xr+
	 cfd5+gz5bvMujTslDthJ2W3l0R5IpHKmOydJmJSX9KD3kpSmqpHMBMlKpda/yAA6MxUA1
	 CvYriUeWb80xmNiPmGVcR7kU517jJF+w8Xhj9c8LluyQhZvr//3YfT7/z0dF5LXajF/Br
	 iQcr0cZHa/2uQMfNrtSMNIYnSm2CMh0V9zqjuGKAaoRHRWc4y34gX6KtNFF+1SGkYCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8+HhukhZuFpUmESx9rrAxlUZVKyiO21AXgcFpUXvUvs=;
	b=dhnZDofiXldfwzAPDmlU+07jKGRLB48trShg8+3UNX6N9ePsE1ouqpntgnfRQOvuCXKz
	 hcpY61EkeOdgRY9WrLi5jzysyVLyuTcqtPZEOZ5PbGVrcK9TCEW1tcMpKKqwa4HJKtgj7
	 cC+aQv2vPodXkqottzv9dWoJpsXp/h6Sk2uaRgFAoGQlP1Pqtndyc7FUDLK6lH+tVYyxp
	 UcUGITo9dtX1mcPtyZIrN0smK7vHch0f8faZMx9bqt1278FxqTfOC4W7STGsCB6Sc3mqY
	 +KHgIGA5gRaYRWX3uwcMacuovqieAe3i4KOBG3Ll1q6svNMH62yCP0B1SJzZDFUKuug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdXx7Gw8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XviP7BGW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978E6606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 978E6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdXx7Gw8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XviP7BGW
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD5tmbG1756586
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8+HhukhZuFpUmESx9rrAxl
	UZVKyiO21AXgcFpUXvUvs=; b=ZdXx7Gw877oUzcqjI/khCD4wl/8tumGoJRseaD
	dp31C2d2ZuAlsev+5Bcx7FPzZgzlQJGV1W4pSgfBSp1G6tOkuNVzG//4PHRObgKu
	y0YqF+ohHJASIbRtbV9cgR865nMJ1RJtY4QkEdvk9WCj6UFMIa/2k/Q1UwQOXb/H
	ZvOJIVeuKbX4i3vo2UzZOa+hljTci6ZUd3BVTEXYVrU4HEcK2zAxR4HxzK27hXLE
	0nRkgDEeTdJzAiazoKxrZjHuMhzSga/f0KRkfzYjgPFNK5KPseJCduuB8yAcDjWG
	1EwIdDfcprBsyxhohO5dF/2SfP6V1v0+8a6nghMIUh9DtZ+Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6rfsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1130730eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558043; x=1795162843; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8+HhukhZuFpUmESx9rrAxlUZVKyiO21AXgcFpUXvUvs=;
        b=XviP7BGW9macQtt8bKsVdFJZWd3zkZrRCnMigzK1JPzSuzGEKTh4TkGYGfjOkY/nkW
         LMaqVziN5Q73g095hK8NYt0jH1hI947ky1DeWht7fuNkvZ96gvHjUmmIQkEMn7n4xSkp
         bbDtjNuH9N6hotZFHQnCmkCXSEkh6yiXLjdGYL0VuKi/bv9cnnJhP1dA6xe8R1uPS+EQ
         ndk4/nZCznv+b1t9AxWcPn+f6CUHDipEzFx6vONt2Cr3vd6JGORD3/6faA4Ugjx/FOG2
         xOQ4jW5rZj0WEe1zMDp175YDrleZrF83y2R6zT9CMst3MJpxJxbDOlw6G84bT35pwL99
         w/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558043; x=1795162843;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8+HhukhZuFpUmESx9rrAxlUZVKyiO21AXgcFpUXvUvs=;
        b=bWhyJfXsL5M7P+UnSABnTUuZKWDT6d0UYeJpD4izBB7lsVzhfWvhVjG2ULPd4H8lmM
         qUQPm1qFrG3/j2OWnp0lqvQt8HBn7uULykPKxoOm0qHj9iPbWVXUncDDsUrNuyDGkv7I
         pqT8CuDHckcY4s64R1nSm3GQGnZajrfbEOikIWaR2g8H5MtARhrdLJeisZkYRQbPPw3j
         OZGn1n0n2jL+pJR9y2WRaMnPSTKc86M8B7sLG4pQ4aU+C4qxnlBAav95IB9/Z8Dx2fr3
         ItNk5vYz6+X+X8CqvubArYT1UraYScFWHD34eG25tB7WG/W/Z+xPH4+yYBnp7TXWGW6J
         UdGw==
X-Forwarded-Encrypted: i=1; AL+hErEKiPn+3Pq7a1RP1suOiOV97rVu2fh5vzU8WGmXI/0Gr+Ne3o9PIOTJSkSq6k8pj9RDVaKbcywuQG7Q2es=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pCGQW6uXa20OVDRNST3YRduwQ52UJNyLGRO/sTvQivfrocdc2
	wSRxeRscZMP1JCqeMtKODpoY7fF9Z9skbEoLlxiNpiH5DE+rQn++yV5LQnvpHLaauwwbwwHYb3x
	QDig/Kw8ykB/6kk1XT1e3UPl/mjyLbqR2yUm9wwHu9GAeQxSeNFrCkCamz12iJxwq2jhTp92N/L
	4=
X-Gm-Gg: AYBFou3SCObUVZQWEda89c+86RVPwHoHRtuF6cSSDxh/WTIw468yTs0ceaL6nYox9sP
	ECo0HRAc0VETVWuRmXQGm8k4+V5f/tbt2x5F+1dnEC73+ptweF4kPnOTx+ajQfvuMUfobmkpNpn
	nAdMYl5uhxAY8YJBRE6Tjw7lQ0ZegP6ktf4aqpZQiWxbyOSM48TBdBYA9otIPfUkaLAwjLFUfyu
	DxIRWxdVqvOmRrDP8BH1y61ZMaQN7UzfVAblC9KKK/2FE5mtJCh1gH7dT7rripSugqivjhcYRzU
	RDXrrU2M46ccVHzqwrsbadhQF/9VI030CEC/PNJBZYsyE5d3E9zljXsDXg7FXiwwoIFgqZ276I6
	8M+2AldoMwIlu51BHYqZuzeVpm116N9r31vIZnXsxzC2itXCXUXvRSMWBPeLrhk1+sUdg1a3dSN
	bCb73A
X-Received: by 2002:a05:7300:5994:b0:37a:1be1:e70a with SMTP id 5a478bee46e88-37a1be1e7ecmr176101eec.29.1794558043315;
        Fri, 13 Nov 2026 00:20:43 -0800 (PST)
X-Received: by 2002:a05:7300:5994:b0:37a:1be1:e70a with SMTP id 5a478bee46e88-37a1be1e7ecmr176086eec.29.1794558042788;
        Fri, 13 Nov 2026 00:20:42 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm4971713eec.10.2026.11.13.00.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:20:42 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: qcom: camss: Fix Glymur CSIPHY topology
Date: Fri, 13 Nov 2026 13:50:21 +0530
Message-Id: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEXI9moC/22OywqDMBBFf0Vm3YiJ1teq/1GkxDw00JiaUamI/
 96o224GzjD3zN0AlTcKoY428GoxaNwQgN0iED0fOkWMDAwsYTmlCSPde7WzfwluEQkVukx1xrO
 s0BAiH6+0+Z66Z3OxV+McrNO1hJajIsJZa6Y6yuW9ZLIoNZcVHPe9wcn59Wyz0DPw//FCSUK0a
 HNaaVGktHo4xHic+ftwx2FAs+/7Dy6mUtffAAAA
X-Change-ID: 20261102-glymur_camss-1cf83f4a447f
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558038; l=1301;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ZIVdnv/pVYDJ6VtZ6cVcvJh54NuXewcKEXwu1xtFH1Q=;
 b=ezUhCnPza1MWnKyzNnbcZxiMALh33SYPFT4aqKXPshbyjjRg7x3Nwlbcpd0iqNPft+UqOp1Qu
 2ckjaTSNqZSC32kw7mcM1REEM1GIN3Bi489FpmLStDFe8xQYpoJR9BY
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfXyY9XoJa9/GUn
 0+b0h6I0nXLIYc0aLF2Bvfh4dzVfMPQEomjrM7SmNAHYgxmBB4i2BhQw+smIG/379J3bElvdfda
 uMz1RZf4XTn/uoEda9HY+lf81ca8/B3rvBvT2j4B8m98oyc9+coADiO0nP/Imjyp5X3VACL0ban
 4hdkv5+iEH1sFuAbudpZx5krxTymUUNIhcU8FjA67n7koIjKNfFbvcjx512cWZOdPirubR26tDw
 Cq8J9aiV7BFJcOHMjcBUevI3V8K34eXEUgJif2j8YHdS1g94Q78NNrCXMOC1gCNnrTKmKO66hcZ
 yDrDdPL3QJ+Udi0zIpAEfMdvXBpfRs9wmkjVSvey8tO5bwuj/uBW9036EQTdYQkmOoh0orsgcJV
 q/RAxEtSWN00FPdtYeEI2kclRBMi09Z3o2Fqpk+crxITISdnlVigAqDg1oBVzLIqnyY/kViMSE0
 E0WIADHx8qhUGYFNpXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfXxgj5ULtg+MWn
 ZChAu1k8cFlgMPha1agrFm5+bOAboWigb2gjYD2dUogP7HnEVMvv5VWgNy+u+6yCu4+gUoFDcv4
 c7IhrJfHHjxjRHKtoXow5sMDFO8CoZQ=
X-Proofpoint-GUID: Wz4AjnEYFuy74JU1noyC3rBVJqTFw-h5
X-Proofpoint-ORIG-GUID: Wz4AjnEYFuy74JU1noyC3rBVJqTFw-h5
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af6c85c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ffzozp4-zBr36aKF_PUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130033

Glymur reuses the X1E80100 CAMSS block resources, but has only three
CSI2 PHYs instead of four.

Update the binding to describe three logical CAMSS input ports, and add
Glymur-specific CSIPHY resources for the PHYs present on Glymur while
continuing to reuse the common X1E80100 CAMSS resources.

The Glymur DTS is still under review, so this updates the schema and
example before the old port@3 example is used.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v2:
- Rebase on next-20261112
- Use logical CAMSS ports 0-2 in the Glymur binding example - Krzysztof
- Add Glymur-specific CSIPHY resources for the three available PHYs.
- Link to v1: https://lore.kernel.org/r/20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com

---
Nihal Kumar Gupta (2):
      dt-bindings: media: qcom,glymur-camss: Drop port@3
      media: qcom: camss: Add Glymur-specific resources

 .../bindings/media/qcom,glymur-camss.yaml          |  6 ++--
 drivers/media/platform/qcom/camss/camss.c          | 42 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 4 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261102-glymur_camss-1cf83f4a447f

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

