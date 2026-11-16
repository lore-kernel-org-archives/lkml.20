Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794860125;
	b=TWiG2BRP1YU6wfXF9ty4mm18HBiAK/lYHSY6x7wVHJAZd6H0ypas2cN5zw45moM1GwIR
	 fODshH1CgU1BY/gpm8AJUhIWMowlNjQ9IgrB8gsY/8LFnjj9RKeW20k1dVlrzMdNcf36T
	 JTMNdZfCKuUKT1fHQ/2R/eKmum+OusD7fJ6R4BmpbccmOsouNhdKpOU94rIfFeo3yb+O+
	 lhL+IWfJCYnjY9XiGHVuXcyST2aC1DCi8qaPA5Xzj9ZFqfT1krJwgyR55jiVUII0zNBqR
	 Ssma8fVtSZTf/5CFqWqlpZrdtQYDPISIsPIyOWQh73gc/sBU49Yo96hZD9/Ot3qLU+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1U9DIk4gufLfzsj+yHBbTJaIiLke5+veThAGL5SoV3Q=;
	b=jWJZMlK21NiXH4bYRaAKtpy4umPRGAyH4F1j9qMLC//7n5HF4D3mBnRoDq8Ls7agTdAA
	 ucjjyR3+OzASHEKfXenCFNLw2pgsCc0krGlR1f9bCX5lfDAypsjlzGytJVrhlPQvp//ae
	 yqz2E4Tdnl57K04xBS2ulnwhZYIQgNpLxeTqkNqBlrFoa0g6WXdFbAUnz2037uajufevz
	 Uomh5hVXna5LXASnEMRmulttrWm/7YdD/pAVlNtshBhkz/Po65pQdtE+1tbgq3EShTfJY
	 UWAQQxYFrDtouPZERsSJTcHcz1Dszlqvw1aPH9bgOwhQx6PrwVwU4MK8MR1Q0CiBv9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vrfslSZk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98801606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98801606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vrfslSZk
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37628596783so6524168eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:15:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794860124; cv=none;
        d=google.com; s=arc-20260327;
        b=kdANJElkTr+AXALd8G2N4UgftyCJ/+mvSl7B0QTocv+5O9Y7QaiU88ZFZGFxVH2gkO
         dcD45jNXpr7QSl8kQsVlJAvJtdBpWo1hEkZZk+9xyqWfgHTXEYIib9q3W7P/JIKolMyp
         OA7g0NxomJFetxfr3200Q3rkk5HPt2TNpLXg89M5qCvINtleI60nxuD2U8HajREAzabw
         2wt8hT8rrqnva2P3x9p6+IhNA6ZjqAFZ4dEhoUxaLVyREnxKnSeWiAZiokyoz2gaC0Tq
         tRuALVeIXI/rVjRQR7UlPiTc/tzB5IM/wmjUX7RLOhH7P+unTBJ5m2HUOWUjRnyDBv71
         3yQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1U9DIk4gufLfzsj+yHBbTJaIiLke5+veThAGL5SoV3Q=;
        fh=AipffCrSkK/JQy3yKHa0K/fj5g1MypUgLh5oAEo+iAM=;
        b=ZRYYh+YjzqCL4zwOppYChxvyDZbANlTVJYrXRNBRXl7HZ10niNuL20VdefXLpOrTnb
         sL5v0CXb1O2FesL2878vgp4JUDK84g1k94BBhQD2+VBO+37YPsChsYRWrNqq4wdMNmAR
         byhuf4taraLPPWWnUfg8AOfvq2q4583oMJBkl/FtM6y9Myf1bHjWT+cPDoZqWWxPlLya
         EtitL12MGgw1oKmva4+DzxIqCWz3QkmNv+OjaBIn/FAePxmGQMZcj6gucxXqSwPXmBQJ
         xDI9A6czjVoLngxMacqiWugN7PFCej2PcSUFw6A/futQXxQhVKrlRDn4wPNhxz4nojCF
         DARA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794860124; x=1795464924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1U9DIk4gufLfzsj+yHBbTJaIiLke5+veThAGL5SoV3Q=;
        b=vrfslSZkkWIbbZ3S+55KHF/+hOyua/BeiYWf3E3VT8wwroxcEs+tYLtCqQYF0gtHOK
         rgIdXBxeGre0iISx4kMw1NOz1lQnEuLIQT3ios4WH8/NdmqzAHp1ccFf6XYVDAn4Upgv
         HbZErb5EpXHVfYJEYGZuf4voWw4sBpxw1ij+ECapyU/5Oy6SBvVwoqVVYheYuf0nrXYN
         YVO6jYVJurRl4UZ7EOQopDsxsACsQC5MYOc4nMF7flILyn3m1LZE/D+b3ZnJ9eITKdPx
         VNed4HlWno9VMWF6pXRHBvnpg57uAZTB0B3kcomesqHEMKJFkbluM0FXNnkkDrSqCuuv
         JSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794860124; x=1795464924;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1U9DIk4gufLfzsj+yHBbTJaIiLke5+veThAGL5SoV3Q=;
        b=Cg5/KV/PJVjdDMPUjnL9d+7ZR0IbKlemrtAZo9mL60SQUlZFv1Gh9tpkq6Q4+mbkkf
         iJK5AfY/QUUzZ5aiKqP+SotQpRdAK3iUHsRA2Eo5WoottKXczziHlz84Vzd777yv4u7e
         6qV8ewyny5PxKy4AKeNAokdkivEAZ1MWmn7RY0eI5+ajXmwqD8annAIbxmI8tRqAaOGQ
         9cGxiH4cZb0FPWkMdeNtqTagrlDM0eVd6grZtRp9MzeBb5NZ7yg6K9mMeZxMCGmlvbbJ
         WB/AGT1grSIMn/cvKvURjSputvQznZaaPl0CYw+/LqrNaRfM1HepPIwEKfSKLBZla3Nd
         YEog==
