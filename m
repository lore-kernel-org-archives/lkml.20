Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE12547B43F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984326; cv=none; b=gIt3q73hScN1Q3Mbd0NCLXz+uYrAEoPznfIzwkxXRWq0xoyGpnWzZraNAErF7sHkZBTvv05l92t11nTWcQgP5Tu+P87EtQn8U8+QtJW1KDaipOmMEQKP992nV6go1o3/C8lpQp5NUXQ+XNMzyVmvqdmPYBSuJcLct0ZD794ysFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984326; c=relaxed/simple;
	bh=OtzEBm9GVTRTWQb4gQMb5Xq+vFscZcbSu2JVYbh2zdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U1kACI4s++oDsj5DoGHfsPcam+0LYngXBhX5HTpjpSG9RThZ3nmNbfwBRBUSZ5wu/EvV5Hu2vi3RRcmgbA/vbuco/jNJjiDAJQnoDulnngemfn6kkOCUvIw1SYY7GCTQCXeT9NpyaDiELjcdV9+PyM2uGVkdoE8T+L+uXhE7yR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9Nqz17H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXYWFazt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9Nqz17H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXYWFazt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79xC9607134
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=; b=I9Nqz17He3A1si7M
	R2AFVXrUMzOW7sPlb41c+hXdECCto8zFCUcH4Ps8bnLNMwTsEiC1FeEzvy5iHXsz
	nPohefKOEuZNB36FM/VHz+OW3ezvDJNEXmCnv+nUojHQHXntVMR3q2F88dhfiZ8u
	iTV1rHPFXuze790kugSMlQCKLhkd7RPbc3B+/l4jl+vj5rgP3pQPOEd5kxW+tetU
	12GV1+i6sivRrIsy8D+XCU6dI1y+07tK6hoTXPga5IbMWjMuTnJnL/nR0g62OXjf
	+eZYDE7PKxbLPXtiiDbgpnav7PiORw+ZGe62Zf2CZlxhxe1YQ1XcWZBAXnyVapp/
	oL5Qzg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtu1ehpmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:52:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb687f82eso40300365ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984323; x=1790589123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=IXYWFaztSpNtUAbgWzm7c7HAjLH16Mp4lG4hAtBvelQX4B3pIk6d7lJ/+68ssATSLl
         SymHG6oWQK08dY8D2OQxzlJ8/vV2f92mg83RxVCUQzUWWPRJxDt/4gZT62L1ZSvwIiOW
         sWhY6EobUGWyh1BHkGc/+cOVlkbkic2P0EzRTuDqtqIWD4mgT5Vz5vYPXY80X5D3PFYb
         0yONZv4Kmie1QsUR3jMyogjuWRWIfFkkFeq5vbzrgmnTccTDUVcjsO+1v8vPvo5e5VAa
         MmUq5fR+6+ojol9jxb6NzR5FiQWKrIIhEcub6LNKubY3AZboWVzZxSNb+VsV6ID8LPmW
         PA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984323; x=1790589123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=tTMhaX1bER4bl1AW/nCDqBiu3k4shOru1zmI3to9XX+yn0bFDtaGVD0focaqfqjcNo
         48u/t6Dgk3KcA8whdprdUsQXjvFDiVy1MyPVSCepAJZJmV2pJ+nPyq9LYsQfkSNtsyht
         +wGgMavAD89KKcWimOF7clFY0BZI01O2EPpYnxdS7RenHntwPkSUUBknRxkO4LNTYOO8
         nDtXzaxDsIFT8Yo26MiBQoUVuCsUw1+ShOHHqOsSe0VGRs/F0v7XROhDoyUVc4HAifAs
         FVjesDFjJHBTKjH5T9T0U7MTRAIDywqRVm3nRtroBdAYTHJeskEbqwC4Vd8yEfxwJfV6
         3V4w==
X-Forwarded-Encrypted: i=1; AKwUvBythj/WlhpKqwCtRRh7nroov9W+RApj8OELh43/tFj2ec2sQBoKyGhr/syz/XAXodP38qbhvHxQn1PCfR8=@vger.kernel.org
X-Gm-Message-State: AFuF++m1RRJdUtKWWB7vOwcN2thMnJaLQ8gGC4/xKIKqVqseYf9ViGaA
	ioSUOsngaqRjdpxqEd3p2rXhk8FDlKc8uCLVBj3u4vPM57Nb2ykzG/e/pg4BO6/eCO2u/5Mt1gt
	Ro3UkEqvfZWWMWFSozhb03tOPa5By4TL2cOQ1HYh4jBYFjw2OWzrNeChA4deHwNdmIq0=
