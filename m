Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E9838B12B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768672; cv=pass; b=nMYdgSxYqSV6wu0l3q9LQ3v0PRdVrTqviYuLsaRqVuPhPmRbNfivh4qfxNjhhOonN6UsGr1nhBjVpJSBnByeO9r5+7mLOLQvqkpu42vHMqQH+JUkADlzo9NLwCBw2/RuMgxKQX4E9HORsXOkc5Ca/HPmKSXMlrYq7ls/3K+qVBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768672; c=relaxed/simple;
	bh=yxS3uhBDvfDEPOTnAxS76usAFm0hrKWhB58ChKobAUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sATMqeuH+OFIePvWs9J4zJt3E/9p92XJ8C992DwNhCo//uFB93/COl+XuP7BeprqszORhnKdMziyYQG02TmUmIxp6fhoghophJLjp+Mxi+R4zEGFPXWXXxP93g+RsundyLR96e+gIiM13HUQ1ixOjAezqM3YrE1sYPdhhjTnLhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IovhHvuH; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IovhHvuH"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-483c607ccb4so889073fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768670; cv=none;
        d=google.com; s=arc-20260327;
        b=J4gN4jCnmfFJKnog8tq4GjclQ8QZO67HKv2f3yzOjp7onBiIQouRascazse/5cjD48
         dWHPyhEhWfwzcSFHHyey2s9++bfr3wivCKpv0G+TDDJIrLa/3OD+6tYxTCYNz6sGZGju
         5p6mHq/PdYP6kgSOc2wEfCpgbBkRCSA1tFkbPjrRIOPY0gZ2yRY6mhXpsNIXI1+xxmyP
         mzkmAtM83qXJYIamdgJ/vqw96h9PHnv331DDNCt0n/TVa7Loa7D5KAyhVMRC/3oy2/Fe
         iaouB9ifeoQUb2TPWSYxD7ZEuoTPPFSm8fSdJ3XJKo95+cb76/lyCjWNZMwdL8s5fiF+
         DGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0YNtwNnqhEyRRpVNg8EzN+lDMoQ6yIJewZ5GDTLfOXY=;
        fh=ltyC0Ou/0GF+urEYex6RLR+QDSqf8KamuH0GD6ZaVoo=;
        b=h9E74YHlKiCRWdJb3f9dFEi4MZNcXEEAfVddmBHvz8XJCHoljJN1bk+gHqx+oYtsHl
         D51cUWYR5sH8Ulx/mql1BpKPi0D8Dda6Voz1uajssmpLYdP0cra2tMhAEPc7MA6vfNPh
         Gh6iCG65WZUqKtuCNON0tbQIlAC/4GKMAWFlrUL1+lFQXMhcTWA/tJxP0PcP9RHSCNF7
         cZHplJnWoGuMR9CknJqH8/2iRhQIO3uCPk4XoP4HOWVPmhkfzbRh7gxP3B4RPGSHypwb
         5DIUr0r4L3Js34JFcPxg58EsgqqJu3AafwVwNo4QX56luQFwX1zpac8pvYfAw/LX741B
         jETw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768670; x=1792373470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0YNtwNnqhEyRRpVNg8EzN+lDMoQ6yIJewZ5GDTLfOXY=;
        b=IovhHvuHDPrFc24HxlYyZOelam/C7lTGqjHacte8+xRMqRlrJTu9AbJwZZRvWrbbFp
         VFLH96WTeyDhAjZZXW0yImXztnDKWJMcygBUoZmDHajhwHGU0zrivcBwGRChWx+bScrH
         fpukR9VuSwmWLg9rMU9JKLu9zIzHTc2qmLsZfCyLB77Clr77bbKHvkwAtzWDnSwOZ2g+
         3oW9Wlnw286rs+Ct8MrGLVluDPfnMLfwUXrZ8UVU0gWsmaGl92C/85iJrEzFD7LI82iL
         daGg8PQssEzg3iVtyS+eAXOAf6rva1oMBhxvp8VDtk+z9BVjxZ/O79oGOY2MejP3n8at
         b68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768670; x=1792373470;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YNtwNnqhEyRRpVNg8EzN+lDMoQ6yIJewZ5GDTLfOXY=;
        b=C6MIySS3HRVIua93VZFtd6jTs6Mi7SG0lJ9odgyGUH5jRuyII7pVNy75DJglZ7rBkd
         59NeFCGP1OSF1flXvOia5pLGvgs6I4ja5oStic8TzFjGHiO6dDgvRKywtBFOs7KszYaG
         ZVp8JYSeVAOv5W2G8itqEZEcneRToTafpdzPCqqOi5gsX2VtANs1Bi9jL+f4KGJ/wzZJ
         75PFj2tyq6HMxfvMHAjQX3UPnztTba87OX4Cz6g8Fs6DuVQ/aDrUgv0yNi4dQmMK0ncN
         44MTw+o/cR4iqGKWcrX5OEjWrfTnlK+m6++JCWU7NEZCzswOLG1Z6ApjTO0uHKneIwOo
         +W2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxg52i4pLn3Wayg22DaWl6AhgDUqRHzU9hh8k/VKdAVeBOH/DSOrOo87eDsRRAZcp5ySF+LRqPfbsDz+gM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+7gWKid2fTQRJ9JK8ZBU8Oyem2NbGv2r6el2nWu8iQnFESIbW
	fn5fJwHRDQbD+mgXWCqMjQSFfbcd2h32ADxoV3+BPrAV35C2lisdeoo46qQo9z62npn0Tsa2VP5
	NlJEYoGO8XvSYuk953PLAR4tU9wXLUHI=
