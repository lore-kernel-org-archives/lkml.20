Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500133;
	b=JdA0PgRpDC1umADnKdq8hmND9KgVLEo7fQKZOQB8KbiYLZvHT73R1KNj/pJ5VIfWbi1j
	 8e8Os8SAPmfP8AE7elGeBxFv/A/mNNpm2oNMmCz6OMB0J6/wsp4/k4UWeiV/NStgSP3fz
	 raLkO4VyDZiwkqwhipNzm8tCwVtoxW499V/AZpF3g1gX1N/cdxHAJCxSA6+zo40k1MzMv
	 qidmTjB1Z7G38Tb9ECdOdEBtyccxsWsKUa1X12T6FJXwcKWJGX/2/qkdjUgkWbth7pwZZ
	 kx2iehjUoCLWzkDzMo7QRsVjYaEf21AgSARVs66pFxgHO8S4fJQD+IWOSvtz8fccGKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MoD3amaMD5SRK1apB8zScNP8aTosIbfh13l6OfNFYjY=;
	b=qqit0+Ls3HwRnjPpXe7pNw6Xf3JMxTaB9nx7SFlB0grLuU/sV+dpf5vsaAqMQ381VQfe
	 ITi5LPDIw2E9EipyRj9w9r0f8yxBLIYcGGd5Fy48qIW/NOBySx+a0KHJERs+7eGssGRa3
	 0yusyUiGRvQ7cG+GQagao+LwpT2kIlb2G7LyAqVtSRZIfYzOROqXfEVDc+kRRnEYZZyJO
	 oHdxKSTUkY+x1hiEtMMs9hLDjyxSIJZhpjsFkwR79qb9UVOIUINpD95JEZX7HfwmCcpnO
	 9jHOL04L5fI0DpI4H+67dutgHzXqeW/66nQw/4j+CapzubwGExLobStIH330/Zg3bNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J3R4a6ZM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FnnEetM+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2068D606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2068D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J3R4a6ZM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FnnEetM+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZWe41159658
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MoD3amaMD5SRK1apB8zScN
	P8aTosIbfh13l6OfNFYjY=; b=J3R4a6ZMj9y35oGr3vxJ0o7+JDRjkVzo3S2Byl
	QPwYQVtR0x8FBKbThceAZewe9LIIDjxxwrQdGiFfHws+9OZxBJxX6TuFmIpXvhJo
	u2k2s4wznKOj35Gpzrl4+dx8UDWvG/98h7dqYDvYBQlW9bPz6FpcyWgN9Ly6vXHO
	DC1xR6wt2/bmKPIXfqm9IfCLA6003FtXzmlx2nLzR46TJNMhKTmXVFhR5nhey2v0
	ure6+5PtmG4jozQNtcr3lBJDcalx77JtpbTjg9aX7fwWgqMzOCpO+SF0OqFqghB7
	CTeg6uda7adazv7ahD91KQTZx7SCCLn8tWCHgM8wZLghPjKQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a09uu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc36b97a77so1028561137.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794500131; x=1795104931; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MoD3amaMD5SRK1apB8zScNP8aTosIbfh13l6OfNFYjY=;
        b=FnnEetM+QMyLlM3+7aiK0NnoRzJ4dSSSJ/TO8sSt3YwzjBc3IpKmXsoYqAChcuL5IX
         qacLjbW7yLxgn5gro10EgIToeL80zWVmaNS2ICxMfPyIhjx2pxubkQbm+FlbuzPJYOwQ
         weybcXyw9zVylfnI3oG32qVGyQ0EkKbQP8oUe5JVrYCxlP39i3q/zy+KL9x2WCfiYjVb
         RUGS98rKp48Kj5frEM8sGUjL/ImXILAx++CvetMxybwOG5W7R9n2jaWJ/cy3Nyg9Lv7C
         GwrGnne5SJAL4Vm0Zs5Pl9rcH4e7A+lWpZdvoPU1qe0UTaOHrInPchzc4J7k69kVd/M0
         Ixew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500131; x=1795104931;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MoD3amaMD5SRK1apB8zScNP8aTosIbfh13l6OfNFYjY=;
        b=j63LNFujMKufEJpYinTf1fTyA2cww1DnDQE1FT2bRuv/jgCcpzIEFnpwZQ0T1irqcB
         2TdQQWPMzlIm7+XNFcOqn4zbtT7Y7xsswehyI5lnipPT2JB4asyVoGq5mz5DZ2S/N7ur
         UYMl4Spafg5JHFqDeGoLJcRFvW6zXs9E3n7jnomY344nlo8NpEhMFKxQrOh8EadgGCC9
         IsnqnrhuDoazKYsS6rAQzwh4aBCNLHfloYYbBxcqNQT8Tvq+BlTRiyjumX2k9xRQD7IG
         026Ia5bffbfpcyPtQxMNuFpEfWY9Fm9kitCBAjjZ1nZhmoDn8Ouo+0Pyle1t3By1XcZB
         mgnQ==
X-Forwarded-Encrypted: i=1; AL+hErFQpD757Hfv9zoKXEr4Yfro3BlHamlP3Mi2ZZblCxqaxi72eq/FqnRfgbNNRv6NTUkLM2Zzphj43gl3DDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z92VQ58dTdHQDqXHd+7/Q7o1LBwGX3Ft+FnTQhJd65pqpItOITp
	WWUlAgH2KpSztd4qMfk/RSS8u3D+QbJL/WzNyMTuNSXZ2/oG2olZw7nKHOvQwY0iwVvLtyJInTD
	yysxy6/UdoRSOiqQo15VEVNrC58t97d21RqJ3x0mooGU2OsbW25DpNiVEUoJ8jYKwCt7By+EXIq
	E=
