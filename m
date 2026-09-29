Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFADD2C11CF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790658377; cv=pass; b=eeNyIzO7w7vnJ3tsBgx/+Vd/Q7JhDTWnXwHY7t6buJ00I/BwbwSgJsIIKyGQ9UJOJC7yfalFst3KL6Ve8sdcCacrfnulYi35KASIeWeH3/OT5Od74Isgf6FRZ87ajrotxCBQWR7kTL/x3SvKDRH9gAGcOAUlNcxna7BnB9laQgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790658377; c=relaxed/simple;
	bh=lQceDshmIcxnm5pr2ANM4Bj9m14zZHt/Rqa4vniZwo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMu520dVZi0GHpcO9V8Jb4axVPwIND6wif5GXEnr9LkEMbwdmRKnRximhx7rbaFg2600iKJftI/6jmW+N5oMKRqQlQlrXonj6YalK/LFseBso8R3W6sKPn7tvkRIIRlJw+l21YsPIdCrXtnqJ2BIWyhC2Km8IF+GdL9I0jBfBzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dH8X+HqO; arc=pass smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dH8X+HqO"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af4663da5so106113f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790658374; cv=none;
        d=google.com; s=arc-20260327;
        b=Z0h047tCHsoHs9CGupnEnuid9R8eMmwjj08/SgBCZtANLoeD1hCRQ+fVd5ly8m+JyL
         +n5pAV/iYFZn9cclaNQCNPEfE+NXfH2D0AuRJwTthgJyAzMoILi97Jxxq1xHvR0nloJJ
         fN3C8K6/Z9ut/Fsnjy/nv/XUdti7I8fvw4qZ2FPZSwE7jZ7xwzu0shGYk22CVC3kwpIL
         xcoqV9mEdtgp5nCpYaAVR+AjBDkEYINNtOxX52fAMgb7wKCS69D2LXqtnopI3Gui2FCd
         0sACf0Fa05o+Mq1TCGiHx6hDMrvu5F8beh9mq3YM1bm2mhrUytBHtw5k83vGntdGBgYD
         nSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lQceDshmIcxnm5pr2ANM4Bj9m14zZHt/Rqa4vniZwo4=;
        fh=vF+Z2w1/UQtb1S5XWA0JnkrhI1ekqsL1ddQ9muEUAVc=;
        b=Xe4M/cd3qoJH1XhsTOMQLqWHaiPmZtriZ0UZg92MvzLebnGE3rumuuMfsJStrLsYHb
         i61JGyV82SFtw0XTrnRz2+ClJ61PuRUXW3EB6XYXFdN/JEqpFC6rbJJlMPVjMdHJRRgJ
         zO5IsKfVuFdHlwHPQ+eIvXgaainstmtHrBhCyEphiy0en8psGYVJIlYWFuYMcOl7FFUO
         mvmzqv7KPI7ylAVLgEfv96bDu38Nl3+9hRUja5C0CR2Ybu6O1r7D+5Po3Dud8LiKlvAR
         E1tp8MZBZUPNDuqX9tMe3xkbDlH4Y70Cl+gmQjs9/8CL4ZVsIKJ2ysZB1AFzo5imELbz
         HMOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790658374; x=1791263174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQceDshmIcxnm5pr2ANM4Bj9m14zZHt/Rqa4vniZwo4=;
        b=dH8X+HqOmR0IvbDT3tIprREFfd7UakbWfvHedWGe9PpLIqTg5vckNEEePwwCGcPD0M
         ygfw5qglrqFmQiO4hTm+lUolpPQBmyFHjAjIbjlvLh1rx5RIQfSl4q9rhCzKLoC2ZcNt
         4sr/sw4ez/5wgkK30tpb39a3Ud9AOHp1pmQPUeSZW9bMXWDKWUaif9orpQe1WWH4An/U
         4Dxg5f9cwNgb1tWK3Nn2PrP2TbcbQMl5qwZ+tuuJvvm5XO2uTEM/OGa6fng5cMSFy+aN
         Dvcr7fdW/e3lkO58SZ8UyErX9caXOYtmWQvfFrto7R+uiUnIx1WyAxWF4ZnGYD9DeeMM
         KUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790658374; x=1791263174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQceDshmIcxnm5pr2ANM4Bj9m14zZHt/Rqa4vniZwo4=;
        b=GBEHC8zXZwaBovEpIKKA7Fwkl9LqiUwwcX/FiPYmYbeV6/Xrj6lfgypDgjzLzsTC4l
         BrxhM4cXcNU7CBr6tT/9+6u72YUHSBN6VI74jSUOkc9jYbi2VEEzFjkGUjvtMnsDBkjN
         6QzNdV6kiAWvljHeqpjrCbHRcr31sjW8IRNkLNk5xEimC1SEH7tfULIRAnaHOgi+7CUs
         sgvoPNsXK7S/XZ+d/kG1FSpna/EU2//WrPWJXsjy+hzeW5Gbvx0ssBg+KjW15r9o95/l
         XujMb3WH97eqfxh9uBHYycU0jytclkopZy0ojmLGMy/b6bG8KT+asnW9LkZx7Ox5f5vp
         7Xug==
