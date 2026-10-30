Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364625;
	b=hqswp95cMCofwG9BsHq7mvcDqtvH42zXmsOon+FG1dSiWYWg6OiVhUIVjsxUFpqcAhXu
	 G+RRlLy+FuixTDGsBvjQ+6Y6YjhrEFFsFPEaQND/L/qsG1P0p5l+5y9w2ha3q6yb4hQSH
	 EnSZbFBe0HH9D2flWx3wLBjJp9ZC+SAk/KvjHxNBHIQ50DZuKSPM2G8/LJopy+Yy7D5h8
	 yh+gYrgQKaXhV5iGBYr8Yz0wwEjJhqGooec86LLjKOXskB2xVfQgS+OgIlZ+C265O6XuZ
	 lAVAHzQ/WVawBjLC8gUG2k4L2kIwsOo40/swO6XpwKaZ7XQzPNI9JbCPZSnQAZqHHIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AM7nJD0O+1QUuM7/HgR9qm/EChud0qm48kcPoOZ3y3A=;
	b=vfHKXc6UmsHxkd8pIXdwMVXXyeMFJ99PkaxbtcCO21KIBjqLJKkNbMMlghn2+8VTJcFG
	 u7RNpnlsDtpmXRdKtHmwUG5YKF9w6K55py42MvzVAvkqdSDy7Qrdsy6Fa5/LsN8ByGrR6
	 tkBGjTE0KchVXxDcYCZ0cPwAK9QIXr8Oee0ns8oCcbe9SNk+McEiIUm8A/no90X5p+NpQ
	 yYNbBp1fpu2POGE8LreTHo7KVqLSVuar3745EzZiMBt0g6SEtrZ+B7URCBDHiHqtvFQzj
	 8tSCJQ8KIXK6vLuZXD4RCkC1n7gjWKba11IxAOl0qbdrS1zRRGBvT8vVum7AcLN/jzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IXMoK4RO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37608606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37608606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IXMoK4RO
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso838465a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364623; cv=none;
        d=google.com; s=arc-20260327;
        b=F4ZlRdOKSxBE1wNeewyB11axBDo7Ijji3WgB2rPUYH2CeTcUq+fy/6o/NmsW85elwv
         lEJk/xn31ZUTN9I1Fx1+fKb2dLf7maW5FBYiKolC3i1m3w4iGBsROXD66YZvOvtUsdOO
         02H3pz8fSMfM//o1PQpkf3Pn8Uatm+5zKBVYFNLuF273Ai6UH9JcK75YiypoZ08FQrPi
         8IB784jhtfy73lBwtOy//rIof2UsFkVHLIvEINu+lrDNKtmyrnYXvQf/1lRcURd8vEA/
         LigwhsyjK1eHTckpXLguP/Q2bsO/NuHLQBHu1u91diXEFvJVf19HzMAfGO0mJv372J/V
         bZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=AM7nJD0O+1QUuM7/HgR9qm/EChud0qm48kcPoOZ3y3A=;
        fh=zf0JOZWkqeYYYUD2mdNXUbrpqnP1ZmwjuZUarvHbwxs=;
        b=tCtb+XzfRILW7lK0C7IiSPyBZAAs2FLXVRdmhSFD32Xrkm9B9QXp7tEOrD3E4DXUR8
         oKoCsLR7NSyCTIbhYameX4oQnLAEzSuxaRVORau91Z7RlpWsfRw7JRGIF0l1MTxY5Lxo
         +u385pY0VpfkyEp7Ah9yPtJ4t+JsLNogz8He8Z+KQZGB5yr0EOXDmy07+Dxa/Qirh4Jk
         kaBJ3Aw191rlclsSMqcCUVqxOY2IDHOiVTOmVw0iFpTt/4Yxskr6DmxXg+C5yjZrIYf2
         3vPcJsHPXtEjTX7jYcJvYbwMcLHMyZnI8btbcRdq/Yjq5CHFv6YvdkYud8AJAEuHK7xg
         yJhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364623; x=1793969423; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AM7nJD0O+1QUuM7/HgR9qm/EChud0qm48kcPoOZ3y3A=;
        b=IXMoK4ROJSExgomuZwg8qswdcktPKBwPHqGiOEHr5qz96CfBr3Ci2U5aigCM+XNVlt
         d4T3bV4fyvZCcRGQ8wR7TnpmNGTvxWw8DGL6I4xS5SVrwMyIFkiKV2sngytFIGePKPpK
         XBiburHB7LnFiaSIURjCaKL17hViAeGlRn3c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364623; x=1793969423;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AM7nJD0O+1QUuM7/HgR9qm/EChud0qm48kcPoOZ3y3A=;
        b=AwGA9mLFUC5OHyrcczPLhKDF2ThXcRxNC19JQBJ08fQ97Lsu1xY+86oqVC6oq5luTD
         6Qgg8+i29RzasTE2UHkV66QiWSUOUaB0lJ6f/XVDIxp6JyEYgSvibZIVTpLd8PLPbthz
         Qsr28jZRi4KNqxwphbbAAYdOTextvV4b6GrB5Uqt/tb5LrZqdp0JPjuaMEUGeprriHnF
         RGOTDaIV+HTap7SJ6gYaaOzMoGopRq3M1sNhXXq32BCKP1siOsFVH6IOicS69fC3dvEY
         K1/HQuGiXT53xgCIThbC0Sj1MafIYUGYJbKHPrXd7C8i+VpeeiHKePxpIXEgD5STU3ce
         VOIw==
