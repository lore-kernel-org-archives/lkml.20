Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570713;
	b=LPaXy7DlEdB6jt+s79RYQBre053RpuMk+xtJAeTXhQr8WKNcferrFW2DaecPHImDkySZ
	 2iRfOsq0ceqryyk3FIPfAu2N8uqi+rHmD8J43cALZPEAyI0HvJWTso2MMb9yM+THgsrf3
	 oxL8Nn7xpDO36vFwetizmVvAiRRGd1EWlWWC/BwxYO3cWI/Ms6XcvA5/H8NpTtIOXda4i
	 agq9JlPoyBDkv0jAEMADmXH3mRLNXBmSoldewXBugxUGwHPQjUJHxvgc8BIgTAyk0/7mi
	 bZEuQzq5Jis15geP/EyZWbSBlp2TW/RztFtwDajjtorywf1wkzO2tYfKvQ+IXe3106w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O04uc+lDpCUwdTYjExULkpDGvmNI9e9oEputG6Eg5zM=;
	b=ABMRRWw1BnDeGOuD/3jjvU0nPMgCxyZGuRbnIoQAB/0aOFk3K4Hh6feyXHV3eAxZ0oFH
	 GL41NL/6S9zd4APhUDgQAJ50bhFbyQXcevdbdA2EVb6waeZPuHL55qx93TIsCgitbjzwH
	 Mr7eNIaHA7aNxUrlr4kUKe8yeToARIwLeLqZg0ZcxpQp+njHUQ3w/lMYrkpoZVBm9Qhpm
	 ABIvCsiHzufbEDgkmKIKsmnF/BLJicQrGGDsqXCfZCtigIL+rrGXfCAX4dMr3J6bqDRya
	 bcYBy3J5c/Ld5v+pr8Aj5Ro2fn7L9EAA9RnSp3d0m6H1MzID42wXLzQYGbB2gJb2FnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bmZdBx4h;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD2606A32C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45AD2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bmZdBx4h
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c423b145922so312861266b.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570712; x=1794175512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O04uc+lDpCUwdTYjExULkpDGvmNI9e9oEputG6Eg5zM=;
        b=bmZdBx4hTugn6FY0dbjEkWQ+sDPlw5KOOy3RW9dZjbwEFCE47dZuFwi4t8Y5oXEkbB
         zrefvNUljR+mUivkvslsCJxpSe1sQC22hKP2t6AVII28ZSOJT9DWDGuFmj56eIegfPu9
         Qtl0bka46XwhJ/hxp1Pebe3M20hCHxRBXj+Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570712; x=1794175512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O04uc+lDpCUwdTYjExULkpDGvmNI9e9oEputG6Eg5zM=;
        b=AzFdkeJa1V+wRuAJgR66KSNhwoeInOqa1ntvDvIdF0c1gS0Hye/rI7oVNJUHil+998
         KMTD6/sKDLIqTEfxllqG14S4sKzXLPmjAEmTD6vxR8ZFitgcmqlf3or3AxC4SwxCLPxV
         2e752WUbKOKdNGqDP4tww/xRO8SaNJVguYs5L+kvUx4x952DDDDo6iKyXmLGzRmyFZ+q
         Um5jlFmbfWlXtF16ruwG28P5kQ7cxjwCPX6yIqXltNgODiGzsB+EqpKNQsz3T9O1xrIK
         /mqBDMtazQB0G7M6u1+iI+4rCpxDIJ9BIkBGeak/B26mslz4Edw3yHbtIoOxLy4xtIVS
         ASzg==
X-Forwarded-Encrypted: i=1; AKwUvBwDiIpZWi+w5x75x6N/q5Q/t6goYJIcOlp/B+VMrLhzSwPqXuvrPUcFsnLVBIfwWGZRpl58/Fzowt4Didw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJTImZdfrkQItS1VSiZvcJEWon+ffYgdYFHNttocJmN1nmjwT6
	YuhUdcULciVIY7Nqh+TVvVhYJR9p3bTM5JBT5bSfblviq4GddHIbbfDrTl4zuvsc78dcKsYskj9
	eIOmBSfHm
