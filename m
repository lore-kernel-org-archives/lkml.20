Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344460;
	b=4B84hjsGJixGfHlVCZMIVX6AkQRV0LdDwv1+e9vsXZHCtoh5Rl/7z3wyKX7Rqy9Rt+Qk
	 ZETQZIZHjIrJeUNfxBR3lWIpNG4eg0n2Q7cPY8kmdrLtbu/mMVgWmvkE3sm5XGfbOi3FY
	 HuHniDo6aLfMkNF7IP1wdfavD2+IxFLmUlIwLLCiX+qiZN6GJyPWhuiNZ4/yYAu/4mkPr
	 JK6sFM2jPxuCLvI2nJ+p5L/4uoBwP9mzoeWzvUQ31zOkTexMkye0rbo20qYO0c9c5/GzM
	 tF/dVsoTDz37WXdtObYwxwfJ9KF4L90K7WzcjmC3Q0RbNu0h2+khS007mUKb+aY2w4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hDLUHlDELwoWZCmTvGw0qzaVx27lJyAdyGftfx2GJak=;
	b=gZtFAviPnG5KTBOem4AuV+ZmQWjzLkN2N7QjCJ3SNyI2R8cnrn6EmkEIArl62xCHeW1S
	 3VZak+iaYNgrdi36vMFrhoBAq1Ba1hu97SX9X56iYAkbubVFA7bwIUTOIlEYDI/Hp1qew
	 g4NV4KXxYXpz/oGCNtslfHNzdYL/If7Q2RT4X6WVjD3BjF3joLO2PCI7y3AZbvPbU0DuE
	 Poa4vQ5KPNMGCnemQLX8mpRmgi3g5Jxa5GZZ663eMTYQqBCJln2si5hIti0WOTLxbKE2O
	 6CZVod8TYutdO755Xo3punP7YKcCYbgShuZ9SSh0HjviRB4mRjmIBwDWVQIjSIxnSxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OK9Pka/U";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B3B606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B3B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OK9Pka/U
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1712465f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794344458; x=1794949258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hDLUHlDELwoWZCmTvGw0qzaVx27lJyAdyGftfx2GJak=;
        b=OK9Pka/U2GuWO3Nz5xYdLVshL8cUBub24v8bD5TtQklTl2g1u7vgxIV/c4bnPd+orq
         /MzAJdLOOJXJzg4e4n/LQORaYBDQ8wn3dEJhXzB7ZLFZPek9F+DtWvsPXWhR3dSjGx/5
         2uKrVfKFk8I1jONKFojsDXrIzfIpl9ye6WW3K9hfPeHijSS/9o4/yNOjYwJkrjQuNM10
         /H6WiU3LzRiCKMgNdk9GuLMT08EKAsYdASt2ymV4wiE1bWYtdI+kN+vai/HF48BsJV9K
         VvXbyBmTAzqjRJ0nTKywkVj/d9I72oQkYWABKUnb83RMk53/1+WpvnXWB3kcIWZkVVKg
         bc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344458; x=1794949258;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDLUHlDELwoWZCmTvGw0qzaVx27lJyAdyGftfx2GJak=;
        b=jY2E3woy07aFde8D8XBfij+ucME/4VKEQKpeI6WfkaxsIQ9Nl8LZgNqsQxXR5+xpsA
         O5Fr99vciBZxg2HA0PMAgFAT+8Dh1t6XXTE4e/DZc7LubioNtIFpAuHKkmZll+SqBEPU
         QjJ+Pw3rFqDWOYgt0/LAEwDByENMiUzJJ3T557KOC1jHpAS+J5STwL40iFrJ6v8jZEkJ
         F9npER60bo+rIQ5pkUcYt4Fv6AfqThJcOx/iHuIPllIlVRCi1JI2P3dzWkE7YYmK9vVs
         rw9HeCsLoOHdDw494n3PLtOyh9qWRGhvNTuw3amgKAlQmLB/7HRY0YYzcfyFfFPLghBY
         2bmA==
