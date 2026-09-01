Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133DF43B4BD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277587; cv=pass; b=XhreGVF+ehgCaEL2HMhJID8ZY3S2pDA+8Vbb55wBIgEWEuKiRRLoSJtCVfZSU9Vu3imyQCiI+6l2l6OwI3usTSOJEJBjvZp4ePpwOyf5sqepvgcwLj5lZVdDTzHEE2vl0dLtc41Nj/eseK74JiQNkjofVHl2gAyq78bxcVf9XNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277587; c=relaxed/simple;
	bh=rnICP/8ipFwPUYfbnkDLyV5xBmiEhD52APzyFmePejc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKf5K4JN+/zXFkZ/7j3OOEKEWUhjUhA4h3WI9sWMzf+Z7mzbXcPG4wAizRUc4ArgHu5oZiOiXdBm+yklB+vLzbeOusFLJKzsI++jMYOUkNKpGlmwxrPeWV/wJ81Eaba2lJOgdevtvxmP2CtsMvAdSKNLAUc4KDvji580Uyw2ReI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2GM46wM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEOPBW0j; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2GM46wM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eEOPBW0j"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8oC92646926
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOtmA72ZFF7SpeYfPs2ScSy02kZ26uUYXO+68oHg/tE=; b=E2GM46wMMsXHOkeh
	ceRe6MDPCujkNOr8IAO3QT15bc40jxWKVmhh6NtQyBzB7MRKSE3+bc1W4mbtJrS3
	PxHNnDxcP69Q44V9GjyEV/v6HOMlpUFoQJN3TvhRXB2glWhOauZba+BvlUgJKg6T
	tcTBNitlQ/MZzspJTjmsWl2UnKFcPHp4+WCoyYoDOiKWeNBnu1VZUBxHaV4wEgy0
	aFv8H2BzDMJcik87d0hLQDGOI0qlQeK7lHn1doY+c/dvT1mEJueUl7dciyObeM1X
	UD1Si8yn7RZq3WiSo8wsoknkFsAR89kX7fY0YemRrlFjs0ryDRBBreeu96Vwa75X
	eDla2A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fu5j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:46:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7151120d6so28280225ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277584; cv=none;
        d=google.com; s=arc-20260327;
        b=lZpQ8wD/d8Ap41n8ApRTaIXGOyYhBFRUHwmB1p1WLMDisYd/L3gdmWUsIpGu5XCr2Q
         cWNRk6qg8sWZC0pnZpqSjXVQpKAps/4BtMISfRbleOG6rpbCp60CrQ2BntXULZ210pzc
         shKvCSAjwwFswODO3ytWREhAlU7Il9Yim51GjmEyH0A/+o6V3UJ/Be4xrXfj7Op5PWTH
         0JkcwdCwZjxqKMKEYDT09oH+7jQ+mbyLDA263/5Sykli3GN3OVIHc1rEFDCsVGHJ2KNM
         uIecGODkC5q48ts87aozYPBdU1wFsg74IbrujTpeG0QKrNOT0CucW5ek/o2cv3krJgVs
         nlkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WOtmA72ZFF7SpeYfPs2ScSy02kZ26uUYXO+68oHg/tE=;
        fh=NfdUct59W1KoxZR+TGI/KlryjyRATnTWveiryw4CvZ8=;
        b=Do6Pq4YiUuy8Zq7XvsEPWdgpjkOcD72O9wvbXhvLjFdIZoRRaFOs1OWybyMmdUhmNe
         9HS9sNzveO7ns7jXqdipDtCvevtlD6lv3QFfTmdGR/SWiPlsP9pdM9LxVDnKE5H5ocLa
         +Bd1Yoj+RslhP/T6wLJyWIwioTSQsOqJnVjGgNx5BDG8augY4+S4lfFrDpK0gTO/XqZ9
         gzd2xTS9KeWZX3mn35J1BNnd71g9d/TcSZ7Px+Avtswz+X6QW3ZlhFvMplLtRj1wKagf
         X2DR4Zli5s2Iwd0H3JRiNXQUrn1KkIUjErhnPi9YT8Aw/oECGue3K7KPEucyKBsVMLQZ
         VcSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277584; x=1788882384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOtmA72ZFF7SpeYfPs2ScSy02kZ26uUYXO+68oHg/tE=;
        b=eEOPBW0jSQnTQAUU3noG4SRokSZHz3q4/fMSJ6Vl523O+BW6ILPDMSernAhKCPm61G
         sIVCdKECFNq7XSdRi4U0+JG+1Gy9I9QBQt+ao1GhuYAaHGtO4JO+Yd3CK5MoA8R5yuo+
         BD5tQUJq36XbXkoPGlake1NdUVDoSjh0YKiWTOxPZfDCwQpEvNw5jCk+C7ALgIrgt1Bu
         d/GhbItDQ+5u+oOwzcBeNnlzoHzHC112iKXqamlN7MdPiL3d6uAfN9ToumxxLhdHKjKS
         /U+xNgBtDblI+tTrD+tUiZ6xzlYH/Am1tUosljoVmOFeykYA0RxqOC6SmjSa+lQYcoHU
         wU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277584; x=1788882384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOtmA72ZFF7SpeYfPs2ScSy02kZ26uUYXO+68oHg/tE=;
        b=fMAL5SrHSbz298DvuiSmNWp9sGJ9zq2HzySQKHv7lnkqNx5vMRGwK1F3l4jJcQcafg
         21hwlwBHkOc+Kvh7s78jZrx6Sf9MKpALv0qJdRHuNnIPa0GLYtLuTmi4xOHpPNqUysax
         +04FKnVQX6d/r6tiAoG7UoUuqzmvtpgXlgaJ45FnvnV32nb6c8Nyvsjb7YblraxpZbgU
         O8e6AQfJ5VyiisjjOnf5LVcdett2lkL5PNOoMWUcvr20Godsxw7ytHUv2DAttoqj2rrS
         VXhZ41u3yQimDfbw7YNpmsIjjhk+uoNEGAhSOEV+aHfhDZ0KH0PznrrYlP6FJmv/szUy
         WL9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwE6U0grqqOMgw5oPVM6uTjmkHXHrSBJCHT+JUwl/tWxNAoa1ErGujN/Wv08MlMrZRgZrBGBrmTAKPXiik=@vger.kernel.org
