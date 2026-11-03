Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674919;
	b=bjz2gDfQv9X9MI/8gl1O9VHI9TbNLnUETaNxZP/rWJgF2pwjjpbDFEjHqViYaOopE3tN
	 bFnQT3L5CfFoO6uF8WT2nOcqOB+ecMKAWPfHi/BHZysIiniFXquVOxaqKl+/S5KLIChyg
	 CstgrD7ugwh9tB/vc02R470wTf+Qsnr/WFnjvsXhuuzWqcywIm6+O5HyPSnZD4HO+AoJw
	 dorQMzA0kJrUK5YtRxd9CJvqc7Ujo4kUfFBd8WzLmKW33nVQm407wbLfpJpoWJjW/Jl7k
	 x1p50OMmCoOzPn2vcEIIxA+vrxaTrorFuNlNNtcRKkXH68cn1uyv3DaD3IhB5IMqMeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iWZ6T7xk8VtKH5R/9rzQs0i+4KFIZ3hVEHuGR9wxUGI=;
	b=XUzX9qMiA92sWZp49njN3hGaAwowmeaaD7/Zj/JAKpsajRiQAM1uqp3LrQYOxK6MRR2/
	 hkfJMTuFvgoEtI+Ed5oSO+wW5GEDhGOPa4QcTlCZdrFEkHvVEzc9869AtHtqMZddmNCrG
	 JtL7smPS7RF8HGh4iY1gGVZxeskxC2sYc90ecUaY73ed0RHtZStzxcl1KiDEud3hrp8XL
	 x7IBnLNwJH4ZZjcHNEiOMWikJ1/zflQaI4T+QKrUTNZlTHNTP/rUeA7yhK2PolH5lO0Rz
	 psdwiu3FKOInFfcFnT2rGTKKBHVuGad9hdpVAgHpYrutF/h/NyiGtC2ZHBQ3mVN148w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sxrpQ/Fg";
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D64606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D64606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxrpQ/Fg
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67a80d827e8so2274440d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674918; x=1794279718; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iWZ6T7xk8VtKH5R/9rzQs0i+4KFIZ3hVEHuGR9wxUGI=;
        b=sxrpQ/Fg2JFt5UhQftOqpwRcNtKxNtR5nNK2TDGIQqELxIlA94HJNYQnqwPns0uDWU
         91OqkdSrYaHG/lKgiTuX57NR7+lvAOrsbwp3fhypMcglBFn77QR8/jUU1h8J0HcYglOK
         sVdVWCT3Y4g02I+kyZFMg4z6J4tpHmr6f54jyQB8QFsUuHBA2RHzV7Sj7VdpIphSWs5i
         v6pwLJSBlYnDF6F+UF5uUFyR45kagKhVjZBvofnGOM5uKil3dKGDurDWGDQTrKLlspPw
         UaadcStd9/G14qySwV/Plg4VjI9r501xdOmSQ8L5JukSfZvE/Hg0rckyc47x7nujdjbv
         BZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674918; x=1794279718;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iWZ6T7xk8VtKH5R/9rzQs0i+4KFIZ3hVEHuGR9wxUGI=;
        b=ZUZ57pZ2LaMoo7i/BoFfMcxR1GtpmUF7mtbhNRokSFkSvG05jG6lZmZhCYe62vr01I
         iKl8wxAyLzID58GsQF5mAiz2dLETSUiATkVVEdGb5CuxgQHYmnkOqa63iV60FruqJJT9
         M+Fqi5hDYrheTA8rj+boG65k3i8NtHyPtQS+GJC5d6NiY9IdelTFIESjCo0lPZKf5izR
         0XIojPWlo8HSsUn2lwvGPL73oqXKlO77M81Df704Q66/vXzf2Wve1oG9OcGJS9tvM4g4
         HpUTou+f3I/6+M1lE0Sz0Kn8DglK0GKc3Q4zq3VgRpVCwNiwlYsAfARPD9DKEvWCQFnC
         5rIg==
X-Forwarded-Encrypted: i=1; AKwUvBywv4w1k7eRTtpLYY8xekYDgc1h2ES16CtMxv3l+mPmyhN7CzWFWK8R+mdn473aeSJazJX65WbrG45qFSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wlM3yZj0tWv+oKTklwe+zt6jSI+ehFqOi89mxpNaVltK4VWb8
	n8U/N+aUm3H6LHYJjox7lvlzYM2wkuad3k7AuNbhAneJkgmfG+L9qs/U
