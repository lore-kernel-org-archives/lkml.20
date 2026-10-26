Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793034973;
	b=GE/dawyY7tmaAWC5FMICwOn+7pD32Ao6293FQ1px52ga+W9XZ2Vt84Je2Ygl3FnUJOib
	 rSrTu6XFsVOzsTfhcXcHz7k+97JNvC6sdXG3s1GL9UY9crV0hrS04KckSnIPqTMxCpPaz
	 j4nvoYR0t7G42eCZWlvuxLFM0SvzRU6Ai1pNELi8OyaOOpGFQes7FXx5JyGg8J4jjvrjF
	 pm6G8z8XwsMaR+n/4G6WIxziUUhXraMAnHFIy2iN0Fp5vhn19Msa0lhI4j+j7LwT3rOTl
	 usMIeD3RJVCp+kDhfxs7CB9OZQzCXoYsVHNEErCK19nLhM2sjZCYUD3+fCIAgcBpBrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=y/T7eHMAoSP0rr4UWWXbf1cJ8XwTfHjYASx0lqrxNZw=;
	b=ac57pUqKFcWaQaC7de+1HZyS/+pT/u54K9RFiU8TlKrld+l5pHp508ROz8joX3rCtU6U
	 82NY5qmkUbAjewr9t4tQIOls1fAr5bDZSEXlPL9s7GvqkjrHIrGQsrxutrmjyNtJj75NF
	 uSumK4IclaoAWQ4Kn0lxGc4DLRzGqLbuhPxMegl96xAKHq1IINUaJl642KUPR2uJP1F1U
	 zJ+u4Qcsc9YlJXT7CihCV6FoHPxuA8L9qEHEivNUD9MQQY+LG3nWvgI1lTZmRPsV8tH5w
	 xJqWkk1384+lfuBAvAlIq8cHqSyFqcLTyURtj30+gmNWAzP5yuf2UZwJF91T4YKNmaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=PmEc2ngs;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DD3606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93DD3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=PmEc2ngs
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso4628140a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793034971; x=1793639771; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/T7eHMAoSP0rr4UWWXbf1cJ8XwTfHjYASx0lqrxNZw=;
        b=PmEc2ngszebaJ38uI3WUI3e6GQkJd//2O9ToxUx+oJQLhqAjG9+/InHoMLEnkpNPa/
         LzqJVqvjlBP8jLrE4XgKox+e8/2tVmMDjPM+yp4ZRzDwoDSVciiVzC1MsQn5T0kb6Qq5
         Hi8W8KneX1cyB4aNSwwRcqf8tF3oNbAP8OWnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793034971; x=1793639771;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y/T7eHMAoSP0rr4UWWXbf1cJ8XwTfHjYASx0lqrxNZw=;
        b=uht3HIG6WKs1Qe5Rp7d4ChLpBJpk2D3UsyOp2fIsyNn+MzyQuBTZ7mIC4RNldedsos
         FtKDxtAyuZlI+khvmLnqqpzVJtdTWv8SmQPMT9/NrRV0Wv6mbSVIyuxpkli8NxzVMx9e
         L6I2hcu13NBRrAZxYUeUV4NB4HnkTywcPXXzGnH19GeGycvkM2fMOI+ghYsYt7TqlvqP
         UqgaGw7gFkwSFSNayZ60cn1NqqF7WLfBvUH4hd3c7o6P5NSj04qbB7w0gRdzWXQl0fta
         Jq0sEPODfUxqGL5tClXFYChmh6yXd8J2OwugoViG6I1llYuyq+JqJ/aCpq5nOdQgzrui
         uEkg==
X-Gm-Message-State: AFq9FYJtvmHLjhfFZk0hvc/mfvOCbdKCDCGAc6NQ8qXTzILJqlkac2mR
	BMPSmFpHI2aJU23RhSACOT9p7i+aTGfrjtkXIWaoPSHdAvKa8EDTgF+uYYvUG/AWgdMaUM09ySi
	qbcoGrxk=
