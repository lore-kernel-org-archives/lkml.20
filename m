Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720AD25392A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374712; cv=none; b=YOYqXbWU3REtgf3El4kRiHbrqJd9vmceTKbyQkr5FTOdgVj7av6oY1QbZW8xe7VNn6KMDNEL7ZaxNzVKLmddHIFozHJ5flgdRf8S8/hVT2AUxG6KYuYfHtVegYfZ1DolHh6k58hUEfE50zx1iQLmyKmINzqs4J5Xxo5g5QYy7PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374712; c=relaxed/simple;
	bh=STCPiFVncmd0trs86+Lefpabg7jITOU//ioTqNGMZE4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=jhhohCvSdvptjRcG/i9idXPnpYrLCNbXSQgeXChFFTRFQF0gADt/evA0UvBghiACTWzjyEVsFL+h7h+Pod971LVlLo4D6NyWDoIFW/OT1rzt0LyVV4zCJAdC5WNjN+X3rgP09FRfTqXTReVL8aL1aOH/gLvMdJSZNw3QUvkGqO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6aDvk/F; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6aDvk/F"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6711f05fb14so1064776d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792374710; x=1792979510; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=STCPiFVncmd0trs86+Lefpabg7jITOU//ioTqNGMZE4=;
        b=e6aDvk/FALY6xCNwiCWrVHblfXmm2njju9Dsv73Pf1wVGOejVJDB3oiRpyiZxrnYp3
         9MCP4ro27pMVQO20faTfYuoAZSlaxq4vrbC0yC5qp8VYh9A4lG90y/s9sR1Vrl6Kzogs
         5xVvKLl3cijZAW11v96WEzKsa3THJsENmuGtdRlEvroowmlEfc4ZTvHlKIpIAG5xBsu+
         6vIEyj8YCBoqaXQFck7eQuvFL6T8kVtzQgxXC2BrbsmMIvNh2uA7wp1CsEHh2zO0Ty+n
         JhieXzl6ryBIsYngFx4md0RmZ2z3evYoDgrVRXU0JSF3R/3oluJKN1LCNZmxU+ehA2jK
         Mwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792374710; x=1792979510;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STCPiFVncmd0trs86+Lefpabg7jITOU//ioTqNGMZE4=;
        b=I1ievxzglZ8myK3kH+jCX1EpTPX0oHdwMIrdW4xO+r2k9Bm8MERyTQyak/YaSk8MOv
         /jLJVb1jrt9T5KFXx0mYDun5vo+094zIhl0Y4lBk5FUBNzgh/mftmFCFPFbufwuH8ufA
         SVmi0UB91pLT+2REeJfhGDvSYueeaahcj1Z3HKC8SAkEo4zoLTqAKIcdxwRlYrrfOXnd
         AFFSlhmnio+YtwHBA0gvSTprClRjW+lnvznc3y2iS6E5iWFQnrRiC7BG9uwpV+mX6ehC
         PDeoV6dv2utoFdPeQaIm6tmL9190RyuF4Mr7uSxOPdcrQqlTlZPEyrTi8ZISlg50qRi9
         OSCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPQc2n8lovvEMo/jviGf2aYghHlEuAbDquAh9cbFTVn4u75VB7fl7Sxo9rEhADg/Z0kLIxOV1oNpzrJq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoGte5ZAdOYy1cMVApBhaP85DV4BQ2DqXcclo771HsImUSsugY
	IknlsiYzd6/aaxLfxy44CY+S+L0xzGelTsGC7Ih+zPwm4JZGe1vkY8V+
X-Gm-Gg: AYBFou38QX8YsvSMx9/mNtlAIjOV2XOsBohza4YEJpB6Zck/yuHFBHVWYJfBMiGKUHX
	r4tRxdQH8exnGu54Amh1rLP//o0ELbbiWfRdRuS++RRshLDOT4QnzLMVskySL3xnpQBsmjgFHQY
	xA4PXQG+LXftPjm8FAhEXXP7T10bxV8fSU+NAYqiw0Gh/GftfBSZAWMHpDSloxZ3cxQAQfQb7od
	mhOvvTMwPV+0+y759jelxBKfuMyAS93dn3btlY2D+YtrT7/oa2YYGBFbOARTotfuDgsZziRlPDH
	4X/wxK7yvBrGkYvwD5OV5ODp9MNThxxjmQalGvkDztT0QRk9pPrcdHjcHYP5x5FizmiS54jVqA7
	HJm1J8hWhmNR1VyIPEVUcxDtNldj9ILnJRXrkZ91ZonQLKnFm8yE4Sxy1fZMJMKBN2dUVIvYuM3
	CfZn8rsVs2LdN6fx5q05bPnE8cljfkoUrfg8I1ODrMtHnmF3g7byIpXDRvXpH4ybBmJzr+jRCl5
	XIM8NZXrlx+OzhsEr0A/k8w1+LWU/spHK3oCgKN2T2B7zMcXW1uIbALwOD4wUChceAjqyxdZmmy
	6CE=
X-Received: by 2002:a05:690e:14c5:b0:675:1102:ffa5 with SMTP id 956f58d0204a3-679ca4d4299mr2263242d50.3.1792374710494;
        Sun, 18 Oct 2026 18:51:50 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:135::8803])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e58dfb98sm35645197b3.24.2026.10.18.18.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 18:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 20:51:13 -0500
Message-Id: <DM8FSLOD0H92.5QQ7U2N7KDZE@gmail.com>
To: "Okhuomon Ajayi" <okhuomonajayi54@gmail.com>,
 <outreachy@lists.linux.dev>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: octeon: remove unused cvm_oct_transmit_qos
 declaration
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261018231538.74139-1-okhuomonajayi54@gmail.com>
In-Reply-To: <20261018231538.74139-1-okhuomonajayi54@gmail.com>

On Sun Oct 18, 2026 at 6:15 PM CDT, Okhuomon Ajayi wrote:
> The cvm_oct_transmit_qos() function was removed by commit
> 6568a2343639 ("Staging: Octeon Ethernet: Remove unused code."),
> but its declaration in ethernet-tx.h was left behind.
>
> Remove the unused declaration.
>
> Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
> ---

LGTM.

However, please wait atleast 24 hours in between submitting patches so
the mailing list doesn't get cluttered, thanks.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,
ET
