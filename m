Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A94492E26
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983232; cv=none; b=NZ8C6hrnqIT3Su9SxQAE8x5/M+Ye7Z7GQXMHiefb546LeQHvitHEQXWVKIv34ZJXr6+McyvIPEB0CVZjzsVEOYIbA8PVOUiF4MQjQUSX+GKJKTJRWdyGynfGFGgn1fumBguKSDe6Fu+fwc5HtQ6iE9QBN/rk6LP6+0ikxE4Wcts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983232; c=relaxed/simple;
	bh=bxGi3O7g0n4gi408RRPokrlqezhGm8IEGKb+goXMloE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IOcVSXW/ILHCYKT7cZzEdkOg44fZdur3zMjuzWzal+TV4cFGj2zV2xx0K3obKgGzEnaSGG7auW+YC7tkfT8Vh6IUDiizIfHr6HrDGK6Ugy/JN4+XoMgvxc4h1GgKdSZqup6Nbt4R1fifSIx/6GPcz7X4KswKjSN9jIcOg4TIEg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OreewTWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B5JHMM9A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OreewTWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B5JHMM9A"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7B4n4372091
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1aTWT1xLatBKrObX/CyhxZ94bvJdVzT+iByE8YXSyq0=; b=OreewTWuXTwsAWNF
	nHGPADDjGpeEGMeZbRGRx0iJW2/OW72/opmE/w5M3l8ppSdw3JSNvmc4N+8yclAC
	ZCllJjaFisct61LwFdTpMCV2xSvOTudC4Lh0PXU5ZZdevrLs5NVnE8qYJuHOXXV8
	pF7FdIb/fU4T58x6G2MEpLczjHx+l33WhTcKxGBRzWKn8i57gW2jG8JzDwMDVs78
	pqI7G+X2cYANEvtpAx/YN1vee1nW/kAnLmccRPNJ1wvsNslKz1zLScgNDVPtoIBo
	4p+QC/Nt2jK70KVjXB90cDovdUcEALEG+dbLwD0qQYMdISKPoTRsw2yK40/p8RpC
	RCGhwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5h4nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:33:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93903622880so778885285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789983228; x=1790588028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1aTWT1xLatBKrObX/CyhxZ94bvJdVzT+iByE8YXSyq0=;
        b=B5JHMM9AvlWHB4ArDNPupTkVhMkFGGMLf5n5xIZnYP2YLQkG4RM5cSpyMhJbLmeGfT
         cLOsaKRFHjf4/Kmw/j/o0USNGitozNW4efYA8wNj7/Y+ExiXr6MWvduAgvH9e1XXki3h
         S2oy9RKrusC9CsxBCBYxgX7VIiLCwHVc01dKov7XrrQeEfJ299fDLl19I7sBiF+NWprl
         Fn/sCjBrmxGCEf6OXgfGj0F4EAJbP/SmDE5z+8jzoVxn1214p06JF49VJWwa6MNa5fZB
         4HSKxLO/Z0Ad45U26oFVpB2WaRqMaXhAKkR61ShWfATXrEKeT1X8UHrSSKxmhOK6I/wW
         FRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789983228; x=1790588028;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1aTWT1xLatBKrObX/CyhxZ94bvJdVzT+iByE8YXSyq0=;
        b=uzpecr2upXO0jgyo5zYlI6cPW3YRVRIHFlSb3NDev24FzhbPRG19kVkF7JJMZXfGMu
         G5/5ucAOOQ3DL+vSs7HUms/WyaCBjzqA68wxyJA8X70qz0nbWf8w6K7ziixNAOHX3mSD
         8VthROr+Cu6kjzzXxbUNAvEyqPjHuCqJQX+902WENGSrLab6uJrk/3D6jJvVcVCFqjTV
         Hc6fv6n+KhzV9jqjQRy9OPDZdMmd+wFvgSvlkUAUlgX+hJoGG98bhNtmuN9Yoz+Sdi+5
         h2/3hg+KrN3KoARf8N8uD6OXV661RiHix13A12kpgC3xiNDBSdHYc3bnLJ8Ntb7HO3T9
         c7Mw==
X-Forwarded-Encrypted: i=1; AKwUvBz8GIUKawOjfXCMEXVwOgQ2IUMwOYbhG4mgzJ7y3r38Z5EIz2Ie/8N2ySIOn5TFPQCb8w1puHmdLh+PxM0=@vger.kernel.org
X-Gm-Message-State: AFuF++kjT3368j1u5BJuA5hhgIpZBZkA+MSrU+nkpP9nV0KM+0B0Q4AG
	nn6t/kFUUHU870zu2ek/Y3EPBbFF8zBd6pM+dp795POqviO0y8ZMmpFbl8LrL1qDFtQu9z/755o
	n9j+oLzEiaRBlNysbORYbD65CP+wVIx2xEutuDajR4Tu1e/c38t+Q4+/2X1PvEto+LHI=
