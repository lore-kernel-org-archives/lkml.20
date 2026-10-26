Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028840;
	b=uWjetSWo+EIzJXqcvZpVSB9PLOCjvpepjwI8FbVUoPZ/kpgkTgcBjMpvwzxh3XJT+Ofm
	 AE0aW7KgqAYc3I/jbINYojrhEZu7/FzbfMWrIFZXd4O7W8zNFp96VpxY4F4aedyx6tGH2
	 0R6ESCFzMRXStzoBXyRvOjDiE/xYhIiCnnTpQQAT/jOpWoqf00ZHwupw48PgCP79U49L3
	 Uf3ce9Aoz/FmsUyIwG11jyIx893b8J9KRB0W8UIit5dOpTdT4qzaJvZT62sB/nschnhVv
	 K6BAvvaSc6GCa1rZBnd4vnLHNh0K4Rw4J81GcRK0XnSahNbR18C8TVNB1g9yNfYAAew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=;
	b=Zsy296htxZXM0aBJwURhOHpj4Kwcev1fuLcBmfM4gisIOHffmQ8E1W+R5bjBvLMZvgML
	 rSW8Bvi7ZSmNJoJ5d1ImRCuGesEPqzWx0t4WhRMwpRbZpxyKrN9CfGx3qdqLJjfwSOJdX
	 HoIFjkz0CY6wum4fwY7XaYtfNAPkgFzpjjnCc0puc8RGIP36yCcukrV5KhxsiQdnLbS7r
	 4CKnYtwW8Z11kiM7N6xEPD3BkE92yIOX86ThutzkaWTfEAplm1b0nENHeKsLVYZMuGpJ8
	 GkEUr6hLQGdhDoGvNa585eB9TllrsRuCHdnt466roy+N0hxC/35SYqg+ePkSsFG1d9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcS0ih4B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B34kLs7r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B43606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B43606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcS0ih4B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B34kLs7r
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvjvX4098777
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=; b=Uc
	S0ih4B0SqyqXAGstgs78uTJ2W7qimh8yCjoJbY09Gm39AV24Ile16ot+enHW4FFm
	9qMmuf6FHur8O9jfG/YMtkMxEAz1IiClXAjROITmWFDsnvmI8tw6nfgct/dmtN9z
	c63Mg4VyG+G/31UCIsG0BKMBk7IEt/zLwMQ/+Wf++9Km8773Q8spidzIzLZMEjwK
	Sbh+9lT/5wawmkzk3TuAEmif2GlDCYa/P8Qdcjgh7TkJmLTCpkZEDNIxwFNJiao3
	92AAAEeutzkreIbsQHsLINmFTDvp/FJ3sBJNB/sQeJ5RgQcq7rMOpOGcAHd2kmcv
	I4q1Lf0XMMwaAaExINsA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s919t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:33:58 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-702f912301aso3151079eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028838; cv=none;
        d=google.com; s=arc-20260327;
        b=SVQOOG/WmhkVxVYz4U6fhUv2KBuh/0i1ns7P147jhmBKs9zp2EztBwLq5H68M+Ggot
         i/h6f2I2VK+Nc4LotcJzAfTGXWgWgAurG16/6+7Me3D3ubOFeQ6uCDqwXMVwj4CsvDfy
         zJGE3D5bHDU91gc3m+vf6+m+mINnM6uowSmgKgtwPRiT3/n738oaymvSw5IzJIYVkee0
         8jT90TcymJRvDdWATTIOM2YpBZ80aVUd0TItq07QY0Yf6DdbDdPTobv23WtjkdHREIrS
         LNSMB2ZEgYQMjv+BzyladPAlkD/eQEhVPoN4Gwk7VtPYNAAF9eGzl8U6mjI048fWZSwP
         Du2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=;
        fh=kRa0luAlCyjQ0QGvde6Lv+AN0FX1NpvAjgQgw3DGW8A=;
        b=orNo2z4w7J72BDhaIju/52h+psXohMarsU/32NqnRvmr8HD5dUTojByAdFtDYVJFxT
         Rjbq6iiPfs2SjHlPKpRfxvnkjDPS9j65PMhgRx0V3q68jRAjmt2nC8Vul5s4Vi6qhLQy
         QkyvLReYCrUXjPlLgMJErS6wtsQy51kChYTeeuoM2Ln7ZgVYV5teW2mY6ddGH2QmBqGX
         umd+Jb5J997TPMz/5mxAq1ycKJOWLNO+0maaOYVlGWYk0+8BCd4XuYKs1OfCXMbpb08Y
         ZsTFDmWvg8soHK0T3bioz/KgHdkrExw1g83pQv+wHHQ+kEJa1+kJgfzK5ABkMzbXE3jh
         fn2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028838; x=1793633638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=;
        b=B34kLs7raeLp7H9fv/q/Xoa+KPZgzmUUHoWDCSomDngkfOpZqXoEUtmv2GwimFYhYG
         LrHVZXpHBUrUO4EfqYWKvtXH4/CJHEQJasuqG6A/Klgdj/15IAuo69RkpxmZF9a9D7Nb
         NLGOeLsAz7RrchVrteX9J4v0evSCNKvZH69eDSmu3TPfAdZAaqUI+exT0uZcEFOjTVPJ
         3kePwnNAM0r1LHvUE/u8fGkYxGB5dNXTcE0NccLCcquX9EqPcr5szxl+OXFvMBgyBnyq
         59ZkgrbQ9uL5GN+alKxs0+q6nwsndj27bMeiBQOHKdscs7DTxQXiPSC/fr/+Ip3X94Cu
         SlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028838; x=1793633638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=;
        b=xEBu/0twCB0/pHY1ttj+eH9ujXczKj/4LHjZlrbRk201WuAs28OoIwiqXFi79hj9Kg
         UYkkJFAOFRjlINBKlcfmpTUO/C9WnK3dKLVLgc4LXUjMv/GD0tUkFbtsMA+SSkb4HZ5I
         FNYtMimpG1WwIPUP7Pdg3KQzsyqbIl+Ekkme4VkoUnsTb9F5xei4aPxj+J6LZLBCT31q
         yAb4m9mwXQfe/OtcIWSUhFhZ3zerN5WB5WZbfKJIdCtXGkSOxsBNJb6xpLm5f5nEh4er
         qZQ8ONmvB+3kvzEyM/Jv/qTE6FrpK9l+MWIV0SXN0rb6x1ffLnUpzOSUS8yHNo46wShT
         NAcA==
