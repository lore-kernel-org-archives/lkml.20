Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505227;
	b=snbYF1EzTla9I0S9QKpI+w5xUE8E15eXFmIb/p231mWDBRgQHE88sTHKchOmdI7wxHMp
	 2hzwjLbcWrf8/e/ls5KeguY9HuKnwqDB3zOAze1M5egBuT1AIbocKCxub/vD7DhH1+bmW
	 bndOdRYByAhpLw8Owwcgoxnai6BredpC54aFHb5vbMI/c2YSikDkq/SlfXqEMswHX5B87
	 BduZITZDQ4mSGKesQbjOFDUP5zsIrE4SsMbD/6zNF2kZbAY/s9Hljr/AhsFIodAO7mM8z
	 pgH5w0D1VDFqi2LkO9lE9z9n2GICAcX937nSmiywYwo2+j+7D725MWHJ4MIT+OOZGOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505227;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=trto5Eq27UU3dCClttunJSNZcea48dqgIyqJACy3Yh4=;
	b=JLER+SJ7N+QwPx1xnlalP87TT+rWxWV1A/SjkywOvHwoFykOLX98Q0oxITAo1kH/mNnM
	 EK41LujfpI8bbqv9AUsUGYyO0T9eCs7qVZ+FvAhXOnUrnKZWV+3mo1RWvl6mrR6ciY1wB
	 FXcf5QFgGJbECD2qxOJihR3bLPi9T+Ra2Urgs7UlzJ2bLQLJQYROTtSs4HOSkCtTqayMI
	 Ep9oTDHr9W3MZfMXvTLvdJIYuvPlZjH2oPrHONfTFUzC+VZ6RGLAC18qM0Zu0m0fLeJWN
	 u5wDGopzI3qXZDz3CvndwgB4Oz8T0lP5PHq618d1YObUgf7zXACdWbOl27LFXtRE4/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsLbuBBM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB718606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsLbuBBM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE2D1F000C4;
	Thu, 12 Nov 2026 17:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794505227;
	bh=trto5Eq27UU3dCClttunJSNZcea48dqgIyqJACy3Yh4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IsLbuBBMQPojG5WcDrbDLgdx+I/5Jj+Edv7SQlc6tZdHJDYJcQvQlva+jFn4XfHu0
	 IKIPgSbW2VDNjKwhTCbFptAyGUp5q9po5UWfF/pI9Af4AXO7FTFx8gM2Bih/o0aqFv
	 yrYEh3PPMchsU1Wy9l/5rXkgegLYgeGybZ+yhaEfEEdM1POu+YLGqf+yOvj8KKLv9U
	 i4LUtDlD4PnfxHlCt83TlFxwj3tcdSZf5jyJfaLtFFagT+n/TB7jSyW0Pi960DXTPJ
	 ShrnPawduQrwb5ANFcBgEmU3yFLnNX2hMzzWB+QqW4wOyBf/z7MLMSXPhqvg8gcvd6
	 N3OkfMeBn+dzg==
From: Thomas Gleixner <tglx@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 akpm@linux-foundation.org, rafael@kernel.org, peterz@infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, "moderated list:ARM/Rockchip SoC
 support" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC
 support" <linux-rockchip@lists.infradead.org>, "open list:CPU HOTPLUG"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] smpboot: Allow restricting per-CPU threads to a CPU
 mask
In-Reply-To: <af37c4e7811a86adafb2064e7cf4aa4f5090ab4b.1793660202.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793660202.git.daniel.lezcano@oss.qualcomm.com>
 <af37c4e7811a86adafb2064e7cf4aa4f5090ab4b.1793660202.git.daniel.lezcano@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 18:40:23 +0100
Message-ID: <87zeverlrs.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 03 2026 at 00:09, Daniel Lezcano wrote:
> smpboot_register_percpu_thread() creates a thread for every online CPU
> and registers the descriptor for subsequent CPU hotplug operations.
> There is currently no way to restrict these threads to a subset of
> CPUs, even when the user only needs work performed on that subset.
>
> For example, an idle injection device targets a specific CPU mask.
> Creating threads outside that mask consumes resources unnecessarily.
> Supporting multiple such devices also requires each descriptor to
> manage only the threads associated with its own CPUs.
>
> Add an optional CPU mask to struct smp_hotplug_thread and apply it
> throughout the thread lifecycle. Registration creates threads only for
> online CPUs in the mask. CPU bring-up creates threads for selected
> CPUs that were offline at registration, while parking and unparking
> are restricted to the same mask.
>
> Apply the restriction to thread destruction as well, both during
> unregistration and registration failure cleanup. This is necessary
> when descriptors with disjoint masks share the same per-CPU task
> storage: tearing down one descriptor must not stop or clear threads
> owned by another descriptor.
>
> The caller must keep the mask valid and unchanged until the descriptor
> is unregistered. Callers sharing per-CPU task storage must ensure their
> masks do not overlap and serialize ownership changes themselves.

This really wants a built-in check which prevents overlapping
registrations for the same thread storage. It's easy enough to do:

smpboot_register_percpu_thread()

	if (!pt->cpumask)
		pt->cpu_mask = cpu_possible_mask;

	guard(cpus_read_lock)();
        guard(mutex)(&smpboot_threads_lock);
        list_for_each_entry(ht, &hotplug_threads, list) {
		if (ht->store != pt->store)
                	continue;
                if (WARN_ON_ONCE(cpumask_intersects(ht->cpumask, pt->cpumask)))
                	return -EBUSY;
        }
                
Hmm?

Thanks,

        tglx
