Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EBA47045A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984330; cv=none; b=MDr6SObn2oX3gu/EaP3Krf+fHxdvCBaJ+djR4jAvhlLsUMIK+xu3GiWaZPXuIuw0p5dwFIneUya1o2006EsBuDG8ALY/mtSIPyK9I0uKpgSLm9jVo3vEen6JKNlu10qzm4Igml8Vu1DIrx/xtOsbe+6CwEGY8r57djJeVntd184=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984330; c=relaxed/simple;
	bh=rI9/kjtNsduYBOyjOom1xdDWF+u1HGKFUnT8QwRo51g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tytNuK/chWOmyLOvMKl+E/D67Rh0Y+TGEUmCt2KPXq4JQvz0TlxN29UiVR9TB6xFGy2XqvsANASMxCXJ28+6GCVz3n5xh6DC8bFQYJCfKd6F/yjCZkYBe/uMTls/UdkgtuAhwVm4qpML0X9wFNKusnHhDn/OgAGkpc57P67bij8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFv/nBI4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqBR4HHI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFv/nBI4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqBR4HHI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7AOc73351570
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RctFOn8pk1pJ07OhVZZcF2n4Tp1q3uclOz4Na2XKUV8=; b=BFv/nBI4bYId5wKG
	KJSekAetFaXjrXhqhjsRCVJjIzJnza2Mk8jE0o+QcV5c+Gwg64zqKsG0+IoVK1iG
	6n3fBGclHm5LK6yiXGA8pZTDYoCBTE2JsOAtX4QsE9FvaRnxTed/73oGUgcwSM5n
	rdDgrFPPeadMhaoRWope4Rz5YwZcvJ4OUkwVOhYH6uFk2aBUWjmpkc6mfILL4/Il
	rezBIiZCqueky4Q+scr+n2XmBiZct2rpPew9hcf6Tq51DPP+ftqen/sDxsa/CcFU
	PeHimW53tEf433MXDYL6wRgNY9ffRgkX1ginAYF3e8RvxxV8HyEk3DIQeM5ZG2u6
	IUXMhw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq79a25r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:52:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd8920c132so68407805ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984328; x=1790589128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RctFOn8pk1pJ07OhVZZcF2n4Tp1q3uclOz4Na2XKUV8=;
        b=aqBR4HHI0p2KwPjJ+aoQICUX6o/BHBzD5rho0Gue38nLWGgFsTEMX8KxPA7pG4pGOp
         O6FBT6o5WRb18hm6RRXT8Pm5rSwRXHpJQrB0GRIL+FPAEbRLT+LPJBXuRNs9FraBlZxm
         aVFqSzwgNPyfv+C5DwKKAR9DHe/zXI6+8yup1CIDEkE8nqA8O26MnmjXg9Ya+B+4DZDW
         b7SbeBHhS+amlPmZIOT9NmKEuMtABrvZDUx6/b/D31eT3ZXS3yAgldkJzezVn+cps2LD
         /O47Jay8yxo/7WiG6Io1KQdZ6rZo8S9TZcPerlRr79PnxQUixw0x0T170rJ0rpYh8+/b
         Rn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984328; x=1790589128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RctFOn8pk1pJ07OhVZZcF2n4Tp1q3uclOz4Na2XKUV8=;
        b=mPzr1nTAU9tVq6uK9oPZJ+6EVxZwgVu3pm3pxMba2bqvDeK+c5Z1t0cam8OGO8gOTJ
         s8Emr+2eWnc0r4jesFxN6nBiffKUT9oquKJdgvedOazQuEzLbR54GOYGomPP36JOvub0
         qyFNKnxaUxhtf8aW59Z6TZJX6RJxoTBge64N1CFhjRwoZTDN3I7RnYyxn1PLr/qL3T4o
         SEHCA36wakNWElXSbJtQsQ+uDHq2mcsWyLPLoCvKffuzrgqWAOPVsulyKLMxhu+duqRT
         xlFtS3qeieQNwA6NYvUyZFfzSGb8F4aGCteTZsZQsXQ94t2MkrkJ69WzG/nKvMrO7NRu
         9x7g==
X-Forwarded-Encrypted: i=1; AKwUvBynyHQMU/OzXM6Ky3jG8Ljx4UWbC5U5n7Dek2DXXL3EzvNwKJiPb7IwkmER4YoQIVnJglh1kB60B9iqJYM=@vger.kernel.org
X-Gm-Message-State: AFuF++kAAylZapoUfAwzGavBeUh2hnG9XVIBScSskINv3vGcLPDsEUZg
	yl+VELq5nS9aObOEiT5V/c4ERVVqBwTDNNNRwkmXwg+R8G2bE/8HNsIlxKb/HDvt+VGfeozKltR
	OHkM7Mqtley38kQM18sJwRxiMGv8v8QF1QpylA5W0ijmmzJIa5UIx5hqgSoo8aRNrYFY=