X-Forwarded-Encrypted: i=1; AKwUvBxtf4Mib4QjeMaPUlIUAsJK/mUs/anfoNI+RK2PCfpr6f8vYFF6Fk6eqvjPb9X1jamASSFaopaHGNjsFz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOJZyA/qO8A9kDQKhde3YMR9VSNiM705MyiNdA/RafKYvSGsHV
	JUvBq62flnQACTP4oPZ2NW8nDtPGY7oGw17q2HpBNxhNQmMWnUqmURexYe4KtssWkw9GYtvxz4O
	+2t7z1jbVanTO9cO2KkrvLn4grFrpsIbFV9Edz+x3Xp2LR1ZrVQI6J0zVwODcdebVn/G7lVzIdD
	wvNqymvLDQ5kfPEWp9srHlvZUZFEpBWZ+N5gX+pWBvVQ==
X-Gm-Gg: AYBFou22inRTwiM2cfRtv2TZS1ZImeqyLI4FRjuObEdRB4XiiML/TBUwE2jhaQeGFcz
	TJqcNAmsC5bGqkzKj8LIz2Y5pLhmj8ErPWG7+AIljustDgrJWIrpmgflBZP1FKW48X/e+FKMNf9
	9lxsVorDrW2mYE9RGW7ifPz4arhG2IJhjV3w6EzBYt8x4E/1xh6OdKFwflhA==
X-Received: by 2002:a05:6820:1387:b0:70e:78ba:11dc with SMTP id 006d021491bc7-70e78ba2a36mr1241820eaf.17.1793028837858;
        Mon, 26 Oct 2026 08:33:57 -0700 (PDT)
X-Received: by 2002:a05:6820:1387:b0:70e:78ba:11dc with SMTP id
 006d021491bc7-70e78ba2a36mr1241797eaf.17.1793028837444; Mon, 26 Oct 2026
 08:33:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
 <CACSVV03M_MzamPN5X=+bmbqOkET2QOJk8O_vQyhnjDGbSTvN2g@mail.gmail.com> <a5667943-3c3a-4bcd-99f4-fe5e487cb6c5@oss.qualcomm.com>
