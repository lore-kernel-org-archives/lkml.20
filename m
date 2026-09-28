Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551623A382B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597892; cv=pass; b=Gf8rN1o1DYQXL8JqxEXOU9NidsQ8gzYNZIMCOOvPri7g4M6Q9XbA9dOwSExjU8vdHBWvhzNmN7ZGGlV5iZj2IGnRZxd2UTaLe8SGXZ9K9mIB+2P5vspoCKcM7YCzdLD+7119oWoowj0gEQuWev4A9ey6nzd2/YUT9YuNrBqbfQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597892; c=relaxed/simple;
	bh=QD+IP/JQeXFvG68TvIWuMoLOYB24jv3h0RzVmWZVzU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/4BGwdIREqKDmtkoHupQ8iTbF/NCSWzKxRJGTWPJl5U1Fgvw/omdpgKuwGW32/RjbsTSGowf++M7kAavnU/RJWh9g77R4vB4wEQfC+YneF3+/AQJSa6GClrZkUUShq/nxcLHnwWOXfM06MckuoUzbl7eeL/0U9GUuRvnIr1SzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7IJNSFc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmTc9wGU; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7IJNSFc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmTc9wGU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAa861839926
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzefpZA05xL3xDa+q/jRzRAJHenJne+6yuOvzxu+MdM=; b=F7IJNSFc4XLasLfh
	wmCm3cOuG1L32UjmoTkxsrcwdVAUOlzyb3CB/oKsvkNsdaBJpOWSQ+n1VFj+XMEN
	Kr75rJwm4IQ+BrJcwP9H9r05BmcCZ3ZuW1+gasBqKJZ49SHE8wYg0ycVny2i/yoQ
	3HKo3yopBMQL6EfHeJSpNGrThfOrRdS4kXbcV7sxk6B7NS9e6eLttyf7iW4XcImH
	ZSqb+W/fFfPdv2ejzE4ywZsTAiBf7h1P/jIUy9Y7Qiyw4fDNSGhFYKA2bxxjw0jF
	sqIlvYUu4kfvg4GeWeuOxXy1QHIL3DXBqagYCgeKpXv4kGwq8RsyJeyLRXI+fQlN
	qm3aMw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6gn3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:18:10 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67139d2e528so4431574d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597889; cv=none;
        d=google.com; s=arc-20260327;
        b=eSlu3PcQN3CWWtuVXi86Fv6eSFQ9pgWuxKFfEGlubwkP+nWP+Wt5gdFivkbmPyr8Cm
         PDF6FE7VAxk8a/IvU6mrWebn4lFYiZkGMsyXdixqiVgLyjjbh4QgLkR7WdhN7qYE6az8
         PVTsK74NodISrYbaXnlLJ7OE3Mrb/+4MOqNo0lBp7H3/gzJ9B7NFwalAb+RIWbu2Ia/d
         yREVEaKLbMl/xehZKUP5pSoxTjAkB7xpVW8Y3qIwY9s0aGAsRFMCmW5LrKmfWTVmS8tE
         Ws3AOmiYyu917lKcu4/yDdJpRjeurXg9kL/hHVqySzYWQf9R8tDFoHAVsxS2VWdwD6jD
         j7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XzefpZA05xL3xDa+q/jRzRAJHenJne+6yuOvzxu+MdM=;
        fh=SryRgrFTkQO41xAx2pbYeLmFCkxbITX+ekqHnOtfU6U=;
        b=oo2ZPKzRerqY4qhFIPjoR4aTaKSR3EY5v89hoGB4QD/jb/fMnViXDYQU+2dR9Qsj11
         UktSJ/q63QOH1iFrH47AF/XQRj3fMI56OhEhxp1GaF8GtkRIPcOIGPAJvM4vbMPZC/+1
         9SbVmH2s2rJovp/JlUVXTpBIygfn2XGv245d2F0dYyKioxezfKm8ky4zVsoCw7DTYqVM
         itQRM4fRdQpVfs4iHNda8X81EQF5GzNtChUtILzzQI9bQcPUC4P03NSfyDI1D1vFpB97
         qJHX88Zm9SotXJvk39EHZRtVjj25lCLtbI7woX/NQEJ6WCXs0aBSohB7oUbk4HazWw2f
         TE3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790597889; x=1791202689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XzefpZA05xL3xDa+q/jRzRAJHenJne+6yuOvzxu+MdM=;
        b=FmTc9wGUwoWQb7Mh5xXHr1LAIxgIHf/0qnlkwZgp9VrPc9mmOI2yyqwXvDnQpoWQ16
         3YKJqSML/bclOi/5a9exdNjgDZvRPVAw5MZ3Un6DuonMxj27pglgB4EWr7PYFcRX46RR
         4j1C5t0V18RhUDjEmfkB9vNvYgwe4U5IlSIzANrAUjuVjuzd6MO5b+ZXW+ravr9JUXbT
         6ZVPrlKAz2he5uEP6mWPIKwoPjnftBAF1G2F1dD4eFxSCtHL5onuq9gdGkU6D9KkMTWj
         yfg+GINxIlT7k0wzG2lR0K1+kw8cmkmniNnJl3KT7o1mTztpqqih9U8bsy5vjrMXgrO9
         QUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597889; x=1791202689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzefpZA05xL3xDa+q/jRzRAJHenJne+6yuOvzxu+MdM=;
        b=lgIU41Btd9L3Yb2Ljejl3JgGrVZEAhQfGoIItiPBdwspZMIFQW2wWEjzEJ9YF/T+C1
         rbP5n/Qmx16mQayrDJ1q/5F7zHYvTCPY74i56oBaP5q5b6hZCPfQdgFGPlafyTncEasD
         MGrup9GYhpERAojwoF4wwf8CsvWpGzw2vga7v07rIZ0srj0BmZiV3qsA89PkWs/yt/sH
         gpZT3L+0NkYAarRsDJqX/pHuWfLAybTtwULYKj1HBdJoQguyz1bPRXgqXqgXYQTd1hby
         qpOOaisYY5DjeWNlGvT2zOHqHBFvFKgVP5ZMjdwoBkhlu9dFjJsOoTO2RKNp3qSiWnvO
         1pRw==
