Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5813812F1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199305; cv=pass; b=gh30gNMIvqQ2e2YW9JiFZk2Y5NuW9ny3C4z36S6T1eZS3r7UzgndDPyskcOzqsyuOmjY8oHfegeLRX3cLgQkAhzgh4E4Do1qKfIJQUxK91FL3XXgdYgG2fyR8dpETFRkww1NCNeNdnoGd0or8Qw7n2hL6Y2mAiiGpza+L1rjhNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199305; c=relaxed/simple;
	bh=DN7ajB5HW+161pKga12XB+ux9+zyLcXTHDVln4XJ3u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7lH96L3LvnjOyYSrcnLpGR5Njg8KgTl9x3Ql28z+5fH9ok9XM2hDfIG0UHIxXJO2h5niFTVE9qm9l3PkshtUConZQ9H+CS0f3SAPBx7+vyotZPjSEtDq5HZn99HxSxkvK7ZJFjBGOCDrOsr6p2fyDq21oj1MByqBUo04YYRSV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=TmgoL+AX; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="TmgoL+AX"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-853c07a76adso4002655b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788199302; cv=none;
        d=google.com; s=arc-20260327;
        b=eRRK8TlQV4Lj3xFV1g49IuQjtJXrgpWJ6A8urSqIiJXPJ7hpco96RUc7KZT5T/mwhF
         eACKBNTp2MnBSGYn3HLEfQoHTbCWcuavNs83kbYEnHbKxb+EuTigS8jScWJeocVXZolA
         INA1dagx33U6V4Y8v8NMURhmhS4FIlhIinkXoGsFbY/OuasdKGne0LxeGkTEjabZEcyV
         JOlZDO+AuRecpBhACUq/jPpN8xtpuAEjJ+t9SafC1UHABSY3XEiBf6Gvsq/7oTgPp0Ei
         dRYTGvY6JiTkHdmP/cpDAxneRu5fcOF28hvuEMKR9q2Ym2Pd45USk2vdyl9sp/PPdxI0
         qYqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qcH86xjgshAXJpFP6qrb20Jfgu2TTKubE4sb7Xw/UbQ=;
        fh=zH3vXUucOBkPfGc37BC1SW4CSGemRqo4RwDAnea6zrU=;
        b=ldTYz/8A2CO+VjyEQi8fwTNgEOsOEQcQTaN2ZkouQrbHqymlIFpOIDuM25zNwjeR4Z
         Gcy2ErW8qgbHNsqDkMxB75D4C3GJT1t7vbMSFqeGkUTwGG+icqWVnfEZ5dFe5nI6LtcU
         osmYLsveZm9EFn2IOPBThZUKeYzwSBuclCwiBuQ/UEwYGiMtI3QHZZZPZ3zde80VVlRJ
         bmmVuqBTay/y2+Tcs0Q7QMyACIi1LRqRx23D5bqLc4SFCMCDzH/e+eMJycEcZHCtBjxa
         tXvxvJoxWiObyUp4SLaSj9MAJJ5lO89CgkHDEcJmrJEG/LzZqmBLscDgTM/fHfyg0xXp
         E1Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788199302; x=1788804102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qcH86xjgshAXJpFP6qrb20Jfgu2TTKubE4sb7Xw/UbQ=;
        b=TmgoL+AX+K+1e+0xEF544/bUrWJ3T3a80izkqNfqNAKO898D8dx8I5/igau5wIciZA
         vv5WkZqD5Dy+XtReibK5Ct+B4wsdewKBKTguNt7YWEC3tSvy3LpjsMmN3R6UMFJ9GUNG
         sZawzTAYN7cWNQIAnORI2I6foeE6YDpl9p5NrUv9i/ax+ax/Bi5DIzB2XI4KzlsYc3oN
         VqH1GJB6jHJaMstxshrYgxxFObIJmQgz379rvIFau6q9DbkMblsZrQQ+vH1jjcDYDcKE
         kPspNZqPeAW/1UrrPh0NAxvvWqxEU0Vy2m8QiXn/qphWxO+iARdvnPNB5Ot9aIGIgr4U
         n29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199302; x=1788804102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qcH86xjgshAXJpFP6qrb20Jfgu2TTKubE4sb7Xw/UbQ=;
        b=hMmnsv6k8CwD896O8YoB3vw3tk6rUsGdCvavFF0sXwuGifwtAtfIAm8nKKSvjTrNxq
         ENAmyd1FnNpMVkXayLaRkms0leeX3uQr0lENNqRQjYMcKBg74e7Q8kaEG8l85UJf8YRh
         NWVA6uqYe3uUdvCf7NkISfqmjddxRf+F7p/yb+h2I9RDzNOw2m3YKdwqlYNxNrUcLV5r
         KSqzehkP5Lv9IC1pOsMlDnlrW+AuXM4Sh6ezD7L4399ZijZ+fjjUEq7VsO73m0auuAjR
         Jlo41v9Ay5yQ0uQr7wpfAQzerHc8bvuKCNtLO0GRmhqq/z8iJCpjzwZOlRD+CpgAPNnE
         nUcg==
