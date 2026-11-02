Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634802;
	b=qvvaCD7HriaMXmdwmiTTujiwHl/YO0cgEMhld+gHWqlGGn0bFe3mkHUS1jOk7hx50d44
	 AyuEsF3an6qYeGGRNFS6QWIywJYBJszXI3jgHDb88lFZg1zKLl9z+OXN3rSYCT6Hdpi1m
	 cnB7RrRZ2Rc27gIawgyOaLsrXjDmC49BfpSZJ7MjfXnc8qT3VX58iKJpWVg6ClYzKmVyp
	 K9l+xieYlKWaNyzPVahC224Zw02qeGyygfVJlS/FvOJhH1wDgMt3mXLmXvYgQt0vVx/pk
	 7FOKyWfmv/4kWT9cH4W/Tma5NBt0EkOI3/sTNDDILw78nVQtwSn3Fv62wt03kMg92kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/qWuIsy9Gj56WjtqqkQQie+JnbH1V6rNfeXExImKiC4=;
	b=0gLTpwG1EP4QWFlxXPhaTIBmrER1FjCvymcnYGwbgEv34+1EwKKFJQOBAV1ykYk/LV2j
	 Q2hbeUS8JExhA1cxCBL0pmhrPFWB6aiit4Z9hlq39HAnoPd/3Azq0Z6DEChLTbmP1om4G
	 KroVtwD/iJmLq0gl73DGWts+7kzWHa/VNuGSVOdToM3ZMvNTf+goYubFmGLyX/4b9Kg1n
	 6cq5iQRmTCviZiumS3YSdj5ugzRhtMZnDnXsyJM4XFquJRF4K+k+fSGjgz+2fNpEkvM+E
	 HYMrwAQsp6OAHpPXQCypvPL/rPX/szqcEsvGUH3W8KJInHr33ARJmYaQhqwkDSQ28hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XF7mumVj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXVMYW4G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A990607A8A9
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A990607A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XF7mumVj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXVMYW4G
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpLGk3102602
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/qWuIsy9Gj56WjtqqkQQie
	+JnbH1V6rNfeXExImKiC4=; b=XF7mumVjBZzY/Mxx5KQS21z2fuiEeYiiAAY4CL
	tnP66fMI3xfzmjOwZ0rp+puYPyOUTKEGhJMOinKjdJ3kW6Z8gYpTIM7aqkKVe8kJ
	VUnDPLakkcWa6KHY1OKOvWlcD8+IsjBmexX8qcSAXETIxmtUAZNWL1srhUIoPRw5
	f4tqqC9mfZfbCsqGNITkfnjU7tgfvMFV5Ue09eYRH+HE1/rmm22bmMJhyGseH0R2
	bb7oJBH9OA1dDBI6H9qZC4VAkK9qdJ2BC/X+ywx0B2CGgwyBWjjva1oWR+5fI9CC
	cq/IE+PJ1MMTn20vnHN0hgO2FM0UIbO/aOQresCj5Ub6IxWA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rjp2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:53:20 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99062be02ddso392213241.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634799; x=1794239599; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/qWuIsy9Gj56WjtqqkQQie+JnbH1V6rNfeXExImKiC4=;
        b=EXVMYW4GBUE7IECkxt8cWAGhhwV1FcaBpdtbGLlFED/SseflRYesH02LtOlumQlNTC
         +7glJXuku9y3nLXGeoZpD6TC6bWiLrHhJvazzOr22+Ovf0D9xonm3kE01snhj5BFpUqk
         eDCSi+EY6Uz5RHtwod+DFVuzF9k/352UUD23BmsBoXsz9QabwIhmrV16exPlCiloBHA1
         FhOlwUQb/hJZ42lDgXHUsi04so5puBH6L3bJoCu+C879JDvb38UJvOqsKm+GWpY5t209
         4SCNQelxW0hKrtk4A5Rt1bSLEE8Xh2oMfjY7FHqLIqgvmeKLTY4G9GkQDo0DH1rgvQ2y
         jawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634799; x=1794239599;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/qWuIsy9Gj56WjtqqkQQie+JnbH1V6rNfeXExImKiC4=;
        b=GgdQG6y8VsVDPRuhk45zbShhg0B8z1LK1X9RjDYlRL5q9P+5J1+NXETJ3nGDYZ019Z
         JdsdrRrg42Gjn7mUI3LFmBsxnCoYga0WIcXFy5EPiWISyFw2EKPY0keftutlAXIyj4O/
         s1V4Jd33bOi2aEP8eKj7Y56j1a7fXnz13LtAJP3BO5W9Kr8pNv4y9SiFHRXaOJhqpp4Q
         sNKNuIuDR54KzsamdXuK4z4LkX3TsHhqcIXkWpXk0W+0iTvCfW2pzyysyCmZZhE+U4xT
         7dVsyNdQ1WTKRVi1kadvfWRBtc/eWIq0TdfUTbnGsMBjZW9RDnfBiRTybItqs5iPyHr/
         IQ7A==
