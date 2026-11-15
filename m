Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794770870;
	b=zVM6DmpxiH17hq9mpXtj7gjWmlxXbja4+OD+VQsFDiKCgtgrfSEYnkkG0KyJEUst1OzG
	 J8UGdS9cxgjk8QuSY66oPZX/uR+Tnteb0rOHQTQNwa9NVOj0n+Q4FD4M7Jl9QSAtoBZea
	 VWTSQTqfx+ILE8vk8Mu6ekhn6XA7IQQguEP9CMm3JUfChXtfggwVyKQE8as2sPwza5kdt
	 GEAoyJRw1+ln0FykMdLE7RZ1ZwnFgExE2PBgABcu8Fc9/LhxLn0w2hFZB6FAFKprJN3Tp
	 3jSEOj24YtZXFxHC3iu/RCwmdhaQzNkhxC7OUkA6Yj6L0paS7s4Fsr0NaqKC90n6Ydg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zK1HFeXb+5RIaaTyR8jNDy335l1vYAJOKc4AYeqRcfQ=;
	b=GxwVEjExaE2k8W2GQW8S2waMhVp+ABD9p3F4z0v5QO8Oty3+qAPzFfLR9b4Lw4OuGH0W
	 ddnRxQjTh3dX8WpHV+nV+4aDIZA9Nxm2rvgJmN4goWlW0RzZRTPM3e0Z9IzwQf/bWRBEA
	 3ORLovQ61azjHnCHJ/17DHEhEuPsnlm8D/RvhU3RipeZTJIUNG1F5UYqqZAaMP1BGvYof
	 D2csOeR0YhcVC/h+Byx7Sf5KEP45b3kOSombiXc2BgJC7/6hGHwUyQ4Z9m0gpP5rAimSS
	 r5v3F/ZMKDe0vhiwqz0giYxCxWoDrIsLRAxWStJPX5D0ZdDwhlvJkN5zZyVSLRKFwMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OIzoKe6Q;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A25C606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A25C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OIzoKe6Q
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so2826211a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794770869; x=1795375669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zK1HFeXb+5RIaaTyR8jNDy335l1vYAJOKc4AYeqRcfQ=;
        b=OIzoKe6QdCSPp0UTuPTRvk4jU2866oxArlCSwkQQ0rk53rt2m2h0Rnqyy6YiLEHn+i
         ITZXLfC2DUrD8/MZDW9gyQwYK9x1dzUzk9WxLCeGT5D6ItOCerMzTnkYl36CC8lZp3z/
         QW62V0XxpvRoN1GS0TkHQdDiCAYZ6Ts2thQFPvzO+6cL5HQ0E+Ga3CyS4PrSR+FzAFvj
         1tyEMYDbhKQ1TaM+PkV6c4kJtexkl5GKhq/Ex0ycn04KMaBIgs5oZmq+u6+pZOn8hrc/
         UO5alnT7IIqm7KPzUDKWF/63k5tGaQxQWWm//y+HaT6LoyxQSYAvv8vWd4/ciz4IOOza
         HNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794770869; x=1795375669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zK1HFeXb+5RIaaTyR8jNDy335l1vYAJOKc4AYeqRcfQ=;
        b=MaQBk+Br8yS7+wzgWcV9GAuW6C2gHobv9+TEOJxY1atBI21plwRMKRzZTk9GBNP5hb
         UwvJj0w0N7N9GBFldXUG3mXDcLtgo/qgJA/+kFeAFIjE3i2V12/+HfbsBz90xIfhW3k1
         kvOoS9Ra5/dSAAi9ohKVdg/Ead90E7Mu1k9eqX4kNanbT2EBcqHzWZrKUHT8aaqyDaO8
         oPSrn/M6hqien8Y2tWQqw2G3VpkY7Tfoy3Dmk0FXRH3zce6LVSuF+QR/Sc4zti8lq6z1
         1Epp2y4ZDUWyjVp/pmciFPTR7B/lTb1SE7zbeW7b5GB+QcxsS4CQqk4t3cMv6nXVDtxm
         2XOQ==
X-Forwarded-Encrypted: i=1; AL+hErFI0jZQzUySFEwNxyruYvoVEzQxZ0xBAMgeeYglCaHaToMMIUDGwB24v1WJk5Xt1du7Q8x6L/NgUpdwP5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FENiQA1jc3w2jVNThQ8aQ9ifYAmkZMQT26qvmPcR/AJgdkj0a
	aH2tJkzWX8w/5exQCgclgqDuCSaVpgzKWBhzKcXprLIHWHKrOk48DcFL
