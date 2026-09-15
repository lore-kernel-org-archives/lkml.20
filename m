Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFB03876A4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459873; cv=none; b=YOAIAd25HfZnfLRz1uYFhkYlysq+m8s/z03XDDgbTNkv0cEk7nV4hxWv23+6L3BUbD5xY0C6uJXtFjRRksujO+k+894e4OPruZb2xNJ4E6N5y+nGVXRI5xQntx+3c8oqQNLJR4cd/84bdHkGCr8kFw9tGFcr3oq+220U6Xieg/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459873; c=relaxed/simple;
	bh=2P4URBnbrgvET8SjqPdLaYN60pPW3byBP65m9vi+hYs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TDZFnl2JGoui/oV6c8dbGPNWOeskaorLvp5S9S8O8wCo6s2bfsWrGNos6YEx2jo00Ry8Er1sAYd0bpPXvw67jDKVoIb8VJoutOBBBHIjz2/VMA5zM9NHTefxPGL/rhV1afaPVSrGrDH51KLxtrV8vxfnvnUJv5m2IMRd5/v9sFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MEpMZ75W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlpO2hBT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MEpMZ75W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlpO2hBT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Yrhd4048580
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c16WSwJq7cu1gewzysb0hJ
	HNZbSI+jvLzGTjduRObZY=; b=MEpMZ75WYGVimodtyZgx2ydFHPAkqSHIAiSF58
	2ov82BEvNj1e7pSle5/EFQ5oHXUF3BT9b6CSW0kMswWKa4DiydN27+pZWjhWUUFu
	gOxPgKihMSNMVHHQuZj5adz/TxzI4kw8mwSaaj5K8PaC+ewwX/fiK4iTe8TDH3Ua
	Db0fdvYjBTRYR/bEYsCxAGEX5mzrEDaMna+TpK3bPFt4+7qwCxyG3Bn0pvOjlEf8
	fOXpK+/Hj40WjK4svhNlaG0yrYeXQv4Xh/+hi37RdJKo+N7rMJy48yAcwqrG5WLi
	LTyxS0uuWmx0sQeWULixh1hxlHc3AwFhyc1Q7rkc2tKvHY5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea0rhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0b66ecd9so340152385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459867; x=1790064667; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c16WSwJq7cu1gewzysb0hJHNZbSI+jvLzGTjduRObZY=;
        b=TlpO2hBT5N2rzNqCiX7fqNH+imMWpTgWAeQG//+mEXoOH8zniBOQ6Og+SI3QV9jT3s
         2GWLaSM9/ba8BG+4hBzr/lclYZxo3e3qbZtgfQINLinYOAYoPMIIx2LgmtOJbgUvnKvK
         BkfgoyzumVWprmj9YMoJEXzDsuJzxF/89z7NSLAonkgP1iNqf1g230SXYjjlKN5lKZtG
         uerCO3oY64JMTT0X0d+9A7vZzpmTfq5TqMskXMEEimCuhh5u1BgaGc9jwrsL8ejGA+cH
         Z8uPQuhLyXblG4YugzAwMMUIyHuRdHmyX1bjKdIYjOFYpeGtOlwqKjqqxMCrMmDbgCTI
         1ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459867; x=1790064667;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c16WSwJq7cu1gewzysb0hJHNZbSI+jvLzGTjduRObZY=;
        b=d/tJk1xNGnlXb17NCm3FqvWcOCBUlYtMunYia7N3I/VmZlaSXpMvshU5ApcsTR7XtO
         MdWL3EsRZKqdHIefZ5H1uUSRRfyoUAYrt3unnSw9X/tDRB+cNls88W5ctS/HrJ6CoHrp
         EUhwmKVTRxRvT2cQrsIT10dqgR5rOK24mLl/iYWjUMvQeCfZqCcxqjpdNORSUO0YN8Bb
         tX3z/NyV/CESBsDQq2AJLtMxwX6SfZ9UicK9rKjwOxojKPkVdOTZ/Kv1j9kt1yJmrl+c
         ZqCqYg1xp5ckBfBKH9kcEYiwYLf7aqCxM+hIpSIT+wBac0coPxttlKbbYa5Bp7RGc8n9
         vYuA==
X-Forwarded-Encrypted: i=1; AKwUvByl96qfA+NZsGQQePrYY1SuNHW1Tzj5TUZo4IeWK8gxf0n1I0LKuaBzPD0TH+u94Jlz0LUvQqKZ8xTIwWk=@vger.kernel.org
X-Gm-Message-State: AFuF++mr9qW/3GmGlfjf7VRd/UtXnVuY+ubA29ExHEiuBPaeAiL0ihcz
	PhgBO2SmDf65E56OBqlm5vMbPFi9ZbUQoH4u7u5ENUOgV22KbKOE7EfTnNMLDWGrFC+9bwQL44K
	7KOtbj0F99pzYxrDNqAdNcn7vBGigPPqJIJFtWqfIUkInjWYzGer/zo6bQAJ5xGLFgnYIDjh+gh
	C/1g==