X-Forwarded-Encrypted: i=1; AKwUvBy0OVfJ1PVurNLVeKLdTYOVrN7Usi+sdWE088utAnJWg+4PEoOSTq7+apxRyg8pjIY+Wd7x3OwrNW/GDzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z99/46dofWcPJGUo0LTCp/TCWWpDa8UgFe8FwJfLaSQj97JyWyt
	gr9Pe1hBNAPmz57QpmapGrS1erhqM+e0LPA7J/rniw9/WFGkWxDx7Ka1RpedUDnIp0PQgzS49sT
	o7LbPoPbXh6OhjovYUm0fx/y3fbzk8R5woHGtW0jSx+I1S0aAOpm8Hf2zXXwK/7fgiS0=
X-Gm-Gg: AYBFou0xdgsR7jgC6HBBLUMdvHbolAGS9Fk4yLKGOQFw/ZggXwl7a/g3QRt6a6i99Of
	mDw32gYiItnXAuVd0Jux+GrF+EoWi3P7UZPu336EDrW6/RoMLxdCsOAyhUeDoGcj+8K1XwpjB+z
	/HTXZDFmVWRF6FIT0VscyVJ2PS0igwt/Ul2d/57rvtL731EoTCc1wQ2nxJPNSIyzm6CoOLb0bE1
	S/oI9lzXWII92RHr3n0iv/5ETu2PaNV2RlDJhxfV9PaOgAq6bdQGP4ReyPlrThd4henB5+gnTYw
	On2GQe5VfNhVnf36ZrXfzvK1xcGymLyoENH/OrWE4YW9tqpD6FMUXR/KME+bdI9O5b4MoXKnFZc
	TeTUC5bHRQap3dlhYDwBhby9HguHmb5c93btnPYDrqSz3pxQBKCymdpa6ay7JsPVXlZt1xIhjdb
	V7eLrVZbyibNeCkkf9onQN5n5SrNk0YJ9TSjBQZobLa4yv7ncJJ7qJF1YAfHvuAUyy/7m+a/0wB
	CJAuWKoVvZl3gy8msTyhq/yQXlX
X-Received: by 2002:a05:6102:5811:b0:7cc:2c29:54f0 with SMTP id ada2fe7eead31-7d072238fbamr3696388137.4.1793634799127;
        Mon, 02 Nov 2026 07:53:19 -0800 (PST)
X-Received: by 2002:a05:6102:5811:b0:7cc:2c29:54f0 with SMTP id ada2fe7eead31-7d072238fbamr3696362137.4.1793634798524;
        Mon, 02 Nov 2026 07:53:18 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:17 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v12 0/9] media: qcom: camss: CAMSS Offline Processing
 Engine support
