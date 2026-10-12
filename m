Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AC143F4BF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789939; cv=pass; b=B2prjsKuDfxg+iOboP43hyVrrwzBdHCoHBDHcrwmEabb9sTaxXgWBiJxWYsE3lRY02XcsL3KLOGmEWXoqksv6DaLThPCr/wdMcCe5ymaHNbA2VhNvdr40YqCzrQXxndVPAYSYtLAfT8fwR2EGM1UefK3j++JPOJ1WigSgpHRm70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789939; c=relaxed/simple;
	bh=bdf5ltVaII23b5cF27Fg81xlP8Z8tnf+GfwZrnYaosg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjQMa94dWtsA9rGHstU+R1Q5ayUjare9faWkxsGYyjxv5tsIqfKcPW8o3doRVJfDwhhDd66JfGIU6B91hW8SxdDKQlISKo5iy5lvrJYPVhaJWeOgMESGndfCN/jijE9177N6SbWSnvPsN82NExzzRP08+aV+Q+UVHYP+kqnUJRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJrPfd79; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJrPfd79"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35829219da8so1456828eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791789937; cv=none;
        d=google.com; s=arc-20260327;
        b=i9Gjl3iKU88VDnqgjR1ouuLmSNVf8OzOh7FxY+kyCLBBYCcfcICZmnxKH4bDT8c9hk
         DFiZ4sEBBnTTlj5jl447w7R8wBVuJj5hRRPDPDvOjTkXkHgvZe1hSZx2an6xhFUpKEHt
         vcDQMzFbNnbogmWEaKPQllYk1bKZanhJeARsylY+uVhWXf1OnYyWwfxct4Rze4mGmqf+
         zIctwvQ9jAQ3npH/Vp8c1gKo33uADi2Ms3lX1ECVizsS+0XQQchICc84kosuN1U1kbBP
         wIpGZf7WzPKug9ERa2nxGPHm4onl5p4QEQ0ehLVGuAptOQvQAsMp3imepdt2+7TzgnIB
         FR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zYhdStcwqvgKHiecdfXgk5mDD0YpzyVU/qE0vTW0sUE=;
        fh=GfvLX2uhIHdiyEqjr3MFpCJspnxepLfQFugfHRTKuYk=;
        b=XXWioAgqJjyKOgqjKk2ObstJZkC9Q/Oo27+t4j6mgZ+RFbayr0wsKyaCb10IAXjYqe
         szcMK2qBKacuSO/TKYy6Smzxy74Y5b3dm6J3slDqIE1FgRjAkogLFP25ebXr30g3OmhZ
         Egi762I6LE0miPiS3tQmWRQrASSRwzE3ZmJw7EKqUZA7rBSCxAw49zHZORfJPPE5bSHp
         i1v33QYqOJcc8fYGOp+mzohPQReoW9f7TxjVrI24Yw9vNYCq0yrcvN9/Fvadgh4rJwPR
         s/61i0O+z3vzOv8jHmZ6VYvWNBte9sYmCiD/2jIPppdr+2SNbzFDHu7Ncy+vp5PUPTIL
         0yhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789937; x=1792394737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYhdStcwqvgKHiecdfXgk5mDD0YpzyVU/qE0vTW0sUE=;
        b=HJrPfd79YiVZCU995r/rMn4cN6KQ/WHxEzu94leeDkodSEFd8Hgu4Zc+DL9FIENtv8
         telOCTzKdo9zjyYzjK9XSSaB+RgCkhYgNUwy3jM7RIOn2bJydCEkM0unBChBvTgrsoLj
         5NYpjki9scQXnk4CFHp+QySvcjMlmTGJiBgLqQjocCXx8XYeoo4sBKvV81Qkni0cT9GF
         XBlRtRWJU6tQMEN7AnB6zXItkh3cO7g/e1oJcMiUqZd8u+ln9dx1OG0pEHjqnrXruO1Q
         Qc+FfXHq1iW3DaXriQcFzNLmXLzmSc8kcAChPbDPkYZYJ9GY+VgsruSfC3OjZDSN89lI
         Zjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789937; x=1792394737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYhdStcwqvgKHiecdfXgk5mDD0YpzyVU/qE0vTW0sUE=;
        b=nuAVgdM0liOln2fq9dehxaldJxHMIqy58+cVt8Fdg488kGFGDNEnxy/UI6+z5001Tr
         ytqJjELUOiT8qH9Nbkrbhgvy/zRPqD9mBkd2CMhAdvr4/6ZXQMCTGZUMTdCFTAXGTmk3
         ReLBCJ40d1UOjatiqlUr1amWGokAEoVX4hNg1MduMw2JdbrxoNo348bqSVdJFEBBAl4E
         VWKPPeD8O9autIikCaHr5CjlvcP6bTEJv/z3goQ2pfC9u9IudEI242nuUfLFdUd1nSPE
         aMM4H8sWbN280Pv0FHB9G7aN/pPzANUomf+EIBI/sGogUTNSA4pgTvZTIfCkOkkjGXBl
         pufA==
