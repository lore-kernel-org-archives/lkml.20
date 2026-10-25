Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792919632;
	b=xqFKjcc+5JAeWlpG3TuU7iFslSdAs1Jn8S0TianpK7AvMGS98KBF/oqIBO1HS1HISK+l
	 J6Sl9vBZWHelBSYqsfuk5ouOBzIS5Bnl7JbV7yneLrm3Iy9NZ6N/6P7AiNsC+eSz7vmAB
	 bItsZFldBzdGB64tvlLMN4D8/MZbwVGLCGTlxQUuVMvsykWa+q5c5YF1jQ6LOLBQbKnEi
	 P6vChXRiOK43YVrkyoHndnXTvvZdCnarHPKdWG1Bo5iOORDm0dNoDVbOL/0OuinxKZqgD
	 Ej/QmeB/JDJetExxjgDR9VScOwTb7ycMVV2Qn/DnKRklaLlLxA+1WwGeWAZLRRIz2fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792919632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oBabjhiD1rQ4tbEXY7drQjt+LTH2wSsXeFN2ti8cL7g=;
	b=lJnfHbKDGy9pWNKG0Ml8b+lMesGH+fd2BIP6WaVguW67nu25iA0qAIuhKQ4ovqoJ5yIG
	 X/HXGv8E4DNKFVUA8TxvVxqrMVtT3Ht7mfwNk5CvNNbbsXHNH+ZUMTPaelQBomRCzJtfp
	 qht6YWeV5NkBMgkCklwZki3jlOmXmM1cNAwzSXNZoKgjciVmb9z9yV+JFlODiPgr5idY5
	 FQ5sqHDoeSj8vEJjYXkq2gxBs9G7bwb8uMIf6OLDz2O9B4WK3n6mnofZR6pnd2t+x4htn
	 qvEraMhHkJuatZp6ejacAJK1YMCeb5U10lydrKA4klvRWF/kymf3ASKqkzpMCr7j/CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Pa9whJpt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CCF606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3CCF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Pa9whJpt
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so1465989b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792919630; cv=none;
        d=google.com; s=arc-20260327;
        b=SATdonWEkE42aA3mxTzvG9XbzfIg4Wqmvak9JVer7rt4MN9MFQB3iBiYALCwCtfhHN
         6HMv4/bH/s3RNrgsba11lHS/drteaXf6f7wUmjZJ7H741RePw6bij+/UbOUR+UL+O6lN
         VDRP9w1ausBWv1ITVLapWWFfKKqswE4jIsYnlMZmTQUd3gLyrLB7pYDzLwFQ+Nc6yzJc
         GCXbuxupcdTYT6x3tDqueSxioxUQAw9eE9nwoZjERyt0/eZWr0Dh5DtCQCwI3w4RWyJp
         udKXsDwlpkIePG6tfP+Ul6xRzbSPdP5or08uS9h2BssDbrvx4jPnG42EJMGMsitfdbHN
         atQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oBabjhiD1rQ4tbEXY7drQjt+LTH2wSsXeFN2ti8cL7g=;
        fh=GnNanPEDSTboYsK7VieqETkGlhEJwfZCsUUvWBl3Us4=;
        b=KcYFpOtK6vvY8lm1Xqv5hDnosdiBU3Plie1K8F9o1+jl2MgvQTPAfAfk2HIxn/Fpf0
         u5Vs0kieaR9YOpHuw+a6PTVlpLaBhMkT3iDzmXp5UfdcW+ZjZS/9w0V159sagUqS8Qs/
         tQHUC88rwB0Wxid6teYOWgb0AXCkGd/LWaU1JaaLv9miDXp92KLIq/USmqsQ/H7LbEB1
         UEKyKHgN7VHZ3DWkqE+FJ32AV7opaLaEd383Sm20K2YzGL7jvu7Sq6wq0wd4JuF9743B
         /t4TQZt2TYkiDITV95CsxeIB1CVKdi0hvQ3vuxXRG8nOUpHvgsImOZhCvYe7rm96ZM5E
         hpJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1792919630; x=1793524430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oBabjhiD1rQ4tbEXY7drQjt+LTH2wSsXeFN2ti8cL7g=;
        b=Pa9whJpt2+pX2IKfUr0v3K+DhB34016JeiiJ14fdqzNSpDp/m4md5iSan+Cv+NaX6d
         XYmbV6K+4LBRy2L4k+yS/9vpSnXBbt2ehXQPqGu6uL/Pbjnqf/OIslPWttavKidZJLha
         ekZX7eQWbR9g8oX7anwaPJfoCMxm74s28d9Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792919630; x=1793524430;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBabjhiD1rQ4tbEXY7drQjt+LTH2wSsXeFN2ti8cL7g=;
        b=QYTjEXV2l02YxxP8kRII2w3LWt68HpOEiJ48FCCs5dEZZq0h3DId07Rwfn2TuutzhP
         5vW/WRg1lwa3/pL4Y9DmYZzZoE37Qm7zIqehOhxm8EX0HrWZgTRHs4ypNtPM9K16EVsB
         iTZ3zj94KKjktJH3BuwNPQJkl/GKfPEu71j9JLNlHOZjoB8UGIbf+7yDXyUZ5lfQfd10
         vswbOCpiqhzDSOj6zt8OqbtCNXxE9b7vInUfUmzdLfRxMwdyLpSe1CQWy1yR7jsrzajN
         6BFWdvpTvotTiOH/7KhGZ2b5xAnN8BSQjKOY1uLtWQ8TxI1ecu5jA5DVNxZkCaDqoelS
         OwPg==