Date: Mon, 02 Nov 2026 16:47:31 +0100
Message-Id: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJOw6GoC/3XRzW7DIAwH8FeZch4RNhBgp73HtANfWZGakoU22
 lT13ed20hqlywXJSPz42z43NU051ebl6dxMac41lwMVgM9PTdi5w0diOdJFgxw7LlGz4IZaWa4
 jK2Ni0iut+j4FTLGhN+OU+vx1A9/eqe6nMrDjbkrurggUgMqgbBGgA8WA7UsO7VhOe5cPr6XW9
 vPk9qEMQ0vH1d3leizT9y3nLK76r6W4WSWaBePMe+BKoZb026N3DTbLO6KBrxFJiALk2nEBNpo
 NRC0QlGtEEZI0d1H2TtiQNpDujli+HvDcEdJ5C8rboEDABqIXCI10hWhCtPYgIglRxA3ELBCEN
 WIIiRGC6ZwIxvENxC4RsUYsIQRoFQMYb7a2A3ypPPRDC+MMO0QJwIUMfouBPwb4YxgAYnhAKzR
 Yhfa/NV8ulx/4WUGAJgMAAA==
X-Change-ID: 20260427-camss-isp-ope-4b575ffec2ed
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: hfbxJC8xJuDzZT47tht_7zZKzW36494y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX+yxRRoBE4A41
 RNjv27/oBufCHI/cKgHVnQ4mpiUPcVMXiclzbyGIdK+iNyqTjkh1YHF3JMeH0ct4k3kCc59YX7k
 bovy7ZqiGZIu6ekyjPg1BXCxRnJRWzP/j6JEqPobqgcJB3BwYN9kNSH9QbQQ5ssK5NLQc3eFeHH
 AhHbEU8ZpXNd278Bd7BFu6yKQ8MYgldM17YaInh0wFwJbtRy5KRwW/g3UsP4x4pLmix2SmUmT/3
 AF0K9uyYi0L3gCVHNZYMSkaQG6gHfVMRK/IBCXH8Th9mNxYlGXu0/Cv72DVECuaH4rj/D1go6/h
 xGXdp9MbUrPM6kZyUxp2plzYoyaJuonc7yUxKNfpuC1X4zWiyqMT8Sk3urQ6KvczdIKWitSJdxS
 SHHm5XT8THX7LRsL6odWzMZxVY86UYVUFoL6zWz9uI6ACpRrtMTm7gPDZCxTvEDO3ttFQIQGLJy
 8aCSl8/Ug2DRO9Isp0g==
X-Proofpoint-GUID: hfbxJC8xJuDzZT47tht_7zZKzW36494y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX6ZbsAbZbw9WF
 iGQqfMzwZxlYyG4N+6jVXxg18ToZZePcwzK+Ha+BJ4ny0PEQllHTNNiAjWMR032Fc8Bw1+mbXEV
 U9sBF2SdnpQmdXpHr6tJ/KFbS+YKlCc=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8b1f0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=jEnBGcp_S-U7jcHEVloA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

This series introduces support for the Qualcomm CAMSS Offline Processing
Engine (OPE), as found on Agatti-based platforms. Boards such as Arduino
UNO-Q use this SoC family and will benefit from hardware-assisted image
processing enabled by this work.

This represents the first step toward enabling image processing beyond
raw capture on Qualcomm platforms by using hardware blocks for
operations such as debayering, color correction, and scaling.

The OPE sits outside the live capture pipeline. It operates on frames
fetched from system memory and writes processed results back to memory.
Because of this design, the OPE is not tied to any specific capture
interface: frames may come from CAMSS RDI or PIX paths, or from any
other producer capable of providing memory-backed buffers.

The hardware can sustain up to 580 megapixels per second, which is
sufficient to process a 9MPix (4K) stream at 60 fps or to handle
four parallel 2MPix (HD) streams at 60 fps.

The driver is designed to support multiple processing contexts. At
present, however, only a single context is instantiated, which is
created on the first media-pipeline open. This keeps the implementation
simple while ensuring the design is ready for forthcoming multi-context
support at the V4L2/media framework level.

