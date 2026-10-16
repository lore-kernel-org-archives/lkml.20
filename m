Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C68551992
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170448; cv=none; b=TOAf60tVpDqIlzfBx0/zHcJy7iTNepm2OZHk7Ent0j8OhAYFjiwSFL/EbhztNqBo4ggYrhwAB9+1UVXQYf/kYEHA5p70XHeckf0zRuGQGkJRrLwcsDSB9piDPS/zq3fEHeufH0hmIspPCqU97ArRJhcaq6WOz5jy83tkLRz4NmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170448; c=relaxed/simple;
	bh=0KwjSoWukgYqAq90gzgdo8eC+3oMOgU4b4WGUOqDh40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EUjE3jEjzIhV/yQYha8bzzPcbhTppuJsIyscaeYPUOs9GJHFKZfK6O931dHBPmfVAweR49aYEG9n5xs8WiCpW1P5hE51Ks8os1NmawAsnw5JpONg3zS44306oxmg7x+2VD0VJKEHguwVBy1e73QMru11n4tf7TbAIQFCduC1jTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWvzoSh1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVwyF8Hu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWvzoSh1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVwyF8Hu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5qWD3577676
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ImWkS2heDc2
	Mx/x5aRQGs9bDAjmLZqH7xoOSJfYrzZo=; b=NWvzoSh1p62XSEgmMB/HEKXEtO6
	sAe/MuUxPyfdVmDwHf2dzxakqobVi0zjc7rvkIqR3Jn7LyFEwCrLARGRqGvyj5uN
	mSpdGzrpf69drK4dTgN3eFcFQ6WtrHqBjjLbt2Gd4CCDAEti/4iQxc+cGePfqILP
	DC4No4Zj85+aCgJo4n9ipVj6Ri4bThQRCPJPZk6KcNoggudGkSr3UuVN8Z9YVyAb
	tXQ+DhDPbdG6JFY9bGhVjOE/ExIxI8CgOkrdrHbv/2D/0P7kWcAfxNm5LQ8TaqHe
	OPXOmZ5G+o+dkj4dpyTWEFeexsMSPcokf9O9RpT2lF44rhKt5B8P7Ff5kkQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba263cxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:07:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso23097485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792170444; x=1792775244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImWkS2heDc2Mx/x5aRQGs9bDAjmLZqH7xoOSJfYrzZo=;
        b=jVwyF8HuYFFwSpvDUQ9MHOqWYqZzt7CI2rlFuiOPpuThK51SmNu2AToEW9qoAdjBOY
         q+PN4SMYspTxia7MgtcKjjuHAujgsEeoK5VAaDgU/UHYhShLoT4FSLxeniSvr/t30PUb
         PiXQjVvtwwh4pzqOV3sWcJEXpu/ak8Od+8DXncy/oOW93zALDYQ1YztIC+jD9fALHczB
         OCsodbavBB41rDkTRlgXW45OraY/+FJnmm23xSD0dyZSE2Wyh2MKwIVhXffUMNNxcNW4
         2YW3gyu5NEUsdqVVgnYxNzdrePqAFRqwwTvPXmNvZo1qK/6rWF+QTKx6pM4yXdyWw7gG
         AqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170444; x=1792775244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ImWkS2heDc2Mx/x5aRQGs9bDAjmLZqH7xoOSJfYrzZo=;
        b=pgjmo7bF5cGCOwBljKYoJGPsJ/0yHh9RH9IpUsf4Hcp7eIx3oPngAejxJChP5lC9C4
         HCJWENUeJNNFxlgJ0RqKlHaahQP8asdEoJFMu+wO7t4AQXbqM87Z5jXyeRADG0lX9B7U
         rriTYdbwcY7R1JxwFRrkAHdd9v27hyvD6N+lE9GmspFNtPYeoj3605iPr1dIRGewEEx5
         S7+jL5ZdWjXGvBceBGGZG2eCRXjp8CTsfsTzSadDeBpzQksmKz3IwTE8+0Gehy52tMqe
         WeeUK4I7JNVUB9qA4M1bB1wvwNRpIEp1igasOhgDiYxi8Q4JjGOXE9cJ+Pt2xHeft6dk
         yMJQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2FiFKiFpTv2a7GxAV/rqCgxyJR2uiROZg32TyAGi/DRFcw14mo4+zvPEB6cKEdsBjTWmqH5UjYx3XNaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMEasYYollOYS1iCAizY4jQ+5L9FpTkmxYDc9m80Eqk4c611oS
	v5mjOAflNoTAc0IVgM6FrFOcoL1JbXfAOwEs3ojTFT2iHF/u8bt7+eO4Sjc1dvQO3s+JEPyFQWe
	Ue/SOV8btd3jZ2sb2pydrBj51JRwO8OuV9hMMsviCiPbkq86vMk64RxRzYtHHfecxipc=
