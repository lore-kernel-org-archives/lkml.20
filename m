Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702529;
	b=XNMENqOActoupYGh1+sTy3w1eTgxd3DI29F40DaW3MTNaMmiE1vdgW4MQggRfnCM3Gmb
	 Y6vOTfb0EkkLtjlCu/Z8GteWgkVV0Un829+QkMrOKb9dVQHepiQWbLB1yQj8hvBo5TtFa
	 JXXVPO4bb8idoD6Ko0se9RaurBTktjmlO1A2sJE2SCEsmibFNtddfz/8mhUPgbJpOfdSx
	 7TeZTaTyO1wKtYnqwr73ec6JhRb0Ryqf/M/HPP6TC0LfgX5rVGcPZx6eNBClW7cSbCCD2
	 icMawNE9HdRenqfhUKQyn2S8U3U3l3gQHXXrtnTuTfDKTwJMdd81DH2vtJW9HxyHymw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x/CuCdz51DtCsa+8aM9q+5VicLisxnVBRFM4WxNQsyE=;
	b=K8COTn6mY11Sai5Yt4UqcGRZSM9kH9T5BAEdm8aslnWYeTN913UZjbPJJp8tskx/A7r8
	 n5LETWzK+XskjTUxWq943ijKtc+H4SNe0IH53k0KETdxCz8gPb4nDEMyuT5feBGKB/YrA
	 FsjKquGxQ69sF3JBvalvQ44oL1yWp+Ur2tuKX9HAdMj9vqMpEx1eXxL1qqMlZwLX/GWH5
	 88ESe6bbTnXH9dKvnZDoZahekYkSVHaqBhjvzByVKUT3sFoSQor/4Zy1gdKt2CwA7rMlJ
	 I2qnsLXqhxF0X1eO2CQW5cKOwtrjXco3S7hn3speDNAWM8r9E3cpZ88r86OSyKQoCxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AV6/dlEO";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dIlBRV1Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0770606BA6B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0770606BA6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AV6/dlEO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dIlBRV1Q
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAFDe2522019
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 10:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=x/CuCdz51DtCsa+8aM9q+5
	VicLisxnVBRFM4WxNQsyE=; b=AV6/dlEO9GCg9ImgE9J0nx3rV0DM69hvJsVVN6
	I7+U2t77v2+8Yvqfq+TEQ+Xdcp3eJA41Ge8aGG22E+K8Cl7CBuX2xbfmYHcgs0mc
	AbCGwIbbLM02VU8EeeW7/lS+C2AixkKvsDddRNk37Iynb/SnOVI8az2aaf2eC3Ks
	ivy2ZtBrElUem097jV+TgM+08iZmb8G2hm6CKW/Hdco9jBs2Xix83JB1VTECzNAI
	rXkpGnjMI6+gOvfThAhsOJT0VjCEkk9oMcH1Vg4fkzoxbaNTOcsLwi/abzmkRoj+
	eq/PzPzGvGhNTt4yBo8DbBTrGsafbrMx4dUa8IplrnzbBxfA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5j8ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:42:07 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9913f410ba2so800162241.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702526; x=1794307326; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x/CuCdz51DtCsa+8aM9q+5VicLisxnVBRFM4WxNQsyE=;
        b=dIlBRV1QkqB6alo4OZSYRirTl0Wy7nplfI1pXjQFtnhoFTWKgRA9Y59wqa1237aDb3
         vm9LW6BSir1mxS/Grsf7tT5Q+9MLFYMWI8U3ewky//8k9XHC4GV+WbHP5cLK07dA7fyx
         yWJMi2m2IWQAxQjw0ZkjnQaZL2qV5M5K2otK+XAkPxXxpCzlrIsh2a4V4t/tTjM9iUeb
         +beXYUoUyHqudodqMtqyU6SeT6CxdrS0u/IusQvr6VKkVaHAtJLNYwtR1pNXWUUpuVdw
         7E9T3xDBui1r2xkUBlH8kZU+UrlDo0Zf1dVg3Epkd5o07lLzy81P5abj6V5ovVEYwUK+
         I1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702526; x=1794307326;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x/CuCdz51DtCsa+8aM9q+5VicLisxnVBRFM4WxNQsyE=;
        b=d66Ec45+qR9QQoghYjSGk5b4H+TtNpaAW0ottaIoXrJiZczOrFoeeetfaO71hbot81
         Oum7v6ejxvezso1N1zTAuSLY236cTc80C8OQddwoockORYRpsuJCmVofwyrW15N/QkSY
         yVFgxVmUADr1P5Rxa//tDy0N2ynZ2eeM1+l4uvRtEFEcjCOQHtT7paseraoT7ygpjQx0
         zUOwg1Kc69xhTXg9yZju5NZKh2XyEB76EXh1Fb16cDiQgJCTpmz/lZzDM75JIqUfqIjw
         DRefyNGAlWOEmB/K3okzczeyM5W2ilk1j+hsW9evzx+Ke1GftVhxIS59R75+jrY1i1/V
         PSeA==