X-Forwarded-Encrypted: i=1; AHgh+RrirBFK6iXg/H3LDBFI7NQ16fSZxNsuqpTRNWsKjX1y7Q5gxgrwZcZTEthGCYOmGoqxpNtlbkFQ+8Ox+QA=@vger.kernel.org
X-Gm-Message-State: AFuF++lSyFb2q0sn4az7+hsQUgxHL3s7i7WYKk7293+JT/nMnK0Dv2zS
	mu7PSiLOAz4RAu7GIE2GvzZeKEkpu6J4QyByLbOa9zmafxBQl1mVHyi8/TDxxOCcTyJSzNuCwBa
	sWBc73nz9IY8nK+4kriB2XvLzPcdBVy7/FH29d8eT
X-Gm-Gg: AR+sD12csJJAezYJ/elXsq4zyxd9jcmJXMhHPD8FaZXOofZjV1OvQ3uAxnRVwFvqpbL
	QwmmDR1Bvy60/fUg0mcwYdbquWeIrToNBbgSHIxeHA7Mv+wolcf+m+VauhBDvqw/NaZbURKTzvy
	6N3qkYCYmTrTBY1P0tO2i5IPS/LkLqgBeOHtEjxBk75O9D50YpFWcnyP1IQ8+yUZWNXFwBkIHXm
	ZxSy2wBVlSwCZz55j+W9DYjcl9wp0h9aMzIuNDb334g8u/SI075f52/yyLh2R8AUfg4YDRY65HP
	DpUP0Z6f+ldnPM1HoTnNB9+vU36Q+dwdFnkFlpwZ1Uxt
X-Received: by 2002:a05:6a00:802:b0:842:7296:dba with SMTP id
 d2e1a72fcca58-85629064fcamr42578483b3a.7.1788199302293; Mon, 31 Aug 2026
 11:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ef5bf18a4b3805ec0fe5fb638963ccbdfc01d6fe.1787077711.git.rgb@redhat.com>
 <65425b98ae226a9d19f89bd66a1defbe@paul-moore.com>
In-Reply-To: <65425b98ae226a9d19f89bd66a1defbe@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 31 Aug 2026 14:01:30 -0400
X-Gm-Features: AcwNN1UjA6EQ0vdTUMZpIzMqbTR5XzQsbvy_jGC-ejOGutXWjivMDB6qbx9VHhc
Message-ID: <CAHC9VhTAe1x5Fzj==SanTP85wxi+XQ5N2-m98fdxWmcAeM105g@mail.gmail.com>
Subject: Re: [PATCH v3] audit: free proctitle in context so it can be re-set
 by fork on exec_binprm
To: Richard Guy Briggs <rgb@redhat.com>, 
	Linux-Audit Mailing List <linux-audit@lists.linux-audit.osci.io>, LKML <linux-kernel@vger.kernel.org>, 
	linux-fsdevel@vger.kernel.org, 
	Linux Kernel Audit Mailing List <audit@vger.kernel.org>
Cc: Eric Paris <eparis@parisplace.org>, Steve Grubb <sgrubb@redhat.com>, 
	Roman Dolgikh <rmd4work@mail.ru>, Ricardo Robaina <rrobaina@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 6:07=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Aug 18, 2026 Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Between the actual process startup (fork systemd) and the executable fi=
le
> > replacement (exec), systemd sets a temporary file name (executable file
> > name in parentheses). If an auditable system call occurs at this point,
> > the audit context will latch the temporary process name into the cache.
> > This name will not change again. The patch clears proctitle into the
> > audit cache when the exec call is made, allowing the new process name t=
o
> > be latched.
> >
> > Suggested-by: Roman Dolgikh <rmd4work@mail.ru>
> > Link: https://github.com/user-attachments/files/20751461/fix_audit_proc=
title.txt
>
> I did drop the link above from the commit as it is contained within the
> link below.
>
> > Link: https://github.com/linux-audit/audit-kernel/issues/170
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > Reviewed-by: Ricardo Robaina <rrobaina@redhat.com>
> > Reviewed-by: Bradley Morgan <include@grrlz.net>
> > ---
> > Changelog:
> > v3: use previously assigned context
> > v2: simplified to call single use directly before need in audit_bimprm
> > ---
> >  kernel/auditsc.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Merged into audit/dev-staging since we're currently in the middle of the
> merge window, this will got to audit/dev once the window closes.

... and now it's in audit/dev, thanks!

--=20
paul-moore.com
