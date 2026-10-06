Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968E360EDE
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326416; cv=none; b=OemaeISjn6qXOuNuH09Sj0Xzz9Oodh2mb5Iu+v40aajTBSzM2c1s0ZgY48wF9V0ex5RoBK/nOoJijuNGdI9Jn5U1fqWdDIt32nB//Dd+eaiW/y24emRsYF8W4w1vbwcflHGD0Ff0ArTyPasP3deHqotBRKdZZ4hAkSUdpTf9mv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326416; c=relaxed/simple;
	bh=1OiGS1y8dRwDTNdPvcRHVecaO5emqBmHl0NQdQX98Ow=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A9d+0pLkmy6mTs45y+rABNYDz+Ml2uLZCPC7fDgLUfxAi/aGTY1+mWykbpWgWZmNSW7ipX5/mIFpTsQcm4o1tAxma2nxx6GLj1kOP8KzBuoexWfpQWxeZuLPXln6j1MDsJ8HxOPFbZZsxEVvIk8EGpv+DdHw8xpOAtt2bK0yJSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kA7AezMf reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kA7AezMf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeNsa1195916
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TQhJR1ivwEc7eFUrwvAyl66qcvVdFsj0Zja
	qlacKe8U=; b=kA7AezMfcyYV5GxcGTJ2Ksj5+TdK1xnkqwWBB2okB8OILY5k4RL
	AGPnT7FFzWvsezWQpfxDsK+eskn2QrEJAu2XXZbHdeP2/Qj1Jm0A2hJADvU1LpnS
	YAogcWvPPeQpfQc7tkjCyil/sd7/dH7l/533DiAH+PImy8J0/SrH3AKotIAMMHCr
	6/10xFqfmWiyVPlu6RvVbr5+I2MVPEBdEZe51Fs6WCk2ED/m4Wl9QPZpJ0+vXTTO
	oU7331D5S5hKLeLXZk3KBEvjvuhQcZeSALG72B9cSp8PrmPVohgvGB0ZbwRoQ3S/
	Lov0JHMhOrHnBEDbJhXmTJegnwQ1HNUA/VA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4vmruf2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:40:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-535213e3a7aso60082081cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326413; x=1791931213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQhJR1ivwEc7eFUrwvAyl66qcvVdFsj0ZjaqlacKe8U=;
        b=sQsMBIziYQdLCLil4vV5J/jKpgrEQveoZh3vdBdKxokgtRcL0LDABU6aXoCuL9mjbS
         GMXrRzIVlrIM0R9IE1okgvTv/bd317XmTqxGXaTZEyj7t2V2XvW5OsqMterjiIO7XJoZ
         q3ZAIUjJHmdCktHEECruKo0GwomTRRhif33cTQ/bnwgtBEZ33KvQRuMezOsPccF+gbbE
         MqwiKXBGIvQB02MGYWj2xpy7qIPW8qDjj7jc38nlFFWoc8auO9jxayV0QYxj/TO1E0b4
         25Fm57rWLNKQd7eLORqzOCK+BfR81UW34ErzW2M29HHjteYRgEoqwnnWBpypIxCcZBcN
         5b1g==
X-Forwarded-Encrypted: i=1; AKwUvBwAXV0X0Ns1Y35i53WnRVzbhzJg1Hm4myAobQMyGJrwJpWwiXiaKuycgvv4pIc7cSvKI0ajPom7ccpDVyI=@vger.kernel.org
X-Gm-Message-State: AFuF++mzlN/H8l4o3e7BXgZrs2Lv1b2wkqnsICXABvVE9iKRZ1jAuE4O
	EG8wcEjmA48XJSsX2TYAtztq5yZhe8bcT2q+I5EhMY2UwzIoGc0YUycjKDWp5rzZq3uYIccRnq/
	Pe2Xy75bmw/7G9NuOfu8YrLYBeMy48/e6NAU5XbKahQoMIcxUpm0RfwyYfqwshh7cVbU=
