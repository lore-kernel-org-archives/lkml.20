Received: from sonic.asd.mail.yahoo.com (sonic-asso1-0020.asd.mail.yahoo.com [34.2.90.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EB54AD7D4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.90.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149782; cv=none; b=dO43pG/N/sbBL3UDx5XtKuBGcNyvPwEuz0397cywUlzHEYZHzsGwjlouJXCzXQY0s5Ode1vlRn6bQq2qVFcqdPup+pF3oZjTj4qKN3wqmZ+06PM3RqG7kPIpdB46m3oNDzIhJVLo58Zi7KctSwYRdGdrN/Ct1Wj4VnF7Pd0XLLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149782; c=relaxed/simple;
	bh=LX+tjAlWwFkjL4ZSVN4AmUIqVRugZZ1uNgK+ywpo9fo=;
	h=Date:Message-ID:From:To:Subject:MIME-Version:Content-Type:
	 References; b=nt+DAhn+XuJ0frSIBLAJ024JHU2iRG9PKKTCXBpBDFMXinkVVv0hyb8EKJX2yT6E0ssRCSSis9m7Jje7w51tUZKJ8TCDhzMEFzgYONCXQGkjPQpIcpfci5Ax/JnAhV/q9Ivkf56XJzdJ5prtdadyYHvafPBn5Ph7Ht5p6qDdkZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=uGGsTKV9; arc=none smtp.client-ip=34.2.90.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="uGGsTKV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1789149777; bh=4EoI4keufiEFS4xlHCu1AT9f/K8hCOfNGRFAR6huiEs=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=uGGsTKV9HF3eSE+a9UPM/HtDVsUnmNHveVkldQiWlhqc8GiPb98HN4tzjIThCo2XP+apWfhv2lVnqH0jjpQc7a4lc0f3Qgl+KpTOUF3OGKWUXkqDz35KrqBj5SttpFyMFVxlS6koX826VyRFoMKyZNKM/BZGYs4Q9OYooszt6hoB/X3JlhIyT7j7vuMGNFJVKkJwebQLl2kh1cKXgGoyzqwR2n3F/fow6WyzAPMDnHO85lSadQHrbdOorbopgJAZWJ1blna9ksbnq/Nnwhd7c4f4aGuDwFz1vMve0DtVcTmeBD5kRZxB5EMghJ+9HDcWetFEfoX1OhfbtqSBzOHIXw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1789149777; bh=8ghn0+seyJPqj65m0UF/SWR+9k5Ecf1W/AqNcHFuaUD=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=VJ5GZ7gyJvH3JBPuNz3Ny8sfoDpentbwsGFCEs1jdwErHcTrP4FP0PcVHjEhYG4w3PW2gvBuF8jQkdLHBhKvi6Qb+PaGUS3KwJg02orodSD3WuJxn14eidBN+IB9pRlkpc1HmF0VNfalqSLK53n/DTJdaVffybQhjhyQK1oSEL+7NF4+f3t3QLvMe1Cr0PUM3t/u7+yDgpxSOv1q4y5CvAXXFSWpOY0Hdt5TPLAqp5Ulb0q2of8Cf8/gs6/1D1S3PCVYUxFCRtEbVzf5CPeMGACUa+OilpgivhZe5vRMM8NlLJ9EqGDg6KbTWVEH/SxPJNVoYhQFDjmcXxis2FLY8A==
X-YMail-OSG: FxPu2aUVM1nMtgahHbhv3eMBdwbGvllKrLMbn5eildWQqEoLnjO7mak5vaLxKFN
 uz8cM8fr_NhLS.Ud6gwUbE.kPFDNgm0KzNP.o_h1O.EbpvuZkTBxWRz.PSW1ZxdxmPi2LECJFfP6
 ZOfUQGGC.6ORHsqSYKDaAa1B7D39I7HmrZx.Hab49.KBefs_UUN0hKElcIFRPnxMOrSNcGthObfe
 np8tQ0DQfir_HUa9RbFg8jMZvkfwzTXg0dVGeyy2bfwcU_YWW1RxWzKCxk6JD4TR8cJjZ1GYlQnD
 M3zdPF4W.ixMIJcwPQ_VbV2AJQOxDPRR8418FStnkVflRRJ.w9rJDzKk7xy1sr__ceVKu5EvvLQv
 Njx6YEWXDwkMYVJfORtDddyWANvkwrDFdvSSs_bbJTgDQr9s2k1Rmqz9YwUg04tTNuEg.STfrkf_
 NSsLYwbSrBhCK6G2fDA6XqKpc6GTtq3LM2w_H2dPuyGQVUKTxHJrq3WfRMgWbY9tsuCLN68_Ottn
 y565Ezpf4JyoWIGSEw4Hwtvb1tkuMpXZX47_pVBl78EzGbzJ5T4woZcTITsj5r1ynJGEKtw_CJEt
 0OG7BvzIR9j4UYTi4D78NaAWYCHkDb9BBsCaCSbj9yFL3nSEcigFacs9xn5CaaUQtp54NiAQO0xv
 NaptFTZzWSpjIQnl7GLt_iVGNTe1gBwwkqs54qj22yhnhTpGlsJ9n0YOqOS6O1Uw_ND1gqd2zvh_
 MNcdCuxGEPTQl.0HGpusV0WLL5n8VRAquTpoGRDCpj0JE.PYWZYDk7ORSZSVgni62jPOcgfsKYt5
 WQFJDM6U2NJsIdUEXZlHZjPacdvON6RH0JKsUxzS8laG_FLXHxAZlNuj_m.a5XYk6fNEtoW3at_I
 6GNXKTmCM_8teH_TBOdfyPIUO_LVFZS1.plwP4ThcqIducyf0RK5bt07.4MWGOCH_ESKhksRmUrL
 HVmQ9YrmpeVLsJuMHIUtAXb1YCT0cuH1zrRsubADMs.sApyxqG_HLvbS2qWKvqIrT8paikYur2di
 G29hI4IIeQigDXjuk63d3nMWIbulAcg96M4d29ut9ftOGl0WzOE3URWSU7C.Ww8sOZOKVNxiO4ew
 j5vB5r0Urna_vk4EGM4N08UGZ5I1nzJweyZlmIT6fSAi9ubR2cX5FTjL04eRAbcXkih_tOOOTpLF
 z9kM5o_UOsa7h5a8cO7wp8wvUJ2rKfZ_RJYDoUR3rctZyN8mWFO6JFXST27rOiQVqUc4e6q3my_v
 QKzW16OC7nbyftFAhbNaE4xq6_ZByYXm6J9NtiAE577ds0fV1uMmGUP0FLNKT0nXcDJBvKy0dekd
 HxJ.AX0oc81gm8sR4KXPtqtVRARUfivpjyfEDidOQ8ZCdCD6dF4NvArQVKOLnOnlv7UzkLV7jLfK
 UfOHtFHrJ4XPdwzLpdzTGuX.8LVVQ56o4.WEqgVVhUyJa7ANM4SH_r7fjpp.2kdrVrLcGmiA9qJz
 aY1Yt71.65RdSkI2Y7PKJgpSYm8dYUdux.i4DvFvxIl6jjbPhX4W0BT5SAK9p0GBmEyrXlIQWuOl
 FXrYRYD9ryVuajJPwJJZKJc9G7JDUYB2XhFOGcOKTzxsujNB9IX9f_szr12mFdI_cYA0g9pEZBSb
 iG4t024cUaKv.kXQffzNtLli3HekcmRuzckeiUFlc22qtwX0tKljMEo36.eIisb7jAty5wqt2Z0O
 u8y8A2_R4Gt_CrFnm440wHV7jyGUAwRZWmq6GsObf9.bSP1_idqpvRxSnKQssjYNYIKrielOl6ha
 HgxMVl0psvxSPRIo_68XU1GgzadZdgyb_uuy0YxQd5yqTSKJFh8W631OV30LQjAVm47LLxzvM1LC
 sbl51PeR0jOWK41FpdGyRCu7VCyKvBFEijNyuPW56q.u.P2qIbgFbNJrEx5q_6_z8qsTZG2yqBt3
 25zJHmcQQupLbwf9GcJ9drHi.kVXv5Nfx_cx0749bT1he503Ix0MYBg5KuqFzB8YqtC91ZhkXVAz
 1hpZpo_orSDv7istjHhlF.g--
X-Sonic-MF: <avikalpa@yahoo.com>
X-Sonic-ID: c6b0bbda-6f6d-4da9-9cf9-01c8169d45c9
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-asso1-prod-sonicconsumer-svc-101 with HTTP; Fri, 11 Sep 2026 18:02:57 +0000
Received: from dip56.lsn.sg3.yahoo.com ([106.10.223.65])
          by hello (SMTP) with SMTP ID 19a1cc9871ef7e33e3b462ec7ba43344;
          Fri, 11 Sep 2026 18:02:53 +0000 (UTC)
Date: Fri, 11 Sep 2026 23:32:52 +0530
Message-ID: <1789149772593550955.2470305@yahoo.com>
From: "A Kundu" <avikalpa@yahoo.com>
To: <linux-kernel@vger.kernel.org>, <x86@kernel.org>
Subject: TSC marked unstable on AMD Zen4 (Ryzen 7 250, ThinkBook 16 G9 AHP): 15.6G-cycle warp CPU0->CPU2 at boot, 7.1.12
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
References: <1789149772593550955.2470305.ref@yahoo.com>
X-Mailer: WebService/1.1.26525 mail.core.serving.mcws.prd.acl:role.token.mcws.jsmtp.yahoo

Hi,

On an AMD Zen4 laptop, kernel 7.1.12 (x86_64) marks the TSC unstable at
boot with a massive cross-CPU warp:

[    0.191568] TSC synchronization [CPU#0 -> CPU#2]:
[    0.191571] Measured 15645116622 cycles TSC warp between CPUs, turning o=
ff TSC clock.
[    0.191580] tsc: Marking TSC unstable due to check_tsc_sync_source faile=
d

That is 15,645,116,622 cycles (~4.7 s at the detected 3294 MHz) of skew
between CPU0 and CPU2 during early-boot synchronization. The kernel then
runs on HPET; the TSC is dropped from the available clocksource list
entirely.

Hardware: AMD Ryzen 7 250 w/ Radeon 780M (Zen4), single socket, constant_ts=
c
+ nonstop_tsc + rdtscp present. Lenovo ThinkBook 16 G9 AHP (type 21UT),
BIOS SQCN20WW dated 2025-11-10 (latest published for this model).

Notes:

- A previous boot configuration used the `tsc=3Dreliable` parameter, which
  forced the skewed TSC into service. Applications then observed
  multi-second backwards jumps of CLOCK_MONOTONIC depending on the CPU
  they ran on (Chromium renderer CHECK failures; journald boot accounting
  disorder). The parameter had been masking this boot-time failure.
- The warp magnitude =E2=80=94 seconds, not a small calibration drift =E2=
=80=94 suggests
  the secondary CPU's TSC was never synchronized by firmware rather than
  a measurement issue in check_tsc_sync_source.
- Suggest Lenovo/AMD be looked at for the firmware-side sync, but the
  kernel-side behaviour (boot-time detection working as designed) is
  reported here for the record since 15.6G cycles is far outside anything
  a retry would paper over.

Full dmesg, CPUID dumps and further data available on request. Happy to
test patches.

Thanks,
Avikalpa Kundu
