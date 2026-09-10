Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F43D4BB288
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056608; cv=pass; b=f6dkYLPhGY8ERcYOlQI6sbsOngl1hp5APXnCJldbsK+z3vVtyM1D9xgpCqNMBjDPq9cOXGP7XmpVT89yZkcfrnqDF4j+svUgn3FVSmw9CvLhWJgGFzmz8l1OMxr4SBX6CwFyB1MZlw4/vTtag3zhJILPzgUDyKxEwu4LfVTo1O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056608; c=relaxed/simple;
	bh=nn837W91rvFvYJRiTa/P9FmCzgytAxp2W6ySv2FpOa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vr5l9otTpUekig0v0u1dHXVeTkGnLcWnK9APx/I7wT97WBl3NfmyXwgUF2RVr9l5kWg6bSibMCQHVT2GFAcKOXFObx5pbptyqpTyZEY3JJOFIeTvtm/YbYOZAZnQBrMAmMTKkD5PPHBo9gFRNPDE0mhMDa4rBZ0kbKpRoWP5O1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IMt+uU8C; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IMt+uU8C"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5307425f44bso279631cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789056605; cv=none;
        d=google.com; s=arc-20260327;
        b=ieso+ldMU+UEaeny++OQewTw4l3GhnyPJBJWUUOKKT4Pp8Sz3zLikDVwLtIv1s9DDQ
         JpGV1y8AIc/7cf4KVg9QqdwA219YaNz3/Yqri5pvFOl9RGPaTfOoPv5bJWjrLNbNKzac
         PMfiSgIL9qej6Nu+kn0necMOwpInKmjIe5wNlGd2WZoEyJzViZe9DhK5ye/cb37QkodR
         Ze4HIuWK78X94NPI3lD4TF3Gy39QXg1zF1RbelYE66VSQxpq9yERJcLKHRlkF7t0Rj1f
         3M3xrtqyUjooS+oov7mBjHh+IuHfdmKC8QWXRbvVMuXJButMAYpHHAuArna8VLF/JtdM
         B84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nn837W91rvFvYJRiTa/P9FmCzgytAxp2W6ySv2FpOa0=;
        fh=8YlNxtKYXvIBsdYFXx+UtE5oU/sV6sVyyhkBXNtwvD8=;
        b=hPrfaUq9u1IKludCLSx/5CMIfOvMM5ckLoZW6tWwzYf0GeoWuGevn1pY+TvPY5y8j4
         0MVsmEs5PZHyX72nyeNTemyAqIaiTSv4pcl0Hp/00HnqWo9kgyFfmzg5YJcu+VRBH/t+
         8wcsZf5Mt+gW8DObKOQKyY2yAFmSns71KEK9ShWdsgQkb52vgHsmJgJEzSTrO+gZlhQb
         qsJL430eTgePxygPL/JWi9s+/hoJdgJnbJsbGGC0yS6bahLHru5y0038mEarO5Z6h2ay
         zKUMQzDBgagoZNEPxTvT174PHab9SZmSxAcYFb13ZROlaEPGRpXQOi8z3buvTjhjyGkl
         ogCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789056605; x=1789661405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nn837W91rvFvYJRiTa/P9FmCzgytAxp2W6ySv2FpOa0=;
        b=IMt+uU8CrV35BB98p6udc2LsxOQ/XZf7mxOj7QDGsifJWBZwWOfrXxNxWydSO4peoS
         E5bjmPxG0vV9n2QfQfMaOk3crfAJc2XOdYZzcX1mIGvlab5UnI8DKbTX8mK/SbrEybXG
         Nkp5ooo315icrZXte3BIk0HTx04Xn0ktHXnCGGdZRhLbKXGSkmlK72XqodqAO/Kavnra
         iJvfvsXkt4ARKXGPKLzcEcb7tKO3PRVk8PaYNls8xW8Kxt0xsRMH7bYdPmwiXOeqPb4f
         nc72+5EVZBzM4gCDpJxxM72MkcceDNe96ONcT4M8Zrsj2Ba3rkTjyBVvbxq4somrSD1B
         kl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056605; x=1789661405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nn837W91rvFvYJRiTa/P9FmCzgytAxp2W6ySv2FpOa0=;
        b=IeTDYsG4quN7T1a0wCupT1Ly7FnaEW9860F4cGi+NDaFcdfg0N/G82y8N0OHSNpssS
         pMrTeXY7SbzSo90rkAsUrOhoJSOcTUKAoptyGq3v8cjruX4MU56QxFmldDEcp5+ARGPw
         gzgVijldsarMBfrf0RKu0FhYmCeL0W03WqYp9J8mXXw6DitSbIx6En94RQyHEEgnjNP+
         +mNeV7TfTqpu8VBM3iM9C7/BPd+xSbNCpMDawnI4r4s50I/gp12hV8CXh1jGc5VD6Vp/
         XPHS8LgFVjCTTrA+vEjs65Ci4hXRGtIUMqdEeBlm/WSzyEzN4aky6liAHxcWrPV7T2c0
         rdCA==
