Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E734929D270
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788084573; cv=pass; b=uN8w78T7RZA+UKRHF2+P9N3llU/5IPoESv3BsQWBcOOUI7PNN/BZHCGDaQUuEJlAacooeoEcgkO4/WTRoyQQxOqLGD1bHRt7pTSeGWahpSnPqBsYfS8cChhFJaAYb7lTI240gFafjw2xlzUK9EbRL77bKe2suVTlPLwA5qSXj9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788084573; c=relaxed/simple;
	bh=fwn+EptmguxoRiNdpcvJWiisJoY0VYOHLHFwjPr49ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I07efPdOwJL7MGeU4FASWAp68yrDISLjJL6mmsGXXI+E6Dp8/s/iuxP0Qo9uuM5JlKLWvXyhFqElmHbmabKu80OHjS2IwX+9U2VhyrXbYH6Y1+kh38FCKdECPnlck8Hc/w1WCqNor5TqUbL1lCJ+ftpzWYqrQtZC2i+xZqqIzZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tqw6vmqP; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tqw6vmqP"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccdce28edeso2859295ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788084571; cv=none;
        d=google.com; s=arc-20260327;
        b=fC4hdrDBSFIMRW9Mfc9bD8OWgRAS6l2mBj8V79ZdUV/AJbOZQ5jkCJd6TPdblZtvKu
         YjJ/F0my05Ski6zmicVrMWogBTIItP6/oPdBZJxVRGu81+34LQhiO8FSMDoUEQDJkXVP
         agqg5Go1fPMZVmTw+/bpf9+hT+9iumrdonyQQBGDZnr81SO4EMBqi9eR6HjgEo7ECzfe
         0MyqDUtX5EpOkcvNwxNej1LMcwN46TB3X+0Pbf7oD3mT1NYR7VJ5qLt/WSHDCosIz8x+
         QdF/rCFiJd9Gc23wh4iPqtefSPZb+u/i+5KesSmEhFsptlSnk3FotyAHzdskaEB3heO3
         QEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fwn+EptmguxoRiNdpcvJWiisJoY0VYOHLHFwjPr49ls=;
        fh=8KqAGk9Ksr1TYnIB8VYcuK04V8Npr0BK/B6OMmPB6Lw=;
        b=sYMMNPyI1YGoDogP/eX0KF7k3yJ3acs4dBbjtL8w6Qv0uL+XhiAk1ZGbxpabo4jRJx
         zQRWIG1JLlx42hUQmPQMpDxnO9Fe4ajf296AeFrxeQcmCbZ2IFj/nrN2rp9G8I5QOhos
         YSJnH/81/u2jwjaZzKdaIkp9PDwtXy1ehTJRk6LBw0quZhRm9s8ASRpmurXya8IyAD1H
         LAZ2bc1kFKvb6iCji6kvO/aLernyzheXb20xvpoxHyXWI87B40kJv1b0nHXz+e0mftbQ
         qPYLlK8kvJoZzgqKjxHZt0YOTEylkkWKj5y4/NpU9qRPNi+WqrRwE+C7rQrwrxrQ/Ivk
         pBRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788084571; x=1788689371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fwn+EptmguxoRiNdpcvJWiisJoY0VYOHLHFwjPr49ls=;
        b=Tqw6vmqPJK0Q3ByZeJ+lHNZPKj11+5Yi+Lq95UQiKBvs+qglVDNgwGjO6XFn6ss93A
         CsNFaz4Jq1XADQUEjqDpmAHP2XcEyjlHNQ5OimE6f5eIxON3D5VuB3kvoSjV3cAJLFEE
         62RXAyq0108b8HOWgsJMWMbwTn+QX3Os9+cDsimhceUxrbNEBg8mmFT89WjLD0Pt5q2V
         YVYGP3cqSx/RjrOWI2G5+5SkbnqYYySb2aLLy/6aTLIy4VpxyiX/6hwFxKJvzNq/NRt9
         JwKIZTqSDFOnJY6pSPp28lwTmH3xsD3eE1RBOoSfXcYyhKY+kb6EZskgkqOaZ0nWztYm
         jJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788084571; x=1788689371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwn+EptmguxoRiNdpcvJWiisJoY0VYOHLHFwjPr49ls=;
        b=qrdINwZVLYUM/GlzljsV/4lcfLMUeX45p5BKtklSe/4DoNAXCkKH9WaKZr2yKQkIFn
         zP0ykSBFQqZ2hXeexvhhDbDc/qtIMGcprkEyXp63tfgv31XTY493k7ag2HCfmNXyB6UG
         r+mmMnVWigg7sDVvSrbQg2JL8I9W4jql+icCFKy83L5ymVO6046S0qnPSROYKarxOk2y
         hmBy5FEOIYA1LHx1NVyJXMUySlw+l+zWtlHey7USFJCifYCO9XlWxxVbVKB5TuCO+33C
         zch8mPGsNZ2Mi5hK/rBPl2k58kvf/rdXyMDyENoqNJ7pZWk5WWJLXnXhwdQhKMYNZhpS
         1bdQ==