X-Gm-Gg: AYBFou3iF4VTMkk9gGfZAu1H22U7/R8r24lKA1AbCeak3oaKNUoc59g0xpFTYe1yXwx
	JY5DGN0sQI1WWadZqa06saU9sdl0qdavVESADmGXJMW+xLaW23EVMEL1ppWsCQ3AvdOzn8wQ9bL
	9d7LhiiqsjPvQ/CMH4GvZZRD2EqhWlTZdTR3jWkRFqy3mS/+FeTmRYD6CRGTjO8Dfdv/2Y76OAY
	FsdW5xiCprKj7MFFQC14DiBNrXj74tBYvQeqM4zB8Q15hj2tcdYZf5/MWkGOJ/iaUTZBEYpwtuL
	O/6Howsw0ZtVDcPnBKqLD5yprBCNI69nztWjK1gl4VRmgWtgtbO3SXXG7ffp2uTDOzR9++QQf94
	Azm5uKuDb8JPNKJ+QeBtQOQmE49qKzx2oI7qBx+7TsckReVuw7GRW2zKEJN/wiBjcMf0Ad6d5vQ
	==
X-Received: by 2002:a17:903:1a87:b0:2df:3872:f261 with SMTP id d9443c01a7336-2df387310e1mr64397345ad.33.1789984323285;
        Mon, 21 Sep 2026 02:52:03 -0700 (PDT)
X-Received: by 2002:a17:903:1a87:b0:2df:3872:f261 with SMTP id d9443c01a7336-2df387310e1mr64397095ad.33.1789984322871;
        Mon, 21 Sep 2026 02:52:02 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178889dsm30523095ad.18.2026.09.21.02.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:52:02 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:51:37 +0800
Subject: [PATCH v2 4/5] arm64: dts: qcom: eliza-mtp: Enable iris video
 codec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-add_iris_for_eliza-v2-4-5fe7be8c0230@oss.qualcomm.com>
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984298; l=835;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=OtzEBm9GVTRTWQb4gQMb5Xq+vFscZcbSu2JVYbh2zdI=;
 b=D/chGY5cdhoety7wpkQ1pRnWNNkGStMxEI/JmpkHhFbd7M9G8+zHGqc39NJ7mPtN3OnkTYc7J
 gpZLLTsbopbBE6NHV8X2WxZqV8kLPzuXaf6/P0pMATT1qs8ODW+SOSr
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfXxs8KC9PsCN2G
 SlNAVkJ0pNgHZiZtpBQrXoA4XaxiCAVszDpj1kEdIK+8MAK7q7rt69Wrf0+FNbjOn6XHaD+dhVk
 6b9Zu2VLl0ogOzl7lJrw4liVrT1zgZk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX7HUbbRkaLXgJ
 22/fFntgYpwBVVSQs7mXQhFfAkYmIjsRQxK8G+rzmAATsLbgbOqmhq5pRTv05assCcCHwW5IwHx
 6SZa6jkT186ROG4XqK/NhLv/MK3KcON/rtOSdEqOljPmzrQLzJ7SgBFOkgvhjUFffwjhLZWf/py
 m64lIr0x+//0hCp1Q6g+cM2M96Z128Rp3sR8Je1YXb3pagDe4zamrjkDNci7BiM+jx5PCBszdbL
 eD2V748vkiiVikshUCmKhrSooQukKh8YNpJK9zdFEegqnluuUwlxXtUfwQKK3kdevKBE0UDE08P
 8u8FF0sh31iNtUKVKmczZ7iI7AHPTApflHf08CKFlhyU38B3WLbkiTbJgE351aCdHCXIObbFRxt
 AmOHx9p24B7R3QcsJ/5Wvf3CDtx4xj+sq1JRdDEXnkQBc5d8ZBGWNL7D1jsVBCYEmyWYRgXJ8yZ
 +svpb9PMXwWnZXSwLCQ==
X-Proofpoint-ORIG-GUID: MOboaWlzilWBssku7xHC1NzXqRgJg-7y
X-Proofpoint-GUID: MOboaWlzilWBssku7xHC1NzXqRgJg-7y
X-Authority-Analysis: v=2.4 cv=A6r5rKWG c=1 sm=1 tr=0 ts=6ab0fe44 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nChROllu96siAGe8wIkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210141

The Eliza MTP includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index ee05192adcfb9f79cba59f11001b640a8572cc91..e5a698602dfc7a2d3ad00eade40d4f91a0cee57d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -430,6 +430,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/eliza/gen71700_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.43.0