X-Forwarded-Encrypted: i=1; AKwUvBwInh1+rN7ACnCZDxkdCdiHfyu3KSYYTztMlKx2LvEH0F9VMzT/7kmQsXqfyfHV4naQBIWz4s1ZsHfcnmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEFCJYiFaqOS7YFB/JCVhi8sPrwHQ2QNhYzrHXr74j/CzY/f32
	t7CeKFGYM5Pvq9vgpCOs71/8yzB8RpyrtGwkl9aJzBp8x1vYhKADRAgXq2m/epjJKprIfxECISr
	SireZ54vxQ+qgEnF51wAEZVlJc2h3EAY47W1jcdDQuIjQBOsCMIj00uBa5Sy1rsnvP/FrCBijG+
	U41dsgk5MJ30U6LGuyQ8uBd+Y2zHm/29ACkoZ/QZms2g==
X-Gm-Gg: AYBFou1JeiehvqYgqdhy9NquOzZdHLdmd5WErHzXu6Lj6/Sh+vhI3Yns0lVgpg/gUI4
	qy59zgchYTwJtO315180Y+wjxkIE7YfX1Prlb0BYH2nsfnCMKbUfWvhiZwRoZ6Y58uheDRUjP3p
	H43iQHpm7ZVeb6doC3hhujRCvgAekdQmuJiLglrRanNP9bkr6Zwi6k73LXNQ==
X-Received: by 2002:a05:690e:e8c:b0:671:70d2:528d with SMTP id 956f58d0204a3-672ed3a1adcmr5448716d50.80.1790597889329;
        Mon, 28 Sep 2026 05:18:09 -0700 (PDT)
