Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35552415F1D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375812; cv=pass; b=Xz27Wn+FJD1ayD74ha8TFX4awQk/BOX05o9FJqnHXHJe61XwlFJjclrznYmz3Cvg2ly3deipYczCHwz70jmp9VYEH+gdWLmXev1TS3sK9l5C+wKBhBB4liggbF6E+j6zlcsf5Ku5zCHmxMvLr+H5DJdG5zsaoDopBuLKPEdBLvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375812; c=relaxed/simple;
	bh=rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YE5wPf6kTr6b3/OAr0H+OCBsIuOj0HGFKmn09I5NOWVJOSdQc9fdpybPtISo6qU1uCZNJ88EWS3rYzgL69o/SecA1ESuANi9rmohFhgk/DHGD8Ii88q71ZyY9VoylVR50da2CT+xzkOQlXk31+wlsgshc09Y1y/lZ5aep4fqVLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVcAMdwb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABOHDuQM; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVcAMdwb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABOHDuQM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5idFm793225
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=; b=UVcAMdwbCwVGAbCV
	C+sUaDdDX+wSQ71/mmFXzE/+9fIcAZHzaY3fc/XfdVRB0NaaSP0FTc/4MgstqM9i
	si3Mf9Gz0rfrpoHnnL29Lxvcxul1FW2q/LrvaZU72WTE22DOmEuQqcE7sXLJ4nql
	RysRQcME7N72Fq8zodzLw0YqGXZ2HPtP4KN3XlDFAS4oTAGE27DHd+3Q0Sk2mdgr
	HcDGrJUw0yKoh4BLXGkfEu+jYFQpdNDIpOFZbGCEpjO/fzR/N9wHNjb1GT2HOSFM
	EAD5UqdxyBLXVJwigrgEiRRIaaseVJ8EKkFKtcsk1jj/AXalu8ePqYGRZ5iV3fBL
	YOVQAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnsay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:50:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0b66ecd9so189689285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789375806; cv=none;
        d=google.com; s=arc-20260327;
        b=ZehVBxVBXzg9qcLleM/AqrlgQomEHKSRDfIEvEIvRWD3WLJdVoaut66eJHf7dpsYyR
         ZVFZ9Chkj95TTfSqTHn1T6gz0a/JYiq2/qW1ma+Rud7mVpSNljy32lxYzF8uAYhYlL8J
         Id9CFVySLCEG3xzIQuj0lwWE5QMJxsXI11JHZIm8tYQYUr6JftodyyY4yTx+lX2+1ErD
         hbUTVL2mK0vX2VLfS2A4lf+2/O9+1Hr/+oji9d+vylqOWEqbR9Vhw8aHL5tIBOPIuhym
         KKwzK/ZNbXwJvI6CcxFn80X00IT9RzhrArMf88MYrjMxHKZegC0kpBIvxa7l8MgBt0Nf
         wfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=;
        fh=VO5PjMm+WuzZ+btK0g6Pzt4yWbV3VlFhGNo7fj1EzPQ=;
        b=VMKXoQqsXSvTFkI5MZL4zv5WOnyP/l6ZdxrpfuBi7dlUTj807PV1m0QbdeYaQghKPC
         q0TGEykIcZDztYLvAtXypnGpjpjfIIy18DI3jZA0XykImbF1lymG2l/S1DAdjgt0NHs3
         icFhCboRaze8mcBnyBiS99PYJWTbjZhrU5h0i0Ex8zNCOSdDS6bk7Qz9oj+jX917L8Zi
         9MuPIEcl3ebVmLwQM78WDC5+/ku8l6erFXAYkWpO4oKoqQ+HHVDptpLjmM4ep9m0etX+
         1yWqNhtvM4Yc1J9TbNcUVZniq+kdNmDupYi+PfdX0ssEbi07kP5d07BC4JLoQWOGYov8
         Bw9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375806; x=1789980606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=;
        b=ABOHDuQM7w4+pTjSMEemMaJbm1P1IG5kEDiRaIy2/xJaxpvzu4DtXJEVC1Pvl/SQES
         oxz+aZgI9am2d5Vtow4fHr085ulgWogHx/ybpu5INDG4SQEdSK0IXJ59hOgXLGhVNwlv
         7du053IxfeZbqhpnZg+/ILYZcgLUAYB8OzJe+99T/0g1cWXSTfbNv6U3g83W/cvG4FS1
         na//uRUQP+5eDB3rKp9ExcC2GO/1PTpq6LYQNSQEHMKam2CeZ+P8DlwTlItNc0Qxx/ux
         AdatrNuxTQ7IqYH7tJfwxo0/+9dxuZZU1rkVJnDdq7pvho9HvrGyYkHSfE60t+XX8Vcm
         y8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375806; x=1789980606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=;
        b=UOL5p/I/y5PU8PLI03niWv/BZsonfobBeiQW/2snIodWYXPxHbULsDOMiWsCxpaK4V
         deklfaxl9+m/Rluq2d/BD0Zkbm37/8mOYYPK7RN4M+5P3wvOo7aj3qkTcoHwX0y1hd9b
         jdl5De/ZDyeIctDRSOy4LvrvG9dhVxz9y7xbdr0MUJXnYNLD1rfJa9BRYqPe0lkPCwTb
         qbbnQ0KYgdnGkP98IAnbYkR7wxdH1bNx3YRwRntWGkGXuT+BLPKz11RkN1zqMz54Jv8M
         wFMqSWXcLQ30peERLwNiN2eCC4/WZIwNDt9xNIPBRCf4d2/t6TtCycEZGz+7IgFb4oAR
         ucgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYAuQDlAecMVvfUeqzGAD25cux9QjHwaXV5v6oDGFFSrVR1Yaf807aSTA6/JaYIUd1sM2T8+Y9XgZdTeo=@vger.kernel.org