X-Forwarded-Encrypted: i=1; AKwUvBxCL2EQkAklp2h0FfRjgyQzCGiLBfjDtacK+KqGkNY7G9a3Riphoi922B+SqjBxrbvXtMu+hlGXtXhdfks=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMFTMU5RPBrzNi6zwWPmVqvV9NuJTvVuL2jxaBhnzkWlDZ1OvR
	IZaN7FcNEXulSIkNkALmnkrf739cBEbRUPt4p1sl704Wugw/4wHdjEqOYq23mg/eM3ymrwwscV+
	z6D2fnewYDz2iFXeG03qpwFXbedXSKS9SZ1Mtqwxc
X-Gm-Gg: AYBFou0yxCXpnGCj5rtY6csHE8O53EFeJyMu6v9KW++K6j5laEjImpL/JsR9kNwVy7r
	3hjH9gXjlfNcAk6PlpbuzcMQP5ECgUqLcD3RLNtw3Zc1tPF33Y1BsgKB+Xn/McpwX005IE8xWki
	y3FxBxYn+Yf8Sxi0kDjmrJ/Q/Eg8VlwAJJ5qIh6EfMHs9HXlQ28eFjEwBaOAWdQQ7SLw8MK0wqQ
	qzlvlSCBx6cBxPxF9WkE4hNMKtOk/Oh5aTdbIS/RrN1ioy4A81nmaWkx4IFICfBaPzBub979rZP
	90bLtKVUn8Mb8h+2Av0Pm/EiVke+a+A1oafhPV5uVATTDaSIOrl0vUUQsOrNvXEhweWbXYAzLPU
	NTcLcMiVwEgeQblQh8OE/1yTN/qFeN4IlVoxPDaBNJ+iHsJGAxF/nw/5SQvXQgyWFkIyUmB967d
	B1+rLwF97YftZRJzo=
X-Received: by 2002:a05:6a00:a115:b0:876:194e:b8fe with SMTP id
 d2e1a72fcca58-8a366f660c1mr3180660b3a.26.1792919630278; Sun, 25 Oct 2026
 02:13:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260731140533.566493-1-david.lee@trailofbits.com>
 <CAM0EoM=UDkGKLivsdDS5JaVMuefR4jLC2rAWJcOR8XD-4N_EgA@mail.gmail.com>
 <CAC_etQESLytW5rhp0GfZU-mJqJhwk202a5u_nTXZ7W6wJN=AJw@mail.gmail.com>
 <CAC_etQHv2EBYfAhfkYHKrasnJAyDS+u5+a4os4aD1eSmKrck_A@mail.gmail.com>
 <CAM0EoMm=KbZgcGqLHDFee3mM1GxuNCvAWObP_K4AxsGAoEAedg@mail.gmail.com> <CAM0EoMmxpVv4YRoQQ3jN+79OKjaT=ep3+6jff8CHoOBLJUej3w@mail.gmail.com>
In-Reply-To: <CAM0EoMmxpVv4YRoQQ3jN+79OKjaT=ep3+6jff8CHoOBLJUej3w@mail.gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sun, 25 Oct 2026 05:13:39 -0400
X-Gm-Features: AclHuK80D8qgJg44CQznpEWEuYQO3yP2tYU2BMNxj7xLNY98_DjMCZ-FphGgVQk
Message-ID: <CAM0EoMkOj8zfwB8WuTEOxEzAoGONg=2ZODehVMBzbA5c+EebZA@mail.gmail.com>
Subject: Re: [PATCH] net/sched: sch_qfq: prevent aggregate self-replacement
To: David Lee <david.lee@trailofbits.com>
Cc: jiri@resnulli.us, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, Kyle Zeng <kylebot@openai.com>, 
	"Dominik 'Disconnect3d' Czarnota" <dominik.czarnota@trailofbits.com>, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sven@narfation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 5:03=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu.com>=
 wrote:
>
> On Thu, Oct 22, 2026 at 5:14=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu.co=
m> wrote:
> >
> > On Wed, Oct 21, 2026 at 10:56=E2=80=AFAM David Lee <david.lee@trailofbi=
ts.com> wrote:
> > >
> > > Hi Jamal,
> > >
> > > Following up on this thread. Please let me know if you had a chance t=
o review the attached reproducer or if you need any additional information.
> > >
> >
> > Please resend to the list - I lost track.
> > And if you follow up after like 2 months(!) you will really have to
> > retest with the new kernel and likely look at the list to see if there
> > are other fixes that cover this issue.
> >
>
> Before i try to reproduce (then proper review) please resend
> addressing the issues raised by the sashikos. They are legit.


IOW, send a v2 with the following addressed; I may have missed some
things Sven pointed out:

1. Sign-off chain: the patch is From: you but only Kyle signs off.
Read Documentation/process/submitting-patches.rst, add your own
Signed-off-by: as well (and a From: Kyle Zeng / Co-developed-by: chain
if he authored the fix). As sent, the DCO chain is broken and the DCO
check will flag it.

2. No blank lines in the trailer block, and replace the prose "Bug
found and triaged by OpenAI Security Research and validated by Trail
of Bits." with machine-parsable trailers (e.g. Reported-by: for the
finder and a Link: to the report). The "Assisted-by:" trailer is not
one of the standard tags - please drop it or convert it to a standard
one.

3. Add "Cc: stable@vger.kernel.org" - the Fixes commit is from the
original QFQ Plus merge, and this UAF is reachable with CAP_NET_ADMIN
in a user+net namespace, so the stable trees will want it.

4. Use the [PATCH net] subject prefix in v2 (this is a fix for the
current tree).

The patch looks sane, as I said earlier, but there are just too many
incoming and too many fixes over the last 2 months - so i just trigger
our automated system to ensure it is reproducible first before I look
at anything (and i would like to maintain that discipline/workflow).


cheers,
jamal
