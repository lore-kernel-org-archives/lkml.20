Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4681D35F184
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304568; cv=pass; b=G2VIzAk5ItekZqt7jGt3vNutDDICHEzjF64L8SxOo+Xo8ZHvW4izqJuJ4DCyPpNqYwOM2a3n28l3ZCa4TA1mg6rSC0kZFW+/x1roWV0klnvaO4TO/PK5teDeuup7mLJSETuf47lFs/OSZZKnOtB2dSOHkP7LzfWDv0NTAdaQRCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304568; c=relaxed/simple;
	bh=HlmuKfI3kJB59+iXbrxqBJk3gEIqwcG51Ecw2r8EOIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQXI6xtrTktNzNYTvBfStaAX6fPHBGAJ/aQeDiUlVBCwg8EPRw/GE25mQgDTb/z72jbIdYJiiRsm52+LMTWWucvtDPbz+AnbDYgdFga2juC0GZZQJrBuQGCZaLzkSmz3KiOGa85RzE7u9u8G6DM9Jg8L8cznrOlbQE6hHV7eKnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhDh+qrO; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhDh+qrO"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6dcf573c429so785669eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792304566; cv=none;
        d=google.com; s=arc-20260327;
        b=Joia7Cy1NydVjPNHLJgHiLB+bvQ47VUsf37v/GwJ96jWx1BMBoY4FZTR2G5VvlIU1q
         RvVqibb97Qgfs95n/KI62pZHSy9jN9aLE/6Oa4ydSLNeJnLRx1kEv9wzTHOZlRC+9XVG
         qUKtKczcai/qXmtSdNPtkd21JyqSduq9kghtplcgwVzkP1WPz0f2v8yrcTRVUiYZaoiO
         YChUugldRZjap582msVbW9uzrK+j0pyFGnIJ+02ARg44DHamqVUFsBWw4gVOtQA2+aHC
         10XjczJpmDyauvzahfF/AKzegPF9ZjMw8MxareBXVawJob5d+8U0dT5+GcfLOPawpgNq
         t6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HlmuKfI3kJB59+iXbrxqBJk3gEIqwcG51Ecw2r8EOIE=;
        fh=YXTF7nkMcq1J/RDi6LdxiqaLpEhJG46kiNoWY3x44m4=;
        b=qZaSA/3jZfw+Lt4ncdBMgVeorcnywLq+PH7R4rJAAdBIFuhV1uXYkLfSSFW8jvzRYk
         FCRZe+O3wckjJ7G/50yB+3cfePUJ6UsGhyNItsffMsxnjchn9mR5lCq5uykF6/HadZDG
         8rEfK8/QySTqlLc/mKv092hlEJx+iAiRi8dQ+TteDg6H3oUqqEhRwH+5fS2nJzO1qxdI
         wa4hgVPCoFwQe+T9IH36/3E/16gdecMSDGnk3d860ajtRyGj66dWy8KqSqOP3ijUNopW
         dC6gCh6oQ+8xZSNvubRDHjAhbcH11JeCxbhJFbV7pjpOBUYZ5a1K3g6lpyrm8VtD1VjZ
         adDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792304566; x=1792909366; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlmuKfI3kJB59+iXbrxqBJk3gEIqwcG51Ecw2r8EOIE=;
        b=PhDh+qrOhxN77Im0x/CueAthayuaBjMkGBIkEp+yKQ2fsOeRAU8FUWk0P6oy+dhH44
         Qv2ArKugNW7pjoiALVApj0wCwrEMqm3ukBFPS07qWoo/Ak6DHA7Ubg7ex4kaB0RaAsnD
         E6Z7lXKG3WLfuVQH78+Sdp4ARVS+f0q0LripIU00IGzN2iiXYBSQd86EThnGbaieRGqu
         rAbyntrQiEZxRIO49tTDbs8hQ8VFDlvTbzLUBI9M2OTR50Trvu5lt3QfVZPxmQw4B9ux
         21DSgLfdnaX0fxpdySGIsxsW6yeD62HH0t0g5ZhScXUt7pP0pkEOTcV8b/uui2XYXaG2
         I3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304566; x=1792909366;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HlmuKfI3kJB59+iXbrxqBJk3gEIqwcG51Ecw2r8EOIE=;
        b=KqAEh1cesL2gybK9Ffd+6DbD/eFnIx15CXsFDZWFERDsWvMtcacULis2LeflvBCDYu
         cCbWvEctoR0ewRaTBRo2io3qZ59RFxa/HeOQRCUXCdH6aQddcDxvXzAgmLaYrIAr9qHe
         NI6dkHfSPOHKNno3fwBuuUOXxE/dzaUSCSufK8FZkXRVQJ5R7bLtVJXOr4qyDvrlZHTc
         tS5Q2OfRN4ZCicxYXbW9X7t0GGKtH7HI4LsrraP3IZVz8Sy9ZNzgGLZ3AMPzgCHaD1ju
         jIxALdExXsE4zKwsnCmlIQohrmGadyiSW5OupPhdt9NOr291XoSFV9YWd6GXT8Y/5S2t
         xmpA==