X-Gm-Message-State: AFuF++l4kQRrIrdwuYSxL7xMhvS/gDJpOw6U+4PUvCg2xaqtb0MMWDpL
	0YyvWhMIXsPbHWp9YxaaCNl4wkUpYaoDZ9iYhAaNe29kHp/10e5cWkw3Gm9omLZ3hVu+VTaGpp3
	HKmFCZgii7AfQAJqGFnYhvHDg3HA1jc3e+UHxcRwTaYkbB8WfihmWWDbveelnSkULiq7Mu4rCF8
	OfvgArrpW5HszT8Nuyb1W904Cl4wVfUFwM0k+FYzOQCw==
X-Gm-Gg: AYBFou1kkhaqFmbBqts8/xPM7U0zT9g9sEdJWPp9mjeoAaePjdkrTjYmnoQcwQphBZH
	dtWEMFxivt3YmiSbynrAo1Rn9/ppghYKhgEXBo1RIN8VC0Eyr6/9r1IVehp8pYekiteiRy9jtR+
	xTD+mp6L25a4rRGXxR3ZCxEFckcXsGg1K+dPgxTyu45dTX8RtRBCA9f9k5TDiYXWEzblSBnnM1z
	3Wjllj+/s/wLzdaHEEeE2hdYD9dr9zOj019UjROkkC/rxAHkhdQP7Vn2rrqiRjoL5XRMzzUnpY=
X-Received: by 2002:a05:620a:1b87:b0:939:9fca:8d2 with SMTP id af79cd13be357-93a2981322bmr224910085a.18.1789375805796;
        Mon, 14 Sep 2026 01:50:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1b87:b0:939:9fca:8d2 with SMTP id
 af79cd13be357-93a2981322bmr224901585a.18.1789375804889; Mon, 14 Sep 2026
 01:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
 <CAMRc=MfDAiUMzOYRWioK2NDM37=yQqb4pQ5ETZz1PVOKQhhdug@mail.gmail.com> <CAFEp6-1PuGMGkdfWYiUQnYffm7en8b-DQybg_4M9xw9MVDNRsQ@mail.gmail.com>
