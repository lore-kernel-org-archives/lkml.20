Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75E04E80C1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409171; cv=none; b=ebqoF0/jYFPnKJZDb+5pYwB9CSQhWl2bv9Qr4BPGGZFAa/juQfITwbbMUgUFUuiIpdBs0drF3rYmjT1BjIb9x3wNeAayg4qxbn99CdC1kF+pRVzVEoTVcRuwwc0FubmPkIvyaFplhpk5QV/OpvnbeXpzToOMFAdB/luFYZkVSgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409171; c=relaxed/simple;
	bh=hZXX7jXb2RW5ococNqZ/3EvKgahehke65kVnEWQpEVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TAzn5ZI+a9VGyG9ACswZWTvBZtYs8vKO3SQO3iRi79UQoTrqjV5YWJ8seghOR/m5S4h3h/MG0FpAEbDYdmAIknqnAj66JM1zehXrTrfXqBKIdT0gma67ZM2bRZ46LfSVu8seYewnYSLVaSGH+1HsDtZo+wTGwaqQDsxNc0bbzyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/spyE1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g78BG8ol; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/spyE1B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g78BG8ol"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Osnx3256613
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ux49o/jZ2Q2HbyoLdTvVFEFeUH/9erwewqJgn0+nyII=; b=n/spyE1BkM/dDNRS
	NY8H3e9GZWT/a38lAPzY0ca12xZUFDWI7HgjNpvO99UkGI3Yc8Z4pi/6EasE8jSo
	MCirDZ1mGsx9tSwXtsaADw7Zw0SBJG6SnztTUifIANPCOiqMUrGtGY06QAjWHc7L
	KL7EEUBaSqvQA621soHLUt5j1vyfPzwayskQAksXU7qRalhgpIZfWAUm+p5lVhgb
	bBWO9Mjyjl9c/f75WXflinVfx8pxF9sfztA/nruxXhl6fuZZvAewQMIwizkM68xz
	kRy1cca41BQFoZlF18ZCFOVpbH+l+77b6bI2XJUVWYJJ7eKNg7Y+fe7vp7Nu1pSa
	SAogtA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8tkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:26:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso533094685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409161; x=1793013961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ux49o/jZ2Q2HbyoLdTvVFEFeUH/9erwewqJgn0+nyII=;
        b=g78BG8olPxRHhPx1AbeN/rGzxdsfaCGDZWABeMDliyQRShDrBWyVfnnhm+Y1nWKcrq
         rM1FyRUMQvOnrZRO6W9wo7V0WqANInBS380v0l6XP1QChuYUkhYTG8hlTv9uP5DS19Lc
         cBur8OLeO4al80NDeyHI7r/M1UrW+M1awXXFxf48lQMH4MSGs5mfUTJ6vNJlv9+vVR+A
         jipQG+ouHd0l0DB8xxPu9uP9WwTS673/zPzMjbhSZV6dhJYqOKVtf39O44HjplLNWp+T
         0S+vQLHQLk8TFHKci9VROqsnyIwB0M/Zuj2HqL4Inkp3MUBTkU73z8LhgrQKOEMrVW6R
         2KoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409161; x=1793013961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ux49o/jZ2Q2HbyoLdTvVFEFeUH/9erwewqJgn0+nyII=;
        b=ruccgUZO9Ln1sxs0DmfdeuILfcCcGWhTORlWox/webkUdFbVhy5FTVcRvt46GbRDEF
         khyczQ0REyCcKBgXvLi9POCQlWVpRUodyvaYr5PpEr4KgRPjqUTzIXClQbP3wIdKUJ1D
         yc1En2KaTnK/14e5czaZr4IUftd/zqViE9Qfpt7VEcSLOnlO0lWKXH1utfAhcsfUR7Ni
         8dis3d/A3AgzQ0GegbgHxcKsoO9N5Cybfrttctk7ouTGSWHLykkBrfN4L97fXPPTd5Lp
         ZiyjdrD0AUoA7ta/Tl2+RpY60zjoHsci79KkAC2Sy/249Fbreuvq/jrGh/FhvT+Om6g+
         odLw==
X-Forwarded-Encrypted: i=1; AKwUvBwZEa9kP5CorTeJS3FZuFyHSMDhChoaz27G9XykE7T1jv4VXysuNMth295uGg4LaQbx692U06zDgboLfYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbXgOD+YLmFJqJL4exStCUnhGKVmFtHUNxazIrqYh5n4p2KGOQ
	ukA8w1JHRQb4M/uiftj6qHv1+QLyC6t8DuqanhDLCoLBbOTlDdZfpxqkWmxg5x7OAykgL2E5bJq
	5WIMN9ZCJVylMWwJOHyyKE/PYDjFJdde9r7qilvf33S/tqG52tYpCDAEzus7XoYSDJm4=
