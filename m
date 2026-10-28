Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793166338;
	b=Hh81JwRCnvno2OLCRjJZ8xBeJ+VWEV0CXJnsYHBi1rdP3tfQs4Zynidzw264Z/5CKTgm
	 ogVcicN3V5gB6jDBB5Yy3QXgdDNoF0FgFZm1B+A/fyvovUza4/MvNQfZRABcdk4u2X8zM
	 UWfLToo2tbTv4Kd2yYHjiiPa+PSd3cEw+Fg7vdQfSZOw9DfGneULY1542sesrLqIeJVpA
	 VXxk7ytQH3lX8EyJEztdgGGUX/rm2wPR/0FM5ziBqjnN/Wa8dt8qV/epfEzsx4OYWiVOs
	 rJnT939l2CUDMJb8Eo4X6R1XE+Zy3PdiqGvff9scv29zYOilfxM59YSJ8sKpIkPvRxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PFsS6+I6tSnMVxI7cw6XHZ1p9l0CCeVWrHrbBHijNRU=;
	b=flzhrS58Snd89fVNstCHJyBc3CMXe7UKdsaw5NJqa4YjexEcTMY7IgfG+3G9vA8mkTyk
	 v9Ji4tGGa8b0evIR/LmMepK5k5CUXFOR3E0XHYHMLPzLoA0e3JvpEpt2i0Bv94aq9EOfR
	 bhEZbnyiQ/jmhjKPzdlueD60coSW87qp1Op8I4uNN4Ri3/5Hjc2WvUZcfYdwnX9KQX39I
	 NDrjwY6/HB+7eE4a7kPqRlzhB4HG4sjGEJeACjAMgns7xT4WU6IwqtK/sC51HKTkr30rM
	 nXaokqZNh924vDyjoB8Di1SNnXNRyEJdb2FW8HGk7/PKwoj/LIjaZRIsXcbEeGXEyaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRkbDyGu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.73
Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F94606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F94606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRkbDyGu
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-47bd4bcc3e2so230460fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:45:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793166336; cv=none;
        d=google.com; s=arc-20260327;
        b=WD2JkWfIcbRW9rdnkN76Xjt2COVN1rT50FoyuMXME+uxKdyMH3wltupq/B5R8bsXsx
         IxpEJZqLkE7O2P0rv03F3hGCu2CyyKOurfmuBsnIoBb21CC6ZMgW0s9Q45g9RqgajWAx
         iwwn9qL/i3NIDpsRJ2q5ebHTmJE85AQyPEXPbAz6w0BUwT6nISthSQRYJszeeWcRatLA
         hBA9MlMTCgM4a7u952vdjlG3e4j+mcRBBc6UfBBwW56x4eYRCCz6rX89WVw1S8IQbq73
         ZHnQnAA/uETwHBp+QrsygmmkORCrKDOHDv/BtIq+xFQoUbLGRkFLR2/WZ4vchWJD6wVK
         xMZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PFsS6+I6tSnMVxI7cw6XHZ1p9l0CCeVWrHrbBHijNRU=;
        fh=2SxxeeYBU8eHkMvmrYdtb3oepHlEDLnuMIPnXbt/ZJk=;
        b=fvHRy1qbE2DYwA/mkrYC88404wTt7zOKbnW5ZmStDeUSKcsOP3SyFBWqeay1j9ka0a
         Zx/fi4Ee22WFH4Ef61qX89kPPD7KysaoXeAFeAQ+WNguNmOHGn3kwSPZJgsrr2MZjUFp
         j8XixaIIWxeNpNTBa7J0XkGjiSYvfEqBrS5HuLsRKcnHyNHyXDdhNIIr9jXcsJx2NGyM
         mlpvRvHM4Cs27omS6HocapivOxvP3vF3g7+QLp8Iyq8+KD7eex5288oV3mQSwkfnp97J
         a3qwdrhEnsiCpI9RV4WlLKdRSJodBva3PAhxGDZ4l9hHWVo1CoQWsLMZGtuMha2DVK3y
         ItEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793166336; x=1793771136; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFsS6+I6tSnMVxI7cw6XHZ1p9l0CCeVWrHrbBHijNRU=;
        b=JRkbDyGuG0UvtHYASqoddmJEhcXLTgtIDy0VqLELLxlT4ZPJHCAwN5lbEYR3nNpSMY
         rF8Wacg1klSNuO/rSXkDF2p9Fi7879P0RUN/E/f0XB7xgKUXKeAjEHeXH/SklkrIkh3D
         MaoVZun3A0b8slTgI8/qtb8UeifcXtz77ZI5uLwPFT1P6IRAQ1XIRQCzTOOTkCJ0/JWA
         Yxa9v5xe9v40NBeEWYGsZ8UVAHrVWKh6BwHKYvVG/LL6OeJjIirsXDREXwuthbgSlRmb
         FBYAtPxNfxLoNOuW+FabsWBO2rEaBvx3FjL6iROyUKejQasIj2C3lTTdur0lADGo8PG9
         SgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793166336; x=1793771136;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PFsS6+I6tSnMVxI7cw6XHZ1p9l0CCeVWrHrbBHijNRU=;
        b=CGUyk34jTcIRexWhFh30hHEhHDPlR+ZNZgBEin7wX93/J4lA3WStkzOOIfzpMZXG0y
         Ou77cGLsColpiBSiZ2W17dajzjV/BPs7fRyk/ss5WMTt2t8W+tV+8cLpe0b9kAgQLZRC
         g4QWT4r09TTqZMpjftzmbNs+tep97A2EUDOPfVO5vghvkpYNhO9/jufsNPX2n2nY1p4m
         aOpI3BDisfS/RIIp1xr/buUPvXNNlBQtZXa17BvHfOvp95GzyONoHTzY9tmu7BlDg0bA
         UE/A3GFbheWWT7YtoG8xu3Y8bPKodau5FWLItRRUlVJLBw45vl3ML66InbjmlIV/IiKa
         aRaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQf9I4rxvHq/PtGW8sUDaNh5gYcOuZ7bmgaGm+bpF2d5/T0jTko5z+h6S2si3azZp1Mrwahj2dyNirrwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqIV2B5khiDTqeGjFObk8Li5juDJRnhxlDfAsh+MLR6vSpFjoC
	MGwPZft2bGcHa10sDMxRAWlKF7jeGIEaKugNZIbmB15syRUZ842/hnSAWKZXtUWTLLvvrmroeeL
	p/vu8WI7mUkgQ0gjv9GPAIP0E5JofOic=
