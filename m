Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C94748097D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280283; cv=pass; b=GsmaQXe2x1KEdkZ9Gawr6CpPHvH56+TBbQ/Df7iNBOUZJljRCL23ErV87XKZsqYstVgrn/gltq03/aHgQebkK29mZ/l5hn+H1sKEaM1qj6jCIJW5s2fa2zvy/Vw6if5GUz8BtxXKQsxU1qfyLIPVolX5onp4tuLeGJbdPiegxtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280283; c=relaxed/simple;
	bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYDOAqguqwUYcYwOfldOKdUDYSXU68yISfZHfg9ogQBnsZpSuLhIFV1c7kp93U9t5+Edwp5B6nz18UqLjM7bdx61tJ1U8Ni5FBB4Y85YgRvjoKD7J3fF0fi6cJSrjANzhqvpt7+8RJ6WsvG5GitaLjRv5kGpjinwfHOP9CB3t4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C24xkZOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCeVWJqJ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C24xkZOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCeVWJqJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8YA63495533
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 16:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=; b=C24xkZOBMHghNCgp
	nyLxCOhToHipUH1POz509VZqjpVdRE55bwYNcA+stjyTmewceb/Ue8tJ2MHHFet4
	NSQoaOEZiufK0e0j+eUt3MG7B5U72niCsVrQdUaffrj/G2S47sSZPm+9nh4iR72C
	Kc9hhK+GvWXvpmuY+dfHffN56dLMkW67DRnMx3/wRPws4mZexqIMXD1tfh45j+G1
	kFg//DMHpAdwnr8y1RADR4UFNcfsg5T+cJibI2rrT49f1opI3DnFSkn++bMs3mhv
	8CqDT9Mmurfa/d+f2WbsjcbHXOc1VK4pA0IVSVt8BuCSs5wAiIWlRDaT2F2bVVVr
	XGWg/w==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdy9nh4ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 16:31:21 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66e509682ccso74763d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788280280; cv=none;
        d=google.com; s=arc-20260327;
        b=qBx/13ovwOzC/UGbWGwqDKpm4AR+QuGIOzGF//L5oKceHFggx0ZiDHLorTIWcjMAYk
         Xn1j1+xc2aw7Hw2ZjYfZTa7uVHXw5N8fhx+9pgNmNz/5RXKu3Mmxh2mvte15s7VrNECE
         D7N5OXTseRV/0vV0upXXtTTT5DahP5N1AQanRbM5T85zY+3FKwBHlXof64EEialViMAT
         rYz/PGr6nO6CvKEGvkw3Bw0j/dugsyaBTb8zOJyFk1R2EmKTkk7aMfaZ0vyo4X89LVlm
         X3MwC4wN12khvMmjXJ8JjIZXCIyGICGteOAUAQG8wLqEeAlj6IzbiV80ALf+JPXB28s2
         PdBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
        fh=6k9MgNcrai/nMDcu3c55vEvsxTydgM8BAalaIP9czCo=;
        b=I+iMKpz1Z/4IHZP2gzMIrPD64hUPUbVvt94OhU4uXGdZmoxxrxblqr1jT+iFuIwZYL
         hbFPIVWuxDBY92Fwk8/s3HYl73lPxZ4VGDRlYu2LzwPtKeBocFWB97xF6zCeT7DjhhCv
         xD1a0XhZCADpX6+8AA+Ueuth7bL58q9VDVuVih20EHvl3AT6C+9OT9NWz751pdvO2jsf
         yVZQ/y5Sx0eU35A8WVl1ukNt+JTqCwsiSLyCLywHFphir1pWi6Js222pgfI5d44i81fz
         c974/MZEH/B4cjXcOmMXultwL21RgE+fc0P7FjcaSN8AVYo5CE2rLuM8wS1ZbXKr+pej
         k2xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788280280; x=1788885080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
        b=cCeVWJqJ3TOh6BkJXvLb2exe5SI+1/q6N7yVGwukBTE9080ojXauK+VeLnMeQISI7z
         weYWuYkFMeRqMUXIjrEEYfVBeEbZg/SYs+knL2xDyRCfjmEPGQ4zgDd1jjzqUpFoIt8h
         ehTgZ2udZGIkTcDmBt2Bqu/+Z/BHl9nTXG8lvr98Rp8iTB/OOg93YoVFKFgNU6JD4KJX
         4/vOHVuPNaq3VTsF/dJRxQJf2nhSc1w+Qef1tqHjUkgO89NOY9YDCPNWdvTi/jirJZhU
         8o1pViX4kybaQYcnHzFxnY8w/Hrvfh11EZs/z7ZprRvT5xlrUPIKt5NEp+dG3EOkVLxc
         Ihow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280280; x=1788885080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
        b=EEOzd348RavsmGBeng0Veu1D6VQCjKuBdx0YKwrkRmHKvN4mFXDXJBMHiANNQPZctn
         YE5ZkWSmQ12t6KrtIPEREBTfihwcNW2CZc835cseeQbRLqw/VoOXBolgzInApfzHxQXh
         3CVfgmeISZU32rYpk9uuKfiBdbNp4mYZJKiJHnE+VVyN9lK9raFu0lRPkkpmF21T+4IF
         ih09ebA7Hq9J/ggup7DNjZc2ku1uJAD45dJnsRtfdlC/DvTDN/KfG9Db9po9UjzxSVTx
         b1YVD4X5fujMLLFyiTLBY6Zn3dAVsyv34C4newFAnxFoXOAxqqUtfD4I6u2HEhSzVy6W
         p08g==
