Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793887277;
	b=w6bPZjvTMXZWnj4gfdQYr1hCZ/Uie5S8gBKf5b/gXPmPjoaPAmZ1xu2PpRYvhUHiyNwE
	 88519VQiN0F4aZ5pmezunXzDTKqv6hDc0EHJHIB+jhvYfPBgSvNMFVjVPtu4a0qdO2a08
	 qq8ojGNB7n5UlXXALijoNMRCvMHghiBhGGUWwTubB0R70vRsN/Ql6WZcjBFXYtAaPYplC
	 /ng0S/O+cdQ0RZ0AOCrSricffGX09APnRu6L4K0+eWfZySAgB99Pc1aufc1yIdmQ60JH6
	 ObJfTqekrbsjU/1oT5Yb5TF6i+1qiWmab+PdArF459+k7FPC0mfv/4MOfeHkEAzXQRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
	b=bitPICGnXj//1mRQKaqDhi9tjZkiiqsvEel0yljkto51U4JuOcHn04U3sP5rBqJWECGv
	 gcUJHOqT6hOMm6YE5S3S7sqQXMaY4l5k+F/rv/fOJpOzP77Bni8u9UkSe8m3JLBzvYeu+
	 +WLQ7P7ZYxR1/hHR2aTYbJ2a+fPBU8kP1WtXpeQjY3+twDZQ0UJ8GpVcyT1wCKcBnsKHO
	 6Lm75Fibaqj2LX6HFD4mRKyssy49fJiWRba4nEbNqQtteUcUfeIlMVI83u/3GFLEKK0uU
	 i4/ulcQV82LNMv7bUT1TeWxJzRklVNE3+4FhMzHMIgZW4ZtHBSGQwavZDLYnZiu9p8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mir4VC+3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nOVwID;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EC9606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29EC9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mir4VC+3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nOVwID
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tTmh433415
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 14:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=; b=mir4VC+3wdUaahp5
	ktja868nO4QtXhxgHuGqpHJGfc4y3qefHLIfA/n+XKk+aIfK8svi645NkkLweAsB
	mhzHivfz1lVQdT0kkdLuxCPr+T8t/fZWMEMXrr/YGpvO3bYwy27SClMuzmhh5uZ+
	VjEOByy1YTh2qYsShbTaiUyZP7Oa0OdEmoCZM4IBdaJZh/YK+amMlhVVEDi4agR3
	kvezPwijaoYnX3c7U6dBTN+t47cyN6mcLf5TZlK30+hjp8xZNkLtcElDfUcWhut8
	bzn3BASnyFr7nUuIyMxcPnt6RuzU5QqeSkATlmQf0mt1sHLRvsZGTY3ntbmku362
	ndrceg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd9vbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:01:15 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ea2c058e67so2426452b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:01:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793887275; cv=none;
        d=google.com; s=arc-20260327;
        b=bTPzoLNHgE0SJmVBqWgclxOd/RrZfrUlXFsM6s6sNWArIX5n9VQwrWFr8EOUYZq67K
         Q5OdG3mdR6NZ3VhP39JeTyHSv9NbrB119be5Q0WgV60447Sw5A6caW+kt2lGPKI3L1I1
         O4brTVxCRTkLzHk3CYASayfxRFUVu311nxRnHWqHUrfVxEAcXDdN/Agq5LBjva2QKJdF
         F/cQqPYcPWLIi6zMXkCzZX/ELK37BuGLN6TbBF5K9tuCbGl0kPnF9gbsuqgHS3tVxj+s
         /uQO4oEkc69Cohaj5r0p7mW4kQYZzHOasUj0XigpoHZZakr2D1enrgmNQaYpXKC8JdtR
         kAUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
        fh=lSaXr5QCTWkvzr/YRAQNq1nHkoRQNGdVb5kuERPWqAc=;
        b=XOPsVCElAX/bYoToCu338QCIkzn2FJN7jVaYyq7/b9h+0wGGToRAbQIbKdNG0E4JjH
         0ukw0s+iBPIwLP6ChHFSoF/LxO2ivXDFmv0IlDAEeTzOLC5nKz67p3zfrMUWLG9Qf+z4
         Fs2KY4VZMSImTYZD7kBTyJo/XtoykdNo8+8gubfu65300wvJ9j/+zJNhirBCKQqq6upm
         ofoFZdYuSzVAujcTqUdF9BLkgXYW/dKKpomHShRmW9GgUzU/W7zLP5b/9cxeJJGbDrrY
         w1lvWbpnx9BwGCzjWJdcz4xVcCDG7ChCkOJwi5f+jsBBtAA+ahuo8gdqYZ3bLzb0369u
         vTOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793887275; x=1794492075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
        b=M0nOVwIDG7jODMT+nQkr/TPC8EkB/nasV2CIwBGyY4jSYU5vwmQQhLJesQh4BpO4xn
         ByKd5GG/EKVb9xOrS8QfrTi1s/VkiO4XN0ckZQ5NkwfOUfmiRaV5lGoXq1FQxOBeR4Ch
         Bb4TO6mOVzv2OPHtDmYvXph0ua2eL0MudhdyP/iQl8aosWa3GRaaaIzo91LWlWTiRiSJ
         q7kaOLacFA34DHBBeGuoDcWcQ1UOWYH0rOoxD+rOZtM5fB8troYwp0qN4u5MPIk1X6qU
         E5XkkMgIxZNj6alGq7HdlfWVL0q7riFSimK14x7XQt0CvMsCWPBaIAjFiZwD1EbZLSAZ
         TvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887275; x=1794492075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
        b=JmaqFghlELUGhsOwbtttOKJ9lryTZFRbkDgCvQ2cG3+Sx+LIjzOwuCNah48H6vPRCc
         JMdFu+P4rk1ikfNIg6EsMMjXuHJURvXvdp6Uip1Dt8L8b2+2fUfmb6aIsNj5QWzEIQfe
         XwItJFaadMTUQ6lE2TzFsjItKjbgpCr6It/9oQ1KRgF0/rmWkACfKkM/v2kc0WTsOam3
         r7JBIFQ5xMpg3Vf9BLW7iy4X7roY9LQB7e/nEaTGOMtMh27XK+xvuXUFmVJ3ORPYsWXv
         QEF927u3IKR7hUQGhe0ilRq6cF/N1U/THXwA99GOp0J2r7gO5BJDvMAxTEEr17Nz4OHj
         CVZA==
