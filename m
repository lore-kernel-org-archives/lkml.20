Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273718;
	b=arPiFtK649SRhC9+etLEGnxK976ATNFZ9nclPpo9PA1AmmH6Up8U5sn1JklqBxzy84GN
	 xTguz/ApOXiGmm6iOiDXcW3hn5TRrk+mz/p4Cgx4Wj9NttMkrV/oeWBGsuSHQjpF+AzVh
	 LqDmx9DjYaN+Txsy3NKUVfQyXv8Cyf2Ss5YjjsYYn4PyyZq2Bjr6+Y8fDuGtZf/SpY9OV
	 WaaayAjkTsNZ0OAkV/RMO+g9MoxY5gRG67vG5BotadJzEqu+fY0cAqFh+NXOrIHF5/uKc
	 SgRJm9GVEps48Wvj0TxaIG1MfZ/+QpoPs0VKYddI94gO5hm3SY8WKgk6X4v+lwrjDlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273718;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aqOh/ZwoTqzFj8vF7sb5XjQGmyniluEf1vOFoSQCafs=;
	b=S9RyTnC8dL6wZhKjPcVwl2126Nn/1kLJSzVUGxSHY4XUT/ChYrwQQcPFxkQKJhdhjzXt
	 LtzD9l0d2EP0ZfS/g1AEc/iADqP5YE6E55xvxv0Z5fWF/sMXRNtnlGTJKV8InNL0oLRA0
	 sOR77TEmKBTPLN2KM+5Lv0PnSCMzKw/Dd67ZkeG/Oehcp/35BBs8yjhgtKeCSYlYRiCpM
	 0HxmhiYIQ9leHNZmYHTfIGbJTB+t14xGe54hg284V0bwFjjy5uvWWsdwDCy9/3rT03HRt
	 NGOAGLXv0DQaOTQW/GQli0U7sjXhfE8u6H6OpAf+KO3rvlZ09xAxnpkhetT699U7BiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLP2RjhF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IqqoUXqI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8703460A260E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8703460A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLP2RjhF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IqqoUXqI
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jDZY2828335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqOh/ZwoTqzFj8vF7sb5XjQGmyniluEf1vOFoSQCafs=; b=FLP2RjhFF494uNys
	/SnHSHvLQddMnFXQ+1EPk8Z50Mpoi9+oovE3PIyYqip8f1U0yU3E6xa7kOwZea20
	Y1IIxjJs2XFQ8Sc7PHKg4Zys58YcFf47670+/HhHc5oVQIwct9Bn5tEKN0jWIfZl
	wyEsoSDXAE//vQ8ShkMJ2oUIIuwLHWfykgtXqqXufimC5eSK5j8pKS1qCtZghous
	0aIM8uVwS8hZ1T5k/+7vClDOEobXDYfdhy6Ox3tccKUYZh0htLhDYGi7y1UezDdx
	k1hCFGYG1hPi0a3SxPpaJGaM3hoBmyp4wkV9tV5Fhs/8WZJ5A9gVtPpnFLItKelQ
	TcVkoA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qtnbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:21:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea71803effso15342965ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273716; x=1794878516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqOh/ZwoTqzFj8vF7sb5XjQGmyniluEf1vOFoSQCafs=;
        b=IqqoUXqIUXN87IZESQbB95lK5q4t3xfkw6CkX6zUbuh42z1Q8nsPdNIaQ6cxy1UwnR
         OwK9mJk05jMTYzMZm0XJ/JWACGvLbFevKBWXohxIowcY6fzvcq5D9VpcyEWiYyff+FqL
         ZzwY4Fj6+iiw2pOzWmaybNIzdY1Zj3n2KEEt7wYIq0Us3HxYJOYY4vX5yEOqZRBRiRLo
         yq8Ef7t0oXadPFYax6n4W1K4prTyNb5a6S8nflyLHlla1ge7zV9DkRa8uXD2eZ3ywLiF
         1Uz/4vQXWJdx+ilOtokw4fJ1GDrAWtApigbLiPnrOi5+9OMqrUUn6v1MbBDBGug+wZGL
         p4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273716; x=1794878516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqOh/ZwoTqzFj8vF7sb5XjQGmyniluEf1vOFoSQCafs=;
        b=lcHjGl+BZ5w93uQOUITfmWgckeZ/SCydxvwSM3J9bwM9jmlo8FS0hiCebNlld+6JJv
         bDAG3Lsi9BtxafvjeW9npRy5I4HCi1wWa+Ix8bOeSREmrKVig+rtmo455U99TEmhPg1u
         EfzYhrHtfm0aLZr3Mc0gOsbi1z8yazRbDNbMbvQEisv30ShlqVSSOybsV/Uyn792Eo3E
         TZ0SSpaGXTxgu1mTsHCZxtjSJHyNyb9YrMWLBqWP/UFyonPqS9wWfhOQ7CultRxsgFUp
         RrRYQaN1a9moLuFfbq2f6I4DiFY9rdfVyiEDO5xqKjKjoQ1Y+HzroLymcFrd2yXWyfoS
         t22A==