X-Gm-Gg: AYBFou2PmoOoZTIIi/YPBiOXpEi1E9C3gx++b1H/0d1T4TJGkb9TgX+zCaoOEseTf6d
	6Ji91eStPgaLv/c02+3z5CNITs6rC14OvAG7DZCW97m8Zsc29jPmLQRWCBGQ77xi/Dk4gki5jaK
	CZsRkruM2ov6EsY6gFLpuvhlrEmffbWLdDyAB8uX3sNNnvqBN+HgeYtfJO7Kji/uj+WcUHUB63a
	HJLbnbwUyE1XZ/GZiBhu0woKtTaNZ9c3DNH4ZRCfYflXlKGGNxqj+srnwAnIVU8ohE7csmQjWA7
	aFJAtpm/OjzoK6qO/znmh6xDOIWJQ4Y8ml7/o5swb91xNGtM2Z6/dEvpw98=
X-Received: by 2002:a05:622a:a58b:b0:533:9825:a713 with SMTP id d75a77b69052e-5357512bb50mr6062501cf.4.1791326413264;
        Tue, 06 Oct 2026 15:40:13 -0700 (PDT)
X-Received: by 2002:a05:622a:a58b:b0:533:9825:a713 with SMTP id d75a77b69052e-5357512bb50mr6061851cf.4.1791326412497;
        Tue, 06 Oct 2026 15:40:12 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:11 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 00/45] media: qcom: camss: add IFE pixel path support
Date: Wed,  7 Oct 2026 01:39:08 +0300
Message-Id: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XZ4cX455 c=1 sm=1 tr=0 ts=6ac578ce cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=LzdgNzxw2tJgtqBk4dYA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: B--ggjxjK3uOArKKOCzxchADLg6XSgsO
X-Proofpoint-ORIG-GUID: B--ggjxjK3uOArKKOCzxchADLg6XSgsO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX1/Ww143vE27y
 gDMnZWX+0ZYPm3kCDa4s1ilv+PHgoyfA4Y7ci84YgzdpAAzPUm9Z7RcYSYfXgWLiPU6KFRyKR3A
 Ase8Io95hX5RD8wmzDi4JKxX1sYCTJ/ypva9PWGMj6RTBEahPDyhxEs62JZ/bYtb+pGE6m119Rk
 /vWthmj08FEx+vDcewfBaU3tbv8VKuVZj1m//iHQX22emexRP9GG8TCfkDzeG6UVudw/bzIgrXR
 Hcpe2oPxWqp0AYRChnXqcNd6tAk90AHIVh/ZA4rcdvq14n91Cm24vD0RRwekfXdEJpPDn3vL0Is
 CgtieBwPzPxdyPr+U2kGHYqf9G8oyymqIFYAQXqxvzyssZVWM3IkZ9XFfttpgAYZ71JlNPwsrlu
 unj4F21GFJi5t9OqANHB2BzdEcBI2sF9wrt29Hm5pHGPiNjDlBMP9da1BxSmF3a9xL8+ibkHK7s
 vLTnT5dQcIh5O/f01ew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX92aNMFoHYH3J
 P/hZrEy7Ib/CIgzHfVp6A0LtjO68WqD44l+ql/sOn3/CeLzeEM5bTF/RRrEUPS69ZhVeK8St2kw
 /jbUVPXhfPz0Cfj4H1ke3uos00xUZfg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

This series adds pixel-path support for three platforms: SM8250,
SA8775P, and QCS8300.

To keep the implementation manageable across platforms, instead of a
single monolithic VFE abstraction, more granular hardware abstractions
are introduced: ife-top, ife-camif, ife-bus, and ife-modules.

We initially attempted to modify and extend the existing VFE code, but
the changes touched every file and led to a third generation of VFE
support (multiple pads, etc.) being added on top of the existing two.
The result was a crowded, hard-to-review camss-vfe.c carrying three
hardware generations in a single file. Because of this, we introduced
a new sub-device, IFE (the new name for what was called VFE on older
platforms). The IFE sub-device supports the multistream API and
multiple source/sink pads for handling parameters and statistics.
Stream routing to each output is handled through the streams API. It
also defines, per pad, the basic configuration shared across all
platforms (WM IDs, composite IRQs, etc.), as described in the patches
that follow.

