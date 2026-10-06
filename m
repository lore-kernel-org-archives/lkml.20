Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB874547072
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261807; cv=pass; b=I12HCn02g4k6i+WhmsTBKVVKFPaABGdLPz8OVK2DAgkGnwXj9223+DJV/n6AK4N8B57a/+nrQtuOUc80XHyO2P61YTYmZSdFp6TPu++oWdf1Sj7waFDh7eT2urYJZAQwUrvUl3+M+SqtJVbvHulHA4UxHGfWdgyodcKnqnlzVso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261807; c=relaxed/simple;
	bh=yM+5n50ARskHq0R2o1yTIFp7hseEZ/B+HSL2nwZxVTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2CfJn99mmv2hQsqOZbG7DkPni+UUaFutrj+6+nJWSw6mC/nnqMWEAUP3yCq/QWR2/O4xr9vER8zqEXD0/1IojKaw05q9AKul24vm1kLPdSGufXwyxhu69292tyTbS+TfbAUV1AXB77cGygkp3mDKp1iURN8HS84FiCL3qi89A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOsozKX4; arc=pass smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOsozKX4"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e5f819884so151424585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791261805; cv=none;
        d=google.com; s=arc-20260327;
        b=i+3GGcCBH8xB7e/CtkwfZo0B8/C938ln4RHdyzQ4QCtEl20/voAmemb2J+Xi+3T7/1
         bUN/xHJSMgXe4AIwgobJgLNTvrHheYk9wY4vH+ECWQTTQ1gAeryL6pEZ+QbVcnTaeIux
         ubu5xd5+Aun1rE3GjHgTg6UT3YYI+AhC8LwpQtszuGILwSOzOR+jkcHhxoM3g0TTboKA
         0aNOJ0uepqkCD9UW2Rael5BPotrHIRKNDUGk3x2Nw39jo3iDbUkiFAv9QseLOc8dk5xa
         NVNWa1khAY0ZPNlHYdVZV5CZUSEIVvIT0CxGLfVqMmVQysepXVl9+HVLwyEQpewiumZY
         aDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Di5d/3diYTP5LLcoYoSh6i8r6bM56LiXfUkfpkiUW2s=;
        fh=Rw4j5AXd8anS7HCrHLZWVYMPZNTS/K14M9YKt4ErG6A=;
        b=P7WsaY35CTExCeigPip0LxGZz4RliGkVakIZsXXwvEM3VPGPbOlh9kUydUzNoqXpuw
         hIVZLgr4lCLT8oPjAN0W+Eyjn17UekS6srjjveqsxBQtdiBEVbJ1YPvz0tBVRRbu4jK2
         TnWB/pIt8XjgxeGh6eNPtfmGwmZrBEDVulK+a+BfckOtrSAArvczKOTRhtkJ3VJ1CQ8T
         o8dZlipyNc6n+z6fopUPJDchEU/3s+UO4w7gFPf3dwGATiai5rfj+NIpWj2++J+ih89c
         ZcmfzBwAwJ+dqOvFssma5M/U8VVG7WZeKXV4X8Lx8q+7yneat1QP0Kcx/uSjKYV8Wn8+
         U0gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261805; x=1791866605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Di5d/3diYTP5LLcoYoSh6i8r6bM56LiXfUkfpkiUW2s=;
        b=ZOsozKX4albigEbSJtqgoBe5eFSoWFi1u/N4I3/vSZtJD0O4b+HCM8dDZRTl8FsR1X
         lI/DT3zIkeMNe6VUIHu7wVHpJxgBEslHwUqB9knc5utSYKYk2YrNA7ruWd7p+2m0AV53
         v20qcbMkAyGxRD7rXYyazDRApUWr84O+gh0Em6n5xzDtM9CwU7D/dOCFwFhfEszf7jjj
         xAhx6Y2Y5OGTZdu898dkiSJG+GczDSCJlcawrG4pIjde9v6ZytsVJunlNhrTDRTcnCga
         uM7M6GfhxpbO1Gh8QAokS9cGbL7g3uVpKyC2IlnycorgwflV8cgWgO7uixHgD4IhsjGl
         dQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261805; x=1791866605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Di5d/3diYTP5LLcoYoSh6i8r6bM56LiXfUkfpkiUW2s=;
        b=wucjfr4hJ4X/BgL1tjchzWLmQa7aMoYrNCcKLGx5fGmTZycJaRwjlcl4Gx5slyW/AB
         YyseXoqVl7P5Lfvz3P72YGo0LK4ZmTwDW9wxaqckXTl7ClT3BhNqfB62ZhSK1W+Wguf4
         4qGdIvhgypPVERTTMbtc8a65WOZ0u8h4lWT8DVhDpwJ0XrQfwp2QB28opFAI3MqOmkfe
         K0mJ2GbMkp/h4grOYo2IG/ncSGwK51caQbVa11iQ0arPWSMeRvtVRdfGuGfaAMyoYpXH
         4Aq7UQifmRpAcKTnvg8pdnw5qXs4bDgtzPjqn7/54bqhGG4WcACz68M2Moh6g3Zjzivk
         0xDg==