X-Forwarded-Encrypted: i=1; AKwUvBwRshptC3RRsfCioKRNc6oMDbZJVlUKSbNtC/m3QKeEnHtrs6EB/pVMUhBXsmR9xW6X6Nj4fsOYgohXVeU=@vger.kernel.org
X-Gm-Message-State: AFuF++m1d8VVleROABBx0BB4uqceFuYVMVN8XOruq8+cWLJ9/OfGWG2G
	cJs2ntT5Gq1sdOGa37bcl4I7sGAB/cc6cqO9tscz7WbkqYu180q4BsIK4bFLq0IfmohhAKtGmSA
	iWBWYXME6QjEdmGaf1wPHf/coDw/tlexJ6GPZpXFH2r7SmKnAfX4yq6jeDtaVh2Dr/ycA/0u7sp
	AnTkIErMfWloxIYXjLMdeo1YxdydeOqjuywyGvR1b14A==
X-Gm-Gg: AYBFou2JKa2l5bKJrdVYDpQuyNqIpdrB4HF3uiFa3C01wV4w2tOkja1Tenzm5jRnjFj
	pCyPeXZ86X2O9YjTwlOJWKp61zHGYgIpRMmVCInfs1KF309mKffza3g7yDebdkcSdhaZ4KUE8kz
	VOntQfgXOd8ja+WnOmWFDzFBscpHAomE21F6a3MEAUAPjKheh3Wr6W1NsxOg==
X-Received: by 2002:a53:b111:0:b0:66c:ba49:1316 with SMTP id 956f58d0204a3-66f87458761mr2635198d50.10.1788280280167;
        Tue, 01 Sep 2026 09:31:20 -0700 (PDT)
X-Received: by 2002:a53:b111:0:b0:66c:ba49:1316 with SMTP id
 956f58d0204a3-66f87458761mr2635174d50.10.1788280279650; Tue, 01 Sep 2026
 09:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com> <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
 <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com> <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
 <b7fd71fa-703d-4508-824d-a9816a1e7494@oss.qualcomm.com>
