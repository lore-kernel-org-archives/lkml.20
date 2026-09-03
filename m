Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946B03F9F50
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419965; cv=none; b=aQPuikfyb4WGiaFWkBIw5xfDiTxCKb7/LwEWIIWE527nfpnb5TCshUgZcba5WyJCHFDbHSmjE8fJMsAYTgyBvOG432B3L5sJp//FUGs2pxpYYmJHixtP7VJqOkgTSI3LnSjpKJbsSG/mxi2UwLaP2v70+g/5Ogvg8hxvEnC24wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419965; c=relaxed/simple;
	bh=To8PeeloAvmZ934Ch7WVJWVCgM1tIFQfjgNqR3WlU2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7hRsdebZXeUBhM9I0jkB4ZyHHNHC5n8tB1w8ns30I1kflNZCm4zNJcmksN0GkL8odNtngqmnXNEWLPTJXHEQauKsnlDWybuZC9dgyssNlsmujjeHaeH9hKGJINuYnJ6TF3cHx5RJkc3SGVBgi2yMdWxB+UrO1VC42DzMsQdm6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tl2i8pWa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUGGWpTv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tl2i8pWa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUGGWpTv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835leT23245040
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZb96pkWUOLUETezKyay5lwdTNVTnCS9HTuh47NFSSM=; b=Tl2i8pWaFtTAi7s2
	Mgs4ln4y94NJJM/s5W0KVjvVcKBHEBQupApRJFUX1MsxngPUEulo1+iIJlYG6A8z
	eHaDKT4/Q0iSggC8p1Lf58kubnvE1aWZ+Ln04Sdbhg5JtuYpx2rBs9rj3qmZ0Eka
	hzY6xQAX30BFA60XymfyrpnoEgszFETwDocfx1NUL+xPbZLBIA7uMleR/hUsIX0F
	bfSEO73mtV3d3CrIM5C7dAqUhYYM6mHJcot2TtDLt76rwzMIr0mnDRELxEbDZmUU
	63Wlwkczs9VR2gdRoLZo6+WBCgT6eHUD7UaIfy6EiaRQ/4FJIuqRhbeSjR0dQKM2
	E3J45g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemcec8nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:19:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so4653172a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788419962; x=1789024762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZb96pkWUOLUETezKyay5lwdTNVTnCS9HTuh47NFSSM=;
        b=gUGGWpTvtA3rGA6VzYighHDn8EFU/wRp+QkQvuhZ4x0Z/1CmpBzbtBDNbyHo2thV2h
         iKQfEcytBNHrptOjcxx5WK/ESg9Lge0JQfBoS7ceCLyHoA8hiR4LERyRk47truoEp26b
         Bjt4aNxG+GYeB6uS9hcb8XCEKOHCJlBymTzZmF/fWlyLeEfVfMDKwat4Z/cx1OTX4pxS
         0Cs+JiBcIb8tDoAz6uIycCUBxVojQQOUwsW8vMbpewJSdERn13hMkX2gqeQTjvs2kDHD
         SvQp+0RL7At8bWIxYiU2RMjhjguW1SdjohHobxsSGxpeAixywrFQJX1NrOmGvz0nd422
         4A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419962; x=1789024762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZb96pkWUOLUETezKyay5lwdTNVTnCS9HTuh47NFSSM=;
        b=BULgwXBy5i4Ew2NemfpSZEcFsFA/kSTFWlFX8Z40EIqNJDzNramz6LfQf3uax7oEsD
         2AYrX7inEnzWm9FqwbiwezhP+6v5HFzJXRPVnDb0uHjSmvSV/+jnBGpY0ubdBR/pXzwP
         hjVivxYlmXitVpyar8zfYQzXNjF8wz7xnViluOd9JAL6/3/O+PBkuRut8exLmYoWCYuV
         Q3ZSiv4bX33oglZsowRfdkwmGR8Wg4L//4Pg0GwQfbjKqg8IJM9Dzm6nspnA9jJ1TaCf
         eev1QhBIB/iB7ezUwYfqy6TETvVZpLrrovAXgt1KLeEnNey5hdKA2crcyhyGnhmLP+08
         6xog==
