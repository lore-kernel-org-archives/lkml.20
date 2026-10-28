Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793183818;
	b=sCyNDmcJvqWIfzbNeK+YdiZE6s9HCW/yyK4Nw6yB3VGT/y29kydWdyhnqK6q98OP5VFZ
	 mh8Iy09K4SjmK8ed9D3mDuC/8ZjFNdTRCqzrgWxR7IBZDGdOKCWk7yM8+IlZT5VsmdIC7
	 4wsHosSvwAM0KCpA8pRJsvGfH+diRQZFyKaxo66vowepP3xF4lJ2lIIAmJIYEL0R1Hlcf
	 v/uOGSKCOtBcE9aXvZC165EK7mdbejM2JxyKO6zfFx9y5MtplU+fyn+ZvayS39Uz4epB0
	 cxyJR1InAuhVJ/+mDwnObok/Wu9VUwIBtsol8vDSrVvYNX9jsUYTIFiRUJQxj9tdl8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GYZdHgXiHBouJ9ejDg7nryamtVIjQkYJVCR904hj2b8=;
	b=DlBhhN/GHYomM9dLht100Sv9wedYJS0Xk+dma+sknNw9CcTaFcoaUWy2K3GsGeCzI4n6
	 g0qaXhEYr9W+vQaSaovk2hxhyjZ/SWugb1skTTuXyE/EbdFGz6RAokanzJALm93icf7ve
	 6W3Kq1B8Pzdr3UnQ5Tq+EV6QUJSvvyh3Xom3iWlpjsmKcEISHRiGBgFi/pCg9Fp6sP/ux
	 isHKmv1JDzWUHv1JszTuddo2/U//BUG8SNtpyBrEnTsdc1w5Q1fQva+30VpAG1JD07qGQ
	 A2QrqN27GF0eOavIQr2EFzs8jPV+HJz8a6MHftrNl5VEHN62UujEtZc6f7ORA5XTzhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SeaJ5/oq";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R3MxyAaO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9D7606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C9D7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SeaJ5/oq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R3MxyAaO
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KKS13264790
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GYZdHgXiHBouJ9ejDg7nryamtVIjQkYJVCR904hj2b8=; b=SeaJ5/oqFe9yCvFG
	n8K5pKGPqPeTOZBVHIi5C/Zu1ziqtPTzTFOt4eTj/IBskftxuxfQWzrnhIRHrcjz
	SFq3qvCWszIEq7JFk1ufb2QyufxO7uj10E0c+TUIJ05mzD5GS4OeI7mN7ylnkja1
	Y5FD6bz4fsxycnipTEVdylXAjAlhwXN9aTuhEYDxl+R7F9WhmY3IsHVIvJOEsfXo
	E+h/sf02/K87ugR6c38m0CYs0uacEOOy0F/B9qHIwAUU8Ecq/Rgz6P+NyaS6GJxi
	c/+/Umzga+XJrTYCl+9dU4Sl55l04mSASmKlZy8A0+3YIgol2o7EXhb0JVVFPMCR
	fqFdwQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy713r9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:36:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adf71ee6a5so1150245a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793183816; cv=none;
        d=google.com; s=arc-20260327;
        b=FkwzDM3KkRsSjxLayK0e+pXTtvGgmLjs0vMNTA4sUVa7TzCZkRPaFIdehDNeJlk/2n
         QDdjbuCPO/vhh9ZqojA+HLvwJ4QY67eOGrk0oZN8yWsIe8BacD0PG4+ID6lZpk3Kbwlx
         A2pX1MX2WoreRtDr0fwWm3CRV7FwFfXCiXwuuY4lsKvn7P3W67SnBWpu9oDPoy4U/YOc
         TtfTfvGBz3TsVk1L4n6f2glVPyYkS+rWAyYTo1lc5MIpsy0U4a8Uldlww2IkGVAKzxhA
         Ooz5tIZK11ksFKGjrYHbwnY2Gu0LF0osqWTIn/i5FrBtH79GSKe6voN0x4rQHmrzYywV
         VgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GYZdHgXiHBouJ9ejDg7nryamtVIjQkYJVCR904hj2b8=;
        fh=ivHtVYu6gqIRsQBTP7BmxD7TWuFu9o7GN/0riwIttvQ=;
        b=CKgZkgy/a62HDXuiZrEjFSsYSvs79szP8H7wMNrmDi8NcqqmHob48nfJZcTPL19W7G
         HfTBenC0gjSMDcx73h3A0GjNtO29FVSSAE2DigOeQR/YMIejE+Qz5P0nxnlLYnIgZOHn
         DWqOLhBB9esBjm+syvsUTzPapv/z604ltaIVbRzUw5Zdh8S4f1xWVgenX9bkIqIk9ubm
         mp0bD4uB5PUOwdk1e8tsZm+5HCnvfoR04xr9yYsCVIWzWvIVd7h4V5IsfAJpF8d3xAgq
         32rFWLiUKKReaBebjgQnper0nfHIAnyJ/VyaGpNXJk528dlmdgYF6QLOHhtQoYwUhidp
         HLLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183816; x=1793788616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GYZdHgXiHBouJ9ejDg7nryamtVIjQkYJVCR904hj2b8=;
        b=R3MxyAaOexEH0lun8t2yK7yt3N70o/OlnilQy799DFMEb+iOJ2wEnCYrF8QgeJRTYe
         g7eXF5ybkYmkBUfdy3uTWnflbP9JVAcLdGaTmyr8wqDQQ3ndIs/KU3usNaur+mwxbel3
         v/ddWaH0VutQBBYr+ITb2aVy7DeOtMZkNTngLxgiWR69tmKkVvL4J6WwOYBSUozpYbGb
         nQCAn+yaYLaRMcKjdwGZehXiDf52yi9A3bFR2xLF86RuS6FeH8vLptiOQxeFP6DRiz5L
         ncELnUarmpGc0no+OOEf+QNSiYzP2jujWzHIqoa8iX7CLlOXFri3DvcxDwz3hjw5vIF9
         qmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183816; x=1793788616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYZdHgXiHBouJ9ejDg7nryamtVIjQkYJVCR904hj2b8=;
        b=bGr7OZc3poSgEbkQPrrDchT1/+SIk7Ms9mxym/knmPLJiIDZgvJ3ZizjQurdYq86D5
         smsCE3bVCogQ1fnxFD1WNVfNiPRYY3iloDvxTEOtd2umAnOMKxWoKt7oRlBKoAAtNMdD
         dHMweAZjAQM3UURxMr9RhpiSndrvC7q+9knYTbsPHNzhABULdyAzpG99z68ekUXSiQBl
         HSOwz32yrvXs0nElAKaVpOxiIdZqtFxlaqrGLgFUtM9mHJfqhGV9DmJ3NrPtAn15WEiU
         a/rCOE5tcWzGNj4qVS+u6aZpm0FyN5IHmQMhSxITV3Vgwx/NSfcFR+LAdsrrWZBfAA+6
         tWQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqXa5+Gf/JvQXRDAyjy7tSHqTRa+Mdmte1Lhe1qOI2VkSwftMm5WMTkI6ySC9uEv5/5hGt4Mk0qHJ+bdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB3seXRGyIZMwT5PBDxHJyHS8rbZdSzDNFn8/oUVi3AqcbPazp
	R55UD9qz6OBPJuT4tYndcmk4uW+eNEwtgwfldRObGqVuAmCCfGMYdY7yXQfw91O8sLh5pLZvPlc
	1ja+2nHSbpZ8r8ZtREllU7DW9zm9o5Qo43CZlkPKdDc+mDtTRuA9fKr04KuLzzXuwrbZgnn6RRf
	1dLjF96hSqal1qffriBRqkYf3JspHn8P0dSf+doytG4Q==
