Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794121953;
	b=EwlQ0CJZpWn8c04jHCBwFJAvyx8jZ7SuTSUQtD/L3N9ZEohdbnVGGdZigzee+qUjFqmd
	 t6jyrqg0SiPEkq8KZuYMkPl4vCHN2TwTbwLCunXkOHaWxKuxwUzp88WeeLli8k7BsW0ax
	 6H2L0365Wkt4Jl8oBrfbasR71N115pBxgID3vbyA6pao0gwo9GEr80+1KVuQeqoLkW262
	 xWl0jFbx+mS/epbIf6KS31zsNjYtNcCguxHO0OvbmuJGv3vEOUsjmjJ8qASdYaaaQcPlX
	 pRsZJ6NIHVM2k50FqdAhGmzCaLaOpnktvuy4oFOpiX9hgRxJ02gfHAVtvVGClc+9E8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794121953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QaX11FKlbrrxel5yt5lItqhWglhL95q0Q/UWvFGwSEM=;
	b=S/YccUq+7+73QgJsp2xBpzPEQdPdIw/zloOhAk2+O/WcyYK6RjM7QBUMrQvGKVpUeF2H
	 oQgBw4DzhTTY7CZF4kfPwa/kKpsfja7Q45Au3Zkdy/bjTQjymV5h1ZVSY7rJidQzlUkjX
	 vSQ0H0gB4KgqXuV8XWp/UeFlWhrpTjR07foU7ap7flFKwkPv/yh+Mf8wmwWoFyyCh/WFH
	 gvMkX6CAJJwLPnuNtQfZ9xQKIhJrBPpD4Nz/Ca1DryOlVetmCKiA9T6LYHNctTjXEwuHR
	 l2X6dOaletuwsJy0VewYoVk1NmcKXmYmNquI0y/ivxBOw/z0y7VGY3vkixC7nstlDig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhNZ3HwP;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4386606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4386606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhNZ3HwP
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491aaed7565so99145f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794121951; x=1794726751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QaX11FKlbrrxel5yt5lItqhWglhL95q0Q/UWvFGwSEM=;
        b=UhNZ3HwPUWb+xsU+LrB9nBdbR1CFNHYoIhf8bYXVRaVpgKnz85xHpaEmfk/PNrPQz2
         mkMtHK2+IOess921ezEeH1kaRuBfb1gRfzVjCmdCWR9LH7w2KHZGG68DeZhrcceB2OU1
         nLjzBlJ96rhGWGjufIbJWTcZUd36JkJIaSs/tRDfWq1Spntglf+D+fYA+1Bt1w+Ques8
         VW75Ng9OJxgQQ7+E7v/TaEC3oUbpdnkI0pKBR5Swp4G9Q6ql8S3Gwo+ouc8SlzXxCVki
         17aStwfzlHx+IEg63Da0M4w1/j//VSshjYL7I284x4JTIumEQokRrMouIruXdmvbSUOH
         jtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794121951; x=1794726751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QaX11FKlbrrxel5yt5lItqhWglhL95q0Q/UWvFGwSEM=;
        b=JYCvnKi+kans2eJPJEo7Dl+YT5SEphHrRi/SAefL993gP2qy6Qw+7Gil+0WAGRYFmT
         93IPRYS6bp8RStx17TJQPlbM5Zf3S6s5MTFXwWlOTxnVjyvPEebMQTVe+v1IYZw/3RUC
         +5ypvcBjbJpMQOXgslpASUo2k0xDZ9vEk4NKV3Wdi6DISN1cgHWU0WSh5yNsM3Tl8cMI
         1ioIje1ZeSRJ1pi1YaXZPjJRl7INJTuiLE18YmFbiDWrUZxJnM1S1TNhR2+jCyOLGywq
         WpeKJpZPoHrnorSOwKpT78CwLghbqCyUNWQkn0dA+M/Wd4Z31I2NrxhszLCgPQ5GrNX3
         H9sQ==
X-Forwarded-Encrypted: i=1; AL+hErEj00qHgdw6TywtCifFcqDo2KHc8qS/Sha2mOARUxY6QkI0LKJrLaQkNxUvUX9rN6z4nYA3zn3rHer1zy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Si5QE0cByhwQN/RzaGIlq9RAMe7fw3vg2+PiPriUu/zEagqIE
	bU0DU4OLlOv2OZlIvNr2HRzTGS5J8Ojdy9UAYXCfpIb+69k6Xo3oeMYK
