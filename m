Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C6547CA82
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399205; cv=pass; b=AQ8ap12ZczUvt8geQBhKeGP3VF2Dx9BMTlktEfbIG0XaMOIDXKaInivNGlkDSHwND8HrG4E0tEVoMlPrhvEFM1VahLEd3EK6m3SLyDB+zp+LhC0HjWR4muJugYJt0T/mqwdjONQlegNPGPYo7HH4VU8xuRM7G4x9Azht0c5B8ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399205; c=relaxed/simple;
	bh=+5VTaMWLjqXlIi1YIqovBiY4bjSRngf/DS/v7Ak9tb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nn5c+y2noALLSN6XCBVkvcjEBD7Biqll28NL0RKt1yTD8/Zsxs//DqMDBva429aq7XLe4k/iJoykurV6+8sGFtns9vLfa9fucTglUKuFk9nugxV37QHbUWwrWTXxIpbT27z9+altA98jTk1P6gxZv0FxtXwKo7pawtryCLDxoQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hr9GYHZs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c48AIIrz; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hr9GYHZs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c48AIIrz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0g08135519
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvWNxVuN8Vp90PBdaLvbyZcSDFXZr4EHf8QgZYgvK7k=; b=Hr9GYHZsPjfqqbdE
	yRtC2M+BmgtCDMci/gUxstAyQaIrozfMIeTMHjKKKlJLFIEiFxUemtIdMHyBE/o9
	RgnqAAlmEh/OyqIgYjaXBGg0LS99DKeWkh9EKTlYEBdTMTpeKov4mBNg4nChA+W0
	L9Q56XOJPT/rRo5+0yBxIaxv+K66Us69tONnUy27Tpl33JyA8ZlPCD5LoVNLmWGe
	Hi8XRgGw09b/5kNsrsdLOZkuYcmZN/4hRYd1pK7vHaASKmp5H5CVQIfeE6w7n4wn
	Eo6NpZl/cUa8kmUyDANtYztW8ifbMHg0aMV3oTAX8ziPsP54f5Q/B9i5NoM4XROs
	wmL5bQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq98x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:20:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so5018613a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789399202; cv=none;
        d=google.com; s=arc-20260327;
        b=ZgHNIGHy23V3uklekq4ufbHZpKsoGYAdZzfufBpRiOGAMeMca5S1MwjoOGpqjdjLC8
         m6+ZA3Eg1TtlC3c+bJxKujnUJo8PmAR2WRZL7mtdSeiBA2EWC/uOdWNC7VOQEXppYTTC
         ggWG4/Tcu0pa9CAjiaTuhlzzIJqjDJHBnAz6VUlIWWOvN7+kz95BWTNPTEBX1nJAtIyh
         aL8/UN2uxAQNGpSck8qUWZTMZwfx+Q1y5tjlx3n0GqboFG2ZRUKo1rvDEx3DGxCX4QpR
         lExhKYnQ8Aigkngdq9n8tMUtha1SxZLuvBhWSj9Br/OapOXJWWiJJsnPOfpy9kN/j2Wi
         vLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EvWNxVuN8Vp90PBdaLvbyZcSDFXZr4EHf8QgZYgvK7k=;
        fh=lw6fdKY2PyMZndwvJ7IcKWppbWn4tQx2hssOd9hmvls=;
        b=su4pxJZa8ZBiejipgdZIQZBbvKhI/h89anQqp3/ETfph651KDTCqFltaM49zHwsXcn
         5H2/6kj/7KF7U2jpB/8xTurkx0PDfP0li3bI3ppPOrIXHuyhelJzw9MAEySOotZY+R0U
         PV52d0lJHE/0w9ZtSa3TCtAychRj4ONyhH0E0d/adVBefAyHLMfknibn4Yp7cT6jAoaF
         ZpI1fqJ0ervNMpkPNK0jwC0jIb8Bg/GlBOgc+35NSyxT3ToNFSNeHNM+j66gAnjQ/0M1
         JBqr1+C19EybGR7ZJ9+TlOxAJ0L7vT1KM42s7rtKBFFSYXTvxnnlmqGBU4lJB4HsXNAG
         eEzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789399202; x=1790004002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EvWNxVuN8Vp90PBdaLvbyZcSDFXZr4EHf8QgZYgvK7k=;
        b=c48AIIrz3UsRlJ5kH9PgmXxx7Fyy4sixXlWjGMDLB5WaVIE9NVUYt5X7IkJ8rJjMUn
         Ebs4rFq5bVOxcx9CrMy+UAMv+eoiCvn3hzijPvQGXrhsppeMyVU7u7RdDFvm88zJHT3J
         AqZaDZtlYLzj9CBwsd4f9n/kD41pyPDv7UNh/gIKlSxwFqAZrRHRT0/MyEzvKlljCxCE
         tWKEacVNE0aEJeE7vChHdBYfgShBHbAuH0i1/0d6tLlzu2X/8ODL1N5ioCKYdWSje4fE
         ElQC1ULnhtsqqZVQLgX6hnzsvCNoCOpGU0YbGOeU3LmsLJLSM25F0Eoq0x9HraqQGw9K
         15Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399202; x=1790004002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvWNxVuN8Vp90PBdaLvbyZcSDFXZr4EHf8QgZYgvK7k=;
        b=TSB9MpC9yaMuhY3yK88CKrIidzBuCmqmFZg+5bp7AaRONB+2CYIug3xf7T7q0cGNpq
         W5tlT27YbfZWXvuzFK+anV15MV6J3RTjPcUFNPam85WwjSDlLEk0y1LpsWoQoo+v+C5f
         Ok4ZyucavyEDMlBMZm6dEIesKSUwkeRNm8+wAvl55Cs4wkPmkPkIxsjZLj4UDf4lhzEe
         mctrN/1hcHK08QwIR1wTD3ZvIbdsswLj+5dbN2WuO1nyFfGVuZ0LVg+izuUpngBoGwjl
         E8/N2Tyc9Y1pQod5lbO2oD2Cf21YO7yJXYj0HsEY+aFV0XxhiQdFc/Cwj8NpKLsRZVVO
         v1Ag==
