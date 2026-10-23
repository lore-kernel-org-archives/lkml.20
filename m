Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746232;
	b=fXhKHaOAfX4TtDkpFTGihRlMX9lIeCMYtVROZIlmAz5gnlOzVYm/iHEb7eCdddIlHr2f
	 +YaHg1UBR/s+0dBMaTAbenby5HQhMXPkgHFmEMkFFDSqO51lCJbHQhcV6GNw6lw0+v1ep
	 e/3grO11m68yrzK/IeSlEhxggdmIgOHQuleMpAaxM7rdhpWmGWdNYlMJunr5YA7l3cI3h
	 OzjaKF81iZytV9MGpJkyTjl8TgUetc01nIUTp/ybOi1PoGnGJhcPUp4bpi8y0pIZLrFVL
	 eDC4fDlkZla91BHXEZcJv0kcsnsns5Hr+s10ABeJxJ2bhYGcBE5YNgCoXlCKfN23FkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746232;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EhRIYoT55j9ig8mGHfIEupQGVMISzGazIaZrj/4btXE=;
	b=Q30vgIcR7RzWjJmaJvvkDddDo4ld8XJnBg1E2YsoqanDzcREb+7t45M6+cU4Q523AxL0
	 Tn0ZuqC4e4j9iRt0xb0/jE2OjvPGfemtUkLYJkhj4QCczH/Bxgdo1RixXGUD05NuWv1tT
	 /jxivryZrtNCoxeHo0JNDumEazD2uniTp4pPkkHbMU1QBWcP9Lp4wNP3U2+V7jXIBwJjL
	 xegYClO4dnid+v7EOy/UfSSdt8Zs23UfQtHhPlawzRd9XAO+N0xNd48pGKwgu+BjVF4S8
	 nuTXbLOSWzRzPKV/ik5Xdb/eV/1bKSlLUfiGJbPworATzWhEd40VrkE1AoWpkg+mncA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNnya9H7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bo27Z13I;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3CA60A2628
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB3CA60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNnya9H7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bo27Z13I
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FPLD2572953
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EhRIYoT55j9
	ig8mGHfIEupQGVMISzGazIaZrj/4btXE=; b=oNnya9H71PxHpHVdWa6UdI2Fpqr
	RAlkKwL56vIVmImFPeL+WraxnAv4ocEDUrEXkh/p5Ev+MgY3vyac6fKmBmGgZ62R
	46ZoMSkbvMAvSFNM8quyhemenFvIHGCIK42QtgW32IGMG4JS4GBh0O26wZq8KVEB
	bQSzOdjGZTcKEauPhxqkNxQCbzTjLeU1GFV2XnDSCwiyd8ao+bMOp1pjJDEX4S+6
	LMTD6sF+usPRdctUauAWxeqc2DSAqVXBMQnGQZ9+6HY8QMN4YPQ6fYc2/c/V3Hvl
	R0pm9QMY4PyDeAbIvaZ2o1y7BzFClrmQMVFKQVRA+FOSLCTJ3W0jPsqViFw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0kdbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so400215a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746230; x=1793351030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhRIYoT55j9ig8mGHfIEupQGVMISzGazIaZrj/4btXE=;
        b=Bo27Z13Ipn016rFW55XN6GYdXslelEAAFsr46tbfA6lrF8QKWzL53HDfMuxvMhXLgS
         i6vsZYAAL4AHqLUQCmzBIftOhJGWCL+w9daeqELCZa5bd30GIpPmvWllO+165ZQJGZfs
         f9sA5C0iGKwfT6RgpFP0+qebtMygDu1TXPnCQTXIgd9Xvl7vb4XsGu1fukZTcBmbEYNm
         MqFIheELuVt8Nhhrc4ZRVaotXJlnF0xjzX2lu6avaIrHmIS+TP6HNUEafeHhMSRCotFo
         l/Dp2s9iVpn+ftf9B+3ziyEn+Ciavha8ZgSV/q4XDlULRWUUvtOeg3SNQWGqEuRttRJA
         fBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746230; x=1793351030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhRIYoT55j9ig8mGHfIEupQGVMISzGazIaZrj/4btXE=;
        b=F28qa0I/pSo9YDYOIyC6MlJyUZyds641Obcvkk8IbIwE25fU/YA5++EzSfD/FRTuZv
         Pdgm1kMET/4XGBidBt/mjwT0tn/uad8aAUI/pzoDcJY5FsXb2o5QRp4amQX/+XitKatx
         V4VeJOBkqob+yUcI2cYhYCTE3vJFXysMqJmBegL55A52A8cLGaf/aYcCwVdkYXU22bRi
         T+3Cgd0AmWdPU6HdWkOYqTrIPZ92rh5H0FGJfnSDhJuNF7AQ9SY8OpygO7JCkrQA9F0B
         wZR6N2H7Lwg6GA5MxFf5C8V4JKScnESvuCSugq5stQK8jzIqUl7wjSFQq1kAmx7C8iA1
         1kYw==