X-Forwarded-Encrypted: i=1; AL+hErG2VUcBzsayF37i4ix2TDoEouutpgTkhCbUIfU9NSPZ+A5+9i8g9MU2QztrTkFnlL+fs/cWFcEWjCPdM9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cTL6iZpr78ErHy49hpoRt7LYeOuuTv43SLjiLPR67AnAmO8sD
	Bi12oPo1MQQdcY0mJcqgJblPuczicy3csMTVvfarNqY0gNMrtItWwshLoqo95CbhDmDuiT8rSiw
	Dc+Cjrf9k2LEAkU35SKi6Ud7qmd1PX9xKk2Il9vjwaA==
X-Gm-Gg: AZFdTZfuj/RkjvMK9/2nMv+PI2/83ZC8c0MXKtaetmBMkqhrEc4nEpOhkByxnfp0Ue5
	XMMFHR7oL7k5xMblcfslPjgA3TchQtNK7GjlQRGpMPNTUNT67uZHcXN+ayCBk0DJT4hoswUuMtK
	gCIk7MWLRYzXPvwXCN1jJK/nDRE1Cehe3w5G/dxORn41ZD8iPalLtHxvaGNTSxt+Uj9rOcX7HcG
	klNW4r81R7b3Au9CjeKEgzXinbmRs1L/8g8MVTpfpHz0c57CG7K4QS7uyKZdtSecFWr7tNIi+J/
	ZaoGpL2Qxvu7ebTK2W4boTD5ELyrLDa7+geOetRunVk7rWqXOAsrNPBZextax9hRyjPMWfoZhJi
	Kl4qfmEbLVqDfIKtWPgOIlv54HrAElmuAst4jTUBDmRds2S4i+bJYSKSe0dLIxU7zaC+Nkmck8x
	8k2gpEs0Lw5RTa2vlAO4SiY9xx
