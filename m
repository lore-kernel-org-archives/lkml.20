Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2B03E9C3C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792346669; cv=pass; b=VeBJyrCMC6AfqiDi4TT+smVqEML9hHQk3AVsmtEh85GCxzifCKvJJJG1/JUmFRCb0AQWDO0xBEiITMIMskbn6XqS0wOYItbfKKyi/OTaWI0HWezpJPWp/gZ4kFLmEbVavJ8lYa9GYPq+9qv1cZV0I+gl3XO8aSF2IBaSTKKF5Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792346669; c=relaxed/simple;
	bh=uSc5BfTvWQLr3mEx1fqMIkGXe5VzMAa7W88GOKZJAag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pSDxWo2K8aUZobUkQTBYTfTMUM+E8XMFYd7CLpJgQsA9sgcpkM4ojHT7o5Nbeb7X/z0D+M6XtQt8ZHMp4Cz7bFar3IM2ZHW732B9IjvjyHbPDji3ZiZBG+iIZ95Kmgf0bv2jhivQXVC44MBZXtSnakr7fkrt7D6fwUCb4tlaClo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BifnEZ5N; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BifnEZ5N"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-451a49abd8aso2079851fac.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792346667; cv=none;
        d=google.com; s=arc-20260327;
        b=cJvOIgZ99K+fRu2M93gvcanWD7YqoVzI3fnmC/i1bOX1vz9ckmltx8Egf6HCrYx+LY
         FKZmmejB3lAzsHm75Pwu7SI1EiaX/DM9JcWTSlyV845pZQx3Dfhw9tBWbMC1bueLAcyV
         SsJERZ9kRz9YUHTsVu8G1IlpPwwG0feBlEAHxXuu09F3Ms1k6tcQUTQaAXCA9MDJ7sqW
         xjJ1/Te4cPJT100n4noGfYzpeaAbQF4nBXdLXGfRzkwLxzVzr9+5GJUJSGBIvlJWMjSm
         2dpEOjXbER0DhuXc7o6iBq9xjMrGa6S4puwUGhL1Oh88oO3bIBnzgNgHOvWrRB9GeA1r
         A1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1mdbBwBWo2/ZQakn2PE2+HqsoPZdP41mPHeDVrW/vk0=;
        fh=acrDO0DPbcbHGntLPncFFrxOsGWAPpNVWF/D+lvk6CA=;
        b=RSwb//prDumxHWymJv6c7kjjz3l0A7/0ixUV35SE9PAiZJy9DB03gRmVurZGAwZmQK
         PT1o3BJPt26eV78AynnbI7IwXyEpHEgMXG0zWCsGQTjAhu9ijE4zdfcdUYG0M/3ARqn7
         kwgGNd5qQaQcDWr6Z9zhKAtPzXpVazvn4kuol8G3zgmtzqVRh01smSWaUATk5u8NI4Ui
         9VIYOhLj3qczqdFD5KHmyl3i3GuAYivy1IZcVpAOaILA/EpergvosAb2WEw1L3Amoz7M
         4XY8kp7cMopDa+3eN7RTWmvYJjIrobslMUPmAMwSAys/VuWsYIzUpCWlDmJibfGLdtEY
         BPXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792346667; x=1792951467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1mdbBwBWo2/ZQakn2PE2+HqsoPZdP41mPHeDVrW/vk0=;
        b=BifnEZ5NoxCkRDLr4KLc2SEQf/iNG0++zy1cM8BqHbrFxeZzGASb445bDYzdkzSjAM
         oENsLzhOHsjOyP6nV7Sbw8YV0GUcIROG/0gkdiRM1BlUCqhimk7+l0y7xScpH3PqksoE
         Fl7LNpfXfkNQlEezeEoHDi4q4E885a0kGpiwKuTg51/fMSO2A/YIAJZaUqYgXxvOB3SM
         7KQLbTJZqcK5ieBA6No6xsxT5TvPm89DzTuUXDIfLKVNV/kWo1iDgccyEsPmSTRoE2mG
         gQA3v2W+wm9LM4HqWR2ydMiu7sFFjxWqrarXLzwDPWEV/iIXIT2kyjz/URei1R5oOnl8
         E5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792346667; x=1792951467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mdbBwBWo2/ZQakn2PE2+HqsoPZdP41mPHeDVrW/vk0=;
        b=Mw2qsspn454qBlyMwEi4PXxkD8WqST8Koe42Jiv7yTrIGpylAz99PRtHvOpRxyE4mb
         HgbQGILeY5OwO7KNhfm8qVc/sbNa8JR30GGFXWkXvym0FYb60lWMTOC4eNhy6h8F6jGo
         +izP8jUb6OZpbvSqFuR7xn6FtkeADgZNEz/bP5JYOmmYPAlJ43gKlh1eUa+MNwg2vMJS
         eHqtGQpwGe7IsVJY0PufjBrcymMLIgRH3K66JGPTZCvgkeJPnmxuFxWmqbPlCoy8dzj6
         rrvqVGePCtjwvFzHMIs04NcdOK2Xx7kVZi3rALP8wQaEP86zXZ6c2gCF8Qq9KB6Y0DVI
         eufQ==
