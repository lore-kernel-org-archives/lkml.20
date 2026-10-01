Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCF031ED83
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843484; cv=pass; b=Od7bH4+2wJqPgDV0H0MePrKn0qPn04Yb08H947YSRzpXyEbmya74OipjSZXsO76CEImVZGasCSMZYBUyohRE9oAnAooLM/fXrTIdy7eLv6Om0/GW6rxy9IZxNqp5p/j5rprNkyII3bc+fprxpcAfeuMDLeQSYAAYlera/TSwtXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843484; c=relaxed/simple;
	bh=S6nhg02pIj+SO3ygvr7Yf/yjhAnAdUb1rhRonxomtvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYER/ahoCMSXgcKICi9HunNaXKLdORyDhRZvhgRl4X5HRA1EmSJkSVZEMx1JARo7Ielz+09yenIpS/uYZpC00pSCED9mfyKrc2rYcyslXVqRx4/uIAo0zg+m4q2f2VaLBxGKY05ZessnWBLUHS/cmJ8hqQM68Xnv1LeoK+1JhKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohBu2qHT; arc=pass smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohBu2qHT"
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5cd63c192b9so2343025e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790843481; cv=none;
        d=google.com; s=arc-20260327;
        b=WobweBB8DUkqDzXEmyoGuHCU9KlaxtyNoLTvKymgaw3yBtu4SWephE8uKY536wZYNX
         i5USFSJeMz5BXbL3lRN9xdMK2LD1VH1QhbRrhrKagQqFWMR6PIfl//tbpqglUTMwIvD4
         P4yH5QBboexzD/MFneYMbm+81IOOeSIPiZLHVwpTQXBWe2FFbltzxbfFKaLWJ3B08Z+T
         oayf+Tdv87812xRvtlMLx9zwJ1skm7mEUyW/Qnc3MqdbFv9K2Uf2rFO21klZEGq1boaW
         VLAP3b10feGxMiW0EfzNpfD6UQ2IsrVlwq1OsDhGPHt4GU0DF3GzJiPBfjm42eW2wuRZ
         WgtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EU0sYZ/FO/mx2+yJVtb2c4Or0T6adefpzzLzs+MHc/0=;
        fh=DJEv8BgVBazBIfNF1H648eA5GdoJJ8nNXOShqfIn9UU=;
        b=W8Kc2cwYPrsUxuJsYYQgP4inPsyxJZ+3X5yJjWNSCjyCWD+k7AHA045IQu/+734vjG
         RuAr0swKf3wAXZn2TnipPqHdNwuQ9lgcCA2sQ2Jls8DIPn0ZHcY54cCo2Qpp524yrt4F
         RlH/7q5F96jrkvBgBk4rgwhcgz1yQs4gz5zxl2PUjd92ywclg7ldOIesObLzQg/SUcJ9
         rGgpXH36cRv/RXfRdR2rWzndBQ8wMbCdTJ+sgPwpl/F+poUJ124jRkYq7LXqF3WqO4Uk
         Kghl26LkQHehCA5a9mqywcE0Tr3z207ZpIMLGMQ62mWqr/54cMKrgU8QC7OfRa2dqsOx
         89hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790843481; x=1791448281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EU0sYZ/FO/mx2+yJVtb2c4Or0T6adefpzzLzs+MHc/0=;
        b=ohBu2qHToOlHPjPSbXJLKC+gn6Zo2CZFp4Ng/pfIBSC4Ix+hFL27JjLr+8cS8Gr3LW
         Z85cdsOzXelCiGihBZSv+rcLs/V3AN+Lcaw/bOi0pfF5RJDUODCMdv/TSyBtP1/MW4V4
         4r6TMtvgRuoIT3dpuxiaDWnxsqh4NS9sjJab8yAY9/XQpxR+adnoS1Mvw7sMsn1gWfoh
         skmnnp6mx2s0ylXBocAN5hm0clj9KRGl8aQAxLOOaOLNNforhcTJ2XK6FUVtmTgMDPBP
         wF8IjQhVKblCCiX7hVXi2d+V3U1Z5IgYW+H/9DANFyUxoawd8nFESwXzkOBcL7eJYZ3M
         raXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843481; x=1791448281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EU0sYZ/FO/mx2+yJVtb2c4Or0T6adefpzzLzs+MHc/0=;
        b=PBFzsGdMmrJoti3AFfznIQoBQNkbrBOi2cHQpUoto6t7YTst+Vf5phkGAn7UIQXJnR
         fKm0WvyU/7KxPUUY6lkWp0XXRxQHOYM4jJH5Kbs/Kh3VuN8VYBEUevDfvQLANTGH6xnw
         3ZB9M7ObsJdblbiM3DnQrU4AeUJKCxB45jGHdcjXZh2gCQ+TRtxiSelnLtYKk6f07NrR
         OdpQSAFSyPOXbkaL8rJ/F56vT2w4oxu45LZCsOniHf9eXz89ELp6Es88BT1SzBCZew1U
         HHHWblbIol/nK814xhOQEHm9lUtpLxbkOBgqE5PtaD1fcuhoilDBhRPxQ/qzyW3UPsjb
         oxrg==
