Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B5F227EBC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235193; cv=none; b=I61RdXwex/QDUiQDWgOYyyxUgUBiiZEN4ATroZvu0QK6IzTthH4TQvn94NVe1ALU9LXtwMftNLdZv0/4VY4S+rSn8qSm/cq4kWvCSzmkE8hYBqq/nYHOPP1JWhZA+dNaE6Mtb2BVviMcVqRhNzpkWj+WijhiBBcCBgyE0wAl9Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235193; c=relaxed/simple;
	bh=4HUozPl6P8WQA6fqZG5KiRI0jrfGMQDXBfRnaSUaukQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oiv8a2+4Z5pP5ZuDGfWOcL6Ixi1mL7twGsmSnlfd3LlqZj0O4jvX9+3ZvSAKhJpbDL6UtVq8akow66PRyxNAeGFbdG6Y4WGEn8IGrruf1RFFXJG6q+2W5b8XS4AuspAXvUW8Im35OS4SsGrT4O/gKMzyBy8szcSxCKQG7npkeYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cg9m3Cgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZK4j4+IX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cg9m3Cgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZK4j4+IX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eRxt1148109
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2WA7LsDGNuQYaD6cNjqTA1FGgaI7kzn1QW6
	oz4DCzYk=; b=cg9m3Cgyp5c7m5GsozMjxVeHReoL5dYl+zXpL+SoXAqn38fDCPh
	SKro/kMouiBTvCACnWJmSH7VHIxuwn30EKJrvRmrJtH/qVnAgxJ23LAXcax+ltM9
	kfYVoNNraZqaV5WDRv/LAKAwhY07DHqH9Cz1BRUCe8ukNh6eCz9rEF/Oysjyvvkd
	VtxBOaYmtGvfLNAue4MNeu7mOqAKv3FzdNYrQUuqNXAXATvOQ9lp64ES/kX1e2cc
	6hE+poVXlcgTDX5d4LspuU5M2TbGsZjukF5JKBEbRnGTaBFfe3njrSYKA5KZObb4
	pz7tLVz6+TIEZSSghmaGHn22p5lgnIjMJNA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrraapd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:33:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-334f782d1abso1298060eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235190; x=1790839990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2WA7LsDGNuQYaD6cNjqTA1FGgaI7kzn1QW6oz4DCzYk=;
        b=ZK4j4+IXs6RCLfEsUU0SxLdFaNGYcfkFZxhmSRKb3hhPnZUn9iQiRl/Yl0frUJAus+
         ZSBv9OP1GdykHiPUIiHXBu+h2vrNS7jHYBwWvw/UCYvAvRXlobNStxN3L3+GwGWEn088
         9sf5WzcyNosM2Itbp/62GSYIUhaJh40ULXgSHgq+Z0xRFhZtq1FtsqRmKbioGAwwWLNd
         JutIvbzp0iOJnSKPyjB5sB5i/Zxa/iVR8O5np/7POrG6XY5k766DSattNYLloxmky7FC
         Z9FY7zwNeQty6ZFuthDC2wxxYtMw6XThX0rUkPMdtogB5RzcfV/5ld12kdUBtkXJ9UcS
         DZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235190; x=1790839990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WA7LsDGNuQYaD6cNjqTA1FGgaI7kzn1QW6oz4DCzYk=;
        b=JizYutOolea7d18Fw4Cee0duTdNoN7zWN94gQ9r79mESCNxVICTo/O3jgdJfgBGjty
         CNlilME2cXLuWVWOAj29oVu37jYcjO/ZAqK1E65816CZJptVYlRMUW6hpBE0/xZMgAJp
         n+CqIwIQ615jlCJ9tm8tSux4/zOPjHB8CGDAdIsucQU35WIEkI3ll49E6nWcADC/F7h6
         X45UkedyA9hmmXoTsAVomVb4i3JLDQ2uJsjJNh/soO/ek9N1d62Zxc2m90rhls+dE+6g
         WirMQiznbWB4tjfpYLCbuX4aq+cbHVGSK1e+1LOPprsMBZ/4SBWyEUjV1DCIXJZRMyIv
         Q8lQ==
X-Forwarded-Encrypted: i=1; AKwUvByBxcQtCjY7wW2jEutJ+T2fmtAIgqvgh4HHjhOF/caepAFWOaVbHBh/9Mp15m42ELTI5MfFA0O8Rrl3Wuc=@vger.kernel.org
X-Gm-Message-State: AFuF++mSue+0y2rhk5SqItnGB7+MxDT4kauqtRhfEEc9UBcW210L14jT
	ToA74UcLeMPiS00nWuoWOjis5IEZ7rDRGhJWW5XxocFbqDJP15deEPLsD6YSPO8r3uiPZMYsGyc
	CPITwGm2bM1t3VQRGoKXvzMrdQgPsy4S/u+MLFVB6uytmQloMCNcwXTC2JBpxejHgr0I=
