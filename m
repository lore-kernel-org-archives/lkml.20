Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8C147F3A6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395701; cv=pass; b=YDbttq9ZIBUQx1WGhZt0VvQ1GFBj2xQGofnfKaBzdHyOKoO/Y3eBkuo6+KjWqgsH7H/kuxmvzBT6U/3vjbQsjN++bg35rTAF8bNTugE7ng3WoCGJvjl6qKHdZU5nWdU85xRm0QT4ZJSQQqjEpRsT4PeuQakzukAeVxw0564wkB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395701; c=relaxed/simple;
	bh=5VIeDJd02z5nU2Po87w1dBYicjQAW9L72ICy0GaeSBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RDMXNcra6mHnB43YVXk/6msQVyppbaWTLJev66MELkqTqdGDCUHGpwDIRqmjhyiv3+QxkNqpIJhAxzMCdBBbBB4lKTs4D4vY/SOdHMOqekhVVQjXH6EO3Leojs+SFct+fWdvIKZJ0PfnC4/HLirkJX0QfOdSQFvU2lUNZ0jZBJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCUgxhqF; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCUgxhqF"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dba3fa388so311944a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789395700; cv=none;
        d=google.com; s=arc-20260327;
        b=qeYnY9Ev2h1wa1oEvVnypeWp8dj/claF5XnO3flUoqHTN6N2j9HPB0zssjHMCTyK8Q
         Md/zzphI9QQc5bvXLEXcFnDw2357cuiV7+0tpljuhFb+JwqneJc39rEOk26UWbMjRe6m
         Smka5cto8O/Ch701LNBsX00SYA7yCRKG96X0/SQll/mMi/D836mWfxKoYqUrwB/v8HQW
         u6PGmAaYIfVK1T+xC7+BIGkdLsDD5BT8MQe4xQDU8oaUQALzMax20Zj5qnMl9BOOLL+Y
         Xz3J0WIRfwHHzq1FzMFR62v1uoVT7aZVcVTZKrp1L8ai1pHg1x8gOUjgvqymIsYmmid0
         hD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9wBaA/n/TmKjwu/wZ60gVcKCOeMtecNNHVqEiqLighI=;
        fh=aEhxaUQcAPXk2oVAuLoiDFHdiBRRmX3b6kDSS71jjAU=;
        b=KsS4xRqXqb4dgvkifD3xskJTjl0TO3VN3p4KaZDZWTWmzm81UE36f6jP1jUV27iyEZ
         qC6ttAnQ7lRt5DTvu3WPjQfB6oTrmmj3+M/Ie0+FBfpzfcA6LBz5OFJszRF8YWbBiWhw
         RIFRtXAwubMnGvpvORj3l0HWXD1LDlh7T8RSWcvgNsjBvBYg2QX4I70XvMFWHLLKbdkh
         yeydWdYbQBySme5g4yIeFyokw2uabhkFGTwkZIIIE8s6z8lPcu3JlQ7YLdd7/2/fZ4fu
         rLrIMDzYZzh/Nh6KGesrXxK/O/Jkx/MLm3O/p0ChH/Q0TGof8YGZwLKUf154F05P+fLP
         AUww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789395700; x=1790000500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9wBaA/n/TmKjwu/wZ60gVcKCOeMtecNNHVqEiqLighI=;
        b=MCUgxhqFXDtT0OMh1oNit5pnU685cMV1R6xIGR8+GNmpZCeI0COgMVBrch+x9B8T/w
         SMCsf7nHs3sw8zqWgFhyVi00jy4bXbK/Dj3GhLa8vIhHTv0Mz12KgZnGfSEgKKMRThB7
         M8XC7m1Z6E6KIXDXgXIR1oGApW/PB8NnJJZFEYI0iZFGApI3xUlN6Y63H/4yQip1EIFe
         PEtPhuk8rdjEk39k5cGRjTKbG0k3TU+9+T5fApCYWCIfRueu+eT2W+lfnusZdqI5skVM
         7mGImm19iq7REY4TI42uD6bGFLxghVz6eyP1EIaslnB/OZobVlYUmGbMxc9bmSXw+RYy
         eKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395700; x=1790000500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wBaA/n/TmKjwu/wZ60gVcKCOeMtecNNHVqEiqLighI=;
        b=jTIccmst0e6pTmIZk1lCX6m6yRERGJmp9cbu0JvTdzInHsBrP2x9R8ZCocXzOu4qGA
         SRfVi1+x/foD9hGbHMBTe7lq8xulDAHv1X7s0W6amRZ+TrAqZFZ933G+eZNKwYaMmn8e
         3tZ+gHVoe+l6Uy2iik+oQ949hSI9eebwKc4zeSRl5yNLmOCdGt+ucCMUPqKFKE8C4cYj
         hqE56S2FAWD0ItFrWnu8FxUijdrdnBNrsHQOaP8ffaSKHoJhDR6HLG76aQWXHrg0enGm
         ncKkRwGofyFdWoUItqmF4ED1zMjRM8o4OPV8JKCwSVa24VY/Z4DRR0C5WFFyEcGWPzPp
         8zig==
