Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732725;
	b=PXWRCuP6parqCm9PX2JXC+PlL5BfDfKMyjudkN9Y4TcKz9432GTR5S3b1M63VR6IGuW9
	 5S9Qlfd38oFxNCINztpegAcT5EzNXc7csOI9ZIRo7QVeyFhomAN8JpEnlV3iPwn3v9+zn
	 lTKGw4CV2/P5NeNYPCy4/OqmxYYpUUgaCeBCnr19Qfq64yNyC/x1zpxT0BdEvMDaN4rsA
	 z3k5o47t5vEFTiqUP3D0z5YqKbV+e+kBHh6y3GWyB4ZyPLk1LrJ55EOTTf8QOsFeQjEuV
	 OulTPVYiAt5noVQdlwxcu9VnBEAKVk1S0fGgDf3BZw7a/WzAZaoiUjXhRsjlEXmy9ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WtXsrBXeBrmea4xy+IMxZHACmlbGQ2t5B9G23jCH2E8=;
	b=hMJgo+Y+XrI+EyMsB+SPIpRmzmi++IwPkUcJ3RBOEAD1NoZL5JbOw++D+TSRMcj/UmCk
	 3helQIAoPX1eu4VCqfQ08AfLsqlWRijk5FKynrQ3hIj6LO22v021T+GPJeP7czsnIes+K
	 /Yp7MBD7Q8kLcKZxDtUPMyDJuDcyWJjM5DZhIwjfqkEiLaSlcclzK5zICzoAlP4qUFbsZ
	 IZTs6w+r63yJNNQRQtvtPLLmish8RwZ0oyWiM4stvY6YAr8kzkYl87rnivtg2M0D3L/f0
	 QH2XtZZf+WnHsVXZKCOTjOEF2fp5T+t/huXOEpz2bX6cLm6VnAMg0lF9xVKbS5AcIJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IV7/fYpY";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E185606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E185606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IV7/fYpY
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so29299985e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732723; x=1794337523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtXsrBXeBrmea4xy+IMxZHACmlbGQ2t5B9G23jCH2E8=;
        b=IV7/fYpYNuBEtNqc5z1/sjDc1RqRj4DijHdpMzPFCxf/E24ZACHz77CR7SHexFtAe9
         tzcuWCn6wUJSnOhsvrSJtxIMUouWHiVTKu3D65sP/y2q1pCmS3P56xpnkpHyALf2ZUZT
         2ZZntWnRVaMY+fhIRaTY6np78zVfPAWa8nsY37SUpOyBoWKcLONOkVjsZoaRpUlCDqrO
         D8PbhZ47XE1SZvIxeqHu/C9YPvuc4XBItAGZWc5lt8E03oGf4h1GB0SOg4c2+LZbU80o
         FBRuXHr+VXeHBqv/S6CYx1yAo7eUclm6CKCBgNXqdatTkvJtNLM5RzYyelSZ8k/fTVyR
         ZRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732723; x=1794337523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WtXsrBXeBrmea4xy+IMxZHACmlbGQ2t5B9G23jCH2E8=;
        b=xTTsEM9r2rbuZChCy/MldsmdpusFYZp5ZJrdF2f9kvX2vfYpXHB9MieP5P7HbmkaXL
         BvSHJkLTpgfHM9+V1BehNG2ZguIyktD2/x6o7gkRZQrid2+OuXbIW8V3NIhf7rYcOZxo
         tAzlPk3HWlTdReFahod2MenzIY/1yTpt1+oxijbC8QBM9G+hvaVlu9AVF22sh9YrzVZr
         FridxmX+0e7HkZiWmQMg4T51J0K4HjndJp38na+3bk/FPotvrP73K19agTuYYq9675Vj
         cn/+7jpmRCL8DyiFKszfZfVhsx7t5+UEN0jRpgUfPtOt0h94VtotuDv0VZuBHUma69i2
         1PSA==
X-Forwarded-Encrypted: i=1; AKwUvBz7WZGH/lhhdBVUvZocwatw4ezJ7GJM24huakOFFx3UM0ZNEHAhqtI4ak5XTuwB1WHD5x+aNkOByKcvSsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CqiNjM2q8+exlgyxfHducQMnrD3IfSK8DoOHqICnJ4Z9ddbDP
	1BhduXDO5FdSsLF12m7DZ6K2UGIwSVHh24Fq0f1QjkzWvAFgg7tW7ObC
