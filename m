Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040B63F7ABD
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789328864; cv=none; b=GPeqFqffx0abVry7rOF6tdtAAz1YNStYtAELpGvO0H82BvWpqjEwHSy7eYjhjeNYENmqDl/f25TcuRsdV8nwUF8sPMOMywLbhIREs72uJgK1pjIUkDRQUxBuqphclfdvZT6Hbq+oI2/ubqwdCAcjyGF3ow8PDv3C5Xc73GhkzPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789328864; c=relaxed/simple;
	bh=CNXSCdLg+ipJh1XUQHffzIhB4cs/HHYEfscgZQRXB8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hk7vof52kkYYan6rRmwnqhNqAsSn96S3nrm3Advxvdc7vQKccnObxlOyEuygF7FB8SCig7uJ8GIwsSrxOE0Pqq4O0dSYI6pqlH1PhVd9fYGT7rZMrwSeRop4NI5fSdSbmsHYS37zJnSWnJxs324RoifoJSb2du2/Z1RKIK0tx6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=h2TekqWx; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="h2TekqWx"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a9cb66f7b4so1929314a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789328860; x=1789933660; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LHsgs1UZakOrAxn1XlbgOq8ver2Qi0CyV+c+xKT3ApU=;
        b=h2TekqWxqxpkF+B55ZcEdBvaNkebHxmho6vVDfcbnczvIYrnROR93TQr0MAtIK4Xh+
         plglH380EYe0+c77v2/sR3aflNjBUbsxJxikeTX++5/uYDNwrqYfs7NoXvueBtu8/35k
         i0aG4Q8IQKLua1tqjUI9o1UghZMtby42t6T3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789328860; x=1789933660;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LHsgs1UZakOrAxn1XlbgOq8ver2Qi0CyV+c+xKT3ApU=;
        b=UweUEWr4SX4mQg7N2vLRkfjPnFIWmJcS27lc0wnEqJvdEQ5+wimxRl3XYvXEj1tRmW
         5ol9kC7lDU4gxXJ8fLL2uRwbpASiC9bByzVfelOdcCH64ei+J2xWgTQaMXhGPKBsey/M
         e7Utd495t2WBTuW+3OTViLDRfsuzh7It+yqUlYGk/cN3LtdofAEXtcWZl60Y0YjBeW35
         QZuO7b8OPdDNEf8ItYe5eXFxtfrmP+9JsGvMOCuA1XTJu4Ekj9/tOtIRkKp0P/kWDsqc
         LJgE0N1I9y9b+WmY6DW14BOSr6L4mMghGao1RHh/BWFke/EqfPIdzHXI394ae2s1edyi
         CHXg==
X-Forwarded-Encrypted: i=1; AKwUvByj+LpsdEtgi2ZZsU4jv9TNOWvxuoZENjqqUNn71GN5AkgkkilSMZ4/FFEwrs9HkxATJylHjpMOVZ+2cQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++mgmmC45H9E2rThkK+R66b8Bj9GAql7xSnBPQNxIM7twkI4kzXb
	rRv82ucZ56un19my+Mxzr3iat5sdrQRQk2JM/JJemYZmWAoJztoeyr75F/m2Tb8G0dffWXrL2+Z
	pA+X6hVE=
X-Gm-Gg: AYBFou00hphSxeH97GdegqGHJmEyXTYF06VsSFpUAdRR4thoAqqGOlsB33bpgq03Atl
	Q7r9YFJigDOg1aX+DopQi9Ysgb8T8tM99hEfNS1BZg2uGFaM/ui0RqZUYHEsEdhiHIYEzO5Yhnk
	bc098yWFp9gHewWZts+KpV4rnQJCpyEfgok93yDIBPiMyFbea6Ok4O4keW1Ark2tLpBTrhJZPE/
	m247vseV5c5O8hqGBv6tJt7sDDyG3i8FQxenWTw0S6nUKH06yKDfeMtF6mQyEgeSR6WHm/5dRU/
	s06d8cVg9QSGGDvD46gq3eLYu67e13gO8aQZf478Atbt4FzE/j/Xqpbw6lkrTK+YHafclm/c+54
	8/M2A89Kd13TKnXMXgD8NykvsaazEhnBg4pte2EVSOXApegj/ifR+uP+u5fNsTm8G7HPfqHAQGF
	8+N6vE4HzSWJtUON4d5DsOv0sndfgEtneEA947p4x+rxRFk0CRJcPK3Cjz+sx9DN2zZQGvO9V5k
	rK+Kj2hy2nU5tQDgRF2Jcg8Lu8rCWb/pDuaNUwVyZc4lpAk
X-Received: by 2002:a05:6402:518c:b0:6a7:ee54:f897 with SMTP id 4fb4d7f45d1cf-6a9b56a48c9mr6897206a12.27.1789328859809;
        Sun, 13 Sep 2026 12:47:39 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594e462sm3282071a12.24.2026.09.13.12.47.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 12:47:39 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c253425b253so409264166b.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:47:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzCARS0jQvo/bToGTht3TzPElAExOZ8rc3GcVoSBPTqvCgZ1bmpPpeguq9jNIc0x/uJhvwdM06rA6XNOzA=@vger.kernel.org
X-Received: by 2002:a17:907:3d0b:b0:c25:2fb9:b897 with SMTP id
 a640c23a62f3a-c29665d8885mr678602866b.18.1789328859154; Sun, 13 Sep 2026
 12:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <46403cf8-9a81-4596-87eb-dde58ae4c5db@leemhuis.info>
 <CAHk-=wi70keQUG4ZDdXiG-HAeFQSzVBejEAUOgQy7rqdQ9EtUw@mail.gmail.com> <e67d4f5e-22fe-4100-a06a-91a3d1cf38cb@leemhuis.info>
In-Reply-To: <e67d4f5e-22fe-4100-a06a-91a3d1cf38cb@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 13 Sep 2026 12:47:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjTP0TQxbjpy5VmbG0k5hNDRoQ_Yw0Ahy37oNsPv8ekpA@mail.gmail.com>
X-Gm-Features: AcwNN1WvU3y_mcvP4eBqbFQYFeZDsQ6seApyYywhFp0eX1AfGUYqK3SCjE5dIaE
Message-ID: <CAHk-=wjTP0TQxbjpy5VmbG0k5hNDRoQ_Yw0Ahy37oNsPv8ekpA@mail.gmail.com>
Subject: Re: Quick regression status pre 7.3-rc3
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 12:32, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Side note: Some people suggested I should submit regression fixes like
> the three you just applied directly to you as patches or through a git
> tree you can pull.

I would certainly not mind. It would make it easier than my "apply
patches by hand and then do that explanatory merge just to make the
reasoning obvious".

But hopefully this would also not be common enough to really be an
issue. So whatever works best for you,

                  Linus
