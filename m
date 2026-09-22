Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7181048489C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058368; cv=pass; b=e1pa91Jz7qAd9B1j27XQ/zNVUdRTNmarlwjTpf2Dh01VQosc3pim8i8u3rua8WM8NiOpFynwzqSGkG7XSbCGR1GzSo1fGBzHeeCnVa/keZJqwbxRxeqdkbidZIpitTJJnS0z95kIvL3or7xzvr2ylUM1jozZmUae8AB7iRPJ1FM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058368; c=relaxed/simple;
	bh=NWlgqNLKweH3ATk1geLVbMIqFIA0/0ejdghv0i1bg1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5rtTNZ1lwgMCARJSTs/dTFbdm5J4r1Yz5u3PD2n6a8ghKUj5od5zBQ2bc49h1g55oWxVpLEiZ8HzhkXW7dyVZ77j4Koy91u8mUMLHLIvMATVKucf2ygn7c815my23j5YLW749ULR/WGjL2P+T5BFe9ufCOHdRMTf5HHv/4DO0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOzihiQj; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOzihiQj"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-670fee39d73so3919638d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790058357; cv=none;
        d=google.com; s=arc-20260327;
        b=IOqPnYrAM9UbvloF5nH3CzFepu+GjqtGL42Awg42yz79v3lIQCIBdbKR8VG2UxFZzQ
         wTmPwWYEUHZ//HVoe2JRJwCd0/gQ0JNIpuvSc64etYyDvQVZMbUFPaJ2JfEbQyJRFqSt
         AkdseWXbz6yzTRXMnP2KnNUIQUAwd8mNFAiEj6SaLBW6VO78ZkDLDpiONnSEJJeivXxw
         n0VNrXrJd3rjqVhxQwTV33UquqAz2skaCkfA5fTPcBlc3dDcIrOEHHOYsJ20zTXjV/le
         VJt8BQ+NkaNKJhcQ0kqRLxv+jwioLH7Mj94D/Da814P9afMMHwthnCmL+eZFhhKvYatP
         Bfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E+nJqAVEVSsrZdHd6yhOuTvFgC2p55IdzmRHZTpxGUs=;
        fh=/BInuSiW6NpXykC08T7Al1Msm0QlN1+ReSe2HE6ObrM=;
        b=OcGIR08wJKbyq56ytgk90YpnfmKhttPf/V7jcEd0iXuTWKNTXwTgiKPr/f12wf9k+M
         HUPYPJqA/6SjWMqcrhHlmSF4Fa4///wnhjgavNMc7dl6jIdh3XsJW4STcIn/RMf0wqtO
         agdz22bDpGu0LGo+HV9X3F5ikIXEHlgIIx23pQgG+I1+X+BiwWD/pv5NkbmLaB7Qeiog
         vWB/nlloonS4qyxARUBVT0cRh7T9vHZs8XX/wDtGcwHKTnORCLaJ/dtdabO0KSYWTfxm
         ib1KZG7wtU9Ui0YslUBOkoPh1AAmeGYSBZxv/dZc23inXlEyEFLpl2BeJkD2XKMFs2Y8
         26ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790058357; x=1790663157; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+nJqAVEVSsrZdHd6yhOuTvFgC2p55IdzmRHZTpxGUs=;
        b=DOzihiQjXLcJm6qn4b+5VvGgcptfWoDu7cL3i6R9uTLueh0OVXRSlxOj7KtD4f1J4d
         1MzKAIY2zpavA+hc0nLxtp50gX6zdzyuvDMCuaPUl94rD5HzYAW6320pdNmYGfasP+M9
         tNhDiOTlteUvOAVlVy1CDTXPox6q/z1YYpAMIy2qiKU/URtS4WGHakzITp/ExFxVy3eC
         qCPyu4EDQLJo9m9eh/cejwGZ8vwXOtt+5RrdoITQFrOqVQ5AfA4sngw6y1viLhBcKI4M
         /JVoSPoIGW+AexoRPFu/+BCxayYkRkpKXZH/FvCiRMKmlOTQzvqB2dpSKygjWt3jtGEj
         lI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058357; x=1790663157;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E+nJqAVEVSsrZdHd6yhOuTvFgC2p55IdzmRHZTpxGUs=;
        b=opOt3Zj0leB22/febekY0aQpWJgoQLKWQrJt62DZccduw10n7x7fKS5rT8JcFULckv
         RAtLhi6A2iTwpwBVuB+J4bhP9jb5uqrpJSwD1slYWOTmFnmayrqr3dlbtdtN2llTZ8O6
         iFicJVBCsnJY4rHEbJN3LwsRH3iIK9Jphey8JohGTa9/AprQDM4eYYIVMnYcRZKSsXWV
         9nn/DZOsOpcW9W5RsVW0q8Q6QeSnybKGQJEqXCVp2AwiyfvBJmshCHB5sLpWqYTluEch
         254FALtW7j40qYnwpv5e7eIQ2oji8ERCcDK3gfWgi0R43UtCmcGzkxYlIg/vvUqE0K1Y
         YKEQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+zdw5q9NSV1o9CiP0flB/OKz5Nqy9UJ+flBNNK2IY4VRKcVVC55S3pjmYLRsgCyXvcCVIxJXHWqWT94Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mfKptN+Y6vm+HCwkttbU6ofZ/MhPWLx7SqCvV4xih5FbsB/6Ns
	c8vhyGcun7xryccn1C0QGD7iBzVmFRKEno2vuwsT8pOUOtkaCYiX7mWdX8i4wwq+2j+/IaBWgS3
	zYd5uyyc8OxiMWlZczb1ZEYgqNsPCqgU=
