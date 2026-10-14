Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ED23CB2FA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978380; cv=none; b=PU3cDh3PTLCEco/VFHV5FaffgsmqfOKs0Ayp0SSF5RC8p/f3EXexbsRjzq6MmrwmRrmNhdHrRVgXAkjtb04iNWz+VrTknxcy4aabxNyKJd1c6OFY6TGy1ZEyCNTuYWiXlGQCubq2Q7iPPUO7zJQKUn6RApXFsVR8QG+4qpxrlZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978380; c=relaxed/simple;
	bh=8Pp5oJDmOL4JM4z0Jh/UW7XEJxhURLStR5ptB0mvof4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AeBd3vKyZsPDiPhEfe7jmmITeysMgrPyGmKo8e6OOHEqWCWfbdFkr+fs4fK+Oam6sXBV6QvEdp1HWd2hYxkRkCGj71kiBF9+sTloamdo4mtBG9//xD7D/Y2+4Bx0euVW0cKkQ04GBGfSkjd/3nrdGzqznkkJ5UnWALMwP8pyNSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bol+zxBN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KWcDmKU/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bol+zxBN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KWcDmKU/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EARDJX466354
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N+TA2LvYoXOn6u71jJtCsY
	3J0IH3AUlqNik1qhbjkus=; b=Bol+zxBNia+E0sIg2mYT3CdgkXrKoLLdbGb5ze
	UbnKWLi5/2JMNYPZrel1ikAKpsjBbiErMXJCgXlDTYBE+uoeUQ8tV9YcKOrtTovk
	rqopCu9f0VcXssuxelvN5v+hJIY/j/zQcKq/eaivmRTDZEka2578q9MrIVc+Z5lK
	f/r0uEQZfGVY+/ASFUZrqik5C9VehsTQGPgYolB/9AdbJAdiI7+WlCEwToXk2LJP
	B9RbczzeigDI6FFSJ+GHp9o+j52Okkx66WVidz/pSIAkCrOkYO2qsd7mxbos4Rpl
	+tEYQgJ7GeGIx/R7gjhfHWSkDpLXF9AYgOLJ74LVG6EvGAlQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80cr8xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:46:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso6638390a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791978377; x=1792583177; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N+TA2LvYoXOn6u71jJtCsY3J0IH3AUlqNik1qhbjkus=;
        b=KWcDmKU/OkffzsswjH8AJkfMujxuFOWGQKhtGWLpLT6qlEesmdeXvEHY78bgijAqEf
         8P1TGN6YPwrwYc+qT+U55YaOjQJKrjSGYIqaAcKd+qzdfzf6mXbo3HQJ/STqTYqBtoQJ
         hOFy9+rJU7s1DDiuKA0qnvAXi9paIjxT889q8EU9fz59UpGScYMUUi8QjjMPq5seF4y5
         tUCoI8xv1DyjFRmWWa+ERcGnwEPX8dM/Dbd438csYPdUOxkhLl1h0Zm88cbWK7cUKVSv
         XGlBId13d8ell9OOybdv0ZWqSDl/JV7zL1xsCjkWiz2/xJuoRFaYpXuauBskkdwfhlER
         39eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978377; x=1792583177;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N+TA2LvYoXOn6u71jJtCsY3J0IH3AUlqNik1qhbjkus=;
        b=oWzQurhs4O/7fPsgnUERJ9hFsPq4EQMRbFB7bS5aDhDEVDvXWL57WOUeFvl63+fhjl
         +XoBwuNrRsFdmaYVNDfWrvNQ+s/k9SpXYdxItNhjvPQtOg502a83KY7QkuxAfcVorMP5
         LPa89/CUeTD5mWBxWBCciZPHxi/awKVJPlnmyJVLth4o3caMDUF7tgWSG0wbJtARtl8x
         hpUFPpTgL0MUiDTc2TRcwHKcy/9CQinvm/Tqt2WEYMJW1eXsbQwIrWYUR4C7OBnuzVCp
         JXhQeG5XLNZpGNMmZ0EwmCH3dGBx/MjZzOze7fW1WCCX5Ly6e/g+FpeKxHqJQX2oBf9i
         taOA==
X-Forwarded-Encrypted: i=1; AKwUvBz/8e6reZc0zwHtOaNtLrsq6V46LupRJW42cJRAbdxty4A9zk3ZEpGFeasH2eGVUFrvSpplAqqkpnforng=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjY4jF95nB6Vy11XA+jEk9I/En1X4YIiuB178gue0bg26RiTMn
	Bf79oYgWvCk3N9eXLIOXOQpjpdfyXCXFlQPlhqmcyDuioFAVPiFMyGZ2BiPiwXdveUl6KiYnHW9
	DLDgYegHqOMonTHxYvEQn+eyDpospb7IZrgO2FI5AQYe/LEVZcu21dAcatYAxsDMi+M4=
