Received: from mail-yx2-f29.google.com (mail-yx2-f29.google.com [74.125.224.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3D44E73BA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.157
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790024443; cv=pass; b=Cjxv7ddGsoSajC1NEfCr2HUcM90oCmUWjyketaDLwYRJfvK1vtCqLoq+K0Nsh0/bLb6YG4HiOqKHltXQ8jgeftMeb2m9FiHjL9CAAxXmZFSyRWjz1BSr3OHpoWbjyiosrrJyZdPEhz6nfOHpVEG3jw7w/e4ihsstfyZ7aLm97Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790024443; c=relaxed/simple;
	bh=B1hmclWtNW5qs7gv3tUrEGmKb2mu5k2O0/3ZJaObbPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sx3alDtM1vV7rUaQtt5SCw187MD+sm/86Io5V++HglQhO11OFt1OfEgH3FZ8RK8p4mikvv4vhF1S3G2Fsk/B/9lLUwwqa2kpV51uwnxthRNM6b9n/XEnhMo2Vd3Ps76qEOJe/Zacah6BOqV0x17X0YKIYubFpDh2cetU4YO5JoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gf1jmbwB; arc=pass smtp.client-ip=74.125.224.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gf1jmbwB"
Received: by mail-yx2-f29.google.com with SMTP id 00721157ae682-85d43da99easo30259407b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790024439; cv=none;
        d=google.com; s=arc-20260327;
        b=m7s4yQmjrSDNg5wWEon+6GUunrBndzNmZKdlmA3dFPF4FDa2/jyv2uXuGXwWxs2A1u
         Eqcwm4SE0WfItGNaxe8Dv3LvbnWIBH4WWNphHkjcIdAinhxHa/rbdxYze3LO2w3R2zVE
         CLSn9PcaulR+GhLeve+DHjJGlKYR+f+sxubYuSgOxzE5r6mXGb7gVKOHgzBOFHArHVPW
         17eCtk9sDZ6jB7+qD96LTBZQIwLbIphK3VQtxxc5JSuQ+LYeTz7bTmdsXfiYB9yk00zU
         6rcRWMY/45AJdNwCTAUb9ZkTD7hQ8BlBoC/E4wEnj2F/yf3ZR5lfkmBa0RmKIpj3tbY2
         v9hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iaWbBV3Z3yhSOyCQfwk+cCwWzxlbdn32GHZFoxrvfbI=;
        fh=9t2vu2BX0EXBgN7zJR7QLwCjJUdQTRIr7/hb+2S+f/w=;
        b=LJpmnznC4XznWfCJayCxceMkYbaklntZYOH83QVOUABna2r8YxKs8IjbKX7wXVffgx
         joHcDWw5a7yO5nk1BTiqDGuG+5ZETzgPpb6bvXyHQxfG6Tn75BU5ZNAv9buc2FzbTv+3
         zj1qkQ7sMJY/i0a2TNMSsohkameMbYdm66pq1xNcpJCXhz1kuAMLMJnYA+n5Yqo2mX9h
         I54H86NjL//vY6Vy23NXWMMXKDd9L5rXMfalwFEa5xCHMLnhkiIeJsl1DzlqgWronJWC
         R6Pyy5IeTZNygV3X8pp8m4rRIE4zCcULXWuKaqAstby/bQzLPgQxwOOOx1ecJIC5dg46
         txQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790024439; x=1790629239; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iaWbBV3Z3yhSOyCQfwk+cCwWzxlbdn32GHZFoxrvfbI=;
        b=Gf1jmbwB+MVQzoGKFbVMx7QpxX59GMO0+lUhtvRUSm6Y64y8J1SolLaJllUWpXIBWF
         RFLrlw0d2zhml/mYkwJtUZB3fT9MJ9C/ZOi84Yrgcq6tny+DpC/DpJiwT+pDeY7LdeVn
         TR8e1RETFf64futJQUpluYOPFnbf9UOw5l4O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790024439; x=1790629239;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iaWbBV3Z3yhSOyCQfwk+cCwWzxlbdn32GHZFoxrvfbI=;
        b=fgxE7wt2UPULHtJQdlTohKN+SqeE1doe2G77w2of3Us45mxcoEvneoomGCIQvsykRl
         IOUW59Av6DPhlZ+r+KusoiSr68d5uyxxS9rXna21W2HeElLRzGm8ty23CNvA4y49/X+u
         yoxNh8xuzBNBnIX7iIRoVmiyFiHbHnBb+gAhpm0LjfVPV1tTfUPUvo3EZSsJvpGQtFU3
         PKWps1sXq31JxaHMepNrOQE5PvoYL0OFHBXmZHqGdoE1vbzIY8lIduy0gZQPzwNhavOF
         vR43O4muay4i/FSxkRFqFzr/lEVO3rINphYn2a5NWyVEYa20q67DpQeLRgV3KoHIexD6
         2hpw==
X-Forwarded-Encrypted: i=1; AKwUvBxegOXyYcVtXJ+By9u8mQco8twu17J1YhllUxv0KPiYwhNWK9G7A2AgJ/Y1PpXmmMyr3H+yAaz3W/4cYok=@vger.kernel.org
X-Gm-Message-State: AFuF++kk/tdu1rKNbVr98zmDT1M+ptIQe3KnOWE0dzOJGqtPLh0tUhTM
	JAfaaPLCrDMSJXBevFHCC9W3i0UhizL5KpeWevaM+N1YqQL6R4eqCDIuwyB4jBuRAjVIC7KHn40
	7U7F/4EOboTgtMlEiPUNltsarR2apuYIEf9IABc+5
X-Gm-Gg: AYBFou1jN9A6Q1oK86+QFdlF0Bc1ohfCz8v29lyP8is9lptCEidpMHmRpbYg5scFW8D
	XJs+csfnGBh5/gPE1ld2/vI+BGE+bUmbgND5E/h/xB/E5OUIkuGyu6uNaG9ptWya6emyXesbpXP
	qVsxpwk/cYuDJgvqVGInUhVUyP3kB/7OJTypnK/5bfpz4UXw3mhgLu67OWzxZWWI3U0klRHicAC
	Pu/p6BCgbM6qNYmqkFq6ogwQpAcWtGwL44/yt3N+jMBMPwvmxuJReNwFktYdwx0lXaLlfVs7Lw8
	DAHoq4XMfjCgdpTC6hd4SMl7NO4oz2oiGm1AFeshXBUs+l1PowIGCQWL
X-Received: by 2002:a05:690c:dd3:b0:884:b55c:a8e with SMTP id
 00721157ae682-8973296df66mr33908207b3.5.1790024439462; Mon, 21 Sep 2026
 14:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-fix-headphone-plug-cirrus-dell-v3-1-6dc555b00f61@chromium.org>
 <87fqzan7jp.wl-tiwai@suse.de> <875x05lkfl.wl-tiwai@suse.de>
In-Reply-To: <875x05lkfl.wl-tiwai@suse.de>
From: Steven Kendall <skend@chromium.org>
Date: Mon, 21 Sep 2026 17:00:28 -0400
X-Gm-Features: AcwNN1Vb4N3kkjvSCO-RgAi9ZdBd-0DzOAUMcQlhGqGdJPcF7naJQsHmd3vunJE
Message-ID: <CAB1bpFDsVLApsW6nYOyLQYx83o9NpDrpKwoK_4KdoCV=GeWv=g@mail.gmail.com>
Subject: Re: [PATCH v3] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > The code change looks acceptable, but the patch description gives too
> > little information.
> >
> > And, should we apply it unconditionally all models with this code?

I've submitted a v4 that only applies the delay to this specific model
I've observed the issue on.

> ... also please check sashiko's review
>   https://sashiko.dev/#/patchset/20260915-fix-headphone-plug-cirrus-dell-v3-1-6dc555b00f61%40chromium.org
>
> They aren't always correct but often give good hints.

I looked over the AI feedback and I'm not sure what the best action to
take is. It seemed like it was kind of a broad criticism of delayed
work in general, which already exists in the same file. Now that the
patch only applies to one machine and I've tested on that one machine
I'm more confident in the fix but I'm open to doing additional
testing. Or if there's some tooling I should be using to make the
abstract "timing issues" more observable I would love to learn more
about that too.