X-Gm-Gg: AYBFou0tgXI/+jf7+GAQuF50AvNTg1dNcox6dEX0wHNmBFEQJyZhWMxZrIRaTJAsaG7
	Be3OEtggs1BQCfl5ENt8VUlo3fdRWxnRgHIyCJbQFACk+Pi9uBD6lqhWYH3uiEsZ/KFs09q1ZiO
	pVUkt4/XTyVnJaQ7eeMKUQY9Jac7LBuReC3zoS94lJiXX+EjZBOiyzP4jGM0vn6GRChElXKzf18
	iGnUIW0PYhoCiuY3jMDbX/8VkYdCALS+aVaubBlYXzLkkqHOPsz1VyXXg5Uwy2ZEi/TqSpmnI4x
	Eh4qB5Fy14pXNz3/57c++MTlj3Xx+KJYypXjzR4M3Td4K4/gYNTtIn/lvQ9xUzFnaxouG4ZL4nR
	EdD6oTofOF4O0jFAjYvflsH8VfUb70KbNoNXx8cjrsiLdam9xts0NoaGtfFYjorhdlUhnpkels1
	lisoHDe1USPZmSg6G5eTX2Vav/z5hL+1A/AoG1kYPW3NufBZ0BAffG1/hxO1GRgN1/vGhj6NiNl
	KeXDMImQS8g4zl2ifTLpCzzGZHOBB3DqbgP9X7IOUGpx7iKRN7WIeGKox3xdpnODGWlbXVozTf6
	/K8Wpr7T+T6jhGBQ2Td9kSRwHIf5eFXyB1gvWWF3uy8gGznYsMckRCBAfVM9E5Dgs7+ZjHzcTRT
	8JtDLjsP2WE05fxwWzw==
X-Received: by 2002:adf:e193:0:b0:491:e28b:1e1e with SMTP id ffacd0b85a97d-4958335a7efmr1603970f8f.28.1794121950867;
        Sat, 07 Nov 2026 23:12:30 -0800 (PST)
Received: from localhost.localdomain (bba-217-164-30-115.alshamil.net.ae. [217.164.30.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495b90701c7sm2609204f8f.10.2026.11.07.23.12.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 23:12:30 -0800 (PST)
From: Ximing Zhang <xzhangjr@gmail.com>
To: Hugo Sales <hugo@hsal.es>
Cc: Ximing Zhang <xzhangjr@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Len Brown <lenb@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Ashton A." <me@ashtonantila.com>,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] cpufreq: intel_pstate: Send CPUFREQ_UPDATE_CPUINFO on max_freq changes
Date: Sun,  8 Nov 2026 11:12:25 +0400
Message-ID: <20261108071225.54656-1-xzhangjr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101185807.112449-3-hugo@hsal.es>
References: <20261101185807.112449-1-hugo@hsal.es> <20261101185807.112449-3-hugo@hsal.es>
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

Hi Hugo,

I tested the four patches unchanged on an Intel Core i7-10510U using
intel_pstate in active/HWP mode, on the stated base commit
5854d2ce4b0b9ccb37b154319d8283bad889a694.

Cooling states 0 through 3 followed Turbo changes in both directions.
I also ran 100 CPU 7 offline/online cycles concurrently with Turbo and
cooling-state writes, followed by the same sequential checks, and a
suspend/resume via rtcwake -m mem -s 15. Turbo was disabled before suspend
and enabled afterward. Those checks passed with lockdep enabled and no
new warnings. The test kernel was already tainted by unsigned modules;
that taint did not change during the tests.

There is one remaining Intel hotplug case: changing Turbo while CPU 7
is offline leaves that policy's cpuinfo.max_freq stale when it returns.
I reproduced the same stale CPU information on the stock
7.2.5-1-cachyos kernel, so this behavior predates the RFC.

On the patched kernel, starting with all CPUs online, Turbo enabled and
cooling state 0, I ran the following as root:

    cpu=/sys/devices/system/cpu
    cdev=/sys/class/thermal/cooling_device0
    echo 1 > $cpu/intel_pstate/no_turbo
    echo 1 > $cdev/cur_state
    echo 0 > $cpu/cpu7/online
    echo 0 > $cpu/intel_pstate/no_turbo
    echo 1 > $cpu/cpu7/online
    cat $cpu/cpufreq/policy7/cpuinfo_max_freq
    cat $cpu/cpufreq/policy7/scaling_max_freq

These report 1800000 and 1440000 kHz. The policies for the other CPUs
report 4900000 and 3920000 kHz. With the Turbo transition reversed,
CPU 7 returns with a cpuinfo maximum of 4900000 instead of 1800000,
and an effective cap of 1800000 instead of 1440000 kHz.

I restored the starting state with all CPUs online:

    echo 1 > $cpu/intel_pstate/no_turbo
    echo 0 > $cpu/intel_pstate/no_turbo
    echo 0 > $cdev/cur_state

intel_pstate_update_max_freq() uses cpufreq_cpu_get(), whose raw lookup
rejects an offline CPU. The reused policy then takes
intel_pstate_cpu_online(), which does not refresh cpuinfo.max_freq.
This appears to prevent the new notification from covering that case.

Is this case intended to be covered by this series, or would a separate
intel_pstate follow-up be more appropriate?

Thanks,
Ximing
