Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B961377EB2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291553; cv=none; b=gw5sRuBifeEg10aa158rrFV6nLIKUtbiMA3K7QScQwNB6Xe4sbkMqrn8Tbt/a1s2wQiBaTxa7Y1FWfuy/gLUPw6UichOj/sXXEs0P1U/Pf/ebl04imoxW8ibwR3lCwdcgYj0FvNsekKiR0As1uhK9LYQJXZqDcDMBecFQTlr4lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291553; c=relaxed/simple;
	bh=rMirSQhlLM+om5v8WlxipZS886lPfRnGnJg/Z7tLBOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaQqAiNNzQaXlh8jWdWvcm13wdcKw2dGnb/VVfGHnnklm5nJ0zGpP4Jgg6/wUFimykMagPZQGToH2EVlFJpjq0rRsU5iJPIUIxMY3XGw27CVo7qUMZ9GkGxoX3Pirp5690xzRhJSAPoyERiGYVviLuLLFnEQCXI9AxYzhXS1vEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hfRjZvLC; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hfRjZvLC"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c255c58156bso26339766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788291549; x=1788896349; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5wxaohYHzCmybDXCy3BNm+yEnkJeguY0Ss1pLFyx8c=;
        b=hfRjZvLC5e+tVS33tFJ3aLGw8RktbI67QACjDlGSrhMqKkgaI+LDGd9uauW9G4mKMM
         qGOrOUwtWxlR13P3jVUJfgUXNyx66mjOx8BOyGdqWvCL3mpJVtxUIuvZBtn+kwuyKoh0
         PoWqxYrrU2tsq0qBR+OaTokACdKZ/JdiD9Ogc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291549; x=1788896349;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L5wxaohYHzCmybDXCy3BNm+yEnkJeguY0Ss1pLFyx8c=;
        b=Pk8BSvh537cI3xCIR0hjWAP7f4v3lY3S3q7Y/jnNVSfW+Q5oreXJtvZSAnkP1eWiXz
         rSL7W92LGVdXsfp4zLf9L1LYdTm17vNlN8uCeqz8iL/HszXb+iKu/X13Mebtcm4kFFx0
         WUIjf1PrhJpbKRUmbbjP2Xdlm8IEKph77XJRsAHdg5niisxsJbp8ZDEktNQiWcN9+KX5
         IwXXyOlU5rmvXtxprU/P8IZsBZdM5MVy1sCYRHCCMynCQX70RSKrwSEaeZkzBiY/PgeO
         B75G3APZ8ZG2a35NyYqzw3QqYYHeQ7U+LDsdbm0wABvR12BZ4PkOD6F8I2PMgrkXgYBp
         cXbw==
X-Forwarded-Encrypted: i=1; AHgh+RqIamkIhO9lUPNn/KGLkdJDHuu2O9ZjE6ulvRHboaLO1M7P6s3eGMwgIS/+wltN5UGm++Q+NyFoMyHVBiU=@vger.kernel.org
X-Gm-Message-State: AFuF++nePWLxgJmms6vZKYWd7ezkXbOCZBQQEaweqTwovvF4kDOS9ss5
	j/U8DoxKZgFMxORbDSkLpENptOan4c+e7CLRmavLpZTw1EX6rQiOELsClAV3HPkkQ65JV6YTo6d
	wyrrCoUE=
X-Gm-Gg: AR+sD10Xh5fn/sC5rxhJBWJHZH60Y8BwK0sFh7rxQo0ry8WKM3TzTlJXDycLYf35PCp
	RYb2aEA8W5gWTurih+bBTpsk67uYsoHrt2/Jp5U2pimseIUQRuR6RYFNLxNwpFdEkI00HeP+3pC
	nYsobvDT8SWK6ZzR32oEvRv6o4zH+xSdK44SEPJkH5FYQfTXeBj0CmJCpeBhkefewC6QzFw5kA8
	7YOIFAXbMgFUHEdYWTt5+JS4Hr3l3k0awT+0CriArYiFyPrS4cPX3wrPe87VymaDFv9KjQ7nu37
	rzGWITsSHpbXNMMQL8n+gFo4NVdhdBq1GhaJatzlHaxmR5oNnkZlll2jcEhOsfRJyhkOhG0Ca/j
	WIWqAJIsH17yxccbVoniSImlvOtu1nI1XLAN4JWr2O/8bLxewo4khLTDcDzPv+yvJnh9oEIHYRs
	P/Eu3FhSvA7fcgfOFVukUTF84YhR1L9/CNYy41cDjgKt7jWlHUyZNdfqdU6DRzlyAoJCZQ5xvH7
	LuX47PL+c1O/zGz9qtOaNKJMogDRNrvWS7+AQ==
X-Received: by 2002:a17:906:c108:b0:c20:2d38:e518 with SMTP id a640c23a62f3a-c25d10a3fc8mr37967766b.2.1788291548882;
        Tue, 01 Sep 2026 12:39:08 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d0421d8csm14254466b.57.2026.09.01.12.39.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 12:39:07 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c197e7e4e94so24965366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:39:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrljkKjEOkUlJgfL1O2TCgCHgsyVrlQ/K54cSxEW4HqfIlGQB+XLv93vIHBIRt4pPb1+c6r5XqiejYSHjQ=@vger.kernel.org
X-Received: by 2002:a17:907:c80c:b0:c21:450d:cd88 with SMTP id
 a640c23a62f3a-c25d10e727dmr38279266b.6.1788291547712; Tue, 01 Sep 2026
 12:39:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin> <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin> <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <CAHk-=wgFEG7ZVaFAbo=bWWfsSh_weA4cOh6BV-xHWNSn6SwNBQ@mail.gmail.com>
 <737a4f62-f50a-40bd-a94a-1f42e9f3f54a@acm.org> <CAHk-=wiZog53-M8--_2m7HRk4XOQ+_jkh1XVuyQXXJgSwooQng@mail.gmail.com>
In-Reply-To: <CAHk-=wiZog53-M8--_2m7HRk4XOQ+_jkh1XVuyQXXJgSwooQng@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Sep 2026 12:38:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh=9Ax9bH+j9bTsx55nJgvLLFBgnt7d8hDxFv-FLLZ0LQ@mail.gmail.com>
X-Gm-Features: AcwNN1Uw1yDPxpxoH_ybCBzXi6skb7ZGpG4X7fSNKVZEQfwBn2Rcjc1PTu34lBU
Message-ID: <CAHk-=wh=9Ax9bH+j9bTsx55nJgvLLFBgnt7d8hDxFv-FLLZ0LQ@mail.gmail.com>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: Bart Van Assche <bvanassche@acm.org>
Cc: David Laight <david.laight.linux@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 12:35, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Well, I pushed out my own random branch to my tree

Just to clarify:

   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/sparse.git/

and to make it *really* clear: that branch really is garbage. I think
the individual commits are all well-intentioned, but I don't think
I've ever even run the test-suite on it.

I'm a bad bad person. I should feel bad. But I'm too lazy for even that.

            Linus
