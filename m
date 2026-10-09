Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A193E81ACD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556012; cv=pass; b=aHdLwFsQuTb3VudfRtEcS5yRwzASrOJq1rGK6Cy8zwgWPgGZeFRqIDCAiRapoKKWDA6igALw+qcDmE9lrNY+z3c6nX8ExnOYXw5ycjSEHDky7FeifIznOM3UDMr26Re1B7ujq1ODLBS6TB5iqm+z/RZtpfnezxiwP026eXP4tgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556012; c=relaxed/simple;
	bh=hjigRTpAheShvm4CUT48bphb627DqEDqb9jtmCAaHI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tr4qzLMH8oI3JVL37O2jVPkOec5XqMdgBnV6sUWYA65zd1dP4lLivHdi0yWxPY2v5dzRi+t+kE5nLMwHCZA6bWrAkWLRzIz5EjnczPSmYun/blQ7t4wS+KmAtD9shjgg/hJLOBYtMWJfAGX8WIvEXZVatsXvO/HtsB6eo6lWJuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVytQEUj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZPUMoJh5; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVytQEUj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZPUMoJh5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKG8h3024033
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 14:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yn5+ecY3l/7Ibm3VZ5iLKxtcMms0hMKLnboQJLRWmU4=; b=KVytQEUjtqCMeEs+
	IlaupvZ6HdAWnkXDlu8DGKXcQmaWAhzC0hIo4Kuw+rT2SBbUn608lxqOTXIFx76T
	24L1342L5BBnS/nn70pm7616hPPD6f+ub6C4saRgX6+Oh5yryqCVFUtGYKaOhS5c
	zgLsWmqEj7ZaZEp7S/eO0Y/80s9DthnY4YhFmWXCUUjG7ul5bG/KUKBoWQNbcyK3
	SQomoBHOudb/+o7riht2a3wZk6GBA4h3jy4kmfuoh5pbe4K3LKlS+uf88C5flLl/
	Ktj+xd+ptKntIzvpPsUgq9MqW0h+HO0ZSIZQ1DpnZt13t7Hv9dAIdLS7e3cjOm9O
	ia+Nsg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwby8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:26:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so4219065a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791556010; cv=none;
        d=google.com; s=arc-20260327;
        b=OzXDa0S4rZnhiQezTIp5MDcbKkb/ycXKIsRs+inuPuw9Pk7c8/SAaJuHd96yL7VkMd
         mzYv/DuEaXOEY3hmTp3SAo8hhbrHBmayx9Go/ChMSQgsAP9Ynm7hs72eR2tm90OdYIiw
         fTaB/5XDnvEWIIZcI48RWU+EI75F+7cuE6btCBgL7aMEnb5l3POh3otMvV3t/LPPo739
         O2C3Tqcrs86BHLuUPfz2oCnXHBNwjNf5pkbCsRXlDCJqfdflkGhrVInId9qRXvhDn98s
         Mvqefz6a3vxj4dwvt27YGKhnrY9ETa7eDocwNuo9Z3aQmy7Pbcw9DQWCnCuRsHdyg5NI
         7OTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yn5+ecY3l/7Ibm3VZ5iLKxtcMms0hMKLnboQJLRWmU4=;
        fh=5FUA46yhYiUArvywSRIb349xmNv4LhsboDmvTcwe+I8=;
        b=NLA/hA8bEBK8ksYlz+Y5TAO6SOOVK2n5Ky0zcLPI293dms9F8qiGKf1kl6kac36674
         U/fR6rJUhH/OZ5Uppi35BN1X93BdDT2flTE/xfkkFmaRRbnjLGhr5JVYrXBLV4mY4LnQ
         E8HxP+L/yX3/e0Uotc3AdIAD7T2vZsMn5z/t/Pq7+/OU8BIiAiDTUlmGW44cqHwixnTi
         zD919CIbFcmlQE8EelxS8T48/p3113fJylPFtVxMDgJ8uS0TZAzIpORh2MxqbBkR2cpg
         LvNlSbXhqqX7BwTgng0ug98Omp9Jm5E4R1UezfsSvPWEm0vlT2RZg9FdLqf5iiAjn4EF
         C5ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556010; x=1792160810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yn5+ecY3l/7Ibm3VZ5iLKxtcMms0hMKLnboQJLRWmU4=;
        b=ZPUMoJh5LLh5HIysbwYgMlomKhKToUfr6nDpl2ewjy4fekU1obJZgxQNP0r7BsztyZ
         /R4847sxmxTZj1kSbtNyxgi9W7LL6nXLWvIIBUZ2cJcCBOWzFf5S4y6MA9VZJNelindF
         ILech+56ehDtGequ2HkbgggqEYt5/Q5RGADMBrOdA4X0P5kWu093Ilcl/W9xZDzQ/85g
         p0WmyjBlhDPh3IO814T+rawAZ0ZunrwTgguTHdbU+8kRiwz+rSRCFxP2gzJBKSHNyzF4
         y+kOU++JO+WmDsQ1GUYxQCk/x8jrNbedNsZSvYi5Ki3G7CzAJ62sPeYuYGOSfJ4rNNEq
         iGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556010; x=1792160810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yn5+ecY3l/7Ibm3VZ5iLKxtcMms0hMKLnboQJLRWmU4=;
        b=WJ8KhsE7eJTeZB2iXTy1qqQKSK7eAr1TzOGL3KIqvnt1f3Dz3PT4z/+ibmDs63d2/l
         1NPEZlIht9hxYCD4+vE7EXXtpDadTGMfvpU8+PuYHHTxIrwOLQJ9hs4IEuv12Ygj9L83
         O0wmpRfJ4krMazZPSOVzjANNyhwjqfkSs7gxekP05mMCYXDIbc9trS9EbQBnsYXzTlZo
         29nzqZ0P7KusxRZ6pqzbF6LbbiK6rzKgkFEI8raOZCd4e58TyYe0CAN7wwlLjWMhR8ha
         WY2VJpFjBNjomoA3UI0jguzuBzV5A3vDxhae6qgF0sFOfwlxq42JPyF8FDhHON+RlN9S
         QrIw==