X-Forwarded-Encrypted: i=1; AKwUvByPcXD9ltYcC0YNEa3SAtN11jJlD2Q4UPQ4r+/wG6p7gR8bmSUyx8aVluTZHUr1r5J4cEC64Nqhyj9Lci4=@vger.kernel.org
X-Gm-Message-State: AFuF++n4aUjZ7nrHXFX+XophAfR89ys/bd/eRt2JDEciSpZTn2AkWpk9
	urnrO2aIRxVRXp9G5SKB2IxhEViCm7vrTO2l0kPX/nQ36iwQjKeNOXyIEQK9gTMtXgqntVNZzMh
	jSb7ZPskpXbOG0DbPvqNt4blAWavEno8=
X-Gm-Gg: AYBFou1USRV/cKwscee7X3eqOaHikvkMIOFbi7/vzcWM0/HGYZ2xFFRHqqjidrkNDv1
	1y4gRG0HhfCNjMMMjKcYkDSBIA0EdkB70bUGpQKgdPcYRn2J6w/h/A7tAI587qcOw/UtagWoEck
	alYpkf/jYJzGmw4pUR88mivWl/rH9/hbA8CJgOd4j40RD1NqhxHJ3NNflbpmv2intt81H3PcE+i
	5vxxZX1BJkfBSk7paqENlcI8Ck/9CtTOuYcXerhOtn9ir4D1rrmgaUCE8UeKC6NZ2AS1WaMFDdX
	ZNKt6Ma/bO8vcq81WgAIUGdWV+VLl7s8vvxbOj98xEoMkq3hju0mTJTm4/mkNPM839iDtJPjzjp
	qyGvFhbtZnOG88KKwN7SR4V6CUj/WOyw2KvjoOOMKh5/Eizp/iMxehzwRHXRv
X-Received: by 2002:a17:902:ed82:b0:2d8:f4d4:7044 with SMTP id
 d9443c01a7336-2d8f4f2ffe8mr50714575ad.3.1788084571161; Sun, 30 Aug 2026
 03:09:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708105713.2073335-1-mic@digikod.net> <CANiq72nB6=EAeKmoWcsVR1YeUCMkFZTEdndLcSOEi1kQNPAc=w@mail.gmail.com>
 <20260708.yi2Ve3eeGa8a@digikod.net> <CANiq72kgYwB0CXizay_5ejvqzcxxV235sm=xEwBNTGpqGcdUnA@mail.gmail.com>
 <20260708.kae9Abuath6i@digikod.net> <CANiq72mmZF7QXdk+9s8jcWU5mfACy48gn6wZ1RZQwxaK9-03YQ@mail.gmail.com>
 <20260708.Ka2tahree8ad@digikod.net> <CANiq72nPB9-GpYFpyOxedtFRDGb+6EoGjMCYQ00S6wh6dth4Qg@mail.gmail.com>
 <20260828.ye1xoPeeweel@digikod.net>
In-Reply-To: <20260828.ye1xoPeeweel@digikod.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 30 Aug 2026 12:09:18 +0200
X-Gm-Features: AcwNN1W0RQjS5Mx-UMaNF0hN13tWsXyQyf7dTpkEzla9Ua-c6vucFNXBsF3siPE
Message-ID: <CANiq72=iYpz4ZkPGPfPZKQvsdpPo1f7KgzUL59VzcrN_6A2W3Q@mail.gmail.com>
Subject: Re: [PATCH v1] clang-format: Fix formatting of guard()
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Bart Van Assche <bvanassche@acm.org>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 4:11=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <mic@digik=
od.net> wrote:
>
> Could you please sent the PR to Linus and Cc stable@?

Yeah, sorry, I will prepare the update on top of -rc1.

Regarding the Cc stable, I am not sure. The formatting is not globally
enforced and such a change could break things for others that may be
locally enforcing it using whatever list was there in the past.

(Some may even consider the Fixes: tag itself here a stretch depending
on how one defines "bug"...)

Cheers,
Miguel
