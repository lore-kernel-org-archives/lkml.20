Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794644344;
	b=qtdgFl74tLkQ5F7l3fsyiw9eB9Lhtpz/aTm4yyP9NlcghYqx/uvF5Ptf10lBaIB8yTjV
	 AndFzJoIRW1t4RNNepnmCqjZN3eQHoHoFxukQFfqO0/nz9xLbeG8GUUjipfhUGVV1eZVL
	 X4YfV3HgHyqzBSiJXQ8jKpGALJYAlAyHX5jei2/1+iIJpGxb8iPEcSafQ0o9qleYSwO/X
	 MQDk/uKQ6kJb8dc69n/TagmKJ2njGBb10kZ1SttwQM3rpN9RKKoSEQ9TZtVZ2M6bVfglU
	 MOuq/DXJ1lx3nMZk4vkHkX2+Z2JLTILlolF170ZVx8OzRITzzE6M8LTMrSRg4ieL+Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fKzcjFxqGvvYnRdzMZQCZdZZhZxsTy33VYOqVFlaCgI=;
	b=f4EEwcBH41G6qaQmyxrgFKd52HK7ezes00XSEcUR4nmCZIkLsyT3y7Fk/wtmBeK/WlH1
	 8dtwS0c8dXf3hfG3EVU7lRfdII69h5nwyDOkuQ4lMV6H6QqbCt0kz71VwPRRi38fLOcE8
	 2/6UwnMVcvLSZQiYaRcIgepN80R0CTOQUBnwOipwPPLSFGRreLnrzbcr2iCZBE2LGXINX
	 jLlQvm5+CYYN73WEb/MQkOjT23QcNg3ufVbBHZZxl2z2i5Pve/2B2EJSYDtTA68/fWyvm
	 Lbdw0jOgUcxZNViBah4ksstid30fT5tdS1jkUsXdyJp3ph6tw7ZHc+iPdeNmiPCVD4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2lsw4oS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YZFuLoJ7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C57606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C57606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2lsw4oS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YZFuLoJ7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE61J2h3882137
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKzcjFxqGvvYnRdzMZQCZdZZhZxsTy33VYOqVFlaCgI=; b=g2lsw4oS0C7kW4+U
	opEiTfMF0LUYiQau3gh3GvXBGEhya76EPmzdl7rzJp0gn488egNSxOuQFZ5glSqH
	iVDkJ4JP4V+sZKVC6Ip+y4dVBjFTPfl8iwMBn7XuQYnARE3Subi87vAo6RrFyHgp
	/hgH+KTJFe8gxoWNmdLnD2WacWtj3a6qSMangdB3apVGNEMNojdYzz7piRjXIi0J
	7txafB6pHCJrviHm8yq3DmB/V0EwZssYEvGd2WUR2m+XC5NihS8uSQY23N8U2GUv
	GwskLP9+1tcdg/P3krNLXgTa+62rB/YVQbEmGxDxjePtM/GLS5uKn7Gc7GIi9Laa
	C2PbYQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmag9fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:19:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e942b1cc86so16030455ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:19:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794644340; cv=none;
        d=google.com; s=arc-20260327;
        b=IeswySob+m1o3+bLine/h5lIry65OT6s4P5xh9R37hwJZZJZ/3CjGmLKtmstbNcFK9
         NysNtxT7L2VyVPztW0yl2gr8r8ShcDxbo0s4nKpPIqPBp9V/K0u+mtW5yiJr9byE7XtB
         LUqNuactlJNedqoeVgUNNU7F2oqBHSQInHqh/1t+j6ZYUvFzlr0snzToiiIwhzIIWpTW
         ZWeewpqeYJdCU1BqbM3TpoHw+MqwVFjpngmenRe8O4WNY89XEb1zVxzr9D2y1gQ307ik
         a1GeP5a9d2hJqO+IwCRXoLkFGx6+MBZDYeOL+nnNYNaFyNmsZLxw3TUJU7b98SuzGFQ8
         uwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fKzcjFxqGvvYnRdzMZQCZdZZhZxsTy33VYOqVFlaCgI=;
        fh=6tztER9zzGZpeie9AFEPghRIUlYXpzI+BgHdvdlnHMY=;
        b=fyRFSR/FtTvy/tpmfzT1bpTrtkxzXunQSOqftZSaDIiRz70wnz2DMFhHFZySnWGyNt
         1wOHXm9uVjHEFgSyuwMQDpnf93wjUbcvCJxcs4+cSm9A3w3mZJ7P/oBGxr04cDDk2UEe
         W1bKoSCYldGZ4R8xMw7jCP1M7e/nHQ+nA2Pato0m/NkrpPtkgb7R2Aa/LKwhvvtDP1Xi
         EiF2nsBJmKtIyiQDe+NsSB4Zf6UTCVrHSaCAzItLOBGorubFhjDINznzsy+XieZg5mb6
         b5tW3mPx6C8nJdLT3bw1c/ygIL+WLCOYPCP0vPlGyLqs1YaJ+/O8ahUoEk22hx/M05d6
         C64g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794644340; x=1795249140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fKzcjFxqGvvYnRdzMZQCZdZZhZxsTy33VYOqVFlaCgI=;
        b=YZFuLoJ7xJc7/F9h10RKEPLzGXEY5BGlGZE8IFy04h3wmGfc90jaNiXYn2RZ8OyWz3
         U/CYZM7i5Bv7WU2qYHgYEmyF5/z/0WRE5vJ5AScIOux5HpniQhlwUElGxi3bIgD6MM03
         UDA1t4mUqCjj5our/hwQaf6lCiOzgzNSIiFAj2tX1pYiARF1MsAoMqUGYYaUiwZLi9l8
         XJr0h9HgJc1BRimIgBoilsuKtze0yfgEJxTw3xZlCJge3BCebGXcOg2sFYza0K8EzTXw
         zjd6FvQDYpApqrkOQ8bsa7wMBjvG+5EU7t2AA4ZTj8SNS+mq4McUGU761WpLLxffa/RO
         IUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644340; x=1795249140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKzcjFxqGvvYnRdzMZQCZdZZhZxsTy33VYOqVFlaCgI=;
        b=1JT/1Hyfozmfb1C3MSRIEljO3C1BjP5q/uM39+Ky7PYfo8yTvJ7TQUEhx5VpetDIAk
         5RPs280cVn43cQdlQaRUZhNk52+KF7Y6U2P3DWhbcrYAASqGLtJu58H4BToP+WoZp+lG
         gcKUibdLynZS8IfWS4lF/79BCAdRe6Ear90vjHAR6QiZlxlbOGqs0kiHmcPr9WT4uso7
         +ezKmBNyrpD9FsuWJyvfqjiB0uZ9nOg8uFPY0TB6aWUyTiJNBPUaxrs3GLowlFutDkNF
         NzLqsmnEeAJWc29BSDkruGHB4jCOt3nvMka7+esatZmIj9fXQ/mBuU3qdl7TXHE/OH0x
         OGNw==
