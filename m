Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793216200;
	b=V7F6cO8aCd0OZNYrk/zAQ3eN/AtdVC2Lcl8fylkpta2VfogqjJ/jYPVcA9uodJuGTsCj
	 oHGL08zrayvNjoUBTZBF88DXOeoZrY4Z4W7JXBcOc3MA5iya13y4jwal7vtXxSjKEKcnx
	 pVhQd4drVR+wWT6cS967rlLV/K8ZYtoPZKChJyZOTQzEOsUZ653xVIBY+nSXg4mBeOgD0
	 Voiv0IInMoe2QFLKMjtX6ciZmmsnOr3SiwMZ3AUN5yEEo9iZu+PJ/i+dX7w7vMDpUNviQ
	 QrQwKKmMg3l1CQ8yujS+k8vZq4c7lm4pvhdwfcwFsVh8CSQUNYoFE6q0LOj44k+P24g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793216200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=UgVj7cp8bikzxjiNp3NE3CNorNbMjTnkuaG1LUbFxQ8=;
	b=HX9HcX5HbH6agKTgiIQpesqPAif6mD3YyjP4zDficew12mKpQFKN6FrKJt0e+pRUbQRH
	 6EMj+OdkhlekacvCgdZ21AjGy3Z51inX0+jaFh9A1nM2JI9juMMd4AJ3bEf1718NdlTMm
	 4Fqn3HDQqqZytuNDVp6h7Gwqy3B45ipNwNS23UXl4EJXIs0QJH+VIygfSi8pNVhDltmoN
	 Cdr7sMsTbQ02K+kglTpmzjAMkAjreuX25G3ndbXIt6Sk73QbhsTEwKssPP1cbVTafC9Xt
	 iea3spcD1rIvSE+3RiD39d6aLgolIwGUjC1FZzwcTEssUBpP5E7LCZKOXb10dawK54g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ZMuBTFnl;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383C7606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 383C7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ZMuBTFnl
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso2221144a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793216198; x=1793820998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgVj7cp8bikzxjiNp3NE3CNorNbMjTnkuaG1LUbFxQ8=;
        b=ZMuBTFnlaMBM8I0FzYmYY1wh7tuBLSv7ijXilUB7wJFJPaHkU8GgajA7hBM4YqFBXM
         R8rxGrucp2NW/UjWK7Mk6yy9vZz8lWaDIycZ9+oM4k5eRjSk3qg4l+Wb8aOlPxSg64Ff
         r2/bBwmcUABflEoKkVYqgpl00dHCg/KBLYWro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793216198; x=1793820998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgVj7cp8bikzxjiNp3NE3CNorNbMjTnkuaG1LUbFxQ8=;
        b=W/RdIuGpyXAU1w5RtaxQ64LO+IhgJXhpLjmspsCYclREsNZp0zW8wSShDw0rQxvBJa
         M9NWnudbYD0EXVQV1Pj0QAQogQUXjIOQsFXWN/tBGZvTaQFycmf9kMz8isZXRD8dPTDv
         e13JqkHJI/e69DehnDr4/lcLc5LAAjHa7n9/sJVzr2nl7hfYj60xU0ztVc5M6tEfSSmb
         /1ZJYpDQOFq9IS/VO2yEG0jgEh9tg3yEBRNomioI/Dt+R900WVRdfGHynMqDLCGkchvf
         +G3Gzu5cdr6iTjiOTj5PkTue0A+P2z8TLwZWh4KvqAMhh38najWP332dxpuRpqvBtrhn
         Cf2g==
X-Gm-Message-State: AFq9FYLPunUpo5UY9Ky44KjhbO/MFT1D832UwpfVzJnKBjupMsp5cHMX
	qQ7SWtfyoHFFAwfLKKdWFckUmhC3Ah/2UktWKhwzSoamQwYQODAMXzPBmHpABwh6VbedCTslzZ6
	7Eb6kfaM=
