Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC32E286425
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326015; cv=none; b=I/6Z9xmVmmk9TQHCRX4D+SXxRGwwdawQvAoO67iQN6a96rRmFnD4/NBd1jkwEAWOaGXscbGDMHH65PIzgumYoFMv55w6ddYM3tIJ5jcidX43yECwKh7R23Z/6hSXDUOX9brs+pxzhTce2jEbEAhuq55C2XPIV6W0LWKig9ffZ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326015; c=relaxed/simple;
	bh=SDLAqJU6hsXEIAGdaMzzyy+lvvs5/IK3BK9h2abrj4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=krKo54zsJqBEH8WkwfJ2n9sUj+x/sfrci2aR8Ad3niKDUmz7hACCfvD++4Vf2Cw4lYXYh3Y4ZYKIPBR1y+YVK0j7hMBAq33+3yxR5LkvIghAVqw7yYIlOmikHUJw1tu7fI4pjkAozXdQ/IjZe5fMuq/UGh4jEjGgdSklmjKaSOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRzH6uzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCcyZeTQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRzH6uzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCcyZeTQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z4Go4103238
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GJDnY4MLzHgxp33EP8yQnhHOBbNaUsNxsx1
	NqZiY4vw=; b=DRzH6uzng1YWnxG7YzVd5pkw4ae9YC9HIQifu7l/CqSksO2ljEU
	e4D3kqCvbV8n/kKqnk81aDFoLUscTI8EwU7Dqg23pheeC14EtzplfgSwGcciWKWn
	2zn+KWrxe5GFxKNzqjCx4kOtoazbVhOOWwlnnNkAtbveP566PXMX80tZnLUqkuEp
	0La+GbCNevm12kOLiNQoGwyk2mCjT/dJ/ibbQdO6/RiLX14qcQgicjEOhbT8SK7w
	gA9ysad6DsTGB7AjAEraLdZcC+/Byj7hmO/dXXaswd6ndWu/c0/OyuQaZCUFgvm7
	+mQ2Gm4wKdu6YYtRZy9gmw7rtLowsO7JDEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8ujeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0c7126e7so120731785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326007; x=1790930807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJDnY4MLzHgxp33EP8yQnhHOBbNaUsNxsx1NqZiY4vw=;
        b=eCcyZeTQ9pE+1SB2/DjmNoVbIt4Wr/ndfasWYxlIWXzCm13MjNDSbgXH2WQJWjkgF+
         U8K+9UOopZYPNPvjUXuGWhXjXtj6UnlHIoRqH7uX+G4G5aKQ921olnCd8MAZp6Tv0Akb
         xxGzOZzEluEwt5E9hHe5XOYGmJxapnFTt0QrxAiC9bkli6SZbqC70EyW7xgHL0xarpSI
         gxZTsO16o1VAw/JZh80eEeUGYr0opl9DzDmqXpAvKPzDCm3MErjPp7NhqNA/nUIJPmlt
         dLdV5APuyP6nOxZwy0IJOWm/FVaPvDfVOCVprMl7i5pDwIirqkNBSgTsHnLgxdBWxNji
         xw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326007; x=1790930807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJDnY4MLzHgxp33EP8yQnhHOBbNaUsNxsx1NqZiY4vw=;
        b=FlLutdJKK00iVZPMCJRli/P+himW8vUz0pUWCsLsTuACvwS087vmu81DEbu9d2LqNT
         yDUGTzMK0mV0pUP3WdL14Gcd9MKl5jpXpMXK3bAxtKOOtGCZf+AKP+/UGzcF3oZFjJcE
         m9ptCcxD5Fjx74SnVJbLKuE357suagmUcLmPuBOtovXb56QuYbvzknq2F38hSzTZXq0T
         DJpCCFTptN6AZ52qBHQ7ydH6D7FFIsyM6HcprZm/Avxp7nn3gQEJUVmYHsrg1YwjSDUx
         aNvq4L7a3dbhtknmYFvf5+V2l2bwDrdzdQa4ChyggoNo7tmlDPo368mmKsbWBvkWXpKr
         xDJA==
X-Forwarded-Encrypted: i=1; AKwUvBy3zmcklOVIopzZ45GO+FzBZQ+XLBmIoayHKwiEcOeWixOtZvDHKIXDa2ArHtB4cHQt6afG4ZPHHKwOEFg=@vger.kernel.org
X-Gm-Message-State: AFuF++nyQttWLKBestmvO6peiOalc9cSQZ5RrzU2JfTq04lkcoZf1WUX
	syV6TE7TxjMlPh/+rQyfts+6nuqZS5k4Y8Wzm1z3GIZoT3BqYmHiG7jvBmdyRddfyrOMLOHNKBF
	5hrSq6R33wwGo885l5/NGQ6IkQZTeNXotLA6IMt6NpSNlILggPBIwfTV5MDNnyHZlgRg=