X-Forwarded-Encrypted: i=1; AKwUvBwTKYR1uuYggL1+i7L5I+GFaUdA8aiHkBVMlPzrAmtATBwSDIjkKRko+x27CHQa+ICTKgVHWa6NYLozNQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGQv37CVaoXfbViH+0hKg5I5r4FO1VHDtMwVWmvEs8I1KQc7wr
	CP4HtLA4ATe36OcaAOdfBt4sBB2x5LaYqrHt0i6tTI9BsCDSYWyg4gcyy7TK1IHapf1Hq12YzhB
	yH7HX6Rm1hXNcT2d+GxjBRzIpE6W7u+3KrsxaUCwV
X-Gm-Gg: AYBFou0XLHuQ8nlPOE2sewBz5Ymh+IuQqAp7L23+jUIqKNiIMsDoivtCIt0vLiurOWZ
	pcQJDQlgCw+TQV+mDFZaX7iANX6g3QSsimqfznnfXqpF4gdhrTVvrslTgsx3DNpTyw3yVwEnJnh
	ChPLSklP2umX5WS7R7gClhP5ad38b9zUkCByjTqlSixs5Ipy+kTB6xozX4aeePzSDTw9uG9mc5+
	coeMHBIxkf/sO8rmi9j8ag3MrOZ2QC9sXxLodtW2nGdGxLKh21oL+r6Y+iDYj6vdqK92ykCLbcZ
	1ptoEgNmSNJqiklV8XxGOO9Qc1HRvDvCM/f0gL+A+jWds5W0hynUy8Oq010Jy/e790ye2hEdlgY
	d5WMFAYFG0V6NRzk/ErSnyV/9CBNpPbsI6yuePkrBTtGF10p9x436iMouzY6Au86OXSfLdg==
X-Received: by 2002:a05:6000:400f:b0:486:f856:1975 with SMTP id
 ffacd0b85a97d-48872a7ed6emr28989136f8f.22.1790658373306; Mon, 28 Sep 2026
 22:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGLNFZfd65P3C7wd=ShsG3BwVqx56-3FTXRARvFXVoXEJmj6Lg@mail.gmail.com>
In-Reply-To: <CAGLNFZfd65P3C7wd=ShsG3BwVqx56-3FTXRARvFXVoXEJmj6Lg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 28 Sep 2026 22:06:01 -0700
X-Gm-Features: AclHuK-G3nC4fZFb5XTwTm_Ndg0dN9k5HC4ZdnEzBSe__7iBSOMXfWozEdeSNPY
Message-ID: <CAKwvOdnmU0qt1--_1pO=8F=D39W-EEPHojc544APimtartFo+w@mail.gmail.com>
Subject: Re: [PATCH] scripts: gen_compile_commands: accept object file paths
To: omer zalman <omerzalman42@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, nsc@kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 4:46=E2=80=AFPM omer zalman <omerzalman42@gmail.com=
> wrote:
>
> The command-line help lists *.o among supported path arguments,
> but main() rejects every object path as an unknown file type. Map
> an object path to its matching .cmd file so the documented input
> produces a compile database entry.
>
> Signed-off-by: Omer Zalman <omerzalman42@gmail.com>
>
> The exact git-format-patch file is attached because Gmail's web
> composer removes tabs from inline diffs.

Do the instructions at
https://nickdesaulniers.github.io/blog/2017/05/16/submitting-your-first-pat=
ch-to-the-linux-kernel-and-responding-to-feedback/
still work?

Otherwise please checkout `b4`.
https://b4.docs.kernel.org/en/latest/

--=20
Thanks,
~Nick Desaulniers
