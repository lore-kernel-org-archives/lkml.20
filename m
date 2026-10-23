Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746226;
	b=qwPWoeizjLggUXszZwetzyPUbzXelr697WfHOg+Mi7AxO8gypiwUMNGMtPC2gaV4qQet
	 5GWod79Yqku38I1kekUkojimV+bcTONdNyKTLmaEDJX2hdeiXbOgtEcuEVeKwxD1/1xfc
	 tW05eckHqBrL8mTXZvkxJWzEO10ONbWla/vSH9mcg7GcdEKUEMvdoS2KKOeKWohPEZQ18
	 BG1a2h9qDajBTarMOHEr6SMnhHUdoP6vO75doTfDQoaldCKvIaK4oPrBWwbiEAypr5LQM
	 jqt2oYZyPOoDEFNludcMNM3gdJ9WSfCXXg8qavTMbsy7SK6tqnMD8Yt/CUDnXXkF1Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NpvUnsLAKwd/VAqUA+EeIsjP7hKPCef0EJB8HBsJ+lw=;
	b=j2+tNJIuYcRkMUlijE5q2R7Xzb10HSqeE0cA2vpFzxZ6KjdohTpdNW84yIwRS92D1EcZ
	 LmBuj/JiWQC8uaA+K/ZMWwifBHxijCI9t+l5BKOudtBm8SuHw90n3mqXJQd7R3rVPN22/
	 Y6Y72j9E6YSjU91adHaQguEqkVnCu2qcyJ0d9dzk08AEDuGmshQWCdXaAZOLqK7UrDKg3
	 f1bVxs+CMZ5Qtx4/tVmj2HgLIIWZWRU0Zorfe8deX5iTVIlr/qxyWhPj6my6BbOGM1k1p
	 men7XY9KHK/pFLdQ5Aa+epaZoQjQYMuQk2RBxs9l4gaBSdsd2kUQ5FVieelLa2CfIwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jp2rz4zD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Clb+co5X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA24606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA24606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jp2rz4zD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Clb+co5X
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F7tA1200799
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NpvUnsLAKwd
	/VAqUA+EeIsjP7hKPCef0EJB8HBsJ+lw=; b=jp2rz4zD7ONXgwQ4HAdOHz0I/UU
	XP7XVbP1vv1aZ/jk9kPG2LRl2DOtEHvLzxCS1U0Q6CAxyZ2dXt5vZ2eIzP9u4Igp
	fd3rPPbUmmeGJSUBSGomYy60LMt4x92hwgklMnojYjrHHpVkqZ8JHEyls3SZ0DMH
	FO5p160zcqI057JZbOpt3DtJ/u5e+uDl4acJjieg/4h4XNfeGQb2wSMxCXkDhnUH
	b2Ru27Hy3Zmx+kWZbWRTti5Of8UZzxtNykBW2HgBgzlBjFyi5xNGZGti3YLE692W
	WMkwrqe/PMN7d1WKcen3a85hUI7CPlYxoot3Iu1I3q2I7DLIes4EV3Ho7sA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms2ucs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd61bdc8683so397858a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746224; x=1793351024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpvUnsLAKwd/VAqUA+EeIsjP7hKPCef0EJB8HBsJ+lw=;
        b=Clb+co5XQeyLSh+7K3BbZ7x7MDX8+PtdjrZWVbDyFnY4wOvhHY+UOmtexx3js7KO4W
         Qhe+LlDTj/Ocq3g9DexsZisqtxhM+pAm/VTO28cGJpVec9t4+ctzQ0j6h39KhBj1I/Fy
         lhOtaUdYDujJ3X/j0woenqMc0fN9Sw+W6cI7uOqgYHeqbSeU+koGgqPkiK+UzkrE8916
         2cUUid4tMMZaqPQkptcoXSrwg1AzsWn+qoIYK7rU4sMo03AQq3XkmAfa2ynUl0xVGOn1
         mVKsoezOLta4PizO8FAqvbkljG3sbp3b3yVmkvcLOmB4i9AN3HR2uyUg2UHoMY7cflnE
         qJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746224; x=1793351024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NpvUnsLAKwd/VAqUA+EeIsjP7hKPCef0EJB8HBsJ+lw=;
        b=RQdSNAh623luwGa61uX+n6OFBvKGbLH2Fi239EpwcqDsAtnFDaV+pqm00TmZ4D9+vM
         9CNjFGo0Wv/SgLhLLzBcygUzhk+Ktx/3hbZsGWNfcy7vi1iIMcMPuPUNNpKaW75czUVg
         TY7CAmqCzB/eriAeixej+iGpVpVx0/9xYZ6dssfGRzSZ5/B6uF3JcEQGZoEr6wR+qFkJ
         bWsAg1lumguR/QARG95ZLqljrfamdPA7s0r+WGydONXJv1J09x83dmNTvvEu6jm4+aBd
         MqbMtbvzXC79bSNrK95T9zKIbKMm3QOTIKX2XNFtj388HyHY/raz5GUG8vQtPPX80WI5
         C80g==
