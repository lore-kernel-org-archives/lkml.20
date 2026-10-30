Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793341057;
	b=cZgNQ9UbkEgzGj9Boi2s5/isnPu+OujiLOPQZZjne1koNvQcUm0M6PF3+PJ5TqJb0d/T
	 YRUXYPxXwLkBiQ0GocDDvxxZ7uqN5noAnk7NosviqOuXeOSEkhLYe6Qaf3Wz8kzjuNvka
	 4DQu98nk+HY8x9zogBv8tlYQU7+tU2NPBtpxEnpDkJvulrQpXbHb76QMC4kQfnJ9VIqwq
	 awMlkJziRGVmyyC+FZ1L/Ofl3D/NRPpvW7y8DJMx31YrHcUi6NysEGdQHJqq649IrFrPq
	 U+5uajKAap6B6zwOP9LywdnmFhUDl7XokNTn+97MZnWre5J/orqtz4+wxN9dwyvfb5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pZjUBS3kieBFv9QWkcVR3UoiF5JGMnsqA3e9Kn0z4Y0=;
	b=RJ5jznf50EYTm7nmqm3BaajPnW+mZn2+YqZFRY+3o3H1cc0Qa1pT/076DfcAcISzWoaw
	 lH1JO2k5jZ/j1X5whcGwmjOEv7XX6gZXDNImMcWWk2TSHGlXot/Y8EWjK1Ue7l1J4XOYz
	 32LE5pwYci46xq0DSdhchnm6FsTODKmSMdwnLFvllu3ngGhippZugxnvfmpKJcgDTdHa9
	 TcA+B+E2eP3YUecVrAAF77SRpmpJg2zPXGARTRS/iu1fngKnilXnqxM20NC2D2NH4vs83
	 5y2pE/GN/v2sBYswp5PeJSnsOjLZm+P7m9wsB7NxFEMZ6QadX4M9IlTKxXC/wWIeaEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TD46FCwJ;
	arc=fail smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1338606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1338606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TD46FCwJ
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be4fea434bso980091e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793341055; cv=none;
        d=google.com; s=arc-20260327;
        b=G876udy805+5orQtG0ZCwRRv219UVtwqeVivPtA3smdYSu7z2F29BgHt/f+ODAs8Jd
         GRUHstwG8vrHigjGuF8JEqaMWkmVIP1pmPp1k9CPpLzU4I5bpToII+z0g1Dl3x2l8yvx
         rWhI9QZPlMxjAHk3bGquQfr8XMGHZYPOKnRo3oaQHirDjWWkIfDDG8avNZkMRdtHjCM9
         JE/Rbmk37BxNTUDbZhrsUOK2+SX4PsTuvVdVE+AcsGvYUvGp89Uy5G4JpCnC58Fb+IMj
         QQ7cijYHVPhGoZE9lO/BtcqK5/bc7f1uO4p4LfbdQQt1XhhEUB22bNhKJnB3PD1o5b0x
         umGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pZjUBS3kieBFv9QWkcVR3UoiF5JGMnsqA3e9Kn0z4Y0=;
        fh=+ctqgdFdzUpXPj8WUWKfhIHUAczI/TcPh5U0lNNMuI0=;
        b=RpEJ5dG538R5H4kyAdZmhYsYWhn+wRvAfXIunxH3NBpQQVGBE1Y5t3b79irLlHneyp
         OriuJrd+TldH0/cj7Z66u7kQzBRUfpYgnROvCc4uMfXjn4WsubOZAJbTtS9y//4wHkZB
         dmEGTsK1gyj1/Y77J8DS4bz3t05kjQOI/kUonUpFDrXJ6KFFGNOFBZJMDNDcFP8Qqxk2
         tENDW1FFcXYWv2uNA1RXFItdqU+QCUUhrD/6w67/OI2i77K4XMPqEuBlD2VXKHW3Lo61
         zUljTbgadIqfcOoSss7u0IZwNqoDIpiAIcqSL8mltONymmQoSnSBrpKJ/xZWNBxtz/Tq
         Iaig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793341055; x=1793945855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pZjUBS3kieBFv9QWkcVR3UoiF5JGMnsqA3e9Kn0z4Y0=;
        b=TD46FCwJ48PWQ++JTVjnTHURAxiVSCJVUehHuE5xZF26M7cKoXVZKRehFwYeITOdwz
         XW3ej+L9V4GZoykkibdU1/GXTkUX/HJ3T41e8rknb+HfFoTFrrFyPVWpMMx7xpl0zHkm
         bfiCInfyo8fKdXvKVetbn+SnYHHa+xLqivo4P90kOYmCWEqHQG6Ku4WDuCyUnQoyDiu4
         2Wm9Sj6u3m2gAnkNe7b4K9CVl6vnj4brEkrqg2Krrz9AuoaWsfQTRmM8e4S8XOtzNEvZ
         Z00krKv59jNC4kZIhX6kpdUIaIFsGcjMpkGjQZHmEnYsBbarWcqJkwSNY6wLPI+gf0E3
         DeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341055; x=1793945855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZjUBS3kieBFv9QWkcVR3UoiF5JGMnsqA3e9Kn0z4Y0=;
        b=TmucwEOoFzlHt8FBcIIsu9vBZFfrRtmss01NX7Z+OqYx8mzuWw3vLOzJAfcLnXiflK
         fbYl4AyUbA9gzmazmXkH61QqOsoG8X3czDYWhF1Q3yLDfDkfsXuhgZ5P2N8HTM0fYNby
         mUO/OCzgkF52JBO0hiROiSkXI/G3IkxqR3nr/e2fNBhx0XK+TefnBCcM3aEaeZYpmdzr
         3nskAFPmQhgM+TsuhxCmMWrncEBmII8Mkcc5E0pnmmeFAxPnL1TlK+anKpMGLE3n09cs
         ukIrYlUssSitr57mjJbM4LV9H+j1/X1L6Vz4gGCu5kKSF072xD90nNhsNqKiT4speUR+
         IuRw==
