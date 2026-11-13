Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582376;
	b=W4DRRDe4wE6QE3vcmqiCgClxNqoPQI6DdZo8BXMaBdMmvotXosjZC+feJ95I1iRNKqSd
	 oKu2cPzD3xnzrPOgAllDmOvf+VGmalaKDDJyv7jxYQru4BlDpnQ3iF2lNrE1+au/s52hv
	 22LxtO7vgcWyvsIF4puftAHwjjXin3v0gX/5C50zWkCRaoCKbZY0jaq0STQ8itumyPxAN
	 izZCyZzsb2PxBszrSdV4ycQjvL54Vr2eX0gk0w9lrhlT1Xy7K0p+TjsngSfbS+bue1fpM
	 WftyWhVdcU5W40v06vPU1MR8T1+tS2tr3Cjwo3yLbXbEcDfuaUK3phreKWzP5MXDqkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i696Qr9U2GcHUK/UnqEEL6xoYz649l6h3FsqJ59+e8g=;
	b=cLI5QyQp6N+V9eEemuRUriJETmqqp/YRgmqrWVgu6Gbuu73Y+mIZKHl4ZgVCUJCd6UJQ
	 0AST/Ic21riOCXYJrRghTpBTSInfx4Jf7yqOgG+Ws0vZoVIQfs6EAZXM+eBEW8BWAoa1F
	 K/2E9dtLBZsqscDP1Si31ilp/apM/jLt+IEY2p4O7SIkYA1DArqrcJM1pmIHaRoWINXcL
	 no6AHXuMSCWjP8Igxil1wy581DrEy5KubQ/zXj0vn0lMK2kQJsaB616zjMFn9rm5D8Tcu
	 BxApc1/otCRqdyBVws9ETQG2ScwGZgAabTxzFPXXkmpe9hqRiR+6pVYhTHMN7mgiZgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UIYgjrC2;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E1D60A261B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E1D60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UIYgjrC2
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so7626025e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794582374; x=1795187174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i696Qr9U2GcHUK/UnqEEL6xoYz649l6h3FsqJ59+e8g=;
        b=UIYgjrC2IgYrQ+gxpOzcd72bMdyu6bvVXHiTCouFwp7FslxN2r9mV6fWs8/Q4u/D8p
         K9fMSTR67qzM4/YEBQp9iGf2SyAptLhr2po+4doJ87U/uf4gsasLtISCHvbVjaGhq0/c
         lY6UecF/ek3c45FsmzySbB5FO/sZosjkGDgLi0bbso6WtXY3eLdFfXf2eJIsUmSykx07
         OE75xv7zJqzNX9vroa5/r0o852RsFEfZnmu/jORy/8mzh7pZr/7qjY+U6vFbS/yBVRM4
         UVwA1O5sZ8NapMGirfeYUy9aNm+hfo/H4t0SgcQfAzLjZSCmafqzKcvOuVanFV595J9u
         XY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582374; x=1795187174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i696Qr9U2GcHUK/UnqEEL6xoYz649l6h3FsqJ59+e8g=;
        b=O01qtKia4SP2n7OUrQgIx6Xt3YKDn4fAYA7QlPQkFL5LZjtCD0RTUeaQnRuw91BwUf
         QTDxOeFn+MHJ+07Qv/bRD/3dQBoCiuqj62Q0kJlqObbIHP/6i+GGdM08ADjvZ7SCRmcd
         XD1+dCrfdWGZ94OiCDA2eIoynaKIjULTC7o4O75vat8HxBqQ4rw6SEj1sRwDonsxajGZ
         sns8+4iAuSNB9jqf3zgSU1fAyt+lxYQAwRCUKLZxym1iwX+//lgqsypEwaGrljK4Uwsl
         jrYbOsZ1QRkSA/cRYOaXHndrgFQ/wg3K7je/k5M1nPhY+ktKE0vyZ+VlxgCka3wxaimw
         ywog==
X-Forwarded-Encrypted: i=1; AL+hErG2iH8POgDEmbP1fDlGOmW132MA8Cvo/dDtwAEDA0NTjAouD7Eppjw8rAI7HftMeu0h9FbvD45SR+/fn6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w1qrM/qaK2I4kAfA7GkjswtmYjjsHCYqWQRcuUynqbULwsUpW
	rO9IKycgiinYnuzP9VNM8nk47iKYSD/TMA9rozIh0mU4DaHIs96HvnXs
X-Gm-Gg: AYBFou1NDOiEr29kz6vSWPAAGtlhHBF6BE4WM9pg8CMPwmQMh8Xm0s72llOTcTShaNz
	QkOyo0lbji4tiIZUQHMJabGagYGCcAi4WOCf9EDVyez9Me5Q8FgoUoiEJko8KwBIn41SQBL/XPk
	H3MN9iNGwZNwEj3d0MOUrn/ErWo0zd3SS1XTIruZAWgpXvG+KMT8Zf542WCBAjzyG7/ihcCHQkC
	GZCxfUZDoR3yHRX7XHP8hAi19ExedkmlxVNozhZxboW9s+ACHVqwm4ye7dk/QmrBll4dsZc6r+D
	5ucI+aXWEI8jZvf5nzKRoDUi/opSJ0cJe2zo5/Ns5PtcQwzv8lVys8pcMozyz9xhK0xaAOfyia6
	DCZ30io4DYaN9czzcYTtP917ACXY4HDai9SeF0OPM71mQfVW4q03mncHsrpv+PI3sbeV1iCHeSx
	gq5Pee+Vf1f+K4nLbZnSp6qoHZNMo2YCukgbkiNXf4qBynfWou6T45iAkCpfB/ljKPeK5JOHDE6
	Wy8KiWX5FvOHrH1Bbh8MKqn/sblTsY1rqJTkA/XoPKwHrpqL7A0AIskQw1+irMN04jBUKI9mJ6x
	slgfskHFz56E2GfWZukG0F2Ro6jfcWV88bhJhtRN8sZpUHGoMJZ6MW3DI+h5Yn1Awn76oYF6Mr7
	Bkw==
X-Received: by 2002:a05:600c:1c28:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4bb55a812dbmr68819625e9.27.1794582374202;
        Fri, 13 Nov 2026 07:06:14 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.56.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56680ea9sm44176485e9.0.2026.11.13.07.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:06:13 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Juri Lelli <juri.lelli@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Dario Faggioli <raistlin@linux.it>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] sched/deadline: Check SCHED_DEADLINE affinity under the rq lock
Date: Fri, 13 Nov 2026 16:06:07 +0100
Message-ID: <20261113150608.9233-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105164856.29698-1-parri.andrea@gmail.com>
References: <20261105164856.29698-1-parri.andrea@gmail.com>
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

On Thu, Nov 05, 2026 at 05:48:43PM +0100, Andrea Parri wrote:

[...]

Gentle ping.  Juri, Sebastian, any comments on this one?

Mathieu's v5 [1] touches the same code; I replied about the overlap
on his patch 18 [2].

[1] https://lore.kernel.org/20261108185406.1549770-1-mathieu.desnoyers@efficios.com/
[2] https://lore.kernel.org/20261108185406.1549770-19-mathieu.desnoyers@efficios.com/

Thanks,
  Andrea
