Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D363955F1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211763; cv=pass; b=QH6F7WYBILiBVPEDxzLmu9MmEGW1HzJ9Z0rErhf9TcG7bBBfA576p/SIzzgr+dP02Kd85YornraCPfbGZxyFXBIfJiZECz7i0bpot9D7tJK0Nzfr5cfZgVm9+B8pbgTt5Exzqx2Uzx89s0oEIR+VV9S+hvRMpJXcJfjZM9ItxE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211763; c=relaxed/simple;
	bh=6dSr6n8f71eMNcsTQRedbNIMbv2X40uBOF5czoWCZbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kl1fqLcWdq7mUDesqqynNPKppvucD0LkGMbkWIOTuNkWEvVJlaPyL9AP4eaaDEdn/nF1Ux2LK/KZfqdsXo9FQUQdeAHJ20UHf//aya5SypUiyDeAdc/qNbuCZ1hdpWD28IJsmQa236AYAq9r92KhfL1jxtcBekOWFwAdO/RVvPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=VoXGlxdg; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="VoXGlxdg"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-853e2610bb4so282593b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788211761; cv=none;
        d=google.com; s=arc-20260327;
        b=fh+UbsNVP0B3Tra+XLAC4fGxmJhMEki3iL8nW6WXQF0DkQZz26Yga0xRrPF5Z0Kbse
         ASxa6HW/cDZJ2KjnBeXaxhRVlAZia1m/CwRmsUqr3qF13akOIpxaR/8eCUXEJe9hX5aD
         4s2V07qgVeja97wgs+WSa2pKN0v7D+/eO91tZJRJpKwc4fa01hm0K/b+zCtVAsJnZfyJ
         /Ejcd9HGYFS/+MPlTrKbsPWCaOt+KVU+2QG6OTb9YWpY9VOe1OfrqdB0np+VghaCCg0V
         woOeakcYC4WFc30LNJLXF21pkgrCa6NuaVNw1W0hPq1xTdngIajjfMALSNzm1CMrFCAq
         NhOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sGP+omq5mcJBVNSA5Gjf4nhHLqpmKGJVzDeopx8ZsPY=;
        fh=kT2kaz1cDNccdm2fDxEP0XMfKm3CFazvZ9wrrFf1908=;
        b=FHLe8z63/e7MXLlmuHbYK8J+3omBn2XBVBT0xtlySG1Uq5q5BsSsM81WWQa3okeWtT
         5TuQ5GXJY4n6mA2cgD46frsZGUXlLna6DZrEt13Q+maHZtkQpi1YPyfvX7Tm+Z2N2YQb
         8i5q0LIz7AZj4PghI3kHX8qkQDHNjw0CN8REy6pNRabWTSMO+WX/g+MXRdo5aGCAjdJn
         hQt19o7iqVufOX1HhzqZDifkWDGeGCbYn+jVqPyWv/xz4E46Vez4R11pM8sobuJwKiwn
         Dyme+QTqU2noltAYIhOV+JF0UpjIiYxbS5e/iNdD0Do9hgTDc0eqmcBgzbJjAm8KPaCd
         Kp5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788211761; x=1788816561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sGP+omq5mcJBVNSA5Gjf4nhHLqpmKGJVzDeopx8ZsPY=;
        b=VoXGlxdgCJWfOS0phaDJyAxtXkiIgKcq7ZCfEY4F/LkiAOky3Nkpaa129iqp/JwVZM
         i/B2YqQwHdCtd7bf0Ax64QaD57ST9bWqZivBGCeNWSWQqg+lE2ECcAX4VvXFXbFLR9GJ
         J3cKimwA9Q8IIVSV2/PcWdbrbj6IAtGesW2Q5dKbaEAC5MVs7cZY5FqgdNrQBRAFcfQA
         XsTr8npjT7vap6bsyb7SwZG/cABB/LaFSeSVTN7w/+zWk5P7xmQenWX1/b+D3VamG0Zo
         TJocSYA0veeKumODN9A2LvYwPq5KN7zorewPJGtFxLOLWOUBafU8Pqn9Qp7AjQZY0GYy
         w4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788211761; x=1788816561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGP+omq5mcJBVNSA5Gjf4nhHLqpmKGJVzDeopx8ZsPY=;
        b=fJqROL5dDUBwQE8dNNP0mBhk7C90QtMUxK11RmKi0IPLQCIzdc/A4QjsC7mD+lnt3o
         MdZUEdD6eA5Z8P0zYeymRxWeCLOLITFb5jy/GEkoP1oEH+skh53QxLbbVthM1EeJ4vhW
         edNqQe/unb20nbflcvJ55PSPGE9nL5vDQZmc0iWaThEHbqtwy6l09EQXckukq85mXP+c
         2gXxkA75uUDjM/dltpSXrVYxSCFA2e97oK+MbmByRcO/JCDYzkpILEoYdSHoBT45c6HT
         Ao6nivHLmmRdKPkie9B/5CZEYJUNN/hX7GQgo2WRicqyTOyi7C7fHpACC6MmpouEH7kZ
         umKg==