X-Forwarded-Encrypted: i=1; AKwUvBw20pgHgfL5DU7VurY8WJ1aU6DmHydfIFuaHZDSXzBwQJljwdjLk33HSGn6ylPKuIkfPuJIi0klUeTUcQs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7K496JkuAmPQITQgZcErVP3wOySZOMvLIlLT1uCtkdQpaIShW
	UVk15lMow7iqVX5S49gzF3560KtPTmoWnwrtiTILeukjv+r3tinLX/tc5hOGeZuM8EvOAQax8zW
	AghVsr4fCB/F/O6IoQ7BI82ysYXMRCmU=
X-Gm-Gg: AYBFou2OK5DjHmIQd5MvExmcnO32vPSZ219yzY6k2OlSajuexM4Rrp1XwP9Fcz1Bdax
	ZqKdo/l/d+xJnPPVbnqfgGx+HkxQSoKnfTBqeHg/gdUMnjkArkx3YhmQ6ytAz0L2Bae+ZtWTRQ5
	raLqIKwMV8D6d9NhTGJdzJ3+RoY0mqKFF765l3fyinLnwDktfaxhpOSimvtrIF4AlU8SAbK9lio
	PzPlVUuHbW055Si5qWR0q35qURffEFlpqRLjw9wmhsAONAxdXCAC1t7BDyXS0HVx0gnCz7vCgVF
	ZL+bd7sRupYE8VUVEj2sGf9YQIUKqeQ4J5xKeCmjVEhfNollNcFoQEPhwIXKRiArznRD5qN3L/A
	XfbksqRTLbK1zbQeefbIcyxnMHXHDYrDxsAjxjHrJiBaOEGTgR2DjiZvmL16EqThLf60HHui/jz
	kcGJi/VTbFIca07gHTHjj1Pc7tJwGsNXZYeSazv2TAzT4rOWcQKJ8=