On the CSID side, a single source pad can now expose several hardware
outputs as separate streams, and the gen2 CSID backend gains a routed
pixel path (IPP) alongside the existing RDI paths. The TPG internal
path is also fixed to use one CSI-2 lane, avoiding packet header ECC
errors, and gains explicit links into the new IFE topology.

QCS8300 shares the same IFE/CSID pixel path hardware as SA8775P, with
the only difference being that QCS8300 has 3 CSIPHYs (0-2) instead of
SA8775P's 4 (0-3).

The IFE parameter and statistics blocks are now built on top of the
generic v4l2-isp parameter/statistics block validation introduced for
the OPE driver.

The selection of pixel path topology is done using a different
compatible for the same platform. This will most probably not be
accepted, but as of today it is the only way to support both
topologies.

NOTE: Bryan has posted RFC changes for pixel path params and
statistics. This series was ready to be posted at that time, so it is
not rebased on top of Bryan's implementation. Both implementations
share common parts, but take a different direction towards enabling
the pixel path: Bryan's series extends camss-vfe, while this series
introduces the new camss-ife sub-device described above.

Depends-on:
https://lore.kernel.org/all/20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com/
https://lore.kernel.org/all/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com/

Atanas Filipov (33):
  media: qcom: camss: report probe failures
  dt-bindings: media: qcom,sm8250-camss: add pixel path variant
  media: qcom: camss: keep CSIPHY lanes active while streaming
  media: qcom: camss: add IFE subdevice interface
  media: qcom: camss: sm8250: add IFE BUS v20x
  media: qcom: camss: sm8250: add IFE CamIF v10x
  media: qcom: camss: sm8250: add IFE scaler v10x
  media: qcom: camss: sm8250: add IFE module engine v10x
  media: qcom: camss: sm8250: add IFE top v20x
  media: qcom: camss: sm8250: add IFE Lite top v10x
  media: qcom: camss: sm8250: add IFE pad descriptors
  media: qcom: camss: formats: add pixel format lookup helpers
  media: qcom: camss: video: use helpers for line-based formats
  media: qcom: camss: video: add managed streaming callbacks
  media: qcom: camss: add common IFE subdevice core
  media: qcom: camss: integrate IFE devices
  media: qcom: camss: sm8250: add pixel path resources
  media: uapi: add Qualcomm IFE statistics
  media: v4l2: add Qualcomm IFE statistics format
  media: qcom: camss: add IFE statistics output
  media: uapi: add Qualcomm IFE parameters
  media: v4l2: add Qualcomm IFE parameters format
  media: qcom: camss: sm8250: apply IFE parameters
  dt-bindings: media: qcom,sa8775p-camss: add pixel path variant
  media: qcom: camss: sa8775p: add IFE BUS v3.1x
  media: qcom: camss: sa8775p: add IFE scaler v2.3x
  media: qcom: camss: sa8775p: add IFE top v4.1x
  media: qcom: camss: sa8775p: add IFE lite top v3.0x
  media: qcom: camss: sa8775p: add IFE pad descriptors
  media: qcom: camss: sa8775p: add IFE completion groups
  media: qcom: camss: sa8775p: add CSID pixel path
  media: qcom: camss: sa8775p: add IFE modules v4.1x
  media: qcom: camss: sa8775p: add pixel path resources

Gjorgji Rosikopulos (8):
  media: qcom: camss: support CSID streams on one source pad
  media: qcom: camss: add CSID gen2 pixel path
  media: qcom: camss: sa8775p: add CCM parameters
  media: qcom: camss: sa8775p: add LSC parameters
  media: qcom: camss: sa8775p: add gamma parameters
  media: qcom: camss: sa8775p: add white balance parameters
  media: qcom: camss: sa8775p: add AWB BG parameters
  media: qcom: camss: ife: queue params buffers in FIFO order

