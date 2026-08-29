Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EA131195B
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788040140; cv=pass; b=Jpxs3LT3tjeEXY0DptTGAJraydHoPuYiweI4wlcw15AyFOpYVLwsWT3N9rjWCPpPCW8F0EEl5lUIpirGXbRSvwpxLUV4KpHgqcCuArWEuzw4da8sie9XUWtDvfWBeAIGHRXupFV3ONVTdpmzJ1BBF+FR3ycPUKIsws+fNMk5qFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788040140; c=relaxed/simple;
	bh=H/9uYP1Y0PBrBKTFWJikeiR9zRmEoPiRFj12d2R9vT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYsdPKWbXToVk5fDOYRHWMNrTzSBSNNkFLs38F7l2DQ6jd86V7ak4BLxG3XwaGFxYdIQUbaRhU+V9JIKKCGvPWcGSJ16q3T9vhkYqvi/h6EXZAcozWcvxCun7rsbrsQ6x5awxrSbLYEZfRXYHK4K3BH5xQtKfRq5TqcuxrQNCOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0TLnWst; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0TLnWst"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so1190798b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 14:48:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788040137; cv=none;
        d=google.com; s=arc-20260327;
        b=Zrve/4fP9SFPiVQNKV9OeMsADBN3mqKolGlk1Ya+A4c92hMcaEh+nOdDZ9ekW9gP7G
         /UrJWwBHc9q+AYdq+0KBRbBrchz3EpCbN8XM2s9CvwNtZ4sa1SJZiu7wsUcTufU1DiC4
         qqE6x2xhln76TssjtMR83+iZXckHf/Vg+pM3Fof70sLM9Mj+j+1leOQmK9KwkjfJOsjS
         s0l3FQcbwlt1bnikEnDNtCMqh8hn809dC6zefvR27Zf7nFk0Y5iQOPkZhiliHSseV7gX
         LmK5HjK5HZk0s+yUhVZMARYRqlpnQHDmXx2bZmwrWeIxXJe3Wzpr8xtmOgfYhLHFtG8J
         9keQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ftkIDhd/30DKPZ6nznnqMe05znOkwZBhgu28kTzrKrY=;
        fh=WHcwJo4dlkCzVORtlmi2saGI+G09GT5VZrL1NU+0h6o=;
        b=C5m/xsfMfymlv0L25/6sPYpUP2q0grWVi1rJtrQ/yw1WI5EwGlt1ZK/aS+4wq4NdAT
         wrpI9FmGUcFOQ7BlVrhzeAFBT9nYR3O6pURPyMZ5+Nm88aOJs0ZCoqMDSU78aMfiKRYE
         TpbSDs6qrx1+P/gg0qxbwjcrc0Lr3uXcLeeIfDn7qwrgoGBEfBBKUg6rQK8zV6aILpwW
         0nFvnVOoGVPYiH66sr69//UA6pwtOr5ymWipGJ8KoGU5dSY4yHJzpOvjqy/GxA7igbHP
         bA9HUZ6FFQJ5OLpv+scBFU4HXGJQ6zezBIhbnzNin38NY4pp/foBjI84WBRH4n+455GR
         39rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788040137; x=1788644937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ftkIDhd/30DKPZ6nznnqMe05znOkwZBhgu28kTzrKrY=;
        b=o0TLnWstOJge42ij5H+k/i0aqIQZkIIdDlOALWA+yoj9L8jcs4zZEqowkN/rzjYEPI
         GcczW6bOFaJXIizZh9TcFEcfZIMPxfQL6iOPeCAFeofHlpw/eUFIWCBwU/MDJYsK4maG
         Rk85v85h64IGXfyMZ0QAzyd+ktLni5LAHrjH0ZPV6tnWxb68pkFnu/vU3d99itKBiTuc
         GgUNNiGzM+2hlZKtVfPM5wWMbVGAYzCd5LjAQ+kWPnIlx7uzYHQojVNngfs9+Qc3/plL
         wreVgwuPdryeYOxfxiN1GzpgEVmWhdqF7p+nRbfzia0az0xeNeXYaxa5Zf1WUotwEBs6
         SpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788040137; x=1788644937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftkIDhd/30DKPZ6nznnqMe05znOkwZBhgu28kTzrKrY=;
        b=Q2A7Q3of0LBvfXSaaAHOP+34h+dGrTDHbH6U95FJZnV18s72eN5QT0ZXO5vnkFs2Gt
         ZUzsGGF5jKJPBs6A+xpq/5qDMyckQGXxxtHDFsV6TtJjitD6gBkdv8geZx1/df4OXrjl
         I33xfekkgnlL3PL8eZilbPQGZweCuXAZjea1zz+ooxCILtKQ3NseOw4VvssjErWHjHbS
         xhKbfVH8YPx8WDQK1/Cqe4kjPV9CaKIXqM3mHiVxN5UMkVg5k12gnoUPONOHErSFlj1T
         AT/4l8jFYNlZ277KwRgE3wUasIL5Jc0lL0SJ2YVpynd5cCNrnmsZ5wgr6Q8CBql8LCF5
         vp4w==
