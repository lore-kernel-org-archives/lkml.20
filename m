Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D4048C8CD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781654; cv=pass; b=iPeT8HuROUtr6NjSDvUiTaX8wbHoq1di6GKQhOW8NN+4vBflncNbAnV27Y/EDRnhg5UkoRhhkBFgsuo29pmJter7rJm3jLFuBUw4BVGX8CsB3IZ7v5CwncYfvlsEH46anl0vJOKv6bNDOtaQVhe7HEtLack5YZWk94wAZGsn2p4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781654; c=relaxed/simple;
	bh=Wer6SSG/uDE6Ee8Fljcjhj1Fc9lWtsOpuA414gbFytM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5y870W2MVvAqkt+yoEc6GxqT5qebOF5rPMOHTjTEwJmf7DbBbH2Z9j3DLUMsWh9mCvmJZXuNgBf8ewF5ZS67C09nkvDTjs4KevPztgsLOWZGwii1Z/3d9rhyVjVnDzfMPD4EzEabltjIdxkXEoAZaEQEQWcGgRGvhE8yUCpSnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVh+6URp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMEAMZuI; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVh+6URp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMEAMZuI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnDRl004214
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 11:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=; b=KVh+6URpAkw9KsmP
	irbg8XvFBh9A6eBx989QXAL13WlV1Jrh0mmYPZdj5c01TfzI5xEL674WJwhfe/jb
	OUAF1Vr19KYwnmcSyjRMXKsxQSN8Eki9ZmSKwly25d8wWP0yCrnERjKfhU+9MroU
	prIf7hQRZvLYIqHCoodMOd3xbVg3LhDZ7fdV3HctW0nwhRcCI28jcWO10KUi7QDo
	zwJEogawHXaLyFiJgy+m3QvGGkIIyLD96we8/PazWpLwlWmaAo7pC0I++u9MsEmW
	CT/UDrMsb34cZOdGk0moA5xFjihWv1A2af3GDOcLHXLBRxtFA09DbYaL3fVux8C6
	i03mMg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg0u2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:47:31 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66faff68c0bso4880141d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788781651; cv=none;
        d=google.com; s=arc-20260327;
        b=blQTeZxkrcIeSZnoPpzwvot3k3yMs/Yil+PxMBFGPosNN4oo7DlNH8/COx7iFAbU40
         0dC2CV11I2T5eAYnyftW3Og9Wcpi95y8Xe/cQ9SgS08q/fORSqea6/6OBxK1xRCFroRW
         DQpnJRfbu7wkyurvOz6MP/eRv0Dl+B4tTyzo4pa6NBoNAQwzonPbo+JlEaN0rjEkcVkP
         TRVZq7gB1Nyttq2RQI8+LtQxmGcrXnNOCFnfPDHWIOvQuEx2qbC4k1QNclRbScpnp+v7
         xJyXs8YKNXpHd0EcIUkVt7by6kV03eL8RYS4O1YDfwWtnR7+B4xFBBGcEAbAfJ54TIYQ
         bX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=;
        fh=6mQDzqblrxTQzFj+mZK+mf/0LPVLJr3De6SwTBnG7AU=;
        b=MsHuVpEymqNsnhEM8hBI6DnjgF/zkyVSCaBLCvA6ysoUJVHeT4VALMUA9yWOLiOSdI
         09NIwn4ZofoJ3wzgYfPyKvorbmA449ZoyMb7nLuwMmBzO3EYeEXVIImcIIVNs5whnxqD
         uUuu39tgcfYM9fOv0BSpseFi99aEGApovHa0HdDlkR8Ruu0PGlAU5f91UZbAy/0Wfk+k
         LMPgZGQyn67+B3wtq2VJOXg8bU+itqvJ02b80NHhlPw0zNPCQoeeCfef8iNcOoXPdXUh
         SEErDF4QrIsLb++e0I3Bk7FPVyMTzXkpk1r4a/Id14yygGb7d7mH6F6CRRAB3AGyyolj
         CRdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788781651; x=1789386451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=;
        b=TMEAMZuIT+LoJN2NefwoKobwwgz8IHx3Pz9ypLAlt+KzOSO+WWA5SKIbwPGvQFaIiz
         EuV5z6NhFwed8jM4Fo0DazGqrALOTk8XTL79OveVX3CZxDvBhJO/RaEvgc0kUSxhe5Rn
         ZseR4Rt/50I++/hiVAuv4sY5agcEjGx9GV4UGkasgt3b8gm4IV+jjqeSsorzO1Mv69fG
         Dyk26GmTx3IWJ0qB5OvlsgqF6uqrv0x/D3EqdeAEQblrTqwlELVOdhexUWwDjzE6FC/m
         sEuKq2ObZAYVOusjDTp34dhKn8pzx2gRyWeM1e2bHxKpmv5HmUS1+xiDB9FTRL1Iy5Mn
         qEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781651; x=1789386451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=;
        b=mNQc1WJ23hz+F/8Zdr1bPSjIWVNURnlv5F5ZbF9/d8qkPL6aleKx3jwTU7fthHIrQB
         AQc01L5LmGBHDipbUK/bQmDaF/RztJem2f1R9vdmMNXgKiQDNB4QMza/g7LdH/ldbLKx
         7ytklDoMYTND0uIsab9iZLV3e4FlycP0hszRzutSO68Ax/5O0bkYF1k4waYIX6AUlG/V
         Jl/DDTvUnKQgxRaYyKZm69ZmFlZ1A8slThFPRA/d4FVQK2Bo4myiW8lvwg23Y7eaDNFj
         uhPLbHCBq2dv+7P0WkraOPWArnOXKKKksXSCgEbczFpgWBoG+vV9C9qlrARhfdZvLZEn
         +I9w==
