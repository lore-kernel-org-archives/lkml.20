Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FC343F8B1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828116; cv=pass; b=tchWqr/+C0NbtS0/9U5jvbNJWhAb4EhUkD89y2F0aGPJ7dplCToD3PfnWKi1CFk4svzt6GoRvEAl6PX3uTwgJtAyMBjBv0oleK5hmsK4Yqn+qC8dflTA2BehTwTScQOESv3OBISnnSUa4jb0/aWQfBAdxPZHktwjREMglPHUIoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828116; c=relaxed/simple;
	bh=0fqy3af9PktavrL7zLUBrF1S/FaRBZ/LQmpCXI158wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tponENQ0CALLim0G9u2hnvdMlIqMNBx6gV7BoW3jMMI9awbphXRYIgXTzRBmGD4kcfwL4vWQrHVc8c/UZZ/YIrGPH2kt8F1yZXazAnkdw66GtcNGQHsF3RIwJ2hdtQuhuuzq0KkAdFKQKyyp5uz5nrGT8ms+Ff1ApJxI+5Q+6WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOA3SN3c; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOA3SN3c"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38511175ad3so646156a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787828114; cv=none;
        d=google.com; s=arc-20260327;
        b=iFekJMITcm9JHjpXWS/AYjOKF4sfyyxuublIWT9CFMfXvyLsL3+EZlF+auqbMk4zNr
         uPnI4068ViK5FCgzO52hc9xKow6BVcJfxYgiDxDzNJUunNqwlcqkZjAeKp6jXdZmuRWM
         gXHbvR9R43zORXbFnJ9/niQT2z4ZdiXoMkrLMno8y1GHn8+OVjqKFNCQDOpX5PlPkpPd
         9tA+cw23UOsTiDBzdhZKr3vsmUbVZtzBSvYPDT4FivNzBXlBGsjMGB9u1JyzTiZ71CKZ
         MoTPXxJYP/bwBzNBA5QtazOqZwI8J7D9EhXXGYAGxh+x4jRqfyNl6+Tqipt1V9/iusYf
         c2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qI/lN7pL0l4yy2+hZsgq6Y+He1+tVhEiomdMwADOmaY=;
        fh=tzMw13h/RvXl9+wvpq7yVGWw3t0ePfL5ykvKZAdL02E=;
        b=Rnwpj2lqpqUGCFTo91t47jLk8K2TlojWhGLflAfEyuZfOMYK7uIiCyhy3Tb6NMGo3e
         be06n/RuSM2L2eUyXIXdS1rKYaQ5vkoekJG0eX80zpl9ZzzoN8scp/I3zNhafisE7ns6
         im0+aDFWxo1VfA+RqD7e4fQBLNhfi4zID/AvUs5SAx8vV/LOaJPqk8wTzoTxJBbJOKhc
         1YcOK40tgiqUcbDg/0kKR53rmwy7d4TsSy6BIzZRsNPEGzQb6vCNsaoMLGsZURn0zPei
         LTfdwDWa+MeWTAKWcQhM+plxeMTbsLQISV7sYZNIS28B9P6nZrcpFpM/ZY8TgIhPJ7xx
         IxgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787828114; x=1788432914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qI/lN7pL0l4yy2+hZsgq6Y+He1+tVhEiomdMwADOmaY=;
        b=cOA3SN3cj2UkcbMx83ukuTqB5nSkRZvzNvA/TqgMMgy3xJjrNu36stet3eXUFVznN+
         16y9KoisE8u74D7o/Npw377gDqbixQSqDr1/VRrL21ZOCRC2duaVyfuqXnkzI9dTKXM4
         gufnIpUGGn/WWWhY3mIUuaiBju2LM+G1HE0P2FSs5IpI63u22RyP3qyR6Ugnu1LhYopB
         guVW5/XZnzIPTUQj5YQA3PcoQP4sP7PVC91hRzaYvt8rUksYPFZHCy2zLfStWKpYobx1
         H70zxTlWHFZ33xoS4uFJceXuGgT6rMX+WonRHmNhi9hTb06+mW9bLPclnK0oNY9RJ0Hu
         SPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828114; x=1788432914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qI/lN7pL0l4yy2+hZsgq6Y+He1+tVhEiomdMwADOmaY=;
        b=ZJ/LUrUCyrrNXSeQzWtiND4HHxKMPETtx3nSSCVDR7sE7bkpN624sKBtPsu65j8ew9
         ijNpgIdzioJRvV8tXSqpcVorGTQcJ4TNi4SmwTEzm8EFKqzJ+yW+Aw0CIcicc7SeLNmF
         8/03ZgIWcuupu0RqC+Ixanko4xI2IJ/YsT1dkAYYnrgS6+O2yiai+yyS8iSsWub1Txmu
         f3B0lC0Uy0Jv7N88ukAmAQjKoG1Ok7iEXBAPq59JjlGDYbqxIgSvQ3AVMgi1meIt6Veg
         Vd+xmpW9jscM2OTBcWSrgYj9Cs4pL/lIFYMSMNXXPWnnpXspPzt8pSp2BqyTMimwIrZL
         ZfrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTHwby8ukXeWbIukecoQF+6YpMF0I5g893VnbZ5+3ES70V7/c43doqJAuETFack9J0zOIUBhOF6Pwt4Dw=@vger.kernel.org
X-Gm-Message-State: AFuF++ntqSDptLTnjaVoAFl1A/hupkkqrDdiONO8t61wFDXPr+/46MQ9
	2ug4hqlaN5526E1SkVNGlzXND4pytTmbi7eNN34eUinYHs5yyN8swd9Oko1qA9AbO+1Z8esnIud
	donm8f/i8CTfAbQJyh31dTN678MPAzUOSK2Fh
