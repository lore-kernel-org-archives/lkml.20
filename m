Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768177;
	b=yAJ79GjiQe7rPkodmNIlIwMAbe5A0mEfRxGH54sP0HK6UWi4qENBOGSP8cEzpth0twkI
	 i+aJH37jFRVB5/d5+9IvtqbOs6LFsxErUqbCpbiS5BSCKs8O3bL5ku9Ybjwx+Hoa6NKhg
	 KcWKzRMyJuA8JZr7/vJUO5/XB39eZ7/GfmoUw2sOuUHGWYUPc+Eb8cEfz2N7KApbc66FT
	 H+ON0IBRqy5suFavDQyfjUHC3pKVrNdw1VcuzpACdbqUJXwwDIh1J+9BoNHEqpAwXYf0E
	 b3tt5guEm9RGMR1gztCPg0S7Vp5aMzZlhU1z4C9MCqPInE3Trn95j0HoxXKPUfaY0Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0KPRZuQc5dfgGeGt/q9UkE/A0p5K/7gyw/B+1f7Fj/4=;
	b=NQMZCtVNnu8APJlCaKL13boXUV0dfOW3rrnDPdtkiDbwx9IG+RI79O8D0/O/7gA2xAyQ
	 8NPam0ys8SmsUoh5KhCzGn+ATrHxBefLAhhHiI0cZmeiPR56mld4IPN0sYOwzVLNbNJ4l
	 7eqeTaikIXs/7YnRJktXibjNQOn8NEq6HrBCY/wo6Y1aKCfm6AqjHL4Wu26QE7ikcrAXF
	 X47p5AKUf3r9vcytNxsmAFBCIeGKi8ryB+Y4rJcakN5uzhFVJqrPoxYRFOi/2DWHNTjxM
	 HpR0h1qDTJESam7yTwqbtLfckWA6q+bmdHZbn9tq8PuKG5EU2s0Ngt3Bg3iWrPJ9M6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1fBSC6l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9sInK6I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A86606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97A86606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1fBSC6l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9sInK6I
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6DS12462572
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0KPRZuQc5dfgGeGt/q9UkE
	/A0p5K/7gyw/B+1f7Fj/4=; b=P1fBSC6lT+FORSGySrK8RsbvG9jUQnpgBKkykD
	cnqj8yO+M7S3vEIspFnTW8Lv2IuPGS4wT2WVWlEpGQLojbDMQpB+ZnkgUZN4oXZ7
	pKlWnlE8PsQ3Xg5Q+idMw4PBUNwtcdryTXkMd0sgCW1m7WV9HJS/yLanOnjbWjZB
	opTehQQsZMfbKPKE0YfkUD3QUHDeFvz3vnBlTf7tlxOdsFW6y1qOdqihT0iDeJT9
	QY22XFtFXXWwZ1Bwt75Be80czygCLOZ+y4qb6PTV3aWXoBhgB1XF1eopzzICJUVl
	qjj3G0y3HZHd2iK31l4ypgWya1SMnM4wrWS2DDyMuHb+UVDA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtv9m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:35 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988bbb0ed9aso880146241.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768174; x=1793372974; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0KPRZuQc5dfgGeGt/q9UkE/A0p5K/7gyw/B+1f7Fj/4=;
        b=A9sInK6Imwu83jfX1sNMb+lp6lcKRm7xz3JSOgwEhfyZZoIpmyvS9b/ffrjksHUP9w
         ATW3zsvgnkqWyfOQ2IoHlov/svdLfo3RNb3Lk3jQNC5/sSlO1B2rev1j5kuGOZhQtVMk
         kVg9PVIYQtmJkVzHzSk9CkwhbsJ04iBci/zIulfvc3VrfjNtinIiAOoQOORISrawlIqY
         gNxn6yM+hn0CLJMNlVzsbcF+8kLQe1skOjMldw4xKYDlHY6f3uj+ATAPATPoVqn/q8FA
         GV2s+b/Rdod4K65un1Gn4LXMrcU7iiLN9xovaMTGVDE5K75ubw7dsmZV4o/jbUfJmLZb
         vr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768174; x=1793372974;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0KPRZuQc5dfgGeGt/q9UkE/A0p5K/7gyw/B+1f7Fj/4=;
        b=S/a2C89pQG+Tww64AHTUpY0CeBYvmtiat/UYKXe4SKMWrvFwCpGUE5jkOH/LzXkrTt
         L09skkj6e/te07FilFsvulVPzprcbP/drox1fqj4AGiDEvXDVKU+jvMA0FSZgD69gVe1
         YT/OqXekVZEpSK48Hsyu+UoXDeZ7WefFTeFiQJMCuCjhSbrLCRQxUpNJ/U+CTWnFVyL7
         5F5OyySuEQlXko1MFgi/vS7Y/i59DH3vXcKCEu4ZUwAcgUuYTjr1kWgPDSfRAW23pPYj
         BrhhoAdfkXxgFJK/SK5S3TAEp5ZgPrSCJS/zV69Tv7qsMD+PusPuMmL22uKqfpY9jIJX
         +B0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzgUddIWYM8mqg4bSynMThV4M5HQBy+di55BF+8mhDX0IBc0wBV/BQPlGCr7r1ZTlTyzgfY5PPYIWWmHnU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb2BAYV1IK01v8rkV0qiLdrHM2+w/yaFwCQFa93fsZKFC5F/iL
	//Z9GcX5pbtg9F6/o0142FBFhahUQGd+8R1S/8X5rtSKAuw8WCfKhz1Z27iZ1D6l8ckLWFbXZsY
	lksDpnKaKXjPuK0vCRNYHvAMRYZy3X577H0/0RHk3/23MWYXsoEzWRNQyiRVTYH4Mly8=