X-Forwarded-Encrypted: i=1; AKwUvBzjg5hcTtcOjfwBdi5ql6vWdhwBMVUBbhMySWgtSuV8ZSTLW2Y5XRkZC7qSteltzAgU+P+bll9sraxjAV8=@vger.kernel.org
X-Gm-Message-State: AFuF++nkm+2W7nrxkG0RBgWicD/E1Y1a6lENofSyuopHcnZQ27gd4Iv+
	bO/7o/TUZlp3SLL7b0zNiDjb1qNmZtX9DyBJw2csg8lHq8Fc8W9zUHMrcH+qB1n6WDmdTsoWQGw
	WzeAca5HfOLeigxaRWGNKO1iyBaGyymeD5obyTQF9kCFFdYzrpVbe8q2b9MM+y5V+s7I=
X-Gm-Gg: AYBFou3K1+qLsqFmpcwOcePmH1QhvhN9Gq5ZzQjUqVZ9YCqhCRrZv5Jj7wrp8Kj+/v6
	2ODmzr0y3rBr1EZpe6QPJcGzDtXTvTKTs3JGA11xvbLtO0042p0DHdydSi7fcNXldJqxxwzgpTu
	nY8qFSNnfxpOEekovt9JCGwc0lmGU3zqPKbjvyUtKZ5UxbQ+Wr6qM9vW6X3DEE/2r5cZ7HURYWp
	7dBY08wieqQsW2i0bSAU6KvYVqD5qoy27mhmw49HiB812Y5Ty7eWIoPx9j4H/kVRLdG7VOYEwuk
	/JqIaMdRK5GnwSnPr/u9borkCLuvdEEeH8eHRyd3P1CHi3Oy8lUZNXGKwPXam+1jTSUL92Bl5PK
	mqJQ7Kzo8BSYbEIFg0lHoHrGfNYAm+nq8
X-Received: by 2002:a17:90b:2688:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39aee162e08mr17802127a91.16.1788419961969;
        Thu, 03 Sep 2026 00:19:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2688:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39aee162e08mr17802062a91.16.1788419961576;
        Thu, 03 Sep 2026 00:19:21 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14319983842sm3992468c88.15.2026.09.03.00.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:19:21 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:48:54 +0530
Subject: [PATCH v5 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
In-Reply-To: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419950; l=776;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=To8PeeloAvmZ934Ch7WVJWVCgM1tIFQfjgNqR3WlU2g=;
 b=3NNTKCMn3hLsF/wntuQnfGkeGsCzYsg6+y2/YeysHkYPZ/tPFpMHFVG/JCyxj89KA6rbZed6j
 Ud5A5RfXSN/Ad6tDiiialvkrcvyaNyfPZnahI5tAq7LWi+FUusR0Jhi
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX9NTL18kCbukO
 aKHmX/SkoHdXhOdoQ0ABcqsdqTZVh/81+JQ6iLBeWWP1I8rZTvKGScl3qUb54Gl4+tpUpTx+Svz
 tQC/iR0pXp9U/OgavRQN0rAVxL4nsNRVAOBlOdkk557f7tu8i0QbEMSk1e1IoeDMU2pE/8wXMhA
 1SEfpECnJdmpRRouxiDQ0pHS7LZFtWuby1QmepBaXiEaZnInF6Kj18DPGU8er6iYR3Y52SfkLTT
 QP8MNhCkYGqr2/yQ0BFYL+0d82Y8JDAtUpClaNuNS2RRU3lIW8SQkdkMxLe/jIMFg0MxWyJp2TL
 HINdUctjUWP/YnHjSgEQ4VDbA2UWcRJx7jjIt5iFGJtHKvmrUc7gNcml+D3cme2nI0wtgqxIGvA
 LocHbflzPmC1d/mjbthRsp8rGAdVlYEiePJ7vdzf0pXboL9wzR3gs3lbiEU1BwHP289htHNrcAG
 j63W3kMpDF4E9fC4Vnw==
X-Proofpoint-ORIG-GUID: Z8mx3yPL2M_yh7o5rtKQe5zHUR5-iazg
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a991f7a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YSeSwzeZyu-nVJi06OQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Z8mx3yPL2M_yh7o5rtKQe5zHUR5-iazg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX3pc8RTwM0vfX
 W/wOWowPul3eBZpLv5BdtlN8vMK1BjdHEVte/eUocS96AW9ZkXKLEBvldotCEgX5KylEIrdXfRu
 I+9OtN2mvzlHrWj6eZpRg8rUhRlkaTs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030063

Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
required SPI and TPM nodes.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f7642..c073e45781a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -9,6 +9,16 @@ &qupv3_0 {
 	status = "okay";
 };
 
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.34.1

