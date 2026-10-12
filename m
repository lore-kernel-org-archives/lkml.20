Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100293B42F4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841282; cv=pass; b=bazDegP8p2+v5MK1ZHOh/vmSXH80EzOFvf9e3L3WUX8Xmdo5rCkbA90YXCJtsNABGhSfqS5SvUAEjNOsG8gAzaNYuZohc8tN/9iw1ZVB9FIU1Hu1hjSelGnBA937SUMfNBVy7X+n22LxuflsO8Wnwz/obmnITFEzUYrPljffr1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841282; c=relaxed/simple;
	bh=MvL2NksiIGW4AGmjA3H0Npu7mPSzD9lxMrBE1kC8jt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDmMxD2bNH1YaIQcXQZRLUPI4ftwrLUY01iLgewl9tM4DXYXThGfTaz3CuEHH/PzIkqHfdxRmodqQbn+s3cNVMjTB9M1e2l6DJMcWf3oJNCSHS8RncV0ZXb5y5HKPrBkqAnqcys0vlhOlwFIwiCebre3UYw0ZikkfOwjc2CjL+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7kcIlYP; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7kcIlYP"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c263415982eso270790966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841279; cv=none;
        d=google.com; s=arc-20260327;
        b=FuhOlyJdraLprjSk4NrQHZEJufBHek00ec9dp8UdSI5QO62jmuo1CfkNMyQyeSbqZM
         HuqdPPFOvfai8AplQMJbt5OrQLksgzm2L5AtMAFQpd2i5LSTgJlLBQf23IVHbItJ18DH
         V8Db1q5VNmE5sEP0vy8c74xXBo7wOLggo95ljC9UbFTQHCD0yaBL5FPJteupgfZEx9pv
         ZrQPGJLA9UVNdOaJ5YpOmTxX9aGWKR2JXfSp48WHdLpltPSaXYSwF717USyRFMlj8626
         iczhpL4m7eMOWa1JCzfo4A5YUT1CWcO5tCFjOaaEWyeiLA+tHBGWg+HkjbpfRdYhuadY
         kyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MvL2NksiIGW4AGmjA3H0Npu7mPSzD9lxMrBE1kC8jt0=;
        fh=rnoQ072XVJOgNa9h0Dwjd5XFZEjJ4aJaj6peWbARc+E=;
        b=h2g5oJEewxRiHi7bY+JFDiY8FfRESghmUceh7J19qkNC8AIMxXlhEvw+rv8fFOLmeG
         JIX8SrZrqnO/83aU9/+uI7rLBjWSWSnzBjIuDJokpsa6+jR9JaV9XiMBJhAzcgKatxDA
         6IIeGtrbjjxEDzsAc80Zu0gXPZfZPGJ3A/JfBwi8F3gUUWEYoF8UZ2K9gAeCXYX6mZe4
         BaGqt+0phnUnTq+Lq4jovONetIk7Xkg9TKhEWEtJg6Y1rzLSEW3Q/TjhzAf/8UWRcrN4
         pO1omqWee+m4BwrtpTx6eO6n5opQr5BBQa3EgBJjJczpVxG0uZg3M4jA3ZgTU905TtcU
         jupA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841279; x=1792446079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MvL2NksiIGW4AGmjA3H0Npu7mPSzD9lxMrBE1kC8jt0=;
        b=e7kcIlYPpC5PastaV1VA9rFjb7oH2EHlfU40Dsu0wcgeYMvKEervMi3okRv0GQKGV6
         eoPWdEZ0w2ng1d2G/zZ5p089vHOIj5vw6Gk4I6S9j8aPH685HgCQy/M73gfAtbwYXrYZ
         +OsqZCXW58CRlEP09bo85N9kWoPI0CwH+e4jYthZIw8apZw6wYyJerEYghZRJTRHPBDi
         XY36OMwPeZ+I3zp2LJyvWJvDZZcnrFXXTulaiiVTjNmioH5YTcY/RhzVWe2cd5Uv/HJF
         IBZmG+a9AZlLReiMaWgX/z0iuheVyLI0kkz3zutipOGX8NKr6PqHPqGAU6SR7L+1EkVI
         hsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841279; x=1792446079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MvL2NksiIGW4AGmjA3H0Npu7mPSzD9lxMrBE1kC8jt0=;
        b=y2Glw30rfAqMiuBkvGalGDlvzGEfZMZ32A1K7cRf55WLu8+d9lgno2wTKOh4bk0tpB
         /W8HYjIM8LyD5e8TOGcJ5L9+g2HRD7nF2rSUjWClgL2cneBRF7kdi8mrX8cdWpZs0//R
         Z5VkOUq5WKvd++tOY8eJTeMzcgdbQqL8bWoL+UCKIqxDjmd0LVxGWfJzHJEV9FOnpjad
         xwIu0CLSY58U+8ReVaJEFl9Np1sj/sxeKLt6DqoWS1GRD8+azgDgJvC2o5rKIL5CrGmz
         hgs1H5ImHUGj6kbIe4plaakddzaco/tvYKEYoA5W9NLqr0ULFEpOaANu/RKePjLEeA7u
         bOTA==
