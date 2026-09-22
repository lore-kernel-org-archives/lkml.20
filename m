Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFE355D88B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115129; cv=none; b=iQOng55G+H5tVqRtJa3YbjR1bpF78IAdYJ16s21RQgWc7toP2m8U0cXlhm0Tg4OUV+p3ZC8Yy7yM1xv3Ft0zSfVfNVVpLeWV+dwniNsJV8nww//a0rDyzE7z8VQvjLnFw3si+pbOS4cEDuk2NjllnEKcojjqS0luYYBfqrCLSAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115129; c=relaxed/simple;
	bh=Twip/C3mRSt6gu4wo7catfd1T62ZT3Ril7C7SiKejnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMigEUwbkL2ktn7S6sWAFufZ/kV0sRjz67egI4FnwdIEDWD6Xvx2Txv++uN32bNtM3cXnETJBF/z649+DkKo35Wu2rHDCJ2jZXjyzsV2CzRZR79ugMb+Adi+Boq2wOmgkVzQbn6sBlPY55Q0RqsjR2xLweqBV//PvQ8soFDpEhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlm+c5HG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbcIqhk4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlm+c5HG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbcIqhk4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJCwa21166709
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/MVYf1j9dZY
	8m3zx433PpPi+oUAxxCgjBxkMvHlFnnQ=; b=nlm+c5HGgVtlqUDEzS7QRvCf7rV
	N5JF6GEcx+jQYz9jry9x+tLIb6oJ1gkuiEEuOdlW/3NcVZtVaIR2I4XqIbK6aHdu
	sO29dwbVBry8WuERuZEnmKYEc24xkMDf4V0/Yjz+XVt8t+6GlfTyc17jvr8NM3ZQ
	sz7sayOUCAe4U/XJ3Itfe9y/xumdwn+005W7dg4LN6+afUfPdJzch7vqoBbXEMk+
	dURvoSKWSeYFZeafBIxAJRVydhCffXynVgidlwZ+sc57zaEs/hTWdThOYlj7nuqy
	OC/nU1VT0unOtPSNAVETr2eS5oRu9ERm9Kmmj4Cww82twxn5lXNwMfIBG2g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw0u8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104eedb5b0so8088276d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115114; x=1790719914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MVYf1j9dZY8m3zx433PpPi+oUAxxCgjBxkMvHlFnnQ=;
        b=cbcIqhk4KPdiexXGtMy4Ts/L3HaElytrWSdR1dnRbYUE+4G4QpzUE1ECnnhEkBo+p9
         FQb+D5zEgW12sw844p/3YSnPF7ipy5cMp47kxJOE7qU/VHgbVrtbTrq6KCP1i+99tmkd
         mSxsCTY/0uhqDGNYFV9tO/G9lXQlHV3FnZ0RT2WA5nT7KNG/tNARB+M+O7jnhwcyJT7d
         gxcTp44KUwHblatS14Z2ES1VaLPllsYFkoZgR0zXZnuPYEzOyx6WM9piDGWUfDf8E4a/
         uiRRBhRE4B1xAUF99eO/2J0IqVnnqqZBLrBDAsyuU1lmyNG78fCCXzY7SEoduzIJHkgt
         sFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115114; x=1790719914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/MVYf1j9dZY8m3zx433PpPi+oUAxxCgjBxkMvHlFnnQ=;
        b=TXEeBZDFvY4erW7KNSy4PfqoD0P3Wuh/LJ26635SFvsXb/VnaDVPzj/sukaAuQsrP6
         yufKARxOpJ5A98Y4z7P+n+iSyMiMvaIjuwqEP9+CSkqNeJzxPosz7PrEG//Aj53AXpqq
         4nNcdSnR+Vywp4Vs4/fZXwvhaSWcrxvi0vXYippQHIcy9NdB7H/X+a5i0D5xBXmgY3iz
         hK5lurceEX7VO4skDMPTFNEVKZqpFCcxPqdo0Dq2mW9og1Ax57wSp3+EIBcMZrZIzwAW
         3KTF6f3GOggvw69q4mfxbLvO36i80N/FuZaty9II1RiYJYo1sgq3x4JRLDudptqjNFQL
         rxpA==
