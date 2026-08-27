Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDEF26158B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787794966; cv=pass; b=Ke0qy7cL3mq6GpMmlfKUAH7nZocAPKx/00KKhaoYXX/sx18MH0gKmN8k9/GU1+5KADgqBhrW/M/AfGrhPE8dYJSEtSNN03aD3IMGqXiYc41mWXN03DQ6Dk81yetaj7OrLWMKiG4DAXUnaRbiQtHMYxc//886h1Z3aRY19Il0kks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787794966; c=relaxed/simple;
	bh=jQXZpWEa69A8mhfcE1SS+n9nS7LZ88iDUXIZo6zOxlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3hJxrJe/Kh9oo5dqH7wbHWapy3uxj3JpY2hAVQUDTBpLvUsesEQY/7c2MqVyJ9eb8DxM1eEPVgvUj5uc4EGENfLmHbat0svAxmpoD7vwrgR7dpmojYfCAZ5vHq/zdW/npkKMbfhQLz8nlZJ0xMX+TucjiodHXhGRAJcrwbbgIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZS/rb9Jb; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZS/rb9Jb"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1816424a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787794965; cv=none;
        d=google.com; s=arc-20260327;
        b=XX9zRosv+MbbtUArLA1d/HMtf3WLWjWC3Zs/rT0O2oJuRTEesK7+tOo5C66aOdw1v/
         4lssfox1jtjWzoJLkl3IOLZrzDCdmWvrCxORd4WxCkgvBCZqivL4A+wHB0wZCj7APWrd
         UD52yjj1nzMiq+4rix5OQMhavzO9V13MYVWvRTp9Bo5JIYoU+Y4GvXXom8s+D2A92e3R
         jnRr3h5Ktw7dBVhfctYO2FqVV2epcb0fk7eq+ajZQEjpYq0d9fsg6+IsUEEtd0Ir7yNe
         s8F6B77W4EtqJa0dZDxQ2SLZGjINpFrbxHcQyFhnsDKy2sWHQQq6WuDvNO/9mC4wuIje
         fE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MW12y6xPgbaKCNUYBedVgTiCqU80qClCqNc6nnpgicY=;
        fh=HYtWxPely/xvo5A/V0RytCd4WJ/ZKhkmUDzpphz+T9s=;
        b=ffN9SH6fhHsThtYXSBOW3FNn2vg7BH1My0u9qJ4EbqWWhmsbiGeTuoG58Ffylrm07A
         7elf5QicaHGHQ+r5ZfzhHMC6lYNIm5cCfSqplESqDopd2ktKBs23ZJ7yU89eGSFSYhzM
         o647YbJ2oHk0JjBRh49eiaF0RTgyDn3jnxTOVXM220L9OKtIpx/oLRTOsCJRqCKUdzRK
         Ky4hpb+SkJsMs3UfNKoGQAVd6oVIyZIfufIHDXvV/bKVbQTafoKFG+IxrwhXUnWTNiHm
         7ROHJ/XHSsefoykAAl9tCa5fVroiIhoMYJ9kpr5UP0rofRzxKMBEbKVtzwV8+uDF2gJG
         B7SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1787794964; x=1788399764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MW12y6xPgbaKCNUYBedVgTiCqU80qClCqNc6nnpgicY=;
        b=ZS/rb9JbpBtoMVh7PAYy6LGfjcUOZP2BzJct6dr68tYf05WpE0/kXRfugBF2dt1Xmp
         1SX1TGUOyJpv3Ekc98KdvsO9TqoPSoJDMl7a5U/mYuf/mT480m+596SZIHcwwDxSBuQP
         fbk3Fmw3qOIQDaCNJjzxAtzqZ3ayPdb/izVnwgfw6I+u29RzyxufkTocXOsm5dnDhvYz
         gYI1GEr0iGbXl4e9kQE7CSSROv7FGbZ3Y/0xb6kytciu7fohVc26DxWGwu0EjROrsOZg
         v1z0KAe1QAWQFgmpgodEuZr7DfP/ysAWOuUr11HAF9js4TeX/w+SVXp35Dvm3HRsWJs+
         u3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787794964; x=1788399764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MW12y6xPgbaKCNUYBedVgTiCqU80qClCqNc6nnpgicY=;
        b=h0vd9iY15W2breSc3LHk48YimBwoR6b5zo7Xr4dn8IZwgn2A83C6O7EEzMYb/KfH0z
         B9ObfFekyb3S89Gc3+nWAK6PunuD8w4/1Sm+aURCf5C+tm0Idk+SktDJu6h+8HIDmy+T
         dd/9AosvrfW0ST4ack2Esu3K2IUHqW9Y8e0Qv8WDgyb5IIEjH2Cx4YbKqolKNAmKU/0q
         OcFDHoUY+7uEdwmRNFKcIeYR9qUayMhxLMYfo0P+jPxr76kPwtxvdWRBxXSaPFr5+PuX
         u0rNMZxeJCF4PXo3IxvI4Zkl41V/ja2Ld2zo6uClNcAnhe6kG+AkaD6r0SYBp7Ov30gx
         3NRw==