X-Gm-Gg: AYBFou35bHRnF9ysv4GIg1QueaAco0pXCPt0D0sWUIOynwp9QJgEUv/USdKczKBZcdW
	R+Av/eemxYcA9gs9OFqIi5NLhxPKs43JW48BahT+dbY2rbWJvosWnVo1uN9r+WOYI4xve2+MJUB
	Fk/p1b8vMjA8H6jC5ve/tDKuPpuM9H80ht2GACS4h7XG67MST0lzpbG1NRt8uVw9FVoIQfbotdP
	ZCxrOl4evxmJ+O9Sglph50TOoxFcUbqmX0DWdu6hv98NJo+zopwPzyZDu9F0MwVxcoYrflmuVSL
	BWkCoE5zecBIjRgrorAkQMrJL4MrLQczgOQbnqTI1M1pAuytJccDaIlOfck738UcvE1wQhJXk0A
	0tc7ClxLqbVyV+nMIUaIv13cShApkxqK7kqw8
X-Received: by 2002:a17:90b:2743:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3ab3acf0275mr14219348a91.62.1791978376600;
        Wed, 14 Oct 2026 04:46:16 -0700 (PDT)
X-Received: by 2002:a17:90b:2743:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3ab3acf0275mr14219296a91.62.1791978375399;
        Wed, 14 Oct 2026 04:46:15 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6009d94esm4219151a91.8.2026.10.14.04.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:46:14 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add binding and driver for Nord SoCCP
Date: Wed, 14 Oct 2026 17:16:08 +0530
Message-Id: <20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIBrz2oC/x3MMQqAMAxA0atIZgttFVGvIiKxiZqlSioiiHe3O
 L7h/wcSq3CCvnhA+ZIke8zwZQFhw7iyEcoGb33jrG1N2kM4JlK5WCc6Z4kkcTVIrnKItceuhhw
 fyovc/3gY3/cDsje4omgAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NiBTYWx0ZWRfX1awAs6ENdHJx
 4ngTpIxqZETlLULgKQg0iM4pcrm2Uh1Kraalh7kenD8A3Szidy2sfNtmcH+tiMfg4s/lRQ//sJn
 2DWKhW6o6KpTkau1XZ9KDQ9rWre1Pvw=
X-Proofpoint-GUID: jsqkZdWtGtV-PH_F54lVN21US7qJ3qAF
X-Proofpoint-ORIG-GUID: jsqkZdWtGtV-PH_F54lVN21US7qJ3qAF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NiBTYWx0ZWRfX31LavC7AGBgX
 G2DS6lLaRxJdyeCJx87cBz8fR37RaqNH8NpdsNd+D27l1o8nCv77vpQ4p23B7T0HgcPTIPBiDHT
 s3fJtjxtDGd8razH7HTBAWphvSMUSwLz4gIkOj5nDGfz12A4ByWr1INxuVt8Q6hQH6Kq6iEWBRm
 iZz6BxTiDpc6GmG92srof0WVZVM/HYqo9rLvJxTbi1dH3mToV9XjoUm3um33pNDVcuq2jWsjk+k
 8xOBagZxtk8ZIb42L3IUhb/KQxxphnTgptDi3nEippHcqKUCMxVVRtzW0NLek9QH1dcHVyONTfg
 EnUETM0TzuYZplz8fQtbgbAESUIMIXGasMW9w5MdifVJDKF2aHD94H4Aos11b76YLkpBj2TAyBg
 5EKQ/NHQgkclE+U9eX3OPljP5/h0rM0fKy3rEH/shjDXa7WJuyChrlOzqrP9cTeaWtHqPMzZsbM
 aZAgZVTQiDcJCD0Sxbw==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf6b89 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=UK07lOcsehyZGIaRmRAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140046

This series adds System on Chip Control Processor (SOCCP) remoteproc
support for the Nord platform. SOCCP is a dedicated control processor
that handles hardware fencing for display and other use cases on
Nord-based devices, sharing interrupts, SMP2P states, power domains,
and clock with Kaanapali SoCCP. However, its firmware ships without
a separate SoCCP devicetree image. It therefore takes a single
firmware-name and memory-region, and cannot use the Kaanapali
compatible as fallback.

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: shengchao.guo@oss.qualcomm.com
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Changes in v2:
- Amend the commit for remoteproc driver support to add Nord specific usecase of SoCCP.(Shawn, Konrad)
- Add the information regarding only single firmware for SoCCP and no seperate device tree image.(Konrad)
- Collected Reviewed-by tags from Shawn and Rob
- Link to v1: https://lore.kernel.org/all/20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com

---
---
Anurag Pateriya (2):
      dt-bindings: remoteproc: qcom,kaanapali-soccp-pas: Add Nord SoCCP
      remoteproc: qcom_q6v5_pas: Add remoteproc support for SOCCP on Nord

 .../remoteproc/qcom,kaanapali-soccp-pas.yaml         | 20 ++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                   | 15 +++++++++++++++
 2 files changed, 35 insertions(+)
---
base-commit: 0312234a60912d65819167631115e39c7e8f9621
change-id: 20261008-soccp_driver_dtbinding-ad131aa42a94

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