X-Gm-Gg: AR+sD13lVEca3tXGjFjLDk0iAJ5C4cZ+DPhfjYCbRwI0siSQNqpW4IQKvrG+ldT7P+X
	c+nvXKig/z55N1GD3L7eyqtYkpUdCBEmcRl2FoOZXMlHW4+AFUoA7ixf3W5VOlTuvbwLZlApCp6
	tofqMKY2niwi2WYlj1l5NenNWyUnnvys7jvQhThzHPIkb70T2SNVbsLyrynPayNyS2dAxJ4bYCT
	jg/ZdO2ZwCa6Oba6Cx0Noore0MjaoyZ47AWCBtWYRTzhRqjmsc44hRDUt8aOJHHvpS2ADcumV2L
	sHCFgIj4P+e+fB0hBAdStKCei+50sQqEdIhuwd+965tTAw==
X-Received: by 2002:a17:90b:530c:b0:396:635a:9b10 with SMTP id
 98e67ed59e1d1-3966d3dc393mr26464099a91.11.1787828114126; Thu, 27 Aug 2026
 03:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
In-Reply-To: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Thu, 27 Aug 2026 13:55:02 +0300
X-Gm-Features: AcwNN1VdHEYwWlgzfD875mKEoO2bj-Q3vThq76c264VRfXQwV0io4s2nJvz1k1I
Message-ID: <CAKWEGV667AyGDpz-mJn3phTOjKZeVTC+of0Zx_OUZr4H3+_jxA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maurizio,

I am glad to see my (a bit abandoned) work to have YB1-X9* support in
mainline be continued but please don't drop
my ownership for patches when using them. Use Co-developed-by: to
mention me as co-developer
and keep my Signed-off-by: tags.

For reference, my WiP v4 tree is here:
https://github.com/jekhor/yogabook-linux-kernel/commits/b4/asoc-yogabook-v4=
/

=D1=87=D1=82, 27 =D0=B0=D0=B2=D0=B3. 2026=E2=80=AF=D0=B3. =D0=B2 10:25, Mau=
rizio Casciano <mauriziocasciano7@gmail.com>:
>
> The Lenovo Yoga Book YB1-X91F/L uses a Cherry Trail SSP2 link with an
> RT5677 codec and a TS3A227E headset detector. Its amplifiers and
> headphone path also require board-specific GPIO sequencing.
>
> Add a generic Cherry Trail RT5677 machine driver and match the Yoga Book
> ACPI codec ID. The machine entry supports both the legacy SST firmware
> and the separately maintained SOF IPC3 topology.
>
> This continues Yauhen Kharuzhy's v3 work and supersedes my RFC series.
> The driver retains Yauhen's copyright and links to both his original
> implementation and the v3 posting.
>
> Changes since v3 and the RFC:
>
> - rename the driver, file and Kconfig symbol from Yoga Book-specific
>   names to generic Cherry Trail RT5677 names;
> - clone the card, DAI links and link components per device instead of
>   mutating global templates;
> - allocate the headset jack separately with the device lifetime;
> - unwind MCLK enablement on PLL or sysclk setup failures;
> - document the codec ASRC clock selections;
> - add the complete SST and SOF machine entry once, reducing the series
>   from three ASoC patches to two; and
> - carry forward Yauhen's copyright and provenance links.
>
> The series is based on ASoC for-next at 8a070652d919. Both touched C
> files passed sparse 0.6.5-rc1. Strict checkpatch reports no errors; its
> only warning is the generic new-file MAINTAINERS prompt, while the
> existing sound/soc/intel/ entry already covers the new driver. A clean
> 20-job bindeb-pkg build completed successfully.
>
> Runtime testing used an integration kernel containing these exact v4
> sources on a Lenovo Yoga Book YB1-X91L. It used the stock signed
> intel/sof/sof-cht.ri firmware, version 2.2.0-57864, and the separately
> maintained sof-cht-rt5677.tplg topology. The following passed:
>
> - UCM Speaker1 and Mic1 route enablement;
> - PCM0 playback and capture at 48 kHz stereo in S16_LE, S24_LE and
>   S32_LE formats;
> - PCM1 deep-buffer playback at 48 kHz stereo in S32_LE format;
> - a bounded routed speaker tone and a non-empty three-second Mic1
>   capture; and
> - PipeWire playback and capture with advancing PCM pointers and clean
>   PCM closure after each stream.
>
> The GNOME Settings speaker and microphone tests also passed physical
> verification. No SOF, IPC, XRUN or ASoC errors were logged during those
> tests. The SOF topology source is maintained separately at:
>
> https://github.com/Yoga-Book/Yoga-Book-Sound-Open-Firmware/commits/featur=
e/cht-rt5677-topology2-ipc3/
>
> Maurizio Casciano (2):
>   ASoC: Intel: Add Cherry Trail RT5677 machine driver
>   ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
>
>  sound/soc/intel/boards/Kconfig                |  14 +
>  sound/soc/intel/boards/Makefile               |   2 +
>  sound/soc/intel/boards/cht_rt5677.c           | 611 ++++++++++++++++++
>  .../intel/common/soc-acpi-intel-cht-match.c   |   8 +
>  4 files changed, 635 insertions(+)
>  create mode 100644 sound/soc/intel/boards/cht_rt5677.c
>
>
> base-commit: 8a070652d9194babdd35bf7cbd2c6722b441e8f4
> --
> 2.53.0



--=20
Yauhen Kharuzhy
