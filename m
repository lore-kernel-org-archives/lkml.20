Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487900;
	b=1jt+VvMurJFZ/510di9oVtdWa0Jge0Z0+ryh+B6kTGROyvLa7vG48Ww+M+tErJBOOj4o
	 OTyzR9BO0nf4BSvWZJQId+1oczfnKOT+rWQ5ps2TCctt1QQUbgJe5x1ghyqmp1rc4ha1V
	 BH99PcBEOmPVv9vqCI3ETea/oiXgwrWQ/UQ4thtYvF6+x1YLT775hWB1N9ep6LX9xRzeb
	 J11ZpmVdxG3vFnxVtehtCOPfDRzs1ukk6pw6vGgi5tM+uzy4bZov/njvyk0A9xm7hfeRp
	 27IEqurEv9LtussdENRmiyzVN0Y/tNSmzdpngnj3VrB8BBjVYnIJUQv4POJulDR65yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6Gj36U0uXPVABj8Go0TllSZedfwbAaqUcG4kVbOMuKg=;
	b=P1PwwpWGdxkc6BNEi6IXoqT0BStQ+GkqCcxRCOknoyBTWipLuNPsUjRrsnv+N3ZMBhj4
	 Jdo3ccByHFjYqVYSQvbtMjntFuCGgjguRxBaMtBal1SS203OkV1n28G6bt1Ls4HAqP0IK
	 k9HFIWAULnF3iWx9UCrtcIpBuNsXEbgs/HZyrxxUhUXmrimaZKUfD1Nbr2Xb2dMnHBNww
	 voK2cOmhRAf9KzNUIrj9z8ewGrb92qsUS6qtE+rJKdFMLriEZTbCXgtiurwUzU2NpM1c4
	 Gf8u2B6VH+ddGZUVwBEXwD2HvjJn9wcS6SQMK2+oCcNi6sPWUrcHruYMSxYbxlR3nkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=buXJgF7K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hjd5h4QC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1BE606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F1BE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=buXJgF7K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hjd5h4QC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8s1fA4149474
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6Gj36U0uXPVABj8Go0TllS
	ZedfwbAaqUcG4kVbOMuKg=; b=buXJgF7Kz/zYMtt2WgRhslnSLGQMYRLX4x9Y4a
	bv3LNUz9xPEOIIWU/lwzM555gshcvEe5Sf0U4ttzdVuqAy6YGYj6ZcXS59EYXp4x
	q3hV9VpMP2EsVNd7JwwhVtYdBBIz8/7g+c7khtCA+QoB2tAP8xfKIoEAPRSDZZD1
	RT98zr7htkP7SKpDhtbo9IAT6fc/NOJJJfI1pE1anvAUthZGwMT2rwHm0EVAArTc
	Exvnr/rFKrw+cxvbuh9Q/DpEqEEGHxatwn0WKdWYWvOgpR7Q4Bc1IrP28mPHgjmO
	/oTEifSoSzjea/Y2/+10ejvcyTRXkKscVQ9BwL+s17cV7RYQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc63f2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:51:38 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-716e54d027dso4883738eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487898; x=1795092698; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Gj36U0uXPVABj8Go0TllSZedfwbAaqUcG4kVbOMuKg=;
        b=Hjd5h4QCEk1LIrKFmJTbXHKoJpskhlvON7xMjyjLoptlIGPshuMu2ytWZKNm7QbU+C
         NGq+Wphc6ja62CEIROCFRXtpq4F4Ym1qI9JUUNHvpVldl21wwHWmt5KwxfIjez51JXTi
         /o4779TjX1NyjHMBlLe3UyU5zG3oftivA+/4vLHBOoGMcsBHbdRP8cBSbI14i9t7Oj4M
         pZ/TVDapaosb7/Qzp9W3JMxHPG+lZnadc3nTJ6jpxPV6RLcus0noeeDI/2O+4D6Vrfba
         bugFTLtTz+oZ8HrciEzDuxr/0iHnPKG6vWxfCHgFzp/sv9ygkbckfLPdjlxZCihqZiSz
         SNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487898; x=1795092698;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Gj36U0uXPVABj8Go0TllSZedfwbAaqUcG4kVbOMuKg=;
        b=T0vW87LXJhC1sJ1iih1GvzzVGtM3zXrCfdoK8uvWAyxN7E5TvB459vk4nzUSa9Tjvv
         omjg1umZ052nm4KZK0ITcpFRtayVCvT1hbEUdTJwfveZBKSiN/bjU0jpRPUtzwigA8Yf
         8FRFtrVU92ygdNTJ4crxJXVvRVUGjDhE0MsekSklNxyYxKzB+KGSCDys4h6vl+DDKYJQ
         oyFDtVq1LgrC5/96YDJ9Z4u+htSb7xAvwpfh83O2uy49K2+DON2rn6c8XNKbTmTW2M9p
         pdDDfxIn5IkJV0ujHdxiHKY40/ciIESZ7Vdx/3wn3WdAr819p7dHAvK+DW4/WvBP9WEN
         Nwwg==
X-Forwarded-Encrypted: i=1; AL+hErHd1tT5Fmzfwmb7AgqRWmHZw4BrAKCm6Aqb92eCd+/QpNOotzTTZ7v3IuXTBqIjUF9ACXm46BCs+YXGcvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8t+ScL54Lfk+gc1j6A9ink6JLNR+3y7CQT+AXwon+ryKZejNLB
	JZUmyU/EK9FzQHnuoVgqF5wFxAqptI9Kw2Yo/OkhfogBKCeeECsP8qfpdZAtEXtH4a6pI9evfb6
	5B8O5yGTEDKe99r9aJuN4jAOGimN6EwuZ93JOnedM7raKOI7/RoABseAQ0ZSN2rDNrH4=