In-Reply-To: <a5667943-3c3a-4bcd-99f4-fe5e487cb6c5@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 08:33:44 -0700
X-Gm-Features: AclHuK_qyCyqkMau4o0U6eEvxC80Yve9tJ1hV1jdwuEzcVPxGyIcGYsybUyrLPI
Message-ID: <CACSVV016mJk+oLotAUKeXr4a9FHn=cfPcWrxdfrwRxmC4S4wqw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/msm: move VM_BIND op validation to Rust
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX1X6JW8WnXqB7
 tf0lAJAgJHgZ9MX1+uwtyHTf0/CmiRP14LEt+LTzI7rRLpE/aH8LcrA0JQVYOxoPBH5pbSoGGbV
 fT4lXnU4HhEYeogLfF8dcqZRp3LTW1tqgBi2R9qMwkmgIKWwijaYrz44m29sVS/n3lc+03FhYHh
 DZdusLIVCG1tcmsG7ELxDQx2eukWPNzu/ysJsHQQzk11XzgG+cHlToraVVwjuJPnZLLZlHBEGcH
 s5/niLnAUHJqCMiFYgzwKv4u7ux1axkC+MONrUUHcFfQvEAm6EC7pRE2RcY69qw0iVdEfTYaWBg
 yjEOVKMyA7i3k1+us53CoNdMUctwL33qio5LebPPPQu3S7tNg4Mvkx59F8ga4V/Rf7+FSUaFI/z
 Y6FwkYpKvEp5UJpduvDiD6GnLFc/BIr/XefsnFKMddiIv1w0AFIxsLp+FhMqBaczgxxCrgyrVl5
 pSyP/KeR1h1ipCLk7Pw==
X-Proofpoint-ORIG-GUID: I1vNsDZjBQAS-4pI96A-bl0OWxerTPzM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfXzpohn9/3qQCg
 aIOSyGWxWIJkh2KqrYtI0W/wTr2BnQNHzMHY/t7FDYbXPB0fUrmtfDpo+37L+3eDhZWgOjbCpxR
 opBMDmJ5FaCJayDzo5TnpeKBsLO6WUc=
X-Proofpoint-GUID: I1vNsDZjBQAS-4pI96A-bl0OWxerTPzM
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf72e6 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=9rG3V10fu7yUYHM-WnoA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260061

On Mon, Oct 26, 2026 at 8:30=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/26/26 4:26 PM, Rob Clark wrote:
> > On Mon, Oct 26, 2026 at 4:40=E2=80=AFAM Konrad Dybcio <konradybcio@kern=
el.org> wrote:
> >>
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Much of the VM handling code is a headache to read and maintain.
> >> There's a soup of mixed-signedness/size types which need to be compare=
d
> >> and added and getting that wrong in C is very easy.
> >>
> >> The "(range + obj_offset) > obj->size" check could wrap for a large
> >> obj_offset, which let an out-of-range map be accepted and then mapped
> >> as nothing. Oxidize it and use checked_add() to fix that.
> >>
> >> This commit is a "get the foot in the door" type change to make sure
> >> that folks building kernels for Qualcomm SoCs have their Rust setup
> >> ready. It may/should be extended to the wider mm code once the
> >> appropriate abstractions are finalized.
> >>
> >> Worth noting, the C UERR() macro expands to dev_dbg() and the Rust
> >> implementation for that currently doesn't support dynamic_debug.
> >>
> >> The DRM_BRIDGE dependency is dropped because including RUST exposed
> >> some spaghetti dependencies ending at DEBUGFS and it's enabled anyway.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >> (if this is rejected we may just patch the C code).
> >>
> >> Notably, this will regress some ancient configurations:
> >> -- arch/arm/Kconfig
> >>     select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
> >
> > Side note, I'm ok w/ drm/msm (or at least the gpu part) depending on
> > CPU_LITTLE_ENDIAN.  The combination of BE CPU and LE GPU would be a
> > mess.  I'll actively ignore bug reports, patches, etc related to BE.
> > So please, no BE!
>
> arm64 is free of it now!
>
> 134b0fbc5c24 ("arm64: Kbuild: Remove vestigial big-endian support")

And there was much rejoicing :-)

BR,
-R
