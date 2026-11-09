Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794261545;
	b=hW/o04vhQDWd/afJ4kvoAzX9wj0eZ59YN0Sw20FCPOZACcygM1Z/lsAqyhJVvE5uc4Ax
	 LQqGd10ljCNqYklzZ1llYJxdU3RohLND3bNdpULboJv7yMFoppSj6VkVQFsRPVuLtlq8r
	 AY/7tI0T5R+Ps0bfqy/vZzUvO/7dVqkN39NP2/gQt2XXYJ9OsRJ7Uni2NImwxUQtgL6B3
	 TFkc0cBQZVklofAMeS+E+MEQdfkIzGTJ7mEYcY/uRLuNybkOjLbUic8FbcYbNuxox1rCU
	 pCNJEfP+MDoD4YE3IYf+m7f2rmFPPtsQrXg+LV+49BzggNM8NIQk0ZaQswOJ2RTaTyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cvV1+x6egeZIOS6mY7nPlFsWTpahpD9QoPA6e3DqkZE=;
	b=0loxNU5WMLH6JfQsINYhfHaefGeaXpvtM/GuNMBAZbPS4lQ7GNRjiXfms98N0YrIjpHm
	 l6rtYc6l36wJwM3fU7dZH74i0J/zNYNI39johRL6tej6ThwGfpSXD3IB7LYNdtvW4DbFs
	 nyT5aCr8vw+/+MHAtiIJEIqIbJDNFb6meN2najgIxni+HYsfaBQMHU1DMqvEEDwvbKbVb
	 hbUcL55ZTCOgkJlLzi/DeZQnyfQiu+SJyLKFxTft37qxSI/sOV9PoJebKkHF7LC3yf9/t
	 Iis5fEuGEJrxmuKd1wsRwAJO/1ISOoTFFN7JRrIV68TvnmtYa8tXkQ/Texdj+lKPB2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jVkI7ClZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B282606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B282606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jVkI7ClZ
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5383c97c8cfso24911cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794261544; cv=none;
        d=google.com; s=arc-20260327;
        b=Qpa2fJeBvQA6wZ6FpHY6gD3dwGGhSCYYq3s1m7VUWKdnlOA53lP6BILe5d+2uuxB49
         /tdR1mqXO++LR0oZ5rbLn7IeJGMHpByTYmY25l/DphPaDjadAfmA3hC4vXMzL9xvIwzR
         98DT6jrW7CjqNd/3KNVS9IqJFiyy12lTgjwXZX8lskx32XcdISrhpqLVV1YD3o7XmFr8
         HbLIWiQPgpSdfG2SiTbMiY2RDE0kSy4gWyH/toF6wTHRRUvLEXTDie87tlfqGtJB3R8l
         AhI21EMxtuL6qu3WpaO2ZltlDneg1IiwaJpqpEz0yNfeRGYQIz3V81982mXRm/omf+X0
         LJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cvV1+x6egeZIOS6mY7nPlFsWTpahpD9QoPA6e3DqkZE=;
        fh=Z2wTRF79xehlm2cy4UAJXXKaa53S8lNKdb3t0v2fV/o=;
        b=NFZP+OsXAB5fn+CxuwGZTfyTaqwWX8ruCjfMtbc2/lHJbO+1+9JltK9BCEo6wHimBy
         BRVJh4icPMnqSQ074qCFATGX/S9YCl1fhQS2tehh7G0V85Ceu+RE9jUvWbOqsgNlo8zg
         6SC4eDywbrnbRZglhlCVTScPKxsxq6MPcUPWIfHw68Iw4ZPuXYwLySJsIYUZ2/RHfSg9
         qPP6v6YM87mMGthLa+XLEd7VB7ZjjWvU0tCPrR/0FdBkVBy0oSss+TDpppxakdhwBVvh
         y/yEFU9jPjtuExjyOezXPJiJzNEDNuJMT+hq24zxsYO8wkPUsLmTOiuQxmhqiuni3FMK
         O/vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794261544; x=1794866344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cvV1+x6egeZIOS6mY7nPlFsWTpahpD9QoPA6e3DqkZE=;
        b=jVkI7ClZXWzRolTRJvb3/jiz8GXDNAi+Y51HAKVmPxjpEr4DLkMY2pC3v8pW9QvTPs
         MQ4cDApZpO8kRYa+teKED5Whuhh5R+kE842e8ggpcT0V3wBqOQPrTRfGD5CBlq+QzOzm
         acJ/V3/Ch1f+Yq1NiFIhnD6GoQbZx0gL5ikGtAfFkHqLH0fhEaOkWEX+3LcHNm55DJLM
         tvG4zsT83FWpKqnD1J31VDVGO2HuXTwXiBRIOlclJFPXXjuaFae8Z9D0ueUpNgWNnEtD
         AU26LzgZk7sKb36su4b3HhVW7ZsnS4QRDD41AlkhsbXG7LgesizMD3HGqgcOGaESVn7U
         Aa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261544; x=1794866344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvV1+x6egeZIOS6mY7nPlFsWTpahpD9QoPA6e3DqkZE=;
        b=xzF7oj8ZLQjtJW1YO7OYaXxz9AtBSMM2qn5ZUi86FV3DgpGvviIjyQcwnXNpjxAqXW
         8fJhQGKixBr28Y8qLXwl+EIjRFAj8Oi2oaaFvOWmZSnthE7qWdpmX2GpLaWWo648QhTS
         FRti7+YwA5LZ/bknuiAmOfLrWlkCN3X0uOc88UZqZEO3jw3U1g1vFWT42M7qLhief+d6
         X/7xP2l7iCQfO6/m3ik9sU3DXQsWAqbXKSVw5D/eZ7TZyvMHZtDWkYuYpDCALoRcht4o
         f15ylgk71MmTfdLK7eZVsRHlX1Q41TdsJEERwkJyfKp41ZnAUvO/PLYp0S+csdCuWwBK
         s8QQ==
