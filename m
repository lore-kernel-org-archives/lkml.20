Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794043200;
	b=jmh2lr0N00IHfx0NSVLffwevAgVjqVbJzDzJU2+CdY/0flqRzMStX4WitIbYwc+u2o4s
	 6nAq6xb0ZNMbkbzpRoPJF0c1SCZLGW3aQNtSF9rPqRCDm7iqHKf3n21LU/P2Z+AJf/f3t
	 fqpQfSmdN2rtVlQVXn4zDioJ0dCoB/YAIX7P2gmh4UA2QOObO42iANwKX+OEgor0ha/sk
	 ILnnS9+f4E1WEjxsAv2pgDNr3Y/Bc3JZ51CIZ4XPKG/XyETPnV26jMEUXP3Z6VMMGX/PN
	 aDDaWfTGZbpq9x9+VJIH5eSMBbXdQsSJXf1hzCKIy+fMFmiACkSj51kEOQqp2ps3KmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794043200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dZHYs9Xo6IvnEdYXT1TI48a85ZqCmEQBlvnpyMiF9q0=;
	b=a4GkPSM+g3EbI/KcUQhaWjznj29i2I/1jSoZvvc7VdGHXy9VCPFIDv7IBGFd88/2bkEf
	 Ufd3r5+DzqK1/z7rr+lISUB/esLzLzR+1onO5OzEpK6LNCkX6MkFbDMsf/32FpfDjyZf8
	 z+rIgLX1AiuLOpoZt/iHY+4x8T37rwrIsLk452ExX1b/kllgMMJOo84wrp0NuxSPsiBG0
	 S7qjpCdPzT9W6P1pvYNecb/CgIhoKHbnGzWmLzrCMOQ/KTkc8tfTI5ZJtGmWI5ajEKXtw
	 1RLxP0AAVAM2GZorCwevK4D4eAgmeV9Bv0TVXizjf49ZUMb7JL8uHd+Aur+Atdfeh3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQqXeKtw;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DBB606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45DBB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQqXeKtw
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b4f7d3cd98so1509395a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794043198; x=1794647998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZHYs9Xo6IvnEdYXT1TI48a85ZqCmEQBlvnpyMiF9q0=;
        b=XQqXeKtwwMWmPG0WFy0rud8ZqMkYwSeOlrVR/EVHDWxI9iXbpc7MTvIib9QyOen9wG
         9idvZwmDVHIpLmRUl3AOzOEJOqvL5OqpYoDv+IwsNG3ovC67Nzx7qkykz9rLBHu68oT7
         AmkUG0FHWWnur+tkPDpx/h/kXLXmxWrOh3o+yS0rL2u7ehjPWS5ZOLydcZDBkQxkjgoN
         KbjOQFtAwvT/UgfyF4ah1ubH5D4vBxDaF9m6omxylhFrLhxz1e33wtqRmkeSRQP0aP9z
         uGFBUZbGzLM3sAuyd4JYqtX0+bQ7jnMjDkEpEIXohNbjWtNM0uuH94C6BV7gCyISggWp
         j+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794043198; x=1794647998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZHYs9Xo6IvnEdYXT1TI48a85ZqCmEQBlvnpyMiF9q0=;
        b=gG/0/6eI5uqtrqwTW3HC00MpFsm3y0tXjMEddfiGrewFvKOBEPaLaizrPxgY/pkzBm
         tk/Kr5oKUCaJQXsi2MlY65M9VdEHcZznLQthLyRTJ+5aAg4ase718PNUyO1rzDQUAYcl
         p3shv/ysZhQUaBKWEh5ufIsS4txOgFNCbr8V1n1bJl81z90A4g4A1NsUzouxV3AYjtCa
         rAwe1SlIEfnMW8Bxrbfp7TKaX1KRy3iALqMhMn3o07YgTWuBG9oPQIsb3dnifeBfm+17
         NL5Sj/U4wLSj+4YOZgYAWQJMW+gNQ4+plVPQJmjoBW3/YKglsEutCjame7ymEPIivKCW
         rPwA==
X-Forwarded-Encrypted: i=1; AKwUvBxFoFMwh/RnU+B58wA37cFogxUiqWgwC+N806ARBwDBI/k7zD7muqeZAID7CiM26uWry2Ysz6V9WF7Jm20=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MFU4LwM/NIJCzifq3xdMhc8od8xRuEMeJeZV7R/cvvcea2atO
	lJZjWNHChXJjqAU/CxHEwQyRTsD6gf4n9vvK5p03CwPR+oPBDxdYZf4K
