Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4AA4B95B9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934032; cv=pass; b=dCBq0CpOyjrtImVbKDhEkHZTALFL7TOFyLGH+sT1ZvbnGldrsfBgUQj3UnKOAyHwxE89QJstj6feAZr6bQc68NXbqlOJdl3o/dnGpjVpWtu6r/wpguaPJGlA4GvplcfDAMAeljGxvAprtVayaANDNoM2mWmIPAfsN1Xl11q3nLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934032; c=relaxed/simple;
	bh=HR5rFeE26T8rIbxjxi43O+NmdV5BLspRJkUtyz+T3+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfW5SG8SoGDIZLYF4RuRk2FergNs5k3w5tGLeiaYPU4VTRY72BuUFNcefyPhSsX05JWK2M0aQpegJDPALe2xP8qYnQiFLUyBqJA4DHLOwi9+WWQYl2tcqBNjVXnUJvBxNiLOl+UbRImg12nTJ0jMfScw9aY9WqPFJI3TDllqPVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f4SXfJlP; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f4SXfJlP"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-533202fe429so970501cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791934030; cv=none;
        d=google.com; s=arc-20260327;
        b=LfjK2o9t+XVv+tQ/LxGDzAQoeOogvSTplT0J/pOz/FQyWr+65CXV9PEbYVZ7EPc1lJ
         XE75/03FInG3+zy4PJodusp+5mwSbdptu6FL7PLVnF4i5Ccb/fHJFREffKyTpmaaO56S
         2YrJwTWGM5Hsi4ju88zPT6Pn70OMfN1c8G0YlugJYYjqVEZArkRKx4JLkEZ/u+a0efTU
         IZTgMBkZp6vVafCbYWYZBIY4+4KajFJcyYRi/txO4v5sg4KJt1n4si5MsZeNG3ESUeQA
         2ob7FTjaoEbw0OujdkZncKdjs4veUQ2NaDu2oAS6M1YYQEZFM9uGI4pU/NEcLGcgWQJb
         ez4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HR5rFeE26T8rIbxjxi43O+NmdV5BLspRJkUtyz+T3+U=;
        fh=8Lqkzj9yjkZx0cVf/hSYlPsAuyB46VHt4AYccxOUQ1M=;
        b=ZoWHQdteb1nBKrNt/1CEFRpm16npy7K0A+eQyUT0Q74Km02QAnYQGWCWrIBv3++y9l
         Lqjx3tqWpQGCuK/1B1U/rUhwy/5uMLPiHhSeCon8jOuPyluFiIbihNbpl3DhwfF6LYKc
         G3Z3v5EwOKBC5iAbhQkTle8srse7+GqzJOBkF2/1lUBSpJu8r2x+A8sPyTdTODnZu+uj
         uWxBt5Ldy4AdGCpfLE+52VPaTvmOCL34zLlUSqljbFQkY23eUXK5wckFCgSqkskxwagL
         zanod7PRREB0h00AE5ZUsS7WGSygIR8lMC7Y+OqJYj+6i92ejxReEHKOLnf59O805cej
         aqNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791934030; x=1792538830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR5rFeE26T8rIbxjxi43O+NmdV5BLspRJkUtyz+T3+U=;
        b=f4SXfJlPlI3xhqq3Jjh7JlCygqK2mWqQSKkVHtSk01+iLYp1sxXAZpY7KaWWn4nqKW
         5dKPgoraCKoeCcXTnno7PKJ3kULZ/fuQeNCnOXgoXBYKz4HCbE+X4xT3kGy3IniL/CbV
         fOtluK1LBwlr+lFMd/SrhykiM3zFOfjK4rH0EsCnjXb+a+D+ROv7yOfGJSzlLfJkMxW4
         PMqPKczfYIq5Do/xz85SUHolWl8aYV4VhqiVCQUj50/3t939URoSbnR2srQWt9mreEXR
         SQ/Kq6VOWjSalKdQ8+GCuGlQfCUNJlKsqsa/KkGi2vrPn5LXj1JnsrP+C9BmQQW5Fxid
         tGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791934030; x=1792538830;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR5rFeE26T8rIbxjxi43O+NmdV5BLspRJkUtyz+T3+U=;
        b=HkSsKVAd9jGquRDaP0iGmVysr2UKAznVB6GJLaxxe82y/y7tg02kp6Q0PbpMKa7Pbb
         sUUVVqQOmApwOh6lB1vVoT68T8KDjc5tYXK+gnldnRCMNVLA8WKLdba20yumR+p25fPq
         nG3ifhR8ZuG3hIuj7CblOA9WOe7T+mX37lMW1qqAxpeiQJZaos4+aZpsYFZxwzRJXoqD
         rU0N7KounOJvnsiUqON4Kyl6iv28UBZFOd1YLuMIARMM5THQyBOw+tvWcxpxAdwlWQ/V
         MUbBVcLsfuUrLU8lV+rEu1sDsU/zA5v8kBK4gQrJF7llBSEZDnjuuHudfqyqWcvPPEBU
         nytw==
