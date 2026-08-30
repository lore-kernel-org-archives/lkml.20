Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BF633BBC0
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788126985; cv=none; b=J5iiAMdE8hAaunSq9DFRtIfnxyXscPm3Hajrie7jg7xOX96lxfMmCJEeY20TLjH68SEFmqx0lMPTycv1VoiPC1w5fmAhrpY/eG9YBiTzcMYR/rKVn1bBpYdAlntTdbHBQF7ZzTiZ7v8aJmM4SSg3IYLxsY+BUP8/YpDEJK3RT0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788126985; c=relaxed/simple;
	bh=0fK1ec72oduQp2OfZiFcr1jtp5qufOKAWnFTOABUVE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9tqE+te+2e7Ao4fBVJE7b83VwCMNspaqCbTBLW5T0YGnDT8bZQSUA5vPpum2iskE3H13rYYTild2lR7jf+MNd2bwfx264Dv9FXIl05Zn89DxWK9Ps41StdtzdxSXVxLbe+JoCPHgTBdSp2gCH3Q9ud3TktN1So0VUFjxuJSSFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3w0NEKl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gBQc5De0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3w0NEKl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gBQc5De0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UJK2pJ1217218
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	trUtuGg92SrcEyjgat3wh+VBd03ZGhYKBlkmGgV3BfQ=; b=Y3w0NEKl+kzJ55II
	hKPBACjiApGBm3pby3QetAmh2INu7b6nnTcmyfB4NeU/o4AeIlhdoCaqPYbqT7IE
	yDk09MUY3LJ5uo1vJsgAv88w8YULADma+qCygnvVLWmivuf1TQlCicz8d9udzAhv
	aYnEG8SBD4o20kMb2BxZtTd+plI2n9ukB9K7YP6VP2wkHsOcpU6Tsa+c+HMu18BX
	/SG+CQHGqfmA7T4+SuE5wnw/tsEYSw3x1gmNdzPG5CGgaPAEM0in0XOfJrUIn+zr
	SA3A87IQ7rZWHJh+qmdA78DEcKwKcdQL0KnT5nXhIPbPZ2r5FM4ZUC3w0TT9wg8M
	Ks+Maw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2bsht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:56:22 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-85c370a5eaaso54043427b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788126982; x=1788731782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trUtuGg92SrcEyjgat3wh+VBd03ZGhYKBlkmGgV3BfQ=;
        b=gBQc5De0aXx01hcOrbB5+7DX6kPWdkwosu+5WYiSxLA9nKB114WKiJc8uQNXgiVxMC
         /u7tdVb5G5BBJN7qPUAbsq0ffAiUAaUbD/z/pEZ3u3ITjjU7/yhko5dm2xhvvwo6AUm+
         aRKnSUaDVc47upRBWYBY/gfKMWcWKHk8YREphDeSkF2K1MOF2LYugFBg6oYSKyJVp5lE
         tU1ULQjI7GbiLxIbSLMT9locZbjkEEjS3cfYGsHOE2qyhAzkl9Z4KTCUt22h0MaQr7DN
         A18cEPcfBMuC45CBi6YFLGTroTIa+e4YjGb/TZzfANl4Jz+0heK7T7NgRNaEFBIekin6
         s1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788126982; x=1788731782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trUtuGg92SrcEyjgat3wh+VBd03ZGhYKBlkmGgV3BfQ=;
        b=hLbjJ2rI7/unX+u3xlvvnsKcjES51tFpqj40MmvWWiDq4kT3odcRYdNWk0yu0wTA3l
         XqDh4TUW6dinV8Ki/hknf2lGdQr46fCdtjJY0l53DLaaXaorPGXZgHyEPZeM9LF8c9bS
         tEoNJCGOO59tIwowgfJNdLvgo1aFy91hvyqk/Ud0zzKYFTVX09tY6HtftK0MBh64/J48
         TPWNqU0g09fOCYtuD70/zfv+97BCHLkjL0JAlHq8/f0BHVI7zjpyvcWYq7NWsOgFdBqA
         iSIKptHziuqrIihSm2CSIdf/h9vZr4yKBXaSYdxsUJl+DJAkWT/K92QxCBkKPezu2yA5
         QoMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxOJjC+P4pdv1Vx7oqxJ7dgyOupEuIB9DfNxgvupDn8UoT/vaGOaojpZMGCm2XTwH1OLZl1axTur33Ojk=@vger.kernel.org
