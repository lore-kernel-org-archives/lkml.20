Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D173314B8F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143488; cv=none; b=gO4cAfC4KolxtGT4RpB1k+Tb3lNlt8EI2FY/eZ05nwUYb2Df/iCVWtNTV8gr5S1AhBwo3uCh8x2cKjLfu7k1BvaTYM3drOXapGfXy/9zpAB0ur/oRUFaj2D7qDwAF6VD//Q8upfhQ6jBJLKFRrO0uJ5i4ZZpdtZHJIZhz2wRNd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143488; c=relaxed/simple;
	bh=cswCRtVyZWJEggEjLZZWLcOyaa6GwqNvcROF8C7I/qw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H9qOlIgx2bckvAu1NV321YMAsCJKnBK9281WL5oaUWGaCkLvZ6rRlaUeL5l6Z1qL/1iQzBx0tbaX4qdcOHFg5eFIr3ZB4Iy+04l0t0wrjo3dyBwQTeYdXflw/mdTqWQhS/h6Cc3sYjgDJ8wWNLyQ3j7EAP3PN9FxSju6kPJ20l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EeYbBj7a; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kv13FKcW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EeYbBj7a";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kv13FKcW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792143485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=odpzRyL/+qkTBXSWqxc0VNkikl0xH5c4tts12k5e6cU=;
	b=EeYbBj7aSJmn7yXPDO9l0hIeKBOGk/mnZIwuxDnxfozdYkEPBMd0iIQ9+PHAOPe89zrWK2
	z2IkC/l/BcnO9wQvKlil745Bpswpo09KZ17IzPWQ2oslUYKqzeR+DAFjyY8Xv9c6xG/4lx
	Thf533A7/MmWRv0vx1qnIiPbUpjvIiw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-54GfOkxRPU2dsDJitiqbqQ-1; Fri, 16 Oct 2026 09:38:03 +0000
X-MC-Unique: 54GfOkxRPU2dsDJitiqbqQ-1
X-Mimecast-MFC-AGG-ID: 54GfOkxRPU2dsDJitiqbqQ_1792143482
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a01c621dc2so47755225e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792143482; x=1792748282; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=odpzRyL/+qkTBXSWqxc0VNkikl0xH5c4tts12k5e6cU=;
        b=kv13FKcW2Smd8AfZyx5XpoSZLnGLLE59DNTlKMhJG8nMtN3E2UX+06sd5UJa2jW4pz
         5tHCAop6ho0IAiqgQM9dB53OxpOgXUlm0Fdm8NWbaEzEpmuqTYlAfD4aYqqnXdH5cjo+
         CybmrTYnCrJiVdSUA0Z50W+XGyxyBb7KAclsYliJMTBt5/tx9S7VDJ4PQfy2Fep3lWhH
         Vb7R7gW3X1JYeBzp/B8KMI2Q2KtqFuOlBDAUXMqE+9Ee2UoO/wa6qVctJAWqiyUge/t/
         cj1AKJDUIswf3s/QKmhXSbxuURBBZsVn7queA5GiTW5Y3DtQ8rHlWcmqU1ewxJpoURDR
         wDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143482; x=1792748282;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=odpzRyL/+qkTBXSWqxc0VNkikl0xH5c4tts12k5e6cU=;
        b=aoufM+TM9mIIye+OB1Bj3ejNqglfxWeKDO6S0oXvIX7nuPxAGPRkZRGyRrsYdCSVS/
         /MQi9WCJeonMoumQ8xqcIsWOq3P9lpXTxsGJWVuE8HZpeM1zibceQNrM+ogIZu33jXA6
         zt18qLhdqYt575OTDOYHebZUi/dFyntuj9GtJZ2HtVLMzhTvBazoK9P8EpsJbzbfjs4c
         tjz4ASUeWx3hN6xLxotS73wewq66glqZI/mUkbQBzG3XP7VKfCs2+/IRSBDxo6NbNDJ8
         QKg6IINQr2IZK2Wt9J4B7P6udvHgaFfZR96Ie2fZYWPS+ZVLGUe5l4p8My+BoT2n8LHT
         0//Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmWBeDBuxpFTgo2Dom0QgRtsw8ln0oJCGeT/KeA9sLr64rz1CMMTj+WmgvZ3kga18nh63ZNjmpRdWlrrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK33yFKl92A4kWnAtS/7y5aBOSI8dy+5VeB1ND0NtFzpMdvnQX5
	O/7i/5qmPdrII5cS1JuQDboxw6stpHu0Nd92fSNvLQXddkBALDVN/9zBVDd4DhDgRRei+6q5Qwb
	sclMLSEVyKF5ak0MU/HcK/t5JIkvi+EfWK4QhYVhw+LCNP7ogyHH+uVJAkHE/fa0xMxO/TaVQIg
	==
