Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794707273;
	b=E+g91fHQ4Dl758zDbGjG7J+M8HGOW/MV9/T8hfipetXnIW4qiZfg1BKyMYonhEjPbMLf
	 8BCDYyCRzTZjqcOibPztUTS7XTaD16hfRcLIra6ZK2JECD3iqfhNTLFNxuTQAZyYRxZ9+
	 KP4BP1gNCPWwrU15Cbh1cx72x/uvveR8NAp1WPTIMaZljxsrkK49QmiC2HxYc1tVRwgQu
	 AshNoOsNWwXK7YqbDTWhhHbKRvJkX7i/KVx/iJfpLfSWOq1I8sj8OFmnOQnDf0ekOlIPv
	 lbSvSomEUfYgxqbYDGyfpIYhiIp8dL/Aini1/RR9JVuN0cgZO4pO4Du+zzU0E9DFH2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794707273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OE0V4hDYj6rciPValeql+PDftw1T5fn9De/8GtPo6aI=;
	b=4/dNPHyt3TsAdUoRmaEfTZRel4AtQzumLRNaj4dbMO94MucrwQlpp9O4JPSx0W4Mnj8+
	 0soDadkYJPni3ht4YsZuTR4fToHd8Uj6+E2235poILzzzmC00i/OYCdnBCXKxGNrN2I6e
	 FVQVwz0vMPh1Ouf3ZdKKqGSrUC7cRe4KivAUMiIJODEcxFWG8ssmr2GOg9NxHvN63dGUX
	 Gz1xrXbKWwnLCRQypp6viHAnqWkFAzqW/3J3BCujZmJds5uu2U4GYZgGm42mmEHtKUwso
	 YwYf6vka2HUvQgToljW8AvMwPFs+DXNnU87bjjV7ViRINTHaJBpcwQjREBNQKzF+/Xg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z2gVAHL2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7D7606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB7D7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z2gVAHL2
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d427836e9so316188566b.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:47:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794707271; cv=none;
        d=google.com; s=arc-20260327;
        b=Ver2ro340OpFCvKo0c19RoLD1uBt8tzdOsD0qqbXOwR2ttxjY3IccOPShig6IALdiz
         cDXS17aYvBjvA4RgTEupoHvmgC0Tp722ZwpZf5nGbso/FNb1n+TjPFmpWCFCbeWcfi6c
         b6Fs1o5iaOG6UrQvEluipSuFJOuHCkU6llhSe7EzYnPjOl+OPYYw+KndKRBFEw37NYFl
         WYBa4nU3cwJypM66N9XfzXkJPkluIFayy6a9pi2YycG+fm0cVeU8DUVDyTZu6iZRQe/p
         dVVo2XbYVWB5M1DjoPOdvUeRDQHhwyGvLKUHe/yPr9azew4slFJ0Rl+6a/oOhpkdINXN
         9qrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OE0V4hDYj6rciPValeql+PDftw1T5fn9De/8GtPo6aI=;
        fh=/l0LBIJkAteEc8WrXcWgt4KXQNALYcpETJJm945YZMA=;
        b=Ib1IuoA7DQNzwdn5fu9C+B0yIcIS+PVZCfYcDFdOh9iUZGHlnbTDSLcuycifvUnKGn
         0tzBQV1RpmMEc8mdO7a2aqZoJJY8pO0YTrMlLNB6JRxH1uvxnhEbfZtM286KbBsLsGHz
         ljrZqj4Y1GHTlyTcvE+ZExM1UWbTs4FIq0pS0qW3wRv4v0ACmFC56V+XdcqDSMMxNvRQ
         Nig65CCWJXMFn+3qw62zL//jee2nDHPWalJfEVGor57hAYX0FH9b1gAy1URNHtpu1ZwW
         NQZFUYiJPY40p8sUPODbhzT1EwTnnb/eBrp9NZMbeyk6XOveXf1Sozn/VAv8VizorjJe
         7dtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794707271; x=1795312071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OE0V4hDYj6rciPValeql+PDftw1T5fn9De/8GtPo6aI=;
        b=z2gVAHL2z+x8knWv91TPYYOz6MOsnsUKca8jKwGhSeucc+ZXvt1GALAUWo1aWaFcI5
         ng3uFS3yt//zqgciRT/DBMTOx1x5hPkA5DkQSK6bPTzS7Q+nwvtz+BqWv7Ef+1B8vEBJ
         oTxO+lsUQED7F8x1UKB3uU+wrZf7DWSN76v23rINlQwzuLU8WwhM+PejbCtbeMzh4rk+
         Ajs3d/7o+QxOnfL5aOtmX6IVez1+1FcNy4cT0z2L/kKY/5kg16k/jFs6D71/mKgpnkME
         vGPj9Op5uNNQcDMHWSkbIl+fyPd/DSBFTYZHoShZY3+Br9aVFpoVTEtTkdTrKokbYFkW
         wI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794707271; x=1795312071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OE0V4hDYj6rciPValeql+PDftw1T5fn9De/8GtPo6aI=;
        b=ZE/iD09AXys62panOCkH/RXqt2H8suPcj0uL3LuGOzk15OrWSkBO5LQHNMIfOHTUDG
         Pc85/+A1xwdV73YgScb40CQweKiZHKHvahpehXvk4/YMjVlkCiuuR70JwQueJ97vR4tN
         1tw9Dbf4jo8+Q+W/nnsB9oF2mKcrAxz9shq1290aiJJXXS5Dyw4QlI0ZSdoT6TMHgGxw
         2kBy6mMcALEjIj5de5VlXV7fpzMhL8ECTuIZD0Ru4vSBTp82zAyojK40xd679bLAC3ue
         tbGPbLMeyXC9EYSNvi3jl+W6xZgpR2I39k5u83a5yBTU1opyAJ8LGfLyyPgGYsoirxx+
         jJgg==