X-Forwarded-Encrypted: i=1; AKwUvBytPbWjzLdQLVZqJZpgjvZie7WGvH9/47DxC+nhpKMpAq4vGIN3zDnhDVj+pdZGWhgeo3uq7HuPRbVRHGg=@vger.kernel.org
X-Gm-Message-State: AFuF++lrd5TwIgUbUnRjGDEXW6BowAbOwvORgLjKN8vOCGB1qo7MUOGt
	ynTNUQ2GXmxw6lJvUW22ghTiFaj6nLAUanuzhv1XtfySo7qEX2IzStyk47Mmqzk+qor9qHrkIer
	Yp/BrPCU4L5ZcLjrzm/HZ+OtjDH+hGGA=
X-Gm-Gg: AYBFou0VYGgQN885vGq5LxY/48VFYpMDPK19vTrr0h1eYVAFKgk6hsk9zpPbbPWb5HD
	RL7ZA1rwBL01cRPnetj5RND5JGfx2w6Zqhpg1Y/NmVYmK02saQ0nH45db03oJ5UMiSdcnPnQlAX
	CM4FG0Q0QABG8kChGX2zQDUiaV8qUAkSGYBOsltO5Juzusx7mCvyEVSrXYQoEdNxXFcK6k6pj8M
	mOjEqWg0CMbwn6WBmYtXXJJdtpYkVMGcOnQ9W4iENbNL1Uf8HrcaiQLJ0lBADtU44AJw8ubecRh
	/Q/2pMDaMoQ7z0CdYEgw8C6nK441TjTsWAYgFr2tWbMTvK4H+PD7oVvLRNfdcXP9eZ6xBCqsTdW
	gE+fQkhyeKeMUnT4Po/Z7FEb8OoS2hRw7fHe7xvpU9rCQMv0u9GE4fwTWYjlfn6aoUWoa7UJnOb
	Rueg9AmmTmXoQOuLfh5tdGi0Q/dfSElXJsflXLWzSfEweltHjbxZ2r4HaJCWuOROPbTuZCmJKc0
	l9sRH14x8rOTJOEDb4uvHFVPtKqhug=
X-Received: by 2002:a05:620a:f0d:b0:93b:ca79:3b0b with SMTP id
 af79cd13be357-93e50fd6157mr1598262485a.24.1791261783671; Mon, 05 Oct 2026
 21:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005014423.78677-1-jain.sm@gmail.com> <5c4e955c-b562-4f38-83d1-165a18ff0bf7@ieee.org>
In-Reply-To: <5c4e955c-b562-4f38-83d1-165a18ff0bf7@ieee.org>
From: shashank Jain <jain.sm@gmail.com>
Date: Tue, 6 Oct 2026 10:12:52 +0530
X-Gm-Features: AclHuK8HNMIqAxa0WH2Toc5o1kr9s7DNC-VIPkkQull85AVQC5APElu1VpV5qHo
Message-ID: <CA+FWx=nyhOY=aBo_xCpdhVEyKJvc5RY469xi98UyWMNkCDC-tQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] lib: parser: reject out-of-range values in match_number()
To: Alex Elder <elder@ieee.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Elder <elder@kernel.org>, 
	David Gow <david@davidgow.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 10/5/26, Alex Elder wrote:
> For consistency, there should be no space between the right
> parenthesis in the cast and val.  This could probably be
> fixed by the maintainer if this gets accepted.

Thanks, Alex. That line was carried over unchanged from the old code,
but you're right that it should be "(int)val".

Andrew, if you apply this, could you drop the space when you do?
Otherwise I'm happy to send a v4 with just that change.

Thanks,
Shashank