The OPE is a standalone device, independent from the CAMSS device. It
manages its own clocks and power domains (CAMSS GDSC and CX), and does
not require any change to the core CAMSS driver.

Graph:
ope_input ----+
              +--> ope_proc --> ope_disp --> ope_disp_output
ope_params ---+

Compliance: v4l2-compliance has been executed without any error on
the media and video devices.

libcamera: Hans has been leading the userspace work and has submitted
OPE ISP support to libcamera. An implementation is available at:
https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.2

Testing: A camss-isp-m2m tool is available at
https://github.com/loicpoulain/camss-isp-m2m-test
The tool can be used to exercise and stress-test the OPE engine,
as well as to observe performance and latency behavior under
various operating conditions (resolution, format, buf count, etc).

./camss-isp-m2m -s 3840x2160 -n 5

  Name                            Device            Dir       Type
  --------------------------------------------------------------
  ope_input                       /dev/video10      output    video
  ope_params                      /dev/video11      output    meta
  ope_disp_output                 /dev/video12      capture   video
  ope_proc                        /dev/v4l-subdev13  -        subdev
  ope_disp                        /dev/v4l-subdev14  -        subdev

Test: 3840x2160 RGGB -> 3840x2160 NV12  [5 frames]
  Input   /dev/video10  3840x2160 RGGB  bpl=3840  size=8294400
  Output  /dev/video12  3840x2160 NV12  bpl=5760  size=12441600

Buffers:
  /dev/video10    buf[0]  offset=0x00000000  length=8294400   VA=0xffffbcb87000
  /dev/video11    buf[0]  offset=0x00000000  length=12441600  VA=0xffffbbfa9000

Streaming  5 frames...
  seq=0      buf: in=0 out=0   14.833 ms  (67.4 fps)
  seq=1      buf: in=0 out=0   14.874 ms  (67.2 fps)
  seq=2      buf: in=0 out=0   14.902 ms  (67.1 fps)
  seq=3      buf: in=0 out=0   14.960 ms  (66.8 fps)
  seq=4      buf: in=0 out=0   14.896 ms  (67.1 fps)

---
Changes in v12:
- Switch OPE clock handling from pm_clk to the clk_bulk_data API (Nihal)
- Add system sleep PM ops (pm_runtime_force_suspend/resume)
- Update pad ops (set_fmt/get_selection/set_selection) for the new v4l2_subdev_client_info parameter
- Fix probe/remove drvdata ordering to avoid stale drvdata on probe failure
- Update libcamera support branch version (to v2.2)
- Link to v11: https://lore.kernel.org/r/20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com

Changes in v11:
- Rework scheduler pause/resume
- ope_sched_cancel(): synchronize_irq() unconditionally
- Add reset_mutex to serialise reset register programming
- Re-run __ope_irq_init() on RST_DONE, a SW reset wipes the IRQ masks
- vb2_queue_error() every queue in ope_unregister() so blocked fds wake
- Take a device reference for ope's lifetime (ope outlives the binding)
- Collapse the three per-queue rdy_spinlocks into one queues_lock
- Use div_u64() in DS_Q21()/DS_OUTPUT_PIX(); fixes the 32-bit build
- ope_run_job(): publish hw_ctx/hw_running before programming the
  hardware, take a typed ctx, drop the redundant resets on error paths
- ope_release(): take ctx->vbq_lock instead of vdev->lock
- Drop ope_adjust_power() from ope_s_parm()
- Adapt to the renamed v4l2-isp API (v4l2_isp_buffer)
- Expand the locking documentation
- params: switch wb_gain coefficients to s16
- Link to v10: https://lore.kernel.org/r/20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com

Changes in v10:
- ope: Split the input line evenly across stripes instead of filling
  each one to the maximum. (sashiko)
- ope: Reject VIDIOC_SUBDEV_S_FMT and VIDIOC_SUBDEV_S_SELECTION on the
  active state with -EBUSY while a context is streaming. (sashiko)
