Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8A843A809
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752552; cv=none; b=aKpRelnUKzk6mQT9Qjp0gm91+uH6mE9ciHjPsNj2lZsq4ooSd+eD0FzXqYHBQ7cglszXBCIiJQv5W4jedb3/UW7tGdQejd+JOcg001CALoezotAisSziQlRDr1PbeP6aPfqbNgkPd5+dkgP643Hpi7zc+uocvR15NgVLsMI8wjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752552; c=relaxed/simple;
	bh=5wPjaxtMp1EHMGKTxlI06Ij5iAmSt2E0j+sKRMrOd5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hTXdblVymSKn97MrE90BqoXubBDZLNl0mfEyG6TckkmTv46/mL51N8KczIfTBozIP3gIfbDPwB+0ifOV4+lAEFOdZ9rQ1ESL8btHjdYVe5F8Rq5/lTZOmkpZtxnMe6zGdwAmpMGGWiWw70zxn6f56ZOG0mh4NmKqeyG46qJPrko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UrBvDCsE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBNf9ji5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UrBvDCsE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBNf9ji5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCKNQ374952
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UQO1dGe3cg8EAKayarH9DjqZHYpySqBTnoI
	XACsELTw=; b=UrBvDCsEQlaa8965zjpCp7JLorVgE23f6gC/PYVNep7GlZCGFiS
	2KkMw4aba9FsBzQ0aFqGODeJgwY56b1cXrYbZpNB9/+CE4RThAN6/x1NqOCb5WQV
	9KdCCoSzWZfEC920A1qhlIa8andQPtGGmLRtMawXT3zKnI7l2xeT1SLbMZHPTlJp
	wvVD8vBftmx3tWt+Z9uCqFBudz9Bq088x5ur+ZW08GvpxipnNfMBHwJsdRJ5hR0R
	n4lEJQCyl0fKFcefLlVpw9nUku7JKB5NTQ76WmJBCxvM+2Tya5EmVuTuqW89Vd/w
	9cbm5fAgo6WjogcUA4y/bg5sSIiOjEjt32g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smxa413-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:55:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2373849a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787752549; x=1788357349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQO1dGe3cg8EAKayarH9DjqZHYpySqBTnoIXACsELTw=;
        b=aBNf9ji5KzFtrGbela8yqVOI3JJU8HBJNVy0pkZuZAsewQktqgMXDPvRP4qJYP6mFd
         6Ip5c6Nto49IW/FcgmTP7cA7Prkpmud2+Px9TidfMTWESb6Nbuf1+FBJDePSSzXhe51X
         dFDzAgt8wfElasHU4+sF34UlXjVGV5/FghAAwKhETUXNk/ZnT2hPIOrb0uI3lIuuUwru
         k7/VPDnZYcLbdpCWPkkaHSuSy92/h6b6NqdglrM+QGFx/Hiki1D1qxWsR5CNZNbKjYaC
         YXZQIRMjwEC2MzxM3VswTpkKCE6YrX7uuQ2+YFng2doQcbUVy+C2FhiqG+DskUru5g6g
         zWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752549; x=1788357349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQO1dGe3cg8EAKayarH9DjqZHYpySqBTnoIXACsELTw=;
        b=rLbOXqswkE0Vc8Xab8H4kpl7g7Op5BAPjALeFH2zIM3XAXN/9er5JZrUZoZqPdCs2g
         WoQ75pf5Q3W+sFPaJnQiLJw6AWcQ6Yce0lwe+4ldV9O0rx0pqjhEY2yR4dXMheRfc1ZA
         6KsM8qPJ58aVPbkREr4MXZUvfENitN2br30YSmKkT9RH3KZ6iRVnfw0zWVagRBnWSXSe
         DSnE8iQVMvasU9s2iaynfoBJEr1uKG5eDDBelPWi1lB5AWZIsKAIvAXct+MeHDfS6OUv
         EVCKS+AJIBUFxt6uVaJMf/AsEmTSXn1EibpOLga0mzzwTjvn+YIYqJTsjyp+Dm9ZHcQo
         CNfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmAlLOo3VKfn7j9DRip1mfDzESF+LDEX0VutZUqEQYTPdS9Ir45m5B4LivA9JJ5ml9JAyeECfTrquvvWI=@vger.kernel.org
