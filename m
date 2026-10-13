Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79FE51CF5A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904786; cv=pass; b=BWPqQ5IOgHuDoO5yGpzsa6oE0g/n2so+8ZQR7z7tMwQZpgJOh8+u5RXrTX9UqvgJ+iFfPiOiKsgMHxa3qrhw9E57hjQ3eRBqbnXWmHVXwX31zljL/5oBxzoHm2TlppG1Zzb0oR2JYmq7Vg12seggTuN95rdyOMxAlTJd889bGYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904786; c=relaxed/simple;
	bh=sAaNg3SxdM3fDYy3xPI+WTibnl+GpjCG3UhJH/QSB80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyX7m+AxS4I25JymlfC+pKzWrCEvqb5R7nsBjsCY9Gwlpr9Q69ZdHLKg3E4XqyM4TOkZgIJ87FLng1BP0J0cZfgCdVbk2YaTISATUGfToa7leEvJ71YDJr5JbCANmraMS2Ke2++BswKasDiGld+OW1Nn/vhUwcR2eg2UqVejtsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEO90awm; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEO90awm"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ac4806e210so20380187b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791904785; cv=none;
        d=google.com; s=arc-20260327;
        b=gN3Nos0m7yNhm9m/vggKF31wOwb5fCWYqwBRgzLkeKdChf/An7Wl/etK2h90MH0eRL
         kjLFcg64TRJBM3NAruin034Ep8DufGJMtkXP3ztQME/NcxpL+xkJCSp52cjAapw2K+uz
         /MquFuX6+JRYGrZflRY2TE9q/xZJVYeUDvwf/YB+2SHCu+ldioXECNZZfbWpKw6DgKD3
         1Lx+j2uhaPvRVuXpKvP0YkcJ7e9vsJ1aiIR8tgWFpN+yLSs+CjOl6lbTXfZXG0pnCchJ
         j0DZuV32i0mO9IvY9X3JQ8Podcz26ICxM1OofvY1HaC+hyoQHTBdCvV5tgMOTkyra5Yz
         aE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sAaNg3SxdM3fDYy3xPI+WTibnl+GpjCG3UhJH/QSB80=;
        fh=XolmKqpewQICHugFJzuXyjF28t9k3VsbSGYBrQALtaE=;
        b=HmIM+4zyRJVrSVKSduoMda70AjOy8idojYbKaH5FmsAZD0RNyteMSmC68TeRFaBqgN
         OcHyBpYuCmS3KqlqBfGmMIkOit1d8DZXVjezKgqDdlXL/Y9lV6sohhWWtG2DEfuUajuV
         vhop0NeVI6rUB4+TJKNuXrYmVFQ5iGeIBTt1cm7N+Lq7i8RlGkQ5i8hYhlRn9fZ21j0E
         Dd9D0/dy1ruzYFxQCMltbUAFZf/eExMTbUY0w6wEv5M6mLL5Vnd3TRm8KLZPBFboNtsS
         dFvvRYbTu+uYupvTiWUBPynTEOb1D7YcVFvlktb8KDqaE4rdClLUTuv/OKzOuwkbczva
         AiEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904785; x=1792509585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sAaNg3SxdM3fDYy3xPI+WTibnl+GpjCG3UhJH/QSB80=;
        b=oEO90awmoU2xQ8nvG55q0oXHlOEC0ERqW7CE0Mlg3339bKHIdjmUH9qZ8HghkVb/5+
         CkEsQa29rYHoA7dwApoa9RqQ1/RKecQRGLSwtAYrLn/i2vqTvLcoPeFx6cPyawunwTa5
         uDmfl0q2hSHg9H/uiUB8yXqE+DVwOsuBbmFVJeIU66JB7JUHMGJFNgoJOoFu97JGTWV9
         prGQt5uKGDGGAG8CxeIsU7SHbeG83WJmOoBCLsm9jEIwyeK3FFA7voxM/2TuOOjCxost
         apZjQd0C/wXKIY+biFpfwYzA/KJet2F8b1wEo21+3srec9XzHwvQWthD3jLf5/+yhKeV
         zhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904785; x=1792509585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAaNg3SxdM3fDYy3xPI+WTibnl+GpjCG3UhJH/QSB80=;
        b=nnh+/1dXhI4nWlABZV774s/xf5PQcTpIgF49R6xpkHZEVuwCnULJU+/M4ZuEZpHea8
         0xagSPcoXJKCCCrBGoEf/RqVXZV26zZWJJAvDaTXkUTyQ2JGh/cWb1PQgv7Lrp3C734R
         QatjpC3ZJhdgn1LXqYBWeJF67OCwivwnLS/N6qypc1TLMA8ny5s6DowVle1bzsTRBHEL
         Yzdcpa5fzIvK7M/K/EKYSgGlxeUmlH0wJ+Y/daAF8w0lInpVHGm9URCE7OQNx86JUfuU
         RJ6EnrV54sTHU4ifA8g/CFTSUkUauRe+Vn3sA4jXZv725sXyp2rd6sssWiSQYFcTeeoG
         6pHA==