X-Forwarded-Encrypted: i=1; AKwUvBx3sF84HpY9nH/GI0ZCc1Wd7gZpoM/xZFSQZdqkP2XeHJOC9eabaXdeX63q6ESNXqVJxk757ByGA6s4EQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5/AeQJ91bICZe18rKIuTNp04Sw2S2KzDK0zQ05C1GTbN6QY2i
	LWIV0KRWzi4Z6VMK1GbpEh4BExSFSA0mxoJTTpu5v7vnqTxo1vTHr1Uo7A4b1zgMjWrNQ064p1J
	Gn6fnOnOkVCAPbcSkrXMRY1H31x6/q4A=
X-Gm-Gg: AYBFou1joHKkhs5fcW5Ap1rq6z+nsTDHL/umAOZJBm/FPiq5mihjxncUP5Y0mo0/KLQ
	rJNVXnE6yQm1dnvMZJMhzEqVWL/u7wl3eWUfOOV5cLwEPSdkMntNOX9BhfqXM3ES1z+VOSUnNes
	cZ1tRRysPT8Zz88KJBft+i5WxKl3rjfcdH0WRiNCULS148/Grsfg0mVIJad5ZW1y09U8bMMxVJd
	foESiIWwQtxdPKMuTIOgnB8UTlboNTej70ANxBZ++e6W4uAs984nJrs6c8lnG8Zsp4fSndfJj1I
	l/yDQLO40/YCj7uGdgZtEb3N9emHi8MpsHwd2BEzP1jxU083CZ+DIfGq
X-Received: by 2002:a05:6820:4b8d:b0:701:795:4eea with SMTP id
 006d021491bc7-70357495e00mr3531298eaf.62.1792304566146; Sat, 17 Oct 2026
 23:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014091111.20059-1-abdelnasserhussein11@gmail.com> <20261017231747.4906975c@jic23-hlaptop>
In-Reply-To: <20261017231747.4906975c@jic23-hlaptop>
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Date: Sun, 18 Oct 2026 09:22:35 +0300
X-Gm-Features: AclHuK_Ca_Uy-OZ7tfLlUzH9RqHtWG8Rwb9-cwyEYDkMviqvqgdGx4a3apmhzxQ
Message-ID: <CANpqX3YDqtqGeeqscxF0YqMWMmSB9fpkMbxapq8WbbZWSQH=EA@mail.gmail.com>
Subject: Re: [PATCH v3] staging: iio: adt7316: use kstrtobool() for sysfs
 boolean parsing
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, u.kleine-koenig@baylibre.com, joshua.crofts1@gmail.com, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Thank you for your feedback.

I apologize for the confusion regarding Joshua's tag. When Joshua
reviewed v1, he pointed out the necessary fixes and concluded with
"Otherwise LGTM." Therefore, I mistakenly assumed that I was required
to add a "Reviewed-by" tag for him in the next version to acknowledge
his review.

Thank you for clarifying this for me, and I hope it didn't cause too
much extra noise.

I also really appreciate your encouraging words about these small cleanups.

Best regards, Abdelnasser