X-Gm-Message-State: AFuF++lvSm7INisGQVcuYZ/ooPFiVyKCx6ehFNGJzWnilRI+WuIP7UC4
	rl2kBrcnISf59/zVzB35bvG0LuYILYGDpODXGdj8tF2qV2ZMfaxRfB2NXbxtw0SpqxANbdZcp2G
	yaprojX/X/NcJYV+34BlYyIDfWh6fcYchoD/rfP/g8AcQxB7QdFUn8mHSBxv81tKn59k=
X-Gm-Gg: AR+sD11tQVmPS/cJsV3jgHrlLDjyoOzpoezjNPSyC5oIRjfe6Oeq7uqCI2gF+k144NJ
	u4AacfGdfKCr5Xccu6UhCO8Vrt0O6zdIigfgEBC0UXzgKZQqorSJBkoxcoPd+Z2J0Imqoic/XV3
	XwodTqr+wMmJztv6XSJinyrrZBBUi6pAdXZpvRa98XVJIirTtO8iwUD55XPqLM+3uWRSs8/kTTn
	tvxeCm9m71mOZ751CUbJNeBWOehcMM+W1/lCI+6IE4dsHs5NoqtCXN8+UES4VARhqgeD8VUz9J3
	yRf+Ef9CwIJz2S9QyK/b5FU6Uw9sWPTUoIq7KFpHN99iswR+FhvZTeP53Lf2VbiJHRqg58eBaAK
	yGMtg1xR6aYcjWo3C4GePUfXcjbOgwQf08QOLSpaJhrZ3eFm59SIlajvUhZ8H
X-Received: by 2002:a17:90a:d2cb:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-3966d36df78mr15645246a91.2.1787752548208;
        Wed, 26 Aug 2026 06:55:48 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cb:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-3966d36df78mr15644505a91.2.1787752544964;
        Wed, 26 Aug 2026 06:55:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a573a1sm4347911a91.14.2026.08.26.06.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:55:44 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add NMXC power domain for Nord SoC
Date: Wed, 26 Aug 2026 21:54:52 +0800
Message-ID: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ef065 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Y7D3pg133TmPf0Y34y0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: DVIumA50ip_hQTAHaImSAfolrwwnPwK1
X-Proofpoint-ORIG-GUID: DVIumA50ip_hQTAHaImSAfolrwwnPwK1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfX9Sfw91rZBndl
 c8bpTikti0tgROqvlHz90blm80gfMQ95CqEdNnrOP2Hw9SZqghsdJxVfxLRRacYY/pKc4LpvkiS
 +duWOG4Fw3d1AbKFih/5uUw48FyCmGfa/nTlGZ33h+IjTt9TBJ7o9t4FV+GbR7D05do3poyORmb
 NTNRgKzVne0AddqmIg8LljS8jDpI3BQX6QNbwRrIO/lFVU2In4Ho3FZmJ46zy7HwYLvgUkGN+oq
 JXFkltnNKzAqmDSffvogac+Itc5I81pvY2/0zaohwNYVQZSGSKND9xHFWgKCDo5BpofyPR6qhDP
 ZQPVO02bdWAx/iIEH+NIOXHgveenPGCAjCRHJkbDbCS30Iult07CcJVdxoVZBHFY+7sE5pR/ySP
 hyDmJURPt1vMDlPyKYgDi0phL3BhFEa20How0Ft41cb04yUsFpoPbrT1eDY6mI/hBZJ9niYr5AK
 +8+isX1lsWb90YGbwPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfX2p1UYCzur409
 ur4sBWhufDJWi+kq5Psak0VmqGfLUW9+r0W3jH/IZ/EV5+1up9lk0GTI0KVGkc5WpFBXKemJgnz
 bZ7inbDxIUNIr424h17FazBqT67XO5c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260115

The Nord CDSP subsystems do not take their memory rail from the shared
MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
resource. Add the nmxc.lvl RPMh resource and register it in the Nord
power domain table.

Changes for v2:
- Drop remoteproc changes since "mx" of remoteproc is just the name of
  memory rail input which can be wired up to NMXC power domain in DT
- Link to v1: https://lore.kernel.org/all/20260826102746.633076-1-shengchao.guo@oss.qualcomm.com/

Anurag Pateriya (2):
  dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
  pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord

 drivers/pmdomain/qcom/rpmhpd.c          | 6 ++++++
 include/dt-bindings/power/qcom,rpmhpd.h | 1 +
 2 files changed, 7 insertions(+)

-- 
2.43.0

