Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5369947F3B8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790808871; cv=pass; b=pS/qX2p1F31jIysWY8spdqmIZFmdopPRqLRD0B0V16MXM3FHXLUCkUD8DZ0UiPpl/41L7mSRX4XiVUZZBZoBNa1hsMDHleLFTjh4ELePHJgsznHESucF7r1V8cKcYZtFk/rPbxG8majWqqzkNAUiW+uumXG+cmy5Ywn5gsGKAB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790808871; c=relaxed/simple;
	bh=25OW8kJVzXxMj1f7wl7vPyZB0Mh372NuIRML4c+wriE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FF9tH2QzNN93ZLXpvpwYmNIajHdqTxS1B67Bw7vZTD3AROlxjE88purYE5820xJfOtu0G3hir/Z3IioixE11CdVBh4jyAI+b7v8BfzaLlX+5rz/k0qdyvDY1iHsQYAEBJwSTEminDzsHYNT8t3OvAOFHMLbjFEzRATc/j7A/ZOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zy6xGcMl; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zy6xGcMl"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so699882666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790808862; cv=none;
        d=google.com; s=arc-20260327;
        b=SMb2Y+QsDBRb2AUc6HYrAWDKVlcUo/Z07GJkxS8ldi1OIEbxQYWM20segLjW5r6UzP
         bsoKBclta3jN6A6Sng3SQ9JlgFuayGXWLRmIy1z7HNhAF0FzZggrWfpBF5Hthx42ngxZ
         WeSdV97NZqWdGO292nF/FxabdMXk2nCP8fPi5K90QCHCh4vqnqS13fx+es5fdGtNgHGL
         lx1OeYG6jd2J2EhsJFo6nP/Ca5PEiioTvLwoytHMbII3Vx+lfKyDNEq/8hSEHbZaKaZX
         pz+5DSfJnmKHaEyyTtbaRkrzDkSCRzQtnh3oG+Qgh9DgPm39RFpYo5gy5vm6mDfjfisv
         DfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BMDqFIaP1O55HQyhPMTHQHywZWJn4sXJBK7hF4BIEBo=;
        fh=u7inN8DCKIvrtbDwo6fXbXHi9moP6nTwulL+nsipISg=;
        b=Gs5aLrcxQfb2CQJx+2JdpFPrWJ6u4tZqCSrftirDq5bzJb3na9NPEuhnQomLVkDryT
         y0Y6X6pHN9uAGZNRIqFT/FleW9IruPA/B+P/KpwJg8nKVaQUssbPJ7ZH8/a3gDCrVe6S
         DcM4y0fjsIUxDObLTUNIP9IruKd7NUy/jbeKOfxXP0U9HBKvzWCpStuAQindRqJpzEnr
         vA2Ct9oPd4V2BC1onS4UC6vNSvuj6iBMnZ/BEQKeS7izAeGWdmgig5MJwBRSWTZm2Fau
         7sNjwN9ZpSBCIBeBmQE2zfmTz00fx5rvkE2nw6Qe3GnlCa6xU1p/jDbifIDVBldj2e+7
         /i4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790808862; x=1791413662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMDqFIaP1O55HQyhPMTHQHywZWJn4sXJBK7hF4BIEBo=;
        b=Zy6xGcMlXVBd+eFtXChF9aS7xQKph7IQFCB6hlxE/Gn77dVpltkC5j+60MPQi1YqRh
         FrxcrOg6LDIi3yNq7tNq57mP4Hl0L5J+F8OBEmbEqRaxPT1wpI3r9lYTWP/rzPCeFYtZ
         WqFkvsxL9Ouvjy55QvXZuzZVCS4YT6g8dwlVYE86YsmVsqjA02AXaRq/hyzAsa+/qLQH
         JgCjG/XANB8/gBpMjftnf9B6EYVYV0M3xdeaKSjQQmIKHmbrNZpjaU6mlNwgTBnZzEQF
         hGGnSovGmdHLgREBDFVpenSDsMozh1hleZCO5/f3gq2XUT9EMCJ8mrkLnrGmD0j2iBgR
         KwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790808862; x=1791413662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMDqFIaP1O55HQyhPMTHQHywZWJn4sXJBK7hF4BIEBo=;
        b=03y4ePanz60phqDOOM+2W4q4O6jWL3A7AwvbZaOrihinFv0W6g9MGcytutPu7nPqtr
         B6IXJ/yLRKZnU5Zb8vCwKZQyThj0dHQmyCKlts0ufmnSZoBiwHweC0JvN+DB00YFPcbW
         2qWJJc8epvLMtKWRdm25D9BEJDqPRJ3QKtBLoa7jsI0oZhED1UDcsHDrnQGu3R8co7k5
         RQ6/w2E4srcYEAULLyWhXXbpBgS+boefQVMeC9PTG8Vl89rH3DdDBp4Kfd7FOO1TbqvE
         INaMncWTkmm+rljWQx55u85esnbzbLlxGuw01bqFiD4/0/3voCcqWITsHZzNYLhvro+3
         sa9w==
