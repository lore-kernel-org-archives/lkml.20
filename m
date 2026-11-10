Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794331058;
	b=PlFJHdniVS8yrn0sWTocd0Vu3sgSABs1RSpm5is2jI2Y0Dd1W+O5FWuhk8zgS6fF7Ois
	 FvKey5t7suS6Dg4P+3JzjPLHACxj6YYupkLSQwoKQaEtsRmvyNHDANF4191aiklidpWxR
	 hX1PlJMKU18nbC/yHjYUX8vH8XSvdR0e+tVg482ApB4wi71AquXWwTOwJUE9eNCq+rFQq
	 kuSTtfjaWtAf6oIUYgxpCl0aPikJGp2Fixnfy5YfxSf9+KlBGRc0PxDkKJ3BgAhEMyppR
	 322I88Jcl57jq55N9zDbGf0A4l57VdS0Id5TYl4TF5Vw4XVl3QE9cQqDPKaLxsi1IEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=skPANznjPtDn5QOojVCJqck1MgtHRW3A9WW6+mK5vTY=;
	b=D6GVRdEUhD7Mr9XHdso5BviveR3GPt3IPZ6Xkjp/zjeOxHUbSssS5vXOBuEOe10kbkhn
	 w7CmfCvIkCPjreb1CZeLPSsb3DLV4dJy3a2uYrWt7ORXF2ER8I4c+RwmC+O25bZEBFUGA
	 sW9Mxk3nV3a8NWlOlaaREd205xYD1tAJ7W1Qm/RflmX2Rv7KGGESgKJ7zWSgq9JOTSew/
	 RSx7uhRV7EMX6Pc/Hxy8f2+Y1Xjy6VnfaGoterlLM7FriQl2A4ZTviIKBhEijAhnm2GTy
	 aOlnY+Iu7weGgMBYgSSgKfSGTX0hflZQPgw5GU++d/jFfaLfRUZvs3fa5FvBgkicDAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7pNqlcK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD06606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD06606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7pNqlcK
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4af81963f35so1050484b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:17:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794331057; cv=none;
        d=google.com; s=arc-20260327;
        b=mrsi8KQNiI6B6A1Ak6CFCUKhkg3mzT3iaBTaAPS1HyAMxQ96hHIKqhXdMjQibtZOfp
         6lJ9lDyw5Xb3IvhTL38vx1TW4b0vnLgcqWnHUf6Pg33a0yUpqke7Jb7VPfZadRttiV21
         1kNb2EKYJQpBAScyXOLWSoYXxeIRXeEuFx1C5JjzXrDzRKfonDF+jkfr2nxFrarSmGw6
         et4OmVZ7N7mkpoKqK4Ix27yhzyKdm4ztw3cOWVS9v/sby2P+58nr/Pe5u3cL749T/5fY
         smi+BBlldDPCabYCVxiiOpTZ+HdaTsYzBx4pKbK88vdfNlNqGgi96S0Ns6UNt+jvHjH2
         vVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=skPANznjPtDn5QOojVCJqck1MgtHRW3A9WW6+mK5vTY=;
        fh=jnSnSP6onqV53p6IsFJPm4CHyNIje/m3c35akiZhsfQ=;
        b=Bz11CAvSvI84XjtL6ppgT4LPgr+PgSRqICmXxAQbGSmSE60dmV5DpFzakZwLhytlkp
         FEVQhbrU9dNicY3xVAMyTSB9S6IuXjrWnbmU7NDnVP5jSfPFFybj6yANQbtrNZs9u2mV
         sDZ/7HGfR/gF7BmlEdzDV0WiGB9cGh4Lz7CD36hA3IYiBsMG8zlN7HffwgVBalQOSXRg
         Rpf+QV+oW69Wo/7HuemcV7KPeU/Po5nfVloj7xArnxpmwiJk4xKFptHx379DrtCWSjIT
         9a+YYS8O4lUyOiFPwSWsrEJ4jLKqFIko01e7bz3Bmu/ab6xEnlDls+JKDaUNf4XwM+ZB
         MIfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794331057; x=1794935857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=skPANznjPtDn5QOojVCJqck1MgtHRW3A9WW6+mK5vTY=;
        b=r7pNqlcKIdxME3fk1XxU8EbALJRZdEoV9A6oZvUCTg41kr1rjCF7OfgB2DiEsmw8cL
         FNsvYlAF+5fv/gZxh/pAUznVxLYZ6Kfw8hqhi8TWBekXu90e756jM5FRfR6WjHNLk3Gv
         X8AAPPCL/ZxyRnT0/8FNyf5MnpUHEB6j8ZQu9mXzWeFqKt0VyZh2+Hke1ukeMEGkHgSu
         SZU0G8htJbbiWBvJN0DqSsshzjsCv3yWhB14ula8RdcjAV8h1EMI1Jlo4QuuBUFTtD09
         n+P4HeYZDundwVJaW+JAIDuyyX+sYRJr3Oimw489irjV+pWohqs4ktH9+3Vk4B9UwvSv
         aQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331057; x=1794935857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skPANznjPtDn5QOojVCJqck1MgtHRW3A9WW6+mK5vTY=;
        b=aX6Hi12EFpEDm2KHKbmgLccW2r6MnLdGFtp4fpsqyCVdDCC4zgzqDN/8riEmawNFfa
         d5wYknID0NclNaZFiIgF3j9O+3I9WIihycNB5LrzTuewOUSSPauDgi2ZLZdGUtGZWcwp
         XlU7AAlu3ZCrd6j0p5vgrFSdiGEw9E9B2m3qqwiyvuB38VjgUSBJj5TsX17JKma5valG
         n0lenBV0fjctiejpdeoEFeP2DY6FtcqydhHJcwxlrvI5RArZSmxui31vpX5U62zAQuSa
         sJRc1Rj5rb0/qYlKQ955PzvONsbbbyfVLmag5CDvIy19s7equO/HfGsa8TJnFDNsehWb
         0onA==
