Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794864720;
	b=ojSB3+mW0iMRxsx11sCwI45GAIvwoGGMCxbD7kGn9es9wuGuUhOJmmw4E+Rn3KCrL+kf
	 fjkrsWRi1W8LZHXEmKJskAdF88tM7nSuCzwBs7iWVMuVCyUdBzo2+Xr71rxFOiEQ5UOJX
	 XIGkA1kxLwRhxgzvuBa7KJl1Ikip9Uj8qfnN8n2+ukkiL3llhnP5Dk8Ud5HkK9F2IK5U7
	 TGlQBxVZXJSMFnmh2d1piUBS76JkLSRejyBDkBe1b6KYmKH89eTtZkszsaNctg+Bsm3vs
	 JZ7WgaF9c69IjfzRJjv2BA4CTJCVsdAhdccX0gojK6NElCOgXvhFzmaEhhavns11HhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=G4o9Ag9RcoeUkszWNt6V7tsPT1b+iCEOs0YeXN+LIJw=;
	b=Oq+3ZmqbcY9D7TXfjcz+thhNMLE63PFBf+ffz3I8o75gErdz424sWMVcnsjFT+W/DAc+
	 +WyDbwMkipmbhLMXDGGYwNvnlIfhT1yn9QKqGDin1DCpn4rop3hHJNPERxaWGwMRE2Pau
	 zxbVwQffe3txYY5XctgOxqxY8lS2MVp4hm0TsSeoo2zChBezmwFfxkqOrDuXXJ0kLpfIE
	 y+LEI5CTlnH/D6ObRy3BdloXmo1C3ZfsACJyjuBRkcv6mcE7V+lvmmPh9IrP9cz75cxSB
	 KmQLqyIjZvFk2lXShVYYw35wTKzvJDX47buuwR6QaXt0RCcvcbK4p4GMK2S9BnsnCRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OwneJkf+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EA6606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29EA6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OwneJkf+
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-18818daa3e7so185701c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794864719; cv=none;
        d=google.com; s=arc-20260327;
        b=O8Vd2+UYmA0Ea4mN3MGbXJ0ol/PAiEb1TvM0i2a++lb3qGkMhJNKC5YUufD5EwTwX/
         bbhsoR1sxqSgdVMyG6JVSKGcJK4EkclpU5GgCXZPogCxDsns0vCtzfUSC3aqbFgQXFlu
         W58roKGhxs4DFU3O6+wmzRkCtG/CktGji8X3Eo/8ZOnrWgNcid/fpkMAvpHeuE0e+hLM
         QhSX4nAMNtFOxZvjTtdoIOyRNS7gG1U4iV9ug/yAOxznaILeL0M+AQVJc05iQc0JsEM8
         35GWYg3RTOyrdKnsQkhuOcJLSRYL142Vqqr0OQMNpbvNj/Xlgu3eNkbWECL10lMoxCCK
         5MCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G4o9Ag9RcoeUkszWNt6V7tsPT1b+iCEOs0YeXN+LIJw=;
        fh=PGL/6GimsyiEkApzc6J//dO6oLZqy7uAAoNEBtCsSmc=;
        b=lCqee34owzc5t+DcW1qTUX3DT0VdNxw5IlOcWEzZQYVpluiML0WNSikQ8ya5kujuce
         zV8/mBHo8LSBioEMZXZVqSDr50mXcBTr5pEjbt7YpV/Wzth6HyL3fAM0JtsrTf9T6nTU
         T7YzK0T8JkePL6t4AxlK+DxRYAkNgfCMGlFri0Sp2VfJT8QrMSwEdrbyVlicA0cVS1SS
         Qki61VrFT9ZvPRjjQyZMDniyf9tGloSqYm+lccnDAmh3yKgSeiO4nXlJcBsZLz0cgtQs
         eRE3O4bl73wW/IYs4pASxoPxWj18+l7lKBIQkxSR8z2EzjrZYVsDuTciMbec9fYoowrr
         eiyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794864719; x=1795469519; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4o9Ag9RcoeUkszWNt6V7tsPT1b+iCEOs0YeXN+LIJw=;
        b=OwneJkf+5ojqaPJ2gRW+Oo+nEbCxBCTDK2DYX4H4wPvgh1t3tqmbosJ163LIAaJgpE
         IK94PzyjP9LxQeZY85tlppYEjz9J0XesPxHMA0ShvEaZsTpmveRVs6/LWq9N9+Hazpeb
         ikFExe6Ha3ugs73M78Bi8Ah43TykZFwDAgkjsAjiZNlCpc4Isc3L7UAxrK07GFLuEoQB
         90/4tAYks04xmSraRvdfHM/RH7Qsu2f+V71Ly0zuu0e+CSOsC14unNH3/PKirOaveQHy
         jalHF2RLMsFkrXmKD6Ph5fMIDij9T/xipAVlViCfAjPD+EhMzySQxwcYxTWrkk//00Wh
         og2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864719; x=1795469519;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G4o9Ag9RcoeUkszWNt6V7tsPT1b+iCEOs0YeXN+LIJw=;
        b=gDmj/QKrWM/ix9SizgMMIKfB9zNykMm6J6MeziwNYINTkTc6Z+paCNDvDdhrL/k1E+
         bSZ0cxbRkJ1OSb9ieJz9lRYfFGwS/AheXDYJNE1HoRhw2GPkfPq2HvH8BqOZMxCGILUG
         ioLAX5UyEQOl/xZvbGhQOuqI5QtvEKQh9OIO4V6gh7VYf0miDyKmze+vNh+bYaayPr5J
         e9NsnNYHtKO0Nk0Icu5GLfK5P/Ydru6DbLD+DiFFNtgzBKdGtpWA2yplcMIswIuqkWQl
         5YTCUtDT4kLJ6d219bzGow03uBrOuvwrx2YUNLwrk8zgqraaW3REFPGdynJ+tgkKMceI
         MaBg==
