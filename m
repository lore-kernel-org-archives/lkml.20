Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02784DE706
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361738; cv=pass; b=blxJfpU6kxhwayfeR/G2DTQDc43TfME7r+8qGyUIjUhK8sXmVd3DKhSokCYBPOTk8xOGZNUI/xW/jDqL+AvGjK4ZjxnmvZOAMAeiWC1HHQXBSFCtrZw6jsot14HWqBFsnrygdH0Mk+ILsnD9mF7rtnk6s+T1tGTb+LzCFkTb+yU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361738; c=relaxed/simple;
	bh=qe35OzbfSn5jxEUxVU2cmzIGiFHK7xWuk7f7gKumZ4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=db8uZ7w6RdiGOoWCrlBASoZ3akldLptCllYNHWiEGMyCTADgVY9oLcM9vngdTHMBTo8LVcZJFqzWeSrZJLDW/VaS+0pUSmg19KZXjYV7Gkr0Nnf81QbBXvprsMQXDAEKM5sWA2OOJi6EuXnMId/FiDHmrGmaTF6yCs37LMdLRAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSlUeud9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLqMAtOF; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSlUeud9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLqMAtOF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG3lQt801351
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=; b=aSlUeud9MMrnTvaE
	fBNW17DTlK1pd3VcwQpUk4ojbblR/A1hMmRDFhOv4r5cy3OVu8i2q6RmCi/4vkuZ
	vUfJnemh4SMXjd7YTf5sbLQCTkc017+cBse1LMO1nsJkHCEWniirrH+WKHG39Sy8
	my8Qbas7L+ScsIZTV2pNDMGhJ3LWocXSDZvk5Td6QyumagYlnF3T/M65woH/CUay
	IGqzzkIMWOsK+Mg9kxItyfWdlSbMOxtpgASz+AMsYETe9UpdCinK6WF8DBzpNC6p
	SaGtAz+max3hYXt17goBn1g67FdMVjHnVQNwOXVfg+HpnIOlmupIwqr2msOh/dir
	1yJ5vg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwv57gnbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:42:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so272319185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361734; cv=none;
        d=google.com; s=arc-20260327;
        b=JNQH0SWyWs6hzERvCgsDjPu+EdDImNAXFDvnxKDfgpSfB9FWtjfI3ssPyi5e3ME9Wr
         UChYi4DSvPDN4ItErRIw+ZDH1vkoHek6y15S9emrZkwTeSN8zb6Hu5QvMaNQoRnPx/Fk
         ke+9X1agZvORWhZPjF80JYTaifeJCOJL2HY02NjHvFDh7OC1BMELUIYRWEsruU8ov70C
         /hozcqdk4HePitKoo9qj3axrqPT9aWLoAtHuehGvrQ2ebltoIaRCHhhpURdqbjk9lNWz
         C8KlIq5JKwLXctQC4dFkU1lHPNIb4CS57NZNO40EBtHGkDx+OeoDrJ1SsLxeJwXuJhwk
         tp7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=;
        fh=sjwP/y04x81ghV6WFn5BXBSHoNkNwgPki6fskdpA018=;
        b=g4jwK4z6+dMShiWMf5zVofi7dnyHEDa5kfquWV/KGRIVlDk4w7p0w/lfLTK1qXmphu
         /u9a8eAoOIGxpS+uoDKTwPNiHVMTmXqHl9GC2ftbpWRXgpYyVI8BGOdXk+Ds+4Gkqmlj
         PDH72k2HHBTukSycxUKEcEUKmzRrMmVOizfSSdMEb+gdBsiySe0KBQsfut84i78d/ou2
         33L/ivqQWcJ8rZBdBmM4RsfwrB5oAy16+F5ZW8NtKgBxJnL/9SOunnsqyxv2FSgkKoBz
         2jBOcBhkhkwjG82AILkDTxY5iakZCiGs8Gsz2sMdfX4hf/dqR2+XtpqrRpfxlTNz1ddY
         lU2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790361734; x=1790966534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=;
        b=MLqMAtOFgcfL9/esEM7x6BGxofK86YIE1Fei2550rmKgF1kyAQlJ7ay4c9AMp95V5F
         9yVqR3MeECJxN/rljFLWY8Y8cH/y9dErI1SDMfWjRP2T6c286srna7fLafAgf12jJNhb
         C3dUd0We4dWIfe51+7rlrCq4o4SInafcewYvXgEfvqw032ew14t/HA12/kHlUjnorEzT
         Xk4FEBXlguoF/nQB8KmmRq+ZkQq01LvbBb3469/GB1/ktBO+P5lX7PuPxO2z8L7DaBId
         ZzYTL9r+nufOK+2xNUxp1fhF8PNMKIoObRgTMhZiPFhlIeXx0EXSKM6iKcZYxwBqOAmy
         v8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361734; x=1790966534;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=;
        b=SMvsWOcMthedBKfwu43toyVtLz/nEQIVHjLxnyktx9xPRtsmMso4cyCbtitJzAJiT7
         xMmHyblHQY3spmL0NaDHrjiP1vOpBXNWq9BZVe9qBxH5q0B2tMOhPo6LOs8Kw4HeKxbc
         fkMCWHolIZFN9xKMtLqwM4IVS1vWPADAO0Cz//+tYBGzl/Dsy/aB2LTjYcBYukaathjB
         XCBs4jVxoF/N+CUI3MRnilTsFwf5/GsgKVDOuzoaEFlUAg0BTTZ5RQUli5n8EPPE34jp
         ux/z27vTLw6AixJxFyVO/YBWUAnfLUXaa87FB5d8DsqMoilG0G7OI9YB3h/FgR7zQlWO
         b6mQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWJyTpHK2RK6CN7ji7Sq9nDMb4WdFqhGWWhRKLUAgMtLSUoqE+JncEfQaPrrEWkNIBe7nEZFgoSgGiQro=@vger.kernel.org
