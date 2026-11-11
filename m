Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371906;
	b=qrwRJZ4CavGXS+m9NG0uh/j//lSFdWEGOqrMM5yjwLlNFO18hp4xO9CCkctWOKx3B7uz
	 MWtvf/2LanjE3DaLCNJZpgTVvvYBNt/BOoovgVaccYcnpljDG3sx6EnqZuQW2lwQ+XzGy
	 iWCVlkmpVUUjm7B4xQRh+Y8r49+iGykiPv+DFecI/pFGt2m7elCNaL6Iiq15rjqSLc4cH
	 K6vJMu1qn3rVbI1DYiZ8pgE5pHhNYuVIJHz+8/oz8Imj43elg7yIRrGt/vxICL6XKZYu4
	 gDBS7agqYfcIsODVsqduw/N4V6TUzBpy8u6Iy3tcnXAOtIN8d6Gy+KXmoALAkJrlNQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=8B2GW6e71lZiX0sY3qwe01sHxxOkJy6TrHPHzX7My3w=;
	b=za3aBkOrYiit2l5t7U50ZNNTMh5PR+9R/NSS5nqiWqQxWxEGy1477JnJwkApMf3Hl/0D
	 +88WDsrQcjtBI/+N1JHNrhvbRWKGGb6Y1PRHXG2NQP5outc+OkEaI1/VLgIXLTXq4HDQb
	 cc/11ImtuxKvqGBrLfGVtYCXLDsHl2DLPYvaYtC1ipa+ug+GePkqIf77/2Z74n/oB+zA6
	 RX2RweraMoRKiQ+NG/3XAqxlx5dzRYQXrtT18ctQLx2tYwjrnK7Q9bAbM3rsQmd20V+OQ
	 fjNvzpGvW7ereTwiAqxWkSTsgv5ABk8zGepDLU3VL5iv3JpItfKNmBbWz9dF7Ehf7kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="T/ySB6FW";
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DD3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9DD3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=T/ySB6FW
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9e53d011eso20431945ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794371905; x=1794976705; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8B2GW6e71lZiX0sY3qwe01sHxxOkJy6TrHPHzX7My3w=;
        b=T/ySB6FWFbRF/v3qo3NX2QSZ8JwSxWvZWkY2xJoXAwebeILRdobgfvMoiS9pQC/FSA
         TRl6NtbfAxJbrPJ3Uomullp8vSpOMtvNYt0CI6kZgsLnn/6o+NIpeAw9Jsa0OFpqmvNH
         bgoYAcV9AajGHyEWqCMBHvu2p/uhnSLVRbXdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371905; x=1794976705;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8B2GW6e71lZiX0sY3qwe01sHxxOkJy6TrHPHzX7My3w=;
        b=cJv1d9s7K2Ky5QitPltu+Gi5lwukubZtJjxXTaNv8Grwe6w94spTqNw3yji/BtnJRX
         AAqop20ROSqfdvCNsPkBWbAlXcfHbXXVkCXKaR1mAtFeIOOPoieNu47yP81l0Em1yClW
         1F1HfmN/g7Wt6QgMSn097OHNGPPBjwAJGAthThoHtn8s11fUQxvo3u+N9qxMZwqqsqYG
         /5OIdHdQtA8vY/ra1ttyPjUdGlWdbL55rjKa+n37W3MI1aiGuigysTDYuuqgVt8HMHvX
         rrIGhpXouuimO+Z2Uw84/zfUxwhacSwyYlE1YzOanEs+tSmZkgHo5RPBc6nt+3mRIKqN
         IiLA==
X-Forwarded-Encrypted: i=1; AL+hErEcNIcn/9haYvuxQnLbGkpB3uBw37TtvxuLOM25wpgID7itjVzQM7ifFP7YUXpT7kNz8WCN5cw1UxJO+7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fq7lSI0pb+ZBiltuOgbA2PNveYOpuoygXWfdv2akH1wghUYwX
	atHfMDFSmO6+ytrQwUu7g4MpFY1GRvJ/6jIvTOBLIwNRiyV49OvjQpp/Y83tOjRasg==
X-Gm-Gg: AYBFou3yTJSMmf5FR59S31Yeg0qxlh7eLrQa+IBZ/33W844BfRS8SXYxHMOh2dPspnB
	MCgDlgOYfvfp/JpioDbJqrYmhZWnLm3z/NopJVzyFMH4PKxDnh5d5U2YDH0QA9ma3I5xp0VQcUx
	iFfBp1Ej9nJEOa+b5yQSZL2jGpQ1WetMTR1Dwo0O6bpnCa6lQZ2pL3t8eSZkrvfki0WxsVLlEju
	ZZYEnSfOKFfua5mwGNz+IzDiK+CMOU5NcymIjWu1B70xa43ODVj7hVPgnQF2foEyJycpeOFJSFr
	rrvjgwI8ZnlkmOrli7nvX19q2+ccIsCz8Apq3fI9RKaUHywp0xDYwp73CbU6mge7vLYCbZImaFY
	0IQANxHsPo8gRpCUiCKesOBdZdxJDaGF4y8BBxGynWUgCugRlhT8nmYY4XfZps8HGl0UkAYhTBB
	kN/w1/rp2ZVAypfmzCFHBEEwjIGSHpoQSgZgwyuVQPMhY9k8mwu2dpNnX7e+EYa3IyXV1QOEV68
	Qlis4+2FSMDZlaH7XhoXdO6r1Gj8lemuPeEL1241D7Rpg+VzcUSoym9l0Fb1i6SkmcDGn+D+Jw3
	rJTE6KpMqBWRv7pfbuGWNpZMVQ0oFcuw3WpZFa2oQS6Yz+TLH24z+KoI9f/XDl6zsCls8g==
X-Received: by 2002:a17:903:2284:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2edd77742d5mr16954965ad.29.1794371905055;
        Tue, 10 Nov 2026 20:38:25 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a329sm15962365ad.23.2026.11.10.20.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:38:24 -0800 (PST)
Date: Wed, 11 Nov 2026 13:38:20 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mm: remove CONFIG_ZSMALLOC_STAT
Message-ID: <avPxIH-JtqVvTzBF@google.com>
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
 <20261109-zsmalloc_stat-v2-2-caee41684aba@gmail.com>
 <CAKEwX=PNpMr5x4gTo_OK5D5EgKPDvZx2e2=95-4_SV8zq37VnQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKEwX=PNpMr5x4gTo_OK5D5EgKPDvZx2e2=95-4_SV8zq37VnQ@mail.gmail.com>

On (26/11/10 08:03), Nhat Pham wrote:
> On Mon, Nov 9, 2026 at 5:59 AM Xueyuan Chen <xueyuan.chen21@gmail.com> wrote:
> >
> > The statistics interface now uses the debugfs API stubs directly, so
> > CONFIG_ZSMALLOC_STAT no longer controls any zsmalloc code.
> >
> > Remove the Kconfig entry. Replace the remaining CONFIG_ZSMALLOC_STAT
> > settings with CONFIG_DEBUG_FS=y.
> >
> > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> 
> I wonder if we can just squash all 3 patches lol

I agree.  Let's have just one patch.