X-Forwarded-Encrypted: i=1; AKwUvBy/bS/dYn6kbI32DKhnbtO94nToBTWK3b7Rz2tb7ZcY5d1Hh4kg88dWynyVcvE2b9vkk/VrYboTAJf2PPA=@vger.kernel.org
X-Gm-Message-State: AFuF++ljGd1XhZSyiU1TEHCASz3Eiha96QKNpgzK+3LVQlrhYAEZs9h6
	h7nmFyY4TKAQ0pwxg0SQaJLaFPlf1KEHkbuFNwy61G9z3Oiuq7ek4cy4H6A37FbjZpNSwobIban
	+fav4uLPOk0yfHyTxrUExJO1ibIUetoVDjvJriCTstCxHfc+fy0RbnqNwdJl9IdbZzBvAhV73yN
	RKc+BEJRR1l4M7lqOCI9sY7uSkjaGgDxtajZ1oYi2J9A==
X-Gm-Gg: AYBFou2UgzN9Z4wn2lyv4w6NtectRDTpISy05MFZRj+2STTqDM9A9b73P1LJPtwBoX1
	RGtFNWa2cNcpTaVbI2eQiXaLpcrKBFm/BeTNh9pdY3ZHwgc3sWwmwpyrN8zq5Lean3H6h86M5oh
	+e2NxDYZSz6jXg56PNsTrW/JmWrydC2kGNTt3znRNiBqkBgzGfUCG4EW0FQg==
X-Received: by 2002:a05:6a20:c79a:b0:3e0:b71b:a8f2 with SMTP id adf61e73a8af0-3e16c010522mr1735688637.40.1791556009996;
        Fri, 09 Oct 2026 07:26:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:c79a:b0:3e0:b71b:a8f2 with SMTP id
 adf61e73a8af0-3e16c010522mr1735661637.40.1791556009444; Fri, 09 Oct 2026
 07:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com>
 <20261006-romantic-stalwart-seriema-90e71d@sudeepholla> <CAPx+jO-T_0KT3GytYu8w6QvrhXFQNZQzR496RL=McU6rnMtnPA@mail.gmail.com>
 <20261009-frisky-rottweiler-from-avalon-6c409e@sudeepholla>
In-Reply-To: <20261009-frisky-rottweiler-from-avalon-6c409e@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:26:38 +0200
X-Gm-Features: AclHuK_Vubf4k8TpvsD1c7GgWbgnBlZu6M1U_szLd1fRdLCNfDEiyzf-bluvzDo
Message-ID: <CAPx+jO-_aY5pMnWyy1hAs1WRmfW33vc317jdtBsEXYBoHsPfxA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: Add support for system-suspend-only states
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfX5urDL5JJLqZG
 33tM7/jW9REll/KIsynhXJmeJLb/ObOC7l35ZhT7n8Yx1pjMGIgwC77nYwHGPhDZZeuXLpAe0ra
 MbmuFRaonTeVYXZLHGO0wTBe67cSPVDrRyUXYmVBnSssQHiKS7qyZxLKMSq67iqTtXW66LL6eae
 5w/jC3LJ4ufBIsoAyWlfUrnoOhomoNUwFMsrxDnECOBd2fMHut0mD9yYMy7bh4uvwt2X/hqrIiw
 t/9fjd8x063KR88jWxAY1lSpzkWSUu4dHLJRaujBzmeGrKSJHS1yAGDl1yE6z2T8eullAqkrMjk
 p6AlU4jjU8dsKF/D/QVk14jIYDeLZJ8NjyM8WKA6qzEBw1G1oMxnef41AzVun5fiwh6kxDYv0T8
 pjRHw/mJMgkd6bT06l54HhByC5P3ImG9eXGo3nJjlu2vrKLVh7LIPVEwyMtajBFjdYGnSFp004l
 DKD9iS+aHQloZe6g3tA==
