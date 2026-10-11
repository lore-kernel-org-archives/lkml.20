Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFDE33937F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791743040; cv=none; b=fzQa0tV5frjQlFinxl6XScZlU8CzhFRvyOLDdKbFDFcVbLwxh34AN38iuK49LcEz2acc7VjICRH1Wd2Arg2Df0FI+0jABRtUBDKLF9+UWzwBIHkppRjq2ASN3lIK4+4JIpmwOs75GH0c5ath8cMK3spEWMocNsyqxlvReEVgB6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791743040; c=relaxed/simple;
	bh=nqyL9JemtS0GhZQq2YJVUbzEc1H+DENczqh4twt/OpA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZcdOOqaVExeFlQH0B+pa3XFzeQubT8tkKwYnHPF3wOsmtUr6QSCJui5OikAbp/1HFidelHkAOGm5MImbyYB6PUA+UwpfyYOZ+s7p+JlW6ThQ9MIu251X1tEzpeqoCobchHOgjUBIWEaGMK0ZVR0b4WoxMOkwKe57vFZQl79V2d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgCY0dAN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgCY0dAN"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so610733f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791743036; x=1792347836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGzliFeDcoWv7bGRwRrYy+3M5x902wezSQDQF9PoOoY=;
        b=SgCY0dANr1IL2MrdK1XyQKyAxWzf+Nv3QwSJg7tTvVdCL8LTEhy/MLBVaeQWTn5NVB
         Nr5vVueMZ+7zEP211y4NmVDDNXmd6fVyOQzcI5mhHggoYuyv88YDYbgd30k1sWKeTmgN
         uDjzHbcd3nLGNKsI0BTlLPcDHlAwy+VmC7T4OQy5lIqKTd/Z0cXPZfQwi1DHpJC0KmMN
         B4wL4cEf2iuFexHg2tp+dgmhVI7thUJiENH/bOrCMCN1nD3q5a1J1nZidaMrHkipWAip
         haR2z5D5an3lRMQpKQv49cIjRPIDk5QlFM1P7Ds/IuW34tPBf4WsBA1M+t/ooCUuKqvF
         zlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791743036; x=1792347836;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KGzliFeDcoWv7bGRwRrYy+3M5x902wezSQDQF9PoOoY=;
        b=nRlAtOHcGAWxiV+mOAgs7KkYu9X0sPwqgQAmN3nWVcZTEa8mp/GliPsOXTn5t9mAI4
         mwB7zX0WqeUhZPns72mSOAotLTYpWPFUY5Hmjd3BbOtq4GaWNc+NYke40BN9C4yX+tIM
         2AawZ/e5zDMIrN1bgaiHbxMkk78ff6ILkprahEo+UWPN8UvOfh9CvU6UWQ7HNXrClTjv
         e2weYexUFKOUIwaBTie0S0iqeLeFyxtByDJwnz/iPfCjk2sMtR6GuS4bBc7W1PC/AQSe
         xL0G478iv1uRketlqYPybg4kVxLFG9jeBZFeZ9bP2MJsLneSiIRVzFFqxolqtxrUScuk
         Pxtw==
X-Forwarded-Encrypted: i=1; AKwUvBws5Vnvei3/9X+wvMWPlRVfKumBNTVwUD+pkUGOnWY4+hVtq1oJb8XtMCKbMxWX3EFkyMd+z7KGROg7nWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhjWYMy15JPVlHlWLq6tmpcorDQopSRYkHa0JCN28YmoY2H8QW
	6oyt6qe6ys59bJ/8pmdN/RAKa8WjuoQl0XNdse3iHqCWj4SspX9Q+W2B
