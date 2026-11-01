Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571135;
	b=Cpd5L3pc5gD1161ZzCOHOLnDcXkjpkIFXVTMBEXuuI88eVnJFKIBZ16kt8f8j3eT5Gn9
	 RI7jnNAZLypqpV4jj7uOAPpiMyImZF/CyZg6mDLG6EHogj+ndiPrq4rF4CzNpShp6ZERT
	 h942uH3ySEWM2YdVKfeNfsOXWxFduJCsaj7XI8aKHiJ0EAvbZUMype9ft2PLraRAD5tSN
	 oK+siw0PkWUMzFunaXV5ZkfiLxjGrBixW97qh3sBaXOzf99S/mOPyLG3v9+XKYhLabfFX
	 637PCeLW5dpFETrIwlUSRpk+Di9fVedLCPtmUbhjYVAM5jGHxrB0mewZmvxk7OeIOmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5Me/9QJm4Q38T465J3XjzPEtQTmtBofSNTe5eAQE4wQ=;
	b=Hpc2zMsRMA5OxFEOGep94YNWN0H2yWUs9G49cQ4FHcUAiX649C0AGa4bcpWgJ8CqW89X
	 Y1stsjBGBZ2LkeEV1RgSrjAjlsulu0DJdGcvY/plZOJ5aPLgUrva27/Vt6Q4uP7rj4EMt
	 tL1AucYqONrRfYMaKHGnQPmyzWc+G8nPBZU65B5dQLQGBAtNwyMqHItDbZwmUoVALyfhS
	 NugvQIk+Ue6uaILt2qUkPyRYwt6uGKuLRlKqTNAKZ5op13W/w+hZo+ZY5FvEvk4a+4iJp
	 oU0bnFwpzXawI6XHudv7CvMeaiesHq3h0Sz4BlHGZy1tZTgjpLKvgs5Tk5BkGCc8X7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iIwzR4es;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357E6606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 357E6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iIwzR4es
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a75f960be3so22133821fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793571133; x=1794175933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Me/9QJm4Q38T465J3XjzPEtQTmtBofSNTe5eAQE4wQ=;
        b=iIwzR4esjbGPsi11cntQtTj5Uz9VKLU2MFEAWleX1YLFT/TihdkwcjouHk97FPK3U9
         AOggF/CWuhdCGsklyfyAvfE+Bsi+f+E8zW/L+5EmmaZs3mpdOTNViWis6rEQdaWJYNE7
         mnkuccILEMkAns7PDA+9U5/xN5/xOJMIz9cO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571133; x=1794175933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Me/9QJm4Q38T465J3XjzPEtQTmtBofSNTe5eAQE4wQ=;
        b=Z+deff7Ey3gaOh5SEia7eIWKrnux+cyN1Mag+0Pj0sMLMFwOydfSgEWe3l3gRwhsa4
         kU20Z5pTUc7fxxaTqnNO+XCrPWdDXZRCMqGwpwayWZS1EGEatbxfdTnChbRg4MPKnOcd
         7Qmg1RIoOPHL9V560sT8/eNQX+hie9zF9dZmGIBjZhDqHnD+nY3IusCA7svqGwzuRPfj
         jFp9XpL8RdYJv3NdFOTtyGzBjrU8a+iL+ir+Ot1EmUK+pXyWpe6OpDwVYGO7pmarRuID
         LV34n6HMyV98tCz6UHeCXFJI4AH4QH/GMv6gOzvQc3ribS5gxtP4aTvP1DNA2MesHls7
         6lgw==
X-Forwarded-Encrypted: i=1; AKwUvByCgmH2ugnw7dG7FR+oqvJ/JvacRb35JnpkF12XPHBr+fuggOdeQ5Xnq0wobFa/0jnhnn5N+W4p9jFlESk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PUOOIePpQUogeSkS9yuVAqNi+Dpiw8G80ya98Bf2IKFVoRSCa
	gK/PRIPtl7E2+1UnYiOQ4S+/31edG6r6OppNMmnTr24hHCIChVV9JhC+CLrImnsJy+xmZLyqe+g
	ZJJM9DZ0J