X-Gm-Gg: AYBFou0aQ4TPp/xN26oECLgxUVyU+l33zoXDPGPkZaVexPCBrnXEDHV+KCENCnxmngE
	ekdm/KT/Iy1qfDpJc7IG1qE70X5NbxloFcw3iGz8HMuOkRX+RyzQnSiC8BOFPKiLwcTlLWdHgu+
	YqJsrL0NLuJqZcFR22+oIrBx5C9Z2E6+EW3nyA4yCRC5nyWtivUEu84c5E6G/7ryRMudlkcu9zy
	RPCurB8TxDw3euNxkkfN4yh+E9UKJfZjFCa57gtloUJS9gz6R3HglkEtHwwlj5scrshAUM+81pY
	wgCEMlxoF7eveL6N6FQTpUcHi1Dfn80saqklhhMlzVuoU31McrVtXdE2BrYltZoYeWf3pHSYxAE
	GKEJzgh4FySHj8ndf926s60SPR6JTuESuqAUdau4B0aJv/xgvrZ/1q0X5er6x0bidRuoSKO0=
X-Received: by 2002:a05:6870:6784:b0:475:e2e9:4f54 with SMTP id
 586e51a60fabf-4a8bb623838mr1143705fac.34.1793166335471; Tue, 27 Oct 2026
 22:45:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019165103.5990-1-dennylin0707@gmail.com> <9bde49a2e7794e4fb6bc3ae104eef87e@realtek.com>
 <334c6e785a5d242c6f168d57d042d63b777a242a@linux.dev> <4f48c50cab1145fd9dbd6df6d424c877@realtek.com>
 <CAGEkeHevidTtTNj-qfy6kE_O0wRvqT=F=sG+Hy83BOkRjCUqeA@mail.gmail.com>
 <CANQ=N_C3+gpQ3O=SXYpRCGTh_MC1y4TEfnxF90SWgUVF_wYPUA@mail.gmail.com> <CAGEkeHdT1-WwJnF1wTkrrRQRzrEYESOoDeAYE+fiV0gROG+6sw@mail.gmail.com>
In-Reply-To: <CAGEkeHdT1-WwJnF1wTkrrRQRzrEYESOoDeAYE+fiV0gROG+6sw@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 27 Oct 2026 22:45:22 -0700
X-Gm-Features: AclHuK_56Etvh4NDXHmZo6v_Uy5gCnaEAwyYEkyYaUlQKWDKsf27nBbYFYKNEFs
Message-ID: <CAGEkeHf0CLjxhGySt2axf8gXMrCcn=cEHbe1aXRW4FgcbxjyZQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: rtw88: allow key removal when the CAM table is full
To: Shagor Khan <reza1234khan1234@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Luka Gejak <luka.gejak@linux.dev>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shagor,

> I can help in testing if you want. Since i do have rtw88 hardware
> available with me.

Have you had a chance to test this patch?

Thanks,
Hungyu