X-Forwarded-Encrypted: i=1; AKwUvBwjgQSyCYy8hfNR1IMavapcoYwzxVqI5u3X/KsEACTNUdNqGtQLKUNLflyyGldTBfJA41ox57heTSUjOKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xFpyd1N7lUYsLq9c6H+cewiAbcVW7I6O74iBZTbUHmwNKUbIq
	NKMhrlRn95adix5wWQJx0bGnpsy8pJjHSDmCEHWYq2b2ai7K3Jzkezt/QfGTaeXWMxeTCZVvrpM
	DyGH1X2Bnqb78upVAXFQVT6GIQa30wNCz4ZRK96mzdWq2mwKBTz6APDZIFsOXCQuUXgtLTdkWd7
	9RhpYnO6m2WJuKgVPFflz2X7IRHXNmZzJobmChe4dUyA==
X-Gm-Gg: AYBFou0DVoAeK+7/2a9NM8HRD15gQsvGBuQuN6055WKV1P71D/PugGBau5J5ZkHse56
	N56iUKb5nL3fVM3qhEzGaa/dcXJeV9iCbv+oZ7c4ke4VJg55zncW/beG5L2ULGl+K63bYkpHpKQ
	Su/i2d7diyvSQz2xCjTHFodCx3fjfoeWw8S8yjwDce+O6rHgu0uPqJM0XpSxUjM/wlu8pOawKwZ
	ZBEz0urbxuup9LAVuMXwD8VHBsC2uVKzOBJ672yGYx/xS34P/AGz4QfqGVidjvqOqaVTDTjW6E=
X-Received: by 2002:a05:6808:3509:b0:50a:f56d:a6f1 with SMTP id 5614622812f47-5640dc1b211mr13019225b6e.10.1793887275154;
        Thu, 05 Nov 2026 06:01:15 -0800 (PST)
X-Received: by 2002:a05:6808:3509:b0:50a:f56d:a6f1 with SMTP id
 5614622812f47-5640dc1b211mr13019186b6e.10.1793887274640; Thu, 05 Nov 2026
 06:01:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org> <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org> <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
