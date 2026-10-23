Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764641;
	b=f4vdLOkLgOTByE4DFbNCS745IEzA5G9Fi8ZttbtOkDLfLNHgMM9NJQeU9vStUcIZuXvW
	 EUe2ttenkrNBhVlNikseUrMt9WoVgAF5w0aZEsmQRr8E5WNQK9jRp1qEwE03nS/Xj6MsK
	 1KEtnfxlDD2yXrixsxL22v05MlSRxlBUdM40he6Ax71DUM3uYjFoFKQSF7KgLve6sWlUN
	 2t6YdQ5liJkon4y/JnXYqgklbylSx/w6Z64o5siJ/kPWwdU5dVgxcI8YY5xVrdOBsCV4l
	 axMASQ2HMTv24tOCdHaL1d1opBNOrvYKLth+QIt1Qfxt5CiAzJOaGGhN2rElIuEeN6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=rUCby3YZiB/c/K75Lnrq0ACWkSYD91hEUwrMnP6159o=;
	b=SnlPT17ArYhIuJswIeCbd5b3TtMg1PjTsUm+u5Tm1oPbCNsodvVQNDJwI5hCem6oDZz5
	 HRFxNzFrv7FDVc3cufjEaB8MCVVeXEDyvY1b73bWibIe1S2j3tdZ2olv4WGLxgJxlmQbF
	 cq1sTYJ1jn9Fog3i3NW34mQXCJVCjqShEhYDxVugeR2Aom2ReYE4Tks0UrQ/go+Qnz4Nv
	 9JF8eDETy12s4BCs8U1c4JOuW9yzLkKknd8T68w9pVMWelg4MQ37VabevLk65M1djY3aT
	 pvGY+CN0YkGsf1Fcx8ERuN5g1IlDYeQ6LNRgvAh+GsZmXJb/Ogq/k73exm5MHlnjaLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e0AuBiX7;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7154606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7154606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e0AuBiX7
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-487049569b6so545890f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792764638; x=1793369438; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUCby3YZiB/c/K75Lnrq0ACWkSYD91hEUwrMnP6159o=;
        b=e0AuBiX76jwh08ObeSUHZUpPYy6aIjjZ6Y2mF6Zn/eMo44Op9NrIxpqY52XlzcmxA2
         3CwWlqr/ErkX+u/dXoUk3B0vVQZjmCwVzBTBGWFGRgg8leEd4RBxralj0pEVQnP9wJLo
         UiUZXPRcHoV0lQm2sB82U1yj9vxyqVxnWX9gkwdmdNeS+njezFv/4phKY/yL3avoqKtH
         df1K5646c3wH7IB/BTut4Sa5rimc6qW1jsuBChWsAnmda3EU83nEl1QeZRpEP5n+C6H0
         ot+AqDNxe+DlyyuTyK/33AQpgdltdjycVk3/40wOp4qj3NYforVJhgnJnxX321IXWZon
         t1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764638; x=1793369438;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUCby3YZiB/c/K75Lnrq0ACWkSYD91hEUwrMnP6159o=;
        b=YoIhVlTSzz4nVsZCPSa9BumEPZ+wdOn98HtC5ZbS426D1ZFeBssJLLzExwN4XsSiMI
         4pCWT2la29XdAFgVB7d2SUdFdojz3fOe/3svC7cHcSuFsZSSP9/6oefb6YePPXneM8cL
         6Yenujbq5NcTWDp32FCIVb03T4RRWPmVJlaV1embF88CrNJAK82TE3WgRppZTNBwbISV
         km4dar9SUWz7QEHueldnsAdKBMp0DHurdU52ZIa9LhwqhBfPWbecTzL1l0F3+a1ZRT4r
         raA0igNNzq64rLzuHTRnriA6M4hvoeSS4Qj25IxOjx58KTk+hJ0D/0ICfmx3WtskwuGl
         y9Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzKHUugVDfdHczlxizOO3J+0vXZnq4QFSwLNW7CKGWzBV8WCE5xkiidcYI36VUpxRQfDr9u8SMA5hMzawo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUVwZ60kQ7Bnd2zBStmg0+aon1cz5DYeP6i9SEXUvCGYIhjMVL
	+w9KeS6xzGIOq2G/w6Vw/9l2l54OCVx/7suZB1gFCpNiYvDc4S7e3H+PfLIOS7FRlY0=
