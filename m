Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AFF4AE12D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266344; cv=none; b=L9H6Uh4QfST7JtbgFcxHc4Gc0Q9G6n4NC54uYLfhi7wtVuA+0LhgQSdhuL8ABwlnnRgFPputXnu2ciX4i1ur7JG/Nb6svOljVLtHWZdE4s9+yXRCuRv2/uwTSZ9jZy3LotYpdWyguCdsWoke2QKL0utpRrML6BJ8nigXamj0yFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266344; c=relaxed/simple;
	bh=4fWCkbCSJEJP19PcRqOGcL2gV4GFzJedW5FbddvEScw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VeV7iTDRAbgCTw4yE0oEAaV87FlgF87o5NZ5y8rd1qDfLG3eRNH1/+XGjZ+WNui2FFTvV6LL2b9R7QK1Vgi6+gwCHbs8+2rrko+FF9/tOyEAj9V2YcGCQ1FcIDL/TH2e7m4Ww1jCMuAA3BHbl6864eiQ+XX814y2B57uQRzx0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pr6NpkbG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWBISX5h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pr6NpkbG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWBISX5h"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFefCT1907483
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=503Bl05xGtP
	s4LB7TSz8OXyx3B9WSiW4MVuj4zuxVHo=; b=pr6NpkbGmBVFoNlV+8+97iKKvmj
	pAs/95qoTpA3jYGrk83to5hR0iz27BQLmZbUG0VZ3SSQ7bFSFB+kSGzeA2QpvqHT
	4yCNd86LY25rARQQB3i5pVU6I8yokcU3qVhxsdXniufoYxTeb6CYfuZ5ic9yOeP+
	Eor+uBE4p+zZFLXRroisVCVcjY8hrv27lxjJFuChMIsXscrx3zjNQDldcpjFsEog
	82i1P5Sj0GhNQgM0rCuDc4lqUouw2LSshxOBPdK3LiS6PtgXT9GPoHHf+MRPObcp
	ZwT/q2+X6GdrT8xBF6R09/EoNK7I7smWl+L1OCD0FGP1+8bsnATsk8/wkWQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7sgnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:12:21 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67156f9bad0so118276d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266340; x=1790871140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=503Bl05xGtPs4LB7TSz8OXyx3B9WSiW4MVuj4zuxVHo=;
        b=TWBISX5hQpiojJW8zj2RbMICQ+ENZcr2JQobGO5J7HISeSOZZmHNo+54Eca24E7cp5
         I9KU18u2WEG+UzIcLyse+BJX2s188hpWp2hEpMIzyJBlLRxsV2MdrOhmUUvpLD0aajiJ
         zftlrAjR/HxiRI/pvx/uWcPO3Z636t3VS8EGeoPzAxyh7hVBx0pOXvCAwHnnsU5EeFFy
         Ya+OvO+spZ0iOIPFDmrikiLsZVh0ZUnHrCeKp5pcpDfbZMMpY3qqkJW+U6uZ9vb0aoXt
         ntmOjtey9GMQ20y5Vc9PzlZiB/pyRnn66xFkjix9lSh73xBjmgWzsTnXVER92q49diim
         Rj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266340; x=1790871140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=503Bl05xGtPs4LB7TSz8OXyx3B9WSiW4MVuj4zuxVHo=;
        b=Jw7N8IKQ2/6qNTqisYtqzX6+22j2Tsua5rMuGHc0Fg/EuEsDYglBW3wx+sW6LyTV1S
         O69V+cS9CGFdWDFQb5dmEmeIrnMpEZjvYengChr/JDP2KpE42J7Yb4YD2193nPY45IZ5
         lSYYIuycKW9d4r3n0ZTnucAlA7yxCGd0URip8ZwkKlUI0V3vNR6q95X5UZ7xZnES01oI
         1aoqMKn3d4kpIwtgvPx9bFURtQm8y6NQ3AHdcYfBMopziG9Nv1ZIySknLMjmYHwo46w4
         hzBtW8IvfQdc77cw8RLJ4A//yKzJ/Uh3/UynWkgvYVzI3MjhLc8O/XjYABoocBA9SPOt
         Eyzw==
X-Forwarded-Encrypted: i=1; AKwUvBy7tY2nKOmqxZxo5Ucn3bIf6WCCr072/6tFjTLxL3349oTfCZqDBwwHNnzYv3GClQHKw49VAU4Ff8fkDho=@vger.kernel.org
X-Gm-Message-State: AFuF++nQug+XVyV9faofYY3xmjtO0rUL9ioY3TnfXbM2Q4JoQdUryjya
	oJEHmsEOP9bEAOV8ddnK6Pu5aLKYgJPRnGu7gKUHE+8/d9Lf5SmRY6ulT3d77MM/8mIfwmXIIg6
	uzIszfzQDrCx2B06mRlJ+ypzUNM/dpnFe7R3wJYCzA4aEJJFEF8vZGPJD7l5Rr6Qh4Mo=
