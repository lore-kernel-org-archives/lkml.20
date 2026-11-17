Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912423;
	b=SrDLIRFUlIKP0V1Kvpw+QHfCRwUXm+RFDHSmaKeamF/BbbUylU0u5n8jSB2lde5ZjkVM
	 IDgT0XbL6e27a4x6eWgHCmDcC924FsvpqeMmnBZOKY1WIwZ3yja1yOLc6smCD5GMUQZgq
	 O+DDpvKQqyYqb0hFEt1iSBKe9luQMRwpky5dTuSIv4EeKLf4CpW5LqzcAdbFIR0SljJMh
	 gFUlUBahpp3sCnmJ9tj3pR3xfmhfe2u/WoAx1xb1S5WLeLCyGQJw3gZl2ZOts0AdTyoTL
	 DwOI/niVbANfGVwAYiguaTSLmkUVoI672m2wL9X+Rmazf99kkD9CW+PeKL89rIQ64fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912423;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uYL+xaY4hV/1UMxJp2d9t91I9IYKL5/jAE9Bd3NZqbU=;
	b=RzRjdkXySJZu5pNmA8yhLqaIITgPQvYSmvDFGKf9F6HytE/FYKHCMIbklp+OfKPtqAAl
	 B5NTphpxzuy6wL3f/HziW0hjvGT5cGlmFlvC3yChMZBMbx50WsCIBdGizdSh22nazju+z
	 QN2H8VhEA2v9rluTna3CMa2q03opvxbzzEqZA0YXacFwhRNdiCo67spOVJHEnevKVUGBM
	 ZyqCHPGHCi1Xocn3JK57dO8RsyfbKglnfogeI0GcfNWzbJ+OVMpwcNOxUL5l/1dEiR4Rj
	 ot03xrD4JURRsh4EFelGua1JhV1W5LOTkB96dtD+tm9I1wZiSsUFmaCHcRDUdL0043Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vo5et05o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hf1SpDpy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52C3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D52C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vo5et05o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hf1SpDpy
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHAdZ4I1279183
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uYL+xaY4hV/1UMxJp2d9t9
	1I9IYKL5/jAE9Bd3NZqbU=; b=Vo5et05owaX8ecTItyigeSXs+aB8jlAu7PgVvi
	vo8xEy12C+cQDNP1OHQJm5+nQEBiwZUSiYvCXohuSLld5/0/HiXHrWdrDEAjlKmP
	4uIVbXAnP5GZjhHIK+itCYbCJzlx+QNWMxyMnTRMeyQZ0kR4Q9jBWv0z4xaxUGAo
	7g/TU8nm9r8Kjx9TE5WnIt8Oort49Hg3J7CkkVdO1LhJuHRfZUTqcIcqAhchD06/
	39GFDogk4L73CFdJxkJKCd4UalK41yJ391/bSyBlmmWPQKp2udrfGy36w0td4VI8
	gCu5GX+3nmafT4KeJV7CsgS3z1ZdmBrJmXIhVWHMItPB/MPg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc800va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:47:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-920f8fe046aso19012706d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794912421; x=1795517221; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uYL+xaY4hV/1UMxJp2d9t91I9IYKL5/jAE9Bd3NZqbU=;
        b=Hf1SpDpy90yyI0M2DfNEunruOcKwnyb86mV+6VXil9rzsTn6N7ruCbaDo2DMUEArR2
         yJXhprW/R6PQnlNvTYEx7BhDML7SCDIlFwj5RNQ0jLVW7JFWaz+t3i5bwU2Wrvc3/KD3
         NCLKH/rdgwpA9EQIhbwztO/BNx09THdfurHCtSircXh8ZoxFg7qCJgAVwHp51h/f4uQQ
         eMcVMPcrVlb+ZLM4bt3SWsoVF4tCQnuU29pxbXJJj2YMnl/GrG0/n3dR6X+YyINv/ZD+
         w7+gVRn3k8QyMMPGkHHV3dPfSjbD1leC6IiaHBZcpPZTiU/gS+jbXXldhnTJ0gcktwq+
         gaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912421; x=1795517221;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uYL+xaY4hV/1UMxJp2d9t91I9IYKL5/jAE9Bd3NZqbU=;
        b=IdQzPdYhyCIsmcIHNkSKFG5dQmDbHD/4YjMc89owHcvO5WXfuA6ELEYgC4pMPaB4LY
         6RQJxKX7TP7mO5qOuHfLJhW6tYD1Brj80po/idnkhjR+QWzBhQx3KTFnjaP8sI1+O384
         T3f0KI3jplut9oRnslE/znNTPjnBUgVMxw2BOsHdwel6hL3MZpwhSKhVtZkoAchH//Es
         41a+ehd6paTOXO5Qoyd+HLFObEo4BFPQOv/QPOcPdJDK7MqmAQkBlq1ROuYDHpYwGUMJ
         /1B2Wux5ajIfEQhRw9x3YWIR7Ljvjl4UjA9cfHrvBMsX5DRrKihlDdE9AABlQKMxKaWE
         2lJA==
