Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D8E4248C6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789228293; cv=pass; b=iofR52dm4h3CJ3MlXsrLZ364BRRiwq1sCBQxDEaOLR2jLrkOgFH1m7Ie6PerxYywxjAYNNAmpeBl5wYf7noKMrxC2ZpVflynVKfK/LTbg/vZRolVv24PO5vc2uuyrZC/KTOLCW8LMez4n0xQ0QG+j6R3VAXKK2sC+ALq1JDbtl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789228293; c=relaxed/simple;
	bh=SPedAVqPeiUb8NjiNxJnvdJv3qfQNNhKzjipm/j87EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5PLCz+XjybGu7IK5SSuF8fUDeXk5PbIJxqFZf4Wgevytme831dkq/fImqb3wYpe+eOFW8pSwX7BHgQS1/9mWzZLuspsm5yHjgzY4/IOX8eeOv1hDh5bgfFV5psgQT+AjH7V2+Dg/IAL833jxmoDVTlaUPKXbBmvHkN3u2sqoYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flUFPye+; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flUFPye+"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso144289866b.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789228290; cv=none;
        d=google.com; s=arc-20260327;
        b=Oiy8DYTnS3BmJTAMRrf9na9PmQpQkVV4yfSRjjGL80lNNKFks32rlCEmaO+rQfuLFE
         /KgJkh/ttc/jwbCLfvESzt7/Wb14fhyKuchyl6h8VWoNbUO+edJQPi71XKyWwvffyPKP
         a5STzubpBGxNzqJPlUapa6wrEKKN1IiARsXKpkvq4AsN5J7d+jkUzkpREfuawy/hT4Zt
         E4kMtmU9aL3XWKuF2WQV7ib/fpPjo1CHg0p7O5qSW0lOjNkzgQv8q9dopCJlFvvfuZ8X
         I4mCyZYXrYQON9YGd1Nm6+4s9q6PjqtQIUNg2BRARwCWz1oMRouISh72nUVjIYBN3sBs
         BQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SPedAVqPeiUb8NjiNxJnvdJv3qfQNNhKzjipm/j87EY=;
        fh=3LkwQ+V8gRW6E/Oui86hpQFdiW90XbUEWGCt0W8EusQ=;
        b=pRsS/7x73rUp04c1hQ5rPlCHZT95c7FT7GFJ4n03iWFgqC9mzMIJ3FGofl3EmA9cNp
         NX33FvztzAZlrLJGaJz88NpgiYgSttBwAKrdSsxL4ZgK8BACWNdCF+7wlJd5swYfSsPp
         r4VdnylpPoltA7YSQFW5cwCp0TQQkwJ2M9atfPokfA54NgOueuefoHHiV4gIsl89UuPM
         9xhr/2Gk7KGz4zcvGA1zDCFOSwLhxosBCl9MZBKw7uz3Ub3Vn45CbKE3yOJHoifcALw4
         Y3bMM8Kldix00kYt8f+/e0wWC22A5Qcnz4OyyBQxyF+4dEsMgxtcuuz/Yu2ZXVbRE+WV
         ksdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789228290; x=1789833090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SPedAVqPeiUb8NjiNxJnvdJv3qfQNNhKzjipm/j87EY=;
        b=flUFPye+q7pYckVgvjo7uiwouUrncBWQjyNXVq5DBiaIN6TvGVBtC6iVa+HfhRmjAF
         0P+NsqPPed4JOMYh0GbYnkumfZdz5dKVBms+0kFJrPzOzP9CCzjl7Lrcl/zWs/+EPwOA
         d8kAMgvwkxF+kIyAgObxACRMhZxY9lxCysgIxeg5sxsmXYcgPjInHsg5vlDqsLNCQRp8
         A58meTMhJzKHCHWgZgXD68Wz97X9vo4A2P/e5nzKqyAkEJdSW2qNyDQWRd1jAhPdt6Y3
         rNz6mgs1XoRpG9vimVD/rhjQZqIcy9divmMMjwSp2weWIA0iHRCidIPzoG3gJfLY1F1g
         VnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789228290; x=1789833090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPedAVqPeiUb8NjiNxJnvdJv3qfQNNhKzjipm/j87EY=;
        b=drUwkvO+/QnvJ6NoItimSpxxXmrdlDd37aehD6BpbkrJl8IAP3hWirxKKXImfhH+j/
         i7iwlk6fwiIYipN1711X6xDOpo9vThNdzc2pXSRhNhxRF2m2T8cihEgIT798zh45p87e
         VgeJGMR9xixiesgmHXf2+4/PChK7QTrHuvbSUVYJ8taPGnNbsl0W4WuPW0xXp98MAtnR
         W1N+iCiVw+LIa6EPVo06I/SCjvXiYCNAN1gTZHnmyTbOk1zRbGsac2pc0h1cb8ESD/Kh
         dWmVEhXz1oRveUkZxZWB9gCXYOwQZOz377y8UWYWe4d1jzneJfRSscsQWIJB0lh8v9Do
         EZjw==