X-Forwarded-Encrypted: i=1; AKwUvBykWzJ/jrh6i2J06P4UZdupAVIC6jjrQvxkyRSXRgqhspw6VR2AIMSJheLMALnRHpHpI67y3SJF/BBLCYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/4TG9s5KxiJC00FhQ8P9y+EZ3K/j7Ovvgvi+kvyS8shKErxWK
	eLs2KZ96NV0nZhQ9f791doPVzjP2pOAascRgJjS2iacFwkhKJGnxHizyOGjnCY3t0JWMjLV4nob
	KZIQKrT1iPSgopw0uPNUm1mETGeI36Up5uKKZl+sf
X-Gm-Gg: AYBFou0O9MPBZ+dgUxxkps0/pXf94gr1tmh6cPe/0R63cYDIkaEqGcTh+3QX5Tu9dv9
	EGkGSagxr6LgQSc1sUcuALLQvrmwOEus6DNrKH6WiPXE9MYa/4K/mUN1n2lAAXvvh9rew+41acN
	lgTGEi+I/uitpizK0jg2TMDPhgjZBH7ZPzjes/qdLHk50xhKv16vEEyT0AleYuSTjg9t7L7ont0
	ukkUCs2hYWHsaKL73aqhW+q7LDerET08K+K36rAF98S3JUeBz7bxlelj1W7hflFkxJHGOzIDugz
	+S7Oz0SJaD7mkOJLbtSeqX3SlsX2lSYSrL4AIpw6F4p6LSnlRjrtZ+r2hKgB7TFl2anxjZ3LvkC
	OxXUw9aOhvQ==
X-Received: by 2002:a05:622a:6f02:20b0:535:cee9:78ee with SMTP id
 d75a77b69052e-535cee97b65mr42500541cf.15.1791934029392; Tue, 13 Oct 2026
 16:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013222622.1822619-1-irogers@google.com>
 <3f57ddf4-b1a7-4c91-8983-c8cd83d0f25c@acm.org> <CAP-5=fX3e4HRaLXxQhCwEHRuXZdpC0zEEh2pozEEegQBxgc5xw@mail.gmail.com>
 <0e572032-5e5a-4a4f-a362-16ad48f2f02b@acm.org>
In-Reply-To: <0e572032-5e5a-4a4f-a362-16ad48f2f02b@acm.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Oct 2026 16:26:56 -0700
X-Gm-Features: AclHuK9h2b1Y8G06GgB2ybKX-XOEXTLg3GZrEG0Jt72282bAd9ESSyQw9mVDFQE
Message-ID: <CAP-5=fUmMQgxUqP3tCb694yG7V8PN-Uf_=subMDk+WuAiPJeeQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] tools/perf: Adopt kernel compiler-context-analysis.h
 annotations
To: Bart Van Assche <bvanassche@acm.org>
Cc: acme@kernel.org, elver@google.com, namhyung@kernel.org, 
	adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 4:18=E2=80=AFPM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> On 10/13/26 4:09 PM, Ian Rogers wrote:
> > Which mailing list is objecting to the frequent emails?
> This is a policy that applies to all Linux kernel related mailing
> lists. From Documentation/process/submitting-patches.rst: "Wait for a
> minimum of one week before resubmitting or pinging reviewers - possibly
> longer during busy times like merge windows."

That's a nice try, but you misquoted the documentation. As the cover
letter explaining the fixes makes clear, these are different versions
of the patch series, not resubmissions of the same one.

Thanks,
Ian

> Bart.
>