X-Proofpoint-GUID: uuH3Ti2QNUXxfZTaHJQwpuLzjG70rjaY
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8f9aa cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=xZBbqvtqD373e08s9rwA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfXxB6qP2Hz6dmA
 Pd5/e/p6p7MHnYowSoqmDdxJwIptnfeV8tfDlY59+6DIDYwxXcwBeaN0EdP6zeZDzzEmhlCIPIT
 G3ywp9XDBJC4QUUx6UnFZdyhprkyAV8=
X-Proofpoint-ORIG-GUID: uuH3Ti2QNUXxfZTaHJQwpuLzjG70rjaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090057

On Fri, Oct 9, 2026 at 2:21=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.or=
g> wrote:
>
> On Thu, Oct 08, 2026 at 02:21:49PM +0200, Ulf Hansson wrote:
> > On Tue, Oct 6, 2026 at 11:15=E2=80=AFAM Sudeep Holla <sudeep.holla@kern=
el.org> wrote:
> > >
> > > On Mon, Oct 05, 2026 at 08:59:43PM +0530, Maulik Shah wrote:
> > > > Some domain idle states require system-wide coordination and should=
 not be
> > > > selected during regular CPU idle. However those states remain valid=
 for
> > > > system-wide suspend like s2idle.
> > > >
> > > > Add a per-state system_state boolean and populate it from the syste=
m-state
> > > > property. Make the genpd governor skip these states during CPU idle=
. Leave
> > > > the system wide suspend path unchanged so s2idle can select them.
> > > >
> > >
> > > Instead of this I am thinking if we can QoS cpu latency setting and b=
lock
> > > system level states normally. Since s2idle is user driven, it should =
be
> > > controllable via user-space and we don't have to define bindings agai=
n
> > > if systems that use platform-coordinated needs this too. They may not
> > > use domain-idle-states.
> >
> > Even if we likely could make that work, it's seems not correct to rely
> > on userspace to make the kernel to pick the correct idle state, while
> > the decision should be based on the characteristics of the HW.
> >
> > In regards to PSCI PC mode, I believe we should consider adding the
> > similar DT property for the arm,idle-state binding and make a
> > corresponding change for the regular CPUIdle path/governors. Although,
> > it doesn't necessarily need to be part of the $subject series. I would
> >  be fine if that is handled later on too.
> >
>
> While I agree with this line of argument, I am bit worried that there is
> more deviation from ACPI _LPI binding(equivalent to these in DT). If othe=
r
> OS has manged to run the same firmware without adding such information
> to the firmware(ACPI in this case), why do we need that in DT. Is that
> information encoded elsewhere in a different form in ACPI and is this the
> right place(the idle state binding for DT) is what I am trying to underst=
and
> here.

I don't have the information about ACPI at hand, so I will leave that
to Maulik to be answered. Or perhaps, someone else already has this
information and can share that with us?

In any case, I don't see any other reasonable way to describe this in
DT at this point.

>
> Also taking the example of screen on, won't that be prevented as the
> system domain is shared by the system level idle-states we are talking
> and the screen/display device. So it never votes to power down that
> and the PSCI OSI domain idle driver must not be able to choose the system
> level state.
>
> In general, there is some device that doesn't vote to power down the doma=
in
> and hence we can't enter the state. So my question is, will there be some
> device that doesn't explicitly register vote and hence we need an alterna=
te
> mechanism like the one proposed in this set ? If so, what are those and
> how does that work in system suspend states.

Assuming I understand the above use case, you are thinking that the
display device (for example) is a part of a cluster PM domain, right?

If that's the case, besides that the cluster PM domain topology must
be modelled accordingly, the display device should be hooked up to the
cluster PM domain it belongs to.

Beyond that, it's the corresponding display driver that becomes
responsible for what should happen during system suspend. If the
screen needs to stay on it may need to call device_set_awake_path()
for the display device - unless it's a decision for user space that
can control the behaviour for the display device via its sysfs node.
If things are managed accordingly, genpd_finish_suspend() may decide
to keep the corresponding PM domain powered on during system suspend.

The above said, $subject patch doesn't change any of this. It only
allows us to use more states (deeper), which are limited to system
suspend (s2idle).

>
> Or am I missing something more fundamental the makes all the above argume=
nt
> void.
>
> --
> Regards,
> Sudeep

Did that make sense?

Kind regards
Uffe