X-Gm-Gg: AYBFou36eIk7MJrehzdPNpSJtnFW8EuTgrGzhVTPTvWYoQTaVzKJ2MTSJJaWqYfOVvh
	DgUuWAjEp3921jHqvnHLYi4PrUFKVaR74EfD7eUlbiCIN0PfGyOS5GKT9t/wxAHkSl2/J6qHe7b
	DYB61gxFdtCF+PLowq7qGmF4HtRfiEFvlc2qVKTeqpuqpHaOT8LSynOhuyCwFYpG9mVdImM14+J
	PmLeVclnZ2Y7Aqg9rM1JdkwMrAODmckRwlTyJyZU7zdqo9sCT3xhVSyKKzd2nSY8bWkbMSlbKPy
	KoIZbvUIjtekdVg3C3rQrwC+P4W82NycUOW7BJWMnvlbB4ZqCUOU5eCUN0ZbvFTQVvKANU6xPbV
	UBGvUg+zGTF0A0I+tq3KiGuDlvoNrQLq3Rwq5MpeQZoYKoF72uuZCvjEpanafgceIxQW7Yl0aeT
	0GSVl1ZS+SO8TQXC45COImtrGHAcr20mlqnUzc6PTxTX+zKzXb6fiHNtrEpuzZFM4rjs2z6dJCB
	f5Jn+D93sH83VdgV37MumyfceCAhP2q/4YcHRaAjet7z00rZ4W7FKVVR1vDgvBMaCdKZ9g0EDZc
	LOJgwM6C+5NeUBqw8YqV3wy/euSdvgbueA8qXfn41N/1ISpFKsZuG+4hpdMIqH5+J0BCS5HjyPH
	2p4xjr/l1Xg==
X-Received: by 2002:a05:690e:169b:b0:667:e855:ecdb with SMTP id 956f58d0204a3-67ba4c7f1bdmr7334220d50.3.1793674918196;
        Mon, 02 Nov 2026 19:01:58 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf3154cfsm6413297d50.19.2026.11.02.19.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:01:56 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v4 0/7] alpha/perf: add ProfileMe sampling
Date: Mon, 02 Nov 2026 22:01:55 -0500
Message-Id: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XNTQ6CMBCG4auYrq2ZDi2IK+9hXLRlkBr+0irRG
 O5uwRiJLL9knndeLJB3FNhh82KeBhdc18YhtxtmK91eiLsiboaAqQCUXNd9pXnvu9LV1BBPKd/
 rPMusUZJF1Xsq3WMuns6fHe7mSvY2ZaaLyoVb55/zy0FMd9/6flUfBAdeSGkUmhIVwPHSaFfvb
 NewqT7gwiew9hi9zQBLYVOFGf775OcFiLVPos+xUEIYpUHKpR/H8Q1NvqIxQAEAAA==
X-Change-ID: 20261024-alpha-profileme-6e98a977cb54
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6294; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=GI2yJRLUaIOwEtKf3HjoI/9jnSBjkQZtJcT5P0UJiCI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe+i3O26A8M3BRz6r7054eKLSe0t1mzzvX5EVeidA3L
 3W/5vU7Oj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaauzmMDHNneFaf0H
 OcoX3mXWHpzPzwjnr2k+u/VEyeeU3a+X21zWuG/4mup75mzHP+mP5udduSzNz5Cgu497XL8hwuW
 8e9/+apv0wA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The 21264 from EV67 on, and the 21364, have a second performance counter
mode, ProfileMe, alongside the Aggregate mode that the driver uses today.
An Aggregate mode sample reports the PC where the overflow interrupt was
taken. On an EV7 that is anywhere from 15 instructions before to 12
after the one that overflowed the counter, which makes perf annotate
output close to useless. In ProfileMe mode the CPU picks one fetched
instruction, follows it down the pipeline, and reports its PC along with
what happened to it: whether it retired, whether it trapped and why,
whether it was a mispredicted branch, stalled before map, or was killed
on a wrong path, and what PCTR1 counted while it was in flight.

Patch 1 fixes a constant passed to the wrong PALcode call, with no
functional change. Patch 2 adds the sysfs format and event attributes
the perf tool needs to name raw events. Patch 3 fixes counts lost when
an event is stopped before its first start, and patch 4 stops reporting
user registers that the entry code has not saved yet. Patch 5 adds
ProfileMe sampling, selected with precise_ip or a new profileme config
bit, so cycles:p and perf record's default event use it. Patch 6
attaches the status registers to each sample as PERF_SAMPLE_RAW data,
and patch 7 adds an option to randomize the sampling interval so that it
cannot lock onto a loop.

A separate series for perf-tools-next adds a decoder for the raw data
to perf report -D and perf script -D, and a script that sums the status
by symbol or by instruction, in the style of DCPI.

