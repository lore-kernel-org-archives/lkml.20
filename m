Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747008;
	b=2KpnnZP3/hkotNEkhf8EUNhvMgMn909y4D2KdGM33v7UavRVEAcA/6N0ItnxRV5JFtn+
	 sGU1PKbhRWrJzyQX//7W0wwXtRGqegiBVA8QXu7423pplNleTeUSkrDXgrYi+5cNks9dL
	 lvI/T6oMxZ8vNZjN7Y3NK4MNqv/19SzU0mIYI6m6iPCI0Ueuggki/HccG39fY/+U2Jek0
	 P6rJ1QF0Wtjk9mWoB1rCZRN9sSbRsUPRaO91nA3SwgVP97Q/CI6UFxbpuCg8jsQTGJv2W
	 P7daQ8h5e7gL9GIBP1AeNGF42PNtybjJnRw4QzJfxIVPDGBbHsXtFAFJtkI752ag2GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=l22MxaExXx2RO2+ezWq0CB4Ta82xkRaqq8ZcfjriRS8=;
	b=zoaOqZ/rx1S0za4LBuH4AtIWiV56jZaZsjxw6U6nNsxneZhAt+vG0u+c8hX4A72MAEVM
	 O7b76hVZfvDTCzBeIX/ua5DMXvUqQeFCJVUoAFM2w1xL8Dq3RqA+pc/G18O/CFp5bK8No
	 2dSWlGGl63LYD9i+xaUTVfNL0ZqXpR774JmUt7JiWbJoapfziJeXnGr+yFAoc0oirqsM6
	 rYeEwqss2WBpK+YGtD6/hQ+zglQX/2pzw0tW3HUf3VzGdAMnrh5mdkCik6XUJFpxljm66
	 iI9ZAX+9O1DlyXNIDD7knjtbxWC49cVuQ+4f43xYXp5IX9y/NmJUiFk8v78UTcdHiAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7GrpZY+;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B051606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B051606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7GrpZY+
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a208d93758so587505e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793747007; x=1794351807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l22MxaExXx2RO2+ezWq0CB4Ta82xkRaqq8ZcfjriRS8=;
        b=G7GrpZY+5wgbxI4EJsTMSC2Uoxrd/2lO+VIWl7kQEo3/IzCGjTNFZ3RywMV6htEJuq
         vJudXnaOidt4KIL3sUR0c1bi2QMxS/42r6923eaPgPJw5bM/I16fUg+evL4pYwmf2t9x
         YCEOF+PjO9qA9Nkw9DBDwwZ4udNGpICOtrUuQuveoPJRnC1ToqkV1F7ECx1t1z1Y5Mi5
         bUuEIpgRmnu8LtTs4mMaCVX7dpDZsCAVg4uDUfJtFwq3btI/yH23fHxFJfRakeBw42tA
         tKdfNdxCOcH+u7TQglKFkrVV6i7w7mksjB5q5sWjQU1hr2qFx1cwSnZjuqAN1PdvI3hP
         bQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747007; x=1794351807;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l22MxaExXx2RO2+ezWq0CB4Ta82xkRaqq8ZcfjriRS8=;
        b=LxonrLvyIamZunnwSkY5yrklov++3FhywuJNIh+8/IIYICmvcNpo/1/nkpZg03MOhS
         XXL/zO3jJIVu0+qO8xcdxiDVCUUiVucsmXM7zQw+bVMzXE96PppVHluFltMEmNWZogsq
         hDqlbuUV7Nmaew+drlQsZ9iHKNPU060x8qdTxWF72ImJ3HoWfAXM8y8nONRJspPEMtzj
         RqXnW3p6nLffSpjeLnUNeKpHI4+zDGUXVfJlx36dA27qnSAtXR93ty4NQ5UE1m2K4DqF
         F6X6RVeNR0/2IvRHSEjKLOw8jWC0XJAeqLhzp8JJ4sfqR/+Nc2DTKddAnQ+S8POofHNC
         b2jg==
X-Forwarded-Encrypted: i=1; AKwUvBypz9Z4IvWOeE4+awEnwn7CuEBaPt8KHD4ceYNsdGfZqoHIWVEzreOiF68J5nRvInj+mziVHEP0BrbDvIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aDFLJ9BeyPYOzlWEf5sUMJqQkJvQmjS6NkN+BjffP//d4hG4i
	1YX4/BtKqfMZ/k2Hay5Ew77ESMpFARXmYHroMGFWfqlaAaj66FT6I37V