X-Forwarded-Encrypted: i=1; AKwUvBzV0kIdJ6VMg9lmsyBhNg+u+Mh9hEUCSq44XW5LWixylt5ZzadBXnElayDnyDDYiIEK1G94CtgeeZA3nOo=@vger.kernel.org
X-Gm-Message-State: AFuF++noEPnciLtMVJ6ngxCeou14u8QiOdrE29gFSiT7zx2MDzF118wz
	9eQ20JDyplARVahURc6bbNsXpbdD80ozPanP5tP7tj7AwjkwCZA3nZ1IXc2UU9LjyxmMh5wIedQ
	r/gZB6Hamoptii6m/CIthKp0//F/4YyY=
X-Gm-Gg: AYBFou2PknlOb0GZ89xuB9vt2acHHkn0zcl2dpTWFYiX+0Qk2nh5tfOxXmrlt1F4q26
	d0DuajMu0KMlI2RAy0uFISGLfDxDFV45kkcbZjLU/aM6QGYSyLF1b6vEC/ytbJ+MgjPyqGJB5Ng
	/DKJiJFKuIbJvdrAxLnNQuLJQum3HFQx6bFcTqGksXDVqbl41RuI0ZSiY6Eqx9hLOYn+EWdPiZ6
	O/7YcLW1hJK/rIGZaNoHhxzF29mIqgmuPeD/nOS/DfekaRye66kQtdtz+RImqhlgxoxRZ+N6AV5
	jEsqyJ165dwClMh8nILuE8F4kHBYnOtWi98IDIoUMcpmv4fAf0YLPgG4O+ODfkOae7dNhfYi200
	ssrE7tRMSOIHEO89Ea3ClvuGqKadw0U00QtZzsgarlkTQEX3WHIli/NKf3th8sqZ/SnbiOm+dQ6
	su6Wfotp1kj4iUijbTQu2m7ZgOWg2jSle27fHM1g4NBCsXok1ZY2w=
X-Received: by 2002:a17:906:f585:b0:c26:1648:a075 with SMTP id
 a640c23a62f3a-c29667067c8mr442873366b.48.1789228290103; Sat, 12 Sep 2026
 08:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912010936.12832-1-ricardobarbosamscg@gmail.com>
 <CAHp75Vfpq7TXcqFfGfqBZSawSSyMdbCj_gdNRkarTHyzbkJL4w@mail.gmail.com> <CAOOzAW3+ySKGkSETW7knDLb7=aMTsgpJ4RSmRFcMjCb+gvaJuQ@mail.gmail.com>
In-Reply-To: <CAOOzAW3+ySKGkSETW7knDLb7=aMTsgpJ4RSmRFcMjCb+gvaJuQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Sep 2026 18:50:51 +0300
X-Gm-Features: AcwNN1X5L6R8VeJmkjFevWlO1Zk9f-pg5FslM8lqB45lWu3P0SnHxHdoYHbt7ts
Message-ID: <CAHp75VdKEzXDyUZbDwS-dGECjDXsosQ-62yVK9PasmjBBTEPoQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove duplicate blank line
To: ricardo barbosa <ricardobarbosamscg@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 6:44=E2=80=AFPM ricardo barbosa
<ricardobarbosamscg@gmail.com> wrote:

Please, do not top-post!

> Thanks for the feedback, Andy.
>
> As a beginner taking the LFD103 course, my main goal with this
> submission was simply to validate the workflow and git send-email
> toolchain with a zero-risk change.

Unfortunately this driver is not the best choice for a newbie. We
prefer to see real work (likely by a contributor who has a hardware to
test) on it first.

> I'll look into more meaningful tasks for my next patch.

Yes, it's still possible to submit some cleaning stuff, but do not
expect it will be accepted or even reviewed, we lack the resources to
handle that driver ourselves with all contributions it gets lately.
Thanks for understanding.

> On Sat, Sep 12, 2026 at 8:36=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sat, Sep 12, 2026 at 4:11=E2=80=AFAM Ricardo Barbosa Dias
> > <ricardobarbosamscg@gmail.com> wrote:
> > >
> > > Remove an unnecessary extra blank line to clean up code style
> > > and fix checkpatch CHECK warning.
> >
> > This is the lowest possible priority patch, if even considered. If you
> > want to clean up this driver, there are more interesting tasks.

--=20
With Best Regards,
Andy Shevchenko