X-Forwarded-Encrypted: i=1; AL+hErFF2YwxIc6KfKm6CYIrIEGMhr72iy1YJnc+4uCRYdBas+0bbvDbko9J+ahm/sKyVcivNlObeJhqwPQgNvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UF6fUlZ+aZJWVEqmcUnbvHxYCF8BX+8YxtHLrI1501qxmi1Nq
	pcaj72KQq2uioHHBI+l8Wzi/DrSshI0uxYxpMtzZycSwD0f/Aml+0us8ZC7Hq4tpZ0Yw/e7p0Io
	9vOAaCQsMPCKMYNzF/qeMjQ/CxxBeRRnkg/QyrH99K6UVbDQeghYf1GmgQOW9DTe/jyU1A4j29p
	pdWu6nXRaqHIFL0ICx/QBnUGloXL6Eqy9eo45/dONDqw==
X-Gm-Gg: AYBFou2AcvTwp0zZqjLsajMRSfHyOJrThmGtbyrRwpwc7ZHF2iFYfrj7QdEqsIADQXH
	oKJRlq6MQplIyXn4XQfn9ikIbH5xE/xOI+IdqDTHkrw0D474gYhn7BDI4tS8bQEbujrS+LtAhPh
	VCCNowIlzZC4cCa8LQ2lf4yf432kmATIaj96ydhOyr1HtUfg7JYpLtVjI8ig==
X-Received: by 2002:a17:902:e790:b0:2ed:379:1592 with SMTP id d9443c01a7336-2ee0dccfa1bmr52675175ad.26.1794644340585;
        Sat, 14 Nov 2026 00:19:00 -0800 (PST)