X-Gm-Message-State: AFuF++nwE4lcjxFAiHmKlb6PHNMvf00NCPAjumXn4LT937D0NMGhTvUD
	9LYZ+yN0E8uJlbEjBIp+gsnayKC4O/K5MJMzwZq0tFzyFi4Pz06b+4WvYBkK33mJS1UbZw1UIZs
	c2meKbddqaPawx76Su7vULy4BALL711Yr6dXLIKtUOs4VnHrXnwwhoF0VE9cyoih7/4V/m2gYHA
	UgU6U76yutF/fqTde4iXn281/b4S6u/RkQ08kQU3lkPg==
X-Gm-Gg: AYBFou0zurU2qZ7drIXZruDybz+Lc8gZEP8EUzcNg4aZFBagk+EpjxnhQxtuvJr5fPx
	b7xgl7Uis9MbenEMIeGOu8Z/ZdzpZ2d6lQ+kxkXcP/ryt4hyxh+Jw8wgp742QHlRCWRxVkGuaII
	/P1pwrd3kJXim2Yu48jVPhCusf6mJ4sorCQmC2OtFLOS8en6Awgq5yjfC/z/8JrhG+wG2426+r7
	4iwnycniH5SkBbzVgyYG3XkuY5zg3FoS0k52cnN3f48SdCcizz64QtSHjx846tAQtyjamZ65TUW
	+pUGBQ9ygWnS5j80ikjzohlYVqaN
X-Received: by 2002:a05:620a:2614:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93c43cfd3cdmr614935085a.25.1790361733984;
        Fri, 25 Sep 2026 11:42:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2614:b0:93c:e83:6ba4 with SMTP id
 af79cd13be357-93c43cfd3cdmr614930485a.25.1790361733529; Fri, 25 Sep 2026
 11:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
 <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
 <CAFEp6-2P14MdYJGuH6ygRL4ZKtLnJEj=PVMx2p+b9L1RuiX1dg@mail.gmail.com> <f8815dd7-1e31-4567-8f12-1b2b1dd451f7@oss.qualcomm.com>
