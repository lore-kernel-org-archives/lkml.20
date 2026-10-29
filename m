Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258406;
	b=XnkOLRfxMGIoOItNGc1ijxzfnTDgdmcJZzn5FUFI9pI0/+uCgRcmqcTNdMMLA2FfhUzR
	 EtR0SAU7ftRC7Neg+rch+6m6pC11WBhD7scdRo3JxCdubImlnWdNQdNJABqh6rozrtxmr
	 JOyJaxNhaAyYRqYLasIYACtO5stFThD91z+RikVZ7UklLbpH7FtVDC/Gql31/D77GaaDb
	 CaAcHukPtPeEcYaMin8g5ADBZMKNO4hRCu2V09OMKJFk7m3JcQU9hbFvEm+cth9TkNwbs
	 EZccfglARoZdsLhmNGSxuR0LEFaLY+WblWBnz1SNo1drFXzwAkKQsY3Jaqm3AAe6/cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=8wv7Jn0qLsai9wguILtnSGEOyF8SeWDToT835BgG09A=;
	b=qXWO9lBbJCk6xtqRAeVCS9plAqvhGiReVm0szQCD58xzra/vi+45c2FI2lIPOXu39fS2
	 Y9BiTV2C/GjUMIiUxkwgPElK9WE8Y/ZCbxaDNEx6uCB3GrvcpO0fRRphlAKrDZ55lYCyj
	 CRIT49koLcg4xuD06JrBQSdFRg0YVM9lk/qTKcIM1Koj6onPZjL+b4nhvTPto1DOmI/Lr
	 R6uCc6tMtjp3ddVKtSz3JUjR4y31MjGVrp2imdIxn0XCZGBGipsIP1ZrY6PrfoSy1PeeA
	 PJNm2ZwREWnewFEjRg7lPi5QxWDj7D+HdyOqpYXMagtjnIE+LJnf92S/g91+gmVrXgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=BW2Hg5NJ;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8C5606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF8C5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=BW2Hg5NJ
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1494870a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793258405; x=1793863205; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8wv7Jn0qLsai9wguILtnSGEOyF8SeWDToT835BgG09A=;
        b=BW2Hg5NJ1tlElNAvT50jab68nVpWnl2t8dwRUe8chJVs0BDe1vvP9x62VfMcZGWJX1
         V2mMuPNcLJ/U+bKErL/WIava+tLjoH6l7iozilaO2nT5Xbg28HGcqJ2cRi0daHB20BTB
         WYpepYvhTbgkkCEhqun66ij/amoFEG4qBbViY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258405; x=1793863205;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wv7Jn0qLsai9wguILtnSGEOyF8SeWDToT835BgG09A=;
        b=IBOveH2obl1K3HeHar5RuF1jVWh0DYsadZgKUAEMqP4cJJbZUO3x/l0ncrvhcn7sts
         jZtvAywrJcC4IzovjfLaolzWGrP7b8kFp2lQmm5SMZZTny9J8ryBOzvQ4qF4HgnnsKNa
         ORH1ZVqMmAIczmv2bdzs91g38AJMFES5qnXypTOWfalcO8dKS5vo1fRlQ76k7MwiDlmj
         FGWcJezIIWKDPfUDWr4TOYnzhtDlZyB3YTV64kKqTJmz0uZBiN50yMO9i8AHpm69dtsh
         0TwnH9XRIz8ZrzzlCqVICRR/cpMHe3+7lb2UMidKOCQ4n6KmVbsqyUBBl1/ozv+sHs4z
         USvA==
X-Forwarded-Encrypted: i=1; AKwUvBzywDuY1PTJOpzG8vLiwiwV/ltPG3RVBv3iMkyyNcpygfRni5deMv2VwQ3rVWtbwpZEy3hBpXErlO31Kx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJTVARONEA+tUkoF2zn6c25ADx8FxayXacOE4tCJ9+CnFimTP/
	9s9yaHdFRH9tdsToEOJ2Q1ARFl0B8zeuItqckVps0inig1xtlauQugg+bTrZEizU2P8=