X-Forwarded-Encrypted: i=1; AL+hErH7W6IlNG6AsGo3aKufl8bVb1gwmFSWtItpnA1KYV2pbPvRsKmXlitGH3mZI+MDq9V69OATvGwbnL7Jpuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XeDjqMlb2UKn6Nf4hqi3RLSwdx0P2XOtg+c/yenPd0TpPNUnB
	HtRD+GnMg9dgUqyC0WSMkoO3j1zBnZHAsu5QBuBcg4+3ucBttFlm1eD39UAQozMilYICSBLc9Hp
	SkxcEvQO0907LShnJnR44vWlYB+YX5F8=
X-Gm-Gg: AYBFou0tgSIy7cF+/+MeTTr235MMkjQpyR/m1dpcjZbzvylo+mKRytgjTpZYuCrbEKD
	/2HuGUzTPZW67B5gVWHyLuewPDW04BvOj1LVyat4+2/F4lC1wwjWGVJiYnrSw8aeZBiWRhKEjNT
	e9gAAAp/ilK17ELcBtnM1uTm+jmftEdZlidoIVZBKBxiU4i2I4F2geatHtrvqOoEq2GRgQgXlor
	z65g2lHVuvs8OLcVw0IGZL8B5vyjJcUbMJaZMWMPEZJw7nnjLOfWrK5nPhj+YjrffPvTmmvwKtf
	GEyXEi/F3x7RD3T5JLoYu73Y/8C9Aubcq+91Zyv5/Ytbsm2jGtInjrIq/+9GD32KIBxRkSZ7Yi9
	+bYhcjmASpLY4iRlO0zchsHiRBYYREVIKODPJIxxMJ2wX1Tdv3RI/hGI1pTzu3Be/eHWP8XDToH
	15aH/iH5tIY9VwAQ==
X-Received: by 2002:a05:6808:3308:b0:4d6:9133:23fb with SMTP id
 5614622812f47-5683ca7938cmr2559632b6e.49.1794331057255; Tue, 10 Nov 2026
 09:17:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107132040.1066996-2-mmyangfl@gmail.com> <179414774671.994134.1756882573318817305@kernel.org>
 <84b7c0d7-c167-43ab-9384-869c0bb40ea5@lunn.ch>
In-Reply-To: <84b7c0d7-c167-43ab-9384-869c0bb40ea5@lunn.ch>
From: David Yang <mmyangfl@gmail.com>
Date: Wed, 11 Nov 2026 01:17:00 +0800
X-Gm-Features: AclHuK_bFk1zwMxZ9cWyZioiWUDcgfOkH6aV-uAJmktOrVSJXdkDEZNkQyyDFew
Message-ID: <CAAXyoMMHbXoBQexDyuVQ1rEzXvrX=fNPy_VfJbsmg9QrdjSMaw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/4] net: dsa: motorcomm: Fix stats64 error
 counter mapping
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:21=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > [Severity: Medium]
> > With the tx_fifo_errors mapping removed, TX undersize events are no
> > longer counted in any rtnl_link_stats64 field, and that includes
> > tx_errors. Is this intended?
> >
> > The tx_errors kernel-doc in include/uapi/linux/if_link.h says:
> >
> >  * @tx_errors: Total number of transmit problems.
> >  *   This counter must include events counter by @tx_aborted_errors,
> >  *   @tx_carrier_errors, @tx_fifo_errors, @tx_heartbeat_errors,
> >  *   @tx_window_errors and other errors not otherwise counted.
> >
> > A runt frame may not be a FIFO underrun. Could tx_undersize_errors stil=
l
> > be added to tx_errors as an error not otherwise counted?
>
> It should not be possible to send runt frame, i expect either the
> hardware, or the driver to pad them to 64 bytes. So i don't think what
> the LLM is saying is valid.
>
> However, it would be good to get this counter reported somewhere.
>
>          Andrew

Probably, but it should be counted into tx_errors nevertheless IMO.
I've sent v2 covering this.