X-Gm-Gg: AYBFou2uh2u9n6p3gJHgtCcyU4N7gEjkTYDSSSmJdi7X3vDGyQKqIJAxsvhJt9Ik3V2
	iJC4+PVzJseeGNmPOqiwors2VoQUCqm8oWpL0KoHaQbk3NgClzjQITUhooFRJmqDUufmsWaRiIR
	pBPxpskSTevW4M3hoDnNAlNojQuG31ouDv3f8hYPP6kD/6MlBQirguZYBoR9u4gjRzw36GMKDl/
	vx5aZSdSoO8kZWG4UVnJDOSxCd68NBHCy2v8l1MBD8SuW4rOqWmNrWSGGYPWHfPSAVD3MNV7AF7
	3WnHicmoaf3llVmTNuWUgv2lsQ7wvsUmEXYCwekqLUaoimKHfpUaV0eQPfZ9ucp63lRocBI7buS
	zMqM1C5QoOfOXLzdyT70yjRsETwGk0+JyqPfKouJUTX306lztmAZt7iZHtguelkkJwcK/v4U6+3
	YJCR2rEw8C0DML
X-Received: by 2002:a05:620a:45a5:b0:93e:5247:f61e with SMTP id af79cd13be357-93f29c949bamr1190122085a.25.1792409160761;
        Mon, 19 Oct 2026 04:26:00 -0700 (PDT)
X-Received: by 2002:a05:620a:45a5:b0:93e:5247:f61e with SMTP id af79cd13be357-93f29c949bamr1190118385a.25.1792409160178;
        Mon, 19 Oct 2026 04:26:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:25:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:42 +0300
Subject: [PATCH v2 6/8] arm64: dts: qcom: sm8150: add MDSS reset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-6-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=887;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hZXX7jXb2RW5ococNqZ/3EvKgahehke65kVnEWQpEVQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1f46nwhQIKuE+nnIJbKsZpWQ74BHTOmmJUSF4
 oXddakZXaGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatX+OgAKCRCLPIo+Aiko
 1eDTB/0ScjJc6nrAYJwlxb7Z4o6Z87s6Yf5G/e6VqlG9wGSwoHZKsaWFTq8kjhNE7Sg5QROx8Zk
 yo//8AcN6chcIry3PekMiptrAnechf08aNFLpoiwDLSWds5cpZ1Ac0PlfTgMy5e6PR6FojkDbQY
 +TuLhxym4W4JiVAlCA/Q1SUNEuPcgYYKK6Pd47dca7Xdv4m76SCLdQXRENCr76zjt8gGEtHRRiV
 UIW+VuDyWoxJIkIvPPdxCMQdQo7sQOyJaNJWrjgm83pIEeqW5b5WLhCoJ7x/gLOoz17emmyFZB7
 rUupLGHhAHpKnnl7FuAWVMUC187kmAE5M0Nzk9EeN/bc0XfR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ZeoqfCP1gA-G2I3I259ZOwydarF87wUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX4ufXjDN7B9xq
 95tpdpIkYBG8wGRU3XajY+yhHy6k7OhTrOMpA+BrvFosiHz1JG320DIHeOJTnQDYA790AJRH3mt
 4+RLUrQ1gADXZT2FH8sNMjNNr9SXDsQySgNjZdxV4iFpk7m1W5oLGp7KF3/xNp7CDEQaclxXesw
 sFVM2zIu6F/45Q7LKMY2zziKGNQh0PlGNedH7r5M2DNzAZZjAB568MmGWpFUUoC4Afm21i8u2VH
 7RqloajwaS00yhWcB0TW7s1nhRzO4L6bo43m1pKCHrevIfI/x1pZmC4kmOWaI72M0CuRcIz3dKw
 qPZ5am8OJ1ScAWm2BBV2kCnIRP225n6fJhMbhpS3m2DKietb3vPTJUdUWGJRncxWAVgWW3t+s4R
 cVogW3Akm8Xe8jGedVhJA53fRu3zHkCuRuhvR5dOqo/QhjULQmgIB4r4BflAkXnLTlrs3yqJVJI
 S7tCPQ5Q0nKxqA3/R6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX3QFo2wsdCk7M
 zjq1J2CypprQsZuZsCJ70be+RUP8CQbgqbwxRumtsCAXnVptKeqqbO8ijmmgZU4YP1B/K+nPitc
 HxRUY85no8EyefUgtTikWxDuSfixDCI=
X-Proofpoint-GUID: ZeoqfCP1gA-G2I3I259ZOwydarF87wUl
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad5fe49 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Bz10KyuN3JYNdhx7gBUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190045

The bootloader can leave the display running, as it does on the SM8150
HDK with the display card attached. Describe the MDSS reset so that the
driver can bring the hardware into a known state before using it.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 293fcbacff34..a2d6e6947c4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3817,6 +3817,7 @@ mdss: display-subsystem@ae00000 {
 
 			iommus = <&apps_smmu 0x800 0x420>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 			status = "disabled";
 
 			#address-cells = <2>;

-- 
2.47.3

