Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DCB476CFF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255289; cv=none; b=u9a/o9am74mLpVpjH45B0kYnGAnz/bqLyZCjGDOFGoHen4Tt64x619xNpwoHbvRN529bgOdiaEkK1XpzAtOubiUIRVambDZZC//2x0/ZvJ93GgM2G3xjKTrgqBvNiedNnlbM/iHKYqn3YvTJ90EhkFkiHgAp9GxEyOYIelpMmyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255289; c=relaxed/simple;
	bh=b5tBw1OWTW9anYfSrkLvoNb4hmDJ1qh/u97cT1sgxuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Wr9khAQLeyqjCbTdqcmJeoIxIORR9E9LvJMOQS/VJKCUAYwb7/paRAegBAi1DMf07xH3VkruS/YB82RSZDQQ9QtM0rzm2cDliOL/rgE2fZp4muQSP9Q4lbLB8IPzFy+4ocV7oSa7JfEkx2ajJeuGufqoGADwW5X74yXxp1ryKLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=P7w4Y77M; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="P7w4Y77M"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a98dfb8002so2742459a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1790255285; x=1790860085; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkvVSwE3EAXQkrsnsyLf5UySEA7ECtLpxiG/B9QOEQg=;
        b=P7w4Y77Mn2w741nWFbF3DiMqTHohZABbZFDtwSCKEXJPzUelM56QwnNaYGURM4tR51
         kpx4ko/+cSDh7prjuN01lovzj9AgIs4oIXra2C2q+c4k8N6U18cqMvu/Ar/4W9rCGyY2
         v+zn9LSdYfg4DpoylyKZ8TyN2SGZcUBMiDid0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255285; x=1790860085;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkvVSwE3EAXQkrsnsyLf5UySEA7ECtLpxiG/B9QOEQg=;
        b=BlFCZUHFfxkXw70NQ1NzmoPBe0FBpR6MgWK2dhddTl1oI+mWCxaG6Yp2/ymzdBUL49
         pvsU3vi+/RYF5jL6cvKtYAIDiPzqfTXZ3sV/2HmrBh3trl+NDouObgwA9NAhzuioWaoB
         eo6sdcl/YkqeCocH5W93Nu9xZEfFABXI0OxcONAspj3f58IYkEi9jOwCmhskAc6CfXOp
         1NGKEYn6o/66bygHkRowGYDNor3eXCfCKP2JQBtuXyX58E9I3GHM1rjbO893J/G+XZED
         cozoLw1LQsZSvCU8bbl/7f9OoHossr1egDtsKD1UVxtDOMxyGZZw8T7EaR2s5M37wq5F
         QGug==
X-Forwarded-Encrypted: i=1; AKwUvBxFcFl5fVa7UQjJq+URLtusQrL2QGFHn2CVcRQXGihB87M7PcqFQWbM6K505i45/EvPsR2JOfiGrPfC2OE=@vger.kernel.org
X-Gm-Message-State: AFuF++mpAAKv1Nfuh3mekrHeyHpxNH3/gBc/SVGR0IL6ZLbEp0brdMJP
	ZC4IG9bmBqAaFjR8KUocNTloMnG5DRLJGkrDEIodflJj2oZC0+NG7zaDoM5TAzoGrJo53/SvRkL
	1bpEFLLg=
X-Gm-Gg: AYBFou0QJDZqCAjt6+gHFgbdkgULbMv6ZonMPoboUwJXVwFRrNtgqQTK99janbLztfn
	3jzFCr3aVF2XnEJBufs67AoXZVP1OR8HxM/bHMPxEU1E25U2bV4ey4q5JlP5YSuWgdfHIq4DHbO
	BVQJg+A6Fa4jzSPMwEXiBllM3Ck5MmsVjB8AuL31QpeC20OznwpEmk5pbyiGBvdD1+CUeQWQpKG
	lrfHh9KLRtUyu3wmf+k1zevJXEhhdoDNikNwhksDYqXo2lbmfQ9wGvzPsEigvz/zTRcbdp9vSo5
	ftta5ozp33A+nzbmp0yO1C+1u93kvnLiDY9Sdw8VLyYTyr+jpPoAv5VqhdnTgjrBGP5tGzzb7zp
	5iEwLPV7Iqs/Lto8zIXaIy0+DEH/JNPffqdS40SMwMmoes9b2mtQj36HrknLjeiEhDmHhCiQ+LZ
	AucBOBFoXNjfIN/xOD02HPS5ZeULbAcnqlyo7nexChhlJukF2b4XK708Icr2yrt7OMvvfnHMpfT
	CGP2XtPgknvZN6ulXiUIU06NT+KszZYEpjfIE6T/NecwM5n
X-Received: by 2002:a17:907:3f8c:b0:c29:3711:626f with SMTP id a640c23a62f3a-c2ac5396491mr203059366b.24.1790255285053;
        Thu, 24 Sep 2026 06:08:05 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae67deccsm289906966b.43.2026.09.24.06.08.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:08:04 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so2904625a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:08:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzq7GRlxhNn5loVJafusipla2Hl0QPeWTa+HBexo1nzxaZp0bANvyqU3/jlH0yixnWc0ZMbSBKsjYQ7Bsg=@vger.kernel.org
X-Received: by 2002:a17:907:8691:b0:c29:5420:cf78 with SMTP id
 a640c23a62f3a-c2ac5521ee4mr166938266b.45.1790255284248; Thu, 24 Sep 2026
 06:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924032636.GA314300@sakamocchi.jp>
In-Reply-To: <20260924032636.GA314300@sakamocchi.jp>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Sep 2026 06:07:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjRVQhcCGHCA9LL6oPf5CQe2Sw2ru_Bm-qJz_bp-dZVmg@mail.gmail.com>
X-Gm-Features: AclHuK-YDZhU2xM-WhDeYIRR4JvOEWB2H3VNVQf3esI054-WSXnmZZJP9gVpznE
Message-ID: <CAHk-=wjRVQhcCGHCA9LL6oPf5CQe2Sw2ru_Bm-qJz_bp-dZVmg@mail.gmail.com>
Subject: Re: [GIT PULL] firewire fixes for v7.3-rc5
To: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux1394-devel@lists.sourceforge.net, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Sept 2026 at 20:26, Takashi Sakamoto <o-takashi@sakamocchi.jp> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-fixes-7.3-rc5

That's actually not a signed tag.

Can you please re-do it with the proper pgp signing?

               Linus