X-Forwarded-Encrypted: i=1; AKwUvBwHSEdJaWlPVSFHkDOT/IaKaOhxKLsEWvo0epcjPayB6PU5TZY0sp8Mq20Vlj4CdozKJo4SrWWJ/0pbq2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5H+pmAd/bbl+tmlz9SJayr/IwGllSWQ3120arPCW0K/U4xxW5
	tW4FPsXmjcCqKnK3eIf1F0nEu3cYtiBxXK87G1oedYTs3AfJ9E+opODhJBfOZ+4iH35CWxY9Q1m
	5h7/SfAkhrKlqomWWFrWHH9GZmLWKm1E=
X-Gm-Gg: AYBFou38MG6w8eJwsInBZaA5DzA0Mgj+CF/WnRFAsuWkNQhF9PflaocoL+6UKhXmcV3
	hB/D+/qIM3gEFkElOETZGy1xhk9cqLfOaCZ03SCYxggrmqNjJvUpfSYiM9fG0hWBY/wqxFbzOMp
	u/RSmYkSfd8DLJ6Xxd1iNz9x50R+Bc8cSYPrHpEaR2twogIWq2IoEv8N/PmmEYNwU2YQ1zW+7ah
	Psd69u0GhXEb8y7hh7suUVHs9rqHRYV0zsRIY5pCN+3lAe+GNVigFMfuPzM0HlAUTM+YgnwZEso
	HURNWj4DebTuhRHMIrs7qfasRBlMhF7K1OZVhjDs+iZ7ol1FI7O++5brW+mtLpPbV+nKj69q5Bo
	3KwJ/EGjKSxD7FuwXh88srzeKDFK/FiI0b/3qT/3vs7uQzlP+3iIEXDrb6zUaUfjv7lHNQ32y8D
	KsdrS7TExS4nXbVWVqrLoqb8NgkdWReHuNy5CBkO3ZTVeh
X-Received: by 2002:a05:6102:3fa3:b0:7a7:198a:c2bf with SMTP id
 ada2fe7eead31-7be735975ffmr902214137.29.1790843481357; Thu, 01 Oct 2026
 01:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-stmmac-est-reapply-after-open-v4-0-9d4366587b73@gmail.com>
 <ar4QgHsclh1vWVHk@lore-desk>
In-Reply-To: <ar4QgHsclh1vWVHk@lore-desk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 1 Oct 2026 02:31:10 -0600
X-Gm-Features: AclHuK_sh2_y0gAgCI9ChdR_dvfCKXwH4PgjB21fl6342cXclcDVA9-LiyvPKRI
Message-ID: <CADvTj4rxCuL-BNq1P3KW=1m==0PDMvn7j1=J4WW1yZLJfw5DNw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] net: stmmac: preserve and restore the
 installed EST schedule
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>, 
	Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Simon Horman <horms@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Richard Cochran <richardcochran@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Rayagond Kokatanur <rayagond@vayavyalabs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 1:49=E2=80=AFAM Lorenzo Bianconi
<lorenzo.bianconi@oss.qualcomm.com> wrote:
>
> > Continue Lorenzo Bianconi's EST replay series with v4 of the unmerged w=
ork:
> > https://lore.kernel.org/r/20260902-stmmac-est-reapply-after-open-v3-0-e=
72a6df5a7ef@oss.qualcomm.com
>
> Hi James,
>
> My plan is to continue working on this series (the code is available in [=
0]),

I compared your b4/stmmac-est-reapply-after-open branch at
e7a2792034e0 with the EST v4 I posted. The first two patches
(embedding the EST state and passing an explicit enable argument)
are equivalent apart from the additional sign-off.

The substantive differences are:

1. Preserving the installed schedule on replacement failure

Both versions validate the gate list before modifying the installed
schedule, so both preserve it when an entry fails validation.

Your version then overwrites priv->est before programming hardware.
If EST programming or preemption mapping fails, it disables EST.
However, TAPRIO keeps its previous schedule when the driver rejects
the replacement, leaving the driver and qdisc with different state.

My version builds the complete replacement in a separate object and
publishes it only after programming and preemption mapping succeed.
On failure, it retains the old configuration and attempts to restore
it, advancing the old base time by whole cycles against the current
PHC time.

2. Restoring EST before starting DMA

Your version starts DMA inside stmmac_hw_setup(), before PTP setup
and EST replay.

Mine moves DMA startup into the open and resume paths, after those
steps succeed. This keeps DMA stopped if EST restoration fails. I
wouldn't claim the earlier ordering necessarily transmits an ungated
packet, but the later startup gives us a stronger initialization
invariant.

