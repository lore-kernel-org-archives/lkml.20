Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573329;
	b=4P8zNG19MtFW/2lUGW3Rdv0xmrxDml9vVtzKOoIyMlN2rx2hClWIzcgPhEarccdTRRvY
	 l1LewQJYjNiGn72PcZRAon0yFDOQ4+c8WacLbRxwEot2FqCAebxy8+Lq295fAddtqFpIa
	 MaCqYtvjmkCuVF3VIjOnHexyXHC+l0dtxEAQuth75PH/l2BoSXnn93Tb1hKpLnofehdXY
	 x3B+89e56v6CHcYkPEQ8J11DldsGLJ2JJx13o0/TCrmEkupFH81GbTZLI92Ktx+YIwYdd
	 NypFydQ62H8j/i2s5UN0wa4XEQGU2ACGiewm5HWdpxj4JYTSivQbC43SmpkqrlrObMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573329;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=T4cci4gJNuFTfolxn/J6fu+B818vlNle5g1andJTAjs=;
	b=oVt817YLFzFdve2rutuuDSxL+FLi/mvKoI11jevPjso2U43a/4nfOek/7zCGgus4FOqW
	 rtoYhwmTL1iOEZgDsme1mWXfgmj69IawzmeOaC0VE4XRF+rGSJng+HRoAOsMRSnGuBeSc
	 XEKsH6/J+qxqaygYt1f+sZmdNnVw40CcFd8koX0zeAOoud0XSknxzKQwChB0g0gm+YlGX
	 KkMVXMRYsS6yIpKkcu2FQCrx9nTEpcIx5GxZlefrBDYoma9KeOCG9qLYc3JklHr5tDuX1
	 Jx+y52koEq1I0jIrm0Thp0jBHEHvmgJFox+78bNtlBq4bX7SwngEgC0xvZIhuJW9aow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2872606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2872606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eac01ff101so154018e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573328; x=1793178128;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T4cci4gJNuFTfolxn/J6fu+B818vlNle5g1andJTAjs=;
        b=VucJs2p3t6ACBY9ybq2h0DFCZwe4T4/W24PO5mzZlBPrAYRyz0gxx0vidd+WSHKIuf
         4IXXaCjSd8Fh3eboSmkshQg7xXw7vTw/9oEQoO5WTsL38O8Aa2QwjL0MNM5kh0Mfa8Iw
         V9nfb+0gZ7uhKsknpvS3a91P9wR1Ugh3RIRXLqjauWdj0TEJFRFMxdSdyHstOOoU0sj3
         h6ESSERJ/MpkFxhwPmI719CcTBZxPNacMvGkAlHfMhYT9Ryb2xvsxUIwbx4tTBjOhMRz
         2/4emHe7FxSRpTvyIWpnAi43g0anjHDkU1KZyIV+LCcCQzF11a1USkbRqn7k2e1QsurI
         X5+A==
X-Forwarded-Encrypted: i=1; AKwUvBxxJ5BOneIkyoK8k2RC22S0dGAerhexe0sEEzHDVaj2oXy/et2bdF48Sfm25RJO1ZzFsolC2P8KxuM3e4k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJochIrCDWEp38IdQ/Td+bBkKKEothZS9+fNjvF3MtOKdnFDPpQ
	U+goO6Bjx5GSCpDu0vkKEAmUFskoDi6EaEpfuorJWLPxU5XhpRvKb3tHP7s+4ZyC5NY=
