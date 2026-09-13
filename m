Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90F03F7AB4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325477; cv=none; b=tfAmTJMfXD3frSWjg1kX3RgAii8G391I3QNONA4Ukw6wQLoMZ6KF3n+JehBmQ3oqWYFY/5XAb5rtDvKtdHCmi912JiIIWYeOzxC4CZ7vA+2tF74yxq0NveOt2d3Ec2LX1MGQg+3azurNJXLfffZ0c65QzZLhZ9llJ7qBcTTzekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325477; c=relaxed/simple;
	bh=3kFVW5Nz6U6ecZ7e3CWStkI5fGjySwII8rzzk5lKC5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oQlPwdYjxAezB85jV8qduoCijvIsrwHo7i1FsCUHjkyLOzR6obDSPjbXHBiPtKYJuayqSG+ydY++BKZVrgr1ZhH5RgNKo2Vsx2RkFfeO60VPodfmhDJHTWX7j93zG3ea2tXKHy/vP/eYAmWPN5d728muxTgnNrFvqSSw8X1LVV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hqm7yuvJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCjJ/0G6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hqm7yuvJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCjJ/0G6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2aAQ2395618
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZYBA7KJEqE8Qvpi2+pbZkng941B30M0z1x+yOLpprU=; b=Hqm7yuvJBqKI1+lz
	rkcqTsimc3phZTJYSvBUx9/Suk91lIs/QXAhGroMhN2GuDB6vuQ2jsMYIUBuLvEC
	Xy0CZ7z4ino880kpD9QpKu9aKiq6nOT9UHNm9DUMf3Hi6yXgHdoQrfk9ny9ZY9Fb
	Qy0PbCYPW0HLqbkSx1b0f2ooOUxONwkgdwZC5GCg4eqFUd22jKy5brr+hy7i/UOG
	PxZlADJCA7FpEoFlzdE9TywGhIVxHghXZ04CNzdvGSkj/3g6RhtMfeDjqQbmgYkv
	sIIA9qrTti7W1BmuVl7N52Cr6D6iANMOr0pk39CXi8gMLWio6fj9ZogTOUZ73BBt
	xtKQxQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c3x8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:51:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso1799492a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325473; x=1789930273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZYBA7KJEqE8Qvpi2+pbZkng941B30M0z1x+yOLpprU=;
        b=UCjJ/0G6HCsN3SuxltrSgfgk2HLZ92s8KgUkdQj9atqPQN4LlBcJmK0Xy/jN+uqjyu
         KbXZJMnPGWmdLpI0xz4l9ruS8dgHN4l6QfAQQBHcCE1BE/A9nDQc+JyiYZnijCOesP8n
         /+rL91xEVBGh53czh6YHcoQCfjVe/9Akiz7V+ir8GPNbBmhNtUaNg/33TSbffP7gbUTu
         zRZQf9eZN5Ljszx3Pe9BaTWXWgAmO7Ftr6ZT3gCFuqATw6jXi5LTUS43NU2v9kpWCXRf
         3721IR7ZcvQJxQfmLaKnpCyxvKZ5Fj901U12bvSU0X6KtqTdhCgVSDr3D6vDJcviKpV/
         U7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325473; x=1789930273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZYBA7KJEqE8Qvpi2+pbZkng941B30M0z1x+yOLpprU=;
        b=pd5bAbRElZCEznftNE6giemkJjfH8Zyvgi6azZRyKMuN/SJIUZMFErZF0uok8p5gy/
         1uAUsPAuN04i2Mf1CFTcY4afX9d/ToieTaPnKJ3xEU2muXM522li/URJpZdJjgmQUzhd
         OTULibnq0jV8b4FO4zMZohAD8OjhMmp11iiTqRtsgimRAFv26Y0ya4p2xv1hlx7hnPqt
         l7td98+c23IJCCbY1oK6QyaK74lXORFa2enw9MCTVw5OES+pMzDKHj64Mcl2TeizOSXK
         /skxkPl0wQzeNNvp9hunKV3x+vArWXXngOAYgGHpKdr5vQaj0wlgyIncAn3kKIgTKq3I
         k7xA==