X-Gm-Gg: AYBFou2BxFZ17gqGTn8xaUHW5KgiphMxriXB4lyWHXZtXuB8z8J8oUW0nssv3cL1eNw
	XkbRB7t7MMEkeM6kXbxlhq99OfpnMOHy48KoHpxjTQQxOqVtfBcYDP3y3Ya9Z54igBxM7E2QVOf
	iekrNJyDiCE2CYZO/K7OS7cOIsoMqNycG22yicA/6SVnv53SziB/mDCS1gLpMHl7jH8XEK5mK1/
	k6SygHgkm/fu/yF/A==
X-Received: by 2002:a17:90b:3f8c:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ae5835d8a6mr1377091a91.59.1793183816006;
        Wed, 28 Oct 2026 03:36:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8c:b0:3a8:9b79:e6ea with SMTP id
 98e67ed59e1d1-3ae5835d8a6mr1377070a91.59.1793183815482; Wed, 28 Oct 2026
 03:36:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
 <20261027144051.249211-2-ulf.hansson@oss.qualcomm.com> <00b63b4f-053c-40cf-82db-21a86fc485c6@kernel.org>
 <CAPx+jO821-wULVT_KbZB4oaPSYAHi3PEpM0VzvSL_7NBns1t_g@mail.gmail.com> <CAKekbesRt5qDOf76MBG_8hROMa6Z=UCNdXHKoE=5u3xFcznhhw@mail.gmail.com>