X-Gm-Gg: AYBFou1Hnlaeafdxcvzdmk0K3u/KlknJBduuRF/x25gKBs+CUYpew+9r4OFQxtBRi9J
	omE10TLKI7kRjwlDLxxWIaKarp7QgQ93nHFiGGOEfFsnPACnjuqhpTlqVaQgAYWH4NJbi7+bX2u
	D+gYkRLlJfAMzKidaZRn+Rd1qISNIlfYHKBBFJJ5z3swvVDGu1AdxjO4OuDvXa7eObbERiyn45A
	V14HNwwWxin67PxczGli2YqBTGI5QQQ60ihsoS9GdX+rMTKMLH9b/imeMLWliMQNu3KrnOzryTF
	NNpsTfLS96gCBCohjL/J+iUIoIODCRvhjKF2+5F6auW/2BXS/wUQCtQFHxZRjyf5tYO4LlziQH8
	ItcmTyBy+URSP3H3VUaalF0goKVN+sSzYH/I+cPVQU2xVxvSwnKPunnjtvti/rVvT/RFiimnZ5I
	GrfCUaF4rSe8RNi4ImGqay7kGANbEer5hThPNLCBtVFnQsCAaM9Cj+RNK/ylD76lHaHioK2TSwK
	GDv0yKuINVx/a+YwjvO7S0+nQ3P0ChsjEDfcHrCLLfgycbT/7RAGVcIa06mKSirT7suBDC9Me79
	TXlOhvQs4T1IgcbtNcjBtORrLJpZ/pvWWXeH+Lrd1zVXl2wEwj4zZAsUfA8MZ4vczm2GKJg=
X-Received: by 2002:a05:6512:131e:b0:5bf:cabe:23b6 with SMTP id 2adb3069b0e04-5bfd9569866mr2650721e87.33.1793571133418;
        Sun, 01 Nov 2026 14:12:13 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074673asm1331528e87.68.2026.11.01.14.12.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:12:13 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a75f960be3so22133741fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:12:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByXuvT5wIzMe8KUfU64ZeO2ZvBHhYhJKdr+PBRvD5BEdCVhqMoVIcK5JjRey6tFcecAR304cgK2LgADX68=@vger.kernel.org
X-Received: by 2002:a05:6000:46da:b0:48e:73dd:855a with SMTP id
 ffacd0b85a97d-48e73dd874bmr11427269f8f.51.1793570749483; Sun, 01 Nov 2026
 14:05:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-11-dianders@chromium.org> <CAFLszTgXZ8fcHuMbMAorsDaebj43gU47bS48pO8dKtnL0JF+Fw@mail.gmail.com>
In-Reply-To: <CAFLszTgXZ8fcHuMbMAorsDaebj43gU47bS48pO8dKtnL0JF+Fw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:05:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XG-YHW2__uxUdJr4vC3e_mW=P==F0JUvkeepXqmKMSNQ@mail.gmail.com>
X-Gm-Features: AclHuK_naoI8TgiOEvg2nlmaOCNYlC5UGiEf6u-6ngKNFsppEgRdoP0YA4HjfTs
Message-ID: <CAD=FV=XG-YHW2__uxUdJr4vC3e_mW=P==F0JUvkeepXqmKMSNQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] fdtfactor: Add compiled FIT image factoring support
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:23=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> On Wed, 28 Oct 2026 at 15:56, Douglas Anderson <dianders@chromium.org> wr=
ote:
> >
> > Add `-F`/`--fit`, `--outfile`, and `--single-base-dtb` to `fdtfactor` s=
o
> > it can directly factor `/images/fdt-*` blobs inside a compiled U-Boot /
> > ChromeOS Flattened Image Tree (FIT) image.
> ...
> > Assisted-by: Gemini:gemini-3-pro [edid_decode] [gerrit_and_build_artifa=
cts] [gsheets_gdocs_cli]
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Moved FIT image factoring into its own patch.
> > - Replaced external `fdtget`/`fdtput` subprocess calls with `NodeTree`.
> > - Added FIT `hash*` recalculation (`crc32`, `sha1`, `sha256`, etc.) and
> >   rejected signed FIT images (`signature*` subnodes) and external-data
> >   FIT images (`data-offset` / `data-position`).
> > - Preserved per-group compression (`lz4`, `lzma`, `xz`, `gzip`) on
> >   factored FIT `fdt-base-*` and `fdt-*` nodes.
> >
> >  README.md                 |  19 +++
> >  fdtfactor                 | 408 +++++++++++++++++++++++++++++++++++++-
> >  tests/fdtfactor_lz4.its   |  83 ++++++++
> >  tests/fdtfactor_other1.dts|  21 ++
> >  tests/fdtfactor_other2.dts|  21 ++
> >  tests/fdtfactor_test.its  |  83 ++++++++
> >  tests/run_tests.sh        | 156 +++++++++++++++
> >  7 files changed, 789 insertions(+), 2 deletions(-)
> >  create mode 100644 tests/fdtfactor_lz4.its
> >  create mode 100644 tests/fdtfactor_other1.dts
> >  create mode 100644 tests/fdtfactor_other2.dts
> >  create mode 100644 tests/fdtfactor_test.its
>
> Reviewed-by: Simon Glass <sjg@chromium.org>
>
> BTW, 'FIT image' actually means an image in a FIT, so I think you
> should try to call the whole thing a 'FIT' instead.

Done. Updated the commit message, `README.md`, `fdtfactor`, and tests to
refer to the container as a "FIT" rather than a "FIT image".


-Doug