In-Reply-To: <b7fd71fa-703d-4508-824d-a9816a1e7494@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 22:01:06 +0530
X-Gm-Features: AcwNN1Uh9bB4S11ithQu0Q4MNVjip4sbUP9vJMJ7eTGO8R3TYdzVDu8Xors9K5s
Message-ID: <CAC-tS8DO4Eph+obOU5jxwfX99gZ5Jat0PpD+CcpobJip9rGW2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0NiBTYWx0ZWRfX7eMBTCHKY9ZX
 OWY8RxbikuG1g9EyXI1GrXEvPXxat/2vD0M66C9vosoCpruEvEj8mouLt95SC/RZTeelf/oBH+C
 TnCAlzi3umYrz5CI1fmjIW1c3X0uyuo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0NiBTYWx0ZWRfX69fcV71YecOw
 68emrCkOLMBp3tsJxMAy76drY5obPdBqdePbZW4ueuf2CbN8l745o9CQXCoy8GGEig41icz00zV
 /Yra6xZyZrCSO2hgJTDHYzYiJz5KEBHYLKL1BAkpjCs5ELhQh3bigDY8d5Ucjc+kj2FN2sjFk0k
 Ac86OWJVhwvx6C7PnIDVCyLqVSU+4nCK3ItUEPobTqzLcwydfckPpHgT46FYRMDZtAyoBsmerXs
 Wv5TOLrrszZPhL+QHtNhcWqbjdFiR+juXnFqFohj2DJaULQafb5yglC5Pn6QB7+lCpJ1mTMv+vi
 f+f6GI/SzhUeLCLAupu4NOebzrYTJplO+JJUdAS5MpmmUBjDQ3Ic+DreF8M+YAN/K9JJdXqUW0t
 7WRU95dHV5J1njqxSnWel8Tk1M91wBZFWzUMTRQNve0/s1JyEdTg/jExq877Y3QR/7EB2vPf4H7
 Fk/FpXe9fwrmTztDR6g==
X-Authority-Analysis: v=2.4 cv=e/02j6p/ c=1 sm=1 tr=0 ts=6a96fdd9 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=oDxv99porRbPmQQDQpgA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: cGK3bdlvrIh3WcpMO4x3bHt_VkoXrMrJ
X-Proofpoint-GUID: cGK3bdlvrIh3WcpMO4x3bHt_VkoXrMrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010146

On Tue, Sep 1, 2026 at 8:26=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> On 01/09/2026 16:46, Harendra Gautam wrote:
> >>>> The DT binding filename and compatible string do not match (qcom,qai=
f-cpu.yaml vs qcom,shikra-qaif-cpu).
> >>>> Usually DT binding filenames are aligned with the compatible string =
for clarity.
> >>>> Is there a reason for the naming mismatch?
> >>> The filename reflects the controller; the compatible is
> >>> variant-specific. This follows the same convention as
> >>> qcom,lpass-cpu.yaml.
> >>>>
> >>
> >> There is no compatible for controller and the only top-level compatibl=
e
> >> listed there is "qcom,shikra-qaif-cpu", so that is your filename.
> >>
> >> And I already asked about this in v1. Why does this have to be repeate=
d
> >> at v3?
> > The QAIF hardware IP is the same across platforms, only the board
> > integration details differ. The binding is meant to describe the IP
> > generically, with board-specific compatibles like qcom,shikra-qaif-cpu
>
> The binding does not describe the IP generically, because bindings are
> not generic.
>
> > used to distinguish variants. I had qcom,qaif-cpu as the generic
> > compatible in v2 but removed it in v3 as I was not clear about the
> > guideline. Could you please suggest the right approach for the
> > compatible and filename in this case?
>
> Same comment, literally as v1.
>
> Filename should match compatible, as in this case since it is single
> compatible, filename should be equal to the compatible. So first you
> determine what is your compatible and then you copy paste that string
> into the filename and $id path.
Understood. Thanks for feedback, The filename should be
qcom,shikra-qaif-cpu.yaml and the $id path should be updated to match.
I will fix this in the next version.
-Harendra
>
> Best regards,
> Krzysztof