X-Forwarded-Encrypted: i=1; AL+hErFnXS6Pwi6IfVIog1t8U4pwBzGTMZk9LePwHGyZF0EBu2hwaLn1gFnsRjF/QHbtrH7JHoAWWhWi0ppvJ54=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uxQTDhSKP5kW3gwFwyU0k8VgumMXsVmvOyA9/78xWwSG6yOe1
	OIbXtxr0Tjp2VR9Na/fO1zuhEMNOCMVmJYoqFtBk/a8SBjyf883V2yApQcoL1obwTstLaTk55Yh
	eYByYlI9OopcVBK+c1C0wpNX3ePs9gziRVL5JYzgghNKKvMAp0BwwM/YCo1/Otqk3Fu0=
X-Gm-Gg: AYBFou3ZVTqgr/EI8uSHDrokvtVk5QYvWwlMAzbipfZuF9+vBjEjF0Gmo2Dad0SjcTa
	EDtcai/frQ3z4HwgWEujWJAaSMSLXVPiOVJm/fr28jjcDrrQd38SH1FDAPS6vdGxyyxNaWXccUP
	rHy7vLyLtg/R+TighWCFvNKk2kWXB/3wxXmO95/9HZ94Q/8pF3phJVocT84P/4M0IBLDFGwjTIM
	P6fSCC+SrpAGg7DduGrydUw5m7CibVpFLXAvKSbAaljVqRqW2qjJJVTlo5EoIKlz0NLxdfPyvUZ
	xH/JyF8JIv/3X31gwKUomDUYY+GhxDh8lBlzMCb0p9378+CiE1lCSJdGuZlh5u7dWFK1ayMegOi
	ytd5Kv+fYaQXd6LT4gVnX9ViIV20twG2ioCDKgeoUhEkhcROddipHgpnf7G5lqFCE8Vjw+Ns8TC
	zrSa8bC1DLvF+LI3XdWdgMqKw4Pmqv9bDy19jVSlrXrNH1LszoIh+WbQZ7vnzlKrguVhrmYt2RG
	vGrMLXmekv3Oje7x8aEIo8zH7c=
X-Received: by 2002:a05:620a:8908:b0:93f:47fa:b722 with SMTP id af79cd13be357-9494bb858b5mr1943342685a.13.1794912420971;
        Tue, 17 Nov 2026 02:47:00 -0800 (PST)
X-Received: by 2002:a05:620a:8908:b0:93f:47fa:b722 with SMTP id af79cd13be357-9494bb858b5mr1943340485a.13.1794912420486;
        Tue, 17 Nov 2026 02:47:00 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm119178335e9.5.2026.11.17.02.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:46:59 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: qcom: iris: venc: fix encoder crop handling
Date: Tue, 17 Nov 2026 11:46:52 +0100
Message-Id: <20261117-iris-fixes-v2-0-0b21201ab137@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJ0w/GoC/22MTQ6CMBCFr0JmbUk7BBRX3sOwqLWVSYRiRxsN6
 d0dWbt5yff+VmCfyDMcqxWSz8QUZwHcVeBGO9+8oqswoMbOGIOKErEK9PainWl0QO1s6EEGS/J
 bIP3zIDwSP2P6bN/Z/Ny/N9korRAv+7Z3jcNDe4rM9eNl7y5OUy0CQynlC3FktO6rAAAA
