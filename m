Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7182EC090
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789527897; cv=pass; b=OCQgY5N7ioomyIlVT4Z0YUtj1UjK/uvMsY7sig3/uC8BRyn0ad4xdBpIH+NpBlPDXMjgmeSY9su14lwBeLpoXHrhdSerJGuhygmZcLeQHMSePVvS+cFAZxP5m9/VZvH4QovESWIMesWgByaHgkVr0eJn72U5ab4bQ8akv7ShUgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789527897; c=relaxed/simple;
	bh=FNcs5b0+flkxyF/2A6UlNYIVXcCm2tD7ZxippPqrmeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q1oeFz/sFXj3a1j8VQ7B++8VoGDm6b66+5IDsC1OccU9vBO4IZrk7wLcslOhsm5vNaTvP50cP0TDIhqcJdLElZPiAryyYhDTiCfDydipH/wC/gEUEO8bg2H22S7HWivUqG2IN2mnQqM0CtBbtYHLRlASZqQhY8DsodZ+h7WHYPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+QJCtGn; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+QJCtGn"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so3047285e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789527894; cv=none;
        d=google.com; s=arc-20260327;
        b=NHRKENwU/r06vKRabDeRrvhKsL7YpYBJ+0FFszXIMYMNOQ1/nfe2cyh4jDkqXOEOy2
         OVHT429vWeVQ23B2NxZC1ze+Pi8+d3TdjacM50ipzQka27DtydFVdYp4UM3vWiV2ggLx
         4Q7bAjEIKik8zYHHbfWVYCnOhkhoJq6Ot5hPEdziRng1J7mWc+Rz1GUIptv0xYooTX95
         P6hWxDsQrJOJV4IJcTDKrQuxaC5WsUObyWHE4bOPQgP0by/c77j40lhTRfGWFGsfiFbp
         o2U87N4HsVJeTHET+1jkP/NUVD68GfgDQOYoRUY96u9XMggL6ftjcsCP8vYRPZ3/kesp
         mHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNcs5b0+flkxyF/2A6UlNYIVXcCm2tD7ZxippPqrmeQ=;
        fh=zyMbW9ivFKHQpeLGRT3i8d/byVvuLOrKk25Z54vGAOA=;
        b=cIfP8GgXgx9hz4dhDYeeK93he5nANRCZXdd9QCTf4w2s7f5sUwJEcaJstA1+MaasKj
         W6oXWKud3w/C24mpdVebMOtFeJj6JV7qpR392rWhsy633vP2frVi7R/A2mZxdIsOhMhZ
         Hf4llAqN1RMd/zf50qNN9poV2suM6MqTXWgNv819EkVKFBRbi2eqn6oFCsyGoFz182FO
         AGAidw3nwLX7EmHaAVy9uXlzfs60m6iUleQQtnPk5EVTgjdcimgkVdrMSz3oOZvsAGj4
         1TY2GNkOjA/j+eyZQb0W1fEp1qP/Ep7uGrt6TA4HFW0vUS26eJrQMqyMoUDzkPQe6pkb
         zCfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789527894; x=1790132694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNcs5b0+flkxyF/2A6UlNYIVXcCm2tD7ZxippPqrmeQ=;
        b=d+QJCtGnnnYY7Rrk1B5s3Jh9JwaCvC7kgnfS2SVjXdsFIcUGS6PYGoj4SHthr6xAGU
         7rObVqhAnvgP1jA/62YMZMncXKu9KNu0UUp5NYj4aMw+UiMO28pf+WNEmZWPXXULgPuf
         Ff53v/58mnu91WzgV/qBt3GE+CRJINfmQ0EqnY+XjS5eJmooASizN50pXr+ozQpCU7WE
         hde1Pbt/stFaINefF8KIpQAzdhnbtyJQqXvKlrEWfIwjtS4RJGTI0XmDg7w39x6SEs0k
         /gIyYBS0EYJY1kG9FeFtaSw/BfJ7HQ+hOYHvUwi0Z0j80iXLvg8FeuebQgZQAGOYgOM1
         xV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789527894; x=1790132694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNcs5b0+flkxyF/2A6UlNYIVXcCm2tD7ZxippPqrmeQ=;
        b=O7/ZOx8hiFcSq4fd1RhZd9LJtaz2AWSXXZOBJYTSoIZd7OoHD9FgPcdzK/UnMZ9hfp
         uoGeQXENjCk01aHapeacooyB6gxaxqHuptw0w7ResEIMIU7qtbpqVbn3Y+BGP3rpA9QA
         CILXHhd/9R6dYneh8yzdy36ouSolOj/h4zSPQPh2y76VIMZUgS7DjZut9z8UqUUGAzQ/
         e0z7ndIpMF4LGlDegohj2msi4m1bWkoGQtW+mkD7roj/Zdt4aljt5qRmnVqgeHvySuT3
         nwmplJhKz+oUgWu0SSO1pZewtcHJxcRPU5Ot0/viU+R6j/mAD0yILJsv+GxxgGnIdTmG
         rHAA==