X-Forwarded-Encrypted: i=1; AKwUvByN0eqBrO7ReGxKAdRDfgFftwlq4+k9kdx18nyKEA+aBFo8tIwBJvfJdPgQFecqli8iBdRsreo/TjOnyg0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8097SSoQ/EV8m8zzJ8pRmzL+RZvO4O+WcYOG3AZ1HMlF0WBtL
	bSkBZGdHBYoYCCAjVjPhjOaCUjLzdhm9pJ40xF7Y9aFuJAg8Oc3qu5oMl4/X2JL5qIj61g7hwzU
	cJeFoyb0zR3cObbZ8bkAnKionm9BnK6XiqqUmRow9hzCODW2uAlJ6L5Hsp/p62m9GE4g=
X-Gm-Gg: AYBFou2n9nTFsvkzoNLU/868NhMWbsCKieUFKTWMn/r7FwbeqrfFH7y2JjUgF6707a+
	/H9wmRdPO/ilmiYrMVEzttbykXe3G4MG9Eww2M9cSpGaD90SxTHXxkHyudDwNGytid6b4nw6bFH
	VWeMihkcGy69/l+5eZXxnrK2NzTGWmrNnhUNwTfdHi+LvVTlisRfhju6megBqd7CnESJpG0L4QJ
	0cLe62g8eZL9iKO1FFTtsVYmvn7anvQHH0IV3PQqIsZ9cXrF3FHWpSYb/tIcVww4qzEXnn4UIBx
	I0Nqbc5Kl/WaHYWkXRJQUup0VTzgLotSK9Nzb43uxExP/f4N8ZhBCXd86CSq0NogWGLtpzydX9A
	MxhKze18nSMZQG+oIodSdVVvhAbqqBrGqFQ==
X-Received: by 2002:a05:6a21:6e91:b0:3e0:c5f5:626c with SMTP id adf61e73a8af0-3e36945f18fmr1219887637.40.1792746229807;
        Fri, 23 Oct 2026 02:03:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e91:b0:3e0:c5f5:626c with SMTP id adf61e73a8af0-3e36945f18fmr1219869637.40.1792746229374;
        Fri, 23 Oct 2026 02:03:49 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:49 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: qcom: msm8996: Remove FastRPC compute CB9 entry
Date: Fri, 23 Oct 2026 14:33:08 +0530
Message-Id: <20261023090308.2898683-7-abhinav.parihar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: TflFsb1rEDygp4Dgoa-1Am7arq1cse8c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXw9j1rOuZIjyN
 B1D6zt1jdBw9TxSlfR0SFeVetv1Ze0W/ZnGWGQiJX/7fi600g6AzSUgTyzDcifuXMC2psAoPrYS
 RTm3JYtBg/0Gvbu9RRtxadu/j/KXN8zV9VrrrPe55N/YzWCJbFHtS8mMAA2v2BPPl6I9noF3WQK
 YOJE7l/YuMH81jDcmLly5ruezTrbFWGPoVv1aq1ReDcndxec1vA3+3+wRPelfflNN+1ncWjVNpu
 fI7rzeDFRCtkKoIM1/m5sJVYypNmkXQMd6KCugYDh8ycxoVuJfLU40PCoUR6eqIkfsVqnTpCe1o
 i+q5cqWYZkfMe6fKmK2GCTXAFEg4IeP7sYqL3n8I6YtHo4PHBwMmD5QC72xUASLP2NUQ1Vx+sU7
 gkOTZiW8R0Psoz1EhKNbSSbMKoDSGSwjzQ6UquXICE2hTpz8R7USO+UMFYij6fzAKqPKza2KYzV
 ce3hc0UJpzTOxpvl7Mg==
X-Proofpoint-GUID: TflFsb1rEDygp4Dgoa-1Am7arq1cse8c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX8DppHR6eT5R8
 4G/xYaY2Tutw8iahSaU1X4DSkGhTKY+YGRjsHMiOeGEu+HocnbjOAxDlVXJpDaHCrNaHSnzm1KD
 +WTC6jEEyIbHLnCmD6Pie0Y8MCmEW94=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb22f6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vzw34t4vhacumBYsXzkA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

Remove the compute-cb@9 nodes from msm8996 device tree to
prevent clients from selecting a secure context bank for normal FastRPC
workloads.

Secure use case support is not currently implemented upstream.

Fixes: 1b80b83f893d ("arm64: dts: qcom: msm8996: add fastrpc nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 818e5660df91..51ef306c1ce0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3701,12 +3701,6 @@ cb@8 {
 						iommus = <&lpass_q6_smmu 8>;
 					};
 
-					cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&lpass_q6_smmu 9>;
-					};
-
 					cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <10>;
-- 
2.34.1

