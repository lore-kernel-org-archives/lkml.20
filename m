Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F6D38759C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523684; cv=none; b=H09B3OoCL1HdBc+Lzmc5y5ZxFbHBfe31giC5mXSXfEb7N9ojstJj+Q28/Ju/Sgb4g2X5uyJ9WPUvwxHWN2HLz4zmcd4Y/b5SlRbxgtRMjxs3G+kOpxHDiM8QdcOboPQGDIlilGKbbvaKZizvEk2QpWcLqCZ9ZBl9gdKexoVVBQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523684; c=relaxed/simple;
	bh=Tcz3Hw4MBe/kinwNRfO/NCumKK+I4zlHeL/p3r6h6oc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aNLVy3PI0/2R9fRoXgSRt1+5eJRHQWCpV1FjJFbV5JnySBhIYfkfVWSdW30K3e9H8LJ5h+dM0IE67AUs4HvB8Qfk1Z9U0Y64PTKm9Qv9ktg/WlScTjk+mwP/8mrTIBkf4VNXO5LhcS7f1YtM55EqT8g3GgX8SQ/iL+vBgYw2dmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dx9DowJX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7cwGc0E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dx9DowJX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7cwGc0E"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FNZG9t1408717
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gup1dqywcjZsh8O94nmxUeoPxQBM7Jedbh3QUTm9818=; b=Dx9DowJXr/mU5vHx
	A72dFY4XHkETZDUbIUYagGOEbJruUrA9DZ5EHwl2hwLstXT66+hftk7LX0s6Bve/
	PC7yTyZP4cw9DDut6ZIuSYzxwq5wmtbYUBkbpQthgRXWo8Cv6W9jim0EvrIaK8wS
	WvxMVwQovkdlMMy+8gu/ffa12VqPpv7kxy3vVQTSHk5wushsOZwm0zvr+Kb2/6ZI
	7huM7CQ4EHsVMdgsxVAMvrBVVWJ5V1nmT3sUTusgya1Xro2czTxBT/Vj/9RYl49q
	VfEu5pjq6k48UXTWMc/aHdJ22Q9+0Wpk504hgmIxkT7YByO981zM3qkjKBcAxQGf
	/wyzrw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftugbg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:54:31 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b5bfffcc2dso1542073b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789523671; x=1790128471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gup1dqywcjZsh8O94nmxUeoPxQBM7Jedbh3QUTm9818=;
        b=F7cwGc0EEBLWROoAROcQHH6sENktCN3P5kuDCXobo55gQ2cBcNPbmBfo3gKVQwzOQz
         WnOVY9uQkQmKrIY0iDFJvTevQ4D7/wp6sFeEkKDOFfkH/2BedM1IwILVjMNDGYiFbk8Z
         3beWDGeaZ0PwrAShCku1vNJ+9npyMnzFfDWxcKBYWrf5r7EOCryP5eORkOZsRsDmc64a
         MytXUw+bnPxvLyxASp6OsRWpNUjEG9quK7VpXqkgiCoKaAUXLYMEb+x8NtClCb57sHnC
         XBBTnGBXhmzc0qmQSXVJHESXhguLkor70TyY4po5W6WDHvgY/w+egpULxdtoO4vupcOQ
         67WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789523671; x=1790128471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gup1dqywcjZsh8O94nmxUeoPxQBM7Jedbh3QUTm9818=;
        b=sqQvoNuT5SIeKt7iTQb8MCeD8rqQRvEBo04YrtNsttxTL45RzTLjz1FqxCehVzdYw2
         wwR58MANQQSWl1as3jkHtbNAdYskJ0ogyWGYUBUiiGgCx3B9+GaStGwoX9HbsESkHyeF
         BGtV/t0eyAmLFYGra6Wyu/x2xTsu3KlKR0p3yjXqzKFX8W58IgDk3UsePqy4NdslVnfe
         wsYkF68+CkAV/3XH/7efm+cXkSAfHDVgR90phHUle/ZcxSNhGCSa4FLE8Ox6/aTlQNI8
         c8JVKhf/0AxU05pCWhriTe9bh4k1bOuv7oNV6Pe1HO2SU1kk0af1+h/HKqoZIAJh7KPE
         QbXg==
X-Forwarded-Encrypted: i=1; AKwUvBzbNITbpQlHhLExeeJ62OsRwiwgOSDOiWODwoKgN350oJMS03F2f/sKvZrCbLeRtG5ZLv99MvBjuGVddY0=@vger.kernel.org
X-Gm-Message-State: AFuF++kOj9kfFnYgurrY+j/Jg5/eonYDQGAB9ShBnZcNNS7/xqOcc3GP
	4VXO0nHc1d0GSuRV7QcL6wt0UbF4c0b5IjAw3dHuLwUnmL7Ctr5jtGzP3Wxw1owavt2PDEgDgAx
	FzXA3HlH05n2/kEYuu8IIp5BM12yVbg9FKIjNmO5c/UwayiojBEMLbK6I3w6WmVCDGYiRoSYpKb
	4=
X-Gm-Gg: AYBFou3llKqZe2vFgAFbwlCtLBTiehN30cDzKBW4Yk2s0JDI7iCyxBtAYPk/bCWpCe1
	OycAFOroIONLP5+MHi3mAPH2hgyZYQ2DNQ2Zk1Nceh9XJ0MwGGRYn0JRAbxDcitaRwl5PYx6ABh
	S9aQwUV5nZ34Mf3goWXBJflBvOw16IoNEPTntoJ+xsYGXhES/Ir1vso1FKvp6ymO3Pu4dYhQndz
	pkUHR5Fv2pLWFGNtTIVGiwQrFQD9JV0Xg9p/p92GRv3qTGiAfSX0wwp3kgg7zbDTJ/EK6bevrH0
	P3HZjfUmseAQ3PCPXKdu4JQuObS6fJrs5nfhTKSOwi+8TMhe9Rmgp8TyHkHPCKI3gJrcNHzIIXD
	Ia1yJdZlZglbjDsKBJjm4GAc=