X-Gm-Gg: AYBFou3XXkD+6ynSK5SYm6XQI4tb7tnROi9jcThhEPdMLMkW5hdCUnHHdyK7+Gdkxpj
	jjwqwd/cERFcnPPw1ntB5AYUYIjIv4wPJq4pEt4p0msNZ0J5oXzaM9Z3+rs0hk+nuk5D0lZOa/e
	sCZAaKlMPxgIhRs7YtMziaRTZzYaaZhenBlZFFDapsgMOVE/sZgUh3YVnJuy9BRd3v1L3pwCcuu
	v0husszBTOGTv3WS27h0uydUdXxTQDDNySzVAzMPhfOj/EX+Tiy4Nv2qq/zfjbWI41w/r6yxzm5
	W7tOjGQNyVibCmHIaIb98Kw9ROKBJogVBenP4mhAV3z6v0ZOll/diKl3GunY++PY7QW1d+RIaVH
	Ik0vuyXIOsymkVzu1ItpaF72YRbDL5zUOqChodMTeRkqKWeu1WxwDNJtcuX4fczs4MMzcMyeLv4
	tVfn9GVEa2UKU3V5Laa8YfxJK3YjxbsolbX+pSLOKz8RuPUwDxPT3hhXs4+R07alGR0kom7m3mB
	M4m9Y8++r6J63465wrffVZYqDHMCM35
X-Received: by 2002:a05:6000:1861:b0:48c:50db:30e3 with SMTP id ffacd0b85a97d-48dbaadeaf3mr13502413f8f.19.1791743035466;
        Sun, 11 Oct 2026 11:23:55 -0700 (PDT)
Received: from [10.0.10.92] ([81.0.251.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db93d6069sm14495126f8f.0.2026.10.11.11.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 11:23:55 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f2e28f7c-2b36-4dd9-b91b-81740b8ca5ff@gmail.com>
Date: Sun, 11 Oct 2026 19:22:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: wrap long expressions in menuconfig
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org,
 a.hindborg@kernel.org, nico@fluxnic.net, rdunlap@infradead.org,
 grahamr@qti.qualcomm.com, jakub.git@horky.net, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261010095001.265759-1-julianbraha@gmail.com>
 <CANiq72kyZpDa1YfLjPYQbatogvMONM0SOww1iQDQaZ4atcu+9g@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72kyZpDa1YfLjPYQbatogvMONM0SOww1iQDQaZ4atcu+9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/11/26 17:20, Miguel Ojeda wrote:
> On Sat, Oct 10, 2026 at 11:50 AM Julian Braha <julianbraha@gmail.com> wrote:
>> In an offline conversation, Miguel Ojeda reported that scrolling
>> horizontally in menuconfig's search to read RUST's dependencies has been
>> slowing down debugging.
> Thanks for working on this!
> 
> This is definitely useful, because users (and ourselves) have had to
> scroll horizontally too much for `CONFIG_RUST` 🙂

Yeah the feedback I got from everyone I showed this to at LPC was, "any
form of wrapping is better than horizontal scrolling."
> Maybe it could help to clarify here that "debugging" above means
> understanding by users (i.e. not developers) why the dependencies are
> not satisfied. `menuconfig`'s search is uniquely useful because it
> shows the expressions with the current values; i.e. this is useful for
> most users dealing with long configs like `RUST`'s.
> 
> Is this patch the live one you showed me back in the conference?

Sort of, the version I showed at LPC was completely vibe-coded, so I
could quickly get feedback on the visuals.

This patch still creates that same visual look, but I've cleaned up the
code.

> 
> By the way, for context and future reference before I forget, I
> suggested a few other bits:
> 
>   - Wrapping on the top-level `&&` operators.

I personally liked this style when I tried it, but another maintainer at
LPC didn't: "I want menuconfig to take advantage of the full size of my
screen."

> 
>   - Even better, wrapping on the actual `depends on` lines, rather
> than every top-level `&&`, because sometimes they are logically
> grouped, even if they may use themselves `&&` for the condition. But
> IIRC we discussed that this would require tracking more state and/or
> reworking part of the parser.

Right, that would be a much larger change. I do intend to iterate on
this in the future, but wanted to start with something minimal.

> 
>   - For completeness, I also mentioned potentially considering to show
> (a subset of) attached comments, but that is not really needed and it
> is really low hanging fruit that is most likely not worth its
> complexity: we already have descriptions and most options are not as
> complex as `RUST`'s.

This idea turned out to be controversial. Another maintainer pointed out
that you don't always know exactly which lines the comment refers to.

Anyway, thanks for your feedback!

- Julian Braha