X-Forwarded-Encrypted: i=1; AKwUvBxBCYGuA8jP5YROQBzXeQpSrgdBCDggkhJBsbC102PSYz55XE/Olc+nQtLPKHS2lswidE1nyUlPgH1XdAM=@vger.kernel.org
X-Gm-Message-State: AFuF++lyymViZdKto7NY5vkFqirVwAJ82tjISb5LbArQSFvRMe0Fs3CL
	ex90siPaD/DEVIqmLDPGH5Ucn9Bgd8KxkIJ+ZGrOxK7Up6EEZJq1JwFLcyx+67oaTwSpQkYoLRp
	q3pGpq9th3XNWUtawDKn3wdZtXF0o6d77rxLAbA9kMEPNmbe7dEJOLZOco0knb3iMlwd1haVfdM
	d+Sud3Jz8cqGDqLzV1bTodBDlBUn0TgHZGRlINCTRjGw==
X-Gm-Gg: AYBFou2UfJ2T92UWzH30WrnJ3R+zyLrvtTA35D+IQTWXlAdngyXsLnL8rSS1TALdTC5
	eqws6POMQeuzmEvpbZmF9sNfjdJuxdsLb5DY5KiNyZGTMmtGUcJ4vd4KI0lpaDQuwxtx7Lhk1au
	doTbUUZTL4MVHfFS3V5M1wb+FGDSK0+KYvov1VTL3b7uzkS8qHbiLea1isIw==
X-Received: by 2002:a05:690e:b8d:b0:66d:2276:bea with SMTP id 956f58d0204a3-66fb5abc685mr5954578d50.35.1788781650735;
        Mon, 07 Sep 2026 04:47:30 -0700 (PDT)
X-Received: by 2002:a05:690e:b8d:b0:66d:2276:bea with SMTP id
 956f58d0204a3-66fb5abc685mr5954550d50.35.1788781650223; Mon, 07 Sep 2026
 04:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com>
 <20260907-arcane-sassy-fennec-afc02a@quoll> <58e186c1-d199-40ec-a165-2d3e4f36c623@kernel.org>
In-Reply-To: <58e186c1-d199-40ec-a165-2d3e4f36c623@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 17:17:19 +0530
X-Gm-Features: AcwNN1XXb0eVO7BU5GwO2TvIzIj99UoYsYsbFLmLlnq_kiZvskMwYXQlzc44yys
Message-ID: <CAC-tS8ANBcNatz4LO781zT_4XKwE7TkHrDaQ4N8JFr5x_vFvFw@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfX6ZqpO8Df3+WM
 Eusf7IwNzOS5ovd+yB7dUiNMVaB/a+JQSikxTyTBpviqSlIfpH2ZOvD2NqC4MeXWZiE6d1brBF4
 S87maOaKXkIITLVrJ4ygjBKQvI5e0d39GbMHgt1f0O8/Dj/HJCkZO5RKag8Z808Oux32DJ9rEwv
 tFLx/w8hCuAdxdsGF3UkZJQhK11iz8aFPoSNPVjfQwEPvgnFrZmhXS5acM5m1Oi7xHRfp2/JrTb
 na/xyotkSA56tAjy9ubV05USczv/smBwJiE0YG4gjqiuIo1Q6bHcoO1oqWFRxl+32gG+IZnz9dI
 UIlTuEr+7yX7Lwo5P5ZdfZf0bKl8jhvEDRNFXSjsk73JYBH5jjp99DwSa1BueoKOtNVpKfnV+eN
 LZTzeivFR/l2LAsPIcac2viR8ad80eNB0SG+TabWSokP+7WGzTLSSTf7YDZ7PwRNLNwG6TWoHEf
 tVMVSZAaA3rLk1m0qxg==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9ea453 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jnI5DnPC5xRnza1bqQQA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: OfM3bznMw3lLnRV7rwLRjxv4IPV31xh5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfX0PfEhRPqQvx7
 NAoZa+6Uz6j8/uYvp9ddOohE6HzcM6RX2WJ3Ck6Mz4hWG0Per2RcMrwINVfOxreM99Rq1wyW8Ea
 tIn/evUFjOe7LK5wffFNFEPskpni2R8=
X-Proofpoint-GUID: OfM3bznMw3lLnRV7rwLRjxv4IPV31xh5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070130

On Mon, Sep 7, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/09/2026 10:30, Krzysztof Kozlowski wrote:
> > On Thu, Sep 03, 2026 at 12:58:52PM +0530, Harendra Gautam wrote:
> >>
> >> Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU=
 DAI
> >
> > Why do your commits have leading blank line? I mean, really, how is it
> > possible to create such commit?
> >
> > Additionally, way you send your work is making this unnecessarily
> > difficult for us. Look, does this work?
> >
> >       b4 diff '20260903072902.3870009-2-harendra.gautam@oss.qualcomm.co=
m'
> >
> > ? No, it does not:
> >
>
> And now I checked... and you did not even use b4 to send v3 and v4. I
> mean, really... why? All internal guides, all external presentations
> EVERYWHERE we say this is expected and even almost a must for bigger work=
.
Apologies for that. This is my first upstream series and I was not
aware of the b4 send requirement at the time. v3 and v4 were sent via
git send-email. v5 will be sent via b4 send.
-Harendra
>
> Best regards,
> Krzysztof
