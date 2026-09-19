Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497A42DC76A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789859680; cv=none; b=Xa+bEnaunHlyED1rmQbVW0yxW95cqI+PrOPS9AUq0/aLSy0mgxcKePeAMH8SQgdLqz8cjQ5YBc4C9WT6pMZgOAPqQZIq3yuDVHC0hW4W3Tkd+4JF4AJCfm0t6Yr5The60b0LG6DuWU+LA7BTfkMxC65AQI8lOpJcEBjPXPgJ9P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789859680; c=relaxed/simple;
	bh=bhJyXL/SvI0lYtYcRsi+mhyZA8OzMuLIb2xFOy/nwac=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=WowxsbujQE/wiYhH0Cm7bRZ9Cu79Mk9CKx6NGxJ/FjveMD+gSF7mYv22Hu8TgH0pbnVPu0AxJJy5+1eKizU3ZzesyOCkGxRj1gu9v2TTAycYjgIjs/m1MklTvpAuialgIs7kfDjewNQ16X5Ook2lelboF4kMvoYJjwyOOBoNYG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYqpdpJZ; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYqpdpJZ"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16c72so1520394e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789859677; x=1790464477; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZeC3/tBtXG1lvkhCzkqLAhG3qjfPpfCCgMkPkewIEs=;
        b=HYqpdpJZBC/Meuvqau7w/TbBkcU4Dwj9l8OyV3DezwLCHdGkmIqfOhVVU8U6dJXYeh
         pHIl9GnAv4yWvYSy8tTZ9Y5rXZwBGi/0+GfCdkcyHsiNJiXpaAikYPEm5WxlfRLN4Weo
         xqdf5T9EL3zfEZEt4sinRHH3tU5z4ZD9/x1Jf6X/fI1EyuJmES+02TEZ5ThcyZG7ZKl6
         qVjzJds6LlMg7pf4fZ1uvwUnmI1xugilC2TkcOsyobp9rv1cNNY4JwYgILWp84DPZNj/
         +QPh/Wpq0GoSEX7tWUPwKipOc+LTbXGjgh7WPnPjr2CeEbsgyRWHI4ooWaIeFu4zSuiD
         p4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789859677; x=1790464477;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZeC3/tBtXG1lvkhCzkqLAhG3qjfPpfCCgMkPkewIEs=;
        b=BoLh6CkU1W/L9E5Dvp/rbNwpss1KI3xNugAjdq/ZmLIgdfjieVdm7ud3tkrWHCb+hk
         OZiAU4uTxmJ/It9ahAM1TpYiGF5uIgAnQ9ap5r5V1jjCibRoqMkbnFw1n06kL5bLp14u
         oXaeV3QSjjh811TcrqcP+DonOgqMN3hRnOPDKpC1SlPNIuhqQjQpQNtuVARUxhJfjsfS
         e2IkTztpEHkc9PSzQ1OpnhFbP3BSi3b2zWAXwroHG2Tydohij64P5gv6hMdTf5TDYr5X
         jq57cTgqPsmttBbllvity/PBUUpVeLWhB7rq7tm7tqrdo5+G9yYKP2iQAe9jC/4kAjgI
         yC+g==
X-Gm-Message-State: AFuF++k5o7BbghDsloL10LYdy7O0xTg5vaCZLML82MDnN4jZXFoSsKda
	szOsao5F/+95VKpJaq6jCdNMsgS469S2tK0akQXCVlRfRl+02IMCP3a+
X-Gm-Gg: AYBFou0N04Lnv6BrRp5BkT3BkD7K+OMh6CjAx2mzIV1fP6RiazodZR6miKv8Du6a+4+
	WGFad74c/W0VkceRsU36+H5JaEI9hX+sPCfQIX1gnKGq3u5hdW5A8gSR89ZPPpL/Lo0hBaWsJSH
	V0BqzxsehIXXKXhTyQrXTbtbZsf1fYqGzfqlAyx0a/cSmajk0UbPjwakxjiWcOx/G/+5nBValuP
	F1Ui/vXIkGStjX/2yfr9KpDHzlpIF3M3nDV7GGF7DTyB+zBA+RzhuGN4Ar8Y7COyiaGD+GaYa1w
	wsDzjowXymnM9b7ShnUoT/4S+Tr814N+P5g5gOf0J9di7/xtUgV0iQZmcvYimrzEJ+DGyCp3qdT
	66nR2AVlbwDE7Z8g67iO8V94SXKZpoGIV2uvXK+N4ELA20kXKQ5VfiNbdVnQfxx4le7W8CLgPCJ
	b8yzIdw8v/sJ9k5xdDxHuCEne2hX3iT/H4DvMZ7NowyrHF9yEK6/8B92cZB44gG+O8UnA0YhTdq
	gk=
X-Received: by 2002:a05:6512:3dab:b0:5b8:c147:f370 with SMTP id 2adb3069b0e04-5b8c196c475mr2199355e87.52.1789859676838;
        Sat, 19 Sep 2026 16:14:36 -0700 (PDT)
