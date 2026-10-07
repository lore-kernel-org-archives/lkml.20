Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C0E44A40C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363653; cv=none; b=YjK0sDTMewNRt9sn/h4c+uJUoGFgahg8RMmAt6NPpOfxFDlXLfMeauyJoyxKwjQqjcE/JvQ55egPZrd9+PYLsBqU43hRa/46ro/NMMoGnrHpYOfmqLN7NYsK55PWshltctvy42V3ufShz5HqK+AjKnVuINu+Zf3SFutiYAn/ngU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363653; c=relaxed/simple;
	bh=MuxAKhCPMW6q4QLjaUI9ZTb1vgE2jca/P8uL+kFGQjA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TGAhMf972v6SslFFYFJGAJe9ONiSqcbFldxIdBYvTH1GTI/CX2dNEk/vwDCK3maAqqpPJvhgbJWAAOFA+O/x8iMWeZV4kZXathKx1Kpr5W+rgTfkOnF0cS2OZWoNqzIdaBwTG/tYBH6iODyGWqkHis971SSj0unExw5bLmGUoTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xpf6P7Cm reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xpf6P7Cm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jT9D3298200
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=n9Tsd1zqBlO9TKpyNgR8ODetmwgJ/yduZPe
	DX+3QGow=; b=Xpf6P7CmgioMnGMJe38813o5h4icjIRATUOMgbzz9kqHM79zn4p
	KINbZMqnwGHtNJ/3G84YAUqowJYPqvv6oWu+F1sStDNcCEeC5/DPAmuja+4mW3PF
	E9a/jqFwQ/VPkT9LsnsCl5bK+vX4To6GZWUolXsXbBhPiOXtj6b0dXrUgjJw3+Ln
	lfV8YytOhjMQx2mKxXAisntdWE3CtV0WlwVK07tG5hRjJgm6AitIbB1gixGh3Rfa
	ZVxiBjeGXEgpTYV3EePte4oIerujIH0fBwx6iNxdH5/K4hVkR+o2NYv/9AoJTQzA
	sRqNvUULqhVsUOYT+ZdHiMhPd3MANVN/q+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrbn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:00:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so700870885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363650; x=1791968450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9Tsd1zqBlO9TKpyNgR8ODetmwgJ/yduZPeDX+3QGow=;
        b=FBf26hvgLKDJwEiEs41BWyMrKOSoTyH/fVzZ6Yz/24dxV3u06v2SbERq/cB8XapwLv
         TX0Oaos3qYM6oRDHJV3Ag8mFH7dXYOZYJ9sIi7IHR0eeKDCxJmBIO3lD1ZIj3PR+UJZM
         50t2DJfOsASbDMIyZVUkJ5cwzaCN9chGC6o+dcu5O64gFvpy7MI3PtuIy4r9r2pBibes
         q2lm5lMHX2PyU8N+dKkFHDE/aV0AcADK13HlBnURSZfJBQCzaWyysxUe1ijjWg+4jOkK
         RenPpcoH3yUvKKFBjUVNAt82c5kym9LUq/h00G96Oku4rfJpLwoO6OJ3Jq1twxETJ1ro
         74Yg==
X-Forwarded-Encrypted: i=1; AKwUvByFkCnTlq2uAGRkSjj6gBQo1aEo+ibt+RUqcpsKc9UJn08fJoOUI/alwIbDHsjE6rmFoRW2fl65ENulkxA=@vger.kernel.org
X-Gm-Message-State: AFuF++lEqlVhk1KOVtr88oGKWnWqyQi10AdBHfe+C+jFc4Q6/neU7KUE
	bTCpkoR0hOGEUVx5ycRZmq6wdNVrqPXoIMq8+tcCkKTcJSXO65S9qoaFNM3nM7fXdpqpkg3KvAD
	d4cRUUAcXZT3LAahDKfD1OmPT71ko2KDYDvDycVHxXX9oBP6EKuyQmeK2/G/BWOnfAzM=