X-Gm-Gg: AYBFou0cSDEehJlCPMCYm02x/MtAmJAoeQcgG86iCmQDHaph6ti0HzvqbsM+4V1trmv
	Axp2wbBU/bZLRov3n96yXFhNt14iqT00AB4QEIfi46k5oZ0wCQHPks3ZT0KS8a5BlSXcgbC8YDX
	v9fnWbM6+6KIRvJFpE/TLKaYU3QEy3yTY98Eau2Q2NYxX4gbAHb+l1FaY/k3yDZI6pBGy3kuSyz
	WTxau8WY/7Ij+I0mva9mJlMQKV8cUXKDyODWP3D9X4XoAXL45ZKiOIM2vENPAWPPv27ZtBrv42B
	LB2E/YVQTS3OtHMeUJE4rweZFpSOMl6oHUk5oojoL7nwj26R97kvXrJo8lvHVSxOjs7HZQ==
X-Received: by 2002:a05:690e:43c5:b0:671:471b:b94e with SMTP id
 956f58d0204a3-6717fccee36mr3255064d50.39.1790058357330; Mon, 21 Sep 2026
 23:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921082609.244774-1-lgs201920130244@gmail.com>
 <arFKFmkpldopUIMI@quoll> <89bd2593-e0ef-4b9b-8c9b-833aff327a3e@kernel.org>
 <CANUHTR91qqHtCbaFHSqcMa8eZuD7EnTqyFSfDMwX=LsiMiHoEA@mail.gmail.com> <20260922030548.GDarHwjL6ocubz8Lzp@fat_crate.local>
In-Reply-To: <20260922030548.GDarHwjL6ocubz8Lzp@fat_crate.local>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 14:25:43 +0800
X-Gm-Features: AcwNN1ViMdpAb4FKUbrVTSa-026gbS39xDlV0FFXJxS0Xg4qeiM5sdxARfwH7qw
Message-ID: <CANUHTR8qLrArRSgBrtzbeqnqiOsXNUXsXQ4Lxsta8HOUoxGsqA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86/amd/hfi: fix platform device leak on init failure
To: Borislav Petkov <bp@alien8.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Perry Yuan <perry.yuan@amd.com>, linux-kernel@vger.kernel.org, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, platform-driver-x86@vger.kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	stable@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Borislav,

On Tue, 22 Sept 2026 at 11:06, Borislav Petkov <bp@alien8.de> wrote:
>
> On Tue, Sep 22, 2026 at 10:11:36AM +0800, Guangshuo Li wrote:
> > We apologize for the pressure this caused to the community. We will be
> > more careful about organizing patches by subsystem, preparing proper
> > patchsets, and following the kernel contribution guidelines before
> > sending future work.
>
> If you're wondering how to really help the community, try to review and test
> some patches you see on the ML. Whatever you choose - there's no shortage of
> patches. You can even let your AI run on them and see what it catches.
>
> This would be a lot more helpful than only dumping patches on people and
> waiting for review.
>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

Thanks for the suggestion.

Best regards,
Guangshuo
