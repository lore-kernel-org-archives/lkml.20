Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3A34BCAA6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185407; cv=pass; b=lHVU7ikUDGeM/U1zSgRdtNvbQTgQb8rMBSSsaIdZet5nFpJGEZ3h3njcwxc0wl0903RY3HWH9PSqj9wdvtePLbiBcRubdNqbUAT+bk7fouYGMsveMkO0O51cJci3nRU/D48ry0JnmnIoadt3Aigd0V06JaB2cApfh3k88N+Rt8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185407; c=relaxed/simple;
	bh=2OTa5vFHZiOCswlLATKSWXrmSzZ3LfR3p7eYLycqjCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4RTipNiknlOdbI7/9Uwi+6Zgno3914SSCSS4FHtNZ2TdV08AtGCEexJixtM201G/O6vndAgitGqdSkr0jjn6qCGVTQfIZ4noQs1mB4LXo1dO/0NbpZEFGquvYvGsv9AgVr98Qc2XY/JHUNvyYRUzql7YXSliMEJ9pLhykQZSmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z7KxFtNs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UrTuRF98; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z7KxFtNs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UrTuRF98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788185405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/RD6fAg9Gc9vKAefpCTRM0Xuo2vXeMUEPiIg8uFFGyM=;
	b=Z7KxFtNswv3Cl0vUjH43hY3NaDhLSD9hcOnwY8L6UqMxm/jUoAPSpt0VoXs1ntLiXZdw47
	s41DPUOc9o5ZDk3Vc4hbXqYx9xtpNx1v7oOXtS1CXl+5yrOoY0audthIQdAthmV5i2j5cg
	AtJFVsiTavejP9vpqb7fPPfG230LzSY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-z_QaYiHgNXa6BO8_mOr-mw-1; Mon, 31 Aug 2026 10:10:03 -0400
X-MC-Unique: z_QaYiHgNXa6BO8_mOr-mw-1
X-Mimecast-MFC-AGG-ID: z_QaYiHgNXa6BO8_mOr-mw_1788185403
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8615bb9d4c2so20479307b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788185403; cv=none;
        d=google.com; s=arc-20260327;
        b=SVqgY8jdBwulO1YNBeiucqdK0pZGbIBGvmTDDCQBX7vbu45ylDy4fdxUU/rFe0otdU
         KtuYa2ktZApN6CPv31bMGjIPW9mSmfwzRSWcnDpH7YkxO4XEakZ3W4/QP2UxfHieGMkR
         99t9VSbodVtfsCV4UBhjX4w7B6pxAd1osFJlAtFVS6GKofM7sZdzpZdxwBe8zVwTJQ5v
         fVKbytVyWGnwXgAmKPDh1G4qA2xBG1nOdNs1svsF5Ivn3bM5+R34liXtWWnHXtx9/SW2
         FIk2DT8CJp51na+PV13YOHtKCvuz8LhCRSkL5+V6JeFJ5LPu5C0DYIBriBtIZL89Eb7H
         JLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/RD6fAg9Gc9vKAefpCTRM0Xuo2vXeMUEPiIg8uFFGyM=;
        fh=ea3OW7xVy4MeBJQS4alp3cO8BvoDa9z6eDJ9i/3cjGI=;
        b=WTy8VqixRISzykRsO+8AYwqPfraAkHISBtpJHQADqi2i/C/QBxoaTK2q6+axM13n7e
         nEahZ9GguRwJTG1eBctumHL2syt1nIRMTSCubip8RT3Sr7vK6GBWM11v5mYZVH92KYxL
         9sbv1k39ZFmXZvCn789REWPU78UWWJzvEcp+tTtEtHwXRYDCIKzU94S1cvvhwcuc/JRe
         HrWUn+lu2PaRzwKO7LnCPrgE8vp4UmswW6hwKmjauoYQ0XTI7Rd9uEMsbZHkfmBq6LMD
         2bRYjAIwSLBj4oeQHLMmjZtYlre274PnuhdqMIe1yzvqYn/qZYVdC2yb+E064k6xr0lN
         u+fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788185403; x=1788790203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/RD6fAg9Gc9vKAefpCTRM0Xuo2vXeMUEPiIg8uFFGyM=;
        b=UrTuRF98aXrAzh9DfJroXJZmjDFbx52th3DG2WbyIyibkvIEG++rOYsp2i5in9aQ+N
         pLbZzRI5pa+e3LB42Zccys98gIcw6VU/l30VYPVWS6J3qLIhlnimFYlsjNWC8yT1ab/w
         YCadsoOzL+ZAwgHpnV6AesxtcVBjAQiKvZAD1LxCcQ/5htzkaycpBUNbzkkivRwtfo2J
         sI8CWAQuEhrrbwJFM0cLOHMnQRuiQmlZIRwHkSC4a2VGY3rDCeOsotIDIP/8dvUynPHG
         o21BcxMqs052DLMeCsnWCGeO+F6Rc5RHLjeIlAWEPVotfSWrEy3cEmu+thh6FgCu+7NM
         Kz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185403; x=1788790203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RD6fAg9Gc9vKAefpCTRM0Xuo2vXeMUEPiIg8uFFGyM=;
        b=Ck/Bnmiw6QpRdaLiA0AdpLr4MWRRVkqqONi+kN6MW2by4FLCRMucIYJncZ7KjnJaJP
         vJ1aHQyABIpdehcEpd/xoC6W/49aHYQpRNZovtvMRfcBpzPnFzAS5XNLJBsB/ZG7dgyu
         Ls1rnE5LYBOxzTZWBMVn4nhIcvZm1o9uD5BumyH3r/NR7odEk6wBb7dtqjo/UdmHnk9J
         qoO+yyUGlsRZhMnio8PHEoAmWNGK0JTeQB1LFoXLXHedg/4eO/CvismV6SS842GlDT4m
         Dv0du5SDjjnWDXGrs5rkcvwnjci9FP9dfSbuSNw+5+6fwu7aq06TbiD6PFuH7QZia4El
         V+9w==