X-Forwarded-Encrypted: i=1; AKwUvBxMLTN31Fl8NUO+os1mpQwEy7Ej6/xdNAADv5UeXb6mn/ntIqV6ecgOXE0jpC9eTuNEXdfwCWECr0aVQ5k=@vger.kernel.org
X-Gm-Message-State: AFuF++nerPxLntEh34SHh5ZfL691lbvIqS3iLSuOS2zdZ40pCV6NHv1c
	Tk4V987glhxdyF9WFnfpYDXYRpKath0r31uAhAdnqiUYgqLr/nE91Cz9LsMR1wfMWz8n4AYOuEG
	JHJHtyQCEocBSmw96wZlpfDcaO05BaxXrb764aDtvuWjlWIPbVQ/6+kR3860/d5FeY7o=
X-Gm-Gg: AYBFou3PisABpqY9OIvshoClJh25qFCFBNui2fGDzLxIJnHo/cm5hy9PP+Gjut/sLet
	hg6WYVHnO1roW5KKvqNy8BZn2RoALi1ijFx30vtkPLPt7+U3rvQDzEBRW21+eBtm6zW4Q11Sos2
	DdVuXM+q/Xb/oqSnFPTTaa8dH/7bvCBpNxdZIjp9N6gb2yozTf34zKTUT0Uno9tjg6McH9mLKt4
	dJrTiLnYp5mmfkXaxibjJqMtOqZKAmriv4p8lwGs+oHcKL5zmWTID+ntJ14dTirma9O2y1uGYqE
	13Ns8hPMqKLXTfBYW8XQcwRJVmBz9dGoQCR2sUAlcBtOwJYNYNgoXej36zbcqb7S6SE3spffF4F
	++9/m+zfHPwHH8gut+RjQ17dfAQGjIc60RYs=
X-Received: by 2002:a05:6a20:7f96:b0:3cc:9288:99aa with SMTP id adf61e73a8af0-3daed1e2566mr25624895637.0.1789325473218;
        Sun, 13 Sep 2026 11:51:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f96:b0:3cc:9288:99aa with SMTP id adf61e73a8af0-3daed1e2566mr25624843637.0.1789325472770;
        Sun, 13 Sep 2026 11:51:12 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:51:12 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:28 +0530
Subject: [PATCH v4 11/13] arm64: dts: qcom: monaco: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-11-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3217;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=3kFVW5Nz6U6ecZ7e3CWStkI5fGjySwII8rzzk5lKC5I=;
 b=uRbsrG54rSlIvw5dxswkSgYDuPsgJ7WI7yRlR7+lQVnsjs2QW7OI8r4fYwTgXzrYpF4nCcI7L
 MEnv4CCIL8GA8mIcMYksG2nlnTQoYmle+Dimp/KHEEiy5x0Fa/Hlvj6
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: z5OlohW_eB3M6-YuYUQmRMuYi2NLTRAd
X-Proofpoint-GUID: z5OlohW_eB3M6-YuYUQmRMuYi2NLTRAd
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa6f0a2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX3JXmBDXpJpIk
 enkveZpbwlZrMuykHVpMPqSIA/W0sZt02Yb4CeCpVhS5fZWVLCPJfTtoEctCrmsQKWaGBKnTUsn
 laZcAPxGFCdHL2hzqhKy3tVY1jDi9JQZ5cgGJr3E79PDV/1NncrchBGo7Aj83Hw5nKMMN+Op42p
 AlLO9Q+fuH/zraggrl7WCRfeOZBxNbamtzZ9F0STpXx+0eSBXVK8gessXzLm8tO0YeEsR0VQOqY
 fGi5kAa2cGpt2axQ0ZPLqG2Uuy/biVeu5MyqdTpuOuW2ZjiCF+QWmO+BHQXwDEuBmF3qxwNsoRM
 TE6HbQWl5F2ZBFEeqvm7wX2VVLcAW7WfMENXVZb4Y0y+Lb7UDMkwsItuPw5wr6Klup+IgCMNSqT
 LZ0sdLhtibWxMfi62nrNT5uFc6j3PXfVYgDm/6lPZcQltpa781ulfyytem1VKxP/Er0ckS5IBs7
 6anaSytUmn6UVi35cRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX66hRWwFCYcYd
 /NVyvKfuh7xDqwwvVjCkLeWr4IFKcDV+lT8qvArNulN7Bvb7WiZ7Gztb2cHoB5G5s3O39dzBKjx
 M9TCXVm0sqfVQQlHS6MKPQ4vf/MRavA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130267

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 395d32d368443e6c73b934b183c3de007ca2e6b5..89ea87a274a159da872facb688cd742d8d28f3c5 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5403,12 +5403,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

