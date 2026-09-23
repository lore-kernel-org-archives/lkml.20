Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3BC51DAEC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169375; cv=pass; b=Yr9Gg7VgejihzV784iRbRrPdI0HnKwrv1xMUk6XwVq1GAchd+4n1WQ73KZc7SoL2DrWzPkafE9PaKkGWJ5QJ7tGf7jLCu6IycujCDh6gEE54ffXrVbFYcb0dReeULCGr+hcjnbVUEZgW/wAsqbbv7lXazrGtkBwaJfTb0Ed1xfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169375; c=relaxed/simple;
	bh=snwoyxNXVlKFB5fKcSd0aMGn3NuWTS5ye6M7p/9D7X4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWsN/mIEvD27HR+BYYwsrm6j2+/PoTEhdIpHExMlXCd7AQYvMnLKv6bhc5sIX4Tf2uHj8s3PUhDc0mnCfJrAG+MT55sErjV0N5yqEuPBhvHAJ2A8kht0oWUrutotJaGcyBcCW27Xt4ip31E3dl8+GsBS5e41sML3+M09zCTPOFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bkOxoVFI; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bkOxoVFI"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52faa58bff5so214901cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790169373; cv=none;
        d=google.com; s=arc-20260327;
        b=oDWpF6zv5rqCGVic17TSMtnlkkcZNpUdMFAw3z0jrvADEzTVzThGH1AZkwzlUsNbjo
         FXzA0UiPrEVudd70H2k7uGnB6VtBi4bCx96J9jOSYe4Jmdt3OVSRuf0xSpLo19o9LIjk
         3SwWiTGQGG+47V1Xb/0kW0kxYerTOxD42NJ+LnZg7FNOph4+UXyfnZjyeDuzwOaZVe10
         bIHfI8xrfs+DILNsd+LV7HfglC+kuDvLDda9hD078yX77CNf0Pp608G0u3+UX+88y2t6
         s/795tsiWsiN7F5G8Pdl7h884Cu/ZCpr0iSyDTG2xBi13FqPc0MEewvvWBXG5KarzIlw
         8sXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7BLTiqeV7YYD2gkGj5l6aVp8svLGEPXSs9wDu0RTUH8=;
        fh=G/8eV0NvoRHiDfEg5900QBXTTOIv8f99ArnWPr0EvoI=;
        b=qU+puzu9rL97tEv5ZXZiiIGHpPsktv/IssYQCU5eoi4BsJiWffJCW1NRrDeBdMsH9w
         SlMawWxNJ3VPT+xV0qrc7oAgDhapYGkoT5lTndl9iOGarG5nILFLNLAbef/Oj7HRyr6p
         zWZ2itOrX/Pk3f+Qp/i67PCygcq8KounJhQ+uMjsMK3zBYzMqsLqeN3XBL6jhznOEXKi
         SbYoi1/3XkcXAXoseRcEWN2qwCV6DYd4seuYHjhg599DbR6GTZYpJcAAhSBItS4RGuQ2
         sWKombefo/+z9v/XUJRpI+aPgkoP3xXdtWnrm0X5/WGWYRPCLjAXqOwo2mmSTIkNyBy0
         0nvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790169373; x=1790774173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7BLTiqeV7YYD2gkGj5l6aVp8svLGEPXSs9wDu0RTUH8=;
        b=bkOxoVFIRHWLTHkspr4JHS+l/SXFQI/3k8O9ewnZbtD24Ke7g6q0trZS9CrbT9V3+y
         iMTI3xBIBkY+3C1Yn+vi0ujyfJtEV0AMJdhxaDhOuybn4K8Ma3G375AJi+uZAZmlu/w4
         +6LV2H++klIB9y0t/4sNR/UHty041wgldrxUOUXPX+R5ysdGR2ZNC8LykxHcPswK+fhb
         CtjLP//kGuCyfgfNvTOaQ+/wcNQ90TDdLVjkwm8Gi8qSaDWqcSc7yG8qO1HDFiCNOAPG
         GT0p/Qk28kRZrAFpeTLbbksE9RokDlDNeo0VJLmg8M+8B4Tc44Ng1a6T77+X7461KEEX
         GRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169373; x=1790774173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BLTiqeV7YYD2gkGj5l6aVp8svLGEPXSs9wDu0RTUH8=;
        b=Y2GJLJOc1XseB7tfp13c+gT5kLCTHisOkQbsaq1h/4WfMPt0oYN7e1O8lHSswdVwCZ
         koo78UtArPNXa8SVN3xGsAiUUwu4tUoqkoLO1sWEaj1RNjMNp0ij4LJeePGh4oS2PySk
         CYBslcZiIDJfGJe8fxfIGWqx6VmXS8+r1rOwr1R6qtzVRbs+nEdrzZXbH+3oYER60CZP
         lC4tkwFKa+9y04Zu6Sjvtm8erZuHFdzenuYQMNtAnFi2Y9FvKg84yfnRgixJTwBM1/OQ
         CxEkrIIhbalKFX1W8s/RUmb2ba6qQ9kqNC3G7GXwRiX6VAxS30uPp68PckODSLeBXucF
         paiA==