X-Gm-Message-State: AFuF++nCEQ/XBw+0wiRzDUMXRhKwYw61R/G7zDM8OrKB41oeO9aR5ev0
	aa7UQHvBsx2H6bJZBC7/o+r/GKzIBZfX5tKWoJzikNBOC42j12XSzMfKG6qw8PmwmvYrbLfSAqQ
	Dg/EigswD3BFAjVwssJIocIM8DLuKewRfugx+JO+CzU9h6+bP83BFAV2jh5r4p2bFsS4Ri14S0b
	Ieik0m4n4EGFrD+Eo01dK0iTW+l+noNXHCMSh5d5x+Ig==
X-Gm-Gg: AYBFou2dJ740Rm7BYm0LjJRXU7lRVG2vhOVa4r9zKwwyUvvol/T8WZR8QhsrO+lBvYJ
	8TcRcy+CzPXXlosmdeeVuYTk/fjIftoMoJ45h9JCTdchO7sq0OQOpxMpy090gZebPzQjne+hXl5
	8KlVtuIlZZqEuTC3RIUw2xOAxy9DHJDguXG8ZbXuU7HFtOgwigAZK7vmfgrg==
X-Received: by 2002:a17:903:3c65:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2d94a784931mr142846905ad.7.1788277582913;
        Tue, 01 Sep 2026 08:46:22 -0700 (PDT)
X-Received: by 2002:a17:903:3c65:b0:2c9:bf82:dd11 with SMTP id
 d9443c01a7336-2d94a784931mr142844255ad.7.1788277581551; Tue, 01 Sep 2026
 08:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
In-Reply-To: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:09 +0200
X-Gm-Features: AcwNN1WYz_8rnm2ufJJ2jNPXi9qD6e76DvNVZfDobNOrG3sw9T-MJKxhGpSje5w
Message-ID: <CAPx+jO8RVUv=mqDZ-GeJa=dEYdNCK9L8Vi=UCDY9GqQ1TefCsQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add NMXC power domain for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: HyiRZNgyQXNq10n_sX2kUurprydTb4FN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX/RYgavL9zjCI
 9QrNc8XvZEW/jN2i0Os/lLke1qqvXUy0sIYClvt85FTIVHN+DSroMUsAskpUD3fzxqwD1A8Idiy
 JYp0MbsX6/cQ/EFkjPk4yVv/5jtS3kU=
X-Proofpoint-ORIG-GUID: HyiRZNgyQXNq10n_sX2kUurprydTb4FN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX9G05nFse9WJk
 5vjTM6s4d9wzYwKcFxow7nRBmqitWaVhgHeENK9QkXNOSM2uT5WXozVPFfsflRftlz56TqPw4ih
 Bz7vWDLXwgBv2QsU6IhczMy0DEKiDbJTBVTSr4J7vEgSRTLEmC5vxqmWRPIqAThGmjmdHbkKZ12
 CSGb/En/dv4fD8FZuQlIEfeFuGBf8eCdEcrP6D+8oqUhJaU46/krUFkgNqdux5CikK0U82CojIv
 dIyD8diXbYUhefR9I+eDE8P8eXJIMJmEUZPJJ6/GIRNR7XD/jDHrJ9JiWUqNQr6Rvf/saJZeqji
 Gzfikc4E992I/WbQHD5Q6kZslmjAeeYL4jAtXq1LSGg05dwtLVqZW0pfJEOolRVEEOEyd8OHVkO
 +kBZ0vFbol8AtvRFdXCJjyQrWccc2arb1q8/EACSpah3L0zZxntbX+ogr3bXTNUMFC4qGzivI6a
 eg+u4zn/euuWOpMpnDw==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96f351 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vbPe28F0ARNTXUAfal8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010139

On Wed, Aug 26, 2026 at 3:55=E2=80=AFPM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> The Nord CDSP subsystems do not take their memory rail from the shared
> MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
> resource. Add the nmxc.lvl RPMh resource and register it in the Nord
> power domain table.
>
> Changes for v2:
> - Drop remoteproc changes since "mx" of remoteproc is just the name of
>   memory rail input which can be wired up to NMXC power domain in DT
> - Link to v1: https://lore.kernel.org/all/20260826102746.633076-1-shengch=
ao.guo@oss.qualcomm.com/
>
> Anurag Pateriya (2):
>   dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
>   pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
>
>  drivers/pmdomain/qcom/rpmhpd.c          | 6 ++++++
>  include/dt-bindings/power/qcom,rpmhpd.h | 1 +
>  2 files changed, 7 insertions(+)
>

Applied for next, thanks!

Kind regards
Uffe
