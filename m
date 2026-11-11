Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393909;
	b=Iaj4x5lZP56H+jZF7gdFq9TdhKaaEUSKIwSY9pYmqk0Dlieo5vOgPOJyjbGC5RWwDQIP
	 84u6eMslR12eOvY5glCCvqmzcJ2+4LbL1VnHrmDR3RW4moB9HSUjlgO6A3AaMg2RLGcY3
	 DVJCozQ97fbN+AgfGs1U+TCyIbu8MhUL6JbvynTiCPiyK40u221sglsEUFn+Iv0/458zi
	 t/rDshs5aXs7kTWO5s0TjWkPjTsQvPk1H1nqwuzgTaPfext4bdyH9XQvuHxsY+Z7VrAHd
	 74Qp5fK+vlRi7nsRMk/bUQrLap865JObLiOB8BcDuwXQruevCrhDInanDcqCZIBm1zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9xckWntLtPBXChvC8KkNXf4ZIxz17Bx8i1y3aPLu/wA=;
	b=LuazE2dS3nRZSJLiGIe001+XYeeIuCFw4+ZVD1b7w3vqFDO8vs5qKxJtbujNX90oJygg
	 Y2Czbqk2q9Nxs7YNQyeA5MhG9HakAfac+Cijh4Rpa9bu8GhzlfLgGWtwMk8cR1+WN0m9S
	 4QxTqzgSjfpjJjkBTW4NF/W8wXORv6xD/srFI0hbszQOo/epudgKB3sf1Lz7FWyhW4FcU
	 RwWbdhFYPXgHDmxcoxbZQALdh3PyogUEY5y4b5DnfspJNJGXWRhjFJWiycaJ5CsmMKHpI
	 cp9JXTJ8D4G4DpEwCRg8fDOK5RSqtjySPFQAwsHYPfkJ38MV2hng0Ry+KYJpdbkSmiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MV+hzpEf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03B0606A31C;
	Wed, 11 Nov 2026 10:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F03B0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MV+hzpEf
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KgXd300708;
	Wed, 11 Nov 2026 10:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9xckWntLtPBXChvC8KkNXf4ZIxz17Bx8i1y
	3aPLu/wA=; b=MV+hzpEf+VWq5wpBEVP6pFFm0EPqmGoMrj45E31psfy9B5zxIMp
	OGMqBXkRxGoe/WYcKIoM3H8zWDEcQRaRdGEVpCRXDXVG8bKIGK/nPdWbaBqkYSt1
	wHFlOvQg1e14dwMCPXXhyOU3l8semkaMMY2iyI+qZ4+erflvJ/VeZ4Bs1+X28z6g
	XBMc36yE/f5PWTdEnTZYlz23jgXvQvcpuE26EfBXLg5nqATWDaHSx3c6h8JTSJZf
	UvxDr8assee0ndWNX/Qdp9lFCbLSc/iSXzNDl3h/ylC2XLqh2VUDli3l8iR7gZ3t
	WptyniDX7kR+aApzPJasxDC7MU5G9qlnRAg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5kva6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:44:51 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAilvo010139;
	Wed, 11 Nov 2026 10:44:47 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-vnama-hyd.qualcomm.com [10.147.248.182])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6ABAilh2010118
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:44:47 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 4857718)
	id 46A6B21BD5; Wed, 11 Nov 2026 16:14:46 +0530 (+0530)
From: naidu nama <naidu.nama@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, irlied@gmail.com, simona@ffwll.ch
Cc: naidu nama <naidu.nama@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_mkuntuma@quicinc.com,
        mahadevan.p@oss.qualcomm.com, saurabh.anand@oss.qualcomm.com
Subject: [PATCH v2 0/3] drm/msm/dp, phy: qcom: improve DP Type-C reconnect handli
Date: Wed, 11 Nov 2026 16:13:52 +0530
Message-ID: <20261111104434.2222182-1-naidu.nama@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MiBTYWx0ZWRfXz5LsY1xb2smF
 j2anW7XsSauJYRZybrsZEu/nMlKE6OwOI4qInJ1J7aCQvCyk/QRCwxkum9hjBR7Oo8H+tcrP6mI
 KwUB6yMTRZxxUEY73KO3Cs1zry+5fOauu9Am97BZVI1yg7qYqu1hOsmKzuNIbco/r0JPhkm2EeB
 Nn9iokn0it/mWh0dMLxHvuEFnLpKCACNdF87vC14Z1EhkQLlxg1yAmI3etvGg7LRsWDUhvP7g4b
 G/gVTjQysmX2D6PBBa8Ggk37GYio/Dt0gDeDesq38J/OmT0QRhPgqD+rQ+qlxMMz7vnlc8rckeu
 yjw9fOlXmzNiIQt84ymmKnapoKYyVsq7CBvH32AmNPF1XEeOi5/sw3zh8RkmWngnXABfOYoHaSe
 SQ+w/FUe9UwYpPhdBQ2s/OiePdWU5DNE4zVCg0ecepkQAbEf5Lbi/nipNXsLizvMRxP3+PfF9Yu
 zeK8ikA9W1C+O+bKGrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MiBTYWx0ZWRfX4euQOkRxa8d3
 xnX515gWhyNARtO3Qo9vmaerpjBBzUnizbcux2X8HOm51vaJIDNDtbrtL0gAHrcdF567eidpQrd
 7D+dYzYPI7Rvfzn/x1tCL87Tu1F9MBE=
X-Proofpoint-ORIG-GUID: NjKxz3PNQvW7dVwhiBCMDDZ3StqvjKQO
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af44723 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=85QYPmTt-SYTKnqdTZEA:9
X-Proofpoint-GUID: NjKxz3PNQvW7dVwhiBCMDDZ3StqvjKQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1011
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110042


This series improves the Qualcomm DP Type-C bring-up and reconnect paths
by handling PHY initialization races and link-training corner cases more
consistently.

The fixes cover races and link-training corner cases in the Qualcomm DP
Type-C path. They prevent Type-C mux switching while the DP PHY is still
initializing, avoid unnecessary retraining after a successful link train,
and keep the downgrade retry path running across transient AUX disconnects 
when the cable is still plugged.

Together these changes make DP reconnect and orientation-switch
handling more robust.

---

[v2]

- Updated the commit message [Konrad, Dmitry]
- Handled the force_link_train varibale usage [Konrad]
- Handled the plugged field from struct msm_dp_ctrl,
  by passing  the current dp->plugged value as a function argument [Dmitry]
- Dropped the drm/msm/dp: skip LTTPR init when no LTTPRs are present[Konrad, Dmitry]

---

Saurabh Anand (3):
  phy: qcom: qmp-combo: delay Type-C mux switch while DP PHY is
    initializing
  drm/msm/dp: Remove redundant force_link_train flag
  drm/msm/dp: continue link training downgrade when cable is still
    plugged

 drivers/gpu/drm/msm/dp/dp_ctrl.c          | 20 ++++++++++----------
 drivers/gpu/drm/msm/dp/dp_ctrl.h          |  7 +++----
 drivers/gpu/drm/msm/dp/dp_display.c       | 11 ++++-------
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c |  3 ++-
 4 files changed, 19 insertions(+), 22 deletions(-)

-- 
2.43.0

