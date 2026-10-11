Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29482315D49
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791742381; cv=pass; b=rvWFZ6Yh9i8E4rpYcp2tK1bwlJ0dCxgJpL/BpbJUAqBTO2uuWf3sTckJdN5wGkhW4QkeD6mIQJqQorV8YeswMymiI0708T3q+aD5XGXeti3FZ6Sx5/dGsK+xykYzKgPc1mKl3QOpx5ouFuX8h6H+bsTtXotYLv2EdiVYOu54SXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791742381; c=relaxed/simple;
	bh=gwRi8tJ5LauvJF15FnsWPOaMsiBcZj8ycmgZAY2TY4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGoDLT+HoPQjssL6G+xGQ9vcHl5CRS5v+177iyKyd3oDz+kghDaxUbGkLLWqveIdx3bnz9DgPEBqB0sLY+IKySnjUu4avpsqItNkbD9CATBDzX+jrIiDSoL9U0Y6QKmJ2M/I4lj7ITd0Xun/B5oMJiOtpeog0Pcvl2g3F/jFPUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cg5b/B48; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cg5b/B48"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30b6dad2382so2849683eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791742379; cv=none;
        d=google.com; s=arc-20260327;
        b=DZlzu75xXliOLOlZC3NbaWurCrOzSNZXe1ddt62y/eN6ShjLEiq4nq8MfZdDvgsKxX
         g0P6BdQoyH43USoWVb33XMYgTFXVRk/nwU2nC3dlZvSCSjcYGzri5ShjREYxsK6ceXeQ
         Ij991U9bI9TG65R2esQtVHWoaJLGlgIbRWej42FhR9ytiZXs6CFN2x+nJRbFrxiQqKPR
         vWu/DD/OXYlXOgdJWdd6ZKK3C2P1rlmdct/uEiKXe/x4ekj2H1SG1tIqlwi70/RrNio8
         HYHqR7Gy1omDvPvmnzhFOXthFSPEnUbawUxkKqS7oWEUYu38Zgku1xa/A1Pi4A5CSfh+
         s4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gwRi8tJ5LauvJF15FnsWPOaMsiBcZj8ycmgZAY2TY4w=;
        fh=9IzOtn5P3O6mGeV7dUg3OvDEheBXuWAFqDPgyDCHM2g=;
        b=WqlqHFXs+uJ2s8/pSZDMY9jUFlRnppliYMcBSoP94/75dYS0aPt2n/C1+vqAZNHdXh
         NBkyqSmPUM3JEqv6Eqw2oE4mwPJ84vF6tuJVHkLlbpZOkfAnNz3m89UQRM92mHsWYLLS
         gA3fD0br1x31vPFVHNKQbwlxGAGeygachLm/znyUmG1LqLa39r3g1WgA8QDwOrqLQoTu
         lI2ggY6jqr7xXXWgy2/9T1U3u9cE1tWEx5ItkfNn7ag1Kd0X6qo/cypOTN65fU2cunmr
         JxFwJXTm14dvRmj+KPtFGsMlbDVkl5Df3MKfeQbpiitFVdiW75sPgZkJxhKUTAFbsfO4
         7ifw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791742379; x=1792347179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gwRi8tJ5LauvJF15FnsWPOaMsiBcZj8ycmgZAY2TY4w=;
        b=cg5b/B482OUEHIyUOiMGEfhIDYnFdmVLCPuk//Gb3hEnVfAtI5lW2XuvLOm3Vwhv5m
         d/MDzRmudHFTDKKYN9/yOE8XXbezepP8Qjh2IafESYzqBggmxnwe8frz+7904OG4/JiV
         p67s9nc+7t0kvH/hr+mPodwvuVpMuZcs8vYNmrVx/6XM1ASMjrvL0KgJsf5Hc3E8+adB
         r97eUPqeTOZWJ4V0sT7zMpLtS+iOozgMrjebqajOpmkUQN3xxgbmR0JxnMclTXpVTCo2
         HYYgSxjmrqyf0fMRpwhZL+0h+bIwdg9lzSZ2zwPArwo4D5nccqO5nXSm0Buzg8ZpsjVZ
         tRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791742379; x=1792347179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gwRi8tJ5LauvJF15FnsWPOaMsiBcZj8ycmgZAY2TY4w=;
        b=FzMw8aykkGthbWmQPybU8tH6jJETjNG1Fa7TL0YrK1YyhSeMzXb89MpwZhhM6tmUsP
         JwsMtO1+2z1+DV5boZnLwihp05rJU7XfYcZuXXVBf2Wa6fSsA26GUpHcVi5N0RQ+xvoT
         Y8AkMwjnjbrY0e66+0Xsv7olL/kZ7aLs8JdxOFheBSaU5ptTpCy8nPOt0Rgli2spLZSK
         6WoXheTQDgvAuixtshbduxUJlWS1GDjOVUPeS6QrAnturBbf8YBnONXiGWs/ST8Y1H2j
         7yC3uJR0Nd5eerh8ovPKNnpMa96bVBKGqIRF2LglbhKgcv6BVzUslMFo13iLOuE75nfv
         7lLg==