X-Gm-Message-State: AFuF++lEWKHqCUrVKdkHM2OvBTK5M8BArrHNA+aCG3JCM2awtMTiegMn
	Ms23eXwnYGMxuo9QpLuku1/+t4Q9YrPgDwJRsTeztTRWhcuseOJgZtgMysNBCN9k5DIeB3Li74Y
	TebAN7kmObq5HB4UIQwcQEMzTOhdk4UHGfd/mwKPJX6RgfTSw/qgopRcVuOIXbkrG3Q0=
X-Gm-Gg: AYBFou3so8s/ary7p4J30oCYfb1lxsiuyBL94/8xBZt9K4wvysY2ujevetmrs10oDfz
	C2Pl4v7hmMi9/j4cCoiFk58E25WKx4sK7pQSB5i53YPKSlhxfB8Lv70gUQhxywsMTC5+iavwP+g
	SGFU8doRt6EET7YOHlCosna965gAMx2qyasSENbGJGh12wkwu7riFg2aP2HeSMOhD8Wd1GXopyT
	/hgA5L+R4r4aoYYfyZsSFK809RaO/wsC6PPoIbHExU0CUgg9VZNBc7F2bcXf1+Tz9MsN/SuBgYR
	KTE1tI5sgrIz8f9Khlhif2I7dgxcGbX9oNazdu7RHi3nZX4McIHC0nELPcOzxGLVRn4D4rhs7Ee
	zsVFtxPpZZ/QGM/THZg==
X-Received: by 2002:a05:690c:7108:b0:862:5a77:285d with SMTP id 00721157ae682-864ea46ba57mr13539367b3.0.1788126981989;
        Sun, 30 Aug 2026 14:56:21 -0700 (PDT)
X-Received: by 2002:a05:690c:7108:b0:862:5a77:285d with SMTP id 00721157ae682-864ea46ba57mr13539237b3.0.1788126981539;
        Sun, 30 Aug 2026 14:56:21 -0700 (PDT)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5ed1dc88sm38268857b3.19.2026.08.30.14.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:56:21 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 14:56:16 -0700
Subject: [PATCH 3/3] firmware: qcom: scm: add HP OmniBook Ultra 14-kg0xxx
 to QSEECOM allowlist
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x2-hp-omnibook-ship-v1-3-9feada71dc79@oss.qualcomm.com>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
In-Reply-To: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a94a706 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=zWXkJhVHaGWV9AuZZCwA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: DHPhoE97RobXQ1i2Tz7rsjzpUaUSjofb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE5MSBTYWx0ZWRfX9ex3S1GKxXZg
 W+K+bzwJB+D3OX2W5eWh4eDExwQriEpeC+XxkHbrw7q/jOCgebMYKE0NDhsTYCzMDRhk3PSgTlH
 b5x7qkKcf6wT5KgNOMlB+LFWK01kwjRvKs4HzSU18sCgqy1xS4sq/vVpxZV6oW927oQ26gY0PSt
 JEcNT9eVMY2exaySIMs5kBDnkPBioQjomY3eHwvVnu2BnNZa2T5iLsYLJPCOnQwBs06f/zvLrOm
 BcNOocSSUOjzvV1rNOOAocuxtd6KcY0qXbZixoa+M9LDHe4agdBveMqe2lj8zoF+OCJTckn/IsI
 YiHsJCiM7lwEXJuRNwCG2x/9ncMllglH8+4mDw8r2tfQCBSFjIt5WTXUApkvc+lBvwUUthS6Equ
 74RtF0ry5Lx/MTkbOmuGIN04a6QFP3yaUgZ+xWTKcxNsKszANUi5OdJICbmm5iBNpZRP22S0owX
 VbNvwPq4bNZgjP9jdig==
X-Proofpoint-ORIG-GUID: DHPhoE97RobXQ1i2Tz7rsjzpUaUSjofb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE5MSBTYWx0ZWRfX2A4VEdcPbNno
 aePT0zyyH95h+TC6ZabV25h8koxbiB8K3XdenjMpiWU+E3lsE3e/Gjg/ZxfsKukTxR6fdFpi8m/
 w617sYIy0EHN0URbI2FYKUebIPOw2fM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300191

The HP OmniBook Ultra Laptop 14-kg0xxx is a Snapdragon X2 Elite
(Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
Add its board compatible to the QSEECOM allowlist so that EFI variable
access (efivarfs) works on this machine.

Without it the kernel reports "qseecom: untested machine, skipping" and
efivarfs is empty.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..219ffa7078b7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2311,6 +2311,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "honor,magicbook-art-14-snapdragon" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
+	{ .compatible = "hp,omnibook-ultra-kg0xxx" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },

-- 
2.47.3