X-Received: by 2002:a05:6808:150c:b0:4c5:6a01:210a with SMTP id 5614622812f47-4ca572d7a22mr778219b6e.17.1789523670702;
        Tue, 15 Sep 2026 18:54:30 -0700 (PDT)
X-Received: by 2002:a05:6808:150c:b0:4c5:6a01:210a with SMTP id 5614622812f47-4ca572d7a22mr778194b6e.17.1789523670335;
        Tue, 15 Sep 2026 18:54:30 -0700 (PDT)
Received: from [192.168.86.45] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ca1e09ab74sm1283039b6e.0.2026.09.15.18.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:54:29 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 20:54:24 -0500
Subject: [PATCH v2 3/3] firmware: qcom: scm: Allow QSEECOM on Asus Zenbook
 A14 (UX3407NA)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-zenbook-dts-v2-3-41de8669a7a8@oss.qualcomm.com>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
In-Reply-To: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nicko van Someren <nicko@nicko.org>,
        Chris Pouliot <chris@pouliot.me>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=Tcz3Hw4MBe/kinwNRfO/NCumKK+I4zlHeL/p3r6h6oc=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBqqfbQauzTEM2Kkrm9ytCyKgYBy/sesjDsRUzcY
 4difi/oxcCJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaqn20BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVJQRAAwWpnT9waEV4p2EW2OEpUgxrWCsLows8ArT0+LwP
 i3/uQOZV6b3/3uU5TEkMlhasuXdBtDsC6NDdY9Of4f0HORbiSzQB9m/KUV0xw9cw3dbHdNBM24j
 C6V9u78die2ykltlI3quP/wxja54B0n99N/T+xYf17f8xrVg3GbUnlM3ExyaXRGpJKY5V6mZStD
 +vPBWkT1GHHIwXu8VlcW+6PM1wV2Vn5TXeE1HR4KSRlhJsvNQfQI0Tmu5mu4/WiabwF4yDvYoj3
 psoroE3sZ5qnKm025Y6BinLqVG3i6tVZUkNdfh5ZFm1Rjexl+BzEmUpZZefd5jbTInlwqOiO0KH
 blyNVLqNJRZjCa4WXlwThV1K92GQuSU6g9uQ2kC4g5FDAIR2+yLPIu4fdZfxC+Zhe6cesURikie
 Pi+Sxb579osrqlxLCjxfP9G0kYy819HnsWrWYZOzCANszGAz0xg+lxcDQYXYWuSRvaNBGu4uKF5
 S0DKbY36jUFQQ/uBsq7pXptTDwfqx5cM//FsmQ9EKJHVTrXtLpc26w+c1Me3/DgqelZrI85UY1l
 LRl8ABvrDBLd5Ml70aaSIEWdVup8Zzm6hvk+Snz4/7nijeP8ayy/R+9EHrwZl4pnXHAIMSvojCU
 v0ZERpZvwGk2YW09yjXsV/6o1ee7VLMoArcxb4+FkHaM=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAyNCBTYWx0ZWRfX5I7V/eB2p7av
 lq95IeQUT6ldn7wjwO3zUBqTm+1eVZa+4GVjLOfPcSINXUiFdUT1Eft07gea0cqAXKXTmB4PUFY
 eTZns15B2vFby0b2sNKyGmTSCL5jAaLfhgmtQl5gTM53blarecsdyyapjn0MppExnKHpBGqWwvP
 MDaN0VLmojgNvRALRtLaFRMaGoQcxDP0LJBpCy0vlVAnJhs9d2ozBsWa32rm0pSeIdROHWvE4rx
 ESQ2IjQqFP/eaV5F0jYmTOagvMTfqwxooVeWh8OUx7Pnr0GG4jdjp4JksdQnB5j4VBAvelaPHTU
 uGjStXPz1Ag6V2I2hinpvE+d/K/B19A+BVudZymGjAYjO3wiycyynOqZDw5PPkW6WkdDGwKafaF
 cIOWMWYbhKO4xn7ZghITc+vDL9Fti1zmfrZrz+nOGnLtTAho5f6YVvJyrGQlTd2s/AU8RWESXts
 hdiRtU2J0C95ArhfBuA==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aa9f6d7 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gyDl647GgXGSOFt2m_oA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAyNCBTYWx0ZWRfXy+zWYSarAZDJ
 httaZPZW9jNXojQOlOVN4fNG9QnMwboFBgjWeCEFARytsD6fzK2f8k1ZfkFQIfG1MrNAMcvs+TB
 db7ztLB74KbSl92uwLD6kXYJiPJKsHU=
X-Proofpoint-GUID: G3396qBLKeBcCoQ3Uyz7aLwo7GYeUPIc
X-Proofpoint-ORIG-GUID: G3396qBLKeBcCoQ3Uyz7aLwo7GYeUPIc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160024

In line with other Glymur-based machines, the Asus Zenbook A14
(UX3407NA) exposes EFI variables through the "uefisecapp". Add it to the
QSEECOM allowlist to enable this access.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 28411a76d1bf..df20773dd754 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2217,6 +2217,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
+	{ .compatible = "asus,zenbook-a14-ux3407na" },
 	{ .compatible = "asus,zenbook-a14-ux3407qa" },
 	{ .compatible = "asus,zenbook-a14-ux3407ra" },
 	{ .compatible = "asus,zenbook-a16-ux3607oa" },

-- 
2.55.0