In-Reply-To: <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:01:02 +0100
X-Gm-Features: AclHuK-b0A4Gh4xuvf-RvkEJ0Ayhot6Y1dIQBdbhsTwiCiM18Z5of_94siqhfkU
Message-ID: <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec8c2b cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=5UNgDV9Nf9xsrLWpgpcA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: UlTdZnKJpNdHG4mx_83ckucOUQfmCGyi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX8omfNFsJaCue
 5n8F/DbkWsio4m2L2dKH7K31xDYHjTfU5F1nGr1Se8vIm2xRxJ4szqncje7VCb7S37VkqH90pib
 ZNj1GiL5j+a/QUrsWvjFmZYiCSBVuAs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX8Ve9fQG+N4QF
 xINOya/p3YxOaugvZ5Ij3ihdgslJYxJAR3yfc33i/7sIDiYx7XEtiX+5kRjcMQMbpthQ4hEkqt9
 h5PS2JLX0qT3f7MPxHZ3AwWLOmc23+vuKq5vV30efaD9lXmnlPyqPWKSlsvYbEfnTrjWunU17o4
 YV3nIGkEln+GMZ5uAOgCVF7UVsDt9FCUohTlWyX9hoEZVAo/v2r9wToA1qDNjr5ntwx6y7BpRaE
 R3NDwWHCr8vZxQTilEqi60z11UiDgIBtEACGaOVnfLaZ+4aPG79JltZKtbnFhXo3v+GM1LUIp2K
 cN/7HBc4B/a9T9pcLCqEcnGojZCPjQAGJLZ+AQtRuL5Ueq6YJY9E8BpU1KT4vxxFqjhl6a/JmJK
 +cUzUpWpLt4hbkUVo6TQ+ZdP0CZSQOwwcmnDoi/8WGDgqcR3+p9GC1sOrZTmtFPe20iHOL24TwE
 LJscAbjfAwSPRGuZKEQ==
X-Proofpoint-ORIG-GUID: UlTdZnKJpNdHG4mx_83ckucOUQfmCGyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050055

On Thu, Nov 5, 2026 at 2:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/11/2026 13:04, Loic Poulain wrote:
> > On Thu, Nov 5, 2026 at 11:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 05/11/2026 10:53, Loic Poulain wrote:
> >>> So some chipsets share the same IP blocks, with some block/phy
> >>> instances disabled. As a result, we need to decide whether we're
> >>> numbering based on active instances or on the actual hardware instanc=
e
> >>> index/offset. If we use active-instance numbering, then yes, it shoul=
d
> >>> be @2 (CSIPHY4 being the third active instance). Alternatively, if th=
e
> >>> port numbering is intended to reflect the hardware instance offset,
> >>> matching the register prop, then @4 would be more appropriate. It als=
o
> >>> has the advantage of directly identifying the underlying hardware
> >>> instance, without requiring any additional driver-side mapping. In an=
y
> >>> case, @3 is incorrect.
> >>>
> >>> That said, since the bindings have already been merged in its current
> >>> form, we'll need to preserve backward compatibility when addressing
> >>> this.
> >>
> >> This is the input port to camss, so how is it called in camss, not the
> >> csi phy?
> >
> > The CSIPHYs are connected to the CAMSS input ports, which can then be
> > multiplexed and routed to different CSIDs. The mux identifies its PHY
> > inputs using the hardware PHY IDs, so the CSIPHY4 is identified as the
> > CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
> > connected.
>
> I could not find that information in Glymur HPG, but maybe I looked
> wrong. CSID Wrapper lists CSID 0-2, not 0, 1 and 4, but again maybe I am
> looking at wrong device description/interface...

Yes, there are three CSIDs (CSID0-2) and two CSID_LITEs
(CSID_LITE0-1). These blocks select the PHY source to be routed by
programming their PHY ID (PHY ID =3D PHY index + 1), as defined by the
PHY_NUM_SEL field in CSI2_RX_CFG0.

If the CAMSS port ID matches the PHY index, the port ID can be used
directly as a routing reference, which keeps the implementation
straightforward.

Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
makes sense. In that case, the driver would simply maintain an
internal mapping table, for example mapping DT/logical ports { 0, 1, 2
} to PHY indices { 0, 1, 4 }. As long as we establish and document the
convention, either approach should work fine.

Today, the Glymur bindings define DT ports { 0, 1, 3 } to map to PHY
indices { 0, 1, 4 }. One could argue that this is already an
established convention, as it is documented in the bindings. However,
it is somewhat confusing.

Regards,
Loic