X-Forwarded-Encrypted: i=1; AHgh+RpZuEg4FVcC5/v/JxdRKlZHOPIlUIfo2E5zeNwsYwUA4CqhHuOoysTSuwaVJTtk/s7Mnxp+lkLTo/HhFzc=@vger.kernel.org
X-Gm-Message-State: AFuF++lkyiyPwFXIWwVpt2W/cRTc7A18X5raBiBQlpcllWSh0nRI72Uj
	AOqgM9Lyg4UgkpTn5gvt+51+BFlK3eokBKWe96FmsX47yJyH6aFXdQKpx865LBhF6P8F1PR+0Y2
	fAuA4W/5JcBOoQYGF4NyqHCd/R54Ek2Y/SqrUlKet
X-Gm-Gg: AR+sD12cjYF/vTTFzxUZdmZrsqh4bLtR1mukvl862GeVgn2Znx8FzfoezJlwoOO92nB
	w/xgQx/cAo6ftw6lwTxFSRirmIlcSw3AtsmXnH6YRXN9zq93Q2af2M4My6npMKGym+W+QdcAIC3
	qpzgDu2539P89Shrm9sfy8AjDQAZwXierJPDsYtESymBma83agh80qfQFsSwbar1VBsAXCJb7e2
	oIFiVDAjWom9ttepCXf/Qau87rMH04jFymbRbQ3X+CQB+7ti86Q6rrXEkyJQ0ZP6Sie5rQO6sXr
	8t3LWyhGENdmKr+YyUPI4UpOgGJL/mDT/7QbhS9ZTtb/
X-Received: by 2002:a05:6a21:9202:b0:3c3:64cb:9b99 with SMTP id
 adf61e73a8af0-3cf76283ed6mr24475298637.6.1787794964690; Wed, 26 Aug 2026
 18:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a8f89e5.1d9ded08.62e62.00bf.GAE@google.com> <7F4D890F-C006-4855-888A-62ED786A32ED@mainlining.org>
 <CAHC9VhRvoDkJ0Pn1WHgTAEJ5RwZTmD4vChFGgqATn90C-Aae+g@mail.gmail.com> <1129ADC2-8838-47EE-A817-87631D933BA0@mainlining.org>
In-Reply-To: <1129ADC2-8838-47EE-A817-87631D933BA0@mainlining.org>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 26 Aug 2026 21:42:33 -0400
X-Gm-Features: AcwNN1UZQjdl8nAFoKRE5OXLt1mXTI6xe4mUlw-2BQCvwnerelt_uTfOeFp0llk
Message-ID: <CAHC9VhT-SH8ci5f4cEGafAub4qE09KgWPJHRMgO_Uhwca2c3Bg@mail.gmail.com>
Subject: Re: [syzbot] [audit?] BUG: unable to handle kernel paging request in integrity_audit_message
To: Bradley Morgan <brads@mainlining.org>
Cc: Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	syzbot+5ebeb3089ea6439c37be@syzkaller.appspotmail.com, audit@vger.kernel.org, 
	eparis@redhat.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 9:23=E2=80=AFPM Bradley Morgan <brads@mainlining.or=
g> wrote:
> On 27 August 2026 02:22:17 BST, Paul Moore <paul@paul-moore.com> wrote:
> >On Wed, Aug 26, 2026 at 9:06=E2=80=AFPM Bradley Morgan <brads@mainlining=
.org>
> >wrote:
> >> On 27 August 2026 01:50:45 BST, syzbot
> >> <syzbot+5ebeb3089ea6439c37be@syzkaller.appspotmail.com> wrote:
> >> >Hello,
> >> >
> >> >syzbot found the following issue on:
> >>
> >> #syz set subsystems security:
> >>
> >> Note:  here's my suggested fix, in security/ima_appraise.c
> >>
> >>  path =3D dentry_path(dentry, pathbuf, PATH_MAX);
> >>  +if (IS_ERR(path))
> >>   path =3D NULL;
> >>
> >> apparmor and tomoyo both IS_ERR check their dentry_path calls, ima
> >> is the only one that doesnt. NULL fname is already handled by the audi=
t
> >> side
> >
> >Thanks for taking a look Bradley.  Adding Mimi, Roberto, and the
> >linux-integrity list as the security/integrity/ima/ima_appraise.c file
> >is their domain.
>
> np man, do you want me to submit a patch for it? or nahhhh

That's a question for Mimi and Roberto, but if you can put together a
patch without too much effort it definitely couldn't hurt to post it
(make sure you post it to linux-integrity).

--=20
paul-moore.com