Prashant Shrotriya (4):
  media: qcom: camss: create TPG links for IFE
  media: qcom: camss: use one lane for TPG internal path
  dt-bindings: media: qcom,qcs8300-camss: add pixel path variant
  media: qcom: camss: sa8775p: add pixel path resources for QCS8300

 .../bindings/media/qcom,qcs8300-camss.yaml    |    4 +-
 .../bindings/media/qcom,sa8775p-camss.yaml    |    4 +-
 .../bindings/media/qcom,sm8250-camss.yaml     |    4 +-
 drivers/media/platform/qcom/camss/Kconfig     |    1 +
 drivers/media/platform/qcom/camss/Makefile    |   14 +
 .../platform/qcom/camss/camss-csid-gen2.c     |  158 +-
 .../platform/qcom/camss/camss-csid-gen3.c     |  265 ++-
 .../media/platform/qcom/camss/camss-csid.c    |  148 +-
 .../media/platform/qcom/camss/camss-csid.h    |   10 +
 .../media/platform/qcom/camss/camss-csiphy.c  |   12 +-
 .../media/platform/qcom/camss/camss-csiphy.h  |    1 +
 .../media/platform/qcom/camss/camss-format.c  |   31 +
 .../media/platform/qcom/camss/camss-format.h  |    3 +
 .../platform/qcom/camss/camss-ife-bus-v20x.c  |  287 +++
 .../platform/qcom/camss/camss-ife-bus-v31x.c  |  267 +++
 .../qcom/camss/camss-ife-camif-v10x.c         |   59 +
 .../qcom/camss/camss-ife-camif-v10x.h         |   42 +
 .../qcom/camss/camss-ife-lite-top-v10x.c      |  387 ++++
 .../qcom/camss/camss-ife-lite-top-v30x.c      |  265 +++
 .../platform/qcom/camss/camss-ife-mod-v10x.c  |  603 ++++++
 .../platform/qcom/camss/camss-ife-mod-v41x.c  |  739 +++++++
 .../platform/qcom/camss/camss-ife-pads.c      |  607 ++++++
 .../platform/qcom/camss/camss-ife-params.c    |   74 +
 .../platform/qcom/camss/camss-ife-params.h    |   75 +
 .../qcom/camss/camss-ife-scale-v10x.c         |  148 ++
 .../qcom/camss/camss-ife-scale-v10x.h         |   15 +
 .../qcom/camss/camss-ife-scale-v23x.c         |  203 ++
 .../qcom/camss/camss-ife-scale-v23x.h         |   19 +
 .../platform/qcom/camss/camss-ife-top-v20x.c  |  570 ++++++
 .../platform/qcom/camss/camss-ife-top-v41x.c  |  384 ++++
 drivers/media/platform/qcom/camss/camss-ife.c | 1812 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |  413 ++++
 .../platform/qcom/camss/camss-tpg-gen1.c      |    2 +-
 drivers/media/platform/qcom/camss/camss-tpg.h |    1 +
 .../media/platform/qcom/camss/camss-video.c   |  299 ++-
 .../media/platform/qcom/camss/camss-video.h   |    5 +
 drivers/media/platform/qcom/camss/camss.c     | 1362 ++++++++++++-
 drivers/media/platform/qcom/camss/camss.h     |   47 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    6 +
 include/uapi/linux/qcom-camss-config.h        |  157 +-
 include/uapi/linux/qcom-camss-stats.h         |   62 +
 include/uapi/linux/videodev2.h                |    4 +
 42 files changed, 9355 insertions(+), 214 deletions(-)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-bus-v20x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-camif-v10x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-camif-v10x.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-lite-top-v10x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-lite-top-v30x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-mod-v10x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-pads.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-params.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-params.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-scale-v10x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-scale-v10x.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-scale-v23x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-scale-v23x.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-top-v20x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-top-v41x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife.h
 create mode 100644 include/uapi/linux/qcom-camss-stats.h

-- 
2.34.1