X-Gm-Gg: AYBFou0yRwDNg+UdexQWIvWEnEsl8Kuu7RlNVp1ArtI4IsdpdpI2GHEdtpDkmoEKFfh
	BMYlHVnb3ecNHBFkLdUMv5CwvAWUQmQJlszxS+QdjvuMEamkSymvnpn28XzlRNvaGrdpo5V9yFq
	hI9N0ZuInFcpt04+kEjejaNdN+WHWFjC/H5eRGXHJ063BBnMobywDn79vGzyGytaAKzQTL3bY5w
	KwV8vf8h4rho1PLO2+Aqt2QptBvDFa/ev2AWCfOM4MvOp5qhxlt9mfuko+nJ3CNQ1YEeT9wThRu
	9SMDVMjNRcmu8obyDbhhKluPVV5RSiOhEpSlAradvg0PyzZbKpbgi5wT/lU=
X-Received: by 2002:a05:620a:27c6:b0:93e:9716:3d11 with SMTP id af79cd13be357-93e9b7865e4mr292082485a.34.1791363649958;
        Wed, 07 Oct 2026 02:00:49 -0700 (PDT)
X-Received: by 2002:a05:620a:27c6:b0:93e:9716:3d11 with SMTP id af79cd13be357-93e9b7865e4mr292075985a.34.1791363649454;
        Wed, 07 Oct 2026 02:00:49 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:00:48 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 00/45] media: qcom: camss: add IFE pixel path support
Date: Wed,  7 Oct 2026 11:59:56 +0300
Message-Id: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CUDR4ZG1h22D7PDvNLgCPcQsspgBl5b9
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac60a42 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LzdgNzxw2tJgtqBk4dYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX/4GRepWlIt6L
 IFBI7+cIZZH0omMcer624bn0LAU8YdhbauoWBNL3KQRsJwoj0F0icEOYs4/04XOZPvJ1aJ4r0nA
 bMLJllFakHanYO428mRmw2l9z1v11PA=
X-Proofpoint-ORIG-GUID: CUDR4ZG1h22D7PDvNLgCPcQsspgBl5b9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX+hqmp8GYttUg
 BfzcGMnoLT9vn0h26iJW+h+N612KbD78AScwNFn40A5JJqxD9+Ii+xVmK2ap1t2qaIDHtpy+Cgc
 tx9r2dDV5uPXkTz+U4tz86nGUXfcj/OuCKJH39N6JiJiR0VRfbwyIAp60f+k+1siBLgWQknJsh0
 bR2nhOef+ybHgHTqlH8TgLv1q8xmkvsQPjMm0w8y7kyN4lCdYzgPtocj7YK+vKXdRRaUiJLCF1P
 pwEgFqv6DVIjXimHwTM4mkYnsZ3qCSi/5uzOq0E+pJiCE6rsqzAtVg4lnYwLVgu1T69E4LcO9bD
 L+IrlnGJs6L1WLfzFbPjzyqceb4a2QR0D/3hw9sIbaJesDJlD2D11BWDb3fjW7Rf19kTj2S+9EF
 voakTJzZZtA+5bUzmBEd5Enb+4fYuB4IXOL6Wfato3NlOQ9KrgsicD6VUeOpKBWp3iq6s8Sbtzl
 L+YV+eq9VHcK3sSxv0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

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

This series is based on linux-next tag: next-20260909 and does not
include the PHY changes in CAMSS from Bryan's series:
https://lore.kernel.org/all/20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org/

Depends-on:
https://lore.kernel.org/all/20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com/
https://lore.kernel.org/all/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com/

Atanas Filipov (35):
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
  arm64: dts: qcom: use SM8250 IFE resources
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
  arm64: dts: qcom: use SA8775P IFE resources

Gjorgji Rosikopulos (6):
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
 arch/arm64/boot/dts/qcom/lemans.dtsi          |    2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |    2 +-
 drivers/media/platform/qcom/camss/Kconfig     |    1 +
 drivers/media/platform/qcom/camss/Makefile    |   14 +
 .../platform/qcom/camss/camss-csid-gen3.c     |  265 ++-
 .../media/platform/qcom/camss/camss-csid.c    |    8 +-
 .../media/platform/qcom/camss/camss-csid.h    |    4 +
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
 43 files changed, 9123 insertions(+), 146 deletions(-)
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