X-Forwarded-Encrypted: i=1; AHgh+Roieak+S++SAY5TyXMwwv/o9pGd/M87zu559T6lV1gEtNBYzoeehqxG1OdH10BhB4dYQZ5B2R4Jxy/SJRo=@vger.kernel.org
X-Gm-Message-State: AFuF++nHubgNgpkBAiw4BxbLl7FJQs/VTO1JPNUpa1otAeaHO0e3kV4Q
	CXPPRAZjMZ6bp6M4d/PtYfaeoykj8gDxndRbQv2c0qR1e0nX0ZzqQGB3J2ziOo2gZF9Ju8HfRpn
	cEFI9QBZAFTa4JhJIOkHIvCSxNzlwMTA=
X-Gm-Gg: AR+sD12R1Oh6+cQUMpUugtHdKtJlgtmt4LjF8q6NcWPeOOfesvrV9FUyF74CnkGDanD
	rrc21KolywWRNnYexBiclNf1ZCJcTSwg1F9i4FVlyf5LSvyitpEMkJ8BHbKsX0r68UaU+XKjvN9
	jkWIpVXnuxmxHl+pr0pY+JpzknpoYBFXR+GQ9xG2FEmZiwoYSEJd7JtUiSDs5HqkZYm6yhXyRjH
	E2gqtW08CR1+Z4pJhDiEfyiwpobX02tmEwQkpdh677zK9E2/ae/WNjqegtShiGafrU1/vSICMHF
	OrlzBK/mzYW8rvop1uNK/bL5zLn4WZvGpITwZZTTZXC47LTYQsH9Xy302KHgG3rPCd4TOVdgBLg
	wh84L5adzO5C653A5OIc4hybBjAgedIQJ2vs8UmJLieT17lIqyTSvPFL5qsLT3lvAgKO1j55Dyj
	mMPA==
X-Received: by 2002:a05:6a00:14c1:b0:847:83bc:d2a4 with SMTP id
 d2e1a72fcca58-8562839d7b2mr27163440b3a.2.1788040136977; Sat, 29 Aug 2026
 14:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-sctp-zero-chunk-inqueue-v2-1-2e7669c6a6cb@gmail.com>
