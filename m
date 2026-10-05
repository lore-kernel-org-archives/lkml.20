Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1533D360EF7
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185120; cv=none; b=J0HHuqka7RQODQr+P+SjbuPyq+W1ejaaZzO1zIu36M6sKMyF0iRt/p1zOvnx8kFdWdpRdGP423cgVMJG19yZRGH7+Bl7LlaF7uYRIzfvTNgFLK4lI+WSSk6yKiq16AdfwQnvL2fdZUKodjO3ixJTRk+KArmm65yXYxzhuLvZCEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185120; c=relaxed/simple;
	bh=H/ngu2NtKM0XR9OEviez25RT11Pu6dH3Orddp07YVTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H48DUtLEx19HDd5NJcJZhTg9kpDlbhmcOeeoNv5Z/c2iA9CH7wChEmYA2uqvEVogFg+DIN2I24NKH2r34CXdpZHApFOBC1wEgQJdaw9S1rrhmwjBQxurwefOCetUnrPvmCxdk6/KBpd7AWbGcfkqzciULQZ9f9HU+0/FTvhVA1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5CGdhm8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRc+x8Uc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5CGdhm8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRc+x8Uc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695103pO3242309
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+0ADLN4tmjKk8N9WUyV0L4KRQPHIhMO2nAEzDRj/GbM=; b=V5CGdhm8k58mrLcI
	Wo24SlRivtai3j96ezyMNQl2BSjodo1XjTa+B5w3X74frlm/Yyb5vgPfOpq7OYs+
	2rfFfGVgQ3ofPpg7K1L2iXGVncBwyoFCDLorDtktYN8ZRdLzyXvlwTsqdDu2gKTe
	m6Tt5+2z8pGZZiCZ8HB7XuksZ8WtQqhP7fdb2uKWNV4bazEpJmg4NJW/HyPCWMFa
	hci3quG3pcw2Xa7DLotfrl6i90t+g8XhbUImiOuLAM2PxVuYXHVXvDsuEVQ3Pkba
	56MX4wFL9vog4bwGSATidxRMpsi+JXl10RqbByQi/zEkuLTwVHQHguXC8nyZ5VEz
	jQEIWA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvevr57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:25:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so1228707a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185117; x=1791789917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0ADLN4tmjKk8N9WUyV0L4KRQPHIhMO2nAEzDRj/GbM=;
        b=XRc+x8UcWCZXS/ZYaJrc5YFuOhzC3OErF0cs1lr3xWlrvI6TT9+fH001JmgCVUb9sc
         fj/M1fMuD7wCxWO48aQ37DNySPE87IVAjupxEcwQo/1J8Ia9bu9IHCCiF2US+M45qgWw
         XF5D+F7ry4SeWIVWR4nzCztsifmV5qYtpbiRH9SDpEDov5lWRTQdqCS0LEyvrC5QQDHt
         vNZv/L6ij2LuzOP5Mx1sf+7h4ZdgZhX9choz7RRQyQWNADpjL50xg0G6Z4Gae4uki7F1
         th+LRLuPA/zQKy6Nyc/8EdXh6WnHa8uZ1BFnI1yawhLnmMdSBR1U4r2aG/mLf4ETzwp9
         fqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185117; x=1791789917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0ADLN4tmjKk8N9WUyV0L4KRQPHIhMO2nAEzDRj/GbM=;
        b=nHNrxGLvlYurXIDhr3CUJUVwlHPL9zFDVbZVrXchZhITa5RDUEJ3LKM0z4NDjLgoW0
         XiTOsE/fLqePSAvQh9cC17DQ/MxavRSe6eLORFVUGrpjrleIrEeyG3NIuWXd+LfbAxQe
         gZKdHmOv0ML2p+eMnl8vRlHWR1hJyRXJEc+PDBOyniBisuFMp5c5u5eH6XC3nmXtdrmH
         L92Ckm6pMLRoKq39zDVN/i6l/65Voq2CezZSXlVTgbZblbkONvPhNIfoEVRZfU6UiOdG
         ZhRzypsxxVHaZjgGgEt+Rni0q3cEN35Z44SifasetNDjwp8Q+HlZt9hqIE1s1/LG2MO/
         iDpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdB94U4Zb9UCEaMKN+sPR5LECnmOM3amylT/R62kjmx4tpKaTdI7Q5unuRCgaHSSrnP1lisQKH5wIuoYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlhlhjPUY4CJ9C2q5kqWgZ1kg0zLVoX/ldX3I7peXmn+kQ+ru0
	RjETxFozSWPcBfDL3/LCt2JN3dBrLtC6zfJiDfKNrmDjxEe3WD8yWTeBFjxFI6KFcDVU/SgrOun
	XwUrrgaCXlqeI1mbEftnHQdPx5csXexGcfHlT4lNTFWZAaj5qzqY3tDy9hgMz/8BFD7I=