X-Gm-Gg: AYBFou0Kg2fgT7GhumiFFOlgBkVXDOLIRUU7pd2bZ3yK07nPSKuJRcDD8okqz3hetOR
	4jngq6SAue2Qr8LfyTsVTpZDKjBZUG89SI21k97rc2PCm72bBGKQAIEiwF59oc9dnfWmJSnyUwy
	ntrXm4/2YkQk/LgGaSvPeXOCwHFPAOYyvGpSuUOr8YQnPWfoffX/tyTqDxrBWn17rBDuOCscEr7
	a0y6QGcSU0jsqYKp+Vinrd+4pkeWjH15gAxsAtKw9athrHc0isLndb5ZJpc2UONNZXfU2744rA0
	RAx6/lGdqPXZX1CeGDWKr+GsokzivCbN3edlwmKlN7Vhv1JB4gPkBWLg7DtDCdfkK0cTNPbObDb
	q0OE2X2P6WO4T1f7K0178LUKurgWKvowhfFdFVa/4G+vwyLUj2zSNePQqjoL3aGMH7GHYvqK81j
	XkkJBV/2mMBcxWAy7hhmtnRN/puaktYbVkv2jqU1g8ritX85VWTaCUBdIdUYZdC+VEYuwgaaN/j
	lAv8shwUpCc5DK6QiZXxlNSDac8kJJB6mA0kBoXZFj6rtoYhKMKAQbMEBsESvWHlYLycxwcDMeh
	WyjhJt5AQ5SAaTAiBf4xdxWc+NZ7jg==
X-Received: by 2002:a17:907:3f86:b0:c46:7645:874 with SMTP id a640c23a62f3a-c46bded79a3mr864357266b.48.1793034970834;
        Mon, 26 Oct 2026 10:16:10 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34fa1asm341116266b.6.2026.10.26.10.16.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 10:16:09 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c46822eefb6so419270366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:16:09 -0700 (PDT)
X-Received: by 2002:a17:907:96a1:b0:c46:75e7:25af with SMTP id
 a640c23a62f3a-c46bdd6feb2mr883057666b.11.1793034969326; Mon, 26 Oct 2026
 10:16:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <at5i65e5wjMz2TCA@zenone.zhora.eu>
In-Reply-To: <at5i65e5wjMz2TCA@zenone.zhora.eu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Oct 2026 07:15:52 -1000
X-Gmail-Original-Message-ID: <CAHk-=wiMOMfksBhvDa+huuNCAu_EfpxzLiSawNxdady0r=zFEg@mail.gmail.com>
X-Gm-Features: AclHuK9Y_0fn4SgEGbZUWloU7JZaAjwIq8dkffK0lllMB-Mf8oR2BLWFRRI-aLg
Message-ID: <CAHk-=wiMOMfksBhvDa+huuNCAu_EfpxzLiSawNxdady0r=zFEg@mail.gmail.com>
Subject: Re: [GIT PULL] i2c for v7.4, part 2
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Oct 2026 at 10:20, Andi Shyti <andi.shyti@kernel.org> wrote:
>
> I'll now start queuing patches for a possible third week of the
> merge window. Otherwise, they will go into v7.5.

NO!

I've taken this.

But the whole "merge window is for new development" needs to stop. I
will *NOT* be taking any more patches from you that aren't fixes.

The merge window is for merging stuff that is ready BEFORE THE MERGE
WINDOW STARTED.

It's absolutely not for "let's add more to the pile". Never has been,
and never will be.

The merge window is two weeks NOT as a way to give maintainers two
weeks (and no, it won't be three weeks this time, I've been keeping
up) to create new stuff. It's so that the stuff that *was* ready
before the merge window can be merged in a sane and controlled manner.

So no. No more of this "I'll have a second - or third - pile of
stuff". If it wasn't ready before, then it wasn't ready, and it goes
into the *next* merge window.

                  Linus
