Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9257B4052C7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638269; cv=none; b=WMC9i2w21xggXE+qDBnqmYnBfGD3gPig5ccubyukpxOm8NiFibKlfMeg0AxQN5ASD0RXpAga0R6pdLUFwyFE0KLfun+wB2/e0AZM8wSMObTH8bK9OQAM3vVsucQhXqOkS54ykEZzmS3nOi/Z73GK/v7oM0PQg/zNZRq8+oWAzJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638269; c=relaxed/simple;
	bh=W3avD/gwwEkeiicWHrArtYtKTr1r5cPUIp2WpU4qAoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bMhoCzMQrpNIzerJAXANBC5iDCOrbD9BH5hciprlnLTaYKqSBPiYJd/+wwEGtwEGl40Y6pGgXVptDMzOnhFfOaEbJxiXNSyT7IKdGMFj9DfLm2sO9BqQiil4mwxnNryo0nbBR5evuDBrd3DvQiDrqtJnVytSFCOKWbJz+dmBK4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3vQ+B+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLxinP5T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3vQ+B+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLxinP5T"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zld71150749
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ka3m7yPQ6zXpaZ43TO2KozhhqfAFnwYtxFW
	YYUMBqKs=; b=Y3vQ+B+Z1ecneAXa0LqLRWyTCBNGfHkcOi0J5ItWYzGcKZ/26VQ
	8PdtJfAts7FffvIKXWog/HBqpgKqMP+QJEE7xrzB75uErdlUFaJbU0eGifhGFXV3
	dzul8nXZLPHTiWTErSwr4UGwv9c6romnIKMqtwOuyHXLIaLgcw7Y4OTMLFvwjzcj
	xFJDYGslHOljhLMSag1FNde8MOSue43UPini1C8WrlYYi0/LrtB+WC/hqG7InHhi
	tlJzXH/8Fwr/IlMEzAD2K7j930N2CliHJtV1hxEST/nvfwzlMZjyc0FOuR7Eg3Ae
	+7fDfEfAtDKLGWBsxrP6IOOUfK7zSpQ3ZIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grc9w8dxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:44:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939a6937513so86933685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638243; x=1790243043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ka3m7yPQ6zXpaZ43TO2KozhhqfAFnwYtxFWYYUMBqKs=;
        b=FLxinP5TUfLQilmCCEyeoll1PGc3srvzJVNfu46lj6o3TqdMWyn7sW7XrS/fTp+LYG
         25COkbKBplJ4PrMzuy05Nc0Mr7MuOz4Pc2KcnzCNoYkEUkbymna0949D9sOyR3xA+PTb
         JF1iNmIvK/VJBo6hLAN4JBLo+hj6B1O34+YrMrdhtSeqjBppLGGWGQ3PNZvWPv5+R/Ag
         ZuQA8E9DvtTllkkK88U84O1M3Tvh834dzfMUJlgW1zwOx64TwSxZIErn7xO2rwUup1ci
         91x17tvHvIbbcy8WN6Bd8qbSOMk3KCUIZWbBSDPEZkvEhEAlUpcW2ysebbVaUaYQ24SR
         BNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638243; x=1790243043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ka3m7yPQ6zXpaZ43TO2KozhhqfAFnwYtxFWYYUMBqKs=;
        b=YMxdZo8mXOKsvCa5IjMdYYvh1SBcsnKIRNz7WuEr0fy5ZXyUbRfFhPrdLTnT6ebP09
         5EkSWRpG4SYDVShSngB79kSUOQSc1dAnx/aKKgPlz9y6djk0s7iy/UYuJpScHBKF8ySm
         qKHmc5Xgvf8dCLTjl15NX1fBkKVumZjodrxn0e08XGyNQc7+AMBuLIKCrV+XOknUIg1K
         f9FVqqyGmkXxeBNmM+EbbNoUYrSzmf0RaAMtabilpRB1mGTapZUMzWT/N/iQ8fSWRr+E
         vMhl1GbV6u1w4ykai4GrCiCaHRXIBhOQbWUOyjGH+JtR1OSV38Z4H1+Q3zFwyrD/tdFo
         TUZg==
X-Forwarded-Encrypted: i=1; AKwUvBxCgZpxaqxUEEoeWZsBixg/QxtOd9PwZDM+pfGXKNtsL3Y0KwOs8mmtpboRNzHjPHRjBoB3ZlTVE4gOFZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++kEPwwYjHeBJ6gpuXD2l/elOm52jabLLJ/rW1u1uTuorO793M9l
	NqGqkmICgwo+4g1zo5YH4y37IDeL0rB4JFEHule5sX5CoGWwLRuSjUkSLi4r2N6B58awwdViRqo
	P7YOseTMe/dbritWHBGVwFvYoNo/lzsQqmM6e+nDuHLAh9xPijWj0LVxZImPI15ysXFiM1x8HHc
	8=
