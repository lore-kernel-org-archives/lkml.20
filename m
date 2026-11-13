Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794562575;
	b=eyT+KEzd5I3WxpKZoadebCQtMkUKgGxVEgs76LNPML2ZJGEd89zSCB1AGY9NMEnmesMD
	 aAAVPnItw0cILV58PLCFepnFj4Cb6b2nfGFLBhWAkr1OizrDaYKctEV46M8P2YGa32PbI
	 +kLUDg4D2cdy2+qkBvFpPwyjG+IVqk4Iqx8RBgIUfmXrC1XX5PChwPaof0Wdc6H5mi9wC
	 7SN+bAJ8/c0Gl56/vkdNQZQ/URCBAPBt37dlaxa7Ju/pBwqIXElLkRplaruxkhPHjazbi
	 GJS0lwI2kgtcrvYOAz91lFzgFOBnZ62FgF9N5STDsnOQEYyCXcYu6SfYUtpkHLCoAxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GC3vN3Ju+9r5kwgx1dcLNYVMHeXAZ3yMb/dI0fBLirg=;
	b=ddGFdRqbNYOx8AmXYsh81btclu3kylM3TU24OvOwJcfrBqaytYEfT1PzXGy1U2JZXtUi
	 /f7kr/u4LDAKEphFfC8feElOUZJfBBzV74caJVZGV7GsDs2Km/BCy92O4SatjSOazEf+P
	 ansLH4GQHLmgfz44Hr9XqxpxfwCKS4IWOxB70reUL6OtM5m8slrB7rMZPopCQcxsk8R9w
	 jV0+4fj3zuHZQmYJBHRaop2Xg7LNRl1kZANVMHlHL5ZpByfHeMCaB1qGpSaBCvue+Jo4J
	 tBvMElGQxYPTNMT+gDbON7Wh5nXG5MDk0+2cdS782u19bzcqLXl2UYxu203re+NxUZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpnUGyLj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE37606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BE37606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpnUGyLj
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b2d14968c9so8609427b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:36:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794562574; cv=none;
        d=google.com; s=arc-20260327;
        b=W1/fFL2acRTLbg9D7B2YzUba1tUukoVdF88rS629SYbiPJaR/GLhlI8jqjHDgBBg4G
         cVh+9PBds5bUh7y3ZrfKjV+Ldu1WBh115SsASQLt3MjouQkQy7iegYR7Oa6e4OILgPEM
         SmYAskGH12xV4AxBhq/S8Qu5gRi7uJc7q8B23oXYoBwQfGfb9ytyMdHLCD9wsRflVxgn
         VwAPIvaxVykqL4tQF8cYSevPRygfp2ElyOglLLzO5KUNNV2BVxvLtczDOxzS3LJzXIWv
         ZclkmOoTYQbEMaqlfdUeJmGz+5Ur/C2gWzeCL+Ti39rydG6iU6YfCjAhUchqnbO3hCd8
         iCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GC3vN3Ju+9r5kwgx1dcLNYVMHeXAZ3yMb/dI0fBLirg=;
        fh=MIDNbl1heMkZprli/dnNYBUuxEzIk2h63lwGhiYyX0U=;
        b=ISp1KhxAfIzT7CikorkXPCufrGpOezZsKMuGc/JyOnwXTouFyyOj4ibb3vNFzl2b9c
         DL0wDq5ZR4ljNvhCFTmSIGsTWl9buMDIpKTp7TqDWMVRsqaviiRvtRFC56lbJGjatGbp
         phe/ZR4Z736rpA1+caDh9dbZGQ8qL8rNK4MQfe9PP9pF/UyuQphm97By1rOunmcqG3Cd
         tIYQKB320HaI9VxeiS0SyFhThUvA2AxtTF22WWVzW19aR+6fVe11nO/cKEDIUvazPPfA
         Q8tdOdJP+ne0NVUsZ35e5szCKuaZL/xuCZTDswJAau/Gkmm9jJmsLh9C+/Y4ZsxdXBHL
         MPaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562574; x=1795167374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GC3vN3Ju+9r5kwgx1dcLNYVMHeXAZ3yMb/dI0fBLirg=;
        b=YpnUGyLjwTTMPc519eNPTuVbLmsWYvdED+cQpDTOEnZxKB07dA5nbVbtkstlarUB73
         RZnRl/1o+zNgmL+pkoBsibRXQJ71EGX9qusasyTyKNUeIBw78b4sX4evsWbZpwT4+UzM
         4hEm8ZGZ3mRoPT0rbBalEcvgZvIx5b50uTU/oaP+kaV7CRLz7ifv9diaRVNC1qHzKDfZ
         RyYj1B8nTbpTnVwkAQEj4TK/BSokn227r1X44UaZivMmuxPDhLPnt2hddwnfpgcIX3TW
         K03eFfJvb11MekZAL783ZRSu2xueeP/fuxr2G4FlS/BM0dyCO/sY6ANNlp46dhFmvvrY
         a6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562574; x=1795167374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC3vN3Ju+9r5kwgx1dcLNYVMHeXAZ3yMb/dI0fBLirg=;
        b=cMU5EzWhKFn2pIUGH4Xe7EudqffnlElSY3A2nqSqIAtpjE+ZkRRF2Bh8/tbuaKeKIT
         cnaMtHUeCBl9pNl77rLfdMYNqczDQapqn3PRTidcfOomcskXnUCfQNqgn92rZjmvxCJG
         JhnTWllLE3/5zpLKnliNLe0rCBi6rzBAR5QA9aZf8hs2wz/mK51ew0QMkBKl4ivDtLgq
         4EgrRcXMvaQVTvCMqVu0TOPQnum0y+qHO2hcoRDuXGYOOPUpNWhH3rX0py+a6GRocQtR
         LZF2oxGErDQVdn9G8xtnYo+ly9XNHawKL+VnXsWMnrQG0CwdiLwE/ftl5uZ5pvFHnb0v
         hMEA==