X-Gm-Gg: AYBFou1snrAjiCcizGv1kbxA/P6i62ULqq7uC/mRDECaEyJ/923EJTZCjCGxD117oi4
	FjJmkGKNkXcLRRJPjRoO1TxbZKDj/zhevMW7OYQnZpIgHbZedyffRJXXxDC/wgpLNAJ3n7pZiH0
	FSkZc1pwdydJp6wF+tWnIW7hH2Ohnf2KAVlxPWfJsnBXLU6VKPsLcLivpg5bvjzXmdq4NDSTsJc
	7mwWRNAv3BnVANvbu5ZctsyIWkXchxURMc6FChogtyaLnsEMjngmH4UtU0KVM/0wlnZ3yJCRuW/
	rnx5AZ5X2HsW4kiR4Nmb+4pfofQ991cBTD0Nuf9A2CgUMe4ayxBzGG2uiSkY2NjkfBk9LE2qfaO
	ICFI4T62Am8ZIj2sZJZqkQDfJcKBKdGELOM1Vyw8UV4LvnloClr3Cca7ByEs=
X-Received: by 2002:a05:690e:4184:b0:672:a0d3:a73b with SMTP id 956f58d0204a3-672ed4c3137mr1155115d50.96.1790266340076;
        Thu, 24 Sep 2026 09:12:20 -0700 (PDT)
X-Received: by 2002:a05:690e:4184:b0:672:a0d3:a73b with SMTP id 956f58d0204a3-672ed4c3137mr1155094d50.96.1790266339607;
        Thu, 24 Sep 2026 09:12:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91425cd8416sm9698296d6.17.2026.09.24.09.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:12:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: glymur: Add videocc sleep clock
Date: Fri, 25 Sep 2026 00:11:51 +0800
Message-ID: <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ANkYE8ecwXCdxe9e3-VjwsWm4X9ST6xX
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab54be5 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yg7C0sGLIsusXtrQKFIA:9 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX7B6yejL9YdHF
 +20bv1usf1LhdumV64DOULlGKoXAY/x1hTTk7nNFjbu6cvrN+BQLos3ViethnNWe6VSRo5OKDC3
 HonihcpJC3uEgDQmFyVzE/b4cAxCoqsLJG+86GRSJmnQaBD9+XmRb6l5TdGT6VOoiciD2yCZmgY
 IcsMzTqWsZ9pINUWnVRfAq4rdNX9y10yr+WODtHt2fmmsnObjcWFMb0iBDgfnOail/G0ds3rs7g
 k1sZTNJLeNMOfLMZ+Us59ZUUDudNy+NKo+yof0oVFSMGjFzsJipCgBWy2FTjKBKjDu267VgPp8i
 IDFLnEpjYlEo0l+aHIT+1BmJvqUxlHfaFEbzwwmbdHWTB+lygfNvhu4TJfLkV9Mq3e32E2d40hY
 fJbIi5nhje7pTvNGFNEH/0JCRRO8Digi9xe3l3kGL0T0YYay/vqP7T8neSxnTxry3UOmqcL/JV4
 xmt5Ucd58zwA+ZJAjUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX0Ne5ipEULLeh
 mgPDlT9itt7ycJIX1Dfa/7TDaiEn9zyD5C1FT2PvRJeIrqxfLrB2ZFdijBqF7efrYbSq6Y+kKVq
 JC9KHW5167YnQfhsvO9e9noG5TSY7yI=
X-Proofpoint-ORIG-GUID: ANkYE8ecwXCdxe9e3-VjwsWm4X9ST6xX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240066

The videocc node supplies only the two XO inputs. videocc-glymur.c
expects a third input, DT_SLEEP_CLK, and uses it as the parent of
video_cc_sleep_clk_src, so that RCG cannot resolve its parent and ends
up as an orphan clock: any clk_set_rate() on it fails, and it shows up
parentless in /sys/kernel/debug/clk/clk_summary.

Nothing is broken at runtime today because VIDEO_CC_SLEEP_CLK (0x8138)
is listed in video_cc_glymur_critical_cbcrs and is therefore force
enabled through regmap, bypassing the clock framework; the sleep source
simply keeps whatever rate the bootloader left. The orphan still blocks
any future rate management of the video sleep path.

Pass the board sleep clock as the third input. The sibling evacc node
on the same SoC already does this.

Fixes: 675fec65df73 ("arm64: dts: qcom: Add support for MM clock controllers for Glymur")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..26c15092bcba 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5758,7 +5758,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>;
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
 
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
-- 
2.43.0