X-Gm-Gg: AYBFou13CVUp8LhdZvgcujRpKhBGbPFaksJ+pdNrLp2thn14w3oLl6faX1v5fd1rjES
	pG0jSLRsRwLvACTYB2/ktVjAxNAeOqopiI/INRRKI6CetHTvPNKM3Em5Rnk005m73L6CMCz6sy6
	xK3VODXUVhJ+qPPFJANCZWTP6wFYtXbQ7Ul58ezZk/QtxxgdW5QKer+cfXIYdWa2vMhuu+iBDID
	hd3zarhSFjSzpC1l63gGpbNsuZBHiEP49KaL0iQ9Sp8ZYOJWeqsOcvFEMCc6e5PuZdEEx4MMMZD
	CLTdI1TfmkQoVAETr4dioVBb31yUEBHU3fycV0wjIceGemroKHq2a1WV/Gy1vBqnaGOqwFnClMn
	IEjV9oYzXKbEAuyrM6YFlx2hUgb4hNWo/dxnslMPgKnpBFhH/kZjOSsepHlHHMIiYqfwrBDrikw
	h6EahsEaF8JbFhSKYdsmgqo919iWUECsjg+/mGDqzhNg3SaR+zVs0aQfRWtggkaceQAGGVE0eEZ
	tp1BSkqbBJuX0KYEzFRLtBEBFMdrBP24UXIb95zVzH4FZfqwPpSfbKIt7gGtJ+J6NDzTJBwQgn3
	TVXC1eeCB07FmHPlAPpYbgMK6upb03tQ8qmJpfYlUH3wradk6gBh88djjBp8rQb0WETtyTrbuy1
	mflds
X-Received: by 2002:a05:6402:5489:b0:6b4:201f:17b6 with SMTP id 4fb4d7f45d1cf-6b49cb4f816mr2442513a12.6.1793216197604;
        Wed, 28 Oct 2026 12:36:37 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496023595sm1825000a12.9.2026.10.28.12.36.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 12:36:37 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2e8c710847so188317166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:36:37 -0700 (PDT)
X-Received: by 2002:a17:906:2dcd:b0:c49:cf3a:a324 with SMTP id
 a640c23a62f3a-c49cf3aa682mr79949166b.22.1793216196830; Wed, 28 Oct 2026
 12:36:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pdx86-pr-20261028113441-148823082@linux.intel.com>
 <CAHk-=wjk2f+Vu656fEa7FOyHHaFe+-M-GEwUQPXykaYoor6A7g@mail.gmail.com> <112173bf-15bb-5a6f-e3d9-73c7675de537@linux.intel.com>
In-Reply-To: <112173bf-15bb-5a6f-e3d9-73c7675de537@linux.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 Oct 2026 09:36:19 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjsj5evNKrhY-LRARUGYXnNAPqK09GHAEJ9sNLoKn4dyw@mail.gmail.com>
X-Gm-Features: AclHuK8eek5pw9bB7ni6vcPuGENpOKcsC_mlYSxFUawUrF86ogcfsAaLxo_9u8g
Message-ID: <CAHk-=wjsj5evNKrhY-LRARUGYXnNAPqK09GHAEJ9sNLoKn4dyw@mail.gmail.com>
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.4-1
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Armin Wolf <W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Oct 2026 at 09:26, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Okay, thanks for the feedback. I'll try to leave more out the next time
> and/or write it more directly to you specifically.

So yes, it should be to me in the sense that it should explain the
pull request, but I have actually suggested to people that what they
should think about as a target audience is something like lwn or
kernelnewbies or phoronix or similar.

IOW, if you write the pull request message to be of a form where "this
is what might interest a wider audience", I think you'll automatically
also end up writing it as a good explanation for a merge commit.

So a merge commit message should typically explain the "overall shape"
of what is brought in, not every detail. And it is typically meant for
an "outsider": not a developer of that subsystem, but somebody who
maybe bisected down to that merge (I find that particularly during the
merge window it's often useful to use "git bisect --first-parent" on
the mainline kernel to get to a "which big merge caused this problem"
before delving down into the weeds of whcih low-level commit it was).
Or, as mentioned, some outsider that is interested in what happens in
the kernel, but doesn't care about the exact details of every driver.

Because once you care about one particular driver, doing a

    git log drivers/xyz/abc.c

is typically *much* more informative than the alternatives. At that
point you get targeted information about one specific thing. That's
not what a mainline merge message is about (unless, of course, that
merge was only a fix for one single driver - at that point the merge
message obviously *is* just "Fix driver abc behavior")

        Linus