X-Forwarded-Encrypted: i=1; AKwUvByEKNt7wbR2Or3CJzIzR9zR1bQ2iy1f/e+mAZpOlLia+79LIkI6xmZw/ve7Ck23XnnOjZWo8q5jndnxEMo=@vger.kernel.org
X-Gm-Message-State: AFuF++nBnU14h8cJlzX2z2WFs4IQufms7LunufRAZyeTB3H5AdORURPw
	NAMoOBIUWf6qhIYOkB2Txo4v5mL3OBLarUQBe4e/PDPNSji+if8fQHhGSrq+HJ/PktYTMWV2PvE
	v+EGwigw4iHvzt2KsWqU6PWAGTFBzQlqzPfbkSyE16cAZOovctcKYeKLajZUqUPOhKYgQ3bhiZu
	U0TOTFyIjUt8wAvpnKI016ONiKqboT/qDUp8LQV/WX5Q==
X-Gm-Gg: AYBFou0BLCvEsrWgv11EBGUHLwbmavpCloF0CBDIO8VTxK7JNGIn2qQ1Ng+Z/SnuLgz
	tevJ0jMLUgH/Wq46Un46LlhoMtRI46t/JV2A64ST0KpD2PibooaQAvU+OBYJfG58WSeWwpG5t4r
	BlPfvh8Vh90xieOmagta+9kFluJC7WyDD4kXUNGf6ckVUOXtoH7NcXqaMBpQ==
X-Received: by 2002:a05:6a20:43ac:b0:3d3:b02a:7252 with SMTP id adf61e73a8af0-3db4076d90emr6912321637.28.1789399202260;
        Mon, 14 Sep 2026 08:20:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:43ac:b0:3d3:b02a:7252 with SMTP id
 adf61e73a8af0-3db4076d90emr6912264637.28.1789399201887; Mon, 14 Sep 2026
 08:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914111642.169707-1-ulf.hansson@oss.qualcomm.com> <94445074-7cac-45ea-a051-8f521e4f6b07@app.fastmail.com>
