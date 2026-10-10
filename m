Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA303749EB
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596574; cv=pass; b=r34kRwku6xP9vYux/JDm6w3l8NyBoD+VqqzjYNoJzLWQeFUBVwbM8lgyO2e/desDddgh7S9FRIo12w2h2Rba99i/vuVwUOovjFjnbNH7Im+C7hGcY0RGZ897QjQy8H8vv7VkRfFNNG0XvSeK3Br9+xljI49cqb2IMOKRC8H10Qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596574; c=relaxed/simple;
	bh=o+8OqkLCRVEqlAYIJtPEeGd2EGzdU7uZH+zJciEefcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aR0ozmduEahGPgu6JQyeK6UO3SaTS/FSAUi4Wx7ACi+HsOsj2ZvQW3YY9+SrN4Qo8fDDz/BRKxhwBPi5rnv/D6Q1Zp2MAi7s2wJ9U/iuEkNoscxFw62sCQQUf/515lAKZ1y3Etfo19j4JZoliQ4e66UL1R8vtsXCIG2XSP+Ts1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djP545OW; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djP545OW"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a9761758adso3772661fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596571; cv=none;
        d=google.com; s=arc-20260327;
        b=fD4Y52uDeTeHu2JDGvwwNWASwqtTa+hU+0kl/7+iytrkduu+B3sOtmMaWOIW9P7R9K
         u0H25FsLe3HTDRkTnGZYoJPq+H5lN0mOyvT/IhPppujU0JPJ1xSFDgJfxr8rKyVGe92N
         qys+asE9LStvK7axqotQv1HFHbRC4tIX+NVjIEopvF4/6E6sYHXk9Bs+0mOdtKW5FOsc
         WaeeMN5cTPA4F8Wp/7oiisJgOes2Lp5MJU612uKfTn1hO/bbiVxAGgYMfzYpdTXVj52z
         ThDlXoVe4UQD7hRuyVYP3OPcH39gINZiN21sYth8yhvmsBBQcUHf6Zik+h9geij1VoZY
         8abA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rU51iSJF6TI/pyu0D7m4lbncGYiHJsMgWbaT+n+hL+Y=;
        fh=LN1a+/1bAZeCL861SFhWLFwBpjDrxmSCh06XkdBsppo=;
        b=Hbb37xLcDLYPl4cCiOX9JWhHiShhqvQJP3t3EQIsXMiQwquFiLMvysAOOJL1t6Uqq8
         2AVl0XEY5fDVubV9sPBuo9dDdCGuoSo/KOqWS3bzi3GgJPoRWyfBgiZqXOcZvJvZVRWZ
         RT7z/O1VsIaGdywT8Jqem2kZMg4E4WTEE9KY7n7seEXsTYaqWqKXXcSue/4z8eEEOWXG
         b3eDBobSdF+eG3lL415iJnhglNW85r4PVDbxn1BFUUfsc5QC7JMKj4rQ/d3BhpnYUJ6F
         4gQeJNZ0cWtGAoX+Vh702msXZTIvoNoX5VV2mdvoEYtCaH3TfUeXDAjT+PsahgUh2PPS
         g5lA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596571; x=1792201371; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU51iSJF6TI/pyu0D7m4lbncGYiHJsMgWbaT+n+hL+Y=;
        b=djP545OWl4i7nLgU35Dy89RAk7/bcAyd3Q7Epu1xORO9XrpGLmUJJ1+ii9VF4y2omp
         nNJ/t0X9sByrT9wP+GWygkWr3S8qwXqGK0EyZqWjb7S2GlD1jlmOAYlxSzxgGUlpSwkN
         QH2B8muvwoybYEd5Km1r4iwOjRu2EuFLM3yT7f+QwWe1FbKe7EBGLJYt+VETNY2rebi7
         145R53Ow3Qr1pRNyhqULzd9kUqqAConh1YIFQBJU6ay9JKpal9WjQRSVO4Cf9oqcU56O
         EHb4P1o1WnaU89RDV0MWxjn+ynB7CCrIAhNZss513clAcG7fPgsjZQbQmCKB1gE7pOPS
         qW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596571; x=1792201371;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rU51iSJF6TI/pyu0D7m4lbncGYiHJsMgWbaT+n+hL+Y=;
        b=ylOQHDZMThdcKv/0X24RPyA8MojujWJInZxkAFjm1MVMvduAMHBQauIqlTnen90U1v
         xCW6PYAT8Z5bBG0I9ECXdKWwjBEhD74yKDge1A9DTwDyVcg4HUoCn6dDqyvBx06maP8e
         6pw7onHbFTCs9CBn+ug2z2YfwVESgcrFccW1wJx2RafkG6WLuLCMQqMRsMW+kxPg3CDs
         YqVEI8g95HJHdcdVRAUEFeLsxGFbHTSGO2Jt7mMfXwESRWsRVZqyT6oqGThXhYQbSFAM
         q0Xf0gEpIwMdZJW0uPdxxpeCR6JHdND7eu9UkQHaLLU6Y8VZITtLZ6XRvFimvSwpqW++
         VWSA==
