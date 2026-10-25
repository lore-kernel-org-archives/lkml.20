Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.215.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792919033;
	b=KRWEK24mmveZfFSZg7Alk5U56WrFpsTPERSaNWU8oU0kEYs9LzsMKLacU5O465cUYByI
	 Zye2zeCljxbHMhcxZbaMpLZsi3HxNIKFIh/dWy93FWyglHgCjzs/C9DjCXS6Y+RBMceMd
	 J01RameDyepVy+E5CeciafVmJz3ZsJ4UqoT0nSBeNSsuRrPa7RVOZj7NSR7kcuxhRuJ04
	 DmD7G5AM1gUawtRFlTBcl5I5UXKCXjb8vMTsSc6umJeb/p3FJRHPZyzP2+jJKGpS1wsPR
	 rvf1PpY0V/juu2X1tNChxj/f7xmA5F6Zw64Dvkd0fjrPcygSU/KPrKW1sSUTsX32IhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792919033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1BooYTXBqtdl0NuOlZpwBA6Ku6J/l86osVdkZCPC8Vc=;
	b=fSVOUpSXrZUfdO81lriuPIdrr161Qu01T/3xckiOMwM2lD0GcLBGAEmpxW/jPriwOjUM
	 A1V8IpQTKd+Y+E/k8EZUF8vDfud7VfrtPi14ow6VO9Ndx0I0xllBoRrFmRMTzZzVPQyuO
	 y9ztlSuAHY3O6Vm/S2dnh6f6ynEnZrJrISHt1Q9nGf/G83aVVZ0YlETbHfNW5+V/FczIQ
	 //IWht7RGT/HRqCL1Wi9s7BDV1fTKVmMDwFIgy22QyYDZvtgb0kCEkx3lam58DX+5agsA
	 2qSriPt22dD83TedhIFPKYfQLkLlbbfKz9gPAGjWvuZh28XeFzQK+TyFARzMEfCR0/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=ujJS6mMi;
	arc=fail smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D58B606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D58B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=ujJS6mMi
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1177133a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792919033; cv=none;
        d=google.com; s=arc-20260327;
        b=ZYEwhSGYbf2TGCn+ItYiyhRlu4h7OrSR/c3guDHVvAu+iVhK22ype5SO6E1yj1ROAj
         19e55irQFMg/Mp0IBO8asrhQAi4p+cQCzqOVjbsAU5pISMFfFX63uKvFDM1uZfH42SLA
         1HUnyUuW/K3ImxxIEyIX7fsxt4UlwMCMAnDhIicF1WrxJLfmMHsIiT5heYG6RNChvoC0
         Vklgw8UPI8KXX6fA/37sxY/WGI8o7lQ0VogV7yovkq0EYi1xaTq9uvkXJ9bzMANoKsAp
         1d+G7RmPCOtzGtpvHXPGck7iifSIBk7C1gqcZt5cmiebijljSteZxbd1a1CPpDirA/zL
         pHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1BooYTXBqtdl0NuOlZpwBA6Ku6J/l86osVdkZCPC8Vc=;
        fh=RPkmE0hB9tcwfFuOh1/D5QNpxutzR9j8Onh+nGuUQmw=;
        b=ZNnns6km1N3+Lph8nhumu9NcfLnyue5IL/O+3DGCElErqoxX6RIxe3T3JjXe5pbqrd
         EWEbhQZAlDyTe0hzTd+DCkUY9JCu/jJ6Vx/Rp5Sm6hJwc71gU0MH005JdaMzvsmFRq/U
         Op0EZcxFh/NXhe3yjDnwL/ttYVa9Rt6qAU83IDCzzS4vn1zRj6YrGIrDOC1kh4co2gHy
         W7hgNRSF3Yn3CudqoSzU7KRkobt6xZyutDw6z+smYsh/9cURbTPv7T6BM74tAh1n/9dS
         h7VuHCjZ/NNb8fTvnDAYIrEnceSFpwzlhfLBcKOHvXy0tXRYrgdo8PWmJsUT6bAxUR0m
         Vokw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1792919033; x=1793523833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1BooYTXBqtdl0NuOlZpwBA6Ku6J/l86osVdkZCPC8Vc=;
        b=ujJS6mMi0vBZnl+BDCY0ZwxybPNMPiPzuhdFjhJhdpJo4Tx7T7CVEEyTDE8gFLb9Cr
         SRA0nkHUuCJ+rbUDjwjRwkFsDjDachhOG8OFnog5uwWUbfbxsUqJCwTjMuLUpqRYsL09
         k9/Y0+h8x3V7aZqiuiAOy2wRsSgAH8Rr9GzBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792919033; x=1793523833;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BooYTXBqtdl0NuOlZpwBA6Ku6J/l86osVdkZCPC8Vc=;
        b=AAdpi+lXUoICYyiaeOgxc+DEgfGl2PKwr3ZQsYKqAOUndc0VNjHxLHs2QxwH7wCI/Y
         Xa9NXuqMXfBOIyBLnOzxQ4JKYltNAj6o1tINwOWO+zZEztoWXSRUf4OTFHrQ/ew+WvAU
         CopBnafgJZ+ObuaW/WJfk2+k/tzLiIg85QxZl28l/zSJcRYsvjh9QfRrNyyzyvOyPG2R
         EvTnJ5FKM6Bd6GXUFTFIftdukQk+bfhU1PZS4AEx/cZtSgke3UbvGsENMlyNlQ8RmnuT
         B9hy74q7uLP9el14FMSrwR3WsJL83rCCas7o7l/TcHIXM2cL64sO2dmTj/X/kgvA3OP5
         Xi+g==