X-Gm-Gg: AYBFou2rXUiuUP8E7kOgQW9eHsl2+1WP75OWA1YAH7CjT9DsDQPM6MfyiIJ6jRMy5pI
	ULTP9tDlF04lfGt6mtQ3SipsScVj0hJJHweav4ThZTaVHzm/OKvZXm6GZVVR1aphn0v3f4qF2eZ
	BugeXDco37novb3pr0iebprgPc3xjDq1hNRtWfS1wZPMohFz2UNvicuIyMqOYzHEv2Hi5AjFRQK
	okncaJkvn2AosElRzK7+6DZSiFFqRLhBHZnUYgbrNVN3Zo8M768lpqXv+eeXbF3gPjQUzQzwBcM
	4dS0wduc9/o8pslH3cM4tNGFXqVgqcljKClvWcqCjgkeIByO/hcgDJ0CoxfzgEgPHeGhwb1D8j0
	o6xOWH3V33YPJbjdGxbmWpI/3Duq30nvuoyy7lNmNtoCD8k9QeLuF4Ks2gnqKRRnrIK16PFPTn9
	QsfgibXDb4TZ7lvG7z44sLiCe1RGDjPzjRDrJ8eTtu4oDppAFjKGJFEVK6fQiX2TOR0knmXhh77
	+LfFyJbRfSPw9/r0L3w6T0bRpQ6F7Pu9JNY+9AbfdX7fmHMgWbj8jxyHfnXDlQ8erRoVE7UbJlw
	89IYvzOBxQm4TrAZOEmpLsbdEvCwAvkId382N7Ix7rK0m6BtyoNXXQ/goIsq
X-Received: by 2002:a17:90b:1b12:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b1b09e5cb0mr8453054a91.17.1794770869377;
        Sun, 15 Nov 2026 11:27:49 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b4cca7sm5633895a91.2.2026.11.15.11.27.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 11:27:49 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ziheng Wei <zihengw03@163.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt7925: fix mt7925_reverse_frag0_hdr_trans() for MLO
Date: Mon, 16 Nov 2026 03:27:25 +0800
Message-ID: <20261115192725.8230-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115080239.910402-1-zihengw03@163.com>
References: <20261115080239.910402-1-zihengw03@163.com>
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

Hi Ziheng,

On Sun, Nov 15, 2026 at 04:02:39PM +0800, Ziheng Wei wrote:
> -	struct mt792x_sta *msta = (struct mt792x_sta *)status->wcid;
> +	struct mt792x_link_sta *mlink = (struct mt792x_link_sta *)status->wcid;
> +	struct mt792x_sta *msta = mlink ? mlink->sta : NULL;

The MLO part is right, but the cast still needs a guard, and the
MT_RXD3_NORMAL_U2M check below does not provide one: it selects the
unguarded path. mt7925_mac_fill_rx() computes unicast from the same
rxd3 comparison, so every frame that gets past that check arrived
through the one branch of mt792x_rx_get_wcid() that returns the WTBL
entry as it found it:

	wcid = mt76_wcid_ptr(dev, idx);
	if (unicast || !wcid)
		return wcid;

	if (!wcid->sta)
		return NULL;

Not every entry is a station link. mt792x_init_wcid() reserves index 0
for beacons and management frames and installs dev->mt76.global_wcid
there, a bare struct mt76_wcid inside struct mt76_dev, immediately
followed by the wcid[] table. For that entry, mlink->sta reads at the
offset mt792x_link_sta keeps its back pointer at, which lands in that
table, and msta->vif then dereferences whatever it found, so the header
is still built from a type-confused object. I can't say whether the
hardware reports index 0 for a header-translated unicast fragment, but
the non-unicast path in the same helper already guards its container_of()
with wcid->sta.

Doing the same here keeps the conversion valid for every entry, with
mlink and msta left uninitialized in the declarations:

	if (!status->wcid || !status->wcid->sta)
		return -EINVAL;

	mlink = container_of(status->wcid, struct mt792x_link_sta, wcid);
	msta = mlink->sta;
	if (!msta || !msta->vif)
		return -EINVAL;

> +	link_conf = rcu_dereference(vif->link_conf[mlink->wcid.link_id]);
> +	if (!sta || !link_conf)
> +		return -EINVAL;

With status->wcid->sta checked above, wcid_to_sta() cannot return NULL
here, so only !link_conf needs to be tested. The per-link BSSID lookup
matches what a3ea1c309bf3 did for mt7996.

Thanks,
Zhao