X-Gm-Gg: AYBFou0VdB1pIkNRiSu5wvGF7+Upi9nibKnhgNAfTplqQpfjHahHYdoslhPK3LKLAhi
	QfMk4Jm07DS80YD6KUoqIShXU1m0sK+9qLgG46cIwJJFnc7+Fts+bCT1RtRW0jVB8J1pJVTD84m
	Vqrkb/w1MDZEvRfgpMeg251KRN71IIFkocM6H1Bl57rvs00Zv3F7SwQNS8WQGQwa0ddhM/M/t0u
	yklAkE4288WYTf46+XbFizVPOlh03DqDIt4Pg9DOj6xtPetEtG+lWDSxjbKPAeiF29oFug9r5UU
	NwzvALRxkmE2MUj+yh+aE+6PMp0cJkAz3t4n1eGPKHm/xhAqt2vufmLnEzhInpdhUJzIkXhHRNw
	v02aJr7DSSkTkplZeIKFPU0PI0MTOl+USc6+ULF8+kJ5wY9tdiNSKNMmZQIeRgZo5RGEss4Id2K
	6gafyUwRAOoY1wUe7+WL4Li/WXYV6/n5B0AqB3JK9AvbIhs2pOo34smESmM/Y/i1ygR7P3HzYj6
	OviwdXJd3jDAG9mWhxKzYpc/ZyCm0sB7RgopBSuRwFqkDs8CAioRf0GIkK+OIeBTpvSrH145M5i
	mPgBqP+qufQGZfzJzKKBGw/SuErSZQTtdxQnKeH+uZd0WqsrspztJy67iITHG3JH4ZU8Yh28pT9
	HSBj3Jm/LhcOF
X-Received: by 2002:a17:907:6e93:b0:c41:1e13:4ba9 with SMTP id a640c23a62f3a-c4ca795e46amr671072666b.6.1793570711822;
        Sun, 01 Nov 2026 14:05:11 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4a9a1sm312412666b.58.2026.11.01.14.05.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:05:11 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso19933395e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:05:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBypz4hAI+h/J61NcvI2jMsE4AqCkKq9JmYA9H8YRRxLtG8uGWBbyIkrucr49nvXylWBtCTc64+tI/UYCdw=@vger.kernel.org
X-Received: by 2002:a05:600c:19d2:b0:4a4:4d57:8487 with SMTP id
 5b1f17b1804b1-4ac1737c51dmr189043855e9.5.1793570710564; Sun, 01 Nov 2026
 14:05:10 -0800 (PST)
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
 <20261028215600.1713475-6-dianders@chromium.org> <auQcDmZJGQZW7oB7@gractus.seuss>
In-Reply-To: <auQcDmZJGQZW7oB7@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VEeAWJziS-ifyWdJn035VhnOS1wCPGma3MZ5nBGuOGEQ@mail.gmail.com>
X-Gm-Features: AclHuK_QHzFjJVuNwhBeiWv5hUKdOqK33qi3pjq7aERX5ObdBWq4FdUnV4RCeTY
Message-ID: <CAD=FV=VEeAWJziS-ifyWdJn035VhnOS1wCPGma3MZ5nBGuOGEQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] libfdt: overlay: Prepare fixup and fragment path
 helpers for reuse
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Oct 29, 2026 at 8:55=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Oct 28, 2026 at 02:55:55PM -0700, Douglas Anderson wrote:
> > Tighten `overlay_parse_fixup_entry()` and `overlay_split_fragment_path(=
)`
> > before reusing them to update the base tree's `/__local_fixups__`:
> >
> > - In `overlay_parse_fixup_entry()`, store the `strtoul()` result in an
> >   `unsigned long` before range-checking against `INT32_MAX -
> >   sizeof(uint32_t)`, and require the offset field to begin with an ASCI=
I
> >   digit (`'0'`..`'9'`) since `strtoul()` accepts leading whitespace and
> >   `+`/`-` signs (wrapping negative values to `unsigned long`).
>
> Huh, I'd assumed that strtoul() wouldn't accept negative strings, but
> according to BUGS in strtoul(1) that might not be the case (at least
> for Linux+glibc).  Good catch.
>
> This may need some minor rebasing for the suggestions on the previous
> patch, plus some additional minor refinements suggested below.
>
> > @@ -404,9 +405,10 @@ static int overlay_parse_fixup_entry(const char **=
valuep, int *lenp,
> >       if (!name_len)
> >               return -FDT_ERR_BADOVERLAY;
> >
> > +     if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
> > +             return -FDT_ERR_BADOVERLAY;
>
> Putting the rationale for this in a comment here would be more useful
> than just in the commit message.

Done. Added a comment right above this check explaining why we require an
ASCII digit before calling `strtoul()`. Also, as Simon suggested, I split
this out-of-bounds write fix (along with fixing the unsigned overflow check
in `fdt_setprop_inplace_namelen_partial()`) into a standalone bugfix patch
at the start of the series.


-Doug
