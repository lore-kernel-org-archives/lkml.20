Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5134E3ED4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559630; cv=none; b=LISp8ywBacH2L5/Ui65F2XtDS2koyRLMUo14qSSL8YvIIGIIui+S550LZEdxcpZk/Ih2sJ/s6dMBfeRTvYA01XxqCExOgrgVa+kkIoSGuEDVyIjpaQ0PFkeq9E7C+tysz/GtO1on+vluPeQ/AdEtrwtgPwfDyoe+F0cCOpuumtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559630; c=relaxed/simple;
	bh=KwZjs64/rTuFe0HBKIyW10VbcdJrpzSWVqBnN+zFKDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJTEEsGlknDgxscftTfK1dVl5yZmTTPJhQsI/neGqJ4LnBimAdc0jJOnP9JVZW3MmtzDf+OAKoB2kxKAGQlPwaf4fAM1AqZMjXdirDQ1bjgKEGOchvZaXSiUCZjF30hPC1IpVqjVGBodawGdOydOtTILQRpVCtDG0Lddbw5EAVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UB/1uD29; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UB/1uD29"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a02718da81so32031965e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791559628; x=1792164428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=40jmrkdv9yTSAmdr7iVbfZIED5uVomcFd8fALW8sm6A=;
        b=UB/1uD29POMtua/TFSmvLQecBxQzsgZ0sdD6kG6YK9yXV8/xbhffxtDRMcarmY7ORx
         Fvncys5suZkthRtfxxyllkZCBIh7dQMtlTGyoLbynFFnaZpd7N4OcHxOYpYezTYkZ3zL
         uBa9G7Zpvp3b1ptGB15Sx1nhj+F5Dg142LuR2ZTxNV5mf7nR2RdQyJDyQ+/EIHSy7syV
         iH/Dkf83jq+lTTvMtz9ZANkTu5rWtzvAKFqpvYi6mGX6mYahrsmyIn6PKhE54rWTUAIN
         06oYwFdBXgN+DPygEfoLnyhzL1K2EVbMHbRYAzXdbqg/KYR1Me4OUm1ApEilv5V3IhaX
         MlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791559628; x=1792164428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40jmrkdv9yTSAmdr7iVbfZIED5uVomcFd8fALW8sm6A=;
        b=PT/rHhDJEBgM4Tjxlr+nv0upWNIq5Qs7OlTNReqeAW7UKXDw6NR0sh7b7Gs4XP3MrY
         6p9sMjj7gcp5nRnLCESEpFF6fdM8I7Ck7t/C4jZZqQysvBdlJiKPqB2dQQEwwVCXN2DK
         UtbvncFdJkB7sj2RVHCV7pgXyFzWVDV0CBL0HKPzpugS6BkNpuFpzgGf8VJboauthbc0
         oKFQyeOa+Kn3j9DKZ0vSYbnx1rPZQ3DUzgoc7Yz65f1nDVoc/80e7ayR2Q0bvjEESoeL
         //N9aahK//oLUedQxNRzqETYKk2BLjnOTcSHXw7kHABfxUnIJFmIdxTzuXAAipjttSVO
         sH3A==
X-Forwarded-Encrypted: i=1; AKwUvBz7z9cPaKqnmZdHIKfnIOBiNM4EHVVsbt+bRP6r4BVhTxY5HqPfWSsQL2NC9C3oDaC2/HLeISLFYjHkBFo=@vger.kernel.org
X-Gm-Message-State: AFuF++kxDfGLF/DINuygS0nDPM+natsXT3Y115SR87iNfsIK+3ZE20yf
	Qh1Z9BGlVYa4KuSZn2B6ZZcJKC7i1m5qwLOHpljMPLGhlGKKyQLHizPrnKvcy2kh7RI=