X-Gm-Gg: AYBFou1k0B3USVQrMMImZ+i8qgHpfN4geeWkONXN5sTI42Lh7AZe2EZiDu0O6gtUgq7
	hr4ZoVqMMcvrdd1RgoU1LF7sXgtnXjDFnx7T+K/2G+kJWY+KJ3bOzJArGKz/hTNg3UYfGZlJ5z8
	qFyV10xLyrfj9RJSNgbobb3yjKC0SAGGeLryl3G1777wLcUeB4UKIrPwr1/5Ee1QVzEUKDx9bxT
	rwYey4IgZYAj7Do6GhgcmjC60iccSuo0sz/+FCWrUeMPCgCpvbpGMj0yUYKXwmUQvVv1ULpMJQD
	03XA7D0ITP169mnPfwpc779vqYEU6cqh6s1LKQzOMcOKVGyima4mYTcte1rGpJEdB0IKdUpgXWS
	nh471bo61Ym6Ad8x+TsfZzJVtsg==
X-Received: by 2002:a05:620a:2809:b0:939:b053:ce44 with SMTP id af79cd13be357-93bf56e71e9mr930990685a.22.1789983228352;
        Mon, 21 Sep 2026 02:33:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2809:b0:939:b053:ce44 with SMTP id af79cd13be357-93bf56e71e9mr930987285a.22.1789983227911;
        Mon, 21 Sep 2026 02:33:47 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcc1160a1sm173074265e9.4.2026.09.21.02.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:33:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 00/11] arm64: dts: monaco-arduino-monza: Add support for LGA WiFi/BT module
Date: Mon, 21 Sep 2026 11:33:44 +0200
Message-ID: <178998309639.45264.5601605234359872731.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab0f9fc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tpGDb1b0ex05cYe8L-UA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: UJZlpHTCG5ISzlScFp37wOAUiODqnjIp
X-Proofpoint-ORIG-GUID: UJZlpHTCG5ISzlScFp37wOAUiODqnjIp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzNiBTYWx0ZWRfX7+QZnF5bSwKm
 pc1k0IkSFtq+5Fb9Sa7FFtJlLq+KtGWueZC/x/EuNzxaOb1xSQMoDWpV4KcJaDEAjuZU3BugpvO
 3NTlc/L7etokxqRWAiiZf80X7+sHixo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzNiBTYWx0ZWRfXwYa4SGfj/xGT
 7BuHnTQIXR7Av8zyszBkE2GfXVDzoqhNGUcuV338yRTZpCy13/5x46vqjueZ6fN26b/X16eYI8m
 9MG5Q5JJqqN+88fEKyRPTy8tCMb97BFVNdxYcVTqky+JL9oNxpB2fSZBbfOfqru+3RfSZEKKZOd
 GU78ANTUl1aa0WmBuBjfDaq2CRI9Z+zrhevhDDLQKs4Jo8BnJjxS6WvNWslT1rNcgeRrlXqr+oM
 lSoIduhkCgRUqPj675fU6Wc/xRpP7grNs1Sj7pNdBJoTEiAP7A8dk4JdwC8Gxz+XECn4JEbTiHe
 pIMqHEmPP1+OvsUrSmNp3eKA/QE2ilu+kfsl1ToriV2OKLv6Jy8IzVnssLapGdSarW12q9cU4UI
 qxVifnAD4gGB7Rri8BbpIiL9JVFWqhCHcbtHJpp+78GSJFdwh9VA5zFWV4neozPUsIAHX50bLiV
 UQYB6tX+00mm2QxgtRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210136


On Fri, 04 Sep 2026 17:42:15 +0200, Loic Poulain wrote:
> This series describes support for the onboard WiFi/Bluetooth module
> present on the Arduino VENTUNO Q (monaco) platform.
> 
> The board provides LGA pads for a wireless module. On the VENTUNO Q
> these pads are populated with an NFA725B module featuring the
> QCA2066 WiFi/BT combo chip. While implemented as an LGA footprint,
> the design is functionally compatible with the M.2 Key E.
> 
> [...]

Applied, thanks!

[03/11] power: sequencing: Add pwrseq_is_controllable() API
        https://git.kernel.org/brgl/c/bf544a7a60e9eb45f3e22bd1a5184ccc16d75cc8
[04/11] power: sequencing: pcie-m2: Report power controllability
        https://git.kernel.org/brgl/c/48925a1d5e569735031bcc2f2c19e6ce7a38e424
[05/11] power: sequencing: qcom-wcn: Report power controllability
        https://git.kernel.org/brgl/c/295eeaf2c6543f746c1c7d9871f6d2f71a7ed4cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