The two modes cannot run at the same time, because PCTR_CTL[SL0] sets
the mode for both counters. A ProfileMe event is scheduled alone, and
perf multiplexes it with any other hardware events. perf stat does not
ask for precise events, so it keeps using Aggregate mode.

To try it:

  perf record -e cycles:p -- ./workload
  perf annotate

I tested this on an AlphaServer ES47 (EV7). Samples from a
16-instruction loop land on all 16 instructions rather than on 4 PCs.
DTB misses and unaligned traps are attributed to the faulting load. A
branch on random data shows up as mispredicted in 21% of its samples,
and in 0% with sorted data. A 12 minute perf record -a while building
git took 4.45 million samples with no warnings. Sampling every 10000
instructions, which used to wedge the CPU, ran 66 times without a hang.
On two CPUs, this version survived 26 runs that mix sampling, context
switches and multiplexing, with no warnings.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v4:
- Patch 4: move __entry_save_end past the r16-r18 stores in entSys,
  as PAL_callsys does not save them and interrupts are still enabled
  there.
- Patch 5: report the user registers when the profiled instruction is
  in the entry code but the interrupt was taken after it, since
  perf_get_regs_user() sees the PMPC rather than the interrupted PC.
- Link to v3: https://patch.msgid.link/20261101-alpha-profileme-v3-0-92d511b5a044@gmail.com

Changes in v3:
- New patch 3: clear PERF_HES_UPTODATE when an event starts counting,
  so that a stop before the first start does not lose the count.
- New patch 4: report no user registers for a sample taken in the entry
  code, where the frame at task_pt_regs() is not complete. An interrupt
  nested on one taken there is still not caught.
- Patch 5: a user instruction whose interrupt is taken in the kernel now
  reports its PC with no registers or user stack, as the frame at
  task_pt_regs() may not be built yet. Thanks to Magnus Lindholm for
  finding this and for the fix.
- Patch 5: also move the counter away from overflow when a ProfileMe
  event is removed, or stopped without PERF_EF_UPDATE, as
  alpha_pmu_del() does not go through alpha_pmu_stop().
- Patch 5: ignore an interrupt that was pending when the event was
  stopped. Document that rewriting a counter does not cancel one.
- Link to v2: https://patch.msgid.link/20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com

Changes in v2:
- Patch 1: explain why bit 0 clear means all processes, although the
  Architecture Reference Manual says otherwise.
- Patch 3: fix a CPU wedge during high-rate ProfileMe sampling. The
  ProfileMe counters are now written twice, and a stopped counter is
  moved away from overflow, as EV67 HRM PALcode restrictions 32 and 38
  require.
- Patch 3: set the profiled PC in place in the trap frame of the
  instruction's mode instead of in a pt_regs copy on the stack, so
  sampled registers and stack values are those of the right frame.
  A kernel instruction whose interrupt is taken in user mode gets a
  per-CPU frame holding only its PC, so the user frame is not changed.
- Patch 4: drop the reserved field and pack the 64-bit fields of
  struct alpha_profileme_sample, so they are 8-byte aligned in the
  sample record and the record needs no padding. This changes the raw
  data layout.
- Patch 5: compute the jitter with mul_u64_u32_shr() and saturate the
  sum, so that large periods cannot overflow.
- Link to v1: https://patch.msgid.link/20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com

---
Matt Turner (7):
      alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the logging options call
      alpha/perf: add sysfs format and event attributes
      alpha/perf: clear PERF_HES_UPTODATE when an event starts counting
      alpha/perf: do not report user registers from the entry code
      alpha/perf: implement ProfileMe sampling
      alpha/perf: attach ProfileMe status as PERF_SAMPLE_RAW data
      alpha/perf: optionally randomize the ProfileMe sampling interval

 arch/alpha/include/asm/perf_event.h      |   2 +
 arch/alpha/include/asm/ptrace.h          |  12 +
 arch/alpha/include/asm/wrperfmon.h       |  14 ++
 arch/alpha/include/uapi/asm/perf_event.h |  31 +++
 arch/alpha/kernel/entry.S                |   9 +
 arch/alpha/kernel/perf_event.c           | 382 +++++++++++++++++++++++++++++--
 arch/alpha/kernel/perf_regs.c            |  13 ++
 7 files changed, 450 insertions(+), 13 deletions(-)
---
base-commit: 330517c63aa9b48227b6ab45f01003effac77ae4
change-id: 20261024-alpha-profileme-6e98a977cb54

Best regards,
--  
Matt Turner <mattst88@gmail.com>

