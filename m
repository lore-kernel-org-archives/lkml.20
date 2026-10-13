Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4664F6463
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894539; cv=none; b=bjn1juP44EQLzk3p+7tRkEtysoJH9gDS8yfIUPTdCaYfhPE1Hl+TAkbutsxiKCmPStMS6+i5ZsXsdk5ULaCgw7bJAWkpuDjg+nPgbz0D9SZ0pB7F93LQFNP53aZsWwLg4+L2PQUFO67RlnNYcU/EM1/kKhuYIuLBnmyIY/i1xag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894539; c=relaxed/simple;
	bh=O6qaNI0QqiUm7ycZoQgLr5eiObcGpPvHtA3dFkISsks=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fp1CBLUqiCCAjfOpGU4fCNaebdR9UQUAhfe2sdXe5IzUUNsJWWpXcQlcEl5ws5zTCpENEcAhrLnF62Gt/+RIAVVCMW4VWn42sQcF+3Fm1gZSTjhwRGeSZW3ehM6aG96XvfcmQbUglyoO6Afw9Ou19JTSgB0N8TFxcR4vOAgZYrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=flGs/ddK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g9w7o/jq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="flGs/ddK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g9w7o/jq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791894537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cw0AdI14fFbB4gyvTD22R11FTQDGMXNOHMIi+cFmxmY=;
	b=flGs/ddKoVmPZZdWB/Af6oRo13ZMfr4Qqmfxx1JJ1bo6clKf1dSdDueV9EHIAVqug69GhT
	ffqnkdWvbxUI3fdCbOYmYsBRpU8VRGRAQEPNzoG6j4COy4i0GYiUGE0jtOeRtmmif/vSPn
	DJun6khdD5E2yuI0tWOagxyBfzIJyLU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-p6kWjk2yM6KMlFpQGA72pg-1; Tue, 13 Oct 2026 12:28:55 +0000
X-MC-Unique: p6kWjk2yM6KMlFpQGA72pg-1
X-Mimecast-MFC-AGG-ID: p6kWjk2yM6KMlFpQGA72pg_1791894534
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a19df2328cso26483025e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791894534; x=1792499334; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cw0AdI14fFbB4gyvTD22R11FTQDGMXNOHMIi+cFmxmY=;
        b=g9w7o/jqE2WPRsnxTeqaaN8p4E8DVOuzJvRZA49wQMQ2/I5AdpP7VKDqKOFHzVivuB
         7GNA+lS7wuT0ApE5r9vBY/Pvp6D+IShIOix6715wqS7OEgFRCfL8sVgTqhz+/vyiJAxy
         CbrTKwyFl6OwzkVXuL1HOPboSY/XZLzq/FMtmGivvJWc447zhk8JoGYbGWxqTFqfd8Re
         bBEUHALFbEkgvdLLOSzKptWE6QzA/9poPsR9iO0nP8KE1q14b12c7LkNfq6kX/7pPfE5
         2lvLPZPRQFW2mTtDPGQq/CU9fq2bYiRzdF+zQ+JxrNGlAJ+VXnjdSw7L1QDmuZSpx4RX
         SDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894534; x=1792499334;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cw0AdI14fFbB4gyvTD22R11FTQDGMXNOHMIi+cFmxmY=;
        b=n3syD7FXzjF0SEEEjy8SS+zFKR/DU0QO375nzPgkFqaSLn7xfpn5VXiPqlTJkNeelA
         Zpv9ZimnsqjYONftF0W+yn3Ri/m4SYIKva8vhwJDt8m6719BXOl36TwxRc481EbP9p22
         9pXMmmH8WbwXgNRhLCQT8WtMVwhCUkoTC6QeWz6PKqYToYgAA4HyYMtRsl/QLEeBgASe
         4D95bI8dc0JACzR3XkBhpbk1u3gEj1W7owe0/4eJW1SZ6M8FuuBfOOKgk7PQzfBfLgw8
         oxPZygTYHisquZpTGqIjQgfE7x2zWQDKmXNZA/qq+nZWV4Z0GPp43gHk+fFkMK/PekFP
         QgNw==
X-Forwarded-Encrypted: i=1; AKwUvBwXkKcZ50npKzINFAs+yjcpHPisMxzivqJOIcqL51ASe7B/6jrg/n0PMRnqgZYmrsfqAxhzU8BiOknS7Ls=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwPZNkD0tI0b7KzTM7nc9edOkdM8xldxU+3EQSbF/6pAJtK68F
	4dQRW3DXFxYN0kEyi4n2eXEBulpZy4Wzs6sapOZK6NOCDUczpq//XkT+xxshx0CwIlz9kbAO7+G
	8uvUzLy0tL/fxKOmUVOQYCB8/tJZnU6kMR+QnCrUfGJDtCvXjKomJ/AWq/HOQ+GGpTbV3H4jtGg
	==