X-Forwarded-Encrypted: i=1; AKwUvBzB7SWklzAmPZbGF21//mHYU1dpZ8MTVUM0XjNc0rrWGW6BfsMM/xNAWBXudwpqT/w9vw79g/OIjsznPJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++khyQ1oNc8fA7upIBurKPkuF88c5JhLMQK6aDqsI1azfRZQhtMO
	GICKUmndPXSoBQlTtiqTIepi8BbokJcN9v7QdnpHKPCHL+xo+rlDQzCCKzah2a5Ik5e7P7jFAgW
	hof8aCYMyHWyG1tRPr1sMl14QTlcVHow=
X-Gm-Gg: AYBFou3XIQPGkclhXh3cxUq84sR3BaXjXN81q9aW8R1GeGTILGGopu4aIQ/T2hgXAv1
	WqsGb7wRhmHiq32PwapN9ADFzOXZYWFCImhfDZRPHlpagdXGvZIf8yuuPFRtyqLXDk68bsLw4eA
	AAPLJxtZvxRzAUuvfY8BUF6yxoIhQpQKH7VvgsKCU1u3mME9pmuB6+klYqejppV8ogrGLOTsWsq
	gpK0wU7Sa5X43Ra0dpjMQwDWsvy47G/ovpcdijrJgZdYf8exgCa0nGJV2pabjNJlTVBYW3HJ6Hr
	jSEW8mFRVkbXHnhc2CJgMExTIOrOWLYuHtYtWGg3ajo/12BEWC2rc0CAKmI3EiAea0HfN67igYK
	zHfEPF4kYFOSGsC0=
X-Received: by 2002:a05:600c:350d:b0:49c:fc6c:be0d with SMTP id
 5b1f17b1804b1-49eb732e3b2mr7259115e9.19.1789527894329; Tue, 15 Sep 2026
 20:04:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913075014.1732524-2-hebaoquan@kylinos.cn>
 <20260915100308.1599989-1-kunwu.chan@gmail.com> <aqoEVyxikqQ476IS@fedora>
In-Reply-To: <aqoEVyxikqQ476IS@fedora>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 16 Sep 2026 11:04:42 +0800
X-Gm-Features: AcwNN1UTsGwChzZ0QocjkEw-cF_hHSS0TI-2fHXvF2dzuUqmP2ZSHZ6lt3NUjbs
Message-ID: <CAN_Opa-cx24WX6Xioyu4fMUOqJH=_F8kJ2yB1cATa9VZ8-j9QA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] mm: xswap support for zswap
To: Baoquan He <baoquan.he@linux.dev>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org, akpm@linux-foundation.org, 
	chrisl@kernel.org, kasong@tencent.com, nphamcs@gmail.com, baohua@kernel.org, 
	youngjun.park@lge.com, hannes@cmpxchg.org, yosry@kernel.org, 
	shikemeng@huaweicloud.com, chengming.zhou@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 10:52=E2=80=AFAM Baoquan He <baoquan.he@linux.dev> =
wrote:
>
> On 09/15/26 at 06:03pm, Kunwu Chan wrote:
> > On Sun, 13 Sep 2026 15:50:03 +0800 Baoquan He <hebaoquan@kylinos.cn> wr=
ote:
> ...snip...
> >
> > The SWP_XSWAP flag and nr_real_swapfiles accounting look correct. The w=
riteback guard
> > in page_io.c (both swap_writeout and swap_read_folio paths) properly sh=
ort-circuits
> > xswap devices, and the zswap writeback gating on nr_real_swapfiles ensu=
res writeback
> > only fires when a real swap device is active.
> >
> > No issues found.
> >
> > Reviewed-by: Kunwu Chan <chentao@kylinos.cn>
>
> Thanks for careful reviewing. I will post v3 soon. I found this v2 is
> based on a older commit of mm-unstable, and I forgot adding base-id, so
> Sashiko reviewing is failed to launch. I have rebased this onto the
> latest mm-new, hope Sashiko can be satisfied.

Thanks, Baoquan.

I=E2=80=99ll keep following the series and look forward to reviewing v3.