In-Reply-To: <20260827-sctp-zero-chunk-inqueue-v2-1-2e7669c6a6cb@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Sat, 29 Aug 2026 17:48:44 -0400
X-Gm-Features: AcwNN1W4BkB_tLbeddy0Wwm7bmTO0fGD1p86kquDxuqJYp1vS5AQsqvG4z3gYNk
Message-ID: <CADvbK_f-8-0f6i82iH3vuuNBjJwG+Gm2o_RxH37mpBpUc4nZ6w@mail.gmail.com>
Subject: Re: [PATCH net v2] sctp: validate chunk length in the inqueue parser
To: theminershive@gmail.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Vlad Yasevich <vladislav.yasevich@hp.com>, linux-sctp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 5:33=E2=80=AFPM Charles Vosburgh via B4 Relay
<devnull+theminershive.gmail.com@kernel.org> wrote:
>
> From: Charles Vosburgh <theminershive@gmail.com>
>
> SCTP chunks always include a four-byte generic header, but
> sctp_inq_pop() currently accepts shorter declared lengths. A zero-length
> chunk leaves chunk_end at the current header.
>
> When ASCONF is covered by the association's SCTP-AUTH policy,
> sctp_assoc_bh_rcv() can continue before the state machine performs its
> normal chunk-length check. sctp_inq_pop() then returns the same malformed
> chunk repeatedly and the receive softirq can lock up.
>
> A remote SCTP peer can trigger this after establishing an association on
> a kernel built with CONFIG_IP_SCTP and configured with
> net.sctp.addip_enable=3D1 and net.sctp.auth_enable=3D1. The reproducer di=
d
> not require application credentials, a shared SCTP AUTH key, or
> net.sctp.addip_noauth_enable=3D1.
>
> On commit f967455fb2a5 ("seg6: reset IP6CB after IPv6 decapsulation"),
> one zero-length ASCONF caused repeated
> watchdog soft-lockup reports in a two-vCPU KVM guest. All 3 pre-trigger
> health probes succeeded, while 36 of 37 post-trigger probes failed. With
> this change, all 37 post-trigger probes succeeded and no equivalent
> soft-lockup signature appeared.
>
> Reject chunks shorter than the generic SCTP header at the shared inqueue
> parser boundary. Mark the packet for discard before either caller can
> continue processing it, while preserving the four-byte generic minimum.
> Declared-length 1 through 4 controls and kernel-generated ASCONF traffic
> remained healthy. The patched sctp_hello selftest passed for IPv4 and
> IPv6.
>
> The complete private reproducer and validation evidence are available
> directly to maintainers on request.
>
> Fixes: bbd0d59809f9 ("[SCTP]: Implement the receive and verification of A=
UTH chunk")
> Cc: stable@vger.kernel.org
> Assisted-by: ChatGPT:GPT-5.6-Sol
> Assisted-by: Vantix:claude-opus-5
> Assisted-by: Codex:GPT-5
> Signed-off-by: Charles Vosburgh <theminershive@gmail.com>
> ---
> Changes in v2:
> - Fold the minimum-header check into the existing chunk classifier.
> - Keep pr_debug() on the malformed path and leave chunk_end unchanged.
> - Retest lengths 0--4, legitimate ASCONF, and IPv4/IPv6 SCTP traffic.
> - Link to v1: https://patch.msgid.link/20260826-sctp-zero-chunk-inqueue-v=
1-1-86769dcc7f8c@gmail.com
>
> To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
> To: Xin Long <lucien.xin@gmail.com>
> To: "David S. Miller" <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Simon Horman <horms@kernel.org>
> To: Vlad Yasevich <vladislav.yasevich@hp.com>
> Cc: linux-sctp@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  net/sctp/inqueue.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/net/sctp/inqueue.c b/net/sctp/inqueue.c
> index 5f988b3a8814f..d666cec6b194e 100644
> --- a/net/sctp/inqueue.c
> +++ b/net/sctp/inqueue.c
> @@ -212,8 +212,10 @@ struct sctp_chunk *sctp_inq_pop(struct sctp_inq *que=
ue)
>         chunk->chunk_end =3D ((__u8 *)ch) + SCTP_PAD4(ntohs(ch->length));
>         skb_pull(chunk->skb, sizeof(*ch));
>         chunk->subh.v =3D NULL; /* Subheader is no longer valid.  */
> -
> -       if (chunk->chunk_end + sizeof(*ch) <=3D skb_tail_pointer(chunk->s=
kb)) {
> +       if (unlikely(ntohs(ch->length) < sizeof(*ch))) {
> +               chunk->pdiscard =3D 1;
> +       } else if (chunk->chunk_end + sizeof(*ch) <=3D
> +                  skb_tail_pointer(chunk->skb)) {
>                 /* This is not a singleton */
>                 chunk->singleton =3D 0;
>         } else if (chunk->chunk_end > skb_tail_pointer(chunk->skb)) {
>
> ---
> base-commit: f967455fb2a5a2079b9eb5823e9ccf359174bf9f
> change-id: 20260826-sctp-zero-chunk-inqueue-b478dca552c6
>
> Best regards,
> --
> Charles Vosburgh <theminershive@gmail.com>
>
>
Acked-by: Xin Long <lucien.xin@gmail.com>