X-Forwarded-Encrypted: i=1; AKwUvBzGKQcBYlTmpRvJ4EEvMith1iXaQ9hUjg7c0sP8u/wn+HhW4Y4LCdn80EJG9SZZWZmHiwxTr+YrRBhAMHw=@vger.kernel.org
X-Gm-Message-State: AFuF++mZTGIwIfxJ83MDVdTc0kwjVdS99covTurTTTORl51LTJFUhGPf
	b2l15wL9CJLLrym7Iw12ZE9DAMny5dIaoeTXSncZPlcOeE++A4eunPa001LLHS6q8FHSg3zo0pX
	Ugb/US3j/38ctp3JDickz8dKLsfgXJov2fkc52rgX
X-Gm-Gg: AYBFou16xPxR139zbsea3c11E+tcgrvnILuOsJClLXIkVY1RkeHqLMtzC/V0RhjoqKI
	1h6YcZsEsBdeHijyz3FyHld062Fr+TDuTOAjXQd5mT7DNJzCFysSTUoJ6ehRYi2lc5vWQuB+9rI
	bDZ0HxZVH6gF2haGCrSjuVePhFsxq7YnpblMLV/HKAXN0y1qxWvxd3kNmSpiWZuud4lSqZABOqw
	QUjDgpbj7QhWzbo2+H0aqduFsYGALndmth1pYEyXCb5h8FZH4QVosPAnPnXlRw66aeOqwGosydN
	lgCe5Ig3kaOgbMBDQ3K7zLxhqQPVpC147CUPi24oPq/jwYIAQfOvA1o=
X-Received: by 2002:a05:622a:2b0f:b0:530:e335:4ef with SMTP id
 d75a77b69052e-532eed6c6b0mr13407931cf.2.1790169372006; Wed, 23 Sep 2026
 06:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <f724b653476e2733c18b02268c57baaaa54870ba.1789966896.git.irogers@google.com>
 <20260923090007.GJ200420@e132581.arm.com> <b823478c-5799-4b23-9e63-774a02082dfc@arm.com>
In-Reply-To: <b823478c-5799-4b23-9e63-774a02082dfc@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 06:16:00 -0700
X-Gm-Features: AclHuK_0nK_1gDVkKAoq-aIsf_LXlLKzX0Zrz-YCgQaae8BcfD5fBc3Hpm0oAVQ
Message-ID: <CAP-5=fV1_HfvFHjZdtscCAoYCHc_BBKmNP6Z+kehKHzbfSZ3JQ@mail.gmail.com>
Subject: Re: [PATCH v2 38/49] perf python: Port arm-cs-trace-disasm to perf module
To: Leo Yan <leo.yan@arm.com>
Cc: acme@kernel.org, alice.mei.rogers@gmail.com, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org, 
	adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:08=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On 9/23/26 10:00, Leo Yan wrote:
> > On Sun, Sep 20, 2026 at 10:06:56PM -0700, Ian Rogers wrote:
> >
> > [...]
> >
> >> ---
> >>  tools/perf/python/arm-cs-trace-disasm.py      | 356 +++++++++++++++++=
+
> >
> > A new script is added under tools/perf/python/, but I don't see the
> > legacy script under tools/perf/scripts/python/ being removed.
> >
> > Should we maintain two copies of the script for the same purpose?
>
> Please ignore this question. I saw the patch 46 removes all legacy script=
s.

Thanks, Leo. Yes, this is intentional so that if needed, we can land
the ported scripts without removing the previous scripts. We could
always add and remove them together; I was trying to think of ways to
reduce friction for some or all of these changes to land.

Ian