X-Received: by 2002:a17:902:e790:b0:2ed:379:1592 with SMTP id
 d9443c01a7336-2ee0dccfa1bmr52675005ad.26.1794644339943; Sat, 14 Nov 2026
 00:18:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027140751.2465743-1-b-padhi@ti.com>
In-Reply-To: <20261027140751.2465743-1-b-padhi@ti.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 09:18:49 +0100
X-Gm-Features: AclHuK8IXFCYeB3AWBk0BgMTxu3LSqf5mRE3cR_dlEjTborPRMXNscrVzwDLsE8
Message-ID: <CAPx+jO_GHZopd+D_v5X1j3GO4ANxsR8eMsV9h8HGC9qdJO6b6A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Allow platform drivers to skip PM domain power-on
 at probe
To: Beleswar Padhi <b-padhi@ti.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, pavel@kernel.org, lenb@kernel.org, ulfh@kernel.org,
        sid9.karanam@gmail.com, afd@ti.com, nm@ti.com, vigneshr@ti.com,
        u-kumar1@ti.com, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 9XK-QeKs4uZN90KscyHNjXLiLkQSLpvQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzMiBTYWx0ZWRfX7LCIr7xEws5h
 oxW/50LEqGzQtUgajnLlObS4kPsuUKOBbcbXY+XrXq9IQwvrvBz22gNpgj1iGEm4VWQpMKv4oTD
 jSb5GMB09ZsgzEAm8BlPCTp6LpbfUIBvj4rVaLoyScxHH43k6SOzOlOWenLQSKYHd172hHLDYvd
 quXJscDrOzDZsyDrwFyZtoLwW+qxVeffahXcM8LdOo7b6eAwMnwKvTZzQCfyr57TGiE0N/LAB5f
 LEF02BzjHar0sQx0X+ppOmFnfMm9Y1Q7zkMQiJIOXOFK/Sw4q1PZmO+P/VGtNDUREZE3LcuQdkI
 wRgXuxtuPgq5r3kbAHM+RrmB5xxLP2kGi/1aUlH1aVTP/YPDQSF5qE9zWDqhkZlzIpZUnBDXUrs
 lpKU9xIFdwNnJmPSynRukct+QzCrxIVwMoqnupOyAlrsiO98PrYVZWazR8TZ6biqrzJMOHyGHJR
 aU1o7Trh8y2KKgthDZw==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af81975 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=Ht0MZJmIM3MH2Up-epYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 9XK-QeKs4uZN90KscyHNjXLiLkQSLpvQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzMiBTYWx0ZWRfX6iNbg9phi0SI
 oO+ynLH7zEKFM6M3ihVjc4Q8hoyWsIul7EToEskzFkCgCRUecg/5++3gm4Mq9We98S39AlMHyUd
 +Su3YywGUC1fLIRXO5JdmeXOohdIBzI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140032

On Tue, Oct 27, 2026 at 3:08=E2=80=AFPM Beleswar Padhi <b-padhi@ti.com> wro=
te:
>
> Some devices must be configured before their PM domain is powered on,
> but on DT based platforms platform_probe() always powers it on first.
> This series lets a platform driver opt out.
>
> The user will be the TI K3 DSP/M4 remoteproc drivers which need to put
> those remote cores in reset before powering on the pmdomain. A patch has
> been posted to add "power-domains" DT property to these devices[0] which
> is the motivation of this series as well.
>
> [0]: https://lore.kernel.org/all/8cb23b44-027d-4d81-b342-7eaca0248f63@ti.=
com/
>
> Please provide your comments.
>
> Thanks,
> Beleswar
>
> Beleswar Padhi (2):
>   PM: domains: Honour PD_FLAG_ATTACH_POWER_ON for genpd
>   driver core: platform: Allow drivers to skip PM domain power-on at
>     probe
>
>  drivers/base/platform.c         | 7 +++++--
>  drivers/base/power/common.c     | 5 +++--
>  drivers/pmdomain/core.c         | 5 +++--
>  include/linux/platform_device.h | 8 ++++++++
>  include/linux/pm_domain.h       | 4 ++--
>  5 files changed, 21 insertions(+), 8 deletions(-)
>
> --
> 2.34.1
>

This series looks good to me and solves the problem in a nice way.

Please drop the RFC and make resubmission so I can pick it up.

Kind regards
Uffe