X-Forwarded-Encrypted: i=1; AL+hErFm9O9rxSzF23j1jFHQx90RJUYgy2g3hiIrMpRySXyTPL6vADW9CgTIr5U9kIZxHLXp6b5hkC5svWd4P7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5Enqn1+PnzA3KUd4dM2ug9xiqGy2ldDZiW0GyX8Hr1noag3+D
	n6O1+HboYTcJTCfTbMON5ZTZ9xN9qsqo3TlJb5AT29WpACGUpmKt2IGGwlKNA2KKR1qmcCHe3Ie
	OZQNOQwB+rdF845hnA9NDpYx3tDcHp01i0B3NXf0k
X-Gm-Gg: AYBFou05wxAtO+FCALolrFTbHp1/g08CvPZcqjCA3MJBTqu+nuo4iS7Xwl99DO/KK+3
	1YTnqG6oZKniHnzdlrWTj6jQd9WvT8JVU5UiEGjmsbhH9BUg7X2WzZlazFpE9PbGELjwVJjCn87
	J9HpdIg6XWV9uwzQlQEPYBpLvAvfdNZXNZy/h2hYWG5cp/32T/AB9wluJId9YeLro7H+hPBpudx
	Zj12fE0Dv9O5xJSwhskGncvgZMOenkYHoMN3mqK/Ex1jxGJuFGOQYXCtUJgT4z+oEfMMh0xh2MY
	ZiwAIJ1eU8k04tWYdeYezXYEwTrn4D2gA57MPeKz35g//BsssJrZFNJKt5xXw6U7rLMf9WRbZ55
	C/j7u2awTbF6UXYcbqroH21Ht1g8OdwJNQwz7ltc8uMtCvX8gyrhoR7JrJKYAePEnUe0a
X-Received: by 2002:a05:701b:2059:20b0:1ab:90a8:87a2 with SMTP id
 a92af1059eb24-1b53a44bcb7mr611828c88.11.1794864718626; Mon, 16 Nov 2026
 13:31:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116172836.2254432-1-vdonnefort@google.com>
