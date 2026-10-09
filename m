Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C7A3F329A;
	Fri,  9 Oct 2026 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545159; cv=none; b=j1vaq5+hDpmGlLm90IJDP577qzoJ9PrJsfvNVggCeTbqAkNIAXDJG+re0i4L7m2DzMoHi+NoVdg/SjUxuNwC4zPLKwVnFOZ5xF7+GJCJ1fmCWfYj3VbverGyTvFot6/zXlaU1MYy0j0Bf1QSiJuldAw0TTwYgBTiyayH84xPN5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545159; c=relaxed/simple;
	bh=JKJIxTyryZxcLfwAq/m3TqMiI88ySXek90Fko7fZZtw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gJUjoEReAMUmEEvyMnLPKiFrWdtlhxrVMgqDD8B6/DLoZlTpoGL6p5330hQHIq5XfYuqcdRBync17CRyNeKg2Hwu0596XoWUPkzpBRsc8/nLfdRSE+XvECB1Ea2ziAqO3mBR/bphMAZGbU1UmrmA+mOiEsEZxl8mlnc2KxWSCzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VK+3IeMw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VK+3IeMw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KNem1223206;
	Fri, 9 Oct 2026 11:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6FbwaaY3OzfD2u8g/JqvJW9gPG/pdQ6vN2b
	cOgBjsYU=; b=VK+3IeMwy9/sU2kRNR5hmGEvnczThZJ44JeTOjIXkQRC4HpKRXq
	y4zYo2cpplhyM556pxnlGManL8iEYzY/qVv3IS3fLIZmw1/mSzk/7o1NW1XdFKoZ
	/q0ZKIo1JhWGhVzNNSZJ5neTZDDMQzBZJV3aOLZXTYHn6JXPlJikj9ykph7WIcTU
	xuL+AmN4fR3d7N9rCuOnnzQnNpcEPN1YVGyEmjkXJZVPQlNxy1EmmHWR7m66IJ9d
	INVKJoHdWu3+Zqiq29JHx6jY+8SoeoYK9ewhFsuTVpbuU6ZSVpIfsi5XnM8aKg5b
	UlvsqT0bb6eCw9OpnR/na6lrCwRa5d8nmgw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkb7y9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 11:25:41 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 699BHNcr1842464;
	Fri, 9 Oct 2026 11:17:23 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 699BHNWc1842444
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 11:17:23 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 260D0643; Fri,  9 Oct 2026 16:47:22 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v2 0/2] This series resends the self-contained ASoC changes from the earlier Hawi/Maili LPASS audio submission.
Date: Fri,  9 Oct 2026 16:47:17 +0530
Message-Id: <20261009111719.2609060-1-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 7-FdOoUlA3lXPT779lG4nV22CP2CGvdA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NSBTYWx0ZWRfX0i+2vILuxxBl
 +vd9Nr/QxcNLH/P9b1mGJ4kt4az6DstdB6mDuEqRVh/ZsVAyqf2XQQGW8d8RA1bf0qsZbRdqgn8
 iCJ3P4WGJYDLgBwwQPQETijrLvemiLU=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8cf35 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VQ4Fj_RYcp3dFWGW_loA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NSBTYWx0ZWRfX/QkcgR2hYrCF
 tXV/vbVs10UzdbG4NZXWSo1ST0XNHVvw30u1eo8SjvTrX6XUVXkK9RI7nWzBswT1v+jrfb5i6EB
 l6REUHfbfSfhmzjcws6FgvYZEtNeSEbkM+rmbSGqZYf1PHUbgU9D3UrpvaXc3X8XldMWUDUvn6Y
 mzF2YQQSWX6Qe2o6m+keZpC7zJdFJg2nGDhWUW4YoLGLeRBTkMpMt3vasGfArtvKlCpVL5xGXHX
 hiEZleKdNXAg1GUDOAJ0ABiqtsWXWqSbmKvAAxxLmG4soIMIyg8iTuzQ2ileOXle5NJs/AeVXHp
 9p/R4lFHTA9BWUNTXLNZcJz0yK8D2ARKNHOvKnLLh6bjpnfh9mSBK1NhD2sWckq/445xw1f1Zz9
 f4kFxamfoVVvfF7rWqS1dT3q03/xIY1JrRBCQX5ghOlixdpLMpEQLVxP5NXl8a33nxryyJc1ewD
 0Eak6HZSp9OYSX8QElA==
X-Proofpoint-ORIG-GUID: 7-FdOoUlA3lXPT779lG4nV22CP2CGvdA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090045

Hi,

The original v1 series included bindings, devicetree and defconfig changes
which either depend on other LPASS macro/platform updates or need to be
handled with the corresponding platform enablement. Keep this revision scoped
to the two ASoC changes which are independent and can be reviewed/applied
separately.

The October 6 subset was incorrectly posted as v1. This v2 supersedes that
posting and keeps the revision history tied to the original September 23 v1
series.

Previous submissions:
v1:
  https://lore.kernel.org/all/20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com/
incorrectly-numbered subset:
  https://lore.kernel.org/all/20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com/

---
Changes in v2:
- Correct the revision number. These patches were previously posted as part
  of the September 23 v1 Hawi/Maili audio series; the October 6 subset was
  incorrectly labelled v1.
- Drop the Maili LPASS macro binding and Hawi/Maili DTS patches from this
  series because they depend on other platform/audio changes still being
  reviewed.
- Drop the arm64 defconfig patch from this series. That patch belongs with
  the Hawi/Maili platform enablement and needs a separate rationale if it is
  reposted.
- Keep only the two independent ASoC patches.

Prasad Kumpatla (2):
  ASoC: codecs: wsa885x: Reset registers on teardown for B2B playback
  ASoC: qcom: sc8280xp: add Maili sound card configuration

 sound/soc/codecs/wsa885x.c | 11 ++++++++++-
 sound/soc/qcom/sc8280xp.c  | 11 ++++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)

-- 
2.34.1