X-Forwarded-Encrypted: i=1; AL+hErGIfBSFrWWp9BeWgDj9P5gytQLUimxouxHF/K1GSaS588g6BpXC9v6iwvOiD7AiNZ7grsbDtRfhuiAu1Rw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e/5XHw05iXuEsyNNhZa08oWS0OWK7IVlnlg5ewplQ+N6SOY/Z
	QWCef1Pb7c5twYQQQ1Oat9s2QSLSXCKwMJqSqZ1I68iVEZOmE0mQf0YLCjqrlYjPuGnHU9yRxT2
	nurKat1/E6jQgtx46KhtPPDWjzI/RoS2r8zYcWztg
X-Gm-Gg: AYBFou2b4zQa63pG73hz8RhjVErhUvMOGgYze4hLEyDwV2syctoL9QFxfHYmRFNmdU+
	OqSPq4CcwEOQFd4rKXBbY1TKOzeq8HsXZCAu/fKKLXQoO/yOgny+DX7V44IZturtCyIf2a6jrbf
	UrLvDVXijpqMjfMRGvBGqNy8nM9JpkKkHvO0BidBLlx+EFqMpk1rtS+a/B1oGmYnssUWmbI0kA1
	h6QoCqgUBCL33oaMPbDAHhM+LLVVK8QaKbzTN+ltLDiaKsNk5Gc1zcWR2JVaVcPDrgu3Xn9A7A2
	UkI6bs1j1cytaA7SgWrJ+4CtKZY1rZTQ55OSXYQbXrhMIvwAYTvuU4otNcJ7ckaz4LbJJL/oez/
	SZb3I6Yo0ce1Ul/7/oDa9kAzloUYXK7G2pL0ZWJcFKVljQwAR+qi4/jrHRld4bVkcP24=
X-Received: by 2002:a05:622a:5a11:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-555294b5379mr5278851cf.0.1794261543291; Mon, 09 Nov 2026
 13:59:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109120320.75053-2-qirui.001@bytedance.com>
In-Reply-To: <20261109120320.75053-2-qirui.001@bytedance.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 13:58:51 -0800
X-Gm-Features: AclHuK9ZqQj8qRR7GQExEW7WbgHpHS7TF-EO6qkNbhVRaleoN-uxmSQ4-CoXb4w
Message-ID: <CAP-5=fUf=MD72=wuSxem+j6S11J2SvOaxOEb+H+ifLV=Y2p03A@mail.gmail.com>
Subject: Re: [PATCH] perf parse-events: default data breakpoints to any size
 on RISC-V