- ope: Validate the geometry when generating the stripes.
- ope: Register the media device only once every entity and link
  exists, so userspace cannot observe a partial graph. (sashiko)
- ope: Add the missing MEDIA_CONTROLLER dependency. (sashiko)
- Link to v9: https://lore.kernel.org/r/20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com

Changes in v9:
- ope: Release the vb2 queues owned by a file handle on close, so
  buffers are not leaked when userspace exits without STREAMOFF.
- ope: Clear vq->owner and the queue private data on teardown.
- ope: Align the crop rectangle to the input packing unit (at least a
  Bayer pair) and the compose rectangle to the output chroma
  subsampling, so 10-bit MIPI unpacking and the UV plane stay valid.
- ope: Factor the duplicated format lookups into ope_fmt_from_mbus_code().
- Documentation: Fix the userspace example.
- Link to v8: https://lore.kernel.org/r/20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com

Changes in v8:
- uapi: Drop the OPE-specific infix from the shared parameter. (Bryan)
- uapi: Describe the gamma LUT behaviour as a property of the block
  rather than of Agatti OPE. (Bryan)
- Documentation: Fix the description of the block enable semantics.
- Documentation: Fix the userspace example. Zero each block before
  filling it in rather than OR-ing flags into uninitialised memory.
- dt-bindings: restore the blank line before the reg property
- ope: Keep the OPE interrupt disabled until probe is complete (IRQF_NO_AUTOEN)
- ope: Rework the scheduler state, drop prev_ctx and ctx->first_start
- defconfig: Reword commit message to explicitely mention Qualcomm
- Link to v7: https://lore.kernel.org/r/20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com

Changes in v7:
- Tie the driver context lifetime to the v4l2_device refcount
- Free the MC pipeline from the v4l2_device release callback
- Reorder unbind teardown
- Refuse to start jobs or start streaming once the device is disconnected
- Fix a permanent scheduler stall
- Complete the job when a cancel reset times out
- Make the reset-done interrupt terminal (no ctx/job rescheduling)
- Drain the ready queues with the scheduler held off
- Invalidate the gamma LUT cache when a context is destroyed
- Factor the reset-and-wait sequence into ope_hw_reset_sync()
- OPE node enabled by default, this is a pure SoC level feature
- Link to v6: https://lore.kernel.org/r/20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com

Changes in v6:
- uapi: Rename include/uapi/linux/camss-ope-config.h to
  qcom-camss-config.h and make the parameter enum/format generic.
  (Hans, Gjorgji, Bryan).
- videodev2.h: Drop "offline" from the V4L2_META_FMT_QCOM_ISP_PARAMS
  comment as the format is generic to CAMSS ISP, not offline-only
  (Gjorgji).
- ope: Add gamma correction (CLC_GLUT) support: new
  CAMSS_PARAMS_OPE_GAMMA block, camss_params_ope_gamma struct with
  per-channel 256-entry LUTs, and double-banked LUT upload/programming
  in the driver.
- ope: Remove stale .wait_prepare/.wait_finish vb2 ops, which were
  removed upstream and caused a build failure (Nihal).
- doc: Add Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
  describing V4L2_META_FMT_QCOM_ISP_PARAMS, the OPE processing pipeline
  (block order and input/output formats) and the uAPI data types.
- Copy the params buffer into a kernel-only scratch buffer before
  validating/parsing it.
- Add locking around ope->ctx_list
- Fuard a NULL/out-of-range stripe pointer
- MAINTAINERS: Add the new metafmt-qcom-isp.rst doc and
  qcom-camss-config.h uapi header to the CAMSS entry.
- Link to v5: https://lore.kernel.org/r/20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com

Changes in v5:
- Make params definition ope specific (Bryan)
- Add pipeline/params helpers to ope driver/subdir.
- driver: fix COLOR_CORRECT base (0xa00, was 0x400) (Bryan).
- driver: fix DEMO INTERP_COEFF lambda masks (G [7:0], RB [23:16]).
- driver: map pipeline blocks individually, dump per-block HW_VERSION (Bryan).
- driver: disp subdev is pass-through, mirror sink format to source
  and make source read-only.