X-Gm-Gg: AYBFou3mn25UhzaJbq6qbv4r1KRnsbKOjWErrWVarTdAeG5QrkJwaKp+97EwtC0lr1i
	hhwep870YIV0xrdONlr4wPG5+ipMrLQlqs8MimfMZHe2PAKRdLW4luU0b05DZpJ2EdKDf7uppsq
	97wMOtePpz2k9Ot8flCXR7toCO7W4dMjb/HfiavyKLp3EDlDS2p0j6ec279pwkhqy7ceY/Xuij8
	dQ7wXCPxgrHrmKsD64tL/1k8VRCoeqHce+HoK9pd/QDoE3ypfMDsh4naLiPRhjEnbAdeNH9M7E6
	TJGDmN0zJg+33ZSIJmgLWDR5OnFuopNEGbe4lo4Py0dGcJo/NTVIWSFbAUtIDWoTVR+atzHK9tY
	niks2pRf1F8tPwc8QjT56R2kF8HgHgWGcuAgM+kdvOKcomK6qZLGFuNYeJKWnWsJRyTzYbgGYXz
	T0+G6Zs+ZEFlfzCblQszT2DDUbwjsjQ0CLDAZ1eG0gzO8EVZys5sud77BOntHY9AI7ZtaQ42lxf
	3WXQRIfvqFbj0yPAdHVNwZkYWXPIOM9SDOs3cSko5IX5oy5z/5mpKdn2jdg14O5Bz2ug1h/fL7V
	9HLy5hBBNVKud2fz9pVwKvcgzQBSVawZZcyipNRxv4woSRKKqJwxWaH3D+yqPliNyK9kJwr3JGJ
	h220h+LpwlIiUGAZLQoHvgFPOkQe1hd3a/UakxFyqmAYTmPti2WaXpuxxn3W2uk6yVt4J3WH2gW
	mMOiDPQmwVpkJQxBZ+pg==
X-Received: by 2002:a17:90b:4983:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3ae5809fca1mr3333716a91.28.1793258405017;
        Thu, 29 Oct 2026 00:20:05 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ac878sm2842003a91.4.2026.10.29.00.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:20:04 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:19:59 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 14/16] printk: Do not set Braille console as
 preferred_console
Message-ID: <auLznwtHktgqlST1@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-15-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929120546.328616-15-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Petr Mladek writes:
>-	if (brl_options)
>+	if (is_new_entry)
>+		INIT_LIST_HEAD(&pc->preferred_dev_node);

is_new_entry is derived from pc->name[0]/pc->devname[0] being empty, and
console_setup() can store an empty name:

    console=,115200 console=tty1

The first one creates an entry with name "" (and links it). The second one 
stops the lookup loop at the same slot, sees it as new again, and 
re-initialises a node which is still linked, followed by list_add(). With 
DEBUG_LIST + BUG_ON_DATA_CORRUPTION:

    list_add corruption. next->prev should be prev (ffffb010209fc0c0), but was ffffb01023cd1fa0. (next=ffffb01023cd1fa0).
    kernel BUG at lib/list_debug.c:29!
    Call trace:
     __list_add_valid_or_report+0xbc/0x1c0 (P)
     add_or_update_preferred_console+0x6fc/0x9c0
     __add_preferred_console+0x11c/0x160
     console_setup+0x2e4/0x348
     obsolete_checksetup+0x148/0x190
     unknown_bootoption+0x150/0x328
     parse_one+0x108/0x480
     parse_args+0x158/0x3d0
     start_kernel+0x134/0x488

"console=,foo:bar" does the same on the first console= when SPCR added an 
entry, since it matches the SPCR slot via the empty devname (see 7/16).

Rejecting empty name/devname in add_or_update_preferred_console() (see my 
comment on 7/16) should fix that.

>-		preferred_dev_console = i;
>+		if (!list_empty(&pc->preferred_dev_node))
>+			list_del_init(&pc->preferred_dev_node);
>+	} else if (!is_braille_console_preferred(pc)) {
>+		if (list_empty(&pc->preferred_dev_node))
>+			list_add(&pc->preferred_dev_node, &preferred_dev_console);
>+		else
>+			list_move(&pc->preferred_dev_node, &preferred_dev_console);

list_del_init() and list_move() are both fine on an initialised self-linked 
node (list_move() passes the DEBUG_LIST checks in __list_del_entry_valid()), so 
the list_empty() checks can go.

With these fixed:

Acked-by: Chris Down <chris@chrisdown.name>

Thanks!