In-Reply-To: <CAFEp6-1PuGMGkdfWYiUQnYffm7en8b-DQybg_4M9xw9MVDNRsQ@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:49:54 +0200
X-Gm-Features: AcwNN1VznECsrEJUnLcouEQxxRZWOhGsAh6qOvyElwlmFiNZH_egy-fEq4m3Sig
Message-ID: <CAFEp6-3gD0xBJZOOmTw1MBex-DYo99MXHsQr_=uLABMHdSjaVQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] arm64: dts: monaco-arduino-monza: Add support
 for LGA WiFi/BT module
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-pci@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNSBTYWx0ZWRfX/KKup7s3bZg+
 uAWDxiH6PzjsGAtmownqGQeEjB3/vijNgt0fLS9EgwtV9sSyKH35KwxiaQ2vKfWcqiwucb3J+Jp
 spNSMe+d87ydLsoJ+HREmD97gVbeNFcx3L+NxTZd6KVlcvjKZIZNTD59eeGX98Ihq2ZXSkSpCIz
 YeS9jrIpMpAJ4LaHjDOBKuvtJe622u8fRjcO6Hajk8kkmJqtMy84xbBWqmb+oYbS40iVvtBV2pj
 nwCuRaHa/qth4ZmL2cKlVJFNWliBDsc3tV1mygcZOaR66RWJmlLtqbCUwcW+OHTnF4sRWnK9536
 oZAYeFa8iHXFbNB+d5ALk0pqjAnJckntucGqsGh2KDr5W7YBQFbSdlPYLyAO/oq/79I0Sn6u+bJ
 +RDxoOwi0IT8eBFJOg0q/I57Awhq+ZxXGh8k/qKaBJ8KGQjih8b+f/MfTjoATbq2fF5JvEBIYvC
 seN25cLiPxXFTVs//Vg==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7b53e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=et7816VZQgabzuuDM88A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNSBTYWx0ZWRfXzc42K26o2O0X
 Y9uH/fCwe0jd8BdmYqQFsaSnbCngBG9NVsc58WZbBPOgj1iQzL7+zETdUUWPPSeGhxZ0ljNXjwr
 goQaJokDO0e1nnGcJ8QvAioUbiiLe+0=
X-Proofpoint-GUID: MTnDefrc_H2N2te9ngzsnkorOFLWhiGf
X-Proofpoint-ORIG-GUID: MTnDefrc_H2N2te9ngzsnkorOFLWhiGf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140125

Hi Luiz,

On Mon, Sep 7, 2026 at 2:50=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Hi Bartosz,
>
> On Mon, Sep 7, 2026 at 10:24=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
> >
> > On Fri, 4 Sep 2026 17:42:15 +0200, Loic Poulain
> > <loic.poulain@oss.qualcomm.com> said:
> > > This series describes support for the onboard WiFi/Bluetooth module
> > > present on the Arduino VENTUNO Q (monaco) platform.
> > >
> > > The board provides LGA pads for a wireless module. On the VENTUNO Q
> > > these pads are populated with an NFA725B module featuring the
> > > QCA2066 WiFi/BT combo chip. While implemented as an LGA footprint,
> > > the design is functionally compatible with the M.2 Key E.
> > >
> > > The NFA725B exposes WiFi over PCIe and Bluetooth over a UART.
> > > Both interfaces are gated through the W_DISABLE1# and W_DISABLE2#
> > > signals, as defined by the M.2 specification and handled here via
> > > the pcie-m2 power sequencer.
> > >
> > > This series models the hardware using the existing pwrseq framework
> > > and connector bindings, allowing coordinated PCIe and UART bring-up.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> >
> > What is the merge strategy? Do the pwrseq changes depend on first two b=
luetooth
> > patches (I don't think so)? Can they go onto an immutable branch shared=
 with
> > the BT tree?
>
> The pwrseq changes are only a dependency for the Bluetooth changes,
> not the other way around. So yes, they can potentially go separately.

Does the above work for you? Would you prefer to take the Bluetooth
change separately, or would you or Bartosz rather pick up the full
series?

Regards,
Loic