3. Serializing EST across a PHC time adjustment

Your adjtime path releases est_lock between disabling EST and
adjusting the clock, then reacquires it for replay. It also ignores
the disable, clock-adjustment and replay errors.

Mine holds est_lock across that entire sequence, so a concurrent
TAPRIO operation cannot replace or destroy the schedule partway
through it. It checks the errors and attempts replay even after a
failed clock adjustment, while preserving the first error.

4. PTP prerequisite version

My series uses the newer PTP error-propagation fix already merged
as 8181678a92f0. Your branch carries an earlier version below the EST
series. The merged version also tracks PTP enablement and handles
platforms without a configured PTP clock rate. This is your newer
upstream work, rather than an additional change in my EST patches.

One limitation of my version is that rollback remains best-effort:
if restoring the old schedule also fails, it logs the failure but
retains the old software configuration. Hardware can therefore
still differ from the cache. Neither version guarantees recovery
from that double failure.

I'd suggest retaining the candidate-schedule handling, later DMA
startup and adjtime serialization when consolidating the series.

> I am just waiting other patches to be merged upstream before reposting in=
 order
> to avoid any conflict. I guess it is correct to publicly ask before posti=
ng
> other people patches.

I guess I had assumed since it had been nearly a month since your
last series that you just hadn't gotten around to spinning a new one
and figured if you were still working on it then my changes might be
helpful either way since I had reworked a few things while working
on a series depends on these changes.

Feel free to take back over and incorporate my changes into your
next revision if/as appropriate.

> Moreover, this is thecnically a fix so this seires should targed net tree=
.

I think the fixes you may have been waiting on are in net-next, which
is the reason I did not target the net tree.

>
> Regards,
> Lorenzo
>
> [0] https://github.com/LorenzoBianconi/net-next/tree/b4/stmmac-est-reappl=
y-after-open
>
> >
> > The PTP initialization fix from that series is already in the base.
> > Carry the remaining embedded-state and explicit-enable preparations,
> > and restore the installed schedule after open and resume reset.
> >
> > Build TAPRIO replacements separately so rejected updates cannot
> > corrupt the installed schedule. Rebase the previous schedule against
> > the current PHC when rolling back a failed hardware update, and keep
> > DMA stopped until replay succeeds. These changes do not depend on
> > the later datapath recovery series.
> >
> > Changes in v4:
> > - Omit the merged PTP initialization patch and adapt the remaining
> >   changes to probe-time PTP locking and current TAPRIO error handling.
> > - Separate schedule validation/rollback from open and resume replay.
> > - Reuse the base-time helper for replacement, PHC adjustment and
> >   rollback; propagate errors while preserving the installed cache.
> > - Start DMA only after the installed schedule has been restored.
> > - Link to v3: https://lore.kernel.org/r/20260902-stmmac-est-reapply-aft=
er-open-v3-0-e72a6df5a7ef@oss.qualcomm.com
> >
> > Changes in v3:
> > - Guard priv->est.enable update using est_lock mutex.
> > - Embed stmmac_est in stmmac_priv struct.
> > - Rework locking in tc_taprio_configure().
> > - Fix possible divided by zero crash in tc_taprio_configure().
> > - Add missing reconfiguration during stmmac_resume().
> > - Honor ptp error code in __stmmac_open() and stmmac_resume().
> > - Link to v2: https://lore.kernel.org/r/20260829-stmmac-est-reapply-aft=
er-open-v2-1-5e5ccb185e92@oss.qualcomm.com
> >
> > Changes in v2:
> > - Rename stmmac_est_reconfigure() in stmmac_setup_est().
> > - Rely on stmmac_setup_est() in tc_taprio_configure().
> > - Link to v1: https://lore.kernel.org/r/20260825-stmmac-est-reapply-aft=
er-open-v1-1-dfa80735e0a1@oss.qualcomm.com
> >
> > Assisted-by: Codex:gpt-6-astra
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >
> > ---
> > James Hilliard (1):
> >       net: stmmac: preserve the installed EST schedule on errors
> >
> > Lorenzo Bianconi (3):
> >       net: stmmac: embed struct stmmac_est in stmmac_priv struct
> >       net: stmmac: pass the desired EST enable state to est_configure()
> >       net: stmmac: restore EST before starting DMA on open and resume
> >
> >  drivers/net/ethernet/stmicro/stmmac/hwif.h        |   2 +-
> >  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   2 +-
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  |  47 ++++++-
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  |  13 ++
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  38 ++++--
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  59 ++++-----
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 142 +++++++++++---=
--------
> >  7 files changed, 176 insertions(+), 127 deletions(-)
> > ---
> > base-commit: 1631d79ae57dce2c5f88ad278307028638a8b4d9
> > change-id: 20260824-stmmac-est-reapply-after-open-181d70a15eb6
> >
> > Best regards,
> > --
> > James Hilliard <james.hilliard1@gmail.com>
> >
