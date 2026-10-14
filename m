Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4314B55C1B5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997388; cv=pass; b=cGb1uuJ5rytoGbsHFcR199yNI9ngwTBLsLPhvrX51suyC/CTeHjIvqJvYv6/2PZ4VtvQVE2humm2OY75nNx7zqpWey7GOfR977ICpwlyGUwMYQsTmbRe00h2XkwnG6CJs768dchiHFxRf9N7hLlRv1qxsqAiuJnq0FO2Q3sGUaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997388; c=relaxed/simple;
	bh=X0/63h23d4RMhaW6j99etRVwb5HigSuyzGIZ3M+xFDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h089Z3eBNVlc93KneEzsss0VY9DmQVgj9AJ7mtOmNEWLnW6LPe+dahypBZxUq28R8QakqTqTEuU7jsYlWwYIpVIKvWXqiVMJc8M0JatjtcUHYO0GXlK9a3HPd4nYYtVXjNSxA0EODrIszSQxXcjXvmggWYcDy5ijAeHbnPTw4Ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMBAfSah; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMBAfSah"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7c337cd6614so2304214137.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791997386; cv=none;
        d=google.com; s=arc-20260327;
        b=Ks8q8BxrLC/EI9lYvj/d72xt3nbZn//8ge7mzhPV4+Fb1g2iLiy8RPexiYHp+zvv+S
         vJWq8wHl1Q8O6el8HeA3sJ/l81SFl3waApjKRbBPmgSvoJ3af3i+oQYGV/3ZQ45Y2o1h
         9pxJJz0gfKt6MU5noZhAjUkxwwUxRvEAyHAXeqWvx2tpfhGMHTy3kMaPsRSj25qWL3Nt
         EmZ+1g/5+0g0K08nf06QiaZ/XhHTYw17Er6xhojvD5VihBR5Y4cI8LXH/TgXcPPnzlft
         TqNMjb7IT2/Jmv6o6Y1mAb3uhU/v1aCXvBKufyXiPnbHI/txdCe0bZH5B9J99wZrzUFW
         HWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WKSkT6scNX2t+/rtJq+i6cTIZ8UL66Szs79srg+q1rs=;
        fh=7zjwcBlA6X97pknryJeGQJddaTMI0G4qwcKNZeD1Cxc=;
        b=NvvTDlYvK2TqXPxyx5y0yLPi46DqJLDmsiKwr0HF/HB64yEtt6ApEY4Irnacw7uYg4
         Wm1mY9OZXbTjUHSWiD/Ebp+6jTvo2ApsifPfyYEfb3izUhLo4RGw90xbV0m3UNqjFCXB
         P5l06e8vHoxPl4mnC7ZIpRaLdQhk2Wdvs5uWo3/y5lZ0PnJouDV1Ek+OtvEYwX0VZbG3
         9CS7zIYk/tQv+76Ro9RAKNSjWOJiC5kBUlx8Kb7WlKogtkDr7S8YL9HEDJqaIABHcLaB
         5ogz054yHMc84OPKGXdRRDGD9MzgbTPxfVGp3qFXY7YEyECmvSwaCg2xFpHryFT5YLQ+
         xsBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791997386; x=1792602186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WKSkT6scNX2t+/rtJq+i6cTIZ8UL66Szs79srg+q1rs=;
        b=VMBAfSah8lb22/ugMKrH2ApzC2OCYCkC4xBO1VYYp1wP6RgGFysJPQMeXvw8z6SAch
         I2jfLrBB1VPexoPvcH6ea07NjwoI8yKB3zlhTBsuF4V1nSczOD70mMTgUUO1t/dCMvnR
         g1Axj2IKj8WZJdyWBZU+EHzj4ZfSH0grMCX27O1kf54v7Tnu34Y9nKke4T4Iw78JSEkc
         QFQhxPv7fZFXolfSvL4eqJNbeOYS0YUlPBqUnyezm1dJHvKxKg6hxixE7p8/K/Qnz0mI
         4ZlHZuYVnPNrg2Y3n9MNzop6OiBzCBh+V6kti8OJVFogS8yJBVqoPRrRabH1UxXWS38d
         0+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997386; x=1792602186;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKSkT6scNX2t+/rtJq+i6cTIZ8UL66Szs79srg+q1rs=;
        b=17B9cCjFTbw1aKbf7w1SkRNFta5dTWlHlflDdCLVkJNpWJfj43o2vUSH7QBL+yceum
         Ed7MpjZqw5lUq3uVoXgojDGCHZujdyZie1x7YGHefkONpJsMj0TiuNozD8zpdejoyF/H
         NzxqExR7B5wcqwE0i0jQG7oqTPVcVxILy3CW84V/dSWIerv0CfF0DcZG7KN3/Dg4+l0a
         XVSw5qS65BnFIF9zA4hRm5lHAw7uFGfTivH16fU/njlwN0kVaEwy0nlYg8CW/fwzmNFv
         hit1FsUwsd2xn9jElaNxQ8t8d13QfqRl9ehBmoj7bJS56bH11aOXwUkMbsTxazql72U6
         ToMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmoikcVKvR7jH5c+X/ILWLXkqzU4lCmeGLjAZ8yEZWGP0bv+mSiY8ssvhfUqraoFwA0IsFwzGmGmlV2cE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe61nb1X2lb1tZiPFJrY8VoVYdcDD9j9AC82AwpUZCtFNsBzJb
	8JxN3nT8KmwvjgF6PsP0Vh99C475CT3R9+gFDwnyb47JCxs//oY2gDDj8vy+BaFqm+3cGM/cYyy
	Wgs+UQ2fRkIwF6WVL2fGNwTYGNfT5Q8PjYh8nXazFxw==
