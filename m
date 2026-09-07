Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3BE483BF7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782642; cv=none; b=gvnz7qKMkBx5vlFmwC4bGBnYPYdt1Anp1f3/QGpPN4YGpNRlgqjdTqLDi0QDvZH7Yg2T27EYCP+/QtMXJNcz22glI/w/0bnxvNLZWQUFmJKsgrZS4ZwjLT/yb4Qi+QbXrv5cXBkp6iWAWxs29pMWU12s+mqDmV2TLYWcrx8jDCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782642; c=relaxed/simple;
	bh=VX6P7IoF/cjZL162t+C5V/5S1ERwS0fh6IeQzsD8XMk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B4Rs/+sKyV/QWCPy9LpwdU1jmHxtXq1mHbCohSNFlLpEOwlk3PLAZMpPt3ZqnvyPYlaLrkEVn7ruFvswyXESoTvEcaAM+NChJMgwDzTRcoVLc2+C7bN78zaxyiSp4GPQ5tmDHhiT2fFOk25CD2pnv/WlsL0Mdo6uaAmgWSKVYP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIxawg6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3vytNzR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIxawg6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3vytNzR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnRPI4064577
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 12:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OKrdm9QYkmyxBbFELr5idM
	lYO9UjCfFo9zaXdkXtZQE=; b=SIxawg6I1D3F2xlk/QKis/ZXTYnc4RSIo52nFd
	Z3Y0lStLGj+luD5lN6Y5kg2COSH5fZSKFiJFSw75jPmXg85ISCJEEPPgYbX7mQqQ
	/0gAaa/1OmifsWBXO/4x5xQsSu9rqfyD66l3wh0nzo+BH4qdPZJcZ7zt9x6OSzhE
	zqySdJKJQigBDEF+S/TeDLhJoZjTbBZTDSh7rwkKgQnyn+ISvXH7Us4LHlLTGGZe
	6RG9EBu5UUcQJOfw52RKaDC/JWg1e9N3WNGVOyWbOMUSeIP55a487hSnN5WLGbFD
	Hu2kr7nq04inhdHWJZROBJm3v4jIrTQu+rLDXPWgdJmJcYVQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86s35x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:03:59 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1b7932ec2so3247980eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782638; x=1789387438; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OKrdm9QYkmyxBbFELr5idMlYO9UjCfFo9zaXdkXtZQE=;
        b=P3vytNzR3PG6RRLzx848/9XQAchRdCdG1+MPX1ezW8YtlABW9H74C/WGVyjkrJggBh
         XHW7ZIPkh9n8y2SN47e5WQtGbicUstsF/069y148EtwhQnrensP0O3MLA1CBjht3xr4w
         yFoCmy0dq90BVMMW/KZZ0crHmgznun/8yJlPuk9JAbk7B7YpiOp9oW6BuG6n4WP7nIRq
         i1yMWJud5+bJxLpN4xkISRvx/lTv0q6vYAp7iwUTYoq1/qriB7CvFFY/+STdRS+1JfTX
         Vubv81PJMQOzh3tXOkwdH7Ovgb984NaHxgvV8+aBTKH7TOZLgdg/oMh6uGh47O7hLatm
         Tv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782638; x=1789387438;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OKrdm9QYkmyxBbFELr5idMlYO9UjCfFo9zaXdkXtZQE=;
        b=ep6r55LTHQhP9CtJcI8JcfPa0FDyxHQSa0ZgdPHHQgZnkU+CL4NgBbzK6j8zfeg4Pv
         YkZ9eAFwLsrWQwIdgHBbhq4FdlnWqZ67hlEcBs/dvr9GqNM1vvdOtPCaik6/Fp87ye8R
         KIcuBwjvAwzCa7TuqRKgNnGa9sLLarpwCTZEbz7rWDMOzYHL0GbpISKViGmnKgIF1EKl
         g5XWkfdtGAtRcXGFAoNLRpcSlc4FyEWKDcP4RDwzcbTG/fpqCWqDLAkwCc1ibXBZbvzm
         0zUg6FJ4/pU9Q5BSgYK/Y6jihI8mXtqAIQc4U7rRTw7dDfblo+VpWqJXaidASawJhhhq
         mPCg==
X-Forwarded-Encrypted: i=1; AKwUvBw2FdZSx0/hT/DQBl01MYJlGy+fiMYsRIAXDucE/IPvca2GfN/42pNQsJFQJdfBUgtMPIqHjD//MLKKTB4=@vger.kernel.org
X-Gm-Message-State: AFuF++npZ9jdjitL60aPZYO/n9Yac1kC4gt+TiIVlPWbGFqClzaCdeT1
	Zf9Ba7OKKiLjxN4209quYFMdBxCSj7ADxFnBej88iggYuRhGUpiZv+jfppnCFgkfogjd+bNYljZ
	bgNDpYVFt5zY6TJMgYsEJDlpITSTBIAu/wSFm3K37dB7QVlrdCx+NANpRvYTuE/QEgcSSNH8z7/
	0=
X-Gm-Gg: AYBFou3WiYMDri4bh/s53seBTQLpdESQdlx6XmLg6IFd8ivDQsvsVlGxCT7zO0Uh1yt
	5wavuXuDkkrRcgET0VnC1uxvm9yaeaWGuUZfNVe5RC1zo9q8jyJDqgVU6iK5SL6pPqUML93IMyf
	V1ddcU4hLOMASbPVX5ls0xhJibUFjlZct/cmt3j6acckL9i2wuwadGBTNwXNhYeKki/0xwYkiDJ
	l5OijOVBMPq+iun7+zoniHXS2vGBHPhbLl4Xm7CRlmbpc9Jaf/BeDtivmpXlS3P9T+4VJSbsjMW
	aFDQLuV5/4bB1oMeuSl3vrmbflc6s/CAgpQTtfrZuxpZOjye2wJVTRBCpimHh+Psl7p9J4zN90B
	7p/dBhkz7RIpTgObjg/bTgcBLyQJgRzdI3Q==