X-Forwarded-Encrypted: i=1; AKwUvBxhmUZgLDraTIaJletFyhq+NoJQwn7YxH782cM/CiUy2E07PQu8yCP3inc9lEpldRlPOKqMH2yfuR+ZlqQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz25ccbLmVhnL7NJ8yXyYBXU4+r8WS1cdVwroKCP0/1hEYscdG
	WrVVp4Yz67sk3wKSe6BQsRWKkP586A3MCHh8TrmBV/DamP1X3K6F1CnS0lmi6SEwFhZJvc7YnzT
	OnH+Scikv1uHEL1UYBRdizbd6xl2dY88=
X-Gm-Gg: AYBFou1UXUBGxIU7QxYQs5Wr0DMZBvDFXCXaMFbRC3oFEKU3FSIS2FtIZnmCag3IOi4
	+oPXJ+HJP55bDvSr8XUP1Z9tUkjPZMYwELfLUuoEzPxorBJ8n6YY4RTQduHxzovDlhMSYi/JiyR
	g4vCbiM32qBx/8rBpRF28pfXMzFYwCt9SDpho/HdTlKI428brINluLhZtU6Yq2YhLH8TJ0kcLVH
	9sIp137jwcn+Ji48H4FK+FFR2+JB2hWvx4ER37bzXUTwpfGaSsRHveQksDOmhYxVL9+TjQNyfjp
	h8j6BD9foP9s1JgFml9Op39L4m5e3gml3pvcUKbvbUs4fqLKnOY1Fk/p4gAaGYef95epkyeySWZ
	SktaqETanmi6qadQYYswAxOIhaGcrlZf+QBSB8fIiI/ZBCXlwVhq+bGc/GK455kV3xI43mOQ=
X-Received: by 2002:a2e:b019:0:b0:3a6:53b7:65f with SMTP id
 38308e7fff4ca-3a9c56e2e18mr5714141fa.24.1791596571086; Fri, 09 Oct 2026
 18:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009210449.971057-1-linmag7@gmail.com> <20261009210449.971057-2-linmag7@gmail.com>
In-Reply-To: <20261009210449.971057-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:42:36 -0400
X-Gm-Features: AclHuK9n3UVIh--yKnm4pNRVW0w9OA63SReP2p5Bgf3nbylkquF3k3WJkqHscfQ
Message-ID: <CAEdQ38EyiERiwrisqWfV+bSy26Ega2AL6HjtJESEts56sWqjqQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] alpha: load the MMU context when switch_mm()
 switches the current task
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 09, 2026 at 11:03:46PM +0200, Magnus Lindholm wrote:
> +     /*
> +      * kthread_use_mm() and sched_force_init_mm() switch current's mm
> +      * without alpha_switch_to(), which is what loads the context.
> +      */

There is a third one: do_shoot_lazy_tlb() in kernel/fork.c calls
switch_mm(mm, &init_mm, current) from an IPI. It needs
MMU_LAZY_TLB_SHOOTDOWN, which alpha does not select, and the
next == current test handles it the same way. Only the comment and the
changelog are short by one. My tags stand.
