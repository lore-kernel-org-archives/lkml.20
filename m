Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEC241DEF4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137351; cv=none; b=WGQUu63OBMiRPqqE81ahM30H8EsZWoxFOOuymCleaATFm/Q7mVPzKU0/h9N9/SYNkPgejI96sw2ihE0yCvDJwbU6rPfUV60uc2oFikmdIAJ/5GPIvtl6BgQjODNgRZiXZ7+UiDw/7uzpw4SoJ3dukkWb44+MpWDkjPnJ/3EAUFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137351; c=relaxed/simple;
	bh=UlpHP7Z60Nf7v2h4dGXiTKjBnnXmOjaKLaPUWurPnB4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rfYvAyIWd1V8PnS0TwOCyCVbr7fhYAXaS+hfBvemDZL0R7R5/0B8T3yz6b4NzaBMUPXssd0+aZkb9rX+OcTH4DDnGy0icMdFhV1jFih+WSN9pckO1KhXsrRVu5s5AqnHMAMqct5R2JT9VjJI2d816xxuP0nvzQxXA5fNbgTWAaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YozeBrWE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=I6iRZZfF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YozeBrWE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="I6iRZZfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792137344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K4A98+Ja2PbDshcI2GUMvWoRwGyHcotmF1kYvCzQUdM=;
	b=YozeBrWEBqQfpGYAljna01HavoBWW5RvDnSWlhVspWGncdeMoFcBVOg51H1xetG2tOcQo2
	+jrFksfyiTjJ0tSyFJjE1qZYsqdNE6mGjDFyTmCPVfsXiQFUbXC0jUIcxNIQ54vvtXCJOI
	cl3eGC1AgZugp6yz/JfW9XGDNgcebQQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-WSsOOurjP8eQBOWSkYhwHg-1; Fri, 16 Oct 2026 07:55:41 +0000
X-MC-Unique: WSsOOurjP8eQBOWSkYhwHg-1
X-Mimecast-MFC-AGG-ID: WSsOOurjP8eQBOWSkYhwHg_1792137340
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so21678545e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792137340; x=1792742140; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4A98+Ja2PbDshcI2GUMvWoRwGyHcotmF1kYvCzQUdM=;
        b=I6iRZZfFl3ZbhmS4n1zYdG+Xk8SuF39qJsp35DeHgoN4yGyc+lXK/vRvi3PDOce5ON
         9l07/NzIiB3jKKdEO2OS0IhQdjcXAWH5AicGWA85bbywD/g+bEVQwdH9R8Zo2g/41TzB
         0EbWvgF/a64AYTnpwbgWn03Pmf8bgxTQ53j8KxDg/GXTnvVP520GhYZEYPhTT75j1Hcm
         mTAcqapTwFemoB+dIy/CpRGLb4oOomjHNvunBL45BptUfUW/yDIwvPR3Qdvdo4EQpleB
         8tKGY5hKpHL8uBWfj/MhAVhof78Gf03dM2Z02DnVRuq2SHsxcc3qCZMqykG1mqULH+LZ
         A5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137340; x=1792742140;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K4A98+Ja2PbDshcI2GUMvWoRwGyHcotmF1kYvCzQUdM=;
        b=oL4aDfFawQUlC42SgbrqvbnMJ3rIbMuZ2/TWLvYdePRM4X7IRoBRlRriIDUUEELvpA
         MRvmCmPcK2Dy6fWNDiHJZgs71Rj07QDIQ+bUStux7kacjwGFf0c/X0FjKMNJvOcHtdrb
         MXHO7vc294Y6lqHeN19ClUGf1Qn71Zh3j7LON7o6Rkc2xpaHQ/xjB8CYpAisPWVZobHR
         1PKmhBagBYzapxxIeF5Rvvyo3EAwMiN+wtPldIgrf3U5AvlE6Vsmv+7wB1gLjeUlGz/d
         bnEVIYhrWEbFpwbU6AfddNQW/kDwVZNEI+oaYpVyPb76MyT0upRmTU+ilXj3+1WJyvSM
         xSRw==
X-Forwarded-Encrypted: i=1; AKwUvBzBbFQLavfBejCua84J7Ahtn/Zlh5Vhke75Z/9BMD6cEeyThDODlVb7iyf4rdU5qi+sBe+IwgAQ+Rql7no=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/OmHE+vR6dK1513twp9e8jPuNKpJmOmQjP9a1O/HGkoHHRhiI
	MO37Ds3upfDLVIo0HBPWzAOkjVu/bUKyrthBUGjcP0nsCFuXJWF7QWBOd3O4QIcU/hCPULBL/b4
	iIBUTChZ2wy3t4Nut3Y62VLb6WqsZZLhJbFkK9SSH/RP/N7TQGosjTjN5KFz4yndJQQ==