X-Forwarded-Encrypted: i=1; AKwUvBwTJWsozsCjfVMpG+sHerO4nj22KHIusBxdgU28qIE9TqCeW+AZ6V8iKFfKq8uSpTDI3l8KSgvIDW0OOCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+2HGphN4lNgtzYmInrgmj0auKps/BsZ/QGO7EN6CZWg123mK6
	sz/f9Oe0tFnaHegNiTt4zP92FtKsURMF108BN9aP5hVphld2GVwD3E1Yh2luyfRVVRGKyzN/i0W
	qKq90OQqvvK75qe/hUc3yKe6FK3/Lp7W5zp5TozpLmEZatEx8nlvSI5AQFcELb3a+7hk=
X-Gm-Gg: AYBFou2eC7S04DQ/RK5VMnUUGtzQqJfO9qFZWt1tUlJyt5U7eqobq0vAgLVY5jAVNEE
	JSbPxcaD/HsyfJvwK8S7Z37LxYjqoRp2fiuPZdpQn5BIoTFv5fBgrKJQtCC+Rigq0ZkRhWu3xjc
	qNYBseIiPzLSOXOvggaxwGZoe7AVriOxU8uYBNFLhCB6Zud1Wlo59srTxa77DY4T3rEUfzWfOAY
	nVaMkIJembs9wYWCIW4uzgKNc19NEcA0DTjmAbRUj3sV33vnlp/RkcsW8uHbzE6N/v1hMuA0fOl
	5sMIXf/VAUww1/7+QATW/NbbcFkr7PyTtYCZuC5k07Wr2J2B1gdZ4h9BkuySe/ZPgiIZ9qy5Pjj
	bG8Dn9tahBIiMHNTDfrSeVz7STPyIYWdAloka2o08XTd5xVHlhB7NbHgYcW9+/DVWQaJ1vtvvIw
	9zzA==
X-Received: by 2002:a05:6102:e0d:b0:7bd:b263:14c8 with SMTP id ada2fe7eead31-7d072784174mr3993102137.30.1793702526439;
        Tue, 03 Nov 2026 02:42:06 -0800 (PST)
X-Received: by 2002:a05:6102:e0d:b0:7bd:b263:14c8 with SMTP id ada2fe7eead31-7d072784174mr3993087137.30.1793702525834;
        Tue, 03 Nov 2026 02:42:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm21625057f8f.58.2026.11.03.02.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:42:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sa8255p: add ethernet nodes
Date: Tue, 03 Nov 2026 11:41:58 +0100
Message-Id: <20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHa66WoC/22QzW6DMBCEXwX53EXexfwURVXfo8rBGCdYKph4A
 TWKePcaqNRDcllpVtpvZuch2AZnWdTJQwS7OHZ+iILeEmE6PVwtuDZqQZIKlETAuqI8H8H22kA
 7MbSNyQkVIZWFiGdjsBf3syO/zocO9jZH8nQsRaPZgvF976Y6WcpUQTC4nfaWWe+WdXI6HDPED
 KWiFEnKqiBA4M4O1xjOp9fZf3rm9Dbr742XxvHxGhRJ/9GnDsbuDgtWIKGR0hi6aKmkekHbXug
 cTz7c95IW3H/46yN77mPBCNWZasuyMvZdmyeoOK/r+gsUARkmegEAAA==