X-Received: by 2002:a05:6512:3d93:b0:5bf:ac46:c5d6 with SMTP id
 2adb3069b0e04-5bfd956d81cmr334864e87.12.1793341054873; Thu, 29 Oct 2026
 23:17:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029054200.97234-1-gyutae.opensource@navercorp.com> <9024faed-854d-411d-96c1-7cefd4d68dc6@redhat.com>
In-Reply-To: <9024faed-854d-411d-96c1-7cefd4d68dc6@redhat.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Fri, 30 Oct 2026 14:16:57 +0800
X-Gm-Features: AclHuK9fBg3EIjSbcv_z0WzBp7bKE-7jz6yFtnks3DmKKxBRExDPJTaJqejvlF0
Message-ID: <CAL+tcoAmq0WfSzo01xbAQ=g8OtE+GpJ5+RGs1G1SdNPdHx_eZg@mail.gmail.com>
Subject: Re: Backport request: Revert "softirq: Let ksoftirqd do its job" (d15121be7485)
To: Paolo Abeni <pabeni@redhat.com>
Cc: Gyutae Bae <gyutae.opensource@navercorp.com>, stable@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Minsu Jeon <minsu.jeon@navercorp.com>, Jonghyeon Kim <jong-hyeon.kim@navercorp.com>, 
	Siwan Kim <siwan.kim@navercorp.com>, Gyutae Bae <gyutae.bae@navercorp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Thu, Oct 29, 2026 at 4:33=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 10/29/26 06:42, Gyutae Bae wrote:
> > Please backport the following upstream commit to 6.1.y and 5.15.y:
> >
> >    d15121be7485655129101f3960ae6add40204463
> >    Revert "softirq: Let ksoftirqd do its job"
> >
> > On a production 5.15 PREEMPT_NONE node, long-running overlayfs
> > getdents64() calls prevented ksoftirqd from running.  RPS IPIs
> > continued to arrive, but NET_RX processing on that CPU stalled for
> > up to about 3 seconds.  Over 15 days, the node logged about 1,000
> > bonding ARP monitor failovers, with no link-state changes recorded
> > during that period.  The failovers stopped after the workload was
> > removed.
> >
> > On a 5.15.27 PREEMPT_NONE test node, we used a livepatch to make
> > ksoftirqd_running() always return false.  This removes the same
> > softirq deferral checks as the revert on this build.  Under the same
> > load, we measured three 10-minute windows: before patching, with the
> > livepatch active, and after removing it.  The number of HTTP requests
> > taking more than 200 ms was 17, 0 and 11, respectively.  TCPTimeouts
> > increased by 25, 1 and 21.
> >
> > We verified with patch --dry-run that the revert applies cleanly
> > to v6.1.190 and v5.15.223.  Both already contain the related RCU
> > fix 1dd1eff161bd.  6.6.y and later already contain the revert.
> >
> > The original commit was intended to prevent user-task starvation
> > under a softirq flood.  The revert's changelog points to threaded
> > NAPI as an alternative, but it is disabled by default.
> >
> > The revert was merged in v6.5 without a Cc: stable tag.
> > Syzbot has also reported bisections to this revert [1].
> > Paolo, Thomas, Eric: I would appreciate your thoughts on whether
> > this revert is suitable for 6.1.y and 5.15.y.
> >
> > [1] https://lore.kernel.org/all/000000000000a249880603717c15@google.com=
/
> IMHO such change should not land to stable lightly. It's a behavioural
> change with subtle side effects. The threaded napi feature is disabled

Technically speaking, yes, it's actually not a bug but an optimization.

> by default for the same reason. Also the revert has some soft functional
> dependencies in napi threaded cleanup and improvements landed into v6.4,
> i.e. 6bb218b5a6e3f3c5e2e76faf8fc976f3f6f72496, likely more.

Maybe I have a slightly different thought on this: since I really
received/noticed there are not a few reports showing the 'issue' in
the older kernels. It's not easy for some people or company to upgrade
the stable kernel. I'm wondering if it's still possible to land it
with more careful consideration in the patch if Gyutae volunteers to
do so? Please feel free to reject the proposal :)

Thanks,
Jason