X-Gm-Gg: AYBFou2KzsL+7pp+u9dafURq6RP/lSmeKi0YouP0UI5JfDAiA1VXcMHTF2SmRHQipU2
	Ca7qEz+1hjg+oBu45H8jTtbFJ2QaD9cdGTs5TRchL58uscgoGmZpnDrDiiwC/zgeA5gY/jbka5n
	Kdq2j3r3hTeeJm+aEPMIpiwF6WFnIpCGOlCNktUelbZfK7Ru0KyZASQ2S8eHmLmFL5wpbhZVhnI
	ygQ0+VAgszBcwOp5Q1nMwSng+04em0AfAn7dT/m+BXgjzUrNbBTjgFVuupqp01VpEGFu/eevSKe
	DRkCnQHuGNtE6FasiC1rt/EzXryZjO256R2HTEJD8+rneDylDw9uqk1r8IbSjcF1aJ1bpSC96vF
	CJDsYPkS/hNmONwqawQ/R9SxbZBv8QysXXM8gyfoL0onCP8517sHLmQSNGt2PFq50X2mz
X-Received: by 2002:a05:6102:424f:b0:7c1:9f20:36ad with SMTP id
 ada2fe7eead31-7cb36985e66mr5432455137.2.1791997385802; Wed, 14 Oct 2026
 10:03:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791933697.git.lucasadramalho@gmail.com> <3f9bdd755f3db2405ec44471ebdcfb614bf41725.1791933697.git.lucasadramalho@gmail.com>
In-Reply-To: <3f9bdd755f3db2405ec44471ebdcfb614bf41725.1791933697.git.lucasadramalho@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 14 Oct 2026 14:02:54 -0300
X-Gm-Features: AclHuK9QC3EQ75rLe9HTtHN9Rpytiw08godnH_mR6QYhJ5b38reZqyt0tZjRwqo
Message-ID: <CAMAsx6fTx4hO2Dr-5a7R=OmUsbVvM7LAibh5avY3aXzwUpNU-A@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] docs: translations: pt_BR: process: add driver_development_debugging_guide
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 13 de out. de 2026 =C3=A0s 20:46, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
    Hi Lucas,

    Thanks for working on this! The translation is very well done and
  the documentation builds cleanly.

    I have just one minor suggestion regarding technical terminology
  in the DebugFS section:

    > +Com esses arquivos, =C3=A9 poss=C3=ADvel armazenar valores de vari=
=C3=A1veis
    >ou gerar
    > +dumps de registros/mem=C3=B3ria, ou ainda tornar esses arquivos
    > grav=C3=A1veis e modificar
    > +valores/configura=C3=A7=C3=B5es no driver.
    > +
    > +Poss=C3=ADveis casos de uso, entre outros:
    > +
    > +- Armazenar valores de registros

    In the context of hardware and device drivers, the English term
  "registers" translates to "registradores" in Portuguese (rather than
  "registros", which usually refers to data records or logs).

    Could you please update them to:
    - "dumps de registradores/mem=C3=B3ria"
    - "- Armazenar valores de registradores"

    Please send a v2 with this change so we can proceed.

    Thanks,
    Daniel