X-Gm-Gg: AYBFou3u0cVxQrC43u9ErF9AN4DEfayC9BlKTyDfzE6VGGl1MoqZaVrLwwC6pymWWpe
	djuyP9q+SrLRFI12MAs7rQkQkZb4d/hioZdc3Fmu9emwzgVPscgnHvUz76dsxWu2VvgtsylukpJ
	F0sQIrbhf74Te0Q3TS6miNuMi8IGLmAjelMAKwSzt7vw4NX9eAZ+E5PnuVoHp6hnYDsvpY1aWsG
	eRTRi9/KjGPwzhLgrmfD2TOwdHWNluAQknY9HzLwynP84X6x0dvv1cZs6MLV7UWAo94sil58eum
	tm5Wemaa3qEyHjilCwfUE1OYvRcOgN3IKeaIqR4XGLaZmDbgkgbqSUc=
X-Received: by 2002:a05:6871:88b:b0:48f:e0f6:bd68 with SMTP id
 586e51a60fabf-4a2a8b421abmr6481919fac.57.1791768669944; Sun, 11 Oct 2026
 18:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903111328.805352-1-christian.loehle@arm.com>
In-Reply-To: <20260903111328.805352-1-christian.loehle@arm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:30:58 -0500
X-Gm-Features: AclHuK-niUwLhpYe_kVt5YW52V3PgUDZ5R8udpP7iFVNpudx-8Rk0OjArTDOtgk
Message-ID: <CABb+yY3h90WhxRyQnK21NhUNYcD9DVaivpxQGv54S3CHUw9jWg@mail.gmail.com>
Subject: Re: [PATCH 0/2] mailbox: pcc: Fix shared-memory teardown race
To: Christian Loehle <christian.loehle@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, breno Leitao <leitao@debian.org>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 6:13=E2=80=AFAM Christian Loehle
<christian.loehle@arm.com> wrote:
>
> Breno=E2=80=99s fix frees the PCC channel before unmapping shared memory,=
 ensuring
> the IRQ is disabled first. The second patch serializes channel release an=
d
> request so a new mapping cannot be unmapped by the old release.
>
> (I'm happy to have my patch folded into Breno's if that's preferred.)
>
> Breno Leitao (1):
>   mailbox: pcc: Free the channel before unmapping the shared memory
>
> Christian Loehle (1):
>   mailbox: pcc: Serialize channel updates with shared memory teardown
>
>  drivers/mailbox/pcc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> --
> 2.34.1
>
Applied to mailbox/for-next

Thanks
Jassi
