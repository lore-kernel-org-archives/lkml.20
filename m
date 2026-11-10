Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794277347;
	b=edLbjCy4c2DVj4y0Y7mtLvn6KZd+b4/+y+4ee4PwR/vLma8PVr2lQB+wckD92CWJrvTk
	 PrlcD9ue0nVIkrELMI5ErxMYPiTxgL/CobNVmzp8COQma0Au9TcS7lrdekz8wfNa08Krr
	 4HEliBFRK1hgRELNlObH1ror56U3bnZR1XHUbuwE5r/xlDx5hTDXsmf/sM0SfLP7mblrr
	 +rkgFwWGhyXdognq8TdhF5w+aNHfP4WqE2+B0/+zgYUrCyYCTmB60Qm4AvzywjdnvhIsf
	 GyTD5mTBKrFZgisQ7HklcOxUIE6aYcGLHK+EDR23HYrzwrfKmIhoJI7VRGW8PEu0acA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4Wpwa4XVyGqQGugMaR06HSk6F68APSi1+DRWGbuhVww=;
	b=vH2Qa7leynKBiJBUrWiIbVRaGNl4mA0fLasd6D/k+Z6TLYtOYW/6IuxUcTEr+lhu5xFt
	 nGHWATztbRepuBgArALb8yvZ8LI6vguFqfdSHDDRKWwI57ns4uLGHBx40+8BO4UYvKbWv
	 mYN2G3vzWapcryC2U583rjz6yB2iomyEtwMWlm7vOGWSMyYkYCois8PoChMUTBAYvQm3l
	 sRwY9oRXRFjnrzc2OkLRGJ5TQeO68EtNkCDoKOhsTOZ6h6DDV4KuSd2XGNGRihogQqGHO
	 zQBpAFscyVcH30aBZ6e98XgFnL6UCFG4kG/ANdKQkw0bRFtv5uon+zAQNqQvz84HHrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DXxmrQJ1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32696606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32696606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DXxmrQJ1
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d581da0aaso158332166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:22:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794277345; cv=none;
        d=google.com; s=arc-20260327;
        b=CRW2oiig6eJYLJiIkmbSQnq5GM0pgc34lHviSmYrbaCezZs8gWa4uIFkR9ko2ooF7e
         qvSqoO/YeZR0XxexCC9NagUSQI8oap/cKmiCxli1NmSUfkHBZWD/ghV4P00ctBWMm9Ud
         FVxqNoToDYIbdI8q9vZKqc0dZX8axbboc+9eDe2zVeda/djQQ8tj/qMm9UIp/7lk7SkO
         gcc9DoW/DHeEsJDfODA1oHX8Uo1LNjI89Sa9Tav+JINtsFy0G2zToDKtI/vGGg+468Gz
         CZdCB3w0pzjimTZ3WPlC3kIZ6bfhvjiCAuxkALP2QabdcKPDPrCwltNvtGWUVpFDPHVt
         1EAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Wpwa4XVyGqQGugMaR06HSk6F68APSi1+DRWGbuhVww=;
        fh=n0Mp7BM2XHWeQkgov21Y9EMLUSzRC5mIwcbIiW0Lh2o=;
        b=nPUMrehfUL4Wh1ga3Kg9UTwhQxZUKQiMCMpG93gt277+i+ZoRCVjbkigJAYVqbhvmP
         X2rpnq9IZPl/V8Hf3djOAhXMK/FlwWLdKJ93GSn08qLu3duwCgvytGSJl1dcF5hd71cg
         0s9G53yPv4mgN30L5NRokuSfWCp2ZjXnitznQT5v25tn3ra775PlFVdFL8IhKItW1DWX
         4T2BaRLNNRG4HOVgb9fM/2p4/P0YSNLK+QHilwSMW3/+Ndz0xZ+viIuNCLT3k1O2KaJV
         AndafAFraB43KpF+dWzBaL3kppTmAL3xsXzGXBgkr0rf6MsdHAXch+4xLQFfX/z/cuei
         FDEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277345; x=1794882145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Wpwa4XVyGqQGugMaR06HSk6F68APSi1+DRWGbuhVww=;
        b=DXxmrQJ1EsrbNPhnqwrQVNpTjUWu3R+XkOju7bOqwzLAFQ4aJEYNYEuRKtTFVzrafc
         TRsT3xfuGj8ve+klCotLBnHjKaA17A6q4XDSC9dMCz40tRqF47pZYp5Ag53oJTP7T9f/
         hj+N/lw7OOEabRXog1qAKnaDpekqnGZSpfnXOpHw0xp+edy6LYuEXxzNXULArO5QivLv
         aRY2W4L9PPiEGTTCDMYq1EuH3NXDwzseOaYNs0JP/U6aBMD0XU6Ziz8U6EOCpInaH3nG
         uiTa9XHHo6xbD4JkoX92UtFPAr9it0WAdF/ywG4HjwaCLkd7SYzVIKYlYwb5AdqPlA/L
         UhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277345; x=1794882145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Wpwa4XVyGqQGugMaR06HSk6F68APSi1+DRWGbuhVww=;
        b=s+3Sf+YMdpiTMqygiOEwdHAVOkRg9SJ9u6wGxZ1ji3p85IBBp0PFH0AUAy9hTCvnY/
         kaUEWX3e13S53KnFE8XxsHCva0ZQkp1+Lyj6doDLDw8GzARkIizoz6DJ4SqASpetX68s
         68SK5fZdh+ISz0mSEBBRKea4mL0weTVX2OHlTGGw4DxER8dJhvGndduFujXHmz+WPUjw
         hdfFfIk+q/Z2x+I2qDJ4kKPa1ECLdHV5Gxav9N0JMETj4WkPvnPwOCfEDWM92lWxfLnX
         W02WvEyrGOnuQ3MHiACfipuWjjEzRyw1ExfBh52WorxJDi346cS/xevbk9dzrCFcDROB
         ShtQ==