X-Gm-Gg: AYBFou2n/EyTQ+d2db4hNx1oR9f7LTxnsqMIxUc8ywLYu24fyCd3C9EyVxc7LUv7+XW
	LhridlaaFmcnU0UNoS9izE8FM62fdH/BWCPDp844YCPxRodgEQr3sXYZP6b0RslKWgTChSThaE/
	dqu7EeBhVtHlf5Ue6B/JAgId4ZtAlFPv+f4LkisXl88FPDW4Us4GcKt1KFJ6acnUmp7QgW6MHmo
	pgZTEwxJZYKnB38+EmwR7l9mjvs1tD4kiar1HzTwu7auev6ISARGhST0VWyXStEluLWixP0tOls
	TP4gBQyI0ykYM0bFoottlGO/3xYsYHeHCAsKVBWEN1JTlyRPc676rpKoPMhnpPJfzn7sLAXavPV
	h6fu072lJFumsROJ0/0DxaNJn5ZdAAI6/OiYVPxQvKAAXTzILUyDOcIM7ykF2CFiEaBgP6eA6ot
	OxJAZSr2y4VOQeRk5t5Zi9Lums9W51Hh3OBpSvXZLIsYIZTKCjSCN6LqmpPExkTMtkue4G79+CB
	yg9VBNBZvkL83TeDRzmapOwb+ilLioDwNrFqiQ2RGXIn6zoAmUdgK1Rq7+iAbr8k/AHbtU34AZV
	9QFAVXySEQvi+spLJSxD
X-Received: by 2002:a05:6000:986:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-48e3859df5dmr4185485f8f.17.1792764638081;
        Fri, 23 Oct 2026 07:10:38 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6a5sm73564f8f.12.2026.10.23.07.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:10:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ian Ray <ian.ray@gehealthcare.com>, =?utf-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: Use v2 rate calculation on i.MX8MP
In-Reply-To: <atjIIHkoNwBVDO5b@redhat.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
 <atjIIHkoNwBVDO5b@redhat.com>
Date: Fri, 23 Oct 2026 16:10:34 +0200
Message-ID: <1jtsmch5id.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On mer. 21 oct. 2026 at 10:11, Brian Masney <bmasney@redhat.com> wrote:

> Hi Miquel (and Jerome),
>
> On Wed, Oct 21, 2026 at 03:09:56PM +0200, Miquel Raynal wrote:
>> Hello,
>> 
>> Thanks to Brian's series, we can finally solve the problem of rate
>> calculation faced with the i.MX8MP LDB/PIX clocks. I've tested this
>> series using a v7.1 mainline kernel with a lot of unrelated DRM
>> patches. I then re-applied it on top of clk-next after fixing the few
>> conflicts when applying Brian's series, but that means I cannot (yet)
>> run a 7.2/7.3 kernel on the platform (and applying this series with b4
>> will fail due to Brian's series no longer applying on top of clk-next).
>> 
>> The DTS patch is there for reference, I don't mind if it's not picked
>> up.
>> 
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Thanks for testing and posting this!
>
> I know that Jerome would like to see some changes to my rate change
> series before it can be merged. I'm going to probably poorly describe
> his concerns here, so apologies in advance if I miscommunicate this
> Jerome. I'd appreciate it if you could clarify.
>
> - Currently the latest version posted (v8) to the list has the LCM
>   helper (clk_hw_get_children_lcm) in drivers/clk/clk.c, and the LCM
>   helper should be in clk-divider.c. I agree that it should be in the
>   divider code, but we'd have to export some additional APIs to allow
>   that. In the future if we went with what's in v8, and wanted to fix
>   the fractional dividers, then it would need a similar type of helper
>   in clk.c, which is not ideal. I initially went with this approach to
>   limit the APIs that are exported from the clk core.
>
> - I have a draft v9 series that I haven't posted yet that adds two new
>   helpers: clk_hw_get_num_children() and clk_hw_get_child_by_index()
>   similar to the existing functions for the parents. This allows moving
>   the LCM logic into clk-divider.c where it belongs, however the
>   downside to this approach is that it expands the clk exported APIs so
>   that providers will be able to fully walk the clk tree. The concern is
>   that providers may abuse this in the future and it may limit future
>   changes / cleanups to the clk core. For example, if we wanted to clean
>   up the way locking is done, this may potentially limit the available
>   options.
>   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-divider-scaling-v9
>
> - He would like to see it where each clk consumer sets the min/max rate
>   that's acceptable, and the clk scaling in the provider takes those
>   ranges into account when rates are negotiated.
>
> Anyways, please chime in Jerome if I got this right / wrong, and any
> additional concerns.
>

Hi Brian, Miquel,

Thanks Brian for the summary, and Miquel for testing and posting this.
The i.MX8MP LDB/pixel case is a real problem and I'd like us to solve
it. My concerns are about how, more than whether.

You got most of it. The main nuance is I want to convey is where it
should live IMO: not in a divider helper, and not in providers at all,
but in the core. I'll try to explain.

So far, CCF has preserved the settings of each element, or more
honestly, left them alone: if a divider divides by 4, it keeps doing so
whatever happens to its parent. This behavior has been there for years
and many devices rely on it, even if unknowingly. Miquel, I understand
you would rather make the new behavior the default, but I think this one
is here to stay. That said, it would be nice to have a way to say that
the rate should be preserved rather than the setting. I'll come back
to that.

My first concern is about the responsibilities of each component. IMO a
provider should only describe the transfer function it implements:
"given this parent rate, here is what I can do". It should not walk
the tree or care about what its children are doing. Coordinating the
providers is the core's job, without assumptions about their transfer
functions.

Providers already query their parents: a mux asks each candidate
parent what it can provide, and a clock with CLK_SET_RATE_PARENT
forwards its request upward. That is the request path, and the core
stays in charge of it. Reading the state of children or siblings, and
deciding on their behalf, is a different thing. Once a provider is
allowed to do that, there is no good reason to deny it to the others,
and I think that would make the core much harder to maintain. It could
also get in the way of other pressing work, like the global lock problem,
where tree walking will certainly play a critical role. Miquel's
patch 2 is a good illustration: the helper ends up comparing the
clk_hw of the tree with the inner clk_hw of a composite, which is not
part of the tree.

My second concern is that it is tied to the integer divider, since it
relies on the LCM. If another element with a different transfer
function sits on the path, it does not work, as we discussed. We could
extend the principle to other types, but:
* I don't see how the different types would reconcile, since each one
  does its own thing in its own .determine_rate();
* the change is no longer simple and harmless if it has to spread to
  every provider to work.

The behavior is also hard for consumers to predict. For example, the
parent rate is only negotiated with the subtree of the divider's
direct parent. With a gate between the divider and the PLL, the other
branches of the PLL are left out. That could be fixed with more tree
walking in the provider, which brings us back to my first point.

If such a mechanism is needed, I would much prefer it done entirely in
the core, in a generic way, with no assumption about the transfer
functions involved. I realize this may go against a direction
suggested at a previous LPC, which this series followed, and I think the
points above are worth reconsidering it for.

I say "if" because I doubt clock trees are designed with runtime rate
negotiation in mind. So far, we have mostly dealt with these cases by
removing CLK_SET_RATE_PARENT and using assigned-clock-rates on the
shared ancestor. I understand that falls short when the PLL has to
follow the display mode, as here.

For rate negotiation, my suggestion would be to reuse what the
framework already has: clock ranges, and re-running .determine_rate()
on the children being dragged along, with the common ancestor's rate
pinned. When that rate does not suit a sibling's range, other ancestor
rates can be tried within the constraints, rather than giving up.

clk_set_rate() is a best effort function. It tries to get as close to
the request as possible, honoring the ranges of every clock along the
path, and it is up to the consumer to decide whether the result is
good enough. That decision is lost if the framework recomputes the
rates of a sibling branch on its own. Ranges could help it decide:
either "I'm fine with the new rate", or -EBUSY.

What I'm suggesting is to treat any clock with a range as one that
needs updating. Its consumer cared enough to tell us what it can and
cannot cope with. That removes the need for a specific flag, and puts
the rate policy in the consumer, which is where I'd prefer use case
choices to live, rather than in the provider or the core. It would
also fix clocks being dragged out of their range during an update.
Presumably, a clock without a range does not care enough to give us a
decider, so the framework has no basis to act on its behalf and keeps
today's behavior. I think this behavior will keep on being good enough
for the vast majority clocks out there and it is a lot lighter
on the math side (which is already quite severe as it is)

I've been checking whether the idea is remotely feasible. It involves
multiple planning stages and multiple tops. It is still very rough,
but there is the beginning of something:

https://github.com/jbrun3t/linux/commits/clk/clk-rate-range-update/

Miquel, if you fancy trying it, please let me know whether it works
for you. All you should need is to set a range on the clocks you care
about.

Sorry for this rather long explanation.

Brian, your series is what got this discussion going, I know a lot of
efforts have gone into it already. I'd be glad to work on this together.

> Brian
>

-- 
Jerome