X-Change-ID: 20261112-iris-fixes-f6130f20caf9
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc30a6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nME5e6IxvZJL9Xz_aiAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfXzCLTdK8Pr7Od
 Kw2h1wbOxLLotV4HNVe7Q3Q/F6/Ool64RQtB/STErpe0x0SgKMAEm8U8J8xzNmjKD3h4Z5hWcn/
 rWVKdpYYiyffJGXAYDM73g6QeUrroIs=
X-Proofpoint-GUID: f2BqczMDJlwi2ANtd5NFGs0TfoXqJacd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX2ATOsFSZUVxk
 rPp2oyAyXycqV73RA9fYwc2As7pNrRHBlGVIminOfl/q6pIM0fn3J3LNIQpS82V46tzsYeQRX/0
 BqORAbz5eezKkRwPwVtPZQ6HV2BmHAm8eoOVDqkWWREnMTOU/w11C9dwARzEbl21XLqrWc3HKTl
 tyyXnB0Ner9GStmFHIkTSC9Q5WcVDM/b9KD77h3X+Lue+dev4bFvb3Kxij/YRWNVi1mSqft9BWT
 v8ECckLcPQDaiGHDnzJeDJhjmlkaNWxNuQBehU52mYj7hK3aKnI5fWTbD6ZeGjv3JbFP2mmzqry
 +3BTUGEfK79eYNqxFyg2Xk/6VNjS8cPJUc5pupeYHpJvUvWGOX+9mrPTSVxCdhiqoqn0tNRuSaN
 94mo6168DgRKonNTHAx0v4gqU7w9WbQjYOlBJ/p0+yqjwgjelA1/E7rgbGMo3PjG/F79Wg4U/dd
 QHUTx/MfjC2OWVsMShA==
X-Proofpoint-ORIG-GUID: f2BqczMDJlwi2ANtd5NFGs0TfoXqJacd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170042

The encoder keeps the source resolution in two places. inst->fmt_src holds
the padded buffer geometry reported to userspace, with width aligned to 128
and height to 32. enc_raw_width and enc_raw_height hold the visible
resolution sent to the firmware.

inst->crop and inst->enc_scale_* belong to the second space, because
iris_hfi_gen2_set_crop_offsets() computes the offsets as enc_raw_* minus
crop. Each patch fixes a place where the padded size was used instead.

Patch 1 seeds inst->crop from the visible size. Before, a plain 1280x720
session ended up with crop.height 736 and a bottom offset of 0xfffffff0.

Patch 2 compares the requested coded size against the visible resolution,
so a plain 1280x720 session is no longer taken for a 736 -> 720 downscale.
fmt_dst now also carries the codec alignment on every path, so the CAPTURE
queue keeps reporting the coded size.

Patch 3 bounds the S_SELECTION rectangle by the visible size, so userspace
can no longer select a crop larger than the frame it submits and silently
get an empty bitstream.

Tested on QCS8300 with v4l2-ctl and ffmpeg.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- Split the crop fix and the scaling fix into two separate patches, as
  suggested by Bryan.
- Trim the commit message of the crop patch, the HFI offset computation is
  enough to explain the bug.
- Link to v1: https://lore.kernel.org/r/20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com

---
Loic Poulain (3):
      media: qcom: iris: venc: keep the crop rectangle in visible resolution space
      media: qcom: iris: venc: detect scaling against the visible resolution
      media: qcom: iris: venc: reject encoder crop rectangles larger than the source

 drivers/media/platform/qcom/iris/iris_venc.c | 24 ++++++++++++++----------
 drivers/media/platform/qcom/iris/iris_vidc.c |  4 ++--
 2 files changed, 16 insertions(+), 12 deletions(-)
---
base-commit: e726cf08ee6ba7e8b852c77760f12c59f90f1338
change-id: 20261112-iris-fixes-f6130f20caf9

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

