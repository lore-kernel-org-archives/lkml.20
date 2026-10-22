Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670245;
	b=fWascZz/WhU+nPOi7z7VkQiIKssS0XTN/ejt1Mi944Ty+n8Rwr/9ni7rFpf6DU+TyMQ0
	 bdcCQS3xLc/JS7rIv2ZclEgV9MYIvdHvqKRtjLSbddU8ErGCbwAOJqqPXTVvTWCfI7SLd
	 6VYe+YY0x/Fu7sBPvj/eJ01Er53REtiniifdAHbuTgdfT7KgtLKe1/eE2bMsjL9S49VQ8
	 9FNGF9VZ7p4CHysMiGN02jSE/9cw6SVL/OEBvhYF+tr1//GXfWlfhd3b+u87FtgQvtlje
	 gnJuIPRuq4yJbS/k7ESSxeYysacO6KgbL4V2y/eTFB7joQaJK4mpqzZmFjMxLpyTimA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
	b=SVZUZqf+vjPjHKZTg6mNtyUOnLyf8oyBUVsFcsL0pWcndwb4mdXSDV26ck7f44D3NTDe
	 k5MwjaiB9AwgmFrF2uBB7BwFTQ0hGd+VvNzDPbby39um11faTuiPknvGtLbx2Im8leUe4
	 XZYCD2SFAfJ2EkYEXBd1UA+RbwzfqY4ufHKQ1htidj7rhm86c7MBf+0K45vdP3n4pO+kB
	 mrpvuvQYVzs9+O0NRTJjgo5JOZAifwjjIWHyzWETG/RpLNFBfgbrVCYhiBOvH6TaCJGRL
	 1JoYI00AG32+4Y14P58ESgz/eArkiVuUlk6F9ktDcEaLlS0FlmlK1XWeJvl0XfWIOhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lr6jpaM3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K0PTY4IU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97905606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97905606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lr6jpaM3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K0PTY4IU
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0MKL1965947
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=; b=Lr6jpaM3v/D0WZ+n
	GH4ab8fEPnv2/XRAiQ7CFPe0QDovjK30MxPpKPfj+JHV4jY8CWn4n0w4uVKu9y5b
	d2IFTswbtm9BGlSbcW6Hfjz7NVAEDbIkSwhK9hHsJclg/CBK8FM/6QgYDTTshRXE
	ZqRTbzqrc32LIX4CkRFtH5r+kNp6kGoAfKq2tYyxfHXPG+UdjdWC+l35bBeHq1UP
	R6oyKZv+CZ/hbn4meTEJTc3Vnb7HVpZ6zlUJd9jx5tnZykPF2fFwFXpxaHFILxQP
	e3GBwbUOmbUTrjrGOCviEHv30MEa+fJ24NhNl3gRbaMnL9hXqm1/VzlUHfUlIK6O
	Q0RwcA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ajy77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:57:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so4489429eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670243; x=1793275043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
        b=K0PTY4IUT60wi5CH6Jak4D2PX4/Kyh8fV8zR8voiu2zfLf2/ccMEdMiKoxy+Uz3R1G
         16FXA+qYXscY1Kz9f7vdKqkxznRDOTd/V6pZclAwzYYPy4AXcaCObz9qhsuwr9ytsBn1
         9zmhBaHRMD2ItyAYRHCPjKUY6H1qH73g7aiDS9JqgE8uDgFiQDXDRySGYSONnI46skaU
         jubNWXLYU+yJ+nPt203g+cB8LgJl3b1JEXuteX3wEzj5JRZlprh1Dra3Phvc0FZ9Vu4G
         2fpxHIsjJIev4UxTX2SLfyrQYDFeKVkAa+OvPCWPeX/TYovq1dcuKPYF5RVTUwWYFntN
         BCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670243; x=1793275043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
        b=hJWKuy/aCdqvTPzm58KjRoapsD7XAoCUmCk9bNjB/I387ELGCV+xnyCfOolx6UGp1b
         gdTGvNLUaKqiuTZcKhg3o2qIvP4FaKccphpwfoQUm9ln6n0SYC8pmQoj+wPpnXOLSLCQ
         XLOsgrWwp/g3a0HfnLpeUt9EQZJSDkQaHvHXZKNQvR4UR9BFolAVtFZiHePcZ0fWdY6j
         OB3y4MQ0wkASQEp+GJYRdRTf++zkciBlFtX8iKF12XOAtV8sZHePPCxewUTVJXuFyjGu
         nCccz+IpGOo633cFSpkD7wHHzTlg2JsofveRWnUTAvel0xh2sJpWIL8+SYRlinV2HAPv
         1Bkg==
