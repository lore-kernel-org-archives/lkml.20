Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458060;
	b=UHv+4ubASZPKcoxwk/hCz0m0Qr5mHwAkXfVvUqXrwJE1KPUL8GM5ufUi5mgtXSUYurEM
	 FWJd107ngKNlc0ZeJ/C9tnYrfgP3qcSQuGRqTpMvqTiEV4uOaKO0/kdicpvIjtRviek9l
	 1u7aHM9iS3sRnJhSgwypiK/xpgmriCke9MdM2T4aYoLsBCB46hwInpFeKHSB1xdjth+Ek
	 Wsv1KdeqeD7//JseBhVHbkHg1lVwC+0vHFfHKZq7n3idFJ/YcRUagzakCh28YZzs4ZcjH
	 Gb4wTwqI7yK7c9rlQzIWjjux9E6REOsIUFKYUkYHi37Oks5vPTCExnFk6f9euOybfOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458060;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Flowmailer-Platform:Feedback-ID;
	bh=RARPdGFOpymjJpoSOvkZ7QwTFzh+akN3FwghGunS9+o=;
	b=F0XqtRDi3zqVVSLx9xUW5HGVImmrvSt0cnDIZy/5oo/E/We0cMUY1XPa4oT6ostLTQmA
	 BFF1MAWku/jxMACS9qx6SLjk9one8SBvwS2BqPvMDqwqsTAamc4k392RI6hDaQyxzcNal
	 FEjsv0n7/5MiYh5tloV+/fuDoxu04USAr/obBVRw9nE4gc0Gpyfv5ti8jMZ2s4Rn1O+d+
	 gnWhNXdjuhX79DGJVJRHU8v2+2FFCSWZcrR0+GfpZvLO5+kvG6QJK95D6ZeN3QTLssYrC
	 wQO7jhC5TOinaYCf7ZkXSkqsbrUPbXCkPoHW2xVWUJl6jm2JzHrPGoih2AbeBDYNllw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=meng.ding@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=RTxMQDBd;
	arc=none smtp.remote-ip=185.136.64.226
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CA4606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CA4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=meng.ding@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=RTxMQDBd
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261112043415ca26dd80a80002079b
        for <linux-kernel@vger.kernel.org>;
        Thu, 12 Nov 2026 05:34:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=meng.ding@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Cc:References:In-Reply-To;
 bh=RARPdGFOpymjJpoSOvkZ7QwTFzh+akN3FwghGunS9+o=;
 b=RTxMQDBdADI8ovC2WPdHk/BquO6khlSuF/w9iJcD14LD1Q/WpUmD52lDbgUHOzR5ne8BGx
 xCEGlCZSb8N8GeM+3SZ8ztY9hRyIaQu6eK8NDmnUChRlwn7RaCA5KQLXdUi3bWCYD/v0j9Er
 /y2kK8taxTDcxmeMbgUTUn9xl4JesRDDVenzYKIzl0o6n2plX6JNtgzJirgu2LsONLMGnRAD
 UbJ/SKwBojpF7Tapnv9vACFg5zO8S3SYm3iI5lHU2q56ZZptBjrTTtyUVEYT9RhdiJT5Re7Y
 AgilNrGtYvJZS+iVdSKVNWIIYdbiE1ekVZEso+vnZuctJFKZ3g+33oTQ==;
Date: Thu, 12 Nov 2026 12:33:57 +0800
From: Ding Meng <meng.ding@siemens.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, Tony
 Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii
 Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar
 Kartikeya Dwivedi <memxor@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, florian.bezdeka@siemens.com,
 jan.kiszka@siemens.com, wq.wang@siemens.com, p@1g4.org,
 gerhard@engleder-embedded.com, Jason Xing <kerneljasonxing@gmail.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Martin KaFai Lau <martin.lau@linux.dev>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri
 Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor
 Solodrai <ihor.solodrai@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-trace-kernel@vger.kernel.org,
 bpf@vger.kernel.org
Subject: Re: [PATCH] net: mark skb NAPI IDs independently of busy polling
Message-ID: <4pqljild2fp6eotiicvwbwu2wfw66fzd4qamwt6utirdjxlaok@iiu2f3k7azrp>
References: <20261105071706.7043-1-meng.ding@siemens.com>
 <20261110134539.12d860ef@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110134539.12d860ef@kernel.org>
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1335312:519-21489:flowmailer

On Tue, Nov 10, 2026 at 01:45:39PM -0800, Jakub Kicinski wrote:
> On Thu,  5 Nov 2026 15:16:08 +0800 Ding Meng wrote:
> > +  interface index will be returned only if CONFIG_SKB_MARK_NAPI_ID is
> > +  enabled and the driver is using NAPI. This hidden configuration is
> > +  selected automatically by busy-poll support and by drivers that need
> > +  skb NAPI IDs to resolve deferred hardware timestamps. Drivers that
> > +  use deferred timestamp conversion must select it so the networking
> > +  stack can find the device and call its timestamp callback even when
> > +  busy polling is disabled. The struct contains also two other fields,
> > +  but they are reserved and undefined.
> 
> Just take napi_id from under CONFIG_NET_RX_BUSY_POLL instead of
> complicating everyone's lives.
> -- 
> pw-bot: cr

When BUSY_POLL is n under PREEMPT_RT && NETCONSOLE, igc fails to get RX
hardware timestamps.

Then, drivers that use deferred timestamp conversion (e.g. igc, engleder) must
specify a busy poll dependency if they want to obtain the original net
device upon consuming the skb. However, this dependency is far from
obvious, and annotating it for future features of this kind will be very
hard to discover.

Configuring the skb napi ID separately
from busy poll seems cleaner and more reasonable.
