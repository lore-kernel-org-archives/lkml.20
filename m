Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804EF33B6C4
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791037112; cv=none; b=Lbk48RJtDwYa1bI3bmEEDh02k8NiG7f5TxTC1U+sXZk3pe3kEa2lsm75icLY+TTK5W4I+i2gr+Mz9QpmjhoVI0fNegVRhZC3Yq/dKJmkp341FQBQdCwYtLEi35OEvqM+S8aZ0CCpFCu/Ial6BlCC5ga/d13VWgQGdzHIknCyYfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791037112; c=relaxed/simple;
	bh=1eedhvqEoDar26cNo8xuHHgN8H0ummeN8BgfjAAH7RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AFWdL7ZRN+ByXc8gaOqyzSQJZ+xoEsQin5lgeKd0JATRjwB8XYiwdv1IMYYOW6oZBZ+Ew8cYN1Ghz7mMYjFuJeMSZWjd183xsYp2sb9KBPMoJv4dnxQuzToKXvo7GwX7XuC83/rizAVb4/HnHbOHskjpAfKzzQPAtnwfH7xB9RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1zuT6RP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ljb22v2N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1zuT6RP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ljb22v2N"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693E5qPL750358
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 14:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=KpLq6T5CbATDXOe3S9he3OBDjINXVpPEk4u//5by3IA=; b=f1
	zuT6RPpHDQJTsLLNaezZEgZAg6NNzu9DOXrxWSUeAGkNZ7rpAv5GxSKthakUhnSo
	dmfVV2ldK/6PZoIfu2HczusHypT8zG+IpnWAMwHpXSsZwZkunZxtJquyOjiEgkWg
	kQOD/wFmg05yBrnVIk388C5ZHEX64YEQnkmhf558XF458dX6CLuhbsEbiwd0exrr
	Fekjxpc69dHlN31pHC+7bLve94NueU9idNkl88nO16o5dpVyoGSXVoDvsXMHrebK
	Ltw9WpCCbkubsTZinyRGv+p4SOxSYQy8IPMlomkGaUxSojtKQOCCwPKJ5VMHKTud
	rg1KSVjJO+GYpZWvM+NQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa16fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:18:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso15360185a.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791037107; x=1791641907; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KpLq6T5CbATDXOe3S9he3OBDjINXVpPEk4u//5by3IA=;
        b=Ljb22v2NccdmSRPTVhQwBsnlNZ9RYrrkZeN/7VKlQmQ+3dVPLam6RqTqvBPTpu2enY
         an1TO5S2Z2woecpTSLwwG9SExi+hWx5cuG92M/nF2yiwh94S6WlBf6+SAw1TSVvHZSiJ
         nPx4gi5MDziBaCwQNOeyombDslB4g/CZwiwcdzZRuh5H6vqRWbJoeEY6ZomGuiGqxceJ
         88WBmoQZrvRS+nxwN2VYjk1GyGHQIb/CIk3lsEeYmnGaSMolLHQMMVFEv6xTDrtQGyid
         eDPzCqSvNZgiAEVkooL76+mtwzBf4+1wLF/4g2i8jFQC/eLrP8hv7iicG2tR9lEHjO7j
         lofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791037107; x=1791641907;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpLq6T5CbATDXOe3S9he3OBDjINXVpPEk4u//5by3IA=;
        b=MVbxlc9H2yCXknr3JVoy4Ds0TFcBsh6X4GEXit8oAOob0rgJfAY4La/fUJXehmT8PP
         ENCgbyBU8IDR7ID98PQuxkFupZFy65CjkDJBE+OmxaMCtrSvomlOVNYJgPsfOigl5HYb
         OxFzUnL1+eZPzjQ8aSaWz28OMKPZ3NhWxI/qp2albw0tx3IqomI5rfqwczHlTb0t0BT8
         sEUUobVmO5jRjbVTrFEKTzMLlpjcslzewDl+oviFHmjKEChE0pwYdl2SMiHxx+vj6GjY
         L/8AxV1D1UDduj8IYBieHvAy9Md+TsINU/dNxCov9Yl/eMZIdYN5khIhHIkYUiVsmdSI
         rEng==
X-Gm-Message-State: AFuF++nBbwTmCbIy8I3fn5Fs4xvvTci8M/ZwAh/VxnghYHhzTszZsuHJ
	gM85GmZzEnhrSd/buq0arfskceMU2PnoSoAm/Shp7tlpYmt+dtFuNr3y0Yt4nw/zgRW4r5/2o29
	F01Q20N5dB414mPNCwQa2lPUZoOpJIswx5vvvUvI69Gpg9BB+SoBLxsLzmx7kqaxPl7Lb2DrIWs
	WbxQ==