X-Gm-Gg: AYBFou3AU2+FCIqroz+jyEL/up5tk0yzepG/chUL+hJIipu+9H1zozZIfaiTflmzPCf
	iC0tWEuu73ErviYCiW1S7r73a/5m6827XtU4BzHoB4whLTq74+90qWZgFhWHQKJpZKCpzptUYbE
	tUiSRAE5KJLuFHZq8kYQK2wYi4aZsMCSuf8nuH9bbrcThqgUHwGeONHqVPt6nosw7fnd3k/3J3t
	JeliqkFUBbfBjsh1qTAaj9eAQ1YxH1H7ilVrAFTlX6mWzBIv4Pu/WibrUjgwlD52Ay5tpQXizKD
	MOpUzwTsoEnxHZYyBEQ8ei3I89A3deJznCVTy0SBuHzuaIh2TuBGzNHltIBnxfMeKOVOvivUMSg
	IYjq38v0pmSPdFcGACAZysWvHUker
X-Received: by 2002:a05:600c:348f:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a18e4c05e5mr250446545e9.19.1791894533966;
        Tue, 13 Oct 2026 05:28:53 -0700 (PDT)
X-Received: by 2002:a05:600c:348f:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a18e4c05e5mr250446075e9.19.1791894533515;
        Tue, 13 Oct 2026 05:28:53 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a195b300f5sm136781275e9.1.2026.10.13.05.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:28:49 -0700 (PDT)
Message-ID: <78291e0f91f64bbb43da80ccd9201a237ca2d468.camel@redhat.com>
Subject: Re: [PATCH] verification/rvgen: reject ambiguous state/event
 transitions
From: Gabriele Monaco <gmonaco@redhat.com>
To: heath@mathgraph.org, rostedt@goodmis.org
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 13 Oct 2026 14:28:44 +0200
In-Reply-To: <0201537cbcba3268512d2c3f6a0b51c9@mathgraph.org>
References: <0201537cbcba3268512d2c3f6a0b51c9@mathgraph.org>
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

Hi Heath,

thanks for your contribution! Looks good to me.
I have a couple of minor nits.

On Fri, 2026-10-09 at 16:17 -0400, heath@mathgraph.org wrote:
> The rvgen generator builds a transition function indexed by source state
> and event. If a DOT specification contains different destinations for
> one key, the generator silently chooses one. Parsed transitions are
> set-derived, so the choice can vary across Python hash seeds for an
> unchanged specification.
>=20
> Reject duplicate (state, event) keys after sorting the parsed=20
> transitions,
> before synthesizing a monitor. This uses constant auxiliary memory and
> does not depend on the INVALID_STATE sentinel. Both deterministic and
> hybrid monitors require a unique destination for each state/event pair.
>=20



> Add deterministic and hybrid negative fixtures. On the pinned Linux=20
> tree, the original rvgen suite passes 30/30 tests and the patched suite p=
asses
> 32/32; both malformed specifications are rejected across 64 seeded
> processes. Fifteen existing models retain identical transition matrices.
>=20
> Evidence:=20
> https://github.com/metalogiclabs/mathgraph/actions/runs/37983741146

I'm not sure this statement above adds much value and the evidence is good =
but I
wouldn't include it in the commit message. If you want to add more details =
to a
single patch (without a cover letter), you can append them right after the =
---
so they don't get included in the git history.