X-Change-ID: 20261022-sa8255p-emac-dts-dbc521421276
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2531;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZdaIaY+sd4qGxuq/WbkAkOLGBf/J2rZz+EkKC9nhEX4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6bp72I5JmVXxrE6f17TOQS8JP6VP3lTL1crqE
 GsxJ490vJGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaum6ewAKCRAFnS7L/zaE
 w1c9D/96XsH7XNBW7BcW1ZsIrpVb149F/gKcDNJQeoDxEWDym+A9MNZTuI54kLyu+fFSUiV88t9
 KYrLwFqk5PBLr9T56f2ZILS5v2bzJcP6iMf2mUfl/ZHBRqtTBw1ap6wtTGs13hSvQMzAEFR9ugS
 PzzVn3hz3bznQh68MQEM48lyZIC9zmS1HaiRBYhBM36CdMUQxbTT2jNYNuMgiq0e08KcETh7DWm
 5rmqn5tDobDHIdu35D+RTeFu/AQgmQR0hhqIb/HK7ts3+QX/4VL0ktphZGcsVFjbRsfrQnz0u/v
 +eUckZzMV/ro2iEp3Oz58X6VF4ID7xr29rryzQdtAMttyE4gOgPcrpKmY1901iAm8mIFIgI7Jjw
 ORcUmHi3L+NtvLAArpS9z9DieYzL45SbilKprATXjPV3L1Njlcm8iamFhOObno9XiKibjtC4Wzt
 3kD7VfsIQuGwCAAmC3RfB52981sQWfIuLBj77BgWHkD0eZaGxMDCLijbhZ2g6ZEUk0qVkrGUvha
 xdxyMRpNSv/+RMUfNu63ELkf9vMhEb4qGD7sQ1ZkFK7rFEZB8GnCIiiCXhKY7jUwLgZH2TZ4MDj
 3rKp7uk72nX6noX8P21Db4SPq4hBN6M0q3q/4Ys2w+JLiN+KcU6Lzc3/GIdVnzohb84lOraY0+4
 gW30q2TK/CofXsA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: lvI1ErRLro4WSbIkRXjiGQKRBCXsAgQM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX0seHR3ok3ikv
 NVePLfe6eEyMUQzmNvd3u9gWrUcn7ntuyTStYOsdnT39VPwo9i/sU2qh/aRr/b2XQWhfoKtmvkl
 TCpypw9RgaJwRycjelnR85zvPqzc2t6OzP4shbvb+jG2v/JuHn6Qz/weUWqGG5A99Eixq2/rcCD
 drHmwHMip3VS6YFEAtjU3Hro6LnIfOfw5z3C0kLsZcTkVbOrcvzjav/uYXYsrbGamuocSCWbsSj
 WkP8gnnoJpIEHJ//gLY3Zsar4pmS9wJXJq5ljRBdy1K/UbEIHd+ckykPUrvxYKKVXRUW5813o+G
 OX3LxojxIAQo7FBtU9tWga3t1QJdbY8WtIQah42YzOG15+ayuuxFPNOG8vS5400teK5jLcsyoTT
 UAZA7U4q34bO3/l/jQMTpSC5clzUu+YooRmij5ALeDCSIw9SRm7Ikek8Qa+eJGgMUvz7nssNnVP
 FTqklArvawPTV/ap8ig==
X-Proofpoint-GUID: lvI1ErRLro4WSbIkRXjiGQKRBCXsAgQM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX1KlgM21WC7SZ
 AuK2jRR9EIJR23/JLbtVVwYN7Wpu1bPQEv1xLfvCk0hX2dUaNePBxBb9+qbz0fsmZhsrzsqxW+U
 gOg/g7ka6Ov+1yo0S7t2wyeL5x99jVA=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9ba7f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=fPA-ziiZiZqd26ch_5EA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030042

This series adds the ethernet nodes for the gearvm variant of lemans and
enables them on the ride development board.

The first patch is a fix to the iommu SID mask - it was wrong all along
but only triggered a crash with recent firmware. This should be queued
for v7.4 and backported to stable branches.

The second adds the ethernet nodes for the sa8255p SoC and enables them
for the Ride platform.

This series is rebased on top of v7.4-rc1 with the necessary EMAC
changes already upstream. It depends on the series adding base support
for sa8255p and the SGMII PHY series that's pending on the list but has
been positively reviewed. Links are in the b4 tracking part.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Fix node extension ordering
- Move hard-wired serdes phy references to the gearvm .dtsi
- Rebase on top of v7.4-rc1 and v3 of Shawn's series reworking the dts
  layout for lemans
- Adjust dt nodes for dropped power-domain-names property
- Drop patch 2/3 in favor of overwriting the compatible property for
  the sa8255p variant
- Link to v1: https://patch.msgid.link/20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: lemans: fix iommus SID mask for ethernet nodes
      arm64: dts: qcom: lemans-sa8255p: add ethernet nodes

 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  30 ++++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 207 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             |   4 +-
 3 files changed, 239 insertions(+), 2 deletions(-)
---
base-commit: bc71431221f5ba8bb33918399552636e059c2c45
change-id: 20261022-sa8255p-emac-dts-dbc521421276
prerequisite-message-id: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
prerequisite-patch-id: dc952656b431f0bf8e2411ee14f50e7884cabfa1
prerequisite-patch-id: 27868f2a4c4ab6fcc455b250f3cda1cf1c7801c9
prerequisite-patch-id: cbdb11686213f2fd1c6542194976468ca9fe3ae6
prerequisite-patch-id: a7c4d89544f217b2cf75c5350b838d55a066fa1b
prerequisite-patch-id: 7391f02c4b57ae6afb088fae3150ea215bfa594c
prerequisite-patch-id: e6683111e3daed49ad3edd4ed960fb1c47959056
prerequisite-message-id: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>
prerequisite-patch-id: 9d06b06a2f6c91c7d71b965b8c7fcb33d5e2bcdc
prerequisite-patch-id: 0a76ec6a2e4431d679f4918b3d469c9644dd660f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