X-Forwarded-Encrypted: i=1; AL+hErHrVhQtvkU0MmszY1rngvMXB09HETjZmvLuAzkCdOfWFFYDflzOlQHKzVGGmAgeJ2aRPxdBdb/u+MtBGzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZFTnkSsCyZzw1yokmEj3UAknB5KHUseR5uSGmMeU4ztIShkzW
	4FmgdYER4P8G6Vwq+l38Gke1KpPKQgSACPWHxkiXGKZDjjsJG+dMW4gdCpA6RYZ9baJvzu7HzXV
	r40JNgThRnBo59GjPR9jvAQryLvzAfC8=
X-Gm-Gg: AYBFou0PS0obv08BPf0iTISzSAEWjWXlHETaFZOLKI0oroEaiNVzyOtJYkEHV47Mqje
	7/ZUi47AQL3W9+iaM7s9DA47I6hx1LP/s29PFoeODZU4g4IrZdiPPDGLA4J+9ng4hdYm0D87TST
	g2N8RYbSllnHeZpR4mVsiFrK1K3mFfpRrQYS3DdRx+7lSbzjS0K5p+WF8NMfWTWg+FC0cMN5tlp
	gCNddyBTR++7DOZhOaLGdfVIsCt0gvdNzsUlTbwXWvtQm8JVQibcdNkV0Fw0WST1NlgPC0957s4
	4s99ffZvWbCWgY6tRLcZW+sqLUTMcTbq9HB9v6bdzFbJPdhv2+hmW3iPENsteR65H10e77TlP5G
	ir9P3Upf6x/nud7xsH93wRGxmBiUsccqdKwKBuvoihtvW6s1kuGlv1aCFCBhiH44l/erWug+RN2
	FFcs26GUOnl+g=
X-Received: by 2002:a17:907:9443:b0:c46:75e7:25af with SMTP id
 a640c23a62f3a-c50963446c5mr535005266b.11.1794707271041; Sat, 14 Nov 2026
 17:47:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAPZV9qUk3-eKOGEjVc7f0QzZcjb3L5QwUceAEUV0nuCdo90eGw@mail.gmail.com>
 <20261114235828.GF3706007@nvidia.com> <CAPZV9qUvgKjoBXGjYXJzwnCmqzSfu781ZSG8zW6Fn4PokUN2uQ@mail.gmail.com>
In-Reply-To: <CAPZV9qUvgKjoBXGjYXJzwnCmqzSfu781ZSG8zW6Fn4PokUN2uQ@mail.gmail.com>
From: Gustavo Andrade <gustavogyn@gmail.com>
Date: Sat, 14 Nov 2026 22:47:34 -0300
X-Gm-Features: AclHuK-T0Xx18CWBs0ljRBJr9OWFzUd844AH_e8W_0A95quNMuvEFSNR0XQKFu0
Message-ID: <CAPZV9qUMZcwVF=CUK4LY4G6Qoqd5ykCXE5ocX8VCy_f1c6+aBw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] vfio/pci: Wait for GB202 firmware after reset
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, kvm@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jason,

Thanks for the feedback. I submitted this as an RFC because, while the
workaround solved the issue for me, it seemed unusual that only my
card required it, since I haven't seen recent reports of this issue.

How would you suggest I proceed? I am currently running the latest
VBIOS available for my card (Palit RTX 5090 GameRock, version
98.02.2E.80.10), which is also the most recent version listed in the
TechPowerUp database.

Best regards,
Gustavo Andrade


On Sat, Nov 14, 2026 at 10:44=E2=80=AFPM Gustavo Andrade <gustavogyn@gmail.=
com> wrote:
>
> Hi Jason,
>
> Thanks for the feedback. I submitted this as an RFC because, while the wo=
rkaround solved the issue for me, it seemed unusual that only my card requi=
red it, since I haven't seen recent reports of this issue.
>
> How would you suggest I proceed? I am currently running the latest VBIOS =
available for my card (Palit RTX 5090 GameRock, version 98.02.2E.80.10), wh=
ich is also the most recent version listed in the TechPowerUp database.
>
> Best regards,
> Gustavo Andrade
>
>
> On Sat, Nov 14, 2026 at 8:58=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> =
wrote:
>>
>> On Sat, Nov 14, 2026 at 02:48:53AM +0000, Gustavo A. wrote:
>>
>> > PCI reset returns successfully while the Firmware Security Processor (=
FSP)
>> > is still initializing. Restricting BAR1 to 4 KiB mappings masks the pr=
oblem.
>> > Waiting for FSP completion after reset restores normal output with sto=
ck
>> > KVM and verified 1 GiB BAR1 mappings.
>>
>> That doesn't really make any sense, you are probably hitting a race
>> condition somewhere since 1G/4k changes the timing. And possibly
>> because your new kernel versions boot VFIO faster than older ones.
>>
>> IIRC there was some VBIOS bug in old versions that caused issues with
>> vfio.
>>
>> VFIO should definately not be doing things like this.
>>
>> Jason