X-Gm-Gg: AYBFou1JwLCheQ1sVGhb5ViZE22Gemwxz6IRUDFrWH1Q/Zhnb1hEdhfaC5sKzJgC267
	BI0Sv7yGyyVFOYZwAH+6NdjiP72AZIfjeHKzzv8ibV0sRyZT6SgMIYqcjS+cC/PCwec58iVGxuV
	5JYxAo71toen3ingsFw7ycxbK07XwcVQ9K0yAhRG3cLc4VeK/XGMa24Wal09M4qcPHcllSalyzz
	XVslAy2QsrqBxE8sfdykQRZ8lk96TKjVPNDEHlcOtM3Bb/t1F8W5qRra8CHOEbXoOD4XBxvfVI4
	72R2yLzx4j1IYznNJjkrC5S8MIpfoRfIWEYH5ZDXjlc7Hm23hioXM4QLTghP3+u/RYeOlteR+MM
	1G5SGF8LWdP1b3A+9ZD2gC1YdZ6A=
X-Received: by 2002:a05:620a:470c:b0:93a:3c8a:2025 with SMTP id af79cd13be357-93bb7880659mr1030779385a.34.1789638243008;
        Thu, 17 Sep 2026 02:44:03 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:93a:3c8a:2025 with SMTP id af79cd13be357-93bb7880659mr1030775885a.34.1789638242561;
        Thu, 17 Sep 2026 02:44:02 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbda7c462sm515895e9.4.2026.09.17.02.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:44:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pin control fixes for v7.3-rc4
Date: Thu, 17 Sep 2026 11:43:56 +0200
Message-ID: <20260917094356.7040-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzMSBTYWx0ZWRfX/MpT7BCQfT4w
 Blg5XJ6TuHCWp89qrN5St4s2m79JfqwsTSb1oc/SGx1mpXfEzfAC4QnERRQ8Ap4abvHWFS8nBon
 FwkzNHRDjn7R/W99KUlwb5gWsZnGJkQLLbLVt8dIVdhBadh2l6P8Ul0y3yWim/Bqw3cEoi0LN8p
 QAtpjLMBn25WA+YG2fXdPIjjKMG9/RTP0nj0ibgzzWZaCAu50788PM0+LXFMmGoLbObH/Pi0Gn2
 ZBKjD2QgkLfiEoRbKGmQ8jBiMglvy+I1QoDl41+0Frdm3iHHl0aDnwv1If9uznVf/+7KTFJbU/W
 eM+YRJq5JdnHEN6j4MM22oBno20bekNJx2z+aO/WQyjygYxkdTgWk0tbhUcqvJPSr0yf7ivYmgB
 ehx9sjufVQDgcOBDnpox7qJDqHfopbpK4NF71bSechU1dazjWv48B8zg8DArQgrOtVuyFFM0yQ5
 SqELc2QLDiw+aDFAW1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzMSBTYWx0ZWRfXynmzMZP692JV
 sZb9IqNOQTuMuveJYrbO1osQXkHpG90WxHUWb2Qs9UWQFpK+D+p9wA/ZIvExMeM6KyVwhTKRp8D
 kk/UAyDO3ihAjiFdSUGE3tnTC+jCCIU=
X-Proofpoint-GUID: 8wTiGuTXVt1-o_ogfu0FTuY3i4BQN2QD
X-Proofpoint-ORIG-GUID: 8wTiGuTXVt1-o_ogfu0FTuY3i4BQN2QD
X-Authority-Analysis: v=2.4 cv=EsZHPicA c=1 sm=1 tr=0 ts=6aabb663 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=P8F4T-NFUzOHK0OehmwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170131

Linus,

Please pull the following set of Qualcomm pin controller fixes for the
next RC.

Thanks,
Bartosz

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-fixes-for-v7.3-rc4

for you to fetch changes up to 818103dc7f5998a0d7957fb71d4deecdf4d579e1:

  pinctrl: qcom: ipq5210: Publish the OF module alias (2026-09-07 10:51:54 +0200)

----------------------------------------------------------------
Qualcomm pin control fixes for v7.3-rc4

- fix QUP1 functions in pinctrl-nord
- add missing MODULE_DEVICE_TABLE() for pinctrl-ipq5210

----------------------------------------------------------------
Shawn Guo (1):
      pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions

hpp.iscas (1):
      pinctrl: qcom: ipq5210: Publish the OF module alias

 .../bindings/pinctrl/qcom,nord-tlmm.yaml           |  7 +++--
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             |  1 +
 drivers/pinctrl/qcom/pinctrl-nord.c                | 34 +++++++++++++++-------
 3 files changed, 28 insertions(+), 14 deletions(-)