In-Reply-To: <94445074-7cac-45ea-a051-8f521e4f6b07@app.fastmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:19:50 +0200
X-Gm-Features: AcwNN1VRqERvG6R7p5qKeRX-V7ae1CReXW6lsYdfoZlGnjZHdfryRk19d5OIuX8
Message-ID: <CAPx+jO920KXdEbbZKKLSSr-L4cNopj77EN+oyKFY6FfL7tX8aA@mail.gmail.com>
Subject: Re: [PATCH] mmc: vub300: Remove the driver for the obsolete HW
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyMCBTYWx0ZWRfX6Wzr3eyOR002
 25B+0vdnHnGQjonBfjPmPGeXwGkTqtnD9Ine7hXCNwu+d2JD0Go/U4fhAqN2MHtxvKHzWdfCQ7h
 9II24xZ36SR7zU0t+TwSJuzOToUEprvGpxbtYT21nAnp0VI/UlSDkQQbDQNjZWNH3mSnoT4jtxQ
 SDrIQeGcHFuDrBf0Bw3z1gd3dw5h0TcGWaNsq0eiGBGaktZVaeW/HmUPhjYiZI4DgjrwcicVm5m
 VzUK/tsZETWdP4dnsLiyr6UHlxT0T7QuLHRJs7kHS6KVlxmb08uGQOc4L8dnpUFyNJac01bh4sB
 Tjixo/RZjiOaKKgydQ+CyRZqSphxDnDAtNFLGjmVVB4H1CVmVUq7iYLuxsm5Ar3j+juKXhudU9Q
 PGgB2N1pcJF9MVlR2zhjs/wi4pHdIxcbyivrYa4SLgb6tGGJkbFbaRBB5gC6344LKgtHAkBGq7h
 aQgmQgfFREJtXhEoHag==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa810a3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8
 a=0glPbglwHS9rkVpOk-MA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: sLuWvs_E51IfLaz1rKbj0hoqK8hasOPb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyMCBTYWx0ZWRfXwaiQzriDsS4j
 uTtAjAjU80t0s8w34P//+in0Y57gbTZ6evrRb1pClLJ3iBqxUReo3PTnyQgNAJKIpS/JGEBszKs
 KlRhbQR7WQ7hax6tVNv9B6er7dHGGqs=
X-Proofpoint-GUID: sLuWvs_E51IfLaz1rKbj0hoqK8hasOPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140220

On Mon, Sep 14, 2026 at 2:31=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Sep 14, 2026, at 13:16, Ulf Hansson wrote:
> > From: Ulf Hansson <ulfh@kernel.org>
> >
> > The Hw is obsolete since many years and its corresponding driver has no=
t
> > been actively maintained for a very long time.
> >
> > In this regards we are lately receiving a lot of AI generated bug fixes=
 as
> > the driver is a real mess. Rather than continue this path, with small f=
ixes
> > instead of making a proper rework of the driver, let's just remove the
> > driver altogether.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Johan Hovold <johan@kernel.org>
> > Signed-off-by: Ulf Hansson <ulfh@kernel.org>
>
> I have no objections to removing the driver, but I think its worth
> pointing out the actual year it was written (2010) to put into
> perspective how young or old it is. Since this is a USB device,
> there are likely still many of these in use on newer machines,
> but they are also trivially replaceable.

Thanks for confirming, I will add a line about this when applying! I
guess I can take your response as an ack, if not please let me know.

I have obviously done some research myself and the short story is that
the elandigitalsystem went out just a couple of years after this.

The driver itself has been dead from a maintenance point of view,
which in principle happened just after the first initial commit in
2011.

>
> I checked my series of driver removals to see if there are any
> other mmc drivers that I already have patches for, but there are
> none right now. There are two drivers that are used on relatively
> old PC laptop: wbsd.c relies on ISA/LPC DMA, which become
> unavailabl  on PCIe chipsets 20 years ago, while sdricoh_cs.c
> relied on a PCMCIA or Cardbus slot that was phased out around
> the same time when laptops started using Expresscard instead.

Arnd, thanks for the update!

Kind regards
Uffe