X-Gm-Gg: AYBFou3Ja6GxOGZz5X54WXz05qsJz8dO1uoUFLPiFoucfC0fRxK5DnLRr3i8yH+B3nL
	mxctJBA0SrI8pqVY+P6vu+Q9tiYN5opGKPw8ScQ33RJC9PWZr9TPgWGnSTC41zeJitUwBMj41/A
	iGpvKHO7zl1fEwE5IdRx5zJ7NPdxQ9tRmx0gcThZpX4+RiGpteDNc0SLZfm/ck7Yvb/QtdrztDf
	uKvxw6SyVgmIHFda+AnLW4iMAs08egYWkkQeSUZp/+YNoGam5ElbsCkHUl9JW1RrnQM4DeSnqx2
	cE9nzS9u8DsLsK5B3UZkqRn0zByXjQtAlcAEdsb2YxJF2w63Sv8XZ6sN+6NNkV7mAfrmlx1tSir
	ic7xk8aQdlNFhR3sG6PwWCQ61WDHvqBtPjsCcQq/sIgMRu1e78mav48t1UXk=
X-Received: by 2002:a05:693c:880c:10b0:33b:fc17:e781 with SMTP id 5a478bee46e88-3400697415bmr1260060eec.27.1790235189790;
        Thu, 24 Sep 2026 00:33:09 -0700 (PDT)
X-Received: by 2002:a05:693c:880c:10b0:33b:fc17:e781 with SMTP id 5a478bee46e88-3400697415bmr1260028eec.27.1790235189198;
        Thu, 24 Sep 2026 00:33:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm11052635eec.2.2026.09.24.00.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:33:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Pushpendra Singh <pussin@qti.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add BWMON support for Nord SoC
Date: Thu, 24 Sep 2026 15:32:20 +0800
Message-ID: <20260924073222.1000666-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX3CJ1vWSy5fiP
 g/u+Ch41dVAe+JtGwm3JNA9eWXomm3RoaJhw2YFi+D0zZ9ftrCI2lfJR9BTUhd7K/RjriaTzYe2
 70FHfv1g041lRYmajF1h3l0IRPYD9eTV8x2ZcXrvCxLmN7S4FsR93haAB3lG2D5LS8lE7XAuMCt
 9sDHhBtVvBBMG2dbyXVk3xYqPKQ3VIo2iOQL7K3DeXVr+6Fn8v/VfEcL4oV6s3lyMGHaBoHmZ2E
 /lFC7lUcxCsbLdvImr041kZ7lv1krsmlvc1fVG5zoE0fBzH+AkL6g+uzy4TdNgBVuPi0Phz1WMV
 U6D/D74ObNW/94Fn1B+0adI/q4KBaUnX5umU9pZn7RAjeVGANh0YMgUhXRsN7ShBUR7n/jFHy1h
 yhlFkf//NXtGJ+hrXiMmNdwUKZRnChj94u8ZTN6+Z2HdaenzCEwLEd4SX/yvXwdWk2vI1pQjRyx
 kWoPpsa67JVmWu8bF0Q==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4d236 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PYu-U4Ynb8dZ3rZs9soA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX84W1rxaY4IBH
 F5FsYzs9gDcsNAriBY6qeE1H57AsrwsTpYileGE55B9/QZxNHX+CTlaTWWyvZNlfxwu9FIMh61A
 uGvmI5BLVDi5zH89WVOqUqloVk5Mbio=
X-Proofpoint-GUID: VqshmO9Vp1nQmWIS-JLgcEHYDpwZI7_9
X-Proofpoint-ORIG-GUID: VqshmO9Vp1nQmWIS-JLgcEHYDpwZI7_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240031

The series adds BWMON support for Nord SoC by documenting the compatible
and adding DTS nodes.

Georgi's Acked-by on the binding suggests that we can apply it via
soc tree.

Changes for v2:
- Fix "reg" length to be 0x500 for all three bwmon nodes (Thanks Konrad!)
- Combine bindging and DTS as one series
- Link to v1:
  https://lore.kernel.org/all/20260831090134.585588-1-zhangfei.gao@oss.qualcomm.com/
  https://lore.kernel.org/all/20260922080416.484280-1-shengchao.guo@oss.qualcomm.com/

Pushpendra Singh (1):
  arm64: dts: qcom: nord: Add bwmon node for Nord

Zhangfei Gao (1):
  dt-bindings: interconnect: qcom-bwmon: add nord cpu-bwmon compatible

 .../interconnect/qcom,msm8998-bwmon.yaml      |  1 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 21 ++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 67 +++++++++++++++++++
 3 files changed, 89 insertions(+)

-- 
2.43.0