X-Forwarded-Encrypted: i=1; AL+hErGsL+BvWetgpHmq2wNoGn0Edz09fom9bZooKyNms3KMAyP4rfuzyMKNM+JDSg/lMgjtc0bJnyKfHOMQJGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4MXdSmxK/PahSS6EjZsIRVku72YAgjyMCZGqRTDHZlswOXFTw
	B0qlsE67rYVhrxG9Armu05ru5WSSCQinFzC94hWepoY+FS+m8vXG45BHLGD1oRFjbWgb/psULHV
	jut+ruW3Deg4GkXGz/jMX3SUXVlrTM60=
X-Gm-Gg: AYBFou2r0EOSpVDkDSisQdULE3YdaKqPfjpRViSLf+cYukqrvEpqGKPFcJ983hRkzRE
	L4vGX1NbddhxK9MHxU8MLa3GKG1RrW6kfRkAvbSgK07fQOZaucGHDKDND7Hlko6peq/L6fadTCk
	U3xpRP2Xn4D4VGG3Pj52GgoMAn9GXqv1oIiVaRycpLrqpeclGcagagbWXRyjk1Rf5ihivE+Cu+1
	dknxHBC5wsHLYIQIQzISk8Nv4sDeGM99MN+7TKv+l6NQr0IA9bngtMdLtY+SsS4kUxVBDHIRfsG
	zKHm1n+A0KcuLeP374DPXPhN/T76ScLgSgzQk1gnq4mRw+dVHg8Sn3XisXmzZH7/72RSGnYBWDz
	8aDmyYjn2MbgiojPos1/dYUT8XoVRuE9k0cUuPHlDDAcaZ6fpWWTODFY/YhMv2TM7TJHRPME6Jf
	a2oAPgq1iOvCG5PlqplKrIlxIXruhr5Z4xK7D54RwGO8cXd/kmtH7KbAhUESJ2p0LTRgULVQ33F
	iB7n40eot40616790jO3gN6TJFD4c3pUBGVDawvC+ZFK4FloOEKcMjeH/c4ysMWQxdhpSPfvi4Q
	CUzluBk=
X-Received: by 2002:a05:690c:82:b0:8ab:6374:5629 with SMTP id
 00721157ae682-8b4aa2efb9dmr11468797b3.30.1794562574285; Fri, 13 Nov 2026
 01:36:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112065037.1800467-1-dmitry.torokhov@gmail.com> <20261112065037.1800467-4-dmitry.torokhov@gmail.com>
In-Reply-To: <20261112065037.1800467-4-dmitry.torokhov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 11:35:38 +0200
X-Gm-Features: AclHuK8mf3feDLq50Bt1BSFwCDhuFJWegSiz9V4F_TUQJsU5rvtBoffQnUrSgRI
Message-ID: <CAHp75VcY4O-kgYv9jN0vSiU3Y8FeFDWAojeYWhOuKJuzKUXFCw@mail.gmail.com>
Subject: Re: [PATCH 3/5] Input: tsc2007 - fix minor coding style issues
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, "H . Nikolaus Schaller" <hns@goldelico.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Andreas Kemnade <andreas@kemnade.info>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Yuki Horii <yuuki198708@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-input@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 8:50=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Fix minor checkpatch warnings and checks across the tsc2007 driver:
> document the mutex used to serialize I2C transfers between interrupt
> handling and IIO reads, remove an unnecessary blank line following a
> loop opening brace, and drop extraneous spacing after a cast.

...

>  u32 tsc2007_calculate_resistance(struct tsc2007 *tsc, struct ts_event *t=
c)

>         if (rt > U32_MAX)
>                 return U32_MAX;
> -       return (u32) rt;
> +       return (u32)rt;

Do we need explicit casting?

--=20
With Best Regards,
Andy Shevchenko
