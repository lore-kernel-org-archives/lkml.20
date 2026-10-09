Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1614772A8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531348; cv=none; b=mQhZSrPgp3h8qxUJr2NcIHs5YOFFRGFw3ljh4s2O1QlUsmMDVuFk2dQ7KCcl2YvGE3vozCKqG9bkv/WG4xt1oVxdcwHJMkE/qUkUMUbKlOoJYmMKLkF9EC4qxLeg2Y4g30KD8wJtfnU7EIpzzXZj4CzJz0yKC+MclMgLTZWER+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531348; c=relaxed/simple;
	bh=A8Q0G9RYTiBHUt9HkBBuffrTETErXzLM1/xZEC/1Hac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qQ7PdzPeTAp+evRgqDDHvsD2qZ2/pG35MrN9TaU37AC3bXSm1szintWR8nuGa5mVqtlx6NTFRxdcu0qVoel0S4g6Xb3xWbjTFEu9duai1wjYgC99koMMJ50j5mi00DkzAgBptClr55HR0ro++a5HtrNbWb+l2+T3Ky4+6no3+Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhbeYWBH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bY4CyXSl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhbeYWBH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bY4CyXSl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HLMP3768939
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 07:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PRGTcjOJL8YJLa7aIAW0+Z
	7YGILGnThcUoLje4G0jxQ=; b=WhbeYWBHMQHa1tVqyE7f5on24w88W/FIAcCnRA
	X6EUffna+XwZrcb13aOPCHRtnWFmgdNnc+y/Jyvv+AKq3531lgWjl5W1QlmV/XF/
	BoiJmNpszEqZualoeFYJnfzc1sXPPdwdDT9W/KZisP0YkgdDAPm0ExsjKTf4HfSJ
	9fcssUKC8SD5GZfEiRevNkJBX0cdK2InKiSlt83hVEPEeLbjOyM59glJYUg0cXDr
	jbWo0lxuXhZWOlC681xV76I6jSkl1SF1Kc5JRcU6w2I3C7hOZeWfYqsvnrmVInQ/
	N8uvW12mD9s6tkbu3EgkuHXRIrE25CUOXbpU6wh/h9UUYgBg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu2fft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:35:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35156644c96so3190526eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791531345; x=1792136145; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PRGTcjOJL8YJLa7aIAW0+Z7YGILGnThcUoLje4G0jxQ=;
        b=bY4CyXSlfvNjoKDC6Jpi97flTB/nV6TcVY//oYtMeEZCasRZYXiy19dfkz9GSXZycq
         iw2KP0iYGmcMpDGpb5X6fyX2TsuQezC4DktMqhxF/goVH6id8p02lrspbSkAGqf54JQU
         pWxoa4ugxJP1ITeuMh3/Z5rLyfeO99mNz82VwqdRG3d0NUnvwiS8jRYJHQid5xrtv5BP
         8tduIzaXVUtLldm8kQdT6wEnMgZ9B/ijfc43ppyd9W83dm66nwwdxuBUuVbplEHKVBCm
         rR9H0DshInMtu+pWMkVh/00lPm0nBWGxtnAtSX9izn1od5jOBJBvebAr743/02SGG1dE
         W4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531345; x=1792136145;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PRGTcjOJL8YJLa7aIAW0+Z7YGILGnThcUoLje4G0jxQ=;
        b=vPvgWLt3p3CKnLDUjadM1FioDMZkiQhVdk+RnEg+AvkT+pJGrYQL6slU2ituCdULFA
         Bx0/L+zvVGai2732YR+759P0kd3aZRBI0jVbAZjJk++rybVIjanPVi340cw9pq2jNAMo
         2Xm6ySDixvcrgbOSnyOV/nG6XK7Gj01jaqLerIVXfO9o4sDCx+0KYblf44XYdg5Gu3Rw
         35FBqIx/GN+x4JEycZBDGcrSEBmygl2ZAMtzUUWdlAyvki69dTPtke7yfISdknNZ/J8S
         tToE7Il72348p6hqfPR60zYCalU3T4DLVfndtx/WE6UgZp6e87CtgtM/mByfzJAytmc0
         lf5w==
X-Forwarded-Encrypted: i=1; AKwUvBw2ztkmjvXgClOGJPfbeuQCkIgpTql/ncOMpMhvf5ncxCLHgwxLWocwkGYoFZg0wW/I0G8Wlt/MoDxIAz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRvYstgcWYEJwJMYQrsG/riD4WvitUuiwyt0z7FiDPfr06ok2R
	SG/zQ/ANqKCTHk6ISFWV1QXAIWNdCEjakwO9hoKCuBEJgXwFo9mxPfU4SqOEkDs3Wga0/dfFsAj
	4J1aCb9eDd46sMPskBFQqw9VdipQ9m7Hbq6XWZlhC4BQqv5sDWZLg/NqHn4ge8XfyDtNXrLxDki
	RccQ==