X-Gm-Gg: AYBFou3U+e+g/9McOoK+fADJFTiH4Q+3/lBSXHXklZljHHGROY9L1j9ZMoU4ynIuiNJ
	BNDJ8a8g5KGgG5tHq9T8rRL1YLfnEpir2fwtYzxr8Dl1w9V4NFg+zhqpGYA+W/oaMxX7VG4gOg9
	jyZ4YdST+ZWHurwb/rP3G+qtvcdEbWszBKmha2BK9lS+LHmaR7nnUHc/CAslVmyuVVlUYCOMFsd
	O3x2FeiagbyZcBaqR63YGi+UeeSNidlQqtl3EYd2/rOSrxIinpHzqeBMnuEGhLfsM1wuWhE5HVJ
	chagIhx8DfUmfsXtxAlZoh/qaLZMhSJ97yFmfpuOqdfU9UfiK7VG0QodS72x+RF1eUJczh7JG3Z
	6FtbK0eTqz33WJlyzf26QvgPwDZCMYQ2JgeQnXvz2Er3aoSH1DWn5SSlYwscs2LGRpjReq6Y9aB
	R7KXhL/JEVe6QsA9PmHEriEP/ZsMa7Fvi8ZpwE7Ukx6WPBN6Hfh62pcQh0NWrvYqGO3onfyF8yM
	q/fSZGc3zzoeCJ5Ae3f8H/PkowUSf4+xUMcanNMLVCwTEPgAcNH4nU5kzbi0wWO8Hx5t8rAT9Ww
	JKdjSN/b9WNMeBLVvCTWl1gecLVnXF/mks9sdTjLdt6QXUkFKgw9KwCEmD89TFKtCDeApXA=
X-Received: by 2002:a17:906:c109:b0:c46:c3ad:e1ca with SMTP id a640c23a62f3a-c4d3546b3damr354337666b.9.1794043197422;
        Sat, 07 Nov 2026 01:19:57 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356c776csm138824766b.70.2026.11.07.01.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:19:56 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 0/1] alpha/perf: Enable duration-based sampling throttling
Date: Sat,  7 Nov 2026 10:18:34 +0100
Message-ID: <cover.1794040317.git.linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi,

While testing Matt's v7 ProfileMe series [1] on my EV67 AlphaServer ES40,
I found that short-period sampling could make the machine unresponsive.
Once serial logging was enabled, the console showed RCU grace-period
kthread starvation reports.

Count-based throttling was working: at HZ=1024 and the default limit of
100000 samples/s, the observed cadence was approximately 98 interrupts
per throttle cycle. However, Alpha never called perf_sample_event_took(),
so perf could not reduce that limit based on interrupt handling cost.
Setting perf_cpu_time_max_percent to 25 did not provide that feedback.

Keeping period 17 but lowering the limit to 1024 or 4096 samples/s made
the tests pass while still exercising repeated stop/park/restart cycles.
Adding duration feedback also made the original high-rate test pass,
without changing those counter-state operations. The minimal fix measured
average handler costs of 24-26 us against a 2.5 us budget and reduced the
limit to 7168-8192 samples/s.

Reproducer
==========

The reproducer requires Matt's ProfileMe kernel series and matching perf
tools. On the ES40 I used the following one-second workload, built
natively as "busy":

  #include <stdint.h>
  #include <time.h>

  static double now(void)
  {
          struct timespec t;

          clock_gettime(CLOCK_MONOTONIC, &t);
          return t.tv_sec + t.tv_nsec * 1e-9;
  }

  int main(void)
  {
          uint64_t x = 1;
          double end = now() + 1;

          do {
                  for (int i = 0; i < 1000; i++)
                          asm volatile("mulq %0,3,%0" : "+r" (x));
          } while (now() < end);
          return 0;
  }

  cc -O2 -o busy busy.c

As root, with serial capture running:

  dmesg -n 7
  sysctl -w kernel.perf_event_max_sample_rate=100000
  sysctl -w kernel.perf_cpu_time_max_percent=25

The period-10007 control completed successfully:

  taskset -c 0 perf record -B -R \
      -e cpu/instructions,profileme,randomize/ -c 10007 \
      -o control.data -- ./busy

Changing only the period reproduced the failure:

  taskset -c 0 perf record -B -R \
      -e cpu/instructions,profileme,randomize/ -c 17 \
      -o period17.data -- ./busy

The unpatched runs required a manual reset; a userspace timeout did not
reliably recover the system. The commands above are the essential
recording commands from the controlled tests, which also used a timeout
supervisor and saved logs on another machine.

Validation and submission scope
===============================

The minimal fix, without diagnostic instrumentation, passed three
repeats of the high-rate reproducer and the two low-rate controls.
Broader testing covered 21 cases on all three CPUs: randomized ProfileMe
instruction sampling at periods 16, 17 and 31, ProfileMe and Aggregate
cycle sampling, and concurrent ProfileMe and mixed-mode workloads.
All completed, with 1352488 samples, no recorded losses and no new RCU
stalls or kernel faults. This was bounded stress testing, not a long soak.

The missing feedback predates ProfileMe. This patch is therefore based
on mainline and can be reviewed and applied independently of Matt's
series. I cross-built vmlinux, the Alpha boot image and modules on
mainline d48723711bae with the ES40 configuration and GCC 15.0.1. The
only build warning was the existing saved_config COMMON-symbol warning.

The hardware results above used Matt's v7 series with this fix applied;
the mainline-only build has not been boot-tested. RPCC supplies a short,
same-CPU interval because Alpha's tick-based sched_clock() is too coarse
for this measurement. Counter programming and event handling are unchanged.

[1] https://lore.kernel.org/linux-alpha/20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com/

Thanks,
Magnus

Magnus Lindholm (1):
  alpha/perf: Account for time spent handling PMU interrupts

 arch/alpha/kernel/perf_event.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)


base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