X-Forwarded-Encrypted: i=1; AL+hErGrH6iq14rFDLMNI6HM59IkXmI6HU2DYIpsEfcQv63rWL9mTlHZB0fIiScruxCBI8aNMRo3MICKIq6G2fE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HAiPo48xReGFrurTaO4XW7vDnPgNG+hoZrO541zitjQcXG1RB
	X9sEyVHKIALPGwG51gWi2Jd7LH4v/7P8Z5INQ2Fe0N0cqFlhNI9p9rMI
X-Gm-Gg: AYBFou2IbqHvgGMvA5wEJuW7usma6Q8I0BvjpbqR4KVvI05k+iZLJAhGlAf457Qvcp0
	eCcg6pOOdPkn5arwx1x1zxYBIMo8mMufn86PU1s9Bf5RBVOj6L8R8TWVZdHPatZgpPGnOaOkCnU
	uHQhafcib9L6m/ITtioDLw3iBPXRi+/3vrSXCiFbN/sZX9btw64LOJfHmaTJWe2m8TMqmjzB+W9
	uInv4xrneF5zWWf0CZskB/xxScEg5lkmgtzOjGHsJyIudYQmcr5VY7WCzq8wuHM5Hn/4dymQa23
	3jpcrC4cw+4G40G4mdLziuCD4fO2Cx7qY/OeBpEI40m1jTHaM+fysalV50p497RHvprERtoNV0+
	HA1GnaOM1K0ypj6vd7wB4BI7F2/XJxbhUglsA/y5Rf3iEpI0CjMmJK6oA28Q/GoRIIkyx3GMhyf
	IA7a2j6yAizATACiTYZNPfYs6q1sx0sMCKtvrXptjSHHvnqe9z7gxBdtLQF2n2kYCCEpkSVbkTG
	Ud/ncjSO2I4xHMh55pCPteNWbw8jDLm1d42DBPeyMS/skJQuIqB1F8y/9E6lkaZUlr2VDugxONP
	bhgM3KlowPnl/DtJ7Er6QgtLFesJxZQCvVtFrBaUUq37/096p8TJxLqEbAoCYnEVSg==
X-Received: by 2002:a05:6000:40cd:b0:490:a3e7:8af3 with SMTP id ffacd0b85a97d-499c764a963mr279177f8f.35.1794344458068;
        Tue, 10 Nov 2026 13:00:58 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c9b1sm6460691f8f.6.2026.11.10.13.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:00:57 -0800 (PST)
Date: Tue, 10 Nov 2026 21:00:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Usama Arif
 <usama.arif@linux.dev>, bp@alien8.de, dave.hansen@linux.intel.com,
 dsterba@suse.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 terrelln@fb.com, tglx@kernel.org, x86@kernel.org, kas@kernel.org,
 hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
 kernel-team@meta.com
Subject: Re: [PATCH v2] x86/lib: Use REP MOVSB for large memcpy() on ERMS
 CPUs without FSRM
Message-ID: <20261110210055.0ca9fc07@pumpkin>
In-Reply-To: <719584E3-A730-474D-9061-BFF35EA4B02B@zytor.com>
References: <20261104222806.1826508-1-usama.arif@linux.dev>
	<CAHk-=whPF8CD9zC960jPUi2rMrJ_pq9ytdSYqWoef-R6AHsfXg@mail.gmail.com>
	<719584E3-A730-474D-9061-BFF35EA4B02B@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 12:17:51 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On November 10, 2026 9:53:07 AM PST, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >On Wed, 4 Nov 2026 at 14:28, Usama Arif <usama.arif@linux.dev> wrote:  
> >>
> >> +       ALTERNATIVE __stringify(cmpq $0x20, %rcx; jb .Lhandle_tail), \
> >> +                   __stringify(rep movsb; RET), X86_FEATURE_FSRM  
> >
> >Let's not do that.
> >
> >Putting magic things like RET in alternatives is just a bad bad idea.
> >
> >               Linus  
> 
> Why is that, *given that it is in assembly*?
> 
> For C (or Rust, or C++, ...) it is obviously bad chicken.

Because RET is a horrid sequence subject to a lot of patching
to avoid multiple speculative execution issues.
If is were just the 0xc3 opcode byte it wouldn't be an issue.

David