X-Forwarded-Encrypted: i=1; AKwUvBxV9bjcXDWrz1nWmWLDAI4rrBrwSzOeQlSCWs8sw1BcJpebczDjA22egEV/bOhKDXl8XtuGCPGfLrXUN8M=@vger.kernel.org
X-Gm-Message-State: AFuF++kXF5yUQfn3E/4oES3YKDRL8sv6x8P8lGfknSZGr4zEKFWBlmnM
	P8dPmqD8PNRH4ZJFtHk9q3h4ct/ipxcVHEuaQwVaJ1ieWylUGTXWFNg4YsA6euBuNkui9zr92kl
	da3qMtfNqs190+vJR5TYSta/T1EaAYrUzyuRhW/flmt4SceMuzNb8osXFh01wLFjdVkg=
X-Gm-Gg: AYBFou0ybnF+MaVvEOu9ZqWmCs6+0mgTaKLzJ0U46j3zYK98F1rEqgAtY5FCszXaSR7
	71w8A1psT0sVQTycjKOVjiNFikzcbte7OlhE25SaVjsEE6dVfEDhDq5BFdze4VebAFjxVuhuPCU
	ArJnsdj0trHrPTHJOnnlAemYO3Tf+FVP5bAfcfjO01zXfH208iu8CudJUFpCn5y1B4CWJ7gDnXm
	ELsF0fmPFRG6UCJoF5RkK1SfhnEZKa62ry2lrfKLtQulT9gd4Mfzd8ncftnU2aNU6tAzjyKqWZL
	1uErfII8IFqjDBwUV9PhvnGsguQhZ/oFJfNFUPAuvFeZx6KPUTn/NcJz5nFfLyAJtlfqlSS6gMM
	Ge4NnsLXLQpbNjiwsCKSOHxi5JrdlnHvQce2oWwyeUO1GlY6Fddbe5H5ZT5X3mSS/
X-Received: by 2002:a05:620a:19a7:b0:939:feee:630 with SMTP id af79cd13be357-93c25103981mr127195185a.30.1790115113748;
        Tue, 22 Sep 2026 15:11:53 -0700 (PDT)
X-Received: by 2002:a05:620a:19a7:b0:939:feee:630 with SMTP id af79cd13be357-93c25103981mr127192685a.30.1790115113428;
        Tue, 22 Sep 2026 15:11:53 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 5/5] arm64: defconfig: Enable configs for audio drivers on Arduino UnoQ
Date: Tue, 22 Sep 2026 23:11:27 +0100
Message-ID: <d7e64ce498db8aec475b8652563c6cd8bc8cd429.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX6E9hrqpOE2Yh
 CTjMn66RYVXX+YYQ8yvnsg3XVWJV5wr/fzoguo/Ilfqe9oBtnhAculo+LeqQA+IfqfpPQyQQUPl
 Zg+A7hSExqiSGD4VZu3rRvPD50HELX4N9GQeTaYHS6uB+/vukesjONncfxOiE4vCItSYHs1w78d
 QvW8C+knfMsPwe4y14gLUa1MkB+xLJq8DtmxBPUVcpvQbYfNPeTwfXgCMxGxcrGnlC8BIjC6e2u
 ZQ+8s8Y3GZOMwZE81+we2ti6Mfi2riqpnu8JuyeD8NEX6jyejmg+uyhFAhjuzaUiGxdDRiW67Q2
 8nJUaZwlmNgx0YXvTQ6Q4EEApW+hguR7MUENIUhWw9XqoeN7PyQP2zx4yug9vAkP3U8Lu9ma8yW
 Dpv5wUk2Rhw0gWk5hXvcZRR2i+Nf20LVOA3CVzM2G+BzTGNKT36CbzGwW47unpZFQdz5EG8dBZu
 ShV8BT0texmQrwPDQbQ==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab2fd2a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=rO3wVDe-YCVyVCuK1RsA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: ig4JSPRr3rgBCAnW59UT66EZe0I-qfte
X-Proofpoint-ORIG-GUID: ig4JSPRr3rgBCAnW59UT66EZe0I-qfte
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX9gQViJfEfYM6
 /be1DsGJVvdUkiIDxV1UzbVYmxIxpjQ//drJ5sJmw/QI2/mcPTcwXxYrI7e/tEhRuUHwLsAwHvI
 xaDxEtcQOuTmgLTyxAG1iMS3LLqWd7U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

Enable reset controller and pm4125 audio codec driver that are required
to enable audio support on Arduino UnoQ board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 982ea1758eb6..f734c413dba5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1168,6 +1168,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
@@ -1586,6 +1587,7 @@ CONFIG_SM_GPUCC_8450=m
 CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
 CONFIG_SM_GPUCC_8750=m
+CONFIG_SM_LPASSCC_6115=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_TCSRCC_8750=m
-- 
2.53.0