In-Reply-To: <20261116172836.2254432-1-vdonnefort@google.com>
From: Marco Elver <elver@google.com>
Date: Mon, 16 Nov 2026 22:31:20 +0100
X-Gm-Features: AclHuK-C5vlGkoSLRzxus7nNtda_mu4Fl9LCDPi8z6XuLwvaDM4K8aYQXNlbmiM
Message-ID: <CANpmjNP5ShLAg8NcAc3aj_VBDBnjSmObRdZydnDxg9bDscqcAg@mail.gmail.com>
Subject: Re: [PATCH v2] checkpatch: Add context-analysis attributes
To: Vincent Donnefort <vdonnefort@google.com>
Cc: apw@canonical.com, joe@perches.com, akpm@linux-foundation.org, 
	dwaipayanray1@gmail.com, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, mkl@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 18:28, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Checkpatch doesn't know about the context-analysis attributes and
> misparses annotated declarations (e.g. mistaking __guarded_by() fields
> for extern prototypes). Add them to the known attributes list with
> support for a single nested set of parentheses.
>
> Handle context-analysis attributes with parentheses like __attribute__
> in annotate_values() so unary '&' in their arguments is not mistaken for
> binary bitwise AND.
>
> Cc: Marco Elver <elver@google.com>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Acked-by: Marco Elver <elver@google.com>

> ---
>  scripts/checkpatch.pl | 37 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index b8b64f720191..5ca2a1fc2607 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -527,6 +527,32 @@ our $InitAttributeConst = qr{$InitAttributePrefix(?:initconst\b)};
>  our $InitAttributeInit = qr{$InitAttributePrefix(?:init\b)};
>  our $InitAttribute = qr{$InitAttributeData|$InitAttributeConst|$InitAttributeInit};
>
> +# Match (...) attribute arguments, allowing one level of nested parens
> +# (e.g. __guarded_by(__bitlock(3, &bits))).
> +our $AttrParens = qr{\s*\((?:[^()]++|\([^()]*+\))*+\)};
> +our $ContextAnalysisWithArgs = qr{
> +                       __guarded_by|
> +                       __pt_guarded_by|
> +                       __must_hold|
> +                       __must_hold_shared|
> +                       __must_not_hold|
> +                       __acquires|
> +                       __acquires_shared|
> +                       __cond_acquires|
> +                       __cond_acquires_shared|
> +                       __releases|
> +                       __releases_shared|
> +                       __cond_releases|
> +                       __context_unsafe
> +               }x;
> +our $ContextAnalysis = qr{
> +                       (?:$ContextAnalysisWithArgs)$AttrParens|
> +                       __rcu_guarded\b|
> +                       __no_context_analysis\b|
> +                       __acquires_ret\b|
> +                       __acquires_shared_ret\b
> +               }x;
> +
>  # Notes to $Attribute:
>  # We need \b after 'init' otherwise 'initconst' will cause a false positive in a check
>  our $Attribute = qr{
> @@ -551,6 +577,7 @@ our $Attribute      = qr{
>                         __ro_after_init|
>                         __kprobes|
>                         $InitAttribute|
> +                       $ContextAnalysis|
>                         __aligned\s*\(.*\)|
>                         ____cacheline_aligned|
>                         ____cacheline_aligned_in_smp|
> @@ -2141,6 +2168,11 @@ sub annotate_values {
>                         push(@av_paren_type, $type);
>                         $type = 'c';
>
> +               } elsif ($cur =~ /^(__attribute__|$ContextAnalysisWithArgs)\b\s*\(?/o) {
> +                       print "ATTR($1)\n" if ($dbg_values > 1);
> +                       $av_pending = $type;
> +                       $type = 'N';
> +
>                 } elsif ($cur =~ /^($Type)\s*(?:$Ident|,|\)|\(|\s*$)/) {
>                         print "DECLARE($1)\n" if ($dbg_values > 1);
>                         $type = 'T';
> @@ -2193,11 +2225,6 @@ sub annotate_values {
>                 } elsif ($cur =~ /^(\\\n)/o) {
>                         print "PRECONT($1)\n" if ($dbg_values > 1);
>
> -               } elsif ($cur =~ /^(__attribute__)\s*\(?/o) {
> -                       print "ATTR($1)\n" if ($dbg_values > 1);
> -                       $av_pending = $type;
> -                       $type = 'N';
> -
>                 } elsif ($cur =~ /^(sizeof)\s*(\()?/o) {
>                         print "SIZEOF($1)\n" if ($dbg_values > 1);
>                         if (defined $2) {
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.56.1.703.gf848ed807c-goog
>
