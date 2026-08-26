Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C549F24DD17
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784521; cv=none; b=H9IOkDqTczW5+3O3kJu9YcdacJelur3RiVzXlyuiF8tEyi5E3aCETVaC/7qTnY3esxU5+PxkiUOadMEYfsbzBPWK3lYAVqTRhN38AeHe+GN1SZ6Fn3yfjKyDjEIhKeWuChaiXpyh4KzZFZhpuem0uNMUHqFKzdqCWfR/QqbmHJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784521; c=relaxed/simple;
	bh=xzmAEInDz857u2Jr0pvQVTHNeTTi4QZmA77e1G1h9tY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqAo7fmq4W2/o/8iS6c9c8JHlnJIpmSjy8lCyzmXo4pofPnPQOF5YpRTYVayVKd+GdzXayYxNrKI+DmQw1QO3tL/MlIC4AEg2t2FaPmLf01wkdl0fRMNhGZNknA1rWxrJmy/k6s7SPsytCj6/yd8P19Z25yK3wHSPNri6m8nDlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SjfgPyl9; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SjfgPyl9"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a5e866bca0so2054844a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1787784516; x=1788389316; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BabTwaHX7D5uldURRvLu8fbrYXwykwbu4VtBW/tOxko=;
        b=SjfgPyl9lnH1W7A3FW9V2AL1TSX0fB8A2yYx2OPQ5KgKNevzfEDvJPmyl/mZWeU21G
         4g/HARx1lB3ORIu8QmoZSa3s16fK6xTYizSlpxyWgUxtqCYGoEF7Hx4uxsA3eBsyOS2/
         eaE1I8+w5RQhMp7jzwmVUhBYfNP3hxSy/w31s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787784516; x=1788389316;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BabTwaHX7D5uldURRvLu8fbrYXwykwbu4VtBW/tOxko=;
        b=HPbFCMlQJMC3V0fcBPQHWuVa5G/qFkWzNMjWcOgJSKvX+e6LciSvbuYpfgTPI7TfjH
         JB5DLf85mz1NbNvUzTbsmD6m+Inyn+/2LdA4d7AYB4loXQSkSwHXM9WJsrcjx4C5fIqh
         n2xu7Isf4R8PON2YDrli8bs32FpG9z68ukIfIfF8/Yjdxl5FIeZ+N/2/2qURmSYqbXBA
         jFOpHJGf/OHF2+0a7HLjAx84vOBDnrzMTm/ImxILFPgf0aehYymbn/IiSReOqNnyuQlq
         +rmrehtwomiXjLrsQBG0FY5yj40EtPyuYwHNF80mD4K7KVXj4Fl3BH41wPOf5ve51dUg
         JZmA==
X-Forwarded-Encrypted: i=1; AHgh+RoQBxvAXOnuwvbVGqFx/ao8jFX1WJOsq/EFq8P3edPNjwoU2P9G+1b1FIS4VXZp4QR0RyUFrw63AUEGFxk=@vger.kernel.org
X-Gm-Message-State: AFuF++kw+7ecSk1FBGPh2fiSZvZxq8Bi3xuJfDAqjrKOvbXa5N14wyFy
	2CP8mkFzgLJSHsiHLQXkQrpfSIapmd0Xmvw+pJEwoG9zWzhR7hmtbmyp4sPA/j0ybvFFP1Xhs+u
	8Z5wBqEU=
X-Gm-Gg: AR+sD10WIF4pvM1QSNRn8dGeXW+HkDCbZU/dPdf3srbW/pszAZIlH3hs66H7ZIODl2Q
	QwVIrpuhcd3KlEtPNCL+uSuoyRodzAFOOXZD7eDvB0C20vKoGGzBGVsGyWPGfEwEzbmh0krG/16
	M1AM3MVt2gAA9nEFdyeOShkVBm8isW7zodXz5N2UiyNF8LGhxZqJPPlPq6wcmvxjZbknHUhdriV
	r6+Ijv9Lsu7ztS3Daq5333mhnJm8/62uHYdBHAkEH/JhjAdwdMqLH04/HCTV5XHSypvthVVYq96
	dpb/jRmJHvdNUtf97HjsvMXbz4qQQ2+mj6acaXKkQUNA73SHKghK2nBMy18GJ+F6l3Sa6TN7sHj
	ftXgtcEhSimsiTdB0GzyZbWEs7Yg74eNXhwV08gUs0kI5OI5A9rk04CSXOo6wJS4DHuuTpxbtO9
	AXw6Uxrr79PyU1EdjI1mVdlBME4hkii5GeIrNYYjl/GQ73dMRCpEIeKplL/HDsgUk69kZ7vJXW2
	Tsg0cs96I1HsNFw4gXB4a1Y2S/uZ08aMO6Mug==
X-Received: by 2002:a05:6402:1cc4:b0:6a1:8d1a:816b with SMTP id 4fb4d7f45d1cf-6a5df62b841mr13303302a12.11.1787784515528;
        Wed, 26 Aug 2026 15:48:35 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deb0277bsm4742534a12.30.2026.08.26.15.48.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 15:48:34 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso2506535a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:48:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqIuje+nC1/+zYaJ2TNLKKX6MK7CcQUBn527qKEWTIRP15WzwoJftLzAJ+mKmIL8q37rEfeexmX7xMaAzc=@vger.kernel.org
X-Received: by 2002:a17:906:9fce:b0:c1f:1520:4de5 with SMTP id
 a640c23a62f3a-c250bb50762mr1155820666b.1.1787784514514; Wed, 26 Aug 2026
 15:48:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ebcd172da92ef6a8aafb5f0c6f84d0c6a735cb01.camel@kernel.org>
In-Reply-To: <ebcd172da92ef6a8aafb5f0c6f84d0c6a735cb01.camel@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Aug 2026 15:48:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgBDRG2X_p2=DA+sftD+4ZWfistBnxMAZL+vmjvetLJhQ@mail.gmail.com>
X-Gm-Features: AcwNN1UH3VpmiB1YTnghqZPx00sofqQvPCEo3vmv_OnECRtfTKpzanZE3MeNbGE
Message-ID: <CAHk-=wgBDRG2X_p2=DA+sftD+4ZWfistBnxMAZL+vmjvetLJhQ@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull NFS client fixes for Linux 7.3
To: Trond Myklebust <trondmy@kernel.org>
Cc: Linux NFS mailing list <linux-nfs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026 at 13:57, Trond Myklebust <trondmy@kernel.org> wrote:
>
>
> Highlights include:
>
> Stable fixes:
> - SunRPC: Use-after-free fixes for the sunrpc client code
> - NFSv4: Delegation hash table leak
> - lockd: NULL dereference on lockowner allocation failure
[..]

Please give a real summary of what has happened, not just a lightly
edited git shortlog list sorted by "is stable cc'd or not".

And even if the end result is that "lightly edited shortlog", then at
least make it more useful and legible to users.

For example, just to look at that first bullet point: why have that
"SunRPC:" thing at all? It adds no value. This is a NFS client merge
message, and the line goes on to say "fixes for the sunrpc client
code".

Same foes for pretty much every single bullet entry - that first one
was not the one that stood out - they all stood out as "

The merge message shouldn't be about some minor details - that's what
the individual commits messages are for.

I did some more light editing to at least make it slightly more
readable, but it's still not exactly great.  Please don't make me do
that. Give me that overview of what happened and what matters. And
it's ok to say "And misc fixes" for things that really doesn't matter
and people who care should just look at the individual commits.

                  Linus