X-Forwarded-Encrypted: i=1; AKwUvBwXUF/YB6k7lgvUVVKjYA5MtpyPYwdMO59I+Qqqgp+mrX1aTNE7zr4DUxKKaQWpfNnQkh9QxcOCp3xKDX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5iPhWaqxZ8kGqG0itvCKszL/6JikkcK/IG5CC34hitcc9DF7c
	q/Oddne10SC797epDQ9e1156lDWikeCuxqH5mH6D8FcYHyJJPdIIZR4+41xOlNnmm6J2tHrS9Xw
	g5diB1Lg5PuLLJEpUMjYpwnbzYu6+TW2v2pTdpH5V
X-Gm-Gg: AYBFou3sYVnquVBcUaYa5tTCpHam8vTG0k/cYrbLZfuPRFlAGXuX107Uawq8a2exwsA
	6DfWQJ6QG1Srg/A7DvvC8FBlcgEfgi9Us3WjjZ100L7RdNVrjG1kvD8rmQ8yRSOUHgNSW02D9Q0
	xrI8MirGCQLzY/2L/AMJU8+pk3G7b5cM6TrGpgTDFuE5iSWd88aqjS/MTvcphvec0HMwSjSbp+L
	lqK2oT4YEWlEnCVyIdJljYiy4BRhkNAnmB1tpQUChY7buHLH/77Gv2ur989/q7y+jxxZ71png32
	oMKIOQJ5pCqKzVaz+biZLRiowvPtBaQkTaSkq5tqf7n7O6KIgNZngVqA2jHiGdAERtGt0ZXB3Ga
	6OlsDDldoW7zug/4Tl4irs0Hj34fQVV1P7jNudSkE0x42Au3RBpfanpkZH5+fL/PZIMSNwUw=
X-Received: by 2002:a05:6402:c2d6:b0:6b1:b9da:2047 with SMTP id
 4fb4d7f45d1cf-6b4d4688ab9mr1142320a12.16.1793364623523; Fri, 30 Oct 2026
 05:50:23 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:20 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:38 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-5-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-5-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:20 -0700
X-Gm-Features: AclHuK96Zoq6b12CCYQmhyhkE9oH8gdbmzobxXBS8az3EflQGAJeY3UBNWa_dYg
Message-ID: <CAFLszTgOSFyu8PLvYwpTT5iOkENQWthmNnROrZoVAhXnCNG2KA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] libfdt: overlay: Factor out fixup and fragment
 path parsing helpers
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> libfdt: overlay: Factor out fixup and fragment path parsing helpers
>
> In preparation for updating the base device tree's `/__local_fixups__`
> node during `fdt_overlay_apply()`, factor out two helper functions in
> `libfdt/fdt_overlay.c`:
>
> - Factor out `overlay_parse_fixup_entry()` from
>   `overlay_fixup_phandle()` to parse `"path:name:offset"` entries in
>   `/__fixups__` properties.
> - Factor out `overlay_split_fragment_path()` from
>   `overlay_symbol_update()` to validate and split
>   `"/<fragment>/__overlay__[/<rel>]"` paths into the fragment name and
>   relative subnode path.
>
> This commit is pure code movement with no functional change.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  libfdt/fdt_overlay.c | 226 +++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 154 insertions(+), 72 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