X-Gm-Gg: AYBFou1YInBLDNzBrAFc80zUzTE1TOy5dusFmqpaj1RgyIKmxQS/NorLwuuKUTL7jtC
	FIvs2H1bgkuXDpLmzOea28lEPmq4puDm9Z3dBYg411l1jXIuRjuVmGVcVA+bzfBjEUlJXhq+k08
	ax0pN/kxawGrWiTAK4iClo9MjL4Jnuj/7bQgwc0UiBxovy/PwjslQtZg8DjAtj8bCKL7zc05QRL
	xuP20C0/LDoGkFHb+mqd4yaeIQzlwWPoKD+d3MRhbyxPRBAQQQkAC9DfPR3LegwpNqhCvgsYE1e
	+knmlS1l5jZT/ynGY910FCdK6pCwUikREuRUaJTeQ6EOY9IgAJhj0wAXXBJ5tzcrRE8K3tgaii3
	fg5zHzWG/dyf7T4Gu39y/dDjmhRtjBrs1WHfE6WovV45MBw9yo8Tt7Bkt6gjZhq5ytoyy3B465w
	dF0xSuiDs/+kIw8ZCzivd9d1nflSJ0GdKNfanWxFoZrdmOjyqho0Gkz28gk8yXGzdPLQF4uOP9H
	k/L6yDyo6I=
X-Received: by 2002:a05:600c:8b78:b0:4a0:25d5:e853 with SMTP id 5b1f17b1804b1-4a18e4ddd99mr41776475e9.35.1791559627674;
        Fri, 09 Oct 2026 08:27:07 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea1fefsm75191635e9.11.2026.10.09.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:27:07 -0700 (PDT)
Date: Fri, 9 Oct 2026 17:27:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-serial@vger.kernel.org, oliver.sang@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nbcon/reboot: Flush nbcon consoles synchronously on
 reboot
Message-ID: <askHyBX6EPaMYnRt@pathway.suse.cz>
References: <20261008150852.8286-1-pmladek@suse.com>
 <20261009065152.udyfFRHx@linutronix.de>
 <asiu8orjDvRJMKuX@pathway.suse.cz>
 <87qzhzxatd.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzhzxatd.fsf@jogness.linutronix.de>

On Fri 2026-10-09 15:34:30, John Ogness wrote:
> On 2026-10-09, Petr Mladek <pmladek@suse.com> wrote:
> > Anyway, IMHO, we should switch to NBCON_PRIO_EMERGENCY for the post-running
> > states and flush the pending messages immediately. It is more
> > reliable. It is easy to find the locations when system_state() is set.
> > And all follow-up printk() calls will try the direct flush so that
> > they won't rely on an explicit flush.
> 
> We need to be careful about abusing CPU state in order to get certain
> functionality. We already have things in place to gracefully switch to
> atomic after shutting down the printing kthreads.

This explains why I see the messages even without this patch.
I wonder what is actually going on in the test.

The log contains:

</paste>
LKP: ttyS0: 256: LKP: tbox cant kexec and rebooting forcely
</paste>

I see this message in lkp-tests/bin/lkp-setup-rootfs:

<cat lkp-tests/bin/lkp-setup-rootfs>
lkp_reboot()
{
	local tbox_state="rebooting"
	[ -n "$1" ] && tbox_state="rebooting_$1"

	set_tbox_wtmp $tbox_state

	# Avoid get stuck in yocto minimal rootfs.
	# LKP: rebooting
	# [    8.124081] LKP: rebooting
	# # (shell prompt)
	is_virt && [ -e '/proc/sysrq-trigger' ] && {
		sync
		echo s >/proc/sysrq-trigger
		echo b >/proc/sysrq-trigger
	}

	start_reboot_watchdog
	reboot_tbox 2>/dev/null

	exit
}
[...]
	if tbox_cant_kexec; then
		echo_to_tty "LKP: tbox cant kexec and rebooting forcely"
		lkp_reboot "cant_kexec"
	fi
</cat lkp-tests/bin/lkp-setup-rootfs>

so, it ends with reboot_tbox which is:

<cat lkp-tests/lib/reboot.sh>
reboot_tbox()
{
	reboot
}
</cat lkp-tests/lib/reboot.sh

which is classic reboot. I am not sure where it expects the warning.
I actually can't find the code which prints:

<paste>
BUG: kernel reboot-without-warning in test stage
</paste>

I might need to try reproducing it with the lkp-test framework.
But it has to wait for the next week.

Best Regards,
Petr
