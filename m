Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463091;
	b=bQIF/anGdOJKXffcte9bIf6GHuf/NKy3k7bcjR5fdPenR3jnZrPgJAT+h0PFihH9RSft
	 PKb5ttLPFnyoAWDeg8YGoqyX12jzQuaJqJAZmL40PHaeYUuAfdTwT9VcbbYEPnWvjxRLO
	 zuqn/GWGL7gwyh3W6UAmIxasxBG6Uv+R5RZmta6TfUYy0Vu8nKuA6uznH+DrSiYHt3/r2
	 yl6/cfB15fGpCyQiZtlJNDasiymTVmDfiOZ7ahlnwwG5uDX9skUnVvPnV/6CnfxzWTE8S
	 UWwp5WfbSZfMuMmTKnTz3U2HxNCk/V+mF88gTw+kVKHY4lHQz055IbGS75yAD1+QwFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UJdbe8Z1UGMii/S1oSNAgpt4OpGi3Zk0eQAxAhAGgRY=;
	b=K+1VjPDMJHrGh4mUceqJya6qYOhUdJEScj3Rl6zy4Pz6eUIcb6xMJpHLcLOHRmzmL75D
	 3D8DWewiI0uS4Z3Z9Z+k1wvTnQVBNEzXSreA5AXBFCK9ZSzdfB4ee1DjTIntjK2JvN1Yi
	 CcvS83wikbmzPQT6zYUlUn/Q9CIWWwpyKwkcB0z5LCG/L+bJg1710LPc40ASopvjziY88
	 Ic27xPfV/4W498BMWl4gHeI298ch6Btv7DgYQw47xTw4po7mBD7SYahWwyd35sMbw7/Vv
	 /D9XSaqeH2Y4NkRhtuED9yfSV8IqosRzuCGHXoUpOM7aO/D4VCX3twJtk2gGpdVXOfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IlWZ1DEp;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18A2606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B18A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IlWZ1DEp
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso5901453eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794463090; x=1795067890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UJdbe8Z1UGMii/S1oSNAgpt4OpGi3Zk0eQAxAhAGgRY=;
        b=IlWZ1DEpoL1evCfI2VAR75Ku7tw1Zjg2YLLeIhi9ri5yVjXupZvUugp6zN69YPs9th
         2cJKKL21y4y5OKJMhsAnCY70H2eVJLnYi43p2QwCSLbZR71Nqn7ux3mcxnLHtGmc/j8X
         C07A96joZZjK2PFW08Su9yvbDnPNDUr6qqYuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794463090; x=1795067890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJdbe8Z1UGMii/S1oSNAgpt4OpGi3Zk0eQAxAhAGgRY=;
        b=c+78EcvA8JZmxReHYtTrMbBNNCvnsrGs+N4rfel2XyBLA4uhUFoznG4l8rS0gO0MjF
         xYqfFapJYROm6edn+jGFlNKT6a3WCG/kvklxecjvwI4+4XodaLFGl7H3j9t9R4IvJJB3
         0ejjyVZiThK/PvNLF67bR3pHXpvGdFj6/daM88mNaY+NFm5CZnJwNA15omoAH2R9f03/
         pRX9sJv0In9/FDkwBX/GMdZ5rTgAm0cqSmXNkPPjFHC0HGgBm4ngHf3IwEhyxGZLmgnH
         fMkqI2pwmD+PtfgxV9M3tenbE9ExdW3Do5VrooYnqyI2NzupHvm0wZKAr/8lhzydO8ej
         +rhg==
X-Forwarded-Encrypted: i=1; AL+hErFuDb0yx5tcL/efLKcBXyDJKwkLgyc8PuIwraZxDt8UMZeu9j3frny3hQNhAy1dIra06tL7231DMNLIH6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FiWr3uc1dts52PMLl13Dck7gMEkWpCQAuHtQp2iOhSDdDcZuN
	QDr6jQbOJ4vSHtA3CJ0s4LOcdwO6xG0sKHVidu5+rPt0zdzv1mzi3jGvC0HTGmD6o428zqVlimX
	AVfg=
X-Gm-Gg: AYBFou2DO0H6fISVhvZ2W6ANOGCAtYtwLhm8hvAiT6KXS+PfFqYUPKnjX7xkx7RxCf5
	qNjdWQm+eOd/cR85n7cWuhJWxWFXIpt75wfJMV0UrxI+XOucdy+5/9/RMeHo8JdgMsl1alwdnkR
	4pIoxZGNSSxvmoVvRaLyMUK9FPeZ4BfZbxiWJbjepYCtPWv7ErwZOndYZzE2QeOqaxtvrv+P6Dm
	Jcx3Kv0zB5fXh0OkrY6pg0+AFrTVYjKjmtPJ0IG5ut6VdAoWlhAoSdUJ7PrlpvXCvORGQBvObe9
	eY1LSYtOmK+GNFMW1HRP96GID6c9D806+fa4yU3bXVeu6eJnRynelkBDiWL2uNjqq0xHSvUKyOM
	j95SLXg0DjVJCgTi4iuTl0DM9vI3EjYd35jfHnUEkIXuQ1VDMFjrIk+HD1rn7xrCI5DMESIGaay
	PLPb69bigRwmRbphErX6rexnLw/rB/GB3W/rQF1D8GwnvORYixEVj8U6d8Dq/z506wHjdR+yRc+
	EkxfD+t1Aq7Mj8545cjnCmKbfrp9l+DxOJo+qh30igoVVwDJcbGdSmF2KVvHNjbBfrs3Mxv/QOE
	b8knFSjSGKZwlDV2iXvUJEzoY5egPLg4hgsdiOEhRwEwccG6TSNfyaV5osf0Uv9cs8q6
X-Received: by 2002:a05:693c:41d0:20b0:36c:9d4c:6465 with SMTP id 5a478bee46e88-37686566c17mr4649032eec.24.1794463089494;
        Wed, 11 Nov 2026 21:58:09 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:a83:9554:c09e:5352])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm23839542eec.7.2026.11.11.21.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:58:08 -0800 (PST)
Date: Thu, 12 Nov 2026 14:58:05 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Chris Wiseman <chriswiseman@google.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Xueyuan Chen <xueyuan.chen21@gmail.com>, 
	Xueyuan Chen <xueyuan.chen@vivo.com>, Barry Song <baohua@kernel.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
Message-ID: <avVVRYkIAQnLC_Yu@google.com>
References: <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
 <179384102494.19062.12740032892044628762.b4-reply@b4>
 <auwOBaRtM9p_Wxfx@google.com>
 <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
 <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
 <CAO9r8zMMGem-LTJQseT5xSSBjfr3UX2gzG_ftpw6+KF8m9v5yw@mail.gmail.com>
 <CAO9r8zOY1E7gCYnJZAfKvyHcbj8e2WVuXMqsaPGPsKR4-9itsg@mail.gmail.com>
 <18e53459a8013078.3137322e32332e3235332e313736.12c7b6.0000sendgmr@google.com>
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
In-Reply-To: <18e53459a8013078.3137322e32332e3235332e313736.12c7b6.0000sendgmr@google.com>

On (26/11/05 16:53), Chris Wiseman wrote:
[..]
> Maybe we go with Nhat's idea (CONFIG_ZSMALLOC_SHRINKER defaulting to
> ZSWAP_DEFAULT_ON) for now, and if zswap adds a proactive compact knob
> later we can just kill the shrinker?

Sounds good to me (on the zram side).