X-Forwarded-Encrypted: i=1; AL+hErGD8ybMg36EBTpNRgg3NzWB6aiF7RDwWkbEP19uYzS4Cbbf+YloyIL2NUMsGPwsMikrlfhYJF9HTsc+1Lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZOcralmQ0TQjkxEzHuELUhzOPeVrBgWzQmiEjtRmGK22QoaP5
	2nsPbj7eo34fY9LxlIGAIxdDqLyyjyuM/XBTDbmIANNLYSnwRwTC4OuSSXXwyROlQE4QVBoo6rf
	PHOiR/5KpUJ+2/SUHppT2LgvIV+tNeQ==
X-Gm-Gg: AYBFou2vg2l0nqWRjshKLFKYU0l7h4YZnf7wPNn01qVRKKnN4p2M9/cvga2GZpKdWpV
	p8FkYClMpUMjdbbPNbLs2Tg9P0zHgVueAum432NA4BzG5D0veG+AwjvIoWRUx9tBOWLkyayIH08
	NYjbPgFGTcJij8u057nz4VBdwL2PpL1xD4j1lgqWvvc2kV1ez8rzjYwtVrib34tvLVJuQHNifap
	5yrlJaSj7QAvRjTxCNKeLBt/Zaa0QG61haRsv5Ko7I8JSAR3CG3PJizSnfjoOX0vO4DRM7I13MK
	+bm51IIq/EDUB2hcarx+X5fO1/ZDfAFwltU20FNZSDLMIQUTHdlnWlkkCWf8BwdUjuD+wjPiW4H
	5GpbMq7+wXT4+xQVj4ox6bVKThKWV7NrHJawW4cQJc4kB3E6d++X/gH0PBOyT1uwu/Na+Tu0n8J
	z5BwV3jguBrYhQMphiC/od4vz3K061iaHkZM9tGszjIOHjoYg=
X-Received: by 2002:a17:906:ef0c:b0:c40:91fb:b76 with SMTP id
 a640c23a62f3a-c50495f09f8mr89856066b.33.1794277345504; Mon, 09 Nov 2026
 18:22:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016024300.3660850-1-mhun512@gmail.com> <atJycIEnUZKVdTjW@google.com>
In-Reply-To: <atJycIEnUZKVdTjW@google.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 9 Nov 2026 21:22:13 -0500
X-Gm-Features: AclHuK8xZhpHzpn9-AplnHcwkAVpxz6Qptfxkr2G4Zkv10w3cEkBO82uL0JlSd8
Message-ID: <CAGEsz8GKNh2K=22+_C-HWPFv6QUpSXbFWT6WmFX5gTSO-e9NtQ@mail.gmail.com>
Subject: Re: [PATCH] Input: wm831x-on - free the mapped IRQ on removal
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: patches@opensource.cirrus.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thanks for the review. I've updated the patch to use managed IRQ/work
cleanup and MFD-provided mapped IRQs.

Polling is retained for release detection, since the chip only
interrupts on assertion.

Thanks,
Myeonghun

2026=EB=85=84 10=EC=9B=94 16=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 2:57, =
Dmitry Torokhov <dmitry.torokhov@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:

>
> Hi Myeonghun,
>
> On Thu, Oct 15, 2026 at 10:43:00PM -0400, Myeonghun Pak wrote:
> > Probe requests the Linux IRQ returned by wm831x_irq(), but remove
> > passes the untransformed MFD IRQ resource to free_irq(). The two number=
s
> > are not guaranteed to match. If they differ, the ON handler remains
> > registered and can queue polling work after the input device and driver
> > data have been released.
> >
> > Store the requested IRQ and free it before cancelling polling work on
> > removal. Also cancel already queued work after free_irq() when input
> > registration fails; free_irq() waits for the handler but does not cance=
l
> > its work.
>
> Why don't we switch to devm_delayed_work_autocancel() and
> devm_request_irq() (or maybe use devm_request_threaded_itq() and get rid
> of the delayed work)?
>
> Also we need to get rid of wm831_irq() and make MFD give us already
> mapped interrupt.
>
> Thanks.
>
> --
> Dmitry