X-Received: by 2002:a05:690e:e8c:b0:671:70d2:528d with SMTP id
 956f58d0204a3-672ed3a1adcmr5448691d50.80.1790597888749; Mon, 28 Sep 2026
 05:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-4-d5b6f056568e@oss.qualcomm.com>
 <arOe2yA4KOvhYqRb@sirena.co.uk> <CAC-tS8ASR899SH45=mbr+8z6xcOBoRgYJWXfXXER9CUXdYCOrw@mail.gmail.com>
In-Reply-To: <CAC-tS8ASR899SH45=mbr+8z6xcOBoRgYJWXfXXER9CUXdYCOrw@mail.gmail.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 17:47:56 +0530
X-Gm-Features: AclHuK_s5MCzD1RecRG5TV0tZYeXGtKCs8wJ16v90jxnA5FxxzHDjGMMxqJkfeA
Message-ID: <CAC-tS8DUxJ4uD5s_BYc52v7bigMc9Mn585YGDQ_x9VaZdLe+yA@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT
 parsing and platform init
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0OCBTYWx0ZWRfX7xcSLLfULBPF
 xBaLKO9vzBKSq5O7hbbIGJvUzJYjJeT3ZnKBYQ83P09KQIdkFz6iyjkTNuJMMbvnymkGpijeFO9
 kM0/veCPk2DBbVrZ3yPgNqLZHL/JXq6wmBAQD6qqOtJolBRxsexYTopEpvlZZMaOH4W6zMm9qFM
 ZLimVa0b1DhO4AW/km2psEKzWMAdUs83nS73ZzZ26+9pC1OJQnn2zYa9lH74jU558Sy0Pi8rqfl
 2KpTEompDVP4WtEwPBZME893Yby+5NDSEtgydhOkoBmbHno8c7O5RYkm63DyHhzPlhzorM03fNL
 AeIjS+cLT4h/2CcrhHtmOruL0aWgkSxLhd/+awrrqXEK3CxcGcOvz0k+ghszIJaV3FC+gJtE/Wn
 2mncRNzk15Ocg6VcGTyrSU11txrVJZp8+Af/lZetmLKckgyrPPkgUbqRe5OHSFjeaWA+KCt50oO
 OFmJMiKk1bIwYNLgbYg==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba5b02 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=6YM43U1n-Uw7COpwBTIA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0OCBTYWx0ZWRfX18gDWwfWSuGb
 NvTt7KPp9FgEod3I4vVlOrzn+Q5BAiDbL5sVbplQzZiTlo9SPVVC/nM+ELeS9ZFkWFjm8xHXfRx
 +jJcOC5Wy7EiSSxjcVzm5Q3Yl5k5/tI=
X-Proofpoint-ORIG-GUID: bClgLaVIBGMJi9OUUVDmgfPtqijH4U9c
X-Proofpoint-GUID: bClgLaVIBGMJi9OUUVDmgfPtqijH4U9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280048

On Mon, Sep 28, 2026 at 3:08=E2=80=AFPM Harendra Gautam
<harendra.gautam@oss.qualcomm.com> wrote:
>
> >
> > > +     /*
> > > +      * The sync, lane and frame configuration and the MI2S bit cloc=
k are
> > > +      * shared by both directions of an AIF. Concurrent playback and
> > > +      * capture on the same interface are therefore expected to use =
a
> > > +      * compatible format, rate and slot configuration.
> > > +      */
> >
> > What enforces this?
> Both directions share the bit clock and slot width, so rate and sample
> bits must match on concurrent streams. Would adding symmetric_rate and
> symmetric_sample_bits to the AIF DAI entries work?
>
Please ignore my earlier symmetric_rate/symmetric_sample_bits
suggestion, Playback and capture are separate DAIs on separate
dai_links so it won't work.
The comment text in hw_param() is misleading, hw_params() doesn't set
rate or bit clock (the machine driver does via set_sysclk()). It only
writes sync/lane/frame config from aif_intf_cfg[idx], fixed at probe
and via set_fmt()/set_tdm_slot(), so both directions write the same
values. Will reword the comment.
-Harendra
