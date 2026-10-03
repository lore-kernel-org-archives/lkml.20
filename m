Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D723939FCB1
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 22:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791065257; cv=pass; b=LQOvbHsbWSit6iygxZ61T/PrekiH6ksJAyM0iXYZGBLZzRdFKf0EzVbvgRKilj2sMYrC9yqgSOfTdDRlxUe+o2n7QHoYJDXvegOaSowmH+RlbHjXE+Ot3MV3sVIYYwoY35fsM/a2bIg1zd5oNPle3oAl9BazEKjgDNVoOljuajA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791065257; c=relaxed/simple;
	bh=r/EYO9iTf8Bzckq36mXDu9wLjTcU2yk/Rpwbtpchn8A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DWobeQQpQC9cqu9tRq7OxSAbiyCTfKL4MxiU0ed4JQRNxBuBu26MJxqGANs5/Wch1yWN3PlEgMSFoulyanhlyekAX0nu+6HU6DUaeT2OEqW+v6LfLLKDY+OQOohqwe/vVeB0ZmX7ResGs7MYxc8IjNA5qRVTex4cx4LF1VP+k/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKKMbMFs; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKKMbMFs"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so1504492eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 15:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791065255; cv=none;
        d=google.com; s=arc-20260327;
        b=jj/E8l+ekonKs9GLVgwYvsMXsrDnzWC84MAWC5Ef16T2sU2ZReO96AQmoh9bdJ+9AY
         EIbDCcBJrsjwrRiZPgt1y6zKM10sSDC9MlpFZrd16/qYpWjeL2eH6vKMV53E1prMpC0j
         uaznbtQAsGl7STuF6/2OBh4Ap937ukZjcrpNC7rFJEdVt4gaCmzpIZjQPzyl6l2J4XjL
         tphsbKTKOpnmovX3NeFJ3wmCh1JMfhWPRo69C53QJiPzrP/kYomFS5QE8dRVuwzCjda4
         Bz8UDvChKyKDpAhtWFZmE0z/dXeVeS4fcbPihzcKPaSITpSsvYVzGstJeJkVTCxmNf+Y
         MVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=UIT2GUqbIic3m6wLhr5y7oJ+E4MbkB8ULB8J/xLXRqg=;
        fh=5uwrAjuWOoSsbjGmSfCBB2yAnsWIwxXXMPt2QAs0QIg=;
        b=NepmQfxOcUwAYFWJFr2cpHN7khMfBqOvLtVZIrpQu+FVQrnT5TWsGXghUqpm8Djsx5
         y9zZ+oILISmnFApsuHBjatMrFUx5cjExb/hoXW34E77QybpQDMbnXWQ5l5ZSrZuAlgi5
         4vVZfpq30XfgA4wkoEIDS5aTkTn3GH7QTbDtbB52ej3x3XRF78u7QsdaBgazSqKKREwT
         lFTylV3Dz5iEVsOPj0hlmVCP9bGxXbXayWBrnLPg6oO7/bStfKDUOBBbEKQHVxxfJKM3
         sO+DNvZ7SUCA6mARD3LlWPkG3bQ1AphSK9Tt5TrVDWee/CA6Zpl9j2b4+lsH+y3h9aH2
         oVUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791065255; x=1791670055; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UIT2GUqbIic3m6wLhr5y7oJ+E4MbkB8ULB8J/xLXRqg=;
        b=EKKMbMFs+Uu0gHi+qtPVYPbS3OP1GgSLQOUhmEbtqU6y1maG84IDdt5hSnBlRdXlT3
         y/ebWj+CaMuHY0gPj93bVzia9aLOqfh47Ec0L1xtkyRkx4UYAhG51W1o2wcBS2HSKOBb
         HgZGZlyK3moUuJTkjfU8y6c8icXhX2Lp+PcTo7Mm3HlkNKwp3uWQbnmAhcFiSqB2ss+M
         mI5lV60IMPUjX7VH0+a1mChb9jFzRvil5b8xW/10ua1i09jHZV4QX/sw4YLPhyM5HSvT
         x9TNVIUWpZffxneRrroZ3hb49Vj3VJihs9AXQwXxCRu9AtnF1X4zhOPIWABUk/08U8PW
         D9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791065255; x=1791670055;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UIT2GUqbIic3m6wLhr5y7oJ+E4MbkB8ULB8J/xLXRqg=;
        b=LyMZ+9iSP9XAfiHnlh9P4rxJPBtK0Y8mJXCC87y9toQidw7iiD+yFvnzeg2/zjbjaD
         OleG/6G5LynmJVDl10ta/8/x1Orv1v6urD5T5viNCfP2jubKgsHFtfK+qkXx6kmqRqZ/
         iqnHlpfgeVXZVcBA5ImzgXyIecjoXJfB889ckiFRqf356XbCPqOfG2g2XOQOIgDeLSGz
         6SFfDneFsCQMJMjZk7nwy5LA40/gyL3ctr4jWnOIOSowDdK40dWR2/TnTA5hwfi0fJXe
         j7wZRVP2FexK2zclkopxV98QRRUtct09fGC6jLOING/qzp0D4To9qLUEQmZXXqrkJz72
         dm3Q==