X-Forwarded-Encrypted: i=1; AKwUvBzQ9nolgC6Vtdq97ixXiV5698MM30EI6NFjIH+H/utFghJbs1q2IMdZGC/4z8KFJD0MFHnFn4VPeosFMUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa9Dw6p23gr7uXXLY6FLNBoLj5t6Tsi7JugjKlnIBFAjuJkb0B
	8EORdryMQl4yFQ10lnKTfDqqLoB5SR9fc0Zm9+Az8nqBerBTWtzkrs/uekA8rVqIU7XXFCKXqr6
	hdaFt5IiRXrGp9HqHlm0BdyWFmkNvXFA=
X-Gm-Gg: AYBFou3nEmnBNelegtyl5X+Vz5pHJxfewohUWTuP74OjyL3vQ4JcHUaQJVwxdCnU3g3
	yW7gdvcmH3FZdBtaVMbt//1zwk7bhEE6kIzROfStl89A5CYNb2lSrPjF1UfuOaecWMHz0+cbcjq
	zzpmYgSsAD0gfITewEiixEAhH6ANp8RChyTb0NRmMCcvKOh3q8wI8V2mwgWnprK9FVDVig7euFZ
	K33ttwKStVGwh/wZwQ+ApNXfYKJqQseyvk/+ZOzEfXURZYYiMeRpQ6+/skaQT+yZDM3XbKULb1m
	4Nc9XT4XdW870/F/y8YYG9Fk8vCPPO7dpYWc8YPrLJkwRXKF5GUpV4tAH45di8gayT/kT/PI8EZ
	jEw/JcMYtg455ABDTIGERfwA=
X-Received: by 2002:a05:693c:87cd:20b0:353:5d7a:cabe with SMTP id
 5a478bee46e88-3536c53930dmr14060639eec.13.1791789937444; Mon, 12 Oct 2026
 00:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007085457.98762-1-clamor95@gmail.com> <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com> <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
 <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com>
In-Reply-To: <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 12 Oct 2026 10:25:25 +0300
X-Gm-Features: AclHuK-1jO_BaUkdoWPA5vu4sBjFNbD6AjUBsHVIwaLC2Wj8tW6qxhiDAHWP-Uc
Message-ID: <CAPVz0n1YKV84J6eG9juM_V5kLCy63WY0hmicUmyEXZp2eEHKyw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:3=
5 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 10/11/26 3:55 PM, Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
16:28 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> >>
> >> Hi Svyatoslav,
> >>
> >> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> >>> Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory F=
lash
> >>> inhibition.
> >>>
> >>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >>> ---
> >>>    Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 +=
+++
> >>>    1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.=
yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> >>> index a65d92522c9cf..596b5e284f44a 100644
> >>> --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> >>> +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> >>> @@ -31,6 +31,10 @@ properties:
> >>>        maxItems: 1
> >>>        description: FL_EN pin
> >>>
> >>> +  flinh-gpios:
> >>> +    maxItems: 1
> >>> +    description: FLINH pin
> >>> +
> >>
> >> You don't seem to make use of it in your patch.
> >>
> >
> > I don't have to use it in my patch. This change completes and improves
> > hardware description of the AAT1290/1270.
>
> Still, If we don't have the use case I'd avoid adding it to not confuse
> people looking for its use in the driver.
>

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Do=
cumentation/devicetree/bindings/writing-bindings.rst?h=3Dnext-20261009#n17

- DO attempt to make bindings complete even if a driver doesn't
support some features. For example, if a device has an interrupt, then
include the 'interrupts' property even if the driver is only polled
mode.

- DON'T refer to Linux or "device driver" in bindings. Bindings should
be based on what the hardware has, not what an OS and driver currently
support.

> --
> Best regards,
> Jacek Anaszewski
