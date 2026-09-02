Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001B02F9D82
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337482; cv=none; b=p6bjaBYZ93nzKD/uHv50EBvp3GZ8qtABoNGWu/2rbL8PD1vNB3BX7kX+NnAvI8nKU6jYKbTgQMJdOlIbxVlSScLWZkLHj1WDrZ39spy0wz4p7jBnC/X2DmmT97/tqUQ5KHIqsA+gTHfiZEBccLMVkiv87/patfWzL/F3v2Cy6HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337482; c=relaxed/simple;
	bh=R/XkwYk42zgzgN3DwUAhhf/pgxqHjM1wfOx0ukF/Bq8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jT0NwK+JzbIJuu2oJAmILA2jqUe8HtNozTnz6Sm6nurCihwRktMG83bzY/+fwGtJYnrGmJk3gAfrr6DE7e4OF65RvEfFkhloAhI2+QYFdDNaFueP7SS2uX/h3ovGr6CCwI1WvgJeRyZTyYGLntAkRBvlMVMWw8oJ1NUrzlAMiUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryCLSLZi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryCLSLZi"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so467620f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788337479; x=1788942279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rdGGjDUABbshwpqjPDr3VcLPCexXd/gpMgOkiV0wgBg=;
        b=ryCLSLZiPSKvCkPCBEjdptYvBOn2eQdFGFvMgR8VuQDizgKK5pXCPm5+QFVGXmjrzZ
         ++RceFi7wmixptx1HRkB0/TbThRwHQ1wLKs2KZWVT6m4WpHx68FuCCiNZ7Ree9VTnTyT
         Tiuctjlqf9koPtDyf6MvBMm7XUSDyEE60L6fuTlszDTZfyP4nijgw9a356sHAU8eqNz5
         NHYeSjZk4+gbBYoCAvXbZXg8NEw7Qhev26FvGqx8f0/4VZhTuXC0nVoSc9Q03pC0HEUX
         PQb81BY6dSalfmPBnksNT/v+Y5O4E4oxOEdQmuoY3tMshHlKmsebVhH7VXj1nLiPdmqF
         nq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337479; x=1788942279;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdGGjDUABbshwpqjPDr3VcLPCexXd/gpMgOkiV0wgBg=;
        b=M2aX7NMY11Eduy6KjrU+p+B/LgAAahGTWbHVRgBDWJ0asTJtMVthVBPR+iR6YtI4pe
         swcttDTFwFJ61kKocyfywK47NlDU8Zc6DtU0qpYiyOFJ0o65f9D8On3FB0JDpznV1bWP
         5aSx+Ll+cPx836k1V76qqXdr1+jiEajL1Gz+itUPw3rfsbT9f+GmABTn+s/R45YcAtKu
         FDSmJsTkc/YZqT9C0bqn5jwYEMBfoizpat2LZP+iiUsadZtSo2K4WCoLebgY+9wr0exK
         dcAwoS89DUL8M8dTDyyQtTqMzWfh64lY5f9rPFBYTN2sUiVLUqHXlZBOw3SrtYca0dfu
         Dngw==
X-Forwarded-Encrypted: i=1; AKwUvBwNhVW0Kd1S7npII79aQY8Te12Tj/UWOtNk1oa9Q/AwpNyiAhvWQ/urAAEYSm90y0t8Dv10hyBMX96/vKA=@vger.kernel.org
X-Gm-Message-State: AFuF++lTau0ptbYQtdCvi0IJXb8QIYGR+3BkXa96Q0ar9Z8Cy82GFD8R
	AsZD3npcSDUUo6JYkWIhOEt0GOCd/ouoX6gLgtEUBJFMfpFBgGl1Q2zR2iiJea/o
X-Gm-Gg: AYBFou1l0NjhPFrNLuUenKMNDAvNHjMA7SZItl1dSWredflzDnBzRBnIb5OxPBPThUi
	jq6X0ey8QAM/tr4tei3gz3HJkYqmz2ec4o++QOui8joIOjJuL6Xhgq4EjrJ3oBYQHil0jU/VE8N
	Hk6VTZYzTiBkb21EJLJxxs8SNdvmN+YvcLFmPFghlHR1vj24kFaG32kVGC6lJOtZuVMALQrWTGr
	7eF1OMSBJ20V2BTapZRGbY5b1ZSmGP02EG11V602uY6+Ueaj6ENIytcq6GIT2SUuL1S8XrtryTn
	j57AuswXzL0NNRsUNEmqBNkz0CAHo68NPkallAXU40BoafSsuLuTVkPyM6U9uEK7tnaQ8UzU+yZ
	HH6Hdo25kr9Oy3DlpJo1wXr3i8KJrhJXEUiJC60KNcTwJAzQSanTviHOxd9piHNXagF1OpO3OLB
	W9LduqacaL6ZoWV8Cugoni0I2lvTlrnkM3hCw6O01X17NYH9yJ6izMBk+OeD3aSWHovkHtosbm6
	6GX+F3VeDhjLRwBdvFxkfZfvQ==
X-Received: by 2002:a05:6000:18a9:b0:482:f724:f4ba with SMTP id ffacd0b85a97d-484913c37dcmr5172584f8f.19.1788337478823;
        Wed, 02 Sep 2026 01:24:38 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm4963940f8f.24.2026.09.02.01.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:24:38 -0700 (PDT)
Date: Wed, 2 Sep 2026 09:24:37 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Bart Van Assche
 <bvanassche@acm.org>, linux-kernel@vger.kernel.org, Christoph Hellwig
 <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van
 Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260902092437.00dfaa25@pumpkin>
In-Reply-To: <20260901192523.0e989b10@robin>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
	<20260831214437.15d6ad34@pumpkin>
	<a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
	<20260901092043.7feaf5d7@pumpkin>
	<dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
	<20260901222909.05d6239f@pumpkin>
	<1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
	<CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
	<20260901192523.0e989b10@robin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Sep 2026 19:25:23 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Tue, 1 Sep 2026 14:56:01 -0700
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> > 
> > In contrast, the existing macro is *not* garbage. It just says "does
> > casting -1 end up being larger than casting 1". Admittedly it *should*
> > cast 0, but then compilers are unhappy about comparing unsigned values  
> 
> It originally did but was changed to 1 for exactly that reason [1].

FWIW I suspect the 1 doesn't need a cast.
And I think the warning for (unsigned_var < 0) is currently disabled
because of too many annoying false positives.
(Thinks... (x >= 0) and (x < 0) could be treated differently!)

> > against zero, so it's not great, but it's *simple*. It still gives
> > random results for 'bool', I guess, but is bool signed? I don't know,
> > I don't care.  
> 
> Yeah, it was originally used for the tracing format files so that
> tooling can know how to display the raw values it parses. Also it is
> used for the filtering logic to know how to compare to the raw values.

And, in this case, the value is __bitwise so the 'tooling' doesn't know
how to display/compare them and you get a compile error.
Doesn't seem wrong :-)

David
 
> 
> I see is_signed_type() has picked up some use cases outside of tracing,
> so I'm not sure how much those other areas care about things like
> "bool".
> 
> -- Steve
> 
> 
> [1] d2802d0739dcc ("tracing: Compare to 1 instead of zero for is_signed_type()")
> 