X-Forwarded-Encrypted: i=1; AKwUvBznq27GO97jAeTjTGG2AbwUtBOlImuaHubn/LkLKl2gd1yy7n/XolFdDRg5IoLqbvcbp9A7PZS5WyKrnOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvHRaDU3+sMEvI/pSt43H1xqpJ3LoeKDDRR7hZhCo1DF8SKv9R
	18OkgEoTqEIsg/44blAdpAIQQ5BDhdJdTuVk6rEyaqePxYIuk2/548IvR2bBZ+bT16mO/gqaqoV
	VypTQ1Mpvj+TgWPE1tk/vbXDkCCqZEJptEp7Ah6mT
X-Gm-Gg: AYBFou2ZnTorGfVeNhz/lz6bBuqOC+FOLa/bop/m0TCDhMvLjpv/YZ1aLuKB8sknJOf
	nP1B/Q80vDOW/gdEyeWI6dlgtaL7TllRwGPV/96/M7xvCEqeu/DG0k0xZ4xQa8NJBaamDwpZ/at
	6lPaj9PeqHWMXVErQjvPV+Kc+EJmHca3AYE1eS/wWqir0NYNoPpVxFN8+qrLkXdnuTK3VW+GXwe
	m2D41FBIqTwHv60vPGTyFdBDoJrjDkoZo4qLPGTeGVb4uus1ZTh6UIdLZ12iFAT70vqP+fTCA1A
	O6ZsIpCZMJrTvuoArCAJruAGmH/gInpxO08mv30AnSrt0SW6z5NcsJFZ5B3IhR7XVQut9e/ZQSS
	He23zVcfZcfni1WZrKrkWQ/RQdqz+kql6HULsQADjQcgajixLhITfDEuDVjINcX/VYo9NwOCNhL
	LwelxoJH7ZXcJ8RAk=
X-Received: by 2002:a05:6300:6bdc:b0:3e0:b937:883d with SMTP id
 adf61e73a8af0-3e7bfbdba5amr2952918637.25.1792919032623; Sun, 25 Oct 2026
 02:03:52 -0700 (PDT)
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
 <CAC_etQHv2EBYfAhfkYHKrasnJAyDS+u5+a4os4aD1eSmKrck_A@mail.gmail.com> <CAM0EoMm=KbZgcGqLHDFee3mM1GxuNCvAWObP_K4AxsGAoEAedg@mail.gmail.com>
In-Reply-To: <CAM0EoMm=KbZgcGqLHDFee3mM1GxuNCvAWObP_K4AxsGAoEAedg@mail.gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sun, 25 Oct 2026 05:03:41 -0400
X-Gm-Features: AclHuK_jMLdQH3LqJfc2klawx0gf0RQlCgrLwXyrkJ9NArFRch-vM04NQdh0R90
Message-ID: <CAM0EoMmxpVv4YRoQQ3jN+79OKjaT=ep3+6jff8CHoOBLJUej3w@mail.gmail.com>
Subject: Re: [PATCH] net/sched: sch_qfq: prevent aggregate self-replacement
To: David Lee <david.lee@trailofbits.com>
Cc: jiri@resnulli.us, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, Kyle Zeng <kylebot@openai.com>, 
	"Dominik 'Disconnect3d' Czarnota" <dominik.czarnota@trailofbits.com>, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:14=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu.com>=
 wrote:
>
> On Wed, Oct 21, 2026 at 10:56=E2=80=AFAM David Lee <david.lee@trailofbits=
.com> wrote:
> >
> > Hi Jamal,
> >
> > Following up on this thread. Please let me know if you had a chance to =
review the attached reproducer or if you need any additional information.
> >
>
> Please resend to the list - I lost track.
> And if you follow up after like 2 months(!) you will really have to
> retest with the new kernel and likely look at the list to see if there
> are other fixes that cover this issue.
>

Before i try to reproduce (then proper review) please resend
addressing the issues raised by the sashikos. They are legit.


cheers,
jamal