X-Gm-Gg: AYBFou3SHlj6peBegF/h6/WkODFLzp6P8doOfVFTA3LjmMnV1/7C65NFx5z2SyuBFuo
	pAX1SjrYxg7cSV2EJkmChqofKZzIHfhyAJIdVeHqr/eMx06mOmKkUSWomOD8McLSmUJRLJu6Z0r
	oLc/S/lE0btL9YHORzW8/zWBCML4exa9HFHx1MB+9LpZajHuxpSn1pJ4CIWz97O/POoexdWIUYo
	2yRxfN617O0gI4BzmiM1Dx1CPfSGOuyaEsVdxpG1iKsSHKLzGlgjYMq3/lccxaTwJGdbpgA4kZT
	BzVhSe0jfXMaWu/5ZHzXqZy4vqpMuM1GtDMiMAY1fYwg8xIrt0UVKyVGbeesrRIQ753I6E/jFWc
	rg7lj70mNVOOrhjoTltttq6QyF22h
X-Received: by 2002:a05:600d:1b:b0:4a1:9661:14b7 with SMTP id 5b1f17b1804b1-4a196611b9amr321481035e9.32.1792143482395;
        Fri, 16 Oct 2026 02:38:02 -0700 (PDT)
X-Received: by 2002:a05:600d:1b:b0:4a1:9661:14b7 with SMTP id 5b1f17b1804b1-4a196611b9amr321480385e9.32.1792143481221;
        Fri, 16 Oct 2026 02:38:01 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca31234sm25645125e9.4.2026.10.16.02.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:38:00 -0700 (PDT)
Message-ID: <f759977bab11b886198ec5f9678404ff3fc80724.camel@redhat.com>
Subject: Re: [PATCH v2] verification/rvgen: reject ambiguous state/event
 transitions
From: Gabriele Monaco <gmonaco@redhat.com>
To: heath@mathgraph.org
Cc: rostedt@goodmis.org, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 16 Oct 2026 11:37:59 +0200
In-Reply-To: <f8a773ce204c7dfe5b15bdefe21131b1@mathgraph.org>
References: <11d37dced04f512153c023b8b7361309@mathgraph.org>
	 <9fc2d6a03fabc2c756bfa696bc907ef23dcc175a.camel@redhat.com>
	 <f8a773ce204c7dfe5b15bdefe21131b1@mathgraph.org>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-10-16 at 04:28 -0400, heath@mathgraph.org wrote:
> Thanks, Gabriele! Really appreciate you taking the patch and the=20
> clarification on LLM disclosures.
>=20
> One small question- this work is part of MathGraph, developed at=20
> Metalogic Labs. Is there a conventional way to acknowledge that=20
> affiliation in the commit? No worries at all if not =E2=80=94 I wouldn=E2=
=80=99t want to=20
> complicate or delay the patch.

Hi Heath,

you may find more information in [1], as far as I know, the affiliation is =
clear
from your email in the signoff.
Often people using personal emails or kernel.org accounts specify their
affiliation in parenthesis.

In short, you either do the following in the signoff:

1. John Doe <jdoe@acme.com>

or

2. John Doe (ACME) <john@doe.org>

your case falls in 1. (@mathgraph.org) I don't think you need extra steps.


Gabriele


[1] - https://www.kernel.org/doc/html/latest/process/submitting-patches.htm=
l