X-Forwarded-Encrypted: i=1; AKwUvByTzOMfucHLHlMwwJqKHUZLNxxpeH5IpXgUXh3gLOOzfTMLAMe0+8rqpYMu36f8/oY6eH9fhJXWwHzw4OM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrPtdvjiCiQEQSNu1Hf9av8zEhWTnYOQxgNCqJlTpYhs2fh7qI
	j79AK2IHX4bnhq+oXZ3QQeWRqHh/VG2Mf0VV/FY04WeyGERjxEU98KkH4IrIgBMTxMJrGH31uUN
	/MV4yKLs8j19cNgzfcXQZcGp0bRQS7Qo=
X-Gm-Gg: AYBFou06qs15cy19yCMIwoAmPHQGv37NVDkeSv0flUbAcmW1JZ6qP66fFSH/cniUyd+
	daggD5aVO4htS1Pz/nBRDxRBVlNku1LsYFXI2kYqEKibmm/Hqh+bYXVp+5vkV45B/oT4UQyjdTw
	xZsmC+9cmVYAhOOzVpdDecrM/rbtH1qSL3aNwOz7EDf0uYd/H2saPHxEDvxUh7u6l5L2DebuzgD
	pHWSxYhddgRcjjm0/GpHaiF4MqCTbfC+eDrJtj7yaFYEGI9c4uyJuwxW5u9Z0FvcDjfpax2LEmA
	ujiKaIReKxZK7iw/O+40ptiWuxCoCmbFy2ekeXnJngqRHkK1qcZVGWEFN4CTWPw+MnFvwg2cTQl
	+3crkjC8IKULElGLRmareIXM/UKUo6z612qOriCc62Q==
X-Received: by 2002:a17:907:2d94:b0:c2e:8eb7:53e8 with SMTP id
 a640c23a62f3a-c31aa03cd11mr1071057366b.30.1791841279326; Mon, 12 Oct 2026
 14:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-tools-regs-v1-1-2a5940e22548@gmail.com> <CA+=Fv5SDnzQQDzyhaQ37kWJMjTOHP0NHuAS6kJHwT8_Zqyjd-w@mail.gmail.com>
In-Reply-To: <CA+=Fv5SDnzQQDzyhaQ37kWJMjTOHP0NHuAS6kJHwT8_Zqyjd-w@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 23:41:07 +0200
X-Gm-Features: AclHuK_Gule_sWbyfyKRqdrOVxlX8Cnrce1CxMxjqq_Jy90LticJHn-in30fJ0w
Message-ID: <CA+=Fv5RGr2NQs=gnErAWXfSZgMcWB1q-_-BNQ5X5DyzqkV-bmQ@mail.gmail.com>
Subject: Re: [PATCH] perf regs: Add alpha support
To: Matt Turner <mattst88@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi again,

On Mon, Oct 12, 2026 at 7:37=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> > base-commit: bc01105ed65d15787b2eb93ac26e8624a2139e35
> > change-id: 20261001-alpha-perf-tools-regs-c206a84dec7f
> >
> > Best regards,
> > --
> > Matt Turner <mattst88@gmail.com>
> >
>
> Thanks for doing this!
>
> Register selection, recording, decoding and user stack dumps tested
> on my ES40. End-to-end DWARF unwinding remains unverified because the
> installed elfutils 0.195 lacks Alpha unwinding support.
>
> Tested-by: Magnus Lindholm <linmag7@gmail.com>

I just pulled your elfutils patches and ran some more tests.
With your elfutils patches, DWARF unwinding now works on my ES40.
Both existing and fresh perf recordings recovered the expected
leaf -> middle -> outer -> main call chain.

As documented, samples whose CFA depends on r15 stopped at the
sampled frame, since r15 is unavailable. Tested-by tag already given
to this series.

Thanks,
Magnus