On Mon, Oct 5, 2026 at 8:40=E2=80=AFPM Alex Elder <elder@ieee.org> wrote:
>
> On 10/4/26 8:44 PM, Shashank Mohan Jain wrote:
> > match_int(), match_octal() and match_hex() store the result in an int
> > and return -EINVAL or -ERANGE on failure.  match_number() checks the
> > range by parsing into a long with simple_strtol() and comparing against
> > INT_MIN/INT_MAX, a check added by commit 77dd3b0bd17a ("lib/parser.c:
> > avoid overflow in match_number()").  That does not catch every
> > out-of-range input:
> >
> >   - simple_strtoull() saturates to ULLONG_MAX on overflow and
> >     simple_strtol() simply converts its result to long, so any value of
> >     at least 2^64 - 2^31, and anything that overflows 64 bits, ends up
> >     inside the int range.  On 64-bit, match_int() returns 0 and sets
> >     the result to -1 for "18446744073709551615" or
> >     "99999999999999999999", match_hex() does the same for
> >     "ffffffffffffffff", and "-18446744073709551615" gives 1.
> >
> >   - On 32-bit, long has the same width as int, so the range check can
> >     never fail: "2147483648" gives INT_MIN and "4294967295" gives -1.
> >
> > These helpers parse mount options and similar user-supplied strings,
> > so an out-of-range number is silently accepted as a different value
> > instead of being rejected.
> >
> > Use kstrtol(), as the comment above simple_strtol() recommends.  It
> > returns -ERANGE for values that don't fit in a long, which on 32-bit
> > is the whole int range check, and the INT_MIN/INT_MAX check covers
> > 64-bit.  The substrings passed in come from match_one(), which ends a
> > %d, %o or %x argument where simple_strtol()/simple_strtoul() stops,
> > so kstrtol() sees the same characters and accepts the same values in
> > the int range as before.
> >
> > Fixes: 77dd3b0bd17a ("lib/parser.c: avoid overflow in match_number()")
> > Suggested-by: Alex Elder <elder@kernel.org>
> > Assisted-by: LLM
> > Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> > ---
> > These patches were prepared with Claude Code (Anthropic), model Claude =
Opus 5.5
> > (claude-opus-5-5): the analysis, the Lean models used to find and check=
 the bugs,
> > the fix, the tests, and the check of the in-tree callers for v3.
> >
> > Changes in v3:
> > - Use kstrtol() as suggested by Alex Elder, instead of open-coding the
> >    parse with _parse_integer(); the changelog says why it accepts the s=
ame
> >    values for the callers. The existing "int ret" and "long val"
> >    declarations are kept, so the diff only replaces the parse.
> >    Patch 2/2 (the KUnit test) is unchanged.
> >
> > v2: https://lore.kernel.org/r/20260926012718.15675-1-jain.sm@gmail.com
> > v1: https://lore.kernel.org/r/20260925102334.49693-1-jain.sm@gmail.com
> >
> >   lib/parser.c | 17 +++++++----------
> >   1 file changed, 7 insertions(+), 10 deletions(-)
> >
> > diff --git a/lib/parser.c b/lib/parser.c
> > index 62da0ac..5e3abf0 100644
> > --- a/lib/parser.c
> > +++ b/lib/parser.c
> > @@ -137,22 +137,19 @@ EXPORT_SYMBOL(match_token);
> >    */
> >   static int match_number(substring_t *s, int *result, int base)
> >   {
> > -     char *endp;
> >       char buf[NUMBER_BUF_LEN];
> >       int ret;
> >       long val;
> >
> >       if (match_strlcpy(buf, s, NUMBER_BUF_LEN) >=3D NUMBER_BUF_LEN)
> >               return -ERANGE;
> > -     ret =3D 0;
> > -     val =3D simple_strtol(buf, &endp, base);
> > -     if (endp =3D=3D buf)
> > -             ret =3D -EINVAL;
> > -     else if (val < (long)INT_MIN || val > (long)INT_MAX)
> > -             ret =3D -ERANGE;
> > -     else
> > -             *result =3D (int) val;
> > -     return ret;
> > +     ret =3D kstrtol(buf, base, &val);
> > +     if (ret)
> > +             return ret;
> > +     if (val < (long)INT_MIN || val > (long)INT_MAX)
> > +             return -ERANGE;
> > +     *result =3D (int) val;
>
> For consistency, there should be no space between the right
> parenthesis in the cast and val.  This could probably be
> fixed by the maintainer if this gets accepted.
>
>                                         -Alex
>
> > +     return 0;
> >   }
> >
> >   /**
>
