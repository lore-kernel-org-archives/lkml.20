Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AEC3D45D4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166637; cv=pass; b=YZ1cZr9AZAPd09b9ebSiy8VDo38rY4d9wiUehFLGWsX3bEFZpPjkJsfEm2Y5RKGEfAQdj8ZyJlKxgq+oCX2xmB2NHY+Ij1VAPWkZEoyL5xS60LNCWHRG+X/hXpNYfoM7YpuEiJedQHNh/iNiVy8JAU1xYM93riDuCd71vIAHtSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166637; c=relaxed/simple;
	bh=jzatqn9CD0GTpHr8meHYFhhCba0r1a0r6tq54url14M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rE/Sgf1jRbU36gSJNLQUGgA+jzfCs0OB1BSqC4ArnAQv+rPkhYUm+xL2z5DY2Ptkjvih4i1qtcdp154qk45OLFZVVPYFO+8Lp5QEUoIWnXE/sUR9vKtHWahYtZGGHF9YvaFbJ2yXDyGMnDR8BsK7uarpAqDtz9oO5aG6K3Y9qNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=W1D3FK60; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="W1D3FK60"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so3940191fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788166634; cv=none;
        d=google.com; s=arc-20260327;
        b=XR+STHgf2567xgnZ1imRnwn2K+VDcAKcJAOJHgA4GC63ZspsEkc7xW+BGvhluoexhX
         SqPsUaA0VpcUBPmrbWK4wILb0MXl2q4+AMDZmHgmlaxooXktVawaiP/iUj/2RzCP9eua
         bTzjZCSRzpbTBhFL6X52pupXq4pvbLhFTnhEGodt4eSryZqZNuHqXpS8ELq1dowtBPVB
         viLY+aYqn+oSnGL+u4m37rLTqkgVne/AKchz3kl2jrkBYjYQhADaSbp4/zbTiRSiA1YZ
         4rAtgEnfsQluOWAyEzxxzHrfS6QjdlVfDg9FvQWJJ9wXqMdPV7ywnI0v28f8iYSDnWSR
         FCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VAWtUADdu6jV6foFPi+AFBda3A8CxphweXBXCBefQmk=;
        fh=0w5mna54IwGprKOzpO9S7hQ1YunjdXLvFGk5cNfCH+k=;
        b=onDEu1QOSSOm6SXF2Y/yN2wecIWXmRuMFsCAhB0kc6PfJin8K9jl9/R1Z8C+IIMAHO
         J5cKyAr+Q+xPuD8UXsfxCcV9ZSp0FRSiLkJ+RqNLqWaU1JzBbjwfVRu/3CpxBJUAAFNY
         W2g5CS8wSPXeSL+wPQVwQ9z4N4uTSlZAncKvbn7kNL3ov6OI/V3YUvzyicU7vpc1QeGR
         SfdNBzQh1w8O6TuXmkjp70B9YCNl23T1vTnHzunQJ9J0yKeL4PDI9r1HYnVNp75OJDyb
         RglWvMOtCG9Cpaminz5fopSGN8pxgnGSVenXShhIcfr/RCkoykIPRV9uj+RpUdaBFB+j
         ZYWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788166634; x=1788771434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VAWtUADdu6jV6foFPi+AFBda3A8CxphweXBXCBefQmk=;
        b=W1D3FK60o+8srrN8n49rQyxI1X6eGtq0mQZVQYw9uJJdmKjraNeO1tApeG6+4JjTBy
         Ip6LBQ3o1gW5hYe4V2nxNlCqEdkprpVoa1VJ76JCaMTWZx9cGmfxfkA1o1aV5siuMAiD
         vtGa0GHfvzWNv9xP39D6BiKOFXyIdy1oWG42iM5GbL/VVdl2nnIi2MSC/uifMwYVflaq
         pDZNo6LlNOkg/Fdzqr+7isEdvaUGYRNeOci/9FUbyKRRKXCZIFTVGv5HeH4y+ojhHawo
         UDW+9l0rARTw8XGm0oF0ZtZqj0iOPSYoS50Ejk3wQzvnr59VZzZnvtMV5y1dBuFh/VEH
         PsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166634; x=1788771434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VAWtUADdu6jV6foFPi+AFBda3A8CxphweXBXCBefQmk=;
        b=s8jEk67Av6VY6Kl5sMeyTVKEwErvIRiH/zF8haxuQRA5ZI2gg/WAfEoBZZriHeOppV
         T/Y/5c9Fiw2E2m3nZaHozFZ5Y57YzaGq2CzZckCdtv0lJ4lMNVkNG2fWRk4wodrC6OOU
         0uLZkqFTTVyN/yXLCYJmV0ixKXtZnmygvr3kFfDUtGiweY1odxA1VHP1AV3IPG0WOkhL
         2iAyyaYvSrgz/4Fhgx79RkCzKpV+7ZRkD/if1jCkhSEqq20eLAP9pmNySpsAePm5DGsB
         pereyz1cUMXkNdWMNSdXZMA5zinjFJjc/2/nIY4fje2Zx1uvQFZ9up9B5Tdp+5FU8ukX
         QzQw==