X-Gm-Gg: AYBFou3YYCOihjZ2o0ncae/F05hq2xjBtqMFyBIOTd7ranGD9ZR1eYTnxiAISV1Rwo0
	OQmc5PoRPUV6dzOf/YE8BYB4Dddu4krz3q8Boqr3i/W3SJQBYomuG3uPoDw96OsaaoqmSbH1ci0
	oyh4+B9MgOtL01xv1Y0KCL+my2PSbS/JKdAxGCnY9C+u1qIBzi+GheT5BrK/SN6sIk6a369dTRI
	N8bFOkm1In3+XprfU3XpSFmPwuhCc5hsQOxzY6zpZM7dmfACGKAYTiSTTah+RlanS8Hd0OUbAS7
	7ohR+p/F+VPQsW5qXqT1HDBevXZrqv8DwChZjBFZMQ0aplGT5e01YOZOTpN6sBBg7ZyYqSVKebh
	SWGFHQfKfJq5WKk/WLwFN+GJKiszuF9EmoiaYU66hx6ZbZg==
X-Received: by 2002:a05:620a:a415:10b0:92e:7d53:8e8d with SMTP id af79cd13be357-93cf16dae99mr844771185a.27.1791037106396;
        Sat, 03 Oct 2026 07:18:26 -0700 (PDT)
X-Received: by 2002:a05:620a:a415:10b0:92e:7d53:8e8d with SMTP id af79cd13be357-93cf16dae99mr844766585a.27.1791037105971;
        Sat, 03 Oct 2026 07:18:25 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e59dfsm884481a12.8.2026.10.03.07.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 07:18:24 -0700 (PDT)
Date: Sat, 3 Oct 2026 16:18:22 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE updates for v7.4
Message-ID: <20261003141822.GA927567@rayden>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA1NiBTYWx0ZWRfXytDPQqqj/UwP
 uybauHNIrr2GrsteonmcFg2gN1f8Dx3gGYGPYuI/WXQyHOYOL9eXFyDffKxIffIAo94cdMOYt3R
 OFarzVwkYUUn0PQTHtidEXcnqPVmGFdnaMfQM3fZXIan60C3QtA7j7yBIT5GbEn1MjRXxPAuvFi
 g9fRwzG/wXBGhpD9f6tL1ZZ1YRai/JYEF63l3matT46yDbQmtabhLZpRY1dcAiJ795TZnqC+6Rd
 0Hi+4BNSyEgdw5XszU8ybP0WyP6wkMgPgjp96Qe3SvRIaNEam8VZeZ5zbzLGAPJkBbatvdzYsqT
 m/8+swomHgH1V9qezd0/VYx79utVW+RH8LSlymXDLAMnaGztLyyn6FsxL+0rPIUZBPq8f1Y5gba
 ySpHCqALiOljyZ5K9I2pCdR8F+ACBXCN3elU7LcRoQ3Bj0rxKoP0kiRqQibROOGceWmvG/XLgaN
 3V/XQGU4Q8EJwOz/W4w==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac10eb3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=DiaXWS5xduwjvWiepNMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2C-4_2kIE0RNiJtePqjqIExH8WwlrCoY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA1NiBTYWx0ZWRfX1Qx1O4nU406p
 dXoAiTTnXfW+cEkQdudjksgWUxS5mGCiFuw7XCZwR2fScTI8RbrWrDxmPEOZRNPER+NKlcKnhR7
 gWMsFhAV2/qJM3eG26TM4XIRtolnPKc=
X-Proofpoint-GUID: 2C-4_2kIE0RNiJtePqjqIExH8WwlrCoY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030056

Hello soc maintainers,

Please pull this small patch for the TEE subsystem.

Thanks,
Jens

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-for-v7.4

for you to fetch changes up to 6229fda9a88656ea7c727c3e2401080c5d3efbc6:

  tee: move tee_ioctl_shm_register_data to above IOCTL definition (2026-09-16 07:52:31 +0200)

----------------------------------------------------------------
Move tee_ioctl_shm_register_data to above IOCTL definition

----------------------------------------------------------------
Andrew Davis (1):
      tee: move tee_ioctl_shm_register_data to above IOCTL definition

 include/uapi/linux/tee.h | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)