X-Gm-Gg: AYBFou1JX2V70bFcqhKXLd/QYwOjzb2XktMd5CiaijeoNbES0JAOHivmmjykg8JRu7A
	QWIGM1Uz+74OJHpnOXLUMqpAfSY2DsufI5wYA0l04yDDrrpmQaoKVlKfyygimFqh605Kdyzi1+W
	Cit3s8XzYRH9LoHH/hdn/4lPWUgAI95QZGQ8KKdlNUu+H8tmCvL7dBZrJSEDGqOUR7dcULMcQ54
	r6qxOZKDuB95KWBcM5NrDAb8EZJ67rvNpPA8Xd0F9AP+OCiToRVI/cQNXPkbte7eMychFYqr7Ft
	mKDwoYkqCUMSj1FYCuCEhHLcjFkuvc9Ry9tKVXiI6FIRnvbOXiW1CVT7TidYGVlWu7EDvWu7EkG
	629LpU0YM5oUi+Fo1dQkDnDweqodJV9CsfFG7+bjitnleBF7HctVAs5RrirR44VJGKQHeUhfAUJ
	oQjiRTl6Y28G1Aj7dZ8erx+M+n8+mwAD/ipJZeojnXhnz9dPk9dsnHKs0/TcKJ/YQqczyPhhKEv
	hHgW8OpPjoZt1qR3tgE76NPxA8=
X-Received: by 2002:a05:6102:4457:b0:7d0:9587:1b90 with SMTP id ada2fe7eead31-7d4fb2bf05bmr1915962137.13.1794500131184;
        Thu, 12 Nov 2026 08:15:31 -0800 (PST)
X-Received: by 2002:a05:6102:4457:b0:7d0:9587:1b90 with SMTP id ada2fe7eead31-7d4fb2bf05bmr1915955137.13.1794500130657;
        Thu, 12 Nov 2026 08:15:30 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:a91e:6b1:bddc:2951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm125874045e9.1.2026.11.12.08.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:15:29 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/2] media: qcom: iris: venc: fix encoder crop handling
Date: Thu, 12 Nov 2026 17:15:27 +0100
Message-Id: <20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAB/m9WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3cyizGLdtMyKVCBpZmhskGZkkJyYZqkE1FBQlAqWAKqPjq2tBQD
 Incq8XAAAAA==
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
X-Proofpoint-GUID: o2NKWSrAx9iyE8CZ7xcMyJzoWhMzsZR3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX13a/QpgAeWkX
 6437KkhWzRgEznxtQLBkLzQ8aB3xtQfWD3NRHnjsYG+yY0ntj1uleE6h4qTUVPiFWhUBoiCiM65
 b72YXdgcGtBuZ9fjeHrwt6OirvE1VGKGCvWa01t3wxALXDRkBCmeaSVuNPTs6CqfbP3QPLqZ0aX
 ll2f4JdKGFgBz3UOhx8KlsvXJvLwycuewTnYIYMTuPPLKWpRzZVBohw9+UNVmsxTYiQjyUBxvwB
 LbIp8T7vTAUjBOT/T6BxUv2ibxrl0GX6RJPbaiX7DF5rW596PzwELCUqglmv4ZHeplhysLV8xZd
 cPlUSIUGVmrc7tp7E03ZvQ5ricwrF6Ete17x3Z+bUJmuizPd/N0snjdoIidrgzuOzmVsQNuY+kf
 7nOj00peW6YQFwyS74rI+rQaIsPB8YH5Jy3qXZpAOyLtIu2gHqt/jrWJH6g5PmHvPdSAG44QaNm
 zjaT+8XpZAbSejb9ZIw==
X-Proofpoint-ORIG-GUID: o2NKWSrAx9iyE8CZ7xcMyJzoWhMzsZR3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX0IhXKEmK5wvx
 OcFRUAW9S1OdYn1paaWL9lDnp0AldZ3ZQiZwHPBotuS9QW4MG3KoZYGavikLmsd24bMx8RepE5U
 vnlOaTMOd3mhmBaQX+QetlmxyRmpYrg=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5e623 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=aBm2fhwrLcIJbTaFzjEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120064

The encoder keeps the source resolution in two places. inst->fmt_src holds
the padded buffer geometry reported to userspace, with width aligned to 128
and height to 32. enc_raw_width and enc_raw_height hold the visible
resolution sent to the firmware.

inst->crop belongs to the second space, because iris_hfi_gen2_set_crop_offsets()
computes the offsets as enc_raw_* minus crop. Both patches fix a place where
the padded size was used instead.

Patch 1 seeds inst->crop and fmt_dst from the visible size. Before, a plain
1280x720 session ended up with crop.height 736 and a bottom offset of
0xfffffff0. fmt_dst now also carries the codec alignment on every path, so
the CAPTURE queue keeps reporting the coded size.

Patch 2 bounds the S_SELECTION rectangle by the visible size, so userspace
can no longer select a crop larger than the frame it submits and silently
get an empty bitstream.

Tested on QCS8300 with v4l2-ctl and ffmpeg.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (2):
      media: qcom: iris: venc: keep the crop rectangle in visible resolution space
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