X-Forwarded-Encrypted: i=1; AKwUvBzM5MoiJdw9BujIVDQtSjMvR/WwnnhMoaMlVI+LzcKj+dSJLxicZyvzs8edxe91/ldEvOM8dzAFEGw13Ac=@vger.kernel.org
X-Gm-Message-State: AFuF++lpNwTctQe+6UHRWS3bFMzJ+e0xpZ3IBjk5KNbQa6gi7iQpBUvs
	2xqaKbkUSAw0MnLg8Wprme1z49MT2muH9XWo4V2vkcfNmfwhdy394MQMHHWB94NDO37A0+kOy22
	mn8fJs6sjQtpLpOWxwDk2nqpA7uemFPq7WkxrkDZ6
X-Gm-Gg: AYBFou28HPhhvGw7c6Q6FovTJt/aWA5aGCAQNK4pVfsxv5Sl8UGwpLb/HPdqSqKW66Y
	ZipUlBv2cCQBWBImBEDMPsRADE8yG84Atm6JpXSBf0c+v9YuwZQqobES1WgiehWbhkhFG85ddHi
	bal4mkMFNdNkhaqREwuwwd/2mWliKFULfQN+rrpXVSmo1cQGoBJTDzCdR82gqBOEldWCpfzZf5p
	JP4HxtTH3+ce2SeDBQOL0hdPuEBBfxFgQMFx/kolkXHZEasg/2fDy2R/bCgKIcwGHnC1ORRnuUB
	8rehxr6wc+fzpJqYCo0GH2+xZ6b6dEpSFCmtIRFE6Zsw5iXpjEt3fyoEO3jWRMJGdBM0JNUuOTV
	BWMUFVSeeOdXajfKQEy0F
X-Received: by 2002:a05:622a:258c:b0:530:39d7:ef48 with SMTP id
 d75a77b69052e-530b60199b9mr19460481cf.3.1789056604206; Thu, 10 Sep 2026
 09:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907063918.3432401-1-surenb@google.com> <20260907063918.3432401-4-surenb@google.com>
 <4825a2fe-f064-45d7-a7c9-e98de7efe86c@kernel.org> <CAJuCfpFL_g7tELjT8p8ExM3tX_v2gNDM9rRKwwefPV_KW=fHfA@mail.gmail.com>
 <8e643f51-a47f-428e-9443-678326288fa6@kernel.org> <CAJuCfpEYdj=u0wczKRrsB8uDkbSzPy+hrsCo9TW9-3J3r3p0xQ@mail.gmail.com>
 <2336140f-c993-467a-b2eb-e99dc9427a59@kernel.org> <CAJuCfpEL40p+vk6-km6_BBuE3+YY0WqkpbvQnQGFEo_73MAomQ@mail.gmail.com>
 <9e48cf7b-1700-4a85-af83-8883789ba87b@kernel.org>
In-Reply-To: <9e48cf7b-1700-4a85-af83-8883789ba87b@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 10 Sep 2026 09:09:53 -0700
X-Gm-Features: AcwNN1W0lCJR22Fjje3cvEQd6sZVvwbNRZsVrrFWOXlsi8IV5nagaOj9ko-nhZo
Message-ID: <CAJuCfpE9_1VYqHp6bctUEihSW35TaTw_LZuOGP2UAnF7SA_UAw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] proc/task_mmu: remove special-casing of
 smap_gather_stats() start parameter
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 9:01=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/10/26 17:45, Suren Baghdasaryan wrote:
> > On Thu, Sep 10, 2026 at 12:41=E2=80=AFAM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >> On 9/9/26 23:51, Suren Baghdasaryan wrote:
> >>> On Wed, Sep 9, 2026 at 12:16=E2=80=AFPM David Hildenbrand (Arm)
> >>> <david@kernel.org> wrote:
> >>>
> >>> Ok, just want to make sure I'm not missing something subtle.
> >>>
> >>>
> >>> Ah, good to know.
> >>>
> >>>
> >>> I see.
> >>>
> >>>
> >>> I was obviously overthinking this :)
> >>>
> >>>
> >>> Sounds good. Will update.
> >>
> >> Likely worth putting that into a prior cleanup patch, so there is less=
 noise in
> >> this patch.
> >
> > Well, this is a cleanup specific for smap_gather_stats() funciton, so
> > I would prefer to keep all the pieces in one place.
>
> I meant as part of this series of course.

I understand but this particular patch cleans up smap_gather_stats()
function, so if would be weird if I move the comment change in that
function into some other patch. Unless I completely misunderstood your
suggestion... Maybe you are suggesting to split this condition and
comment change into a separate patch and making this one a pure
special-casing elimination?

>
> --
> Cheers,
>
> David
