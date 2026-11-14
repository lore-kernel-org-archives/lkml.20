Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626102;
	b=kf3Imykq/0zsBy/X8nQvjuQofA12OZ00VXg9uY3xQDca4kQXalrgr5Q24S4ZzHkNSE7o
	 kGwFrcrLlQUM1WWS/TaigKz6Wz31LOiPRQoV4Q0x5sazJp9/ywYHrqjg6357SOWaSMo/+
	 F/ZQkCCwYW6JNDguaB7qyRNwNtF7u3NFmXWAMvLNmu4JIC+NL9UKSSQL6D7KoD2hPS7j9
	 kg36WOJphX6/sMpDz9XvZlRRmhxJQpC8KWUIRyOSKTh1BI3JT97A5znPASgzbxMvlHV2d
	 g1gsChVqGnokjMPzZ/zZjRbRx4/WJWNPN1OZy1gGcOA82chdKvhcZFiE+6qz7d+e2yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626102;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=uQ1xxDHv5qhDKLMrjvd/peKgYhy+qeIMx2uBdiELiF8=;
	b=wUCBNhjOpQr6zo+nvObEojoDFVFe7YQSDjsBUaM4w8JID3i1YNngDgcawdKX3k2Z53mh
	 ERTuLT7htb28HmOy34YeGQFRpCUp4ZuzdlK9TcbENnTc7Be6h9cuOpsjtiHwbmvVIQWKl
	 rXZ5af66SSm1HjeMqPASXhiGZendC94jTqdzkZ6C4uH3SkMpipAGbI8Vp8XyijjLqt0hf
	 DIABVjhdd3ZTlMY4Fs0DjGEAZeiPaHZ3QgGD2jrYew0CN0jV9TXBfBvVymSCgYQoNmxXD
	 jIDtTUTPy1YuSxMLv+1pDDRQW4fvaHPUsLv3kQYrJC/tOV72JC8KdrGuFONLbXmzuRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="PNOT4me/";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F0E606A8A4
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F0E606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PNOT4me/
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so2226275a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626102; x=1795230902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQ1xxDHv5qhDKLMrjvd/peKgYhy+qeIMx2uBdiELiF8=;
        b=L6JePgqWhvOF2R/WDue2YSX+hIz+l9cBWdAUGg8NTvqxo4IsOeGchi+1Rso35ZhPQ+
         93Z/Fnk674Ym13ID6LTtLtrJuhCZAdOrwJp7yLagB1q/+1bacq7pNGlZQCbVx9FiV/lc
         0hCWgGoS1xF88S5nYDWlALjuNTgnjt42fj/aKJxgBRLkIkJ8BfWzzrdBAZG9WmuGKvXU
         MJGIvqj1RfVZ6KW4+m+QKeQvPcQyhVWrbRoA0EK1o0Sm7JtYz6MZOrosuQjNbJy6rLJX
         tqS6ZSRTb2hZ0cmsmhMa+mPNiWIMWp/suTNwHIAAecUZdhltRvj52uFCrVZvftLNn8eA
         RROg==
X-Forwarded-Encrypted: i=1; AL+hErHt+nJ0kmqRM7xAu363nDsnVDQsL6SpmiU7+vLuLW69MMdbXSquT7zPqvxnlkLPpaNeeMG5EEaxIwdM2Hc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d+ETVdXN/2jlrDONzIKvz+UNCUm4ZZZ6AyLppT72/7C8tPDQe
	w8TZI97WzsWfeV4PhyElKnXPo4w9uhPNcqK1gOtQwFe5ldZfbEa3HZS4Zj4T0gI3fuaIoaZcU77
	Oa0IwdyRZ8qBYw6Dx9Z+RM6omRu4N65bHJxjDHDyPd/XZFnoP7X6q7ecu26vE9KgWEetWVvmUFX
	Z6LodF08dQrWQnViIfTFrS6ZxVK9aowRW4DVGU7do3UOSU1hpWXV7xgxAB2Ynmd22hS6/aWdKKm
	xomm0xceeFEfDI+ZpsrNGwZ
X-Gm-Gg: AYBFou1K8ym/UnRErO633cIiFWyMvRVssLhZmBh+h17635quc9r27VaMs4c85IXCekR
	56PWw46+Mpi6M5AAJkxYsHrbhcFpLQ7Jp/c7Wfx6yVW6FEBLNGrZ0yf8WN5hTgn9VblmKNFwgUC
	/uCZ4rV28iXr78wHSAIhSI7O/pexSJca3yxFcEgk0PGajwLoM3C01ytWJeuxBQgzB9MK1HEnS2/
	0TzlsnwJYz6ibnleK/wHJngli2ViyC8djXN8GhtLoCUINlZ1scP8sw5FfW1k437LWU9pdhTpXCx
	8Sy95b3INYuWHl71VSYpJAVZRch1r7xZl4X5x85kAS9fkM79oGfmPh7mAoOsIzti+roBSQ3GuUT
	xKX8Z9159JMOKcXC4G5Vx180uJzgIFedaqaDkT01iK7Fg1I8W35MrJK7/IMlNWgjK1dQp5k3g5U
	6xMtyTiZ4s6SoS6AYwZmxrU+NYB8C6E5vY90EZQ4G8
X-Received: by 2002:a17:90b:3890:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3b1b09e69f1mr4431278a91.15.1794626101718;
        Fri, 13 Nov 2026 19:15:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae96f054sm6565086a91.3.2026.11.13.19.15.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:15:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495dd0f07eso204951185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626100; x=1795230900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQ1xxDHv5qhDKLMrjvd/peKgYhy+qeIMx2uBdiELiF8=;
        b=PNOT4me/XTtLB84/IdE/RjAyefKaSnDTluKkvRAdw36oGyTnO4EBvIVxBTlhPY32y2
         oMg/kuxHHaEyora8zdpvgtPDOFeIiVUa2fR6YQcqRDMxaEXnid7Fd59817MjoglJPYoC
         oBUWYDsdN+2Xfl1u3hbLADgAgHTXlxlJeDQ18=
X-Forwarded-Encrypted: i=1; AL+hErHC9VXGWafLpq5Um0/U8h11qtIJPhcWXo/zm0LxLVRmHeBoBYXP9wzcZEPNvY9CLCBx9t53OSCZdhVpSAM=@vger.kernel.org
X-Received: by 2002:a05:620a:394b:b0:943:f31a:c0a8 with SMTP id af79cd13be357-9494bb76dc9mr772454485a.17.1794626100298;
        Fri, 13 Nov 2026 19:15:00 -0800 (PST)
X-Received: by 2002:a05:620a:394b:b0:943:f31a:c0a8 with SMTP id af79cd13be357-9494bb76dc9mr772452485a.17.1794626099956;
        Fri, 13 Nov 2026 19:14:59 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949689e4e9bsm13970985a.17.2026.11.13.19.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:14:59 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sander Speetjens <sander.speetjens@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] firmware: raspberrypi: Document memory barriers in property list path
Date: Fri, 13 Nov 2026 19:14:57 -0800
Message-ID: <20261114031457.871211-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-5-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com> <20261107-fix-raspberrypi-firmware-v2-5-5bfe605a5cc5@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Sat, 07 Nov 2026 19:21:35 +0100, Sander Speetjens <sander.speetjens@gmail.com> wrote:
> Add comments explaining the wmb() before the firmware transaction and
> the rmb() before reading the response, as required by coding style.
> 
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