X-Gm-Gg: AYBFou21Yv2J6cS50pYh5+im9UpjhhuUBqXUNN/ymLD2WAPT8AC1FRp+6CRrRWEmAYP
	XpU2AqHAp5azFA3zkON/lb3ioDl2zcB65XbuPzL0fVkohPSddikZey/SiRgfNjylkNwjEiUpTbR
	IpofV2xAFl0i4Nl3NVzU0DQ6mwJPZ9RmgZYrL45niJiUFctgcDJZAp8ZbvTLsMkggkzG1M9NSnN
	iNmGbo/W3eD3qnqhVfCuy3aspkRbk1gHPBR67iaKdxPcuhocjep29pn5wYTY/SeSH8W4AjZxGEv
	M04nC8HvD9a10Gt/VKVoLeedriGgSZo33SFDSsmZ38CM7Enyu4Vylds8SxfBWaR0O3PJa9cym8M
	Os7IoucVVa+ov
X-Received: by 2002:a05:620a:4887:b0:937:6832:1f04 with SMTP id af79cd13be357-93c43cd6560mr337817485a.34.1790326006963;
        Fri, 25 Sep 2026 01:46:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4887:b0:937:6832:1f04 with SMTP id af79cd13be357-93c43cd6560mr337813685a.34.1790326006499;
        Fri, 25 Sep 2026 01:46:46 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add LPASS clock controllers for Glymur
Date: Fri, 25 Sep 2026 09:46:31 +0100
Message-ID: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX+B6U1FGBam+Q
 rYb3LQGklKe1OOJHOVmxWCxodjItbNibXJjKedrZGKN+vz9Du103atzI4FaJu9MiT2a3riBycF7
 O5DiIUoshBRpynHg4TcAUFphxZrq4P4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX+yc48EmK00qk
 Ed33noAx3zhv+LBJVKZRD562gyCaTwco97PLkoF8/80JVSxv74kH9koYj0IIj0JhMFRZz9Z+JM1
 8hs0lOw9Ia0nP6QVzqCTkCbaHvEp/pOluwnJTEtwhqqedLXHMvSxijFD9upYU84icHLZvUdw15C
 72BUZH/qfnLEr9e/yvhYncDqZJLUPCiU+Mmj1JY0ZMofCPnlOTiIXIh8axWlGQSt8i6rxAneYG7
 9wRHAbaRmFClwORxQSTBxJJBZLTIgLUA2iZ3TzQYuOT0QVNiAavpt7ag3oDT8xx6Z3SHxFhHA0F
 fW3OHgRNxhhhtizWOUbThL7mLNbp4DWr6XYVUY3LeC969zk0Cu/IVX5HbY2hRwYeGBsU2a7ubbv
 BQutpOJUrK9Sm3RhiFIk+3SL05U2/kWISX5ClF3WednVHEfoaMPqZOe21k1KpZI/DrmAEpko7KI
 8pVpLYJudyNVBumvS4A==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab634f7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qxLtA1zAx_OvAWKx6QUA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: tnD0eEBUAwS_QgccWzXq4i5wZDNUmUIw
X-Proofpoint-ORIG-GUID: tnD0eEBUAwS_QgccWzXq4i5wZDNUmUIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250034

This series adds the two LPASS clock controllers found on Glymur:
LPASS Audio CC (SoundWire RX and WSA1..4 resets) and LPASS CC (the TX
SoundWire reset).  Q6DSP owns most LPASS clocks via Q6PRM, so only
resets are exposed here -- enough for the LPASS audio macros and the
SoundWire compute-mode controller to leave reset.

Changes in v2:
- 3/4: drop <linux/mod_devicetable.h> and <linux/of.h>, switch probe
       to device_get_match_data(), lower-case reset offsets (Taniya)
- 3/4, 4/4: pick up Reviewed-by from Abel

Srinivas Kandagatla (4):
  dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
  dt-bindings: clock: Add LPASSCC and reset controller for Glymur
  clk: qcom: Add lpass audio clock controller driver for Glymur
  clk: qcom: Add lpass clock controller driver for Glymur

 .../bindings/clock/qcom,glymur-lpasscc.yaml   | 60 +++++++++++++
 drivers/clk/qcom/Kconfig                      | 11 +++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-glymur.c             | 89 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 19 ++++
 5 files changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h


base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
-- 
2.53.0