X-Forwarded-Encrypted: i=1; AHgh+RolmMiIvpIoULTJnIpRN1klUNVZYpgumlZ0INaYEzaCvhA7Yg5uxAMgtqhNeiXHlXyy95DSYhDoQpxFj7A=@vger.kernel.org
X-Gm-Message-State: AFuF++lZaHhjqoLcgJkmDab0WK5gzecUh5QWf5uJ7LmUa+gCIV/vy9FQ
	eKG4Ft+XmU2LJ2KHP8SM4GF8QjW59Qt6aI6Q1ekXOn3Ub4wzoMNe0pgbYrwSh07/u6RjYGU8+2c
	Ulau8sXZDaYHTTkqoZ9N5ff8qDpv9HTqThyfZRLnW
X-Gm-Gg: AR+sD108sPpHSuJqBLIbcGSXkEpnfEl2evScwnVYMOrfFiUiSWF4/GMhcpL/E8J4pHW
	UNgbGtGRnTYsMudhAIFZnPpw8dPWgWArBKd/nJVfLjDZw4c2rAtDclDHFhZUxMNnwdK0qe4NFlV
	DtTHB0BZLxQywuUE6mWo/pHFudZcUSgJOEQl5cMQASkG7jx6OWMUDAOV+9oZl/7oje/mKg3cGN+
	7j5KZBBL2MUIiO6FMZ1O9eeIByHBahjZx6cWT2M8+FGiFChbmnxeiMLW/905ve1+G0zuMt6GnZt
	5QnCTfBTR0OOrlLi+BHAeUja0gVzo3BufkTMQ7CHE8eYTg==
X-Received: by 2002:a05:6a21:8981:b0:3d3:aed2:6f28 with SMTP id
 adf61e73a8af0-3d819cc0d77mr754814637.28.1788211761457; Mon, 31 Aug 2026
 14:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707080615.1235830-3-caixinchen1@huawei.com> <e7bf759345415ea1935fc845506d84d9@paul-moore.com>
In-Reply-To: <e7bf759345415ea1935fc845506d84d9@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 31 Aug 2026 17:29:10 -0400
X-Gm-Features: AcwNN1WDpUr4AyU4tqHwkQTb9BH7eKkK0gDZmEr1FwSZqBDqmpMv-_hHGogqz38
Message-ID: <CAHC9VhR38688Y-AphteLCAVcgLxcWXUUxg17XzQJE4wSND9OKg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] security: Fix call security_backing_file_free
 second time
To: Cai Xinchen <caixinchen1@huawei.com>, jmorris@namei.org, serge@hallyn.com, 
	amir73il@gmail.com, brauner@kernel.org
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lujialin4@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 12:30=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> On Jul  7, 2026 Cai Xinchen <caixinchen1@huawei.com> wrote:
> >
> > I found the following path:
> >
> > alloc_empty_backing-file
> >     init_file(&ff->file, xxx)
> >         -> file_ref_init(&f->f_ref, 1); // only 1
> >     error =3D init_backing_file
> >         -> security_backing_file_alloc
> >         -> rc =3D call_int_hook(backing_file_alloc, ...)
> >            if (unlikely(rc))
> >               security_backing_file_free(backing_file); // first call
> >     if (unlikely(error)) {
> >         fput(&ff->file);
> >          -> if (unlikely(file_ref_put(&file->f_ref))) // zero
> >                 __fput_deferred(file);
> >                  -> ____fput -> __fput -> file_free(file);
> >                  -> backing_file_free(backing_file(f));
> >                  -> security_backing_file_free(&ff->file); // second ca=
ll
> >
> > Currently, only SELinux has the lsm backing_file_alloc hook, and it alw=
ays
> > return 0. When security_backing_file_free is called for the first time,
> > the blobs pointer is set to NULL. Therefore, double free will not occur=
 in
> > the code.
> >
> > Fixes: 6af36aeb147a ("lsm: add backing_file LSM hooks")
> > Signed-off-by: Cai Xinchen <caixinchen1@huawei.com>
> > ---
> >  security/security.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
>
> Merged into lsm/dev-staging, will be moved to lsm/dev after the merge
> window.

This is now in lsm/dev, thanks!

--=20
paul-moore.com
