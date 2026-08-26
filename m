Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127F9282F17
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781395; cv=none; b=Imj8syLhfB4OevmidUbqYGXoQXZpftM4WrCaRgvZ23D1TuddSENI0dJnVZznoWZiHAd8LTkrAUI+keJ1Z9hBx1u7Wy2w7+L+U/TDEg2v81uA5zeK0mgo9Y5RyUZl9/qHPGt8kV0Mac0GI2Pon8/EsrLD2BFx+WjuV5rbkdGH0ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781395; c=relaxed/simple;
	bh=7nRGKXiCvIhNg2iK1eq2i1DAWBNYbtZPQzQwxqfRZ1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0UEUETBejK/T3hrLL9PQ6nO+qFEfztzAUZ+kMYfdEldlO2l9dU840Nt+vajnZuRifJD37g0NKjIBhTpDDm8KTpo3r9HT8O0R/yoybqPW1BKAJ1IzCcU5Eoj9/eKcqfWEOiTJJplkOUggx8N0u38iR54+yhPOlxlkYvTZruTuHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cku6h6eE; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cku6h6eE"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso2321197a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1787781391; x=1788386191; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKClJmLtzZB0u0KiPgmjI6hyhyhnwh+zpC3wetBduH8=;
        b=cku6h6eEvVGmpu0TYxGRHZmiCxreduApEXq09qvkx/uV8hiieh+hRkisn2z8/Vfv0S
         VwTJtaXysARgyZg6KdvHaN5l2kqaqQHHRViLfRGhJ+3DXC2vZpEIVRPwuuPM/BFJ1IbI
         EnIM7v1RFaK7kQzWa1IfxwI0wbCDnnNJIBZNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781391; x=1788386191;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CKClJmLtzZB0u0KiPgmjI6hyhyhnwh+zpC3wetBduH8=;
        b=bnZSUNiJ2vH/ItqKJHELJ8RKkCLZ+Mh0JrrfYQV7OBDE5f/rm3DDDtl4mtYJTCfA/o
         VNc4moEVJLXBx/+fNmsklUxuTBiEfIvM9YP6F6D+Q1amTv+Q9I7TSTmDOxU6XoXVFywX
         Fzg1C5CEQ0CzSXt2IRx5pDzF8UGAtI9kiwWOJ0vj7+5mxB05PSxXR34ep1ctvXgdMctX
         Z/tpNYsg0A/0cv7G3/7KbO81UKWUEKPgrO7d0+ea3NmBcqbZt3/9FwlEWjxCBtEeSYxN
         4/EFWY5njApAMLxbhc7DXL3xEROVbVTSKCh7YUV/wi/F4wZYW6lB/0qLBDB+QhgiOViM
         XvdA==
X-Gm-Message-State: AFuF++mmI+5P4dOmM7EKTAb3i//lSMnHEm5l7xpn2okjT7zhtjMeoP1W
	hQM3uN/y4LHjkmQlXBKpeWORgVYv6O7WZEcD6zHmzLaXLzZNluGc8igkf/GjxaI9JUWAcwJJyhF
	XCTSQby4=
X-Gm-Gg: AR+sD12tP7cz94l0S56vP6npAsD72p7xtLsRFZEp6Ey1Laq0/ABDHBJwjWEtr1Q/+Qw
	IrOX/Zalr34nzHFP8SAMM1RDZn0WM9aJgFdPT3wFr6HCQSqM0ckXAp386brApX4hPucQFrm5JEX
	x/lHyvULWiBCLVnE1dTLlwQXH2Yf5AcEQWQAGvyXAVDkqbkfctfb2iwHAWazysx0tTrDRcbiSg3
	0x4thAUjU9q4yMMJNKQWrj4dBxxET80A+fvR1GVCdZYM5R7GViglPRaSsbxkB3YO7SIPm0r/hET
	t50oYcvPu7f/Ts+mBnwV1Acrt9rY8PZ0wt/de5JLK3HLH1ey3++BeLYRaTqKboNIHvMbvMcL/Zk
	ibucHbi8ws3W7PcZ/Fuk87qd6YuRbhuOnOid5VC9e8KRaMFdcuHt8iHPQ2WzTVYw9XKjCl0H/LV
	XcAaDkqptPCN4Nsx+TJXt6VPHBC5XLJipU7nD/sxtKZSVdqYqa4kdQu+aekBbyZwGRjXm1nyvZt
	OXP7LnGaeL69Mfu11uvW7t+e2Buzpm/aia+KA==
X-Received: by 2002:a05:6402:538a:b0:698:663d:d7bd with SMTP id 4fb4d7f45d1cf-6a5df64d1f8mr14447719a12.11.1787781391116;
        Wed, 26 Aug 2026 14:56:31 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a25sm5704003a12.18.2026.08.26.14.56.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 14:56:30 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so2196584a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:56:30 -0700 (PDT)
X-Received: by 2002:a05:6402:44d1:b0:6a3:eb58:dcfb with SMTP id
 4fb4d7f45d1cf-6a5df64cb78mr10711361a12.10.1787781390292; Wed, 26 Aug 2026
 14:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826144817.7af76334@gandalf.local.home>
In-Reply-To: <20260826144817.7af76334@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Aug 2026 14:56:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj9O9CajaEKFuHJ7q1TgNm+5n0WgOWcspDXjxVaWq3HFg@mail.gmail.com>
X-Gm-Features: AcwNN1XQVGxbcaVovuTVnyvMr6nUyiYHR51JbbjRA1oampIPINirb8qhyIfQbik
Message-ID: <CAHk-=wj9O9CajaEKFuHJ7q1TgNm+5n0WgOWcspDXjxVaWq3HFg@mail.gmail.com>
Subject: Re: [GIT PULL] rv: Fixes for 7.3
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Gabriele Monaco <gmonaco@redhat.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, Nam Cao <namcao@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026 at 11:48, Steven Rostedt <rostedt@goodmis.org> wrote:
>
>   The rvgen kunit command generates .bak backup files and these are
>   checked in for selftests as "golden" files for make check.

What?

What broken tool checks in generated files?

I've pulled this, but it sounds entirely insane to have checked in
that garbage file in

    tools/verification/rvgen/tests/golden/test_bak_kunit/test_bak_kunit_kunit.c.old

and you should stop doing that.

I'm very tempted to just do "git rm -rf
tools/verification/rvgen/tests/golden/" sicne these all seem to be
generated.

Having generated files around is *so* not what the kernel source tree is for.

Maybe the whole rvgen tree needs to be taken out of the kernel tree.

           Linus