>=20
> OpenAI GPT-6 assisted in identifying the issue, producing and refining
> the code and tests, and drafting this submission. I reviewed the patch
> and accept responsibility for the contribution.
>=20
> Fixes: cad252db78a9 ("verification/rvgen: Switch __create_matrix() to=20
> Lark")
> Assisted-by: LLM
> Signed-off-by: Heath Sanchez <heath@mathgraph.org>
> ---
> diff --git a/tools/verification/rvgen/rvgen/automata.py=20
> b/tools/verification/rvgen/rvgen/automata.py
> index fd37ce3..1f9a56a 100644
> --- a/tools/verification/rvgen/rvgen/automata.py
> +++ b/tools/verification/rvgen/rvgen/automata.py
> @@ -418,6 +418,13 @@ class Automata:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 transitions.append(Transition(src, dst, even=
t, reset,=20
> rule))
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 transitions.sort(k=
ey=3Dlambda t : (t.src, t.event))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 previous_key =3D None
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for transition in transitions=
:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key =
=3D (transition.src, transition.event)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ke=
y =3D=3D previous_key:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 raise AutomataError(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f"Duplicate transition for event=
 {transition.event}=20
> in state {transition.src}")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 previ=
ous_key =3D key
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return transitions
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def __parse_states(self):
> diff --git a/tools/verification/rvgen/tests/rvgen_monitor.t=20
> b/tools/verification/rvgen/tests/rvgen_monitor.t
> index 5f25626..6209c00 100644
> --- a/tools/verification/rvgen/tests/rvgen_monitor.t
> +++ b/tools/verification/rvgen/tests/rvgen_monitor.t
> @@ -84,4 +84,14 @@ check "invalid ltl file syntax" \
> =C2=A0=C2=A0	"$RVGEN monitor -c ltl -s tests/specs/test_invalid.ltl -t pe=
r_task" 1
> \
> =C2=A0=C2=A0	"No terminal matches 'i'" "Traceback (most recent call last)=
"
>=20
> +# Only one transition per source state/event is representable in=20
> rvgen's
> +# generated table, even if one of the transitions has a hybrid guard.
> +check "reject conflicting deterministic automaton transitions" \
> +	"$RVGEN monitor -c da -s tests/specs/test_nondeterministic_da.dot -t=
=20
> per_cpu" 1 \
> +	"Duplicate transition for event event_2 in state state_a" "Traceback"
> +

Here you may want to use "Traceback (most recent call last)" for the negati=
ve
match: more consistent and robust.

> +check "reject conflicting guarded hybrid transitions" \
> +	"$RVGEN monitor -c ha -s tests/specs/test_nondeterministic_ha.dot -t=
=20
> per_task" 1 \
> +	"Duplicate transition for event event2 in state S2" "Traceback"
> +

The code for DA and HA is shared, I'm not sure we really need both test cas=
es.
I'd keep only the DA, we're already not testing every single error conditio=
n and
the test is starting to take longer and longer.
What do you think?

Thanks,
Gabriele


> =C2=A0 test_end
> diff --git=20
> a/tools/verification/rvgen/tests/specs/test_nondeterministic_da.dot=20
> b/tools/verification/rvgen/tests/specs/test_nondeterministic_da.dot
> new file mode 100644
> index 0000000..1b63b5d
> --- /dev/null
> +++ b/tools/verification/rvgen/tests/specs/test_nondeterministic_da.dot
> @@ -0,0 +1,16 @@
> +digraph state_automaton {
> +	{node [shape =3D circle] "state_b"};
> +	{node [shape =3D plaintext, style=3Dinvis, label=3D""] "__init_state_a"=
};
> +	{node [shape =3D doublecircle] "state_a"};
> +	{node [shape =3D circle] "state_a"};
> +	"__init_state_a" -> "state_a";
> +	"state_a" [label =3D "state_a"];
> +	"state_a" -> "state_a" [ label =3D "event_2" ];
> +	"state_a" -> "state_b" [ label =3D "event_2" ];
> +	"state_b" [label =3D "state_b"];
> +	"state_b" -> "state_a" [ label =3D "event_2" ];
> +	{ rank =3D min ;
> +		"__init_state_a";
> +		"state_a";
> +	}
> +}
> diff --git=20
> a/tools/verification/rvgen/tests/specs/test_nondeterministic_ha.dot=20
> b/tools/verification/rvgen/tests/specs/test_nondeterministic_ha.dot
> new file mode 100644
> index 0000000..d21b91b
> --- /dev/null
> +++ b/tools/verification/rvgen/tests/specs/test_nondeterministic_ha.dot
> @@ -0,0 +1,27 @@
> +digraph state_automaton {
> +	center =3D true;
> +	size =3D "7,11";
> +	{node [shape =3D circle] "S1"};
> +	{node [shape =3D plaintext, style=3Dinvis, label=3D""] "__init_S0"};
> +	{node [shape =3D doublecircle] "S0"};
> +	{node [shape =3D circle] "S0"};
> +	{node [shape =3D circle] "S2"};
> +	{node [shape =3D circle] "S3"};
> +	"__init_S0" -> "S0";
> +	"S0" [label =3D "S0\nclk < bar_ns()", color =3D green3];
> +	"S1" [label =3D "S1"];
> +	"S2" [label =3D "S2\nclk < BAR_NS()"];
> +	"S3" [label =3D "S3"];
> +	"S1" -> "S0" [ label =3D "event0;reset(clk)" ];
> +	"S0" -> "S1" [ label =3D "event1;reset(clk)" ];
> +	"S0" -> "S0" [ label =3D "event0;reset(clk)" ];
> +	"S1" -> "S2" [ label =3D "event2;env1 =3D=3D 0;reset(clk)" ];
> +	"S2" -> "S3" [ label =3D "event2" ];
> +	"S2" -> "S2" [ label =3D "event2;clk < foo_ns" ];
> +	"S3" -> "S0" [ label =3D "event0;clk < FOO_NS && env2 =3D=3D 0" ];
> +	"S3" -> "S1" [ label =3D "event1;clk < 5us && env1 =3D=3D 1;reset(clk)"=
 ];
> +	{ rank =3D min ;
> +		"__init_S0";
> +		"S0";
> +	}
> +}