X-Gm-Gg: AYBFou2ltr+yFuzr0zDLnCK9DA76G2uawp9Yzf+VyyqX4ncV4NVY0hj2xzc93sInuhF
	mJt5ovyfuczsH0fBdJBr7sMvqUWkPZZGKHThdL2KEZMTd8jbQLkBENrW4VrS6pRgQswT7QNqZFX
	5CrjYKXW48M79j3CovTa7T/+REFZqSInfb+BR3QmWARo9p4krA1fhEL9tRLjs9Wnn68X3jNzr6f
	FKsjrfUR2Ji6ylKyPReqD5sfDT+4hgeBujJTikCtPgUuligOTiG3Okwln45l/hFG6ZFk9baRa17
	N227PFqwrIyPRpW+LmZAHwBr3dlL1BRPyAK9hJeWPVTxbd5ngScmPylCOAw4I232fxEsOSjlo9z
	8xnfz/ti4HwD8pdjphhM6xcaD1fqT
X-Received: by 2002:a05:600c:620f:b0:49f:dc71:e609 with SMTP id 5b1f17b1804b1-4a18e499874mr410207665e9.20.1792137340046;
        Fri, 16 Oct 2026 00:55:40 -0700 (PDT)
X-Received: by 2002:a05:600c:620f:b0:49f:dc71:e609 with SMTP id 5b1f17b1804b1-4a18e499874mr410206735e9.20.1792137337796;
        Fri, 16 Oct 2026 00:55:37 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8af2fcesm41176545e9.8.2026.10.16.00.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:55:37 -0700 (PDT)
Message-ID: <9fc2d6a03fabc2c756bfa696bc907ef23dcc175a.camel@redhat.com>
Subject: Re: [PATCH v2] verification/rvgen: reject ambiguous state/event
 transitions
From: Gabriele Monaco <gmonaco@redhat.com>
To: heath@mathgraph.org, rostedt@goodmis.org
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 16 Oct 2026 09:55:35 +0200
In-Reply-To: <11d37dced04f512153c023b8b7361309@mathgraph.org>
References: <11d37dced04f512153c023b8b7361309@mathgraph.org>
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

On Tue, 2026-10-13 at 15:51 -0400, heath@mathgraph.org wrote:
> The rvgen generator builds a transition table indexed by source state
> and event. A DOT specification with different destinations for the same
> key is currently accepted, and the selected destination depends on the
> iteration order of parsed transitions.
>=20
> Reject duplicate state/event keys after sorting the transitions, before
> generating the monitor. This prevents silently selecting an arbitrary
> destination without changing valid automata.
>=20
> OpenAI GPT-6 assisted in finding the issue, developing the fix and=20
> tests,
> and drafting the changelog. I reviewed the changes and take=20
> responsibility
> for this contribution.
>=20
> Fixes: cad252db78a9 ("verification/rvgen: Switch __create_matrix() to=20
> Lark")
> Assisted-by: LLM
> Signed-off-by: Heath Sanchez <heath@mathgraph.org>

Thanks for the quick V2. I'm going to take this.

As a side note, I just read ([1], subscription required) that the Maintaine=
rs
decided at the 2026 Summit that models used and other LLM details are no lo=
nger
to be included in the changelog.

You don't need to send a V3, I'm trimming that paragraph. Anyway this kind =
of
transparency is largely appreciated, so feel free to include it after the -=
-- on
your next contributions.

Thanks,
Gabriele

[1] - https://lwn.net/Articles/1099594

> ---
> Changes in v2:
> - Drop the redundant hybrid-automaton regression fixture and test.
> - Match the full traceback prefix in the negative assertion.
> - Move detailed qualification results outside the permanent changelog.
>=20
> Verification: original rvgen suite 30/30; revised suite 31/31;
> 64 deterministic/hybrid hash-seed replays rejected malformed models.
> https://github.com/metalogiclabs/mathgraph/actions/runs/38452477359
>=20
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
> index 5f25626..8d635fc 100644
> --- a/tools/verification/rvgen/tests/rvgen_monitor.t
> +++ b/tools/verification/rvgen/tests/rvgen_monitor.t
> @@ -84,4 +84,9 @@ check "invalid ltl file syntax" \
> =C2=A0=C2=A0	"$RVGEN monitor -c ltl -s tests/specs/test_invalid.ltl -t pe=
r_task" 1
> \
> =C2=A0=C2=A0	"No terminal matches 'i'" "Traceback (most recent call last)=
"
>=20
> +# Reject ambiguous source state/event pairs.
> +check "reject conflicting deterministic automaton transitions" \
> +	"$RVGEN monitor -c da -s tests/specs/test_nondeterministic_da.dot -t=
=20
> per_cpu" 1 \
> +	"Duplicate transition for event event_2 in state state_a" "Traceback=
=20
> (most recent call last)"
> +
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