X-Gm-Gg: AYBFou26ftlaytRL66NrgWL2FzD/oVjS2S1wjFxXQX8QtecvuLbsOJM1DAqcZkedxxG
	9xHueWThLjq2mT98kg3A9jwGSozsTb7IJ0qdzWQ+H8IC48UyVk2YQIVnGilNvyJ3+cLsy+eZfjE
	dFozTGXauTJctomx5Ulst1C5CQGwTt1KXjIZFGcN97D3z0Ej/C20IzpaNf+f5/au8z8UIz3WsrN
	3Bx4yl4tXjAyH4LUAkW1/nExQ06rXsEgSmIco0YfPobdiFNLVpjUpilkLT1Q9CJ3rvmBgUAtSn+
	D6TLdwNzKziPqcPepWkSlunv0fOW1S9MVU1DCKsLynCwCHupaWbpYDDoF7QDhpvtpn2vzQNGqAy
	Dpcp93I6DFmwlSr79y+Jo2qmBTTHBEHDo1IfoP6p+bdh0ei+SkCFaw4GbMIbfL8gMKKYNdeLufa
	4qnyOW8fwS+JXzzflUn6g0InFN25oK9FSHHRCvfUERg0tgVLnJWtlg5wwiKID98uM9v0YO7mXo3
	KY+qpmiaThP+fzvQeCLnnTISxRZW8jazcfaC6Qwa5V3sa35NvtN2LO9rGICTJHB0e7ExfT8UYRN
	hUYhKwd0G0V3eRTpdcSO8PkU1E5GBCbKqEyc3Nqa0nd3iF8PnM39BHJcegchz4m1e5Xtfojmemk
	rpXaoXgKcMg==
X-Received: by 2002:a05:600c:3556:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4ac187a80b4mr362053555e9.19.1793747006566;
        Tue, 03 Nov 2026 15:03:26 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b452eb99b1sm1703755e9.3.2026.11.03.15.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:03:26 -0800 (PST)
Date: Tue, 3 Nov 2026 23:03:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rosalie Fang <rosaliefang@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Guan-Chun Wu <409411716@gms.tku.edu.tw>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Greg Thelen <gthelen@google.com>, Yi
 Zhu <chuyee@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/base64: fix -Wconstant-conversion warning in
 INIT_1()
Message-ID: <20261103230325.12fff6b0@pumpkin>
In-Reply-To: <20261103190052.GA267580@ax162>
References: <20261103163404.159582-1-rosaliefang@google.com>
	<20261103190052.GA267580@ax162>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 12:00:52 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> Hi Rosalie,
> 
> On Tue, Nov 03, 2026 at 04:34:04PM +0000, Rosalie Fang wrote:
> > When expanding BASE64_REV_INIT() for v in 0x7c..0x7f (124..127), the
> > unselected ternary branch (v) - '0' + 52 evaluates to 128..131, which
> > exceeds SCHAR_MAX (127). Recent Clang versions diagnose implicit integer
> > constant conversions in unevaluated ternary arms when initializing the
> > s8 lookup tables:
> > 
> >   lib/base64.c:58:18: error: implicit conversion from 'int' to 's8'
> >   (aka 'signed char') changes value from 131 to -125
> >   [-Werror,-Wconstant-conversion]
> >      58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
> >         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> >   lib/base64.c:34:42: note: expanded from macro 'INIT_1'
> >      34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
> >         |                                              ~~~~~~~~~~^~~~
> > 
> > Explicitly cast the digit-branch expression to s8 to silence the
> > warning.
> > 
> > Fixes: c4eb7ad32eab ("lib/base64: optimize base64_decode() with reverse lookup tables")
> > Assisted-by: LLM
> > Signed-off-by: Rosalie Fang <rosaliefang@google.com>
> > ---
> >  lib/base64.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/base64.c b/lib/base64.c
> > index 325c7332b049..1489c048b1fd 100644
> > --- a/lib/base64.c
> > +++ b/lib/base64.c
> > @@ -31,7 +31,7 @@ static const char base64_tables[][65] = {
> >  #define INIT_1(v, ch_62, ch_63) \
> >  	[v] = (v) >= 'A' && (v) <= 'Z' ? (v) - 'A' \
> >  		: (v) >= 'a' && (v) <= 'z' ? (v) - 'a' + 26 \
> > -		: (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
> > +		: (v) >= '0' && (v) <= '9' ? (s8)((v) - '0' + 52) \
> >  		: (v) == (ch_62) ? 62 : (v) == (ch_63) ? 63 : -1
> >  
> >  /*
> > -- 
> > 2.56.0.385.gac671c819a-goog
> >   
> 
> Thanks for the change. I avoided this in a different way, which has
> recently been merged into a tree that should be merged into mainline
> relatively soon:
> 
>   https://git.kernel.org/akpm/mm/c/3af83c11cf5990fda0bfe3959aa6391ff903ffdd

#define INIT_1(v, ch_62, ch_63) \
	[v] = (s8)((v) >= 'A' && (v) <= 'Z' ? (v) - 'A' \
		 : (v) >= 'a' && (v) <= 'z' ? (v) - 'a' + 26 \
		 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
		 : (v) == (ch_62) ? 62 : (v) == (ch_63) ? 63 : -1)
probably looks best?

> For the record, I do hope that
> 
>   https://github.com/llvm/llvm-project/pull/226775
> 
> eventually gets merged so that these workarounds will be unnecessary but
> I am not sure how that will play out yet.

Someone really doesn't like kernel code!
There are other warnings like 'cast of pointer to/from integer of a different
size' that it would be nice not to have reported in code that will be optimised
away.
At least the kernel gave up on some of the 'type limits' warnings, they
had similar problems (even inside __builtin_choose_expr()).

David

(I'm reading these unthreaded...)