X-Forwarded-Encrypted: i=1; AKwUvBzOzm9gSjrgnIbh9lNgp5bQD3t/fOfo8jM9/x5uLm0Tx209sX1rUjj5bh/fSAMfU3Bswk5ZKb0EpwXmKQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzRzaOBESR9b/stazYkAaCj62tABc5CNH80dLv9rg1yWIvOqmm
	tfKbdPmcCwFG+OZrT2CWXYJRznyolT147NIr/rSbUqECvh3frP1/wlEr80PYnXh9JpNwgh3Q+5+
	JL1vcpV7ECp2UWbof0dFpRciWrgM6I6ZNGT3580CtYegqKtw=
X-Gm-Gg: AYBFou0Z75hAdbC1thbN/WFU1bSTps2GslmWSqMCX+oUKcfugWfZmVoGakkNhWXvS1g
	RUL4Mxg54b2uMPSfiwvxa3p6xWAfk4AoeIsbUzLyLeb/MrYmjlJO9BPEfiY5rNnNzUELl0D8T9P
	E/65bfA020icnNodS4W9x4N6u1WyBzpO96n7nr8GJS0MURJSL7kvTVKVqti48AOc724dbDEbz1B
	N8wvQNR06biNU6ODN19JkZGH9CGhS8VqK06QTLMvm9ELDExpZbsH2uZANkwXS4FpObekDtRJa6V
	SvCWXGfxH1vQhJA8HlClqJ6FHz7yasrQm1mAZZ36owADqpo7dzEuV+LBc88FMbTUOL/G
X-Received: by 2002:a05:690c:698a:b0:8ab:41ed:c08a with SMTP id
 00721157ae682-8b07eab0144mr48055147b3.0.1791904784716; Tue, 13 Oct 2026
 08:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-ocfs2-objects-candidate-0043-v4-24e62761a79be6b84b55@gmail.com>
 <d5522bb5-17f1-4315-b50d-390f1cbde9f4@linux.alibaba.com>
In-Reply-To: <d5522bb5-17f1-4315-b50d-390f1cbde9f4@linux.alibaba.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Tue, 13 Oct 2026 23:19:33 +0800
X-Gm-Features: AclHuK8gdPEGKJ0_qGMLhW1-G20Db9CjxsJDyOZL76xFGxwXDOzAnrgPzDTY4HM
Message-ID: <CAFRLqsUXNnt7AukXFk3mP6R-GaV6CpJ-AJ6QR+J-YnjoHj4Nrw@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: hold a lock reference across grant AST enqueue
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, heming.zhao@suse.com, kees@kernel.org, 
	sunil.mushran@oracle.com, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

Joseph Qi <joseph.qi@linux.alibaba.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8813=
=E6=97=A5=E5=91=A8=E4=BA=8C 15:56=E5=86=99=E9=81=93=EF=BC=9A
>
> It is better to illustrate the race case with a sequence diagram.
>
> Also please change the patch title to "ocfs2/dlm: xxx".
>
> Cc: <stable@vger.kernel.org> is missing here.
>
> Thanks,
> Joseph

Thanks for the comments. I'll address all of them in v2.
I'll also be more careful with these points.

Best regards,
Cen Zhang