X-Received: by 2002:a05:7301:da0f:b0:36c:a42d:9bc9 with SMTP id
 5a478bee46e88-37966961442mr11539095eec.25.1794860123301; Mon, 16 Nov 2026
 12:15:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-mac80211-rx-null-link-v2-1-ea512ae98139@gmail.com> <ab8a37b85e4eac72a3176c0d43ed59017ee0187e.camel@sipsolutions.net>
In-Reply-To: <ab8a37b85e4eac72a3176c0d43ed59017ee0187e.camel@sipsolutions.net>
From: Joas Antonio <joasantonio108@gmail.com>
Date: Mon, 16 Nov 2026 17:15:11 -0300
X-Gm-Features: AclHuK-_T8rNXwIvw9C2aoOvEckYiplrQOXDu822YU9icPFp7kvGxeBI3RRnOxs
Message-ID: <CAOCBhwGA-8P=aLa2bw19QtowCXQV6JwQ86S+OPha2u5s7U41qA@mail.gmail.com>
Subject: Re: [PATCH wireless v2] wifi: mac80211: check for a NULL link in the
 MLD station RX loop
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Benjamin Berg <benjamin.berg@intel.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My apologies; I sent this via an automation b4 tool, and the message
contained the raw output from the LLM.

A summary of the issue: 'ieee80211_vif_update_links()' sets
'sdata->link[link_id]' to 'NULL' before removing the STA from the link
hash table. During this interval, an incoming frame might still
encounter the STA for that link within the 'for_each_link_sta_info()'
loop in
'__ieee80211_rx_handle_packet()'. Subsequently,
'ieee80211_rx_valid_freq()' may end up dereferencing a null pointer.

I discovered this while reading the code, though I have not been able
to reproduce the issue. If you agree that this is indeed a problem, I
can submit a V3=E2=80=94or you may proceed without one. If I have overlooke=
d
something, please feel free to discard the patch.


Em seg., 16 de nov. de 2026 =C3=A0s 16:38, Johannes Berg
<johannes@sipsolutions.net> escreveu:
>
> On Mon, 2026-11-16 at 19:37 +0000, Joas Antonio dos Santos via B4 Relay
> wrote:
> > From: Joas Antonio dos Santos <joasantonio108@gmail.com>
> >
> > Since commit 6d531b9af16e ("wifi: mac80211: rework RX packet handling")=
,
> > __ieee80211_rx_handle_packet() looks up the link of each MLD station
> > that matches addr2 and passes it straight to ieee80211_rx_valid_freq(),
> > which dereferences link->sdata and link->conf whenever status->freq is
> > set.  The non-MLD loop and the interface loop below it check the link,
> > this one does not.
> >
> > The link can be NULL there.  ieee80211_vif_update_links() clears
> > sdata->link[link_id] for a removed link first, and only later, after
> > ieee80211_tear_down_links() (including its synchronize_rcu()) and
> > drv_change_vif_links(), calls ieee80211_sta_remove_link(), which takes
> > the link station out of the hash.  RX runs under RCU only, so a data
> > frame from that link's address arriving in this window finds the link
> > station but a NULL link, and the kernel oopses in softirq context.  A
> > link is removed this way for example when an associated AP announces
> > removal of one of its links (ieee80211_ml_reconf_work()), and the
> > frames only need a matching transmitter address, before any crypto.
> >
> > Before the rework, ieee80211_rx_data_set_link() returned false for a
> > NULL link and the frame was skipped.  Skip it again.
> >
> > Fixes: 6d531b9af16e ("wifi: mac80211: rework RX packet handling")
> > Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
> > ---
> > Found by LLM-assisted code review of the RX rework and confirmed by
> > reading the link removal path by hand.  I have not reproduced the oops
> > at runtime.
> >
> > v1 got no replies but is marked "Changes Requested" in patchwork, so I
> > am not sure what is expected.  Please let me know if something else is
> > wanted here.
> >
>
> I've said this pretty generally before - don't send me raw LLM output,
> read it and make it make sense.
>
> johannes



--=20
Joas Antonio dos Santos
Cyber Security Specialist and Ethical Hacker
joasantonio108@gmail.com
LinkedIn