X-Forwarded-Encrypted: i=1; AKwUvByl3OLTRE5Ymru6n6WTf9w6SWYXSLXb0OZV244aS88kpxFwdCA9c5//fXfKzLxOjQhCTTJP5RWRwb35zy0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3LoJ9XzgIsTiKtIDuufY/5RN5yE5ol9alNmIT0m1YSKeD5NLV
	wuKvlEPJ0dLFvjhdRRlGD1GJrEa38x+MVloyY2Ak+F+yoqx9ByGy58RcXbSkZS86nYc8gKDbXb6
	kS42yGbQNeXYg1YRTSUToJRV8Fy3lgDseyANlYMZz
X-Gm-Gg: AYBFou3VWtA7s0SPpbsrus6otqkHE8VAqQ04SmeisvQd7EtasH5lxg8OpPMFUcJI5Gq
	Tjzedoh3UI8NwzWdb9cs+cPxxGzc0EA+DaavAC7gPIalX2etueVfMwKMPo5mpMjU5ug1I2gNpf+
	eGG6R6xNKl5RTDmToE0Bw+RBOVghV6TPeZsQyrLZDv7Fn2nhvGK1m8jVnLVkkozRVwGk8B8e/Ii
	h/s1y+mpYaS10p+Nb5Ys71rEYTnw7JfAaAiHzTxQCh1Gz4/fvrfWaICF6QwJNFPMOOjGgzEcs72
	1lm+k1LYxfC4QbhCZCB5+B2vuKCrCIZ2lQTOER2MNolsw9aKq6vRp+X86IdXeqRW83cszZrqDAA
	oL5aQwPXWIy46wMCF29eV
X-Received: by 2002:a17:907:9449:b0:c27:420b:7c79 with SMTP id
 a640c23a62f3a-c2e23e520f1mr221873866b.48.1790808861871; Wed, 30 Sep 2026
 15:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930214735.3288780-1-joshwash@google.com> <179080528731.31693.11268580346361726174@kernel.org>
In-Reply-To: <179080528731.31693.11268580346361726174@kernel.org>
From: Joshua Washington <joshwash@google.com>
Date: Wed, 30 Sep 2026 15:54:10 -0700
X-Gm-Features: AclHuK9fnFHxOP4qsQ_Oocv5ijMmdZLzMw5uNrAYSg6n06sJyJ3ZPqhXptnZoq4
Message-ID: <CALuQH+VEopCYRwDmxyaLadDtMy29m5=Li9YowmjWpZha_SEMjw@mail.gmail.com>
Subject: Re: [PATCH net v3 0/3] gve: various XDP fixes
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Jordan Rhee <jordanrhee@google.com>, 
	Ankit Garg <nktgrg@google.com>, Tim Hostetler <thostet@google.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:54=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

(1/3) gve: fix XSK buffer leak when rings are stopped

This issue was hit in production.

(2/3) gve: fix XSK buffer leak on error descriptor

This issue was caught by LLM

(3/3)  gve: fix napi_disable deadlock when attempting to disable XSK pools

This issue was found in production.


>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

(1/3) gve: fix XSK buffer leak when rings are stopped

This issue was actually triggered; symptoms included a buffer leak.
Reproduced by continually performing ip link up/down on an interface
while XSK traffic was flowing. Eventually, no more packets can pass
because all of the XSK buffers from the UMEM pool have been leaked.

(2/3) gve: fix XSK buffer leak on error descriptor

This issue is theoretical, as RX error packets are extremely rare in
my personal experience. But it is plain to see by static analysis that
the buffer will be leaked if an RX error is returned, due to the early
return in the driver. All other XSK-releated paths free the XSK buffer
in gve_rx_xsk_dqo().

(3/3)  gve: fix napi_disable deadlock when attempting to disable XSK pools

This one can be very easily reproduced by enabling an AF_XDP zero-copy
socket, and disabling it. The deadlock becomes more apparent when
attempting to enable a second AF_XDP zero-copy socket, as that
operation will stall waiting to get the netdev instance lock.

Snipped stacktrace from
https://github.com/GoogleCloudPlatform/compute-virtual-ethernet-linux/pull/=
96:

Workqueue: events xp_release_deferred
napi_disable+0x1d/0x50
gve_xsk_pool_disable+0xed/0x1d0 [gve]
gve_xdp+0x14a/0x1c0 [gve]
xp_disable_drv_zc+0x89/0xe0
xp_clear_dev+0x59/0xf0
xp_release_deferred+0x20/0x90

>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

All of these changes were tested on the GVE driver using the DQO RDA
queue format.

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.



--=20

Joshua Washington | Software Engineer | joshwash@google.com | (414) 366-442=
3