In-Reply-To: <CAKekbesRt5qDOf76MBG_8hROMa6Z=UCNdXHKoE=5u3xFcznhhw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:36:40 +0100
X-Gm-Features: AclHuK9Xu0HlqvsyEeUvS1LrhIXq4uQwwd1vAC47YGpdju_wAFdqdb0bMNU_sHU
Message-ID: <CAPx+jO_C+xHihnu+ZweSoFL3gJrj3mjJm9RUVX4aXTdKEi2mug@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: mmc: Extend keep-power-in-suspend
 beyond SDIO
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX2xNwu5ItFSbM
 ndVy/+ooNLof/TpHDpoaBT/iSodEfuG6TF7Iq5Acz/hCP1XwpsR5Y+eKWf3onbr+W7/KuilD9Gu
 Dsti80uWoCOEiy88LSyaBQiSBQmdHr4uHsj7fgadgbQmxKgpQ9XSMu9zM1lwcZLnazYMxuRAH7S
 7wy+k0DKkEKqqDN44vz2qMySPf7cwK3m9cGluLV+2f+ZtaEq6bJTOxokXiShun1hUSDhnM7hRsr
 Synp6jb/XPlKYVig0yEy6zxVJc3a5W7Xkn2lOSvcqalTwWa5XMQEpu1JmNdmO++p/1/PswvBI6I
 ckGOHiA4ywB2ss6+uKdPbKkDA0qEwzHhb48NChqM76LHp6nTaJATYl4EEWTNHC8FpvXvn12CaAL
 EueGZtMbKZ0JSgxZkx4kRAjYmCVN8FSVt+6QQN9CDW6hZtpK4pgdXx3hSlwszN7bZD3jB49b428
 4SWgmFSOrvKHsLYzieQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfXylxrQlJZqtKc
 0Fs7tTjKYLLeRKNKTjpK55hxWjX/LOPTjGgKVomn532vtWwftTxJWEN1SLwQOT7vAyoq43MvhX0
 0oyfpegGhxNtGCHo/rp6dObIiMog+6E=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1d048 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=VJCnStefonsj0tF54p0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: _krPgNr59U-LFnMa6R2hNWMjJ9m3hWVQ
X-Proofpoint-ORIG-GUID: _krPgNr59U-LFnMa6R2hNWMjJ9m3hWVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

On Tue, Oct 27, 2026 at 9:31=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> On Tue, Oct 27, 2026 at 3:48=E2=80=AFPM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
> >
> > On Tue, Oct 27, 2026 at 4:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > On 27/10/2026 15:40, Ulf Hansson wrote:
> > > > From: Kamal Dasu <kamal.dasu@broadcom.com>
> > > >
> > > > keep-power-in-suspend is currently documented as SDIO-only, but the
> > > > requirement it describes -- preserving card power across a
> > > > suspend/resume cycle -- applies just as well to any card type. Drop
> > > > the SDIO-only restriction so eMMC and SD platforms can use it too.
> > > >
> > > > Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.=
com>
> > >
> > > Incomplete DCO.
> >
> > Sorry, I should have explicitly stated that I will leave that to Kamal
> > to contribute on top.
> >
> > Kind regards
> > Uffe
>
> Hi Uffe,
>
> No problem. I'll resend the two dt-bindings patches myself with the DCO
> fixed and the DT list on Cc. Do you want them as a separate two-patch
> series on top of your patches 3-6, or should I post the whole series
> as v11?
>
> On the SD wording, since you plan to add SD support too, I'll keep the
> description as it is, unless Shawn or Krzysztof object.
>
> > That said, I was also thinking that maybe it would make sense to add a
> > sysfs node to allow the behavior to be controlled by userspace.
> > Thoughts?
>
> For this board the requirement is fixed hardware behaviour. Firmware
> reads the card at every S3 resume, so the card has to stay powered and
> be reset each time. Without both DT properties the board enters suspend
> and then resets at resume, so I think the DT properties are the right
> way to describe it.

Yes, that part is clear and user space should not be allowed to
override that requirement.

>
> A sysfs knob could make sense where it is a policy choice, for example
> on SD. If it is added, I think it should not be possible to turn it off
> when reset-card-at-resume is set in DT, since that would bring the
> board back to the failing case. I would prefer to keep it out of this
> series and add it separately when SD support is added.

As stated above, the reset-card-at-resume requirement it brings with
it, must not be overridden by user space.

The reason why it could make sense to allow an eMMC and SD card to
stay powered on during system suspend is primarily for two reasons.
*) It allows internal garbage collection to happen in the eMMC/SD
card. Meaning that the card should be able to perform better later on.
*) System suspend/resume latencies may decrease.

Of course, this all comes with draining more energy, so it would need
to be carefully used.

Kind regards
Uffe
