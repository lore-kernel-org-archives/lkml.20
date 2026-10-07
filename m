Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B88548822E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363888; cv=none; b=nsi96pywSDG4yOm2GAq8K85zUn5rKksbNkp3afyKFuJTHOfBS71w033OWlm0Di8q9ivAugXVDjHAeZJ4BzQutPzyy+QvN3hGjmZ20LMUCM9sCe2M8iLsSeJMStbM2ErtFM1lspbr42cIOSjA8PxxaZC0YuNM5TkmbiPkCxrdNtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363888; c=relaxed/simple;
	bh=V1+LIzhsNCYGghySNC0huQ8BjohirEoPB9lOPfSjmNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fd1WyOlUxN/ZINJgBU6iC7mljOSKIncRhc7Vk/Bu1u3jloaD3NVLwn9GbjTEhkypfNXO7Yg8OxLJZWm4OKuyKT6YWiYA76ifnl1YuB0TbHggKhSOCXK72/roF3LuM8ABOJYVOEty5LkwvD2PgclqQtoEB7Wb+GrzcPQB9rJYexI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2/FpBNM reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2/FpBNM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jm7R2711354
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wAbK+q4lPjl
	daIW60C/b3RXYI3mjruIC3tTZr7L08yQ=; b=I2/FpBNMsAE2T7Myntk2s+fk+xz
	mXWDmacwlp+99yQAGAUARMVGXFpnRb8gotJd/M9zLKP7VxV/A7u734it/SpN24L6
	H0A0rII5hb2kkBPN0uTD/hKa6oPrht12k6vyq0MQRtqARQDw3AQEOxm1CxpkSBKu
	gSCzO3Q1S8F2VhITuJqF1M+rvi5TJAU4I2sjkAcFVFtvG6vwOrwebv6t3Ia94Iml
	TNvwkO//uJmImKmEtCHkGjXNRxIXvjZKHT86AVP8Es12jRyB0hLzJdlv2p9F6U1M
	ts+qRBkemifnj9EBOmOis5ynAPOPBiU+u6Q74x/fEyc68l1FgGg37mTe+yQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1d65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:02:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso738910685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363732; x=1791968532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAbK+q4lPjldaIW60C/b3RXYI3mjruIC3tTZr7L08yQ=;
        b=bzAujcOe++1RySLO6YGxO9AwPiOevsOzWx5cIONL6c233DY1PiQ0jj/GGBuqlW8TqF
         3Almrdnt2Y5qUU6Wu8pkRBtn9xrcB26rW64iTQqlfiLYI1WQBiSJBn1K3tsFtO5FyCzN
         RICeIhvN7AO4pwX/ZRPhyBGUbFFGKWH0gP5qGdHv/9UK4ZIzUZcR2jpBqHrUG2FD/UTR
         pS+XF4hbWTGPhpDfA7l4J52z89pG8Lquyng0rfv5bEasdDv1qwCVkZtD1keRdzbxuNKJ
         U219k4NyVpFl13VRLy4sS0i0ewKi/4XvO4gi1wV4yb+eLWV25MwgzSLOZ7Mnlms8zwty
         maQw==
X-Forwarded-Encrypted: i=1; AKwUvBxL3FAs+wyCv3r7SpJ6CY+XSmXlw5MndUY9n5Ufh398zGcMVMB8udIWqLtKXGzyMxU2u3IAo2j5Ei3/bvE=@vger.kernel.org
X-Gm-Message-State: AFuF++mQArVHxG/S3y4+JdyxWWW6+PjKDKj7Rj47I98IFp1Mshxhu1WH
	21ltDQ/9NervVwnM6CUKym3Rjvl7LDHrYhvLN5ofruRepor91rCGpeWP5GZeqGvjZau2KOd4PCu
	nkMMaNPZShZaccxzTlmAFTtaeu8xg7Ow3PnCCNENgmCr05eBlqEQmW6Smb7gwLKm1Mfg=
X-Gm-Gg: AYBFou1hoD+YgW4rp2SP+6yXZrPDCYwzVe51paoGRTiHFP3NWeg2AafjQmQ8m3YzgI0
	ELRxuJliE49zYADlqZQj9rH0FchRa8qOlXHMIUev84v1hOARBpd4Ol9nr1Vk8qpm+A8nsRAQKIt
	4yGe82h07tlRUj0jZVku4EgbVXA3EY4x1JXlKzp3pU/wFkOz6Rkvr5zc91fYrVNqOPNv3PY6JHt
	f64RzrAaS8cr/m8hEYASHNUHAeC4AFqfqG28/gI8T2Q8Cycv9+cDKxRtw6XpY+0YjPD8RC/qiYL
	eXI7hdGwY4YxaHB9koXfnVL4u+MTQUFXNc77SJRClcLtZp3DKIii6cScqFE=
X-Received: by 2002:a05:620a:660a:b0:93e:9808:2e1b with SMTP id af79cd13be357-93e98082ea4mr447763485a.40.1791363732333;
        Wed, 07 Oct 2026 02:02:12 -0700 (PDT)
X-Received: by 2002:a05:620a:660a:b0:93e:9808:2e1b with SMTP id af79cd13be357-93e98082ea4mr447757485a.40.1791363731820;
        Wed, 07 Oct 2026 02:02:11 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:10 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 24/45] arm64: dts: qcom: use SM8250 IFE resources
Date: Wed,  7 Oct 2026 12:00:20 +0300
Message-Id: <20261007090041.3732717-25-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vfvK8oOIJvE5g5b0i9sBUhpMsYLiSt2d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX+NPDG6v21XnX
 ayyzqpZ7+2zn1nLsiUInvuwTL9KbpKfnfbb7PrSkQw/DeUa98EQ0WS1Z4Vo+S49rBz3iaWv5xPk
 UbkoqzDmKlIMEYAAvQbJGnxXbQiyM5/mhyRQa+iAy1P5qNMbUl3Ljeg8B/PRou6c2yImjgafyXy
 0cL8elwr8txZThkOAytAlfjiWBHEeLq+1+N5rds7gQ+ojNF5dXEPMUGRTxgAUz8c2Cyennwr7ak
 4KkuW6GjlyxjcXRHH/7odtZcjDjHFqunKrTZvheg0Eb4sDtalSyrlOd1iHznvWhhWcZ9OcDtXyH
 YVmjO9Fuq6M4r1wpL0ZSrI6Croc7sEvOh8S8Jti826psMGIyF6aI4ypXcXmu8jeE3zxR+flS8Gb
 ns2sRRjpMkh73mNsH4k112K6qAzEe9SXNAnxCpGdZlZhfdnSSC3MYwWd1yj+j5Yzwo5afVjkvrA
 zGELrUEpq04WdthHNgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7XVTqWx92BO2
 oqRivB3xMoRc5A+Tp9qEce/eHlqCE8aH3MkwY9WlZzwfM/xGGszZdR3zd2t0MgXPg8w8jNKiS83
 1wSApNCHyHhg1ZjV3xRAkeMHLsAipFo=
X-Proofpoint-GUID: vfvK8oOIJvE5g5b0i9sBUhpMsYLiSt2d
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac60a95 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=ucHQKD9_QHzbuw8IWkIA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..21550d25ebe8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4487,7 +4487,7 @@ cci1_i2c1: i2c-bus@1 {
 		};
 
 		camss: camss@ac6a000 {
-			compatible = "qcom,sm8250-camss";
+			compatible = "qcom,sm8250pix-camss";
 			status = "disabled";
 
 			reg = <0 0x0ac6a000 0 0x2000>,
-- 
2.34.1