X-Gm-Gg: AYBFou3Jh7H8rbVpJtt1I3rKNedtXwmLlSuBNEKR9ehf9DXXak5dmbtdD19gxTR+wc6
	zSHbvpsoUbAIXveH0E5Vl6jB33GrAy45gg0wQcWtrwgjqGdEFftHNQ9Zv2ILZlqKfK82vwK0brv
	AZ6BhBJV2WsqzMz4/zyHQDKqTOPEBEF+/TCp7fT/bPRM6rkAfzp7dZkdQ2e5KrPZuc8P0EMVIH3
	LoKOZsbPpNgjHMuVW/aEEi9t1jpyAiR5oAOR53OR0m05qf9kXEvdW58M3LYuINNUgzQGNLJYaJx
	C7lpu+/I7pcnxys6BDDs7kJ8uEZdWeQe1i4soD5PvqjxBYcME7OkorLguyjoYKYSaeDuRrud794
	8Z8TGjOxFs9dEwkzUxx6+Y+zwcF+9mMpOI4xySwxXJHGGLESwtf8/j1SrA9Iu1KpG2PsNKiFYI2
	CyH3vC4kIheZ0UwVizlXfBSnGPekUbZkgQ3iHXFwUt/i9KrKJuhvdDNWwspQdQ/8tzAIgTvhxet
	++GAACTJyGNIeUK9sGqFdeXesJStDNQHVsKy7nQJolVDwPUEm2r202Spt9D8CJmFtqOe/8pqZ4s
	J6bAf3iSCCadtkWDiA==
X-Received: by 2002:a05:6122:4695:b0:5c9:a60b:e5c0 with SMTP id 71dfb90a1353d-5eaebe835bemr478353e0c.16.1792573327555;
        Wed, 21 Oct 2026 02:02:07 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97d336fsm2449035e0c.9.2026.10.21.02.02.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:02:07 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-98c7798ce74so123984241.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:02:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByBf1kKVTACT64+PhbyWAPJ2Em4nLM6IHuugXZdPU5luYxnIB6YSwcWNbL4OuE8sUktcF3HVXac+zOMol0=@vger.kernel.org
X-Received: by 2002:a05:6102:3709:b0:7c8:268:ecd7 with SMTP id
 ada2fe7eead31-7cc92739b17mr365886137.23.1792573326757; Wed, 21 Oct 2026
 02:02:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017041419.311921-1-daniel@0x0f.com> <CAJpaz4abKAkDznoi3gczYHNQMF-j5cSajtG07Jws8LkFY9DZFg@mail.gmail.com>
In-Reply-To: <CAJpaz4abKAkDznoi3gczYHNQMF-j5cSajtG07Jws8LkFY9DZFg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Oct 2026 11:01:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWZTwfbXqV=oiaSseGXZNKzWD-bptZVuhbCnXwkt7+WoA@mail.gmail.com>
X-Gm-Features: AclHuK8GyFWJnCZctU9cyAk5_YSIDGkWTC6HLWIJClGOfTDRGxXReM4AFtrnhJk
Message-ID: <CAMuHMdWZTwfbXqV=oiaSseGXZNKzWD-bptZVuhbCnXwkt7+WoA@mail.gmail.com>
Subject: Re: [PATCH 0/2] sh: Fix IDE on landisk
To: Colton Pawielski <colton.pawielski@gmail.com>
Cc: Daniel Palmer <daniel@0x0f.com>, ysato@users.sourceforge.jp, dalias@libc.org, 
	glaubitz@physik.fu-berlin.de, dlemoal@kernel.org, cassel@kernel.org, 
	linux-sh@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, fuchsfl@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Colton,

On Wed, 21 Oct 2026 at 03:05, Colton Pawielski
<colton.pawielski@gmail.com> wrote:
> This is my first message to the mailing list so please correct me if I've
> done anything improper or non-standard.

Thanks, LGTM.

> In testing I could often lock up the board when transferring data over
> SSH. I don't believe it's related to this series and am fairly sure it's
> in the 8139cp driver. I have a candidate fix that I plan to send in
> a couple of days once I've tested it further and there's no more
> lockups on my hardware.

8139cp is udeed not very reliable, hence nfsroot didn't work well for me.

> Tested-by: Colton Pawielski <colton.pawielski@gmail.com> # 3x LANDISK
> HDL-U, ATP865 rev 06/07

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