X-Gm-Gg: AYBFou0Fv8kSsrLcZILAx9jdqvuf7lv7pE+NlSKiH0VJcdi3uayOZrlzJAd6TvOF4Ju
	DD4tLsqHztiMkZ+hEOuCHHaEEnrLiJAn/C+xePIelj75U/HxvEvwOsSFyHZXY/VGQauGrPS8hxs
	UQeF6lhHuqK5PqGrczn6LVgrigqu8BKR+wxqux765gb6YGgzx3N0bTzlhzZQhU3HE7+BdtsGU+e
	A7qoK0l5vN7XIZ4E1wvTvkMNEdQGuFoyaDXNgcB/tzfXvKXTkiuxVtgbSuSpcC+a8v0xsME9ii8
	KH153zKZTeHNosQ23BcndFJG0ZqPVmjVCbpPjycuIv8GaF0xS+tFih2drg+PoIVNodIWJDHb+eF
	mOVrA7aCm1Xy1Gu0+9/bpyxoTOzA8eR2mxQ1+T3lvNgbXX50vgr8kWyc3qG3UtGNNgFm+uueCPo
	4ucvfYZTp91l6hRaPEru04Hx0rt/Fmgh0EKa0eVTxHaBUZhnrGCs2bJcc+mLeGevjxBgHfRI7Hx
	Vmf6sL1w85q/+KlkiwBLDnzEoSzXl2DSxu7Vi73blJvKsOfOF8F1reQsjrmxbi1igHua6cO5OeT
	MCXJGdeXh7tslz5ljbwilQ9olhk6Nf9g15QcBTspM1y8dsf+6+xw97uqa1BSRfKTL+dJ/oykeKY
	JJYBZY5mY
X-Received: by 2002:a05:600c:8116:b0:4a2:150f:160f with SMTP id 5b1f17b1804b1-4ac1913eecdmr318548705e9.25.1793732723261;
        Tue, 03 Nov 2026 11:05:23 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4104d600fsm4202845e9.0.2026.11.03.11.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:05:22 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -rcu/dev 1/4] hazptrtorture: Release all deferred hazard pointers before stopping
Date: Tue,  3 Nov 2026 20:05:06 +0100
Message-ID: <20261103190507.1913628-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <178eaa0b-e7bd-455e-ac3c-f1115d731a52@paulmck-laptop>
References: <20261027163811.2470569-1-parri.andrea@gmail.com> <20261027163811.2470569-2-parri.andrea@gmail.com> <eb59edbb-c6e8-49c6-a426-c55cdb792853@paulmck-laptop> <9da03ed6-fea2-44df-8aee-f7a61a1d35ce@paulmck-laptop> <178eaa0b-e7bd-455e-ac3c-f1115d731a52@paulmck-laptop>
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

On Mon, Nov 02, 2026 at 08:50:51PM -0800, Paul E. McKenney wrote:

[...]

> How about like this?

Works for me, thanks!  With it and patches 2-4 on top, two 3-minute
PREEMPT runs with kthread_do_pending_ms=10000, which hung without a fix,
and a 30-minute PREEMPT run end with "End of test: SUCCESS" and with as
many hazard pointers released as were deferred.  In one of the
kthread_do_pending_ms=10000 runs, the writer also stays in ->sync() long
enough for a writer-stall report 31 seconds after boot, and moves on by
46 seconds.

The variant from my previous reply, with the pass right after the
reader's loop, passed the same tests, but there is no need for it with
this version, so I will not send a v2.

A few small things below.

[...]

>     hazptr_torture_cleanup() stops the kthreads in random order, which

The order is fixed: do_pending, preempt, the writer, then the readers.

>     Therefore, make each reader clean up all deferred hazard pointers,
>     which means that after the last reader finishes, there can no
>     longer be any deferred hazard pointers, which means that the
>     writer can terminate promptly.

With the pass after torture_kthread_stopping(), a reader cleans up only
once hazptr_torture_cleanup() stops it, so this also relies on stopping
the readers before the writer.  Maybe worth a sentence here?

>     hazard poiners.

s/poiners/pointers/

>     from the pending lists as were deferred (reldefer: 983727 relundefer
>     983727).

These numbers come from v1's patch; with this version, the 30-minute
PREEMPT run gives reldefer: 657653 relundefer 657653.

[...]

> +	/*
> +	 * Stop the writer only after do_pending, and do_pending only after
> +	 * the readers: the writer may be waiting on hazard pointers that
> +	 * readers deferred, which do_pending releases once they stopped.
> +	 */

do_pending no longer releases them; the readers do.  Perhaps:

	/*
	 * Stop the writer only after the readers: the writer may be
	 * waiting on hazard pointers that readers deferred, which each
	 * reader releases once it is stopped.
	 */

Also, "hazptrtorture: Nest a second hazard pointer in readers" conflicts
with moving hazptr_torture_do_one_pending() up, as both add a function
after hazptr_torture_defer(); keeping both resolves it.

Thanks,
  Andrea