X-Forwarded-Encrypted: i=1; AL+hErGanATjBZShoR2adpkQwurbcaSnlDq2qtDfrNKtiYaVwbyE/I6Wj8twUo0s+uHE4sHnG40rJhwXmSDPGLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Spsbqx4gZGgNlNLrQrrNdGsvDS1xCJYEXkKcm4MErC77MhJwn
	fbX0oNy7WBeST/xgUPgAjFAJiShQoO13FhKhnAxuqCkBy+o51PZMTkp4Ko0cIIIwrRjnN3n/rvi
	i6aASYXCooQYTnJLW0Zf6RC78ag9vOKlU0iZ3+owtQXlbu7rR05t5hyCeiZwpvCCFBRg=
X-Gm-Gg: AYBFou3XYtWUpaY262pQDfy6ZhpwAOTPKC39P/KM1OxYvSia1Nfv6P7JtyayZLfYFEH
	Yfu1i9EXANwz92j5hlKsBSPtioIfmvvcHYDEXALV8eVEc576kRnhkqFRJ5GmGlseyxlzyo5HH7/
	XZswCBOPgsJdnGgRXSFU5xycDiyprTJyB3lEyN16CtWtMtbJ+cc6rQ4alrFu3xzqXKqUEjvm+jW
	kg2n5JQclpIMqWt/ra9/HnZ9eLUvORzb5EfmdsG1kbnY2+/E/g7lFl6nMdpy6BTNpBKlZcqPVO7
	y6CNfhNbmWuo35P0PWHnSRuYALBDnlANQ/8+Bbg8yWrD3MxulBOJQwBRX8q0sPusraFE21mrCJs
	AZz3swXZHjumK8q1n4r6MQNGyyEK/E+SESDO8tR328XrHkIBiQcDH6jf1ZicsnKzTmDCW+W2Ekl
	PqVEq42oRe78sDnKlfUhqRhjrkZGZ9rITWNys=
X-Received: by 2002:a17:903:2350:b0:2ed:2176:2455 with SMTP id d9443c01a7336-2edb92027c9mr8718955ad.38.1794273716058;
        Mon, 09 Nov 2026 17:21:56 -0800 (PST)
X-Received: by 2002:a17:903:2350:b0:2ed:2176:2455 with SMTP id d9443c01a7336-2edb92027c9mr8718785ad.38.1794273715605;
        Mon, 09 Nov 2026 17:21:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:21:55 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:16 +0800
Subject: [PATCH v7 3/5] arm64: dts: qcom: kaanapali: bind traceNoC on the
 platform bus
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-3-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273690; l=1695;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=e/VC4qEgu082rNQ9Rv5+87S6VUZB333iuAfgirzakG8=;
 b=sm+yNpYvjBZ286lnnvRQiD3nOrJzYp7GbSRJ7p4Rm2cr7rwt/kNMtAoD0o37S0+cCRxGJ9+S8
 SI2iKn7wv/iAsCnbhvHT4fUeGESSmnxyk2yAjomX7n7GjuQHatL/B4b
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfXwoVznPvXZym0
 rhv1YbWyavohgNKlBYTDRAxXWu4Vajw2ebpPOydFVX4nm5uue1Xnlxa9pKGa6jhKjumqOA93UDz
 A0IMzfO5leX48av/mdLECSEq7W8mlPPy+TrFo1gmsq6vuykZaYPSWovd8yvh1hnwBVoaGjaWBrP
 UHMzuCtzIt5PYHBb2uNf9kGOT1B6d4RPs+UgkPZy32fnJD/YtQf5/j//teY4hKYsZZH6EzFyDkl
 5Ih8//z6FZjSQcInZ+D6dTK4W01QH26yXhTulobh1RFvced8AYPvnWNye3bMmoXiaWBIX/Trnfo
 DmNNUza6RRPk4Cai4ZSPHReuouu90MAKxbbVm2ZlmxgDONEAgqlkf3y8bFdO9C0IPfRpCLEm1zt
 WkxNZw4aHwXB64X5lx+Vo4MHm5tFl3vGJuJ0DcZxNvc2bJ9fbSwM3dF+tsSVCPr7hcDXTzNQQSI
 aZ6plVBEwatGrXp2J6A==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af271b4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7Rut49xxg77_icr6qwgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Bjl0pPJxpeamqTV-AxTHs09ZnQ_v_PSm
X-Proofpoint-ORIG-GUID: Bjl0pPJxpeamqTV-AxTHs09ZnQ_v_PSm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX7vcUwD11kfAw
 luNck/PEUzKGbmM2l55IFt6VK3TiwTTGp/gOvq7zRO3Pve3EKmOCOBsZOMuetF3/wdEa90rm6Li
 Chi9b7UHX/sITGkZJoqUmcR8ae0jOS8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100005

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The traceNoC exposes the CID registers, but the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the match never succeeds, the AMBA probe fails, and the
device is left stuck in deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on the component ID register at all. This lets the device
probe on hardware that does not return a valid CID, while remaining an
Aggregator TNOC that retains ATID functionality.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..de135eee0aed 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5414,7 +5414,7 @@ tpdm_pcie_rscc_out: endpoint {
 		};
 
 		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1

