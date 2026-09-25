Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B064FDE6F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374945; cv=none; b=eIGHd0b2QUMKgCmIt2V4rKfRqE3BxM+7IZZKY9mUnzNdIhWC8pqODRXo3SP4cw8J69lu4D7/AqTjB6mzW07PC1q2izcKRz7mI+us8YpA+DSf0QxPLfLwToj/i7I0j1/TlmPlnbNnxgm+lG5j8HYW7bPKpuQC1OU59I7j8hNUgnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374945; c=relaxed/simple;
	bh=WDe8Nwp+8tXA6JvRXC4djLa/L7jH5WXFM1d8o/bcDuo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mByVi6cu2Xt3Z83orKbC3EwLNYiOSUOtPZe4IT1DHA/IjdkL8v0lS7FaExBj4h6sZtfrdEP4uhuMJyQgE2U+rMhRn8Ym/j4iEPFl7QDbRd3qNjHcAOahO/41mYuYGvtJHYo6HXMzEotXbJvkUl0FWAO8fUnfvhqvBe2JnjIltCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwUVcUn/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOTkkusI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwUVcUn/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOTkkusI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PIouK22497260
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1UmO4gb5quvleiJFqJ6eQjdTIgUvfS0JZPGJANlm1s=; b=nwUVcUn/sbesiu89
	0Im27RQQaQxZOJOZMyZhBMAlzBzDobwS2C6op74TgxAPFnj0beZHkqBa7c5CLnsS
	+Onoxmf9CEV3vB/unKZ1YOPE3UGaAQQU/n+S/XnZQKzMLu3prC7rS6/ezNBST70E
	lxl2cAsYAR5I4wGm+pGzk80ICPrSurQ+0Jp/sifqFF0tvKD0k0VwPb2X+2CBrIq7
	5fU+OdvOD5/6+FBxw6szO0tHDhKX6Z+Qe/TOce1QmxOqkzIL9Eo88G8qrh9Nq1Dl
	8/USu0aI7xJje5ILNbZETQU9yXNHd2S6krTrFoFibLz0iIe3VzodIXzYDnvPvoWo
	TouHlg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq0bcpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:22:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-338c2e27430so1223582eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790374939; x=1790979739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1UmO4gb5quvleiJFqJ6eQjdTIgUvfS0JZPGJANlm1s=;
        b=LOTkkusIsE9Wap2MY5BQrUzlluLDrops8QAjch2lJNk0q4p+xXbVc/T/fYqK3DCvIT
         axWyIwOK8aPV4rqU9Jx0GgBLqTeoVYOZQ+jKRnTmJzekUU8Dq3W9QlbcA78pt4pURz35
         ZkXffhL2Eg67bu4WTambHRCcKe4MBieyLWRFQNwmHOd7j4oF0KvOL/UyB28vXQ7PkMBm
         m/xPDjXDeECxhgnWmlZD00koalDGEcp3RfD6jModXzrM/HO3h4T9wYep6Ogz3o8csz5X
         mpJn0kW7QPJjcbY/wcjP1r4OEa/gi85D1R0bGg/FQE3RujoNYIe/8aai0HNVcghEw3wS
         WflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790374939; x=1790979739;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1UmO4gb5quvleiJFqJ6eQjdTIgUvfS0JZPGJANlm1s=;
        b=mYphFSlAxMKFK5Ay4s6droCFUDnok41mVBFrZVUL1rlbNXWhRqU4U7xqifK+5qcmua
         RkebIE0vDt2bP272CRmx9pgSDhDJGtx16qJ/cnKarN4uJM/kZP3YMNz8ffIE/xzPv5Zf
         tO3Lg7yFO/wV95W2sRtZHy8grKOioD/Q3RdCYTq565KzTXXVcy8tdnz7eLd9ywarL2yT
         UQYyD8FaNk88OeNotz9MAPjUYeVHdUoRTpE/Na7OcF9+FRYqxz7xjtz9kVbDjByweS96
         S6pwFGWsKEbfW8l+/cZr2Hexqnbx+rm47sQO7CrxR1n3QdrEw7s9dZySR9kt1KdnlSWr
         xLFw==
X-Forwarded-Encrypted: i=1; AKwUvBxSY9EW3VKfZBg9swolS/m97YXImLh1f8IQ5e9aXdN3S2lpFaRDi7T7073CGo906FtpsWvcoLqtttITjEo=@vger.kernel.org
X-Gm-Message-State: AFuF++khJKFj8W949s+qmHZpoyeYZ2bbIEPJFZIJyFULVXu4izLxwKIE
	XzsU3q59J0KgmhIdu256O/GioR3FbFaRIzOfCKFoXIo5uqd2Opjo2c870nALUSiJ+ie9tNPYFLc
	rgNjWI/0oVNLlF+1m1HEcjd34fPimc6DSeBg43qMeq9AGp1Y5OvExIlC2yC1K9jD5lu0=