X-Received: by 2002:a05:6820:818e:b0:6b7:8415:d78e with SMTP id 006d021491bc7-6b78415d959mr10612370eaf.57.1788782638375;
        Mon, 07 Sep 2026 05:03:58 -0700 (PDT)
X-Received: by 2002:a05:6820:818e:b0:6b7:8415:d78e with SMTP id 006d021491bc7-6b78415d959mr10612309eaf.57.1788782637854;
        Mon, 07 Sep 2026 05:03:57 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm26345960eec.0.2026.09.07.05.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:57 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v6 0/2] Shikra: Support for QCE
Date: Mon, 07 Sep 2026 17:33:35 +0530
Message-Id: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABeonmoC/33SzY6CMBAH8FcxPW/NdOiH7Mn32BhDS7t0V0VaI
 BrDu2+BTfQgXJpMMv39p5k+SLTB20g+Nw8SbO+jry+pkB8bYqri8m2pL1NNEFCCAkY1p7Hyv6E
 4mnC/tvVxaouWOixlKbQDrgVJ16/BOn+b6K/DXMdO/1jTjt7YUfnY1uE+Zfds7JtjBLKFjJ5Ro
 MAENyY3Bkq7r2PcNl1xMvX5vE0HGaN6fGIKcHnmHpMnJVOZQ4c7ne2b1r/xsldPrnhZ8jDT3CA
 IjqgW5uMvHuMrHh/fKwtui1wlM1/wxNPbIax4gjKqwGoOHJxG8cYb5l0F23TpN7T/CxyGP2PwM
 4krAgAA
X-Change-ID: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: y02y439Y4xOC6pZNYh1RwE4MLR7cwPCm
X-Proofpoint-ORIG-GUID: y02y439Y4xOC6pZNYh1RwE4MLR7cwPCm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfX9viGTLbtAE0t
 V7X5AqSELQFHoK56XWmp00vZnPTr86ADQIk7ckQR/J+OXyMK5gL94x2ZxMLx6cjrCwsODdUz5FG
 Bs5UktvFygyoSGpvbWIhZ4sZBSYoS6o=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9ea82f cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=FNyBlpCuAAAA:8
 a=J1Y8HTJGAAAA:8 a=BIZn_r5IHwd3nK8cIaQA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=FO4_E8m0qiDe52t0p3_H:22 a=RlW-AWeGUCXs_Nkyno-6:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfXzDhXzqiPcJmF
 jpW+f4O2WExS9+bJvfniFgkR5fp3U8lFRqpjnqTK1QP1QPBWQxv1xGVi0qm5RcLevqwUvBTFAet
 kiG7Fa/SNLBuiIcxktd6DhK6oCNWmLI0l0Y0yQBVWCYYfW/OHabh0CVG2YUUCyZsykBdTu+Es2I
 ar5/6G96NOOR5VYOVVqCUeXM9jtFVf66KEZCH9zSwrh/ZJVsvDASLrihfIJ5jeB9Xu4W97guQwL
 u56dX1Io1nHgMlRCjO4O2J8E3xf89MldtMg4h65nqcOegRANueuVAZb2JTHGhqvYOyQJ/+yLXmL
 j08Ve8T5sgc8efCqNQzmREvOm9miZmtKOjVAU1Qgc2LJp7bTcQYQUJDLMucbZPgSxO7lOGvJDN1
 21Qvu2dwnWRkO6et/Iqwn+MR0vPF4tFoqjJSd0R/dm3QteGC7XEAEiB8RhWGCP+vnxXIQLJzfIw
 4dQBN0pWR6EvZKcg0vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070133

This patch series enable QCE support on Shikra.
Shikra is derived from agatti target and QCE was using different
compatible configuration.
Also, one more reason to update QCE is, clk-smd-rpm was doing proxy
voting and crypto was consuming it. With proxy vote removal, qce need to
vote for it's own clocks explicitly which is already being done for
agatti target. Adapt same mechanism to Shikra QCE too.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/agatti.dtsi#n889

The current qce configuration will still work but this one is more
appropriately describing the hardware.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v6:
- Update QCE bindings and fallback compatible
- Define clocks for crypto and cryptobam. 
- Link to v5: https://patch.msgid.link/20260820-b4-shikra_crypto_changse-v5-1-70eb4040fb25@oss.qualcomm.com

Changes in v5:
- Rebase onto latest linux-next; patches 1-5 of v4 are merged.
- Update sdhc_ice power domain to match sdhc_1 PD.(Sashiko review).
- Link to v4: https://patch.msgid.link/20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com

Changes in v4:
- Update Patch 1/6 commit message to accustom hawi special case.
- Collects tags(Krzysztof)
- Link to v3: https://patch.msgid.link/20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com

Changes in v3:
- Fix commit messages.
- Collect Ack and Reviewed-by tags.
- Link to v2: https://patch.msgid.link/20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com

Changes in v2:
- Add fix in ice bindings to specify 2 clocks defauly for non-legacy Soc
  compatibles.
- Update commit messages.
- Link to v1: https://patch.msgid.link/20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com/

To: Bartosz Golaszewski <brgl@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
To: "David S. Miller" <davem@davemloft.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Kuldeep Singh (2):
      dt-bindings: crypto: Adjust Shikra compatible hierarchy
      arm64: dts: qcom: shikra: Correct QCE node configuration

 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 arch/arm64/boot/dts/qcom/shikra.dtsi                   | 9 +++++----
 2 files changed, 7 insertions(+), 5 deletions(-)
---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