Received: from smtpclient.apple ([2a09:bac5:1c:987::f3:16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c94a53d2sm649416e87.14.2026.09.19.16.14.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 19 Sep 2026 16:14:36 -0700 (PDT)
From: Ahmed Shaltout <ahmedshaltout.payment@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: [REGRESSION] /proc/stat idle time exceeds wall clock since v7.2
Message-Id: <E76BE609-83E4-4FB6-88B8-191F7816EFD6@gmail.com>
Date: Sun, 20 Sep 2026 03:14:22 +0400
Cc: linux-kernel@vger.kernel.org
To: frederic@kernel.org,
 tglx@kernel.org
X-Mailer: Apple Mail (2.3901.100.1.1.11)

Hello,

Since moving from 7.1.8 to 7.2.5 (openSUSE MicroOS kernel-default), the =
idle
time reported in /proc/stat exceeds the wall-clock time the CPUs have =
been up
for. Idle alone accrues ~103% of the ceiling, and =
user+nice+system+idle+iowait
+irq+softirq+steal sums to ~108% of it.

This breaks the common `100 - rate(idle)` derivation of CPU utilisation, =
which
goes negative on an idle-but-working machine. node_exporter, and =
anything built
on it, is affected.

#regzbot introduced: v7.1..v7.2

Reproducer
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

No tooling needed; /proc/uptime shows it directly, since its second =
field is
idle time and cannot legitimately exceed uptime x nr_cpus:

  read -r up idle < /proc/uptime && awk -v u=3D"$up" -v i=3D"$idle" -v =
c=3D"$(nproc)" \
    'BEGIN{printf "idle %.2f%% of ceiling\n", 100*i/(u*c)}'

  7.2.5:  idle 103.10% of ceiling
  7.1.8:  idle  89.13% of ceiling

A 60-second delta over the per-CPU lines of /proc/stat, on 7.2.5, 8 =
CPUs,
ceiling 480.04 CPU-seconds:

  user      	9.95     	2.07%
  nice    	0.00    	0.00%
  system 	6.56     	1.37%
  idle       	495.44  	103.21%
  iowait   	2.40     	0.50%
  irq          0.00     	0.00%
  softirq   	2.83     	0.59%
  steal    	0.00     	0.00%

  BUSY 	21.74     	4.53%
  IDLE 	495.44   	103.21%
  TOTAL  	517.18   	107.74%   excess 37.14 CPU-seconds

The busy modes are consistent with the machine's actual load; the entire
excess is in the idle column. The same measurement on 7.1.8 gives
478.49 / 480.07 =3D 0.9967.

/proc/stat and /proc/uptime agree with each other exactly on both =
kernels
(stat_idle / uptime_idle =3D 1.0000), so proc_stat(5)'s equality clause =
holds.
What is violated is wall clock alone. That appears to place the problem =
in
the counter both files read rather than in the /proc plumbing.

Environment
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  AMD EPYC-Rome, KVM guest (Hetzner Cloud), 8 vCPUs
  clocksource: kvm-clock
  CONFIG_HZ=3D1000, CONFIG_HZ_1000=3Dy
  CONFIG_NO_HZ_COMMON=3Dy, CONFIG_NO_HZ_FULL=3Dy, CONFIG_NO_HZ=3Dy
  CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy, CONFIG_VIRT_CPU_ACCOUNTING=3Dy
  CONFIG_SCHED_HRTICK=3Dy
  CONFIG_TICK_CPU_ACCOUNTING, CONFIG_IRQ_TIME_ACCOUNTING and
  CONFIG_PARAVIRT_TIME_ACCOUNTING are all unset
  no nohz_full=3D on the command line; /sys/devices/system/cpu/nohz_full =
is empty
  cmdline is otherwise identical between the two kernels (psi=3D1, =
selinux=3D1)

The kernel configuration above is byte-identical between 7.1.8 and 7.2.5 =
for
every option listed.

Already ruled out
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  - Userspace: the raw /proc/stat and /proc/uptime numbers show it; no
    exporter involved.
  - Clocksource: kvm-clock on both.
  - NTP: offset 0, sync_status 1.
  - nohz_full: compiled in but not enabled; the cpumask is empty on =
both.
  - Possible-vs-online CPU miscount: possible =3D=3D online =3D=3D nproc =
=3D=3D 8. The
    measurement above uses the per-CPU cpuN lines only, and the =
aggregate-
    versus-per-CPU deltas were 14, 7 and 18 jiffies.
  - Since-boot accumulation: the figures are deltas over a fresh 60s =
window.
  - Steal deferral: kcpustat_idle_stop() defers steal subtraction by one
    window by design, but steal is 0.00 here and that deviation is =
bounded
    and self-cancelling in any case.

Suspected origin
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is a distro-kernel comparison, not a mainline bisect -- I have not
bisected and cannot currently do so on these machines, so please treat =
the
attribution below as a guess rather than a finding.

The only v7.2 change I can find touching this path is the tick/nohz =
series
merged as timers-nohz-2026-06-13 ("tick/sched: Refactor idle cputime
accounting"). The behaviour matches the version boundary exactly: absent =
in
7.1.8, present in 7.2.5. I note the series was motivated by idle going
*backwards*, i.e. the opposite direction from what I am seeing, so this =
may
well be an unrelated interaction.

I also checked whether this might be an intended change in what =
/proc/stat
promises, and could not find evidence that it is: =
Documentation/filesystems/
proc.rst is unchanged between v7.1 and v7.2, the series touches no
Documentation/ file, and proc_stat(5) carries no "since Linux 7.2" note. =
If
the semantics did change deliberately, a pointer to where that is =
recorded
would be welcome and I will adjust our side instead.

Happy to test patches or gather more data -- these are long-running =
machines
and the effect is present continuously, so it is easy to measure.

Thanks,
Shaltout,=