>=20
> Thanks again!
>=20
> Heath Sanchez
> Metalogic Labs | MathGraph
> https://mathgraph.org
>=20
> On 2026-10-16 03:55, Gabriele Monaco wrote:
> > On Tue, 2026-10-13 at 15:51 -0400, heath@mathgraph.org=C2=A0wrote:
> > > The rvgen generator builds a transition table indexed by source state
> > > and event. A DOT specification with different destinations for the=
=20
> > > same
> > > key is currently accepted, and the selected destination depends on th=
e
> > > iteration order of parsed transitions.
> > >=20
> > > Reject duplicate state/event keys after sorting the transitions,=20
> > > before
> > > generating the monitor. This prevents silently selecting an arbitrary
> > > destination without changing valid automata.
> > >=20
> > > OpenAI GPT-6 assisted in finding the issue, developing the fix and
> > > tests,
> > > and drafting the changelog. I reviewed the changes and take
> > > responsibility
> > > for this contribution.
> > >=20
> > > Fixes: cad252db78a9 ("verification/rvgen: Switch __create_matrix() to
> > > Lark")
> > > Assisted-by: LLM
> > > Signed-off-by: Heath Sanchez <heath@mathgraph.org>
> >=20
> > Thanks for the quick V2. I'm going to take this.
> >=20
> > As a side note, I just read ([1], subscription required) that the=20
> > Maintainers
> > decided at the 2026 Summit that models used and other LLM details are=
=20
> > no longer
> > to be included in the changelog.
> >=20
> > You don't need to send a V3, I'm trimming that paragraph. Anyway this=
=20
> > kind of
> > transparency is largely appreciated, so feel free to include it after=
=20
> > the --- on
> > your next contributions.
> >=20
> > Thanks,
> > Gabriele
> >=20
> > [1] - https://lwn.net/Articles/1099594
> >=20
> > > ---
> > > Changes in v2:
> > > - Drop the redundant hybrid-automaton regression fixture and test.
> > > - Match the full traceback prefix in the negative assertion.
> > > - Move detailed qualification results outside the permanent changelog=
.
> > >=20
> > > Verification: original rvgen suite 30/30; revised suite 31/31;
> > > 64 deterministic/hybrid hash-seed replays rejected malformed models.
> > > https://github.com/metalogiclabs/mathgraph/actions/runs/38452477359
> > >=20
> > > diff --git a/tools/verification/rvgen/rvgen/automata.py
> > > b/tools/verification/rvgen/rvgen/automata.py
> > > index fd37ce3..1f9a56a 100644
> > > --- a/tools/verification/rvgen/rvgen/automata.py
> > > +++ b/tools/verification/rvgen/rvgen/automata.py
> > > @@ -418,6 +418,13 @@ class Automata:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 transitions.append(Transition(src, dst, e=
vent,=20
> > > reset,
> > > rule))
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 transitions.so=
rt(key=3Dlambda t : (t.src, t.event))
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 previous_key =3D None
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for transition in transit=
ions:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 k=
ey =3D (transition.src, transition.event)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f key =3D=3D previous_key:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 raise AutomataError(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f"Duplicate transition for=
 event=20
> > > {transition.event}
> > > in state {transition.src}")
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
revious_key =3D key
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return transit=
ions
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def __parse_states(self):
> > > diff --git a/tools/verification/rvgen/tests/rvgen_monitor.t
> > > b/tools/verification/rvgen/tests/rvgen_monitor.t
> > > index 5f25626..8d635fc 100644
> > > --- a/tools/verification/rvgen/tests/rvgen_monitor.t
> > > +++ b/tools/verification/rvgen/tests/rvgen_monitor.t
> > > @@ -84,4 +84,9 @@ check "invalid ltl file syntax" \
> > > =C2=A0=C2=A0	"$RVGEN monitor -c ltl -s tests/specs/test_invalid.ltl -=
t
> > > per_task"=20
> > > 1
> > > \
> > > =C2=A0=C2=A0	"No terminal matches 'i'" "Traceback (most recent call l=
ast)"
> > >=20
> > > +# Reject ambiguous source state/event pairs.
> > > +check "reject conflicting deterministic automaton transitions" \
> > > +	"$RVGEN monitor -c da -s tests/specs/test_nondeterministic_da.dot
> > > -t
> > > per_cpu" 1 \
> > > +	"Duplicate transition for event event_2 in state state_a"
> > > "Traceback
> > > (most recent call last)"
> > > +
> > > =C2=A0 test_end
> > > diff --git
> > > a/tools/verification/rvgen/tests/specs/test_nondeterministic_da.dot
> > > b/tools/verification/rvgen/tests/specs/test_nondeterministic_da.dot
> > > new file mode 100644
> > > index 0000000..1b63b5d
> > > --- /dev/null
> > > +++=20
> > > b/tools/verification/rvgen/tests/specs/test_nondeterministic_da.dot
> > > @@ -0,0 +1,16 @@
> > > +digraph state_automaton {
> > > +	{node [shape =3D circle] "state_b"};
> > > +	{node [shape =3D plaintext, style=3Dinvis, label=3D""]
> > > "__init_state_a"};
> > > +	{node [shape =3D doublecircle] "state_a"};
> > > +	{node [shape =3D circle] "state_a"};
> > > +	"__init_state_a" -> "state_a";
> > > +	"state_a" [label =3D "state_a"];
> > > +	"state_a" -> "state_a" [ label =3D "event_2" ];
> > > +	"state_a" -> "state_b" [ label =3D "event_2" ];
> > > +	"state_b" [label =3D "state_b"];
> > > +	"state_b" -> "state_a" [ label =3D "event_2" ];
> > > +	{ rank =3D min ;
> > > +		"__init_state_a";
> > > +		"state_a";
> > > +	}
> > > +}