X-Gm-Gg: AYBFou1n5+VQuRfs+1SX2tjYMohTOLF6KMd1x8Ue/HmRS1B1CxEhdV4YuCkRIKyoCNi
	G5bYAmE9Ro2HpDG6EP1WuBEyOEzBnWcXrGV3B2gwtW/HssnizJVSyst5U7aUFui7MfUiDY97vRa
	foAwWoqFFzLBU8opGMpjrwBuSdeIJWd6hsT5VrnDwphjGgUzgOKAZOGFv/rSvg/VX3yQ1jC5uKK
	4BGiEeDOpo4i570mZIYm363QzBeNID9jDkMJRV8gO5KmpmadqK1A+zF6W7HFFA9xGWeqrPupO5a
	8vh32GJtDNf+ikLobqoeuERh27OzdCXznFud+/N84sEHCHwWBLt0t02XIKl/YQrEd7iMJ1EAHJf
	Yl/rijg8g7anN5Ku/49kNyLRNz3JYRYZHhXrZ+CXPlyiK2v/9Eu4ihMAxXexZ6ztd+CEPdDF5TA
	TY/8XkuiiMJbxP8YEHJOFKuoaBTZohURif7qcwyhTNTQ8OxhPkQJs=
X-Received: by 2002:a05:6102:1625:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7ccc33488damr1083672137.23.1792768174404;
        Fri, 23 Oct 2026 08:09:34 -0700 (PDT)
X-Received: by 2002:a05:6102:1625:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7ccc33488damr1083638137.23.1792768173796;
        Fri, 23 Oct 2026 08:09:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v11 0/9] media: qcom: camss: CAMSS Offline Processing
 Engine support
Date: Fri, 23 Oct 2026 17:09:11 +0200
Message-Id: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJd422oC/3XRzW7DIAwH8Fepch4RNhDITnuPaQe+siI1JQttt
 Knqu8/tDo3ockEyEj/+ti9NiXOKpXndXZo5LqmkfKQC4GXX+L09fkaWAl00yLHjEjXzdiyFpTK
 xPEUmndJqGKLHGBp6M81xSN938P2D6mHOIzvt52gfikABqAzKFgE6UAzYISffTvl8sOn4lktpv
 8724PM4tnTc3H0qpzz/3HMu4qb/WYqbKtEiGGfOAVcKtaTfnr1bsEU+EA28RiQhCpBrywX0wWw
 gaoWgrBFFSNTcBjlY0fu4gXQPpOf1gJeOkM71oFzvFQjYQPQKoZFWiCZEawcikBBE2EDMCkGoE
 UNICOBNZ4U3lm8g/RoRNdITQoBWwYNxZms7wNfKUz+0MM6wQ5QAXEjv/mGu1+svhyafbd8CAAA
 =
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
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb78af cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=jEnBGcp_S-U7jcHEVloA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: da6OjNsCK4fnEJ05In4a1G0efFpQA3KF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXxuFoNfDn3M1L
 SDmetCLG644aM7+i858DesXe2K9jEOBNi8DH5/4cPTg0IWPEzor7IOvyQUCQqFoozbWnfta8mq5
 Ja+8vHQd0ht5xYVE9A2CyRi8jp26y1igt4PEUayDPCnyQxfLqjWES/5QsiM4qKyINRDr3H5cuSb
 FV1uQxHdgs2mkdvq9Qe+ug+Vu/Ckl7yp7KyXsbwEHJ1RPUVvRy1BfEzvEhOmJg2Mniq1PczdOqB
 yZPKia9AgNxrWoImFZkOMhAiBdDmFbPsje1Z7uwBCWXKAb2Bag4HpHJKPts+K3J7r5gjDZiEuNR
 /MGbA9KhFHhSQLVG1lvdB/XNavcoNQmHy/HGzpZvj5a1UkeYORNquCZo6co/N2c9/c8S6MV6xaw
 HLiyRSVxEYZhcnFzhlt0/V6UK6vh7vlBEPP+NgM+uBiTGhLIm/nDuLAHyEZh5ImcWLqL8EeqVJG
 zBXB06/pQgOOE6obFAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX60V8eCFZQ480
 IAbavXmFq3Q2SsQXhkGpDipPVrGppZ1k46BE3mvd7oyMfu4JVZHY1WGaUwJjaVabY9YmvlBzO21
 VLhDY5PRqYLRmWs/jpQ8FBRSD2IDv4E=
X-Proofpoint-ORIG-GUID: da6OjNsCK4fnEJ05In4a1G0efFpQA3KF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230059

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
 drivers/media/platform/qcom/camss/ope/core.c       | 3932 ++++++++++++++++++++
 drivers/media/platform/qcom/camss/ope/params.c     |   78 +
 drivers/media/platform/qcom/camss/ope/params.h     |   95 +
 drivers/media/platform/qcom/camss/ope/pipeline.c   |  405 ++
 drivers/media/platform/qcom/camss/ope/pipeline.h   |  239 ++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/qcom-camss-config.h             |  212 ++
 include/uapi/linux/videodev2.h                     |    3 +
 19 files changed, 5455 insertions(+)
---
base-commit: 80a4307704c4cdbe5be734fe4531910486c941e2
change-id: 20260427-camss-isp-ope-4b575ffec2ed

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