X-Gm-Gg: AYBFou07rafw5b1V9yAUaqJCJxQJExi2Ji5sdTUJvDd37r1I8/fgctAr4X2CIXBUTQv
	65TN+ibIFnYwWHavpvzcVlplekrghbqS9MUbIksbuA6Q0GXb4Lf68l8CDs7Ab9E2wk5vzqpGdXx
	b7ipGDH+X8eatx7akIJVvf5Fn1T3PboZdAD8GjrWmo6jhs4Px6Vxa03HvMPz3h9VlGoISyPJaP8
	QVCsw676MlmvHjgjZeebwL3x/RfpBzqAcVCqWKGeGxh42nVbVJOy0cXKGwLN/TtjyUm12R2HFY9
	elZ2Fv3y2ep1u+JmjE2PicEIeIPzXGTL/7YBY/r4LBoqdwFRXXvxrPCrIh/4JcTDA87Gby/LeQz
	dPkRQq9h08HOsUWO4QbHCyezVcP58iaP9gf+aeF/8x15zX6EmL260MQ==
X-Received: by 2002:a05:701b:280c:b0:143:296a:c862 with SMTP id a92af1059eb24-146cffbd728mr1187791c88.26.1790374938490;
        Fri, 25 Sep 2026 15:22:18 -0700 (PDT)
X-Received: by 2002:a05:701b:280c:b0:143:296a:c862 with SMTP id a92af1059eb24-146cffbd728mr1187736c88.26.1790374937815;
        Fri, 25 Sep 2026 15:22:17 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-342c9c245a7sm1273621eec.11.2026.09.25.15.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:22:17 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM
 providers
Message-Id: <179037493652.3059844.6860403127536084948.b4-ty@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:22:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4OSBTYWx0ZWRfXzNlwDLcNlbAq
 lfG/CfOZ7hs8MR2USKRgtxK2TrMEj3WObzN2q2IspK2PCWGXoAxZFAkKMAuvQI1aLXGkvO5mGnN
 CuzBuYCHMwAEPRqghQdhhIyNhv358x0=
X-Proofpoint-GUID: 6Cedc2NyVXdMmX_1mlSm0yzsbmrG2rP5
X-Proofpoint-ORIG-GUID: 6Cedc2NyVXdMmX_1mlSm0yzsbmrG2rP5
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab6f41b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3vxmhWUQDq8JHCpcIj4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4OSBTYWx0ZWRfXznxhQ67E7Owm
 1flguWEOa1vuhVwjkkp7rT1w9fkkJDlt42FPmeDzrJV6UXpxU8CkRMDzj9p2P4x2G3diYrpIMvK
 Xir4O3irltZUEIT2q6Lp42GKyE6hwm4AdbpHz0Xn6mD4m0UNmbhoGE5aDKYQ3X1W827wjVDQoWF
 MN3j9qAJVWUlgSHjX9SlC9qFT/MRt+n9AYaaWCUU3POpDP8F32UXnYUWcAUGM9zY35Sq9KRZbKv
 HppizHmDdj2ZFNuDVFIf2Y4dy0xADTwJGajPcJTsTe4U0YWV6Qpx5Qe0Q3hVT/G2gg1iCeVhFjn
 OuCdahV3CfP0gcugsI3j6bKvRB1e381rjZ9/DaLVctpJzqjs136phxMCG6tU6RROHIKKCiYHTdX
 4noTTb6gbifIE7Pol5uKsOaRZvy9005vunrA4HoQ7y/2WFjKvdKBdMWA9y4S+pwZlvP/XkRCmVz
 5JVBFumgd/xaZejamdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250089


On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
> On embedded devices, it is common for factory provisioning to store
> device-specific information, such as Ethernet or WiFi MAC addresses,
> in a dedicated area of an eMMC partition. This avoids the need for
> and additional EEPROM/OTP and leverages the persistence of eMMC.
> 
> One example is the Arduino UNO-Q, where the WiFi MAC address and the
> Bluetooth Device address are stored in the eMMC Boot1 partition.
> 
> [...]

Applied, thanks!

[02/10] dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
        commit: 753baa59527f8e606c49eac25692b8b08918a3a9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