X-Forwarded-Encrypted: i=1; AKwUvByEUhv7R91gnhjrqbvPjl+CWWfUNuzYsl1QSwwKpMG8rEqnN9U8IxVAOnW6QmgkDBaWsPPvJ+OWPBuaI8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWSoJ3nKtA1h4qgbaUOlKxy4/HRqQlrqznNDOz6GRbtUD3UZo0
	YU5x8nkE2pzekASv7ryd+TG0W+xYYL1OPG/IzvTCgkzNndqnupUFTnP9VYOhmHDbBO/Ll/u0x95
	cNt4pdaS6UnuTGEX5Yq+vL7GzGKT4omk=
X-Gm-Gg: AYBFou1nxWgdzlqF5mH6HvtBoLbo8R7QyRMwwfmhozBt8HeU1ZDOtlQcuDXxigP46qQ
	xeAvc6fHtAZiF7y5Gi8w4kNwdOIC0nQSBOAy7jD2aQynFgcNnoazktmDo4WFhd1PFVTx2yZlZzP
	JtNyPh1alubzEggoaf+Twh8Lu9xc3QJcPBdJQVsw0CIcp+ZM8Lad16fgB1COfnXqo8eEuoispcC
	srFWR/252fkxUQr5StsTKI5Ewpo8n0jsyN9jAVzD6Hmjx58Hr4EAvTHbjV+yC6u4ALs4mJvVTc3
	g9LjsgQEk7JKapRqmDd5eQGZaMI/dQqFCGqrIgP4a09HTjNVuqvZvD6sSasiMkiBs2u24cmLfSC
	7M4SH71k9NJWeVdXO6Dp2rKQI
X-Received: by 2002:a05:7300:d80d:b0:351:1dff:ae1f with SMTP id
 5a478bee46e88-3511dffafd0mr2038714eec.41.1791065254615; Sat, 03 Oct 2026
 15:07:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: NvD Ss <nvd210@gmail.com>
Date: Sun, 4 Oct 2026 01:37:23 +0330
X-Gm-Features: AclHuK9eqA1Nc3yObo8GKnyLxahMv9s7xb5rWKfbmCze5eDUA5JqG0J8sndMwa4
Message-ID: <CAKdy5es54GmBERrKEWw5Qf77fpi9KZp5aKoncW1naV45h_U6Zg@mail.gmail.com>
Subject: Re: [PATCH] x86/tsc: Require a deviating refined calibration to be reproduced
To: alexander.warth@mailbox.org
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I appear to be seeing essentially the same TSC issue on another Raven
Ridge / ASUS A320 system.

Hardware:

- CPU: AMD Ryzen 5 2400G with Radeon Vega Graphics (Raven Ridge)
- Motherboard: ASUS PRIME A320M-C R2.0
- BIOS: 6254
- RAM: 16 GiB DDR4-2400
- GPU: NVIDIA GeForce RTX 4060

Kernel used for the tests below:

- 6.18.52-1-cachyos-lts and 7.2.8-2-cachyos

The CPU reports both constant_tsc and nonstop_tsc.

I originally discovered this because a timing-heavy Wine/Proton game
was performing extremely poorly. perf showed a surprising amount of
CPU time in read_hpet, which led me to check the clocksource.

With a normal warm boot, the kernel switches from TSC to HPET. One
representative boot with BIOS 6254 produced:

tsc: Fast TSC calibration using PIT
tsc: Detected 3593.185 MHz processor
clocksource: Switched to clocksource tsc-early
tsc: Refined TSC clocksource calibration: 3596.250 MHz
clocksource: Switched to clocksource tsc
clocksource: Marking clocksource tsc unstable due to frequency skew
clocksource: Watchdog                    hpet interval:        504269467ns
clocksource: Clocksource                  tsc interval:        503848443ns
tsc: Marking TSC unstable due to clocksource watchdog
TSC found unstable after boot, most likely due to broken BIOS. Use
'tsc=unstable'.
clocksource: Switched to clocksource hpet

The difference is about 421 us over ~504 ms, or roughly 835 ppm.

I also tested with "nohpet" to determine whether HPET itself was
responsible. The same problem occurred using the ACPI PM timer as the
watchdog/reference:

Command line: ... nohpet
tsc: Fast TSC calibration using PIT
tsc: Detected 3593.621 MHz processor
clocksource: Switched to clocksource tsc-early
clocksource: acpi_pm: ...
tsc: Refined TSC clocksource calibration: 3596.253 MHz
clocksource: Switched to clocksource tsc
clocksource: Marking clocksource tsc unstable due to frequency skew
clocksource: Watchdog                 acpi_pm interval:        496412812ns
clocksource: Clocksource                  tsc interval:        495998342ns
tsc: Marking TSC unstable due to clocksource watchdog
TSC found unstable after boot, most likely due to broken BIOS.
clocksource: Switched to clocksource acpi_pm

Again the discrepancy is about 414 us over ~496 ms, approximately the
same ~835 ppm.

The particularly interesting result is a full cold boot.

I removed all experimental clocksource parameters, ran with the normal
kernel command line, shut the machine completely down, waited for
power-off, and then powered it back on.

On that boot I got:

tsc: Fast TSC calibration using PIT
tsc: Detected 3593.621 MHz processor
clocksource: Switched to clocksource tsc-early
tsc: Refined TSC clocksource calibration: 3593.248 MHz
clocksource: Switched to clocksource tsc

TSC remained the active clocksource:

$ cat /sys/devices/system/clocksource/clocksource0/current_clocksource
tsc

$ cat /sys/devices/system/clocksource/clocksource0/available_clocksource
tsc hpet acpi_pm

There was one:

clocksource: Watchdog remote CPU 6 read timed out

message during this cold boot, but TSC was not subsequently marked unstable.

This appears very similar to the warm-reset + first deep-idle/C-state
behavior described in your patch. The bad refinement on my machine is
about 3596.25 MHz, while a cold boot gives about 3593.25 MHz.

For an additional test, I temporarily booted a warm-booted system with:

tsc=reliable clocksource=tsc

This prevented the fallback and dramatically improved the affected
workload, but I have removed this workaround because it also prevents
the normal clocksource validation. systemd-timesyncd initially reached
the +500 ppm frequency correction limit during that test.

With a normal cold boot and no TSC-related kernel parameters, TSC
stays selected and NTP later reported:

Frequency: -9.956ppm

I do not consider the NTP measurement precise evidence by itself,
since it was still relatively early after boot, but it is consistent
with the cold-boot TSC behaving much better than the forced warm-boot
case.

The application-level effect is very large on this machine. Under
HPET, Deadlock running through Proton was approximately 15-25 FPS. A
perf recording showed, among other samples:

 9.99%  MainThrd         [kernel.kallsyms]  [k] read_hpet
 8.58%  swapper          [kernel.kallsyms]  [k] read_hpet
 2.08%  wineserver       [kernel.kallsyms]  [k] read_hpet

Keeping TSC as the clocksource increased performance dramatically.
After resolving some separate memory/indexing issues as well, the same
game now runs around 90-115 FPS with TSC active.

I also updated the motherboard BIOS specifically while investigating this.

The board was previously running:

ASUS PRIME A320M-C R2.0
BIOS 5007
2019-06-18

I updated it to:

BIOS 6254

The warm-reboot TSC behavior remained present after the update.

This seems noteworthy because your reported machine is a Ryzen 3 PRO
2200GE / PRIME A320M-K / BIOS 6254, while mine is a Ryzen 5 2400G /
PRIME A320M-C R2.0 / BIOS 6254. Both are Raven Ridge systems from the
same ASUS A320 motherboard generation.

P.S most of the wording for the above report has been produced and
written by ai after days of me trying to diagnose such a massive fps
difference in my game between windows and linux, logging and
troubleshooting was done by me with assistance from the ai. This is my
first time reporting like this but I would be happy to provide any
help I can.