X-Gm-Gg: AYBFou0wQOG+110SAXYjmKSBvz6DYesBDVmmwA/+rANinhFbMoHyKejGvW8jR80v72c
	PMhJ7zRrGoM2tQwUk0OvH+qgHQWJePwD4JROIkSM8kQB8GG9w1MW57xuensrDJrlRBRFivUnv8U
	vWVnI8L87rRO59h/VlHgCAcjrvsrztgJFZvMdWVcCc83QnyzkE18funqOnRzmMpXJJBEKspbzqm
	N/MDqN6SP3OaET1Gu76U2XFLSN9BGmsfuJp12qt4EtPTtqyRgAQkkKDqAciaAk4iISb0Nv9ylz4
	0kEH2/wEXLImZiKJcHvhpMv5epBMhd93aofl7nggBGF8Z6B6QZAo6Y9P2wE/v8tVvY7kzUxuygq
	ONs5ou1aOqMCt+D/zWIWyiBMatIHMlQLYU2orYCfKeK4xghZXpjmSISCunyAg6STiuLCQ7/zmvK
	MEN43w5w==
X-Received: by 2002:a05:6820:f002:b0:703:34cb:a3ad with SMTP id 006d021491bc7-719175f2695mr3473695eaf.10.1794487897716;
        Thu, 12 Nov 2026 04:51:37 -0800 (PST)
X-Received: by 2002:a05:6820:f002:b0:703:34cb:a3ad with SMTP id 006d021491bc7-719175f2695mr3473674eaf.10.1794487897025;
        Thu, 12 Nov 2026 04:51:37 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbc7eecsm7608191a34.15.2026.11.12.04.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:51:36 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Shikra: Fix qce configuration
Date: Thu, 12 Nov 2026 18:21:06 +0530
Message-Id: <20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADq29WoC/3WNyw6CMBBFf4XM2pK28tKV/2EIKe0oVaDSAaIh/
 LsF124mOTf3nlmA0FskOEcLeJwtWdcHkIcIdKP6OzJrAoPkMhOcZ4wa+/SqGjRWN/tmMud1fky
 T/KQMhNHLY4h34bX8MU31A/W4WbZGY2l0/rN/nMXW+yufBeOsUDpNTCHQ1MnFEcXDpFrtui4OB
 8p1Xb/ssTjwxQAAAA==
X-Change-ID: 20261006-shikra_qce_fix-270b735479ad
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: Jxky-J4pju7K3tq93FbxRkA29bRZP2OF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX3JDWYI5Y72ky
 Qnb1djEfjnboKiWTsQmS+fjq0HjjKnVyAetqfEDH0okYBsTkXBnfiwRlhKfnLv3OTDMwqH2BWSZ
 OJfjNE9vbkjaAuc9lRWdMrjYyb5uHdp6HyNDyG1k60Zbw7HLh8iU53/xiSsmVQSDfHQUibrMauP
 NuhL1NxHBtvFvTt5A/MBahBZo7rkC0j7elrMdJUcNAQkcHRB8eWpBMfwFL1HH33ZDFg2BUW73yt
 X4E0v+b2kgANzbGfWHHtmtp+C/Ah2oegIgY1HFyycXjo1Tl9Wq9ExIxxACDL3YvpTxoxj8RmuXF
 JUWtMsC15MhsqLnI8+Pv6nYFO7pJN7YMk6FCIJ/YnMIDDI/LbYTeTcdrGSTPb3pfDn0smMSptkv
 xMVrdKiQPgHNySbpN0SFjANVZAnDWsumwnxpHuGoOsutzX3yEPWjy8+LxsWABlBCLd0du9j6pCF
 NqXLb8KaBEEHXgx0xgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX9W+TfOcyiWuc
 sZJU8uLhUY98pIZF2+bIHFivxIvfOFGo1I9YO121nruo5Fgy5FoN3hxpoXgEJXzuJ9CBvoagnnn
 mZx40MtXb2mavap7TAIH21+fOIkdTPU=
X-Proofpoint-GUID: Jxky-J4pju7K3tq93FbxRkA29bRZP2OF
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5b65a cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=FNyBlpCuAAAA:8
 a=J1Y8HTJGAAAA:8 a=JAuPaQ-8la7bmygXtKwA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=FO4_E8m0qiDe52t0p3_H:22 a=RlW-AWeGUCXs_Nkyno-6:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120051

This patch series fixes QCE on Shikra and targetted for v7.4.

Shikra require explicit clock which is omitted with current binding
description.
Also, one more reason to update shikra-QCE is, clk-smd-rpm was doing proxy
voting and crypto was consuming it. With proxy vote removal, qce need to
vote for it's own clocks explicitly which is already being done for
agatti target. Adapt same mechanism to Shikra QCE too.

The current qce configuration will still work but this one is more
appropriately describing the hardware.

Validations:
- Qce probe and kcapi_convenience.sh tests.
- Correct clk_summary output as prepare_count and enable_count are 0.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v2:
- Update commit message on Konrad and Krzysztof comments.
- Link to v1: https://patch.msgid.link/20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com

To: Bartosz Golaszewski <brgl@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
To: "David S. Miller" <davem@davemloft.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-crypto@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

---
Kuldeep Singh (2):
      dt-bindings: crypto: Correct Shikra QCE compatible hierarchy
      arm64: dts: qcom: shikra: Correct QCE node configuration

 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 arch/arm64/boot/dts/qcom/shikra.dtsi                   | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261006-shikra_qce_fix-270b735479ad

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

