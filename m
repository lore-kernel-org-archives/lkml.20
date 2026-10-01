Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A785648FF8D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855680; cv=none; b=fHtd7VBynr6GBnM9m1JkKGgCJsDPACQYEaWKvKPWQ10kW0pDEISWWA7JH+f1g3HoJg9EeoArctvhOQmmJBEWjbV9IiI8yg84XC6g9boeI4/6DdxvNitHaROKTIg0OTrwKDNIkH+a/PaMcn3zXRYMfuQbQotZPh2AUsC8DSwAUc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855680; c=relaxed/simple;
	bh=baCT4wfTg+IGi44EpWy/Yu1MX338NQxsuAkGvm/V0ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFTqEijT+LzCM3bsqM8GIhUXT3Iv3Ljmv+kWwma3qfdGI5YXty2osVjO7RffR3KMwSRDxTMU7uRlDemr8ylx8hhvPLefoYimXo14hcI5FNmBQzg6VHiGxv4vZJJWyFhI4Kz+EqmN+O7re1Qp3ir36Svo/aVFeF6dALztjGYiMGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SY4Uhoz3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SY4Uhoz3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so29436785e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855672; x=1791460472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=baCT4wfTg+IGi44EpWy/Yu1MX338NQxsuAkGvm/V0ME=;
        b=SY4Uhoz33STtlz44uQtBpzJDF2+/79IyRD3CtMi5WlFIznWUaEKF4SniZHPcdxfLbC
         DPmr/B0BA/go6eALuf1qYwF2YEptp8NEp4mlNUFkCH3zWVbnsE24xAsx3JJQmJ7g5hdK
         ggJPPKZf8cyd4+ERWKOJ65Irq+0ScwqKD7uSGhR4CFs4qXBIGlsm00Z94GGQAAILY4zb
         AECts98hCuhNBNMuAYduAWHhKpuBaB6oSGXbfPooJvXTbvxsmnqeUWZKsnjCIfVneqJ8
         UZ4bMaI+sdfCVqM4/LAEnbdohpo+OtuIoavkhfqB4+R0nnQSUANEGLuiUvtS0dtPTTwC
         cuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855672; x=1791460472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=baCT4wfTg+IGi44EpWy/Yu1MX338NQxsuAkGvm/V0ME=;
        b=Wyq1lz0t+EuuTgHzYwNDzPTAqci1ipcYKSwx+NPw4q1/FyLWzrabCCxiDH7nPkGcxU
         YzQqKvi99KBj2Cte7e37+JWxXJJcAJtI5g/ANgnIxCKURou1u1JDZ2BT1f3EkcmMCqPu
         RwIqKD+WYce7Fb4wjwqREGpVq93UDIPRL3wnLfknysm+QBqJnp8E9e0REH6UyL5UMinP
         0g+4GvTKbMAtKmxpnQ0/HttdFjqHz9/OgbY1VctePbjMP/MRfQxk5RmGs7y1XgLPDyWL
         1SLsZhUqnONvC5fo/dQgsMzBXQK1g/YbXZU+cqPZye5oGR1X6bSDXMDrpv2DWKSiAG8H
         hlmw==
X-Forwarded-Encrypted: i=1; AKwUvByD0JyK0J/waUtEVxzTaywTRx0z1kOhmjGvIQwn9IqK2wlWQlc/zIwoJlL1z+QvuM/1GhU62LCm2y8pj00=@vger.kernel.org
X-Gm-Message-State: AFuF++mbLb7156kjxelT64V27z1jL7lhJ2/+D+clzQqgUqVJ50vbH6/G
	Q6f6dIYxNWcsQClGdjCFB/zGAzTShtlJwhlBadTGtMfuZY6guLxAmhpJ
X-Gm-Gg: AYBFou1mXN1xEcTeX+xGtyf2CBrPRuuBdQC1046R1psdK+DfETgX7qli9COp7POzh+V
	E83lATobYHdP9+awgWo2UZPDpAYpLu0m9nbwny8BUeQy+yCYMP0b39WxigMrsAIxJWmDVKKJ0v8
	DJhogiD225IjnotH2LlAafzGvAGblzJDZv0VoJsKYyMUgw9yBgCCO7mGGZq0j4xJbeT6LieBJfz
	JK/GZojfgWBmaDULWwQv4A7KaU/XEwBCAvWuJehlyQKG47HpQ5InT1IMhHMzmSz5Syx2Khqvt7S
	59PFOXNLnb/j2b5AEwI/5e9U0bj/KeI8Qgo5wV4vnjVX0vLvZBIoOi53r8hDBnZ2lI6BOKg3Wlo
	c6XneyEzSdPnmmz0XShhxk0mzvXB0Sy2DXYifY52MiQUQdCjdr+/6ANfVDA+SuYKdtTFGml92Rm
	OacC4JJedt9+SGlV2bzq+p/zVM4ghf6eHepLaMa9oRMG7GNfpwKifQ7SuOI6KQFCtRBA1QguHY2
	Ilw
X-Received: by 2002:a05:600c:3b9f:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a01b212757mr76481705e9.23.1790855671923;
        Thu, 01 Oct 2026 04:54:31 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f938f89sm56229115e9.9.2026.10.01.04.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:54:31 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v2 2/2] wifi: rtw88: support channel switch in AP mode
Date: Thu,  1 Oct 2026 13:54:30 +0200
Message-ID: <20261001115430.2979761-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001071822.17746-1-luka.gejak@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luka,

On 2026-10-01 Luka Gejak wrote:
> This work is not the only one that re-downloads the page. Every page download
> fetches a beacon, through rtw_get_rsvd_page_skb():
[...]
> A station that wakes up in power save during the countdown is enough, so one
> interval can move the count twice, for example 4 on air and then 2, and a fetch
> that lands after the counter reached 1 makes mac80211 log "beacon TX faster than
> countdown". Can the set_tim work skip the download while a switch is announced?
> rtw_fw_csa_beacon_work() rebuilds the page one interval later, so the new TIM
> still gets out and the countdown keeps one step per interval.

You are right, I had only looked at the paths the series touches. v3
makes rtw_fw_update_beacon_work() return without a download while the
vif that owns the beacon page has csa_active set; the csa work rebuilds
the page, TIM included, within the interval.

I went through the other callers of rtw_fw_download_rsvd_page() for the
same pattern. One more is reachable with an AP: set_key downloads the
page for the PG deep-sleep backup, so a station installing a key during
the countdown would add a step on a chip with that mode; v3 skips that
download the same way. BSS_CHANGED_BEACON during a countdown re-arms
the csa work timer, so that download replaces the step instead of
adding one; the hw scan is refused while a switch is announced; the
WoWLAN downloads run after suspend cancelled the work; the ASSOC
download is station mode.

I will check it with a station in power save during the countdown and
watch for mac80211's "beacon TX faster than countdown" before and after.

Best regards,
Mehmet