X-Gm-Gg: AYBFou20DiGs9Ju3TjSG3UqxqcpAp1JUoP8t6PmUcGI+ld9W2Ltfgi4eIuDnzM3j9/K
	RfnpvSRLKiRXgaah8Xwzf0SNHgiHRnMhAJPNMkbN/tKLL+W+4bT7Iaqk5aWwHUsdmxpT1Rw2LX/
	wgE6cBG8e7XKXpW9TkhKTfQTf5z1hiBaE9YaXFJk7C1ouKjcSE0/3Ynh72R5jQVHZHd3kIzfZ1S
	/1t0s4UYtrQkXIownwMJoXzdeO9pNpmUHMVx/GlXKFECKTFfmFArAjgiMnnIqN775X+i/wyjYhL
	WaRE3zz3h4ptcjM5w7OTHrRYx/tmYWCgGMrp/ADUzT5r8N2BKG1spF4WUK2FUxVQVVcElkTU1sg
	s/gI5cPxW44seS6SzvFMz4/mW
X-Received: by 2002:a05:620a:8811:b0:93e:6ee0:c074 with SMTP id af79cd13be357-93f29ce767bmr84845585a.38.1792170444157;
        Fri, 16 Oct 2026 10:07:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8811:b0:93e:6ee0:c074 with SMTP id af79cd13be357-93f29ce767bmr84841885a.38.1792170443651;
        Fri, 16 Oct 2026 10:07:23 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5b2dsm6630571f8f.31.2026.10.16.10.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:07:20 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add camcc interconnect cells
Date: Fri, 16 Oct 2026 20:07:01 +0300
Message-Id: <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad259cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=UCxR3cWr3m5Lf22CgesA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA2OCBTYWx0ZWRfX9D8phqAijYcm
 8GwikoIxp542VtFnqnrFwmQiL6lkyFZIUvrDuWuvwq+1/2D7yhXC7b42vfxCDdaQjwAgEZc6Stf
 LtpGmeEPNml2GtZGBrmfg01nVy7S3clTFVebyjOeQUM47XqeSUW1hGSfyk58KVgLkOxhf66tFeS
 s2NM4RGVAnstEFjLJbpeplcrSqXyaL4PVsS14kZFu83iyE5qNKZWFcDa0uJG7MxhhFofMw4VCpJ
 tVgsQWs/d9vyE3+WgnFWXyd0REMC2V8BD1u8NWd7VY0dqWyzf4cMLmjiDL3NRmGcvphWIz5rEJh
 X/qWT/U8GP4agwRuMB3MozMvkerquiPG3/O1cApkyxAk+EfeQ1MCtmHCqdUYbgyiZixNQRPsG+L
 iCT5xdz78goX5oyRVj6IwCDiPHBUUCWv1E9/U18wADrzACxyB9q9lQTwdTHyscc4DmB7Zj31Cvc
 FqV9+ZXX8QBIeG9FJyA==
X-Proofpoint-ORIG-GUID: auJXevGY-D2DaqJ--ezjDkR4q3T6QLQ2
X-Proofpoint-GUID: auJXevGY-D2DaqJ--ezjDkR4q3T6QLQ2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA2OCBTYWx0ZWRfXykCZ/6D1jqxU
 ybmF1VKh9rl/FRyGoGJXMmEyNWlWWPA8I+S2sSLewX+5jFyrPXC1B+LTTfgkUxbRivRjnpTqxPE
 3KC1BPaqyLwbnA2zXIbwJHB/aXRDY7c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160068

Add #interconnect-cells to the camera clock controller so camera
consumers can request camera NoC AXI bandwidth through the
interconnect framework.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f975c2183269a..e923c74dc1435 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4675,6 +4675,7 @@ camcc: clock-controller@ad00000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			#interconnect-cells = <1>;
 		};
 
 		mdss: display-subsystem@ae00000 {
-- 
2.34.1