X-Forwarded-Encrypted: i=1; AKwUvBzTXbFiXd7xWowWm39UbafzukGaFSSJb1EIxaRRaBWVwfcAgUZW+fqAvmkDY6YpAt/lO72Wo7acJAcLSWs=@vger.kernel.org
X-Gm-Message-State: AFuF++ky1/VwncbfxbMvMN5IVwbz/qQSt9Zf/Izt1xghTxJUrEsF7Guf
	j+Cobwdj2GyXj6quAU7HqW3kewey2kPJyZPxkp1lJB9lLs4HJEUUXRSq/UtAuwn+5eBAnRwOpVS
	zL4p+oaABTwDssrO5nm64iP/yQ1dfpxU=
X-Gm-Gg: AYBFou3TdfMnReabIddcnX4L7B/96abPjxdLROjJMr/cc7YKfxOctoPpEu42bqFFnVm
	AeocMf0MQ/beGu0whLNR3vWPsy5BcUnnbDmKc7efPYlA66c3+5bKR4iRem+77ZHFAvKtnB/aT/S
	X0tXBaxsw1z2mvuNHgU9bfVcvD/dlrff+vieZnlcjsG1ZFbkGvLfZQ4KAIkaY33XLI7pbUdTPk/
	BxgZFq+fBRnCDUZzsL6fckTcEnoEKjF3NV1j3bmmth3k56phROTkmFJqbcb+0Ttec/wLq0MVwGr
	Vq/XAeU7ypoN/wod1n/fT9u3y/7d52K9TqSHOE+KBhyXXICYWbnY4SlK9U72/v9a2I75AP7HEbw
	6caDWMET3joGrfFA3qBwzVi0pdSotkPrTbh1TFk8BUQ==
X-Received: by 2002:a17:90b:2885:b0:39d:e75d:97ee with SMTP id
 98e67ed59e1d1-39dec20812bmr3973206a91.5.1789395699726; Mon, 14 Sep 2026
 07:21:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADnq5_PNt5Huo-bk=tqdCLorUp3BDCtdGmaFJDxfVbcKx-CPoQ@mail.gmail.com>
 <20260913005048.1167-1-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20260913005048.1167-1-atharvatiwarilinuxdev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Sep 2026 10:21:27 -0400
X-Gm-Features: AcwNN1U5A3gc_t-YjPsElm0l5p0KUKIEFT2aA5LkNx_lSR2zyJsX3P4tqP1oEE8
Message-ID: <CADnq5_NyBdPbavmiPVdsHkP_Oi1w7ngX0kPSNce+BWN-YkuAFQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/pm: defer UCLK DPM enablement on Apple Navi 14
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: 062bel313@gmail.com, Alexander.Deucher@amd.com, Christian.Koenig@amd.com, 
	Kenneth.Feng@amd.com, airlied@gmail.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, ed@aicharmers.com, 
	linux-kernel@vger.kernel.org, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 8:50=E2=80=AFPM Atharva Tiwari
<atharvatiwarilinuxdev@gmail.com> wrote:
>
> > Applied.  Thanks!
>
> Hey, so im the author of the original patch:
>
> https://github.com/t2linux/wiki/issues/743#issuecomment-5347204171
>
> The author of the patch mentions this:
> > Combine Atharva Tiwari's delayed-UCLK proposal for 0219 with the Navi p=
ost-init implementation for 0218. Retain the revision restriction for
> > 0218 and the revision-independent 0219 match from Atharva's proposal.
>
> So as the main developer of the patch, i would like you to remove this pa=
tch,
> as it dosent give me credit, and also this is not the solution to this pr=
oblem
> as i have mentioned here:
>
> https://github.com/t2linux/wiki/issues/743#issuecomment-5608044095
>

I can drop the patch if you feel strongly, although it is pretty
similar your original patch, it just keeps all of the logic within
navi10_ppt.c which is cleaner in my opinion rather than pulling navi1x
specific logic into the core pm code.

Alex
