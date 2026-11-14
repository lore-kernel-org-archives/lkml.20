Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674064;
	b=EYIxaPBPtBF70NkLn8goRj4ScTy1VU70cWRe/NfPozfRmjFKDJHq4EvRLQTCmEdReEms
	 BqoTIWSu74Vpt8p11DhPFKhGRJt9INPLPP8o7vPpo/91NPBpSPhZA+zDcdRhM4BJEpW0u
	 +EkklETFtpewuNGSAaI2x1CVQytND4hXtYqamamzB1x1lPQLd00CzMVjzS4E9qS0qH82G
	 VRBZWrIIxnpYckimWp/wBhZuA+fy0HJ1OUJkoq5KBurySsQcyQ2L+eRP3wrruJlyMN++v
	 MQvdudcsG5KO131fRU8nc1qNiOtD+ZK6662CHWWH+TjTpUaPjKb2M9AvQh2uYXEvlyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=uIusyOIhmUCph+qRkqcgrTGen1lvnPy/jnK8ZUFUW0g=;
	b=i7H7tG/iOTj30Xrez8s2kfvYVeCyQvJ0STsCAxNyzmJsIr4sqn90LaExMNTuhdJ1+HFo
	 jRs7mB7Am4icFx+l4QpbFgYvo+FXDUdAgoGcyDpHtgbp7h5W5DFcyqTI64XwrJvOw/mlv
	 u+qqHzL0elVC4b7DkX3YFFZL45D206MfHmmXXbTBFSy05eM37OcllO5Q2YLVBt5CitJA0
	 0NKmcZ2eOAVSYV16DPyHNIw9Wg/1JB17PXhVSnIY1IL03ghNrO4jsuhRFVkPfLAl71PiJ
	 T46tq2GGRyJXx1ErDurT3+erLJ7T5vgHTPls9p1MlNM3Oty69x0OU1vWIqlewJlAQLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6FERMf3;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9FA606A8A4
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA9FA606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6FERMf3
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so2314051b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794674063; x=1795278863; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uIusyOIhmUCph+qRkqcgrTGen1lvnPy/jnK8ZUFUW0g=;
        b=e6FERMf3c3yD17BhvoNIpWQb4t45y4DIJCQ7OY3vra4DI0ay8y/ksjW3Y7VLoFySG1
         Z8og4d0qXuFTYi6wVdTsH2/fpl8pdHLA3TU+3K/xEtd/iBXFRX+7u6yn5IUovnzvVW44
         Flx7ZK6fRYplHSRb/2KrldN85TLfg+tKs0yiVzXJP5eVcI4jUntt0aZrfiZNjAlqdov3
         oJfznTuyHQTuV4U87ABE1tPqnmPwqj9kKM8OEtREOEapq6RLaqYFO8Lgr/V6S5AH73pb
         IEtXE4+3CHIrdshJZsMMd6VViw2FjZr1T3+0D4Fy/ezGpMA01VKBst4MtPZSG1sDeMTs
         8nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674063; x=1795278863;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uIusyOIhmUCph+qRkqcgrTGen1lvnPy/jnK8ZUFUW0g=;
        b=T5xEp/EQU1hWEnV1lnILlD6tzCiwTlKa0k1c9mH3Q4OVVK8Sz2LgRM5TTJz8rgwGGq
         npE7fPaFPk3XE9nS9B6GSq4QDJnDcgjpZBM5EAn4k0j+k12n7EOd/OkBcL53x85lywAz
         zt9EIGtZxBHSZN7GtOHpQ0WWOn9wiLKG3dSTQuSlxqr+aahXPkvksdwhVPAGC9lgYT+6
         r39a2ht+JjhgTrr5Tf+HqOVoOCM+AZ+8knnBtvNx3HKfYjjqErVRd7YRmWEIUpX5guXq
         GzM+yKC8AxDW2Xcfx/pP7NjdNdu4lUw79t6jGGlDam+ctB1h/pVc/X8bUZ+r0RiVAsN7
         cXjg==