X-Forwarded-Encrypted: i=1; AKwUvByJA8EFmw7x9x+h1nnpzbS9K1dUWGoJviH8hnTQCFhH93PnqiOkMcqag8Qvcqd1Hkx4MixeQpYQSVfsALU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK39226u1/0Zvh+jaezUbUVHmJ0cojdiGQDLis5ne5Dg+51gW64
	Jf7WgV/2fEDnIafbinVGVcrmcsnsZUiNfuCyPKQFi+NqPzWH6r4mpXuKTjCDvIE+zL2g8wDjv5L
	zAsQU5vQyOgpjF++7LSpLF7fzZPZbIMqLT9poqJ6vu6AIOwXrtiEpORAhk6jOOZ1sVgY=
X-Gm-Gg: AYBFou0N3qxrauq6MIPQ+H+z3d/39oIREsvOu/nEJyZOkFTqSidq7MZQPuXbLAt2gu6
	zvvp1duUV0KeGbaOKaUrv8Cu6RNLUv3kETujUI5KrT08NfTcc8DyrFyCcB0lS0C6v7pM0fHF4Ku
	/EWfVSEFeVeBtpKcKzBDkhzYtoIqHuHFCQW2ixzC0v5X9Z42sLuxtL7vQdfxNs8KqEicKddqsBU
	+f7ulBANK2q2oluqXDKvDNzU7Ia7cX8WAN2gjBz1Dky3ceZxYSgo4T5JjxC8AS23jJJXvtCs3Wn
	VtMCl9zSLFuTlPGidSEn/Lf2Sfoi3IQsMhMq5ZidbzAj9q7wwhM5nri/d3uyTj6C+iRU7HEVppq
	tKrsXGS/vVNn/vvp2cg0hyqjDayI8a6umI98=
X-Received: by 2002:a05:7022:407:b0:14d:c7ae:85dd with SMTP id a92af1059eb24-190a52e2836mr8691736c88.7.1792670243240;
        Thu, 22 Oct 2026 04:57:23 -0700 (PDT)
X-Received: by 2002:a05:7022:407:b0:14d:c7ae:85dd with SMTP id a92af1059eb24-190a52e2836mr8691690c88.7.1792670242643;
        Thu, 22 Oct 2026 04:57:22 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm14508007c88.14.2026.10.22.04.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:57:22 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:27:03 +0530
Subject: [PATCH RFC v3 3/3] arm64: dts: qcom: nord: Add SoCCP on
 Ride-Embedded board
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
Message-Id: <20261022-nord-soccp-dt-v3-3-1a69a4d54c42@oss.qualcomm.com>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
In-Reply-To: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX2nyQQPjORHez
 m+g/n3hv9OHAr0JxDnyHCZB0f3TmYHIWCqc2iTnlS7GMbcz02d+hhp2mEPZpsuNeaxJR1dPuiXK
 AtZbA2E9fN0vcht2hLYR/dc8LEC0OXqzICbQReOg2JFZi6dtMOZdTwWkirZ2n/5o2k3vNfee0v/
 Qv1WNiqidwESHsNNag/Ah187xV5CWpn/tumGW8pgemzdNEkx104/1lruiK9XVyBclW8zPMgVw7B
 EKpXS926rn00xK4IWk8rNCG2YHVzxYfEceZg/4uXQCcI26lyOPZeQHJNHvdMaqAsPQBue1HlYQq
 Wcjhe+hyViyUt6VdFROmIFBodOKkvAmdGTosknvrVINCyThezqB8tyuVH5AuWOfEAibUKL68DNq
 eGN8Aj6Xzowl0ZV4W2M5dRUwaT9uG1pXyy0BrZVbs4APlXvEEM7Fv6XmZhr/aTby7BbgVep+egx
 hZOfmJx1ksQ5fn0QiOQ==
X-Proofpoint-GUID: H0RsHkqAc251dJnZsx1onMTkkYW4stb2
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9fa23 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XGSE3OjeN7eXtsT-Ms4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: H0RsHkqAc251dJnZsx1onMTkkYW4stb2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX+f2MHZM4v6yj
 wCvxexU3XBYQajIjM/MghHoiiMY3Gw+OpD5fLScKj9H+yjnw2YVyBxeNyZLbVMDaObxMOEvvgPX
 GbgUUs5GudU1kfgOhH9SXsu6kV24hqc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220047

Add the SoCCP remoteproc node with its firmware path on the Nord
Ride Embedded board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..1aa3ed4c1e45 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -419,6 +419,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &uart15 {
 	status = "okay";
 };

-- 
2.43.0