X-Gm-Gg: AYBFou0HEttvRjz2tm/4X/9+qXeubKvdXuPEIhiAuvyXAD/Tf5aBHURzJiu3f8K7sbc
	1crHCs4SeauwbIfDlQEXBCcjmFF/wyT6EVV6Gd3/FDeXc34xUzND72EsyYWT4lu3q3ALqSWVLi8
	+1iVZkz+7Ap5dPE4l9rYMEjkug9Z4E4+98YDDJpbkvaGIvhS6yP/fGNwPtZl69aprS9m/Ccuiom
	qJLU9cGLWRciun1VWdG5VCjtMAh1D3dCgRhmVRRQKC382Yx2TNsZh7mCMV4M71EfEV/NCCHK2MM
	teaKq2qeK94Dxt3oMV18Aqfmz9uf86jCjrAaZlxYaYwN2c6rnsgNycIqlkt9BNlKFawfI6VrIib
	Zr/CqscbdLzDkxxo2LbsL+XO+i5/dDkK/bQ0Z
X-Received: by 2002:a05:7301:488e:b0:351:7ec4:8e41 with SMTP id 5a478bee46e88-3537e011139mr1776468eec.10.1791531345095;
        Fri, 09 Oct 2026 00:35:45 -0700 (PDT)
X-Received: by 2002:a05:7301:488e:b0:351:7ec4:8e41 with SMTP id 5a478bee46e88-3537e011139mr1776435eec.10.1791531344419;
        Fri, 09 Oct 2026 00:35:44 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm5658974eec.14.2026.10.09.00.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:35:44 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH 0/2] Add binding and driver for Nord SoCCP
Date: Fri, 09 Oct 2026 13:05:38 +0530
Message-Id: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqZyGoC/x3MMQqAMAxA0atIZgttFVGvIiKxiZqlSioiiHe3O
 L7h/wcSq3CCvnhA+ZIke8xwZQFhw7iyEcoGb33jrG1N2kM4JlK5WCc6Z4kkcTVIrnKItceuhhw
 fyovc/3gY3/cDjZ/QhmgAAAA=
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfXznO4BWo3kCi/
 gXSPzCvjHLUCks1dr7fvVulnytuHsXIpm8lLop0cevTUiAb+LlV29l1C+V3S66V9wnrzg7SYDhH
 UzL/BA6w2iGB9d9xhh9zGM956NhKP3+ctq/0nyqbC2k6+H25mAqrQRdRlzfCeDDIBA3n63U5fBD
 eGBK/ALTcdWHagShneZUn+1flYsa3QUUnj8OXcJikM6dh3CE6RY1Rn46HBOBWY24Y7OjQJRLtpI
 f0ufm4CA3TLbdslRQOUSr0mHcltq+kTC0xxNy9tnAXBJU7tYGJuSTE22Vd4NZSQIHatRImqId0A
 A6hQRhAsHfQZkbjIUIF4BjcL2s6XO9R15aZ7t9gECgTo9r+tP3jBtPhoQbZBb3IZssLbq9lPkz5
 3Ku6o4rFbNkzlO5G2lj+np7yIT9d3DThh1JC/VncduvcSPNzUaN2u3S9bj6rSiSeeu7sC85ezjB
 rAN8PspXQDbzfK7I/tg==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac89952 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UK07lOcsehyZGIaRmRAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: ol0V5Jj_zGXqcTorm8WDpD813k3cJ6vX
X-Proofpoint-ORIG-GUID: ol0V5Jj_zGXqcTorm8WDpD813k3cJ6vX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfXxsy7Qcg77D7j
 2qGE+nFrEH+8MIQz8sXhwhhQGg+6VTvZTCSXGHHpIeSlDSjj6msD9dl1P3S2Ok4BTDvrFW+YnyS
 oDQU7YWczPA7PKK58XfflctVo50pKnk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090030

This series adds System on Chip Control Processor (SOCCP) remoteproc
support for the Nord platform. SOCCP is a dedicated control processor
that handles hardware fencing for display and other use cases on
Nord-based devices, sharing interrupts, SMP2P states, power domains,
and clock with Kaanapali SoCCP. However, its firmware ships without
a separate SoCCP devicetree image. It therefore takes a single
firmware-name and memory-region, and cannot use the Kaanapali 
compatible as fallback.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
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