X-Forwarded-Encrypted: i=1; AKwUvByt/FvR3QFFFP3bLRYP5/NtizEDs83czdCofce6xYo4pcHegYOPjOsORjsI3rA4rbnS/xUhpXVwwzIYSXw=@vger.kernel.org
X-Gm-Message-State: AFuF++nK72l1cx6mYqaRqlVoQ/psffP/49rsxiK6Gw3tEfbOspwz2Wqh
	tsPVQWkVVUiU0DRCsLVR+RqdJsZvwT1IjzDAOM3a+uIVieh+TszLtLaFli/EnhfCwxIWqxpl5Zt
	Uhj6K1aVnYWbcDDaz9bu+WWWCojgBS1WE+KOKRTKH85+oGFjZ+57pcsR/JQPUE9EmY66mv5yx0J
	CYExYpmQNQhrV7IdM2BH5MLuSL3yKIIOzRRGgXM0dK
X-Gm-Gg: AYBFou0kOuTo9WRS8su0XYnHKaJy0OU11hec4xmrI+Drw+ZE1nyTAhgf+LMvYF19c0W
	tMALW5J0kFeFHAscRtNJeg5ebKvNbwzx6jsJDWbCY6dP/4wPpsLkoJfaDPi/8pJ8yZOqNpLwJT3
	VWbAxscnhtTYh/uPLyTtFVy9mPdLNLPzjaK6th3l4jCtr2gfJb0mSbWgLC0XBYeKLyJOUW6E2m+
	syEg2+4jKgpyHhhI8eJ4kpC596FaJJ2We5cz5+Sw3S7
X-Received: by 2002:a05:690e:244a:b0:66f:8255:9f4b with SMTP id 956f58d0204a3-66f8745a1a0mr286931d50.8.1788185403043;
        Mon, 31 Aug 2026 07:10:03 -0700 (PDT)
X-Received: by 2002:a05:690e:244a:b0:66f:8255:9f4b with SMTP id
 956f58d0204a3-66f8745a1a0mr286906d50.8.1788185402359; Mon, 31 Aug 2026
 07:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505223319.5661-1-shofiqtest@gmail.com>
In-Reply-To: <20260505223319.5661-1-shofiqtest@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 31 Aug 2026 16:09:51 +0200
X-Gm-Features: AcwNN1V7E0fQbuEwbFljk0Gdwb07ZyOSF7BaQw4kP-0aSTU-pu0QlfUzibp1_h8
Message-ID: <CAHc6FU7E4xiM7HZFBiv_i47iOhwFLg+0AYRaDU70tPFt7NB2Mw@mail.gmail.com>
Subject: Re: [PATCH] fs: gfs2: Fix typos in comments
To: Md Shofiqul Islam <shofiqtest@gmail.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 12:33=E2=80=AFAM Md Shofiqul Islam <shofiqtest@gmail=
.com> wrote:
> Fix spelling mistake in comments:
>  - occured -> occurred (twice)

Thanks for the patch. Could you resend with a signed-off-by header?

Andreas

> ---
>  fs/gfs2/lock_dlm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
> index 7828ad0b6..563bb90a3 100644
> --- a/fs/gfs2/lock_dlm.c
> +++ b/fs/gfs2/lock_dlm.c
> @@ -434,7 +434,7 @@ static void gdlm_cancel(struct gfs2_glock *gl)
>   * 10. gfs2_control sets control_lock lvb =3D new gen + bits for failed =
jids
>   * 12. gfs2_recover does journal recoveries for failed jids identified a=
bove
>   * 14. gfs2_control clears control_lock lvb bits for recovered jids
> - * 15. gfs2_control checks if recover_block =3D=3D recover_start (step 3=
 occured
> + * 15. gfs2_control checks if recover_block =3D=3D recover_start (step 3=
 occurred
>   *     again) then do nothing, otherwise if recover_start > recover_bloc=
k
>   *     then clear BLOCK_LOCKS.
>   *
> @@ -812,7 +812,7 @@ static void gfs2_control_func(struct work_struct *wor=
k)
>
>         /*
>          * No more jid bits set in lvb, all recovery is done, unblock loc=
ks
> -        * (unless a new recover_prep callback has occured blocking locks
> +        * (unless a new recover_prep callback has occurred blocking lock=
s
>          * again while working above)
>          */
>
> --
> 2.51.1
>

