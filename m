Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E343AFD05
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464361; cv=none; b=kpDFuGAXyig9goyT7hAaB+t+6hVJTtpElgBe+C4vxuow8ai9DlfNaPI+0WKKSbninOy+l37glQ1Sc4Y2Ga5/t9vP/mWAB2eDwzeY7BUY/xJD1qckyAqKkG2YQ7Gl3Y/5H63kaiCKCC3e3B+tqIMNxlkudJOESZUi5B32u3TyoQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464361; c=relaxed/simple;
	bh=GHHsrZIB+poW6H55aoLeqQcet8zMlrq7Lbt0vt+UVyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s3bUnvvkFNMSRmm55In7k6BfhBuagBSWkYbOCkx7T3it/OBe59uw86EeiUIsM2Rx42mhYrEVG7/LC+CD6BcJ8jLerSjfNfWn+cJZM5VF2Dfw490fAb9Xs4MOY/QXJRFiHYKpJdQNQT+fF/MIx3IvNrKeCFsIb5jC7Yb0MO8BqfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADnUDsaD6lq_ENOCA--.52528S2;
	Tue, 15 Sep 2026 17:25:46 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: brgl@kernel.org
Cc: daniel.lezcano@kernel.org,
	tglx@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] clocksource/drivers/davinci: Fix clock reference leak in of_davinci_timer_register
Date: Tue, 15 Sep 2026 09:25:18 +0000
Message-Id: <20260915092518.1868587-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMRc=Mc3Gu129N9w67NzcPjK=EGgrB76922JiC3bg5NP9yzrTA@mail.gmail.com>
References: <CAMRc=Mc3Gu129N9w67NzcPjK=EGgrB76922JiC3bg5NP9yzrTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADnUDsaD6lq_ENOCA--.52528S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW7Cryxtr48Cw4UZr1fWFg_yoW8JFWDpr
	Z5Kw40kF4kGF4S9Fs7tFsrur1Fvw12yFW3Gr93CasrZ3yfJ34fKFyrKFyqvFWUCrZYvwnF
	yr1IqF1kCr45AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F
	4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU86VbDUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgcLA2qo-tpJxgAAsg

On Tue, 15 Sep 2026 07:55:06 +0200, Bartosz Golaszewski <brgl@kernel.org> said:
> I'm not following. If we keep the clock enabled, we must keep the reference. We
> just never disable it anywhere, so you correctly don't see the clk_put() in
> success path.

Hi Bart,

Thanks for taking a look. Let me clarify the point about ownership:
prepare/enable state is tracked on struct clk_core and is orthogonal to
the consumer reference. clk_put() merely unlinks the consumer and drops
the kref on the core clock (see __clk_put() in drivers/clk/clk.c) -- it
neither disables nor unprepares the clock. So releasing the reference
does not change the clock's state; the timer clock stays enabled for the
lifetime of the system either way. This is the same reasoning used by
callers that enable a clock and then put the consumer handle.

That said, I do understand the convention for these early boot timers
that are never disabled -- dw_apb_timer_of, timer-owl and asm9260_timer
also keep (or simply never put) the reference on success. If you consider
the reference intentionally retained as a subsystem convention, I'm fine
with dropping this patch; alternatively I could send a version that only
adds a comment documenting the intent. Please let me know which you
prefer.

Best regards,
Wentao Liang