X-Forwarded-Encrypted: i=1; AL+hErEwsGcTkeHzbaUGuTq2BshQXom48PzXDRPNYlOGfEXdx/0e2WLem71Upv+NCDokLKO3NbWQjJ+ltReOddc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L7mJKx3zjfGpqh++rfd7XIcsQDcQMyF2WE3fk88k0V9o5LFzu
	iE6w8k7r8dfBiUxGUo+VbeTuovdZg9iG0Atqjhn6dHWFh3MHrdVU8M6g
X-Gm-Gg: AYBFou1PZdOFeRS3i4Hf7EQFDqkrGMbcEcv8Dx7Kbhh+EOmKPd2qLmJp2+mH9eiITGF
	D/w4LJdt9WnIuyKpGGLll6sgwU3K+8u2+96c3Mh+1gekDEkmQAzTBIJ9NDcTsoHZFZ7Xviqr7DN
	f20xF5O2ZaGDjHE3DR6iZReQbafNw1XgXXCKa/0uoQfejUVxw2q6UKaXeG8Va5bdsS0j9q8M5/N
	S1YpDvGT+b79IGY/+uzTTLG6fgTOIzvLhgaZdDAfHchg5R4law7lr840A/xssoph3jSz9PaayWf
	zi7cx2NmtV1GP9zqnM1VCCZaOBiV/3pRLLz/j3LgM85DMDQuZt82f9k3mx6BUw11mxtu+FYvJrH
	NoovezZ0N3BsPqCQrsqD+ci0JE4x6WfJpR+z/psYi59HuTCTY0JV5czKjUf+pL5Zl3tYOqb8507
	ImpuIuXWU1Hiv8+XwBmt1uiQfum7Zj5FYdC8tImVjByD5WwTBonZ78ngTC+OxRrdCGOKRv0rF3H
	J3M05guMv+Ac59a2k4uJJBJuDZgIel0n0EuY6+n/XMM5Y3B/Ahk495h/IdrWlHrB0qmosgwkmGJ
	SuWIcXMev6xVdNjU+cDbzAopstFXnfpJ5NB3CP0SRB2oVty7JC7tltFevq+Pd9/kPzyOldppyu/
	pkuZjSGM5G4/cyWiIXSlMYO4JNAiETON89Q==
X-Received: by 2002:a05:6a00:1ad3:b0:89e:fe2d:abe8 with SMTP id d2e1a72fcca58-8beb3b3d902mr5766668b3a.8.1794674062835;
        Sat, 14 Nov 2026 08:34:22 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2b190cfsm2173447b3a.51.2026.11.14.08.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 08:34:21 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 16:34:20 +0000
Message-Id: <DMV2UXIE0LQ9.29AJR2CMSPH67@gmail.com>
Cc: "Eric Dumazet" <edumazet@kernel.org>, "Neal Cardwell"
 <ncardwell@google.com>, "Kuniyuki Iwashima" <kuniyu@google.com>, "David S .
 Miller" <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bpf, sockmap: fix cork data loss after redirect
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>, "John
 Fastabend" <john.fastabend@gmail.com>, "Jakub Sitnicki"
 <jakub@cloudflare.com>, "Jiayuan Chen" <jiayuan.chen@linux.dev>
In-Reply-To: <20261114115222.180345-1-omermetekaya0@gmail.com>
References: <20261114115222.180345-1-omermetekaya0@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Nov 14, 2026 at 03:46 AM Ömer Mete Kaya <omermetekaya0@gmail.com> wrote:
> In tcp_bpf_send_verdict(), when a corked message is redirected via
> __SK_REDIRECT, the cork cleanup path unconditionally frees the entire
> message and sets msg to NULL, even when only a partial send was
> performed (tosend < total msg size due to apply_bytes).

It's fixed already. See bpf tree:
commit 13c41b87e4a7 ("bpf, sockmap: Keep the rest of the cork after a redirect")
tcp_bpf_send_verdict() puts the rest back into psock->cork
and goes to more_data.

pw-bot: cr