- dt-bindings/dts: map the CDM register block and rename node to isp@5c42000 (Bryan).
- Link to v4: https://lore.kernel.org/r/20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com

Changes in v4:
- Made OPE a standalone device again, sibling of CAMSS rather than
  a child node, following maintainer feedback (Bryan)
- Aligned params with ones suggested by Bryan (when possible) (Bryan)
- Correct usage of subdevice states for configuration (Hans)
- Removed the bufq and scheduling helpers (now in ope driver) (Bryan)
- Moved generic pipeline and params helpers to camms 'core'
- Fixed Green hue with some downscaling factors (reported by Hans)
- Fixed ope_enum_fmt_vid_cap (Hans)
- don't hardcode DT assigned-clock-rates for AXI (Konrad)
- Link to v3: https://lore.kernel.org/all/20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com

Changes in v3:
- Simplified camss_init_pm_clks()- no clk_get, no rate setting;
- Added Assigned clock rate in devicetree for CAMSS AXI clock
- Add Kernel Doc for camss-isp-bufq exported functions
- Added description explaining the 2-cell for CAMSS bus
- Reworked OPE media topology with intermediate ope_disp subdev
- Support for crop and compose in ope_proc sink/source
- Fixed Write Engine violation with some scaling config
- Fixed input/output custom-stride issue (Hans)
- Split uapi header (camss-config.h) into its own dedicated commit
- Patch reordering to respect dependency in regards to ABI/dt-bindings introduction
- Link to v2: https://lore.kernel.org/r/20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com

Changes in v2:
- Not an RFC anymore
- Move from v4l2-m2m to multi-devices design
- Support for parameters
- Helpers for pipeline, job scheduling, buf-queues
- OPE as a child node of CAMSS

To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Kees Cook <kees@kernel.org>
To: Gustavo A. R. Silva <gustavoars@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Loic Poulain (6):
      media: qcom: camss: Add V4L2 meta format for CAMSS ISP parameters
      dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
      media: uapi: Add CAMSS ISP configuration definition
      media: Documentation: uapi: Add qcom-camss ISP params documentation
      media: qcom: camss: Add CAMSS Offline Processing Engine driver
      arm64: dts: qcom: agatti: Add OPE node

Nihal Kumar Gupta (3):
      dt-bindings: media: qcom,qcm2290-camss-ope: Document shikra compatible
      arm64: dts: qcom: shikra: Add OPE node
      arm64: defconfig: Enable Qualcomm CAMSS OPE driver

 .../bindings/media/qcom,qcm2290-camss-ope.yaml     |  155 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-qcom-isp.rst   |  147 +
 MAINTAINERS                                        |    2 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   77 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |   77 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/media/platform/qcom/camss/Kconfig          |    2 +
 drivers/media/platform/qcom/camss/Makefile         |    2 +
 drivers/media/platform/qcom/camss/ope/Kconfig      |   17 +
 drivers/media/platform/qcom/camss/ope/Makefile     |    9 +
 drivers/media/platform/qcom/camss/ope/core.c       | 3955 ++++++++++++++++++++
 drivers/media/platform/qcom/camss/ope/params.c     |   78 +
 drivers/media/platform/qcom/camss/ope/params.h     |   95 +
 drivers/media/platform/qcom/camss/ope/pipeline.c   |  405 ++
 drivers/media/platform/qcom/camss/ope/pipeline.h   |  239 ++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/qcom-camss-config.h             |  212 ++
 include/uapi/linux/videodev2.h                     |    3 +
 19 files changed, 5478 insertions(+)
---
base-commit: 4ca8b46c95043897a8ddb063db5aaed61edaa264
change-id: 20260427-camss-isp-ope-4b575ffec2ed

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