In-Reply-To: <f8815dd7-1e31-4567-8f12-1b2b1dd451f7@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 20:42:01 +0200
X-Gm-Features: AclHuK9eWyYSXO1LoWJtwtSLZuLm-A6-I11eiFIWKFJB95hJR5ZP3c6jJQ_Yo60
Message-ID: <CAFEp6-074kS9GO2TFcR69fMjuu7Y2Os68CzWs-KUfmZDYaPZ-g@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM providers
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jens Axboe <axboe@kernel.dk>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfX2UvHwAGwArIs
 DiHMO7JVIVgHNNNXWVkmfqgWisdE/W/Ous5cciBHxROmQipnDCUXri3SFqC+KjMC21lHQ/Cc07I
 y3QXQQstINRrpip7EG5LSuCnyf3o/c1Aj/QdNJGa7Kad0/ZxYHQr37C8t1pHziW1UOSsQlyETlw
 02dTfsImBFDEbnu9FThMbUUGGca2nVnGznF2GIKQ9DYJC/2u5TsS5+WUWHCD+SBP9hbBhk/1v2E
 nGN0ubI4Y3VijOyoFTHy6WNal0siq+LFe/Tc6/JjR9zO8ypQnkzbRe+KXlusSsfXvlc3PnV2X9U
 WXQ6SsRv3BeNKOTZVuUaYz/A7IDyA5bTLyzVBT5IwRO3Es8fkwY1cC+jSq5jcwmTh+LBgyXhEId
 Zj8JGYK7mZxFs1jVlM0+Kq0mqK1HAT6B8/iw4YUnES/D+zI+OqukY2FIDrY8h5AJw45fWfUaM79
 2C0I2xHbXpFHEoEXrOQ==
X-Proofpoint-GUID: h4N2U4ulTrwSfZb5br7ty6oECHtziYh3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfX1uF2J63BElWH
 1GO7Ul2RadxxCVcTZKYTHz4gMooBjviZVIbyr41m8O45muxuNVUzQN1Yk79cM+A9thT++jVWKwJ
 ZuR1roP58btFV9Xatb0JAiparJqevWs=
X-Authority-Analysis: v=2.4 cv=S4dMU4sP c=1 sm=1 tr=0 ts=6ab6c087 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=8pm97rweiJCjLsilNG8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: h4N2U4ulTrwSfZb5br7ty6oECHtziYh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250074

Hi Jeff,

On Fri, Sep 25, 2026 at 4:10=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 9/25/2026 6:38 AM, Loic Poulain wrote:
> > Hi Jens, Luiz,
> >
> > On Mon, Sep 21, 2026 at 11:27=E2=80=AFAM Srinivas Kandagatla <srini@ker=
nel.org> wrote:
> >>
> >>
> >> On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
> >>> On embedded devices, it is common for factory provisioning to store
> >>> device-specific information, such as Ethernet or WiFi MAC addresses,
> >>> in a dedicated area of an eMMC partition. This avoids the need for
> >>> and additional EEPROM/OTP and leverages the persistence of eMMC.
> >>>
> >>> One example is the Arduino UNO-Q, where the WiFi MAC address and the
> >>> Bluetooth Device address are stored in the eMMC Boot1 partition.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >>
> >> [04/10] nvmem: layouts: Support fixed-layout as the nvmem device node =
itself
> >>         commit: 9c6cab93dcd47c3075d896c777567b9d8f813d18
> >
> > If you're happy with the current state, would you mind picking up the
> > block-related and Bluetooth-related patches in the respective trees?
> > They are independent.
> Should I take the following, or someone else?
> [PATCH v10 02/10] dt-bindings: net: wireless: qcom,ath10k: Document NVMEM=
 cells

Yes, it would be great if you could take it. It=E2=80=99s mainly about addi=
ng
the possibility to source a few device-specific values, such as the
MAC address and calibration data, from the NVMEM area, regardless of
the backend, so no dependencies. Moreover, the ath10k driver already
supports those NVMEM cells.

Thanks,
Loic