X-Forwarded-Encrypted: i=1; AKwUvBxPnkDE7Vv8pataouO++Z6n06IwO0yafJx8N2WWMEmtpzl3QEheAH1m5fwpZG3f/Z3UUujGAR7lnlKa+p4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJy95tAANM1pW7mRJ8Q97kyCnzQYCkv+Z+iNtXcv8s5pzk/DZiM
	59/5Y9hFqrx7oyihPDWQZ9uVXKHZicEjDLyO6I3ddq2V2xvluDPHh/08fCFs3EiVd7KqG6E8nU6
	r3iE/nHHiaGpdnpDqKtGpGCOzDsV7JcE=
X-Gm-Gg: AYBFou043COQ7+VPb/eWWgsD86soFaZrb0uK/KlZNXkNazghq6TimM/vKmPA594Klk+
	gAuoUYBLSjCdZLPjOt06NGWz804m7U3sEm71kt69v9ccXsyN+PDal4pAXP82NkZxh87cEH9etEL
	I02LF8aw3x/y2rRJZt0cSoQCmFGNq+za8kkGfypaJmZvr5BNwo+GAV0wZGecU0Y4gTbt05bO7pX
	UISfNLUXYtq6cDC7uBYP0izQjR54JGLPbseByatxWG23IDY//AAjy9Hx0h4DXqYENjXQxxu0qaV
	XDpUFMFmhuDd3rIAMg/qSK/LFkJm2DVXyHL0cNGXzBZlSU/xPoGSkX+n9t7SVvEhXA03MriUZYW
	fyQ4+JgjvkzvG5Q==
X-Received: by 2002:a05:693c:62c5:b0:353:7d40:6636 with SMTP id
 5a478bee46e88-3537dedaae9mr9900985eec.1.1791742378990; Sun, 11 Oct 2026
 11:12:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <asmCc1VxVPLIMgY6@google.com>
In-Reply-To: <asmCc1VxVPLIMgY6@google.com>
From: Christian Lamparter <chunkeey@gmail.com>
Date: Sun, 11 Oct 2026 20:12:47 +0200
X-Gm-Features: AclHuK8acOi8aVEUTuLTHFRamALp4FOSGaLarP7QqSjuV8P0SghSz45EXW4MkW0
Message-ID: <CAAd0S9A6zNJU=BkUgpGtdHBgkcnQ0NyOWb46aDnBuGCf0TKvmA@mail.gmail.com>
Subject: Re: [PATCH] Input: reject parent overrides on managed input devices
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 5:54=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> When an input device is allocated with devm_input_allocate_device(), the
> owner struct device is set as dev->dev.parent and holds the
> devm_input_device_release resource. Later, input_register_device()
> attaches the devm_input_device_unregister resource to dev->dev.parent.

Ok, why would this be a problem? If something other than the devres
garbage collection
callback access the data after it was unregistered... what else is
supposed to happen
other than a crash.

for what's worth: this patch seems to be a "spite" response to this:
https://lore.kernel.org/linux-wireless/20261008-carl9170-reverts-v2-0-3ecb1=
2089797@gmail.com/

I think someone else is working on a separate fix:
https://lwn.net/Articles/1038523/: "Revocable references for transient devi=
ces"
With todays Patch-Series V14 on: https://lkml.org/lkml/2026/10/11/475

From what I can tell, this should have been what devres was trying to solve=
.

Cheers,
Christian