X-Forwarded-Encrypted: i=1; AKwUvByITJPCFdi9Zrc66DU42LsMBdtu+tOX8rlUF6oUk/D0vKVWREQuDjWanJ2J+z3Q4zV6uxxgz8z6KsTx/10=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn7lAoTa3/ID1L8Ssf7oQ2/MJMMtYaJaetL/SSqDXhb8+X/BZm
	q+XnJh2CigjX7fTPXn7/PUHvav0j+v5/rw3UMv1/CqZl4U1wKRZ1XiGM8DlRA5vuSeIH1GLMR7u
	KDyph/a54QimTvGq137iy4xCwEb0xGFs=
X-Gm-Gg: AYBFou3NEa+fYy7w75/DWCNDzyRO+RRdnNW1tqF0frCdMc3BMkcANovFey3u1OIuZXC
	A/U3+QoStmhVIWzc4NB5q+6L4biqKWItMsgAoG6uMVsV+D3Fb4aB5KvuK4ZmiCTHWdMhoekRbdE
	L3OSJ4lOQE2pugBb9Wi845UUm95KYTvVtvYY7nWMu/YXlIvOaJn11gS5g9df5LRdhMuQx6o1SzN
	rPpNJ+hSlXJ4Z3yydEQMfUCH46asfKvwPGdQCq2F1CsNRIuoBnxylTx5av2kIUGqsvW2wSqgano
	l/X/YWRFUATyavlsLaVlj/smHWi543kvtalRQaO3elzuNUQC7ZYA0Vo=
X-Received: by 2002:a05:6808:c16a:b0:4e8:f158:504 with SMTP id
 5614622812f47-53ccfcb3732mr4440447b6e.44.1792346666667; Sun, 18 Oct 2026
 11:04:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
 <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
 <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
 <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
 <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
 <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
 <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com> <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
In-Reply-To: <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Oct 2026 13:04:14 -0500
X-Gm-Features: AclHuK9jkljhKuhIJglKVeLMSVOb6YPON2UjWK6R6JPfulmpbIc-vcVZcLxOoks
Message-ID: <CABb+yY2FHBxNMnvVkJ=tmeRF--Y4t_L5A=FvXks8SCzwwARvyw@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 4:41=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:

> > It is not the diff stat but about inserting a flag in the api to
> > introduce special case behavior. It is like adding one person to the
> > party introduces N-1 handshakes - the has_queue flag doesn't play well
> > with other configurations and may allow future platforms to abuse
> > has_queue to implement hacks.
>
> Can you elaborate more on this?
>
> 1. How does "has_queue" not play well with other configurations?
> Everything should behave the same if "has_queue" isn't set, right? Are
> you saying that it will make the code too hard to understand, or
> something?
>
has_queue doesn't fit with all tx-done-by poll/ack/irq in
blocking/non-blocking modes. And we can't say that flag is for only
one specific setup.  I can imagine people (poor LLMs) concocting weird
designs because that's what fits their first implementation attempt...
just because that flag is available.  And then people vehemently
defend their first implementation.


> 2. How does this allow future programs to abuse "has_queue"? Won't
> they need to submit mailbox controllers to the mailbox subsystem,
> meaning they'll have to go through you? If someone is using
> "has_queue" to do a hack, can't you just NAK them?
>
It is difficult to fight platform specific changes because people
can/do say "their special platform doesn't work that way". It is much
better to reduce the abuse surface area.

> ...but I guess the root of the problem is that it just seems
> unexpected to me that fw_xlate() is taking the same input "fw_node"
> and then is returning different mailboxes.

Why is that unexpected? xlate() doesn't have to consume any hint if
all channels are identical. Another obvious example is a controller
with just one channel.
I think you should go ahead with the v2.

Regards,
Jassi
