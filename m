Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F9036F8EA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787938969; cv=none; b=F0wqlJ7ULHhQ1EXrG34JNNJdRcjAgaSJcZ+4UTXFwu/AVOug7aXBOh0QX9vZ6cLPyBoVv9jSeGXcrPHHB/MakeB8Ttt0AL7lH6eP2IYWgJmI+QWFkDMGylO2Vck17Mh7UG8e6+jgWzOm+Kc5ycPLCd7Pmd2ecWOzTMKEfOFhQzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787938969; c=relaxed/simple;
	bh=tuUokZoCnlLmufKUH8WZZk0WHZlIYiI6h1Ayh5pJbpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0DTH4unoTKLanNt2NPTdULtuN8nnF67GaW5okiJ1TA62CjxK040X2fxJXomC1hB+snpSKX8PNn6MekM+uA4zWFeA2LhlQpO0iTum4Xhv342q3ETWOen3oV7VTW3PDcYYpfXh00veuCzCFdt6n83kCsl2B52wPtIde+Bdaril1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TG37nN4V; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TG37nN4V"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso1670970a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1787938965; x=1788543765; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GL2lsY2q6lh+Mh9KUYPYp0RjapCsGo7cY5qRZTg2oBA=;
        b=TG37nN4Vkl5LNdvnnkAG0/MUrcvKdKPXMZ2a9jVjhxGUX7XP4Zc85h2F0+VgnA4GBL
         3PNU6qsFAsuOmGvM3S5X4D2RtYLBCyTQfHZwGppPtsweS/5qe74FpgarmEmYKLmGaXkg
         AI1Dv9fMoCqMEzFKy6uLN1jp9iNXhZI9M92yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787938965; x=1788543765;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GL2lsY2q6lh+Mh9KUYPYp0RjapCsGo7cY5qRZTg2oBA=;
        b=sODL4l6KzyVTNYL/e+I+7LeSod0IHPqXPEwI8EtX4ujKoXsfeWpdWeyodvM0AMqfo3
         Yd+2ZuYHGaOpTtjBx7qMARTZ7NCv52H+soVvn5RVOtGT5f3ij0yS5NChIJQMkT1beejR
         CbVsL6hYTP29v5ovsLX8I/2zHymKZdW+5jPA5qURMR/fHbULItVLBESUS6XgFmKxRtLR
         Y6xhr1axRGrOrSh5WdRvKYjP11TRBwml/GpflqH2belcJX6aYDDhD9U2eF02XEjUAOb9
         pa/HitbCbIjdObGtRhOuufSnX1eHchIoONgTRLR1P02lgq9laWCGITPkqAtEl9L8F9nF
         rjmQ==
X-Gm-Message-State: AFuF++njj2JwkeX7HM01e6Zl2HqcLJPrhKYlBjtPvEFeN5wjnVLDZMMt
	3brVd4psyh8nzK6UIJkdQz8p6FLvQS4pgsHmdYPHPoPhNtUORslmKO6QagHhacRO7+T/RdMDcaA
	S2lNPxRA=
X-Gm-Gg: AR+sD10x7MSY/9TTK0CCHca5YcOGfujRJ9qqfRw/PQTkLzWYVhuBDAENaeCEp5j47a8
	X+JAzQ9JVP4r6Resvpd7G6gPi59DL6JfS2KNQe0SihJSmYl3yKX43SXyImsvSxSZ6/5tMpgVBH8
	XO5etqasYUK1NmnWmB8oU+FRkwyCyvb/NK17O0wVFSeylqmPm0cx0QyCkbZuvk3kOLgY6KD8UEe
	OrpkTCgg1+3g+dXbPlndn0eGAQXrlP7LngG6ODNHhEjv8RBpc6azIRl7lRXZkyRBXImbJ2/rEd2
	31OdrKwZBost2SWTyvyu9AaLUaMY9QRg8vIJIwCn37Mi7jf8yk596qvCfUYnydS7wJdrh9OSIiy
	4c7l9znyw9BNatD1+1gT5ejNtNSIen5A1+fw92pBS8/Sq2CN8C3UIBbDkvGXh5/R/FhDie7Z9j1
	PbTjVcR2UOensWecLow8pYvnuphPVAyh0vK8Tfo7IQUOhuzT77btzSZrLD0cnQmVi5jVnphEmjk
	lYLMZoJQv6+S+2FNYlc5od4z4QTLavBB+M+nQ==
X-Received: by 2002:a05:6402:1ed6:b0:6a1:fd14:8832 with SMTP id 4fb4d7f45d1cf-6a60d3c8b6fmr5799442a12.12.1787938964776;
        Fri, 28 Aug 2026 10:42:44 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c572sm784630a12.4.2026.08.28.10.42.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 10:42:44 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2544ff970dso185635766b.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:42:44 -0700 (PDT)
X-Received: by 2002:a17:906:7947:b0:c25:4ba1:5953 with SMTP id
 a640c23a62f3a-c255702dfb5mr645433766b.11.1787938963933; Fri, 28 Aug 2026
 10:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apG8g-5krNRUFUuD@casper.infradead.org> <CAHk-=wiY22BnQkAMMc8-h6xaRksvVAbASpg=pj+=kVaXXQYo6w@mail.gmail.com>
 <apHC_mHJ3wsJPEgy@casper.infradead.org> <CAHk-=wimz+APb9hGEry+vHDLB5D7WZvNGWU89HjGw7wH15KGHg@mail.gmail.com>
 <apHGdfwY67YZ4sEr@casper.infradead.org>
In-Reply-To: <apHGdfwY67YZ4sEr@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Aug 2026 10:42:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgrY29fKgVkjjs1TfpR3y-TNCF4hZ9zqsbBGSMc9BvHYw@mail.gmail.com>
X-Gm-Features: AcwNN1XMk0tn5kToNoPohLIAPg_QHNiusV8BkGpX280Il2RW44EB8ONqq3geRJ4
Message-ID: <CAHk-=wgrY29fKgVkjjs1TfpR3y-TNCF4hZ9zqsbBGSMc9BvHYw@mail.gmail.com>
Subject: Re: [GIT PULL] Remove dependencies on pagemap.h
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 10:33, Matthew Wilcox <willy@infradead.org> wrote:
>
> How far in advance do you want to know about it?  Because I did send you
> email about it a few days ago; must've got lost.  It has been in
> linux-next for a few days (would have been longer, but the Intel test
> robot kept finding random drivers and configs that had build problems).
> It's already generating conflicts with other header file changes, and
> that's just going to be amplified throughout a whole development cycle.

So basically things like this need to be ready before the merge window.

During the merge window, I basically only read pull requests. Sure, I
read other emails, but it's a back seat operation at that point.

And I fetch linux-next the first week of the merge window. Anything
that isn't there at that point doesn't count as having been in
linux-next to me.

In fact, I should fetch linux-next *before* the merge window even
starts, but typically I never actually remember to do that, so I only
fetch it the first time I go "has this been in linux-next".

And honestly, none of the patches I saw actually seem to merit any
kind of special treatment. "Generates conflicts" is not a huge issue -
not for me, and not for linux-next - when it's trivial one-liners and
no actual code involved.

So put it in linux-next. Use a signed tag. Make a proper pull request
next time around.

             Linus