X-Gm-Gg: AYBFou3M+tP7EGO6EfzicrCX4CcuMUgNinP0gOUfZyY8tS843I18kL8mbvuItT2uVwq
	ofc/zOjRknv9HvP8EO8J3n7xV/qbYUVRiPEzWCQooPj9+Z/lLQWVvKdml0fipzNpHZspB2iYkh9
	VsyF4W1tV4lZ6EpEVphwcpxYV9tNyf3Y1vJebv0CjOCa8IMB9wztK0qiANBqjAIUKVCJxuS/U3i
	40JIzkS9tGFwOCg8TdRQX+LZXgnDylr9OTKecx5fXtXuQqF+Mj0e4blfFk3hFQEwIXgrrWAdlQF
	V3DSHJ/aX2YUhFLiJQC3wl7FsVO3UoTiHdTHbX2OKpXZr4ejIgICvr8DVhlky9WVXSKLfbmPvev
	2sXk/040s0FD4xg7ncDpdToBKfMZyGdDCnNTGLtCbp3HW0U1+M3WOn+/bKbI1B3fffxztfKqLjj
	ACQIFsgx8g4bEqMLfK5uo54A6cDEfhKuVyYOe2Lrg2Cm1vhpiO8lE=
X-Received: by 2002:a05:620a:19a1:b0:93a:1264:7f46 with SMTP id af79cd13be357-93a29ba8016mr930448185a.46.1789459867161;
        Tue, 15 Sep 2026 01:11:07 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:93a:1264:7f46 with SMTP id af79cd13be357-93a29ba8016mr930444785a.46.1789459866707;
        Tue, 15 Sep 2026 01:11:06 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:05 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v7 0/9] media: qcom: camss: CAMSS Offline Processing Engine
 support
Date: Tue, 15 Sep 2026 10:11:03 +0200
Message-Id: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJf9qGoC/3XQwW6DMAwG4Fepcl5Q7MQEdtp7TD2EEEYkICxpU
 aeKd1/oDkxsvVj6D/78y3eWXPQusdfTnUW3+OTDlIN+OTHbm+nDcd/mzFBgKRRqbs2YEvdp5mF
 2XDWkqeucRdeyvDNH1/nbw3s/59zFMPJLH53ZFYkSkCpUBQKUQBz4ELwt5nAdjJ/eQkrF59UMN
 oxjkcfm9j5dQvx61Fzkpv9YJKpDo0VywZsGBBFqla/99bZii9oRDeKIqIwQoNBGSKjb6glCvxB
 UR4Qy4rQwreqMrK17gpQ7Uovjg5cyI2VTAzW1JZDwD7Ku6zetuzpyyAEAAA==
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
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 6pnVBeW8dl-eUMrZBZfgi6zDSKq-ezBJ
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa8fd9c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=B25icdsSMqDT0xbHnQgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6pnVBeW8dl-eUMrZBZfgi6zDSKq-ezBJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXzjZEBm77EkNH
 SBlFA/E0aLkdOpPfWIeRYjOlVWgKSSN2fu1qTbt1pgxVzeH8TSI4REXrkfx/8O+WuUbYMMmTXaO
 leQYBgXgB1+8ySx/X4oVINmeAMOyLCs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX/O7r9yTKHZAA
 hKGY/Er0uiXtZ59L41LgXL5mxlJzjq8RJducoK2bifDUpTkoQm36sHc9uhqQBNhkKMt7kBOi0Us
 QodDe/RnvASjNiWOm24VKSaEOSL1T8AAPikrqlxttab7dUCoUGD0o70RLq7M7A4RMxpY538YlJv
 lHASNeV5JtfcBgHKlrvjaeMx31SS+j/CGJmBcuYSfkrVhO416bwYYCHI7GJatCjun+yb1VKV14W
 yF+MZOqDDcApTsHdgjKjaC4MwiHoFohVapc0N0c7C2anehePgBhtZdQJVEW9kCwoxUi6YpMErHN
 iL1GLuTLbhl9LaaNo03Sakmqqa1E9mj1kvlYsL7H8TxIpZKzeSXdObTuqn0YKxIxh0+GKiawOPd
 WdhTORIvkaWCYpjGZpq9O1gkc1SYwkp4A7DyXlNJMZE46G63QBPHHw9C1NDR9FCWazKrCyLptJU
 tvziryPczRojta1lfTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

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
https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1

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
      arm64: defconfig: Enable CAMSS OPE driver

 .../bindings/media/qcom,qcm2290-camss-ope.yaml     |  154 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-qcom-isp.rst   |  145 +
 MAINTAINERS                                        |    2 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   77 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |   77 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/media/platform/qcom/camss/Kconfig          |    2 +
 drivers/media/platform/qcom/camss/Makefile         |    2 +
 drivers/media/platform/qcom/camss/ope/Kconfig      |   16 +
 drivers/media/platform/qcom/camss/ope/Makefile     |    9 +
 drivers/media/platform/qcom/camss/ope/core.c       | 3658 ++++++++++++++++++++
 drivers/media/platform/qcom/camss/ope/params.c     |   78 +
 drivers/media/platform/qcom/camss/ope/params.h     |   95 +
 drivers/media/platform/qcom/camss/ope/pipeline.c   |  412 +++
 drivers/media/platform/qcom/camss/ope/pipeline.h   |  239 ++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/qcom-camss-config.h             |  212 ++
 include/uapi/linux/videodev2.h                     |    3 +
 19 files changed, 5184 insertions(+)
---
base-commit: 1e15e15a1225e9349fd87fb3f285ecafab73b3fe
change-id: 20260427-camss-isp-ope-4b575ffec2ed

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