To: Rui Qi <qirui.001@bytedance.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 4:06=E2=80=AFAM Rui Qi <qirui.001@bytedance.com> wro=
te:
>
> When the length of a data breakpoint is not specified on the command
> line, perf defaults it to HW_BREAKPOINT_LEN_4:
>
>   $ perf record -e mem:0x30020:w ./prog
>
> That assumes the length describes a byte range that is compared
> against the address of the access, which is how the x86 debug
> registers and most other architectures work.
>
> RISC-V debug triggers behave differently.  An Sdtrig mcontrol6
> trigger encodes the width of the memory access it should match, and
> it only fires for accesses of exactly that width.  Watching an 8-byte
> variable with the implicit 4-byte length therefore never triggers:
> the perf event is created and enabled, but no event is ever
> delivered:
>
>   $ perf stat -e mem:0x30020:w ./prog          # 8-byte stores
>   0       mem:0x30020:w
>   $ perf stat -e mem:0x30020/8:w ./prog
>   10      mem:0x30020:w
>
> The failure is silent and easily mistaken for a broken hardware
> breakpoint implementation.  Tracing hw_breakpoint_exceptions_notify()
> while the event is active confirms the trigger never fires.
>
> Zero is a valid length for RISC-V data breakpoints: the kernel
> encodes it as size 0, which means "match any size".  That is what a
> user leaving out the length asks for, so use it as the default on
> RISC-V and keep the existing 4-byte default elsewhere.
>
> Tested on a riscv64 kernel with hardware breakpoint support.  With the
> default length, watching an 8-byte and a 4-byte variable both count
> 10 stores, while explicit lengths keep their exact-width behaviour:
> /8 only matches the 8-byte access and /4 only the 4-byte one.
>
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>

The change makes sense to me, and I may have been the last person to
tweak how this parsing runs. Could you address at least the test
failure issue with something like:

- TEST_ASSERT_EVSEL("wrong bp_len", HW_BREAKPOINT_LEN_4 =3D=3D
evsel->core.attr.bp_len, evsel);
+ TEST_ASSERT_EVSEL("wrong bp_len", default_data_breakpoint_len() =3D=3D
evsel->core.attr.bp_len, evsel);

and then I'll add my tag.

Thanks,
Ian

> ---
>  tools/perf/util/parse-events.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-event=
s.c
> index f3ba70d4f76b..b72e4b0da8a1 100644
> --- a/tools/perf/util/parse-events.c
> +++ b/tools/perf/util/parse-events.c
> @@ -598,6 +598,27 @@ size_t default_breakpoint_len(void)
>  #endif
>  }
>
> +/*
> + * Default length for data breakpoints when the user did not specify one=
.
> + *
> + * Most architectures treat the length as a byte range that is compared
> + * against the address of the access, so 4 bytes is a reasonable default
> + * that matches most accesses.  RISC-V debug triggers (Sdtrig mcontrol6)
> + * encode the width of the access in the trigger instead, and a trigger
> + * only fires when the access has exactly that width.  This holds for
> + * both RV32 and RV64.  With a fixed default, an access of a different
> + * width silently never matches, so pass 0 on RISC-V, which the kernel
> + * translates to "match any size".
> + */
> +static size_t default_data_breakpoint_len(void)
> +{
> +#if defined(__riscv)
> +       return 0;
> +#else
> +       return HW_BREAKPOINT_LEN_4;
> +#endif
> +}
> +
>  static int
>  parse_breakpoint_type(const char *type, struct perf_event_attr *attr)
>  {
> @@ -658,7 +679,7 @@ int parse_events_add_breakpoint(struct parse_events_s=
tate *parse_state,
>                 if (attr.bp_type =3D=3D HW_BREAKPOINT_X)
>                         len =3D default_breakpoint_len();
>                 else
> -                       len =3D HW_BREAKPOINT_LEN_4;
> +                       len =3D default_data_breakpoint_len();
>         }
>
>         attr.bp_len =3D len;
> --
> 2.52.0
>