X-Forwarded-Encrypted: i=1; AKwUvBxuh8njWpp+qD4jz57qIZFryqIlWjOGl8FnSpEllNkg725+p4BLQ94w2I/6N7YEpp6FTPzTZXvxC8ashhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5cYcyzQQe89bsX3i0c0Usfu31bAiF9r5i4KdwI284iuOvRk5h
	qzt01ieepdtaOqFjwyC2pFR8rQKUAyGybyATr89ggyZoA0Ahk3Ohg+k8WRLeq2isJlMfaQ60cUe
	LuqcL1xkKdFY1zt8+QJgRyayoSlN8ehvXqZlDFZ4rw2Cz077+Fo9kcqqP8zCwlRxeRos=
X-Gm-Gg: AYBFou1NuUAMRQUT+7JGavq2u+UL2ZSsqGdkTSvTfVm04Fh9G6dPFag5Be7Yb2bUHpM
	dfPnGVLKWH1DnyYPTm4inbSimV2s9v1vehYo8q6TM4+vf+ESqkTWK0RAqUENIklZxyDxbjrEvwe
	arXbHPkpZkArfAP+LHJOF/Y/gtzQsx5X49K/PlepUTHPSPGV6xyIjcK0cl6EuiYgwqaWG0OTKaY
	tusnIsSgqD7irINUOBn0nBxi3XxSmQQx97BHUNHMGyfeQhptWAaxGe3xjAM6zFRec8IO9+4yJD4
	236I2zPdztRu5icIN5G0vgxp0SpUnfxFo8cxqZLIezi3DcS8szaitq1gY7m+I2zLxc2+mYGeNB3
	MmvSC3CD60oyFRkS9A8Tx6LUl5TF3WXoPOg==
X-Received: by 2002:a05:6a21:4989:b0:3e0:dc12:8908 with SMTP id adf61e73a8af0-3e376748cd0mr1004539637.81.1792746224484;
        Fri, 23 Oct 2026 02:03:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:4989:b0:3e0:dc12:8908 with SMTP id adf61e73a8af0-3e376748cd0mr1004523637.81.1792746223965;
        Fri, 23 Oct 2026 02:03:43 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:43 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: qcom: sdm630: Remove FastRPC compute CB9 entry
Date: Fri, 23 Oct 2026 14:33:07 +0530
Message-Id: <20261023090308.2898683-6-abhinav.parihar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX93L1plpaMjCR
 KCzAX7VkNWVM1xPOiFkZcEy1oDYTH41/ZSPZcMF6RqEmgXiXIz3EQVwfNW7QXhrVTryKijLvfZb
 5BcHPy4VYymbu+THFPve2hcVXtIB11mpYzUjelH0D5iKjwVYCkyv8fHUMoxq7NecLz4BE51KEde
 tVqhYiBHTOS6vtNU3agV7nUqnDgq+jttxeA1JPDwNIH5GqjeFrzzRmvVWbJULRrDb7wxlWcb/i/
 USsMSIBSsQ+4Gn2n4foxtI7FvMRNl2FHaM4OQxY9DFJHuD9KY+RDxo58YzxZLicBn1A3p9aYNyU
 qq9mtf3214YBzkvf+ktvmb43CcnzPDgaJ7ebWpp9M1N5C0a6eFkwbJQefxKPVYCcO5slnqK+Rl9
 KdPC1YuQLFXxQJheFRSppJ5f5nRAVKp9G3cW5bTzTBSJbAChGFsNt1qX0VQxkOHcGYRXzJ27Vys
 RBAfUiW4mEVs9NrLsog==
X-Proofpoint-GUID: DsegrDiuRE1we2_sFcEUDdXJ5PIJeRaX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXz9Kv4SrEvvdk
 K0benpH7MJpqbXmr8+jN+BLlgP17abIj78UN/4Oe7Cw1tBqypmcdefRtH5r27DrAUFItdFwqzBY
 FQNgIZ5u4Ucb97k3fG+pMKY0e7xqnv4=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb22f1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=E36itTYgs6eEPh_MiKgA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: DsegrDiuRE1we2_sFcEUDdXJ5PIJeRaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230035

Remove the compute-cb@9 nodes from sdm630 device tree to
prevent clients from selecting a secure context bank for normal FastRPC
workloads.

Secure use case support is not currently implemented upstream.

Fixes: e8e1fb5c703f ("arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly")
Cc: stable@vger.kernel.org
Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index a41ba0da380b..721885455639 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2483,11 +2483,6 @@ compute-cb@8 {
 						iommus = <&lpass_smmu 8>;
 					};
 
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&lpass_smmu 9>;
-					};
 				};
 			};
 		};
-- 
2.34.1