X-Gm-Message-State: AFuF++niFebykOyBgoAa0mT8g3L4ewOdtXyPUp/c7zugHHCThLhYGXU3
	O7Ii70qiEzdH0/+ZGbuDNN/hBrWn/4H7KPkisBzIKin0wF+3IgjvoIJCfzOXTkP05cJJs7Jzb+0
	TGrDX1UJemqvB8NgzebOW5oSHJnc0RCJEJH6W4Eczxg==
X-Gm-Gg: AYBFou2ygX2G8KNZO5n080maNJV0G9Gezo2gNKmDhuSIuBHu3KAv0Q/Xxur1uOz0bnJ
	9XWjGVuk0VYIXIqajr96mqV1hMkICQUFPeEdof0lZiT0UmhjRLwYcaMh2JmozaJBp+n8XfWm23p
	Tu4PL/+kWZdRfU1R4C8Kv6OazqYwMHRkSdo28lLI0vU8aQNr17f/5AH0vdl97UTK8qgEKr+H/m2
	Xg2YearU52kEuoyt/AVHHtTZYDf7sfHHINRuYyhnPAcq4pkDxvp42GhpgjXXTPEc6iGmPicSX2G
	660pT+d9xa875uziZSfV1zEa5DsxDcGvEwCX7o2EhrFoonmUSdweDe3b2gA/mInm7cvY7ZkFEHT
	ZmEpk/eJCxDZ0
X-Received: by 2002:a05:651c:4084:b0:3a3:364:f797 with SMTP id
 38308e7fff4ca-3a30364fddamr37950501fa.8.1788166633688; Mon, 31 Aug 2026
 01:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831081823.67972-1-marco.crivellari@suse.com>
 <20260831081823.67972-2-marco.crivellari@suse.com> <20260831085432.HdW_Nrqi@linutronix.de>
In-Reply-To: <20260831085432.HdW_Nrqi@linutronix.de>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 31 Aug 2026 10:57:00 +0200
X-Gm-Features: AcwNN1XbAMhYP4jgGNk94lHRcPmzvPU1VsFhwzUUJya6KwgFjOkjJCVWkaG3hvI
Message-ID: <CAAofZF7g4sUk2M-=komtqNzbGAd4AeT68p5JbyFbNg1d6RMYvw@mail.gmail.com>
Subject: Re: [PATCH 1/2] doc: Change dynticks-testing repository name
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 10:54=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-08-31 10:18:08 [+0200], Marco Crivellari wrote:
> > Currently the documentation still mention dynticks-testing.
> >
> > Recently the repository name and the tool have been renamed
> > to cpunoise, so fix the URL.
>
> (as of https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellar=
i@suse.com/)
>
> > Cc: Valentin Schneider <vschneid@redhat.com>
> > Cc: Waiman Long <longman@redhat.com>
> > Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > Cc: "Paul E. McKenney" <paulmck@kernel.org>
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > ---
> >  Documentation/admin-guide/cpu-isolation.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentatio=
n/admin-guide/cpu-isolation.rst
> > index 8c65d03fd28c..6d8f91d2d761 100644
> > --- a/Documentation/admin-guide/cpu-isolation.rst
> > +++ b/Documentation/admin-guide/cpu-isolation.rst
> > @@ -354,4 +354,4 @@ Some tools may also be useful for higher level anal=
ysis:
> >    runs a kernel tracer that analyzes and output a summary of the noise=
s.
> >
> >  - dynticks-testing does something similar to rtla-osnoise but in users=
pace. It is available
> Shouldn't this "dynticks-testing" be renamed to cpunoise, too?

Yeah, good catch thank you!

--=20

Marco Crivellari

SUSE Labs