X-Gm-Gg: AYBFou00cCPA3h7FoeCsKsZagobgc17GNprmk433YttohieLu4UPxUGNcCvQXJHUaZX
	qAVZE2qvDsrvWCk9YD1SGispKVdNLTZkaVIeL3C5TbSSGjQASTM1oZjmrEMytRldGUc7zdOLk8i
	hHKu1fBbFpMK7r5JI73Z7T9pOfUlNcOiuMIIE2Z2FHTFw8Ylh8VR2MppO9eBJrgKsPvKvpehMKY
	kvfQtFVQo1LEuT6sZOrImRE0ZuSjVkgyjn3WJ0L0AofC7oWv+FZOkCh2ac+WaF3rpdubkBfN9QH
	ghPJo4edsGM+U1HUkP0EwF//RsTQ5X8OWtwLF+0IDYZ9YFIq3pvAsXvLsPYzWy+9whzVHox/t7M
	5jcC1Oa21MROGakOPMEzx7zBFM/Xe8zFNwyk6/Kd3u1tWmCj1J7qMakNJQebKxEbgcYYjwbSgmg
	==
X-Received: by 2002:a17:903:9ce:b0:2dd:c054:197b with SMTP id d9443c01a7336-2ddc0541cccmr97274835ad.32.1789984328477;
        Mon, 21 Sep 2026 02:52:08 -0700 (PDT)
X-Received: by 2002:a17:903:9ce:b0:2dd:c054:197b with SMTP id d9443c01a7336-2ddc0541cccmr97274515ad.32.1789984328011;
        Mon, 21 Sep 2026 02:52:08 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178889dsm30523095ad.18.2026.09.21.02.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:52:07 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:51:38 +0800
Subject: [PATCH v2 5/5] arm64: dts: qcom: eliza-evk: Enable iris video
 codec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-add_iris_for_eliza-v2-5-5fe7be8c0230@oss.qualcomm.com>
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
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984298; l=752;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=rI9/kjtNsduYBOyjOom1xdDWF+u1HGKFUnT8QwRo51g=;
 b=0SiVfaIXtTwDIQ/mrD3eEPIqmj0BEi795TA+eAEy7uyjl6LHgqK5Wi3paiSsII6G2jP+gjerJ
 gYY8EX/AB8eCx4z5KqcgOZNuhbNOLfc1ZPqTinCg1dAYDqXQN4FzIef
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab0fe49 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8ycGgHVmDalfDplNnMAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX1bO2r25FF7Rx
 IYicyjaqy/8Do6jdOKxRdOTpcPJ/IroKAHqIxo8MuKTn52m5WAfyHzGBe6LtONVQCqkoPHRTEkP
 D6rw9FiopN9FyldsdOP8VCPi7YKSCLE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX3aInOQx6BIRb
 qdsWcAS2jcm+ZGF4knLLLFzp4P2FyienxaQrswW2f8xa8+zIM/orpBCSykyuHXlrVxeuFvPvcmg
 RerLs9/NwdDIulcIZrBOnxiJvJEakt4eyzyISZFn1XeHfDXnFQTguI1kWj20G1lLSfilA1JuBeg
 mGe3jlGq8/ttaRsj/h+fSYh8NGTEmuNH8w7U0bZ0c8lPEGxMQ6WWTURZ4BiqS0q1Yopcb3R0c+M
 dmju928pJcSS1NrUwEvT0c8RiBOhwiDPYaFa96GZhYNzATLAzYp9jcKQa7suH+DEnGm1eXCZPvN
 p1cO5Hi1gnmP1fYfZZxfzCh528k61SyO9HG41gcI5bLWfWG4rC4Ap63eyg0yN2+ACeW2nKHqWtF
 hlcZ7N6bgtRGXHbzHuyur7l6wqRiUJiVOa9qLsX7BSqs54zzyTTyyxf3EC6OH0dlCrCgDmz1Cnh
 iVUgfoVFcMKfynK1HhA==
X-Proofpoint-ORIG-GUID: TBymMWxA5sD0s8C6lqfXq8A8p8PVw27c
X-Proofpoint-GUID: TBymMWxA5sD0s8C6lqfXq8A8p8PVw27c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210141

The Eliza EVK includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 6c5cc47a183eac353e833dc2c3971b5a7301ab05..0d8f86b6c6fed16892369b0d1fa9c7a14f575370 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -148,6 +148,10 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.43.0