X-Gm-Gg: AYBFou2d1/D9j9jDkT2/YU0K4n3KsKJMFOF0QijGsU/BD+KPi1E2NJ863IWZdmpiPTY
	ykNdFOJTCEvUG4LvwlE9T6zJv6lnOJqyZA2kDEv6jMH9fiv5uPXBNmxINrLKKrCg5kb1dj0y4L1
	qQfZM4eVvZvO7Pij8HP32gdn7k+uNHCx3iqheLVCC7OP1fCQYKtFkp7KcciiUhp1glIPsZbMiiK
	u44JMu5xv5deNVZ1jXS8zHytTmto125uDzJT4ubvOVQRNa3dhEtAU1QVs0KoFhKDDIi/TATW6Rm
	iNwuQf16OVkgm+OVAE3WdIju9e/4HLXfirkOuSmSMj4egSL/aLPV24YQWyhqV4ZZO6smPhblR3L
	6+XVsak/RbHTdfMnDoBv9vXmabIhPtcADsYE=
X-Received: by 2002:a17:90b:4d0c:b0:3a7:a463:54bf with SMTP id 98e67ed59e1d1-3a7a463570emr1941180a91.33.1791185117391;
        Mon, 05 Oct 2026 00:25:17 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0c:b0:3a7:a463:54bf with SMTP id 98e67ed59e1d1-3a7a463570emr1941150a91.33.1791185116922;
        Mon, 05 Oct 2026 00:25:16 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4f3911sm9901421a91.15.2026.10.05.00.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:25:16 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:54:30 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: kaanapali-mtp: Enable DisplayPort
 over USB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-kaanapali_dp-v1-5-6faeac3a6d59@oss.qualcomm.com>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791185070; l=773;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=H/ngu2NtKM0XR9OEviez25RT11Pu6dH3Orddp07YVTY=;
 b=D+xf16u7uxuQGu/DAQZ8gv6a68ZQIUfSSSOn6ayBSuo43khwowC8y4fM1svWyJdiebAe5xzBG
 yUJfp/uy3LCDY6ghTGnBTNWaIER8u4JC3fwO8PU4lULQmrIgUNGl4JA
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-ORIG-GUID: L5PBLE-iBssFqH5mKVJBGqRwsYqw1kAS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX3iCXCED1hgWr
 5X31W+CDTiUvXB2hvFVM6MGownDPXOtlffBm7jYf+vJUAxj832uixIgapdhr+TrUQS1TYDDA3jA
 0hTL0DRAg0oGKifbs1VbIE9n2+PXSkU=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac350de cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5UEAqLcyi3SyoXtcnFMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX7yT4Ff8CoqXg
 6SzqX6xrznf9kFIqFkffmsBP930efbil/xEyAzuf2JJvX1QQ+ezUZNs4oOfVSmrUFEdKHp5UVW5
 TxQgySDpCnjC+ryh7ufw1IvF/iX2J8GQQg4tIeeLvSIY06Gc8Fvb90Y+Vb+VMrrhUwZw8SpXJGL
 6rvQi1+CT3hxDGQZn+NbXOGrGvw0geRhtME1sGAhln/BRm1CB83SKti61UOGgFpksnUztT/Rv2Q
 ltb7EtQLlQ07vyCqr0Onx3dwFf4sxo2J6m4bOvZXXMGO97RHwxfFWJvH/+0qvVazdtgeddjiS0A
 CUZ8wRi+5UMuSLsXSnXuRq9dY+tejWGK4j4goOrRlChF004WlLGVcltZei/NlN8eHOF2mckzs4U
 T8XvJii6dwY786ocA3/oV0lUkmI5dRUVCPLBbZ+SSSIhzIDKOrZn54Ee6ie3vnmJi+qfBDi5x0k
 W8XDPlQCVnL1JrUO0Yg==
X-Proofpoint-GUID: L5PBLE-iBssFqH5mKVJBGqRwsYqw1kAS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

Hook up DisplayPort parts over Type-C USB on MTP.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 16f4dd041649..ff5d5c2fafba 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1015,6 +1015,14 @@ &mdss_dsi0_phy {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1

