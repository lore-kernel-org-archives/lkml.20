Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793365406;
	b=xH/HrUOyfCobP4lFkhCr0YOuZtZu6VFMqk84UAMfx//i1xLuQqf8wb3AqP+44hu9a4Hb
	 VWWVQ5MzknkjJbQNs5T1E7OCu7an5NRWC2K6ZMj3qmLsI+Zj024WribR+9IxJkDuAd4GU
	 aVLBW4ZoLNlVXxZ9vsf61dhZRBMFdExgwYfcr9J/fzLb3Zf5AtDAiNiPz5u5QRx+MJVdb
	 LMlBuu4CWMubIw8wl2lCievBi5SzkCXYWmn+01NTJOw7J1S6l9L59ZK0ouf7GI10wLOcP
	 5ZKQDKQ9/jxm/sc4naHHGFh/HVhmAn6k0s8WzdSsF2WweJhLzDCbZvAhHsDRRCxdLIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=yXFu0vnlQfLtPaLquN71ye9MePKrHFCDfBFUqDk6/mg=;
	b=E+U0kvzV5P9hsb4G0L19KS5Xj6MUiZq8s13Kid0OEHNZ2vIrpusYDecgoNorFgFCjlGG
	 G/9WwG44b/TjW7X/foPk1VdXl8fe3wdZvxhnIpn3KRKJvefqj8tgg6UpCz3rTgYkf5Jwq
	 J1myNH6CnpBHw/hHwTXpaxCKuVxPymqudSa3nKemDK/7g+KPol7++lwHjAo1m9Xo62bhO
	 NhjbOcEc0Z4j0hvmhyM9zoRPmkcMvszTURJXkH1+Ba96LPUp/BstRCwB5dy+rJ/cjqd1n
	 t47vJcd8qroPqPnjMStr0V0qsk3mPoTPCcMvQpuy9VepBW8egmYJGSLF+PInHqBe93Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRrS6wCf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36697606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36697606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRrS6wCf
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso715025e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793365404; cv=none;
        d=google.com; s=arc-20260327;
        b=XmaWzQT86WZA1+hBYYabOm6UFY2JZQFDw17IrsjCqNHgeTkZptU7rgAxB1vOI2dDws
         0x+AR7uUsDpTqPBhC//Qll6jYi9yDOOLEvB0WoB5+6GGxY4Xb0+zgB5bVZmyApfdDeZh
         B3xPoqH3uWbfkdmcuxmOx8IzGto5hr/AFGjeuJQBK972p/c+XzZrt3PTF/KEuSlPXwcZ
         jKai0FcItFffTXHds7QsmI8+RzowOO9wCFr9sJGZitTIcI5IUpaCKuDRsQX2orhVy7fB
         OIh2nO/kU83wxnIjqtZo1txKOQ/e0t/S2lBWJgXqfTj+zuxymgjOhDbNB5UpPUw3hBhM
         R5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yXFu0vnlQfLtPaLquN71ye9MePKrHFCDfBFUqDk6/mg=;
        fh=z4K0CsLT8xBCdKf9D7Lj5R4nSgNwGPWY2K5s1OVOFSo=;
        b=SQSYNKJBifujcsGkjQb448UfmDmhsOAogAEtUoQpN6hSyxRnYc30CwFYCw1CQwPruW
         bnQHEAMXb0R/LEk8KXo/HqtW3R0KuzeaRlI4wv5bZdEVio5AHNbXcc37kvxLUroztKJE
         Oy4a2tFyuwmA6uLg7Yz2GElKe0rj3BGq1Lfrsmu6KrC+59DUT1DYyfTAGcLnlBsSoIMw
         Ve7EIk05wVyNCYCUSwsBwuaulI/xWEwVEXRy1mJILNocSQdfRu/RVcVGw6bxxggqJKY9
         5QzRRylJeHmLHj/cc3S6toC+G4ha8rGh4eW2YDm8GLj/pnc2vRzV7Yn4tLEnsNbIuGZ9
         KJtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793365404; x=1793970204; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yXFu0vnlQfLtPaLquN71ye9MePKrHFCDfBFUqDk6/mg=;
        b=hRrS6wCfFH27z91OeXgRDA+gTg1VklLnFGRmjJVtwrrA5kXk+nZ32G8pnSVs0k9zqB
         SYFsvTsUxdMbNEJXqT6tM/eOJCUwJiV+OofX9jEN4POxG30nQ6YfKKzswbaUF4cP22Ld
         KSlDxf6ydRsjR8n8JDdC1dk6roXJDxrZgCAEzs3XMCqZG755kT1OQ4nDA+Hd2AlP+ZMY
         hXMJlu7qoaZW4HSIOdloYVrpnnz6YBlgrFmgxp65o2moMds69YODZ72mzrMywvhLu9du
         U5TG2bXSeEcAKE4AnUwBEgM0r7iPRJiEynN/xLmEf0fghEsvtklcwa3pt4x6oM3cFIsl
         cCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365404; x=1793970204;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yXFu0vnlQfLtPaLquN71ye9MePKrHFCDfBFUqDk6/mg=;
        b=j/C6pqgeP5b+/qd24m57tmtxTj1Tr1tse4dXLpYbHEo3Teo4JWm2RUFjacNHm5snav
         ZsVJqkQMAyuWjmnyhOwYqgnTXvULKxl7cRcQrLDJDcXRbKHlCNu0L0IP08lmh+U1hoQ5
         yHjR4Nu/zthwXia+RQgNZ/FvxxksJjA1MWNjDoJnBrhcVfPP8UsOynP17hZyQ3sKY1/Y
         cnAUGsreoz5efbTXpxemULFXfOlFwC6p1GJkVcmxcXkAzsRYA10XagLhgA1/Lq3k8NyZ
         ZwTeFc6Gzm26vyoLyvbBJeF1/nhe0XtBccWNlLb2mUYKlBlAL7Wy2RGS3CK9gXOwyz3R
         7EBA==
X-Forwarded-Encrypted: i=1; AKwUvBwEDLh+H+y1hd71fubEvYd4dZsP086UwqVIbHywBhzo/xqUpCsMmayrs1YfDx9Qc2DsxJgS76gHtdPq72Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCrhjBEvaeiCoGOfTj/OMEopz+06fQ8IwMRTmTvcu3wOxXerjH
	iVYuWAVBoTb3omLitIZWGASNcQN7RcCOd8Sd8NHODaCs/CflL9v7mIzy2oLcSohyVP6Ws+ZvYfw
	RqIgcdO0mX/F9kifF238gm2vLk0rLRcY=
X-Gm-Gg: AYBFou2qlBLBewpf70TONaLOwFMkeSClr23gZrprGE7bk2NxoCuKQPHGws8hpFPYbeJ
	bufREcjvYBkIXjTQ98IRgLUJXrKOTYXKiudIobczwv+ysxAAAnhEyGDkiFwjcfrYBeIWBbwziKB
	eub9saiPLfIC1juo3m2LrrZu2GV7MlCAJTTkg7rYxfhhTTI6Tk/IqfBJjfzkd7ELzlHKjJoKIYP
	5yOCfmV9s/vpEI2OfAb42hD51zWjgpD23+cdwjTQa10s7W2M9+eaeUvlvy7xJKoyFS6ohqZoHlY
	mOveEe9pA/iwfTH2ea04uM33pXyPPSxwmJBOjlyTDmoxSRLAKX1e6og1gBeik81z4MzbtvcYly9
	S+eoYwe/XwtqdITR262GGiVqGwMk0SycMQRVSDNoT+RqOijACv4wPJ/qG0K48zKgx7TQDQbD2ta
	JjlxeWc1lU//iTqfIIO2SRTWmPc8w=
X-Received: by 2002:a05:6512:1307:b0:5bf:cab4:e497 with SMTP id
 2adb3069b0e04-5bfd95626acmr891879e87.10.1793365403808; Fri, 30 Oct 2026
 06:03:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Fri, 30 Oct 2026 21:03:08 +0800
X-Gm-Features: AclHuK8mF5WReVNCm9RGbYwzX6J1yH9s5rhENOZWywjaju8msEQaGqzibQEwM08
Message-ID: <CANGjgd=yr4Zy+SMUsDnBSw05hhn9086NVc9g9SaG0y804=WWrg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
To: Vincent Guittot <vincent.guittot@linaro.org>, Mike Galbraith <efault@gmx.de>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000d8e54c065f0e6b81"

--000000000000d8e54c065f0e6b81
Content-Type: text/plain; charset="UTF-8"

Hi Vincent, Mike, Peter,

I have additional pipe-handoff throughput results for 333238da9a19
("sched: Update time before requeueing delayed entities"), which Mike
identified in his wakeup-jitter test [1]. With 15 workers, will-it-scale
throughput on v7.3 is 15.69% lower than v7.1.3 in thread mode and 14.82%
lower in process mode. Reverting this commit on v7.2 in a separate controlled
comparison improves 15-worker thread throughput by 13.65%; the 2-worker
control changes by -0.48%.

I found this while running the existing MMTests recipe for will-it-scale's
context_switch1 test [2], not a generated workload.
Each worker exchanges one-byte messages with its own helper over two pipes,
counting two handoffs per round trip. I kept the default CORE affinity,
restricted to the i7-12700KF's eight P-cores, with both logical CPUs per core
available. Helpers inherit their worker's affinity mask; above eight
workers, cores are reused. All tasks ran at SCHED_OTHER/nice 0, with no extra
CPU-bound competitors or custom time slices. The benchmark loop was unchanged.

After each boot, I ran one warmup run followed by nine measured runs for
each condition. Each run excluded about six seconds of built-in warmup,
then measured throughput for 15 seconds. All kernels were built with
GCC 15.2.0 and run with full preemption, the powersave governor,
balance_performance EPP and Turbo enabled.

The v7.1.3 -> v7.3 -> v7.1.3 comparison used the recipe's worker counts,
plus 1/4/8-worker controls. Changes below are relative to the average of
the two baseline means:

  Workers       Thread mode       Process mode
   1/2/4/6/8    -0.70%..-4.52%    -1.32%..-4.59%
      11           -10.54%            -9.96%
      15           -15.69%           -14.82%
      20           -14.81%           -14.43%
      26           -12.69%           -13.55%
      33            -8.75%            -7.33%
      39            -7.39%            -6.46%
      40            -7.19%            -6.51%

For example, 15-worker thread throughput is 10,875,243 -> 9,168,152 ->
10,872,945 handoffs/s, about 1.71 million fewer handoffs/s on v7.3.
The within-boot coefficient of variation (CV) was at most 2.01%; the two
baseline means differed by at most 1.39%.

The matched v7.2 revert comparison used the same CORE affinity (handoffs/s):

  Thread workers     v7.2 A       v7.2 reverted        v7.2 B
        2          1,178,295         1,174,770       1,182,545
       15          9,413,892        10,695,877       9,409,225

At 15 workers the gain is about 1.28 million handoffs/s. The second baseline
was 0.05% lower than the first, and the maximum CV was 0.11%.

In separate PMU runs, I counted instructions and handoffs over the same
15-second post-warmup window. At 15 workers, kernel instructions per
handoff rose from 8,338 on v7.1.3 to 10,423 on v7.3 (+25.00%). Reverting
the commit on v7.2 reduced this from 10,239 to 8,355 (-18.40%). Context
switches stayed at about one per handoff in both comparisons, pointing to
more kernel work per handoff rather than more switches.

Separate entry probes over the same 15-second window observed about 1.0
delayed requeue per 100 handoffs at 2 workers and 92.6 at 15 workers on v7.2.
Almost every delayed requeue included the added update_curr() call.
The revert removed that call, but also reduced the 15-worker requeue rate
to 55.3 per 100 handoffs. With 15 workers, this accounting path was taken
much more often; reverting the commit also changed how often requeues
occurred.

CPU-location samples showed the same broad placement pattern across the
compared kernels.

These results point to additional work in the delayed-requeue path.
Updating time is needed for correct lag compensation, so the revert is
diagnostic, not a proposed fix. Can this overhead be reduced while
preserving correct lag accounting?

Reproduction details are attached; measurements and diagnostic summaries
are available at [3].

[1] https://lists.openwall.net/linux-kernel/2026/10/18/311
[2] https://github.com/antonblanchard/will-it-scale/blob/a34a85cc1e9b9b74e94fdd3ecc479019da610e6a/tests/context_switch1.c
[3] https://github.com/lcf0399/linux-regression-evidence/tree/8022fe1fb0256e65f63b4bde530b346027f63059/kernel/sched/sched-fair-delayed-requeue-handoff-333238da

LLMs assisted with experiment orchestration, analysis and drafting.
The workload is upstream will-it-scale; results are bare-metal measurements.

Assisted-by: LLM

Thanks,
Chengfeng

--000000000000d8e54c065f0e6b81
Content-Type: text/plain; charset="US-ASCII"; name="reproduce-wis.txt"
Content-Disposition: attachment; filename="reproduce-wis.txt"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

TmF0aXZlIENPUkUgd2lsbC1pdC1zY2FsZSBwaXBlLWhhbmRvZmYgcmVwcm9kdWN0aW9uDQo9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KDQpUaGlzIGRl
c2NyaWJlcyB0aGUgbmF0aXZlIENPUkUgbWVhc3VyZW1lbnRzIGluIHRoZSBhY2NvbXBhbnlpbmcg
cmVwb3J0Lg0KUnVuIG9uIGEgZGVkaWNhdGVkIHRlc3QgaG9zdC4NCkNQVSBudW1iZXJzIGRlc2Ny
aWJlIHRoZSBtZWFzdXJlZCBpNy0xMjcwMEtGOyBhZGFwdCB0aGVtIHRvIHRoZSBvdGhlciBob3N0
J3MNCnBoeXNpY2FsIHRvcG9sb2d5LCB0aGVuIGtlZXAgdGhlIGNob3NlbiB0b3BvbG9neSBpZGVu
dGljYWwgYWNyb3NzIGtlcm5lbHMuDQoNClBpbm5lZCBpbnB1dHMNCi0tLS0tLS0tLS0tLS0NCndp
bGwtaXQtc2NhbGU6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbnRvbmJsYW5jaGFyZC93aWxsLWl0LXNj
YWxlDQogIGEzNGE4NWNjMWU5YjliNzRlOTRmZGQzZWNjNDc5MDE5ZGE2MTBlNmENCk1NVGVzdHM6
IGh0dHBzOi8vZ2l0aHViLmNvbS9nb3JtYW5tL21tdGVzdHMNCiAgNjM4NDAxZTA3ZTcwZDY3ZmE1
YTFlNjI5NWUxMzE1YWUwYWY4MzFiMg0KS2VybmVsIHBlZWxlZCBjb21taXRzIChub3QgYW5ub3Rh
dGVkLXRhZyBvYmplY3QgSURzKToNCiAgdjcuMS4zICAxOTljOTk1OWQzYTliNTNmMzQ2YzIyMTc1
N2ZjN2FjNTA3ZmJhYzUwDQogIHY3LjIgICAgOGQzYWU1OTI4OGYxZTdkNThkNzY1NThhNmVlOTZk
NTMzYmM1MDE5Zg0KICB2Ny4zICAgIGMwM2MxYTE0NTA3ZGZhZjhiODU2YzI2MDhmOWFjMjE2MDIx
ZmMyMjINCkRpYWdub3N0aWMgdjcuMiB2YXJpYW50OiByZXZlcnNlIDMzMzIzOGRhOWExOTNmZmM1
ODc5Mjk5NWYzZTk1MWU0Y2I4N2JmZDIuDQpJdCByZW1vdmVzIHVwZGF0ZV9jdXJyKGNmc19ycSkg
ZnJvbSByZXF1ZXVlX2RlbGF5ZWRfZW50aXR5IGFuZCBpcyBOT1QgYQ0KcHJvcG9zZWQgZml4LiBU
aGUgaW50ZXJ2ZW50aW9uIHdhcyBub3QgcGVyZm9ybWVkIG9uIHY3LjMuDQoNCkJ1aWxkDQotLS0t
LQ0KRGVwZW5kZW5jaWVzOiBDIGNvbXBpbGVyLCBtYWtlLCBwYXRjaCwgaHdsb2MgZGV2ZWxvcG1l
bnQgZmlsZXMsIEdOVSB0aW1lLA0Kc3lzdGVtZCBhbmQgY2dyb3VwLXYyIGNwdXNldCBzdXBwb3J0
LiBUZXN0ZWQgR0NDIDE1LjIuMCBhbmQgaHdsb2MgMi4xMy4wLg0KVXNlIGNsZWFuIGFkamFjZW50
IHdpbGwtaXQtc2NhbGUgYW5kIG1tdGVzdHMgY2hlY2tvdXRzLiBJbiB3aWxsLWl0LXNjYWxlOg0K
DQogIGdpdCBjaGVja291dCAtLWRldGFjaCBhMzRhODVjYzFlOWI5Yjc0ZTk0ZmRkM2VjYzQ3OTAx
OWRhNjEwZTZhDQogIGdpdCAtQyAuLi9tbXRlc3RzIGNoZWNrb3V0IC0tZGV0YWNoIDYzODQwMWUw
N2U3MGQ2N2ZhNWExZTYyOTVlMTMxNWFlMGFmODMxYjINCiAgc2VkIC1uICcvXj09PT0gQkVHSU4g
YWxpZ24tYWxsb2MucGF0Y2ggPT09PSQvLC9ePT09PSBFTkQgYWxpZ24tYWxsb2MucGF0Y2ggPT09
PSQvcCcgXA0KICAgIC4uL21tdGVzdHMvc2hlbGxwYWNrX3NyYy9zcmMvd2lzL3dpcy1pbnN0YWxs
IHwgc2VkICcxZDskZCcgfCBwYXRjaCAtcDENCiAgc2VkIC1pICdzfC90bXAvc2hhcmVkX2FyZWF8
c2hhcmVkX2FyZWF8ZycgbWFpbi5jDQogIG1ha2UgLWoyIGNvbnRleHRfc3dpdGNoMV90aHJlYWRz
IGNvbnRleHRfc3dpdGNoMV9wcm9jZXNzZXMgXA0KICAgIENGTEFHUz0nLVdhbGwgLU8yIC1nIC1z
dGQ9Z251MTEnDQoNClRoZSBhbGlnbm1lbnQgcGF0Y2ggYW5kIHNoYXJlZF9hcmVhIHJlbG9jYXRp
b24gYXJlIGZyb20gdGhlIHBpbm5lZCBNTVRlc3RzDQppbnN0YWxsIHJlY2lwZS4gdGVzdHMvY29u
dGV4dF9zd2l0Y2gxLmMgaXMgdW5jaGFuZ2VkLiBPdGhlciBmaWxlLXBhdGggZWRpdHMNCmluIHRo
ZSByZWNpcGUgYWZmZWN0IGZpbGUtYmFja2VkIHRlc3RzLCBub3QgdGhpcyBwaXBlIHRlc3QuDQoN
Ck91ciBleGVjdXRhYmxlIFNIQS0yNTYgdmFsdWVzIChkaWZmZXJlbnQgYnVpbGQgZW52aXJvbm1l
bnRzIGNhbiBkaWZmZXIpOg0KICB0aHJlYWRzOg0KICAgIDZmZDVjNjNlNGNhZWM5OTE2Y2JkMzk0
MmIxYWQwMzdmNzM4ZDI0YjEyMzJjMTg3MTFmOTZiNzJiYzVmMjQ4ZDYNCiAgcHJvY2Vzc2VzOg0K
ICAgIGUwZTljZjAwMTdiZGMwZTVmMjc2ZDc2MjVlY2ZjMGYyNmIxYWYxNTkzYmNhMWM1MGFhZmQ5
YjFhYTc0OTc4NjcNCg0KUGxhY2VtZW50IGFuZCBvbmUgaW52b2NhdGlvbg0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KQ2hlY2sgbHNjcHUgLWU9Q1BVLENPUkUsU09DS0VULE5PREUuIE9u
IHRoaXMgaG9zdCBDUFUwLTE1IGFyZSBlaWdodCBQLWNvcmVzOw0KQ09SRSBtYXNrcyBhcmUgMCwx
OyAyLDM7IC4uLjsgMTQsMTUuIENQVTE2LTE5IGFyZSBFLWNvcmVzIGFuZCBleGNsdWRlZCBmcm9t
DQp0aGUgdGVzdCBncm91cCwgYnV0IGFsbCAyMCBsb2dpY2FsIENQVXMgcmVtYWluIG9ubGluZS4N
Cg0KS2VlcCBib3RoIFNNVCBDUFVzIGluIGVhY2ggQ09SRSBtYXNrLiBOYXRpdmUgaHdsb2MgYmlu
ZGluZyBpcyBlbmFibGVkOw0KZG8gbm90IGFkZCAtbiBvciAtbS4gSGVscGVycyBpbmhlcml0IHRo
ZWlyIHdvcmtlcidzIG1hc2suIEFib3ZlIGVpZ2h0DQp3b3JrZXJzLCBjb3JlcyBhcmUgcmV1c2Vk
IGluIG5hdGl2ZSBvcmRlci4gVGhlIGNvb3JkaW5hdG9yIHJldGFpbnMgQ1BVMC0xNS4NClRoaXMg
aXMgbm90IG9uZSB3b3JrZXIvaGVscGVyIHBhaXIgZm9yY2VkIG9udG8gdHdvIHNlcGFyYXRlIHBo
eXNpY2FsIGNvcmVzLg0KDQpFeGFtcGxlIGZvciAxNSB3b3JrZXJzIGluIHRocmVhZCBtb2RlIChy
ZXBsYWNlIG1vZGUgd2l0aCBwcm9jZXNzZXMpOg0KVXNlIGFuIG9yZGluYXJ5IGFjY291bnQgd2l0
aCBzdWRvIGZvciBzZXJ2aWNlIGNyZWF0aW9uLiBLZWVwIHRoZSBjaGVja291dA0Kb3V0c2lkZSAv
dG1wIGFuZCAvdmFyL3RtcCBiZWNhdXNlIFByaXZhdGVUbXAgd291bGQgaGlkZSBpdC4NCg0KICB3
b3JrZXJzPTE1DQogIG1vZGU9dGhyZWFkcw0KICBiaW5hcnk9IiRQV0QvY29udGV4dF9zd2l0Y2gx
XyRtb2RlIg0KICB3b3JrPSQobWt0ZW1wIC1kICIkUFdEL3dpcy1ydW4uWFhYWFhYIikNCiAgc3Vk
byBzeXN0ZW1kLXJ1biAtLXF1aWV0IC0td2FpdCAtLXBpcGUgLS1jb2xsZWN0IC0tc2VydmljZS10
eXBlPWV4ZWMgXA0KICAgIC0tdW5pdD0id2lzLWhhbmRvZmYtJCQiIFwNCiAgICAtcCAiVXNlcj0k
KGlkIC11bikiIC1wICJHcm91cD0kKGlkIC1nbikiIFwNCiAgICAtcCAnQ1BVQWZmaW5pdHk9MCAx
IDIgMyA0IDUgNiA3IDggOSAxMCAxMSAxMiAxMyAxNCAxNScgXA0KICAgIC1wIEFsbG93ZWRDUFVz
PTAtMTUgLXAgTWVtb3J5TWF4PTJHIC1wIE1lbW9yeVN3YXBNYXg9MCBcDQogICAgLXAgIlRhc2tz
TWF4PSQoKDIgKiB3b3JrZXJzICsgMTYpKSIgXA0KICAgIC1wIFJ1bnRpbWVNYXhTZWM9NDUgLXAg
VGltZW91dFN0b3BTZWM9NSAtcCBLaWxsTW9kZT1jb250cm9sLWdyb3VwIFwNCiAgICAtcCBOb05l
d1ByaXZpbGVnZXM9eWVzIC1wIEVudmlyb25tZW50PUxDX0FMTD1DIFwNCiAgICAtcCAiV29ya2lu
Z0RpcmVjdG9yeT0kd29yayIgLXAgIlJlYWRXcml0ZVBhdGhzPSR3b3JrIiBcDQogICAgLXAgUHJp
dmF0ZVRtcD15ZXMgLXAgUHJpdmF0ZURldmljZXM9eWVzIFwNCiAgICAtcCBQcm90ZWN0U3lzdGVt
PXN0cmljdCAtcCBQcm90ZWN0SG9tZT1yZWFkLW9ubHkgXA0KICAgIC1wIFRlbXBvcmFyeUZpbGVT
eXN0ZW09L2Rldi9zaG06cncsc2l6ZT0xNk0sbW9kZT0xNzc3IFwNCiAgICAtcCBMaW1pdENPUkU9
MCAtcCBMaW1pdEZTSVpFPTUzNjg3MDkxMiAtcCBMaW1pdE5PRklMRT04MTkyIFwNCiAgICAtLSAv
dXNyL2Jpbi90aW1lIC12IC1vICIkd29yay90aW1lLnR4dCIgXA0KICAgICIkYmluYXJ5IiAtdCAi
JHdvcmtlcnMiIC1zIDE1ID4gIiR3b3JrL25hdGl2ZS50eHQiDQoNClNlcGFyYXRlbHkgdmFsaWRh
dGUgYWZmaW5pdHkvY2xvbmUgaW5oZXJpdGFuY2UgdXNpbmcgc3RyYWNlIC1mIHdpdGgNCnNjaGVk
X3NldGFmZmluaXR5LCBjbG9uZSBhbmQgY2xvbmUzIGJlZm9yZSBjbGVhbiB0aW1pbmcuIENoZWNr
IHRoZSBlZmZlY3RpdmUNCm1hc2sgYWZ0ZXIgaW50ZXJzZWN0aW9uIHdpdGggdGhlIGNncm91cCwg
bm90IG1lcmVseSB0aGUgcmVxdWVzdGVkIG1hc2suDQpBdCAxNSB3b3JrZXJzLCAzMCB3b3JrZXIv
aGVscGVyIHRhc2tzIHVzZSB0aGUgZWlnaHQgQ09SRSBtYXNrczsgdGhlIGZpcnN0DQpzZXZlbiBt
YXNrcyBoYXZlIGZvdXIgdGFza3MgZWFjaCBhbmQgdGhlIGxhc3QgaGFzIHR3by4gVGhlIGNvb3Jk
aW5hdG9yIGlzDQphZGRpdGlvbmFsLiBJbiBwcm9jZXNzIG1vZGUgdGhlc2UgYXJlIHByb2Nlc3Nl
cywgbm90IHRoZSBzYW1lIHRocmVhZCBncm91cC4NCkRvIG5vdCB1c2Ugc3RyYWNlIG9yIHBlcmYg
ZHVyaW5nIHRpbWluZy4gUHJlc2VydmUgZmFpbGVkL2luY29tcGxldGUgcnVucy4NCg0KU2VwYXJh
dGUgYWN0dWFsLXBsYWNlbWVudCBjaGVjayAobm90IGNsZWFuIHRpbWluZyk6IHR3byBpbmhlcml0
ZWQgMTk5LUh6DQpDUFUtY2xvY2sgcmVjb3JkcyBwZXIgY29uZGl0aW9uIG9uIHY3LjEuMywgdjcu
MywgdjcuMiBhbmQgdGhlIGRpYWdub3N0aWMNCnJldmVydC4gSW4gZWFjaCByZWNvcmQsIDE0LzE1
IHdvcmtlci9oZWxwZXIgcGFpcnMgYXQgMTUgd29ya2VycyBoYWQgYWxsDQpjYXB0dXJlZCBzYW1w
bGVzIG9uIG9uZSBsb2dpY2FsIENQVSBwZXIgcGFpcjsgdGhlIHJlbWFpbmluZyBwYWlyIHVzZWQg
dGhlDQpDUFUxNC8xNSBjb3JlLiBBdCAyIHdvcmtlcnMsIGJvdGggcGFpcnMgaGFkIHNhbXBsZXMg
YWNyb3NzIHRoZWlyIGNvcmUncw0KU01UIENQVXMuIFRodXMgYW4gYWxsb3dlZCBDT1JFIG1hc2sg
ZG9lcyBub3QgaW1wbHkgdGhlIHBhaXIgYWN0dWFsbHkgcnVucw0Kb24gc2VwYXJhdGUgbG9naWNh
bCBDUFVzLiBUaGUgcGF0dGVybiB3YXMgdW5jaGFuZ2VkIGFjcm9zcyB0aGUgZm91ciBrZXJuZWxz
Lg0KUGFpcnMgd2VyZSByZWNvbnN0cnVjdGVkIGZyb20gZm9yayBldmVudHMsIHdpdGggaW5kZXBl
bmRlbnRseSBjaGVja2VkDQphZmZpbml0eSBtYXNrcy4gVGhlIHNhbXBsZWQgd2luZG93IHN0YXJ0
cyBzaXggc2Vjb25kcyBhZnRlciB0aGUgbGFzdCB0ZXN0DQp0aHJlYWQgaXMgY3JlYXRlZCBhbmQg
ZW5kcyBhdCB0aGUgZmlyc3QgdGVzdC10aHJlYWQgZXhpdC4gSXQgYXBwcm94aW1hdGVzDQp0aGUg
bWVhc3VyZWQgaW50ZXJ2YWwsIG5vdCBhbiBleGFjdCBiZW5jaG1hcmsgbWFya2VyIG9yIGEgY29t
cGxldGUgc2NoZWR1bGU7DQp1bnNhbXBsZWQgbWlncmF0aW9ucyBhbmQgb3RoZXIgdGltaW5nIGVm
ZmVjdHMgY2Fubm90IGJlIGV4Y2x1ZGVkLg0KDQpQYXJhbWV0ZXJzLCBydW50aW1lIGFuZCBzYW1w
bGluZw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCk5hdGl2ZSByZWNpcGUgd29y
a2VyIGxpc3Qgb24gdGhpcyBob3N0Og0KICAyLCA2LCAxMSwgMTUsIDIwLCAyNiwgMzMsIDM5LCA0
MA0KQWxzbyBtZWFzdXJlZCBzZXBhcmF0ZWx5OiAxLCA0LCA4LiBCb3RoIHRocmVhZCBhbmQgcHJv
Y2VzcyBtb2RlcyB3ZXJlIHRlc3RlZC4NClRoaXMgZG9lcyBub3QgY292ZXIgZXZlcnkgcG9zc2li
bGUgTU1UZXN0cyBjb25maWd1cmF0aW9uLg0KDQpCYXJlIG1ldGFsLCBpNy0xMjcwMEtGLCAzMiBH
aUIgUkFNOyBHQ0MgMTUuMi4wLCBydW50aW1lIHByZWVtcHQ9ZnVsbC4NClNDSEVEX09USEVSL25p
Y2UgMCwgbm8gY3VzdG9tIHNjaGVkX3J1bnRpbWUvc2xpY2UsIG5vIGV4dHJhIENQVS1ib3VuZCBz
cGlubmVyLg0KcG93ZXJzYXZlIGdvdmVybm9yLCBiYWxhbmNlX3BlcmZvcm1hbmNlIEVQUCwgVHVy
Ym8gZW5hYmxlZCBhdCBldmVyeSBwb2ludC4NCk5vIENQVSBiYW5kd2lkdGggcXVvdGE7IDIgR2lC
IG1lbW9yeSBjYXAgYW5kIG5vIHN3YXAgZm9yIHRoZSB0ZXN0IGdyb3VwLg0KUlQgYnVkZ2V0IHJl
bWFpbnMgOTUwMDAwIHVzIHBlciAxMDAwMDAwIHVzOyB0aGVzZSBhcmUgbm90IFJUIHRhc2tzLg0K
VGhlIG1hdGNoZWQgdjcuMiBidWlsZHMgZGlmZmVyIG9ubHkgaW4gdGhlIGRpYWdub3N0aWMgcmV2
ZXJ0IGFuZCBMT0NBTFZFUlNJT04uDQpLZWVwIG90aGVyIHNldHRpbmdzIG1hdGNoZWQgYW5kIHJl
c3RvcmUgdGVtcG9yYXJ5IGNoYW5nZXMgYWZ0ZXJ3YXJkLg0KTm8gYmVuY2htYXJrLCBrZXJuZWwg
YnVpbGQsIGNvdmVyYWdlIG9ic2VydmVyIG9yIHByb2ZpbGVyIHJ1bnMgY29uY3VycmVudGx5Lg0K
DQpGb3IgZWFjaCBjb25kaXRpb24gaW4gZWFjaCBib290OiBvbmUgcGxhY2VtZW50IGRpYWdub3N0
aWMsIG9uZSBjb21wbGV0ZQ0Kd2FybXVwIHJ1biwgdGhlbiBuaW5lIG1lYXN1cmVkIHJ1bnMgd2l0
aG91dCBpbnN0cnVtZW50YXRpb24uIEVhY2ggcnVuIGhhcw0Kc2l4IG5hdGl2ZSB3YXJtdXAgaW50
ZXJ2YWxzLCBmaWZ0ZWVuDQptZWFzdXJlbWVudCBpbnRlcnZhbHMgYW5kIGF2ZXJhZ2U6Ti4gVGhl
IGF2ZXJhZ2UgaXMgdGhlIGludGVnZXIgZmxvb3Igb2YNCnRoZSBzdW0gb2YgZmlmdGVlbiBtZWFz
dXJlZCB0b3RhbHMgZGl2aWRlZCBieSBmaWZ0ZWVuLg0KDQpUaGUgbWFpbiBtZXRyaWMgaXMgYWdn
cmVnYXRlIG5hdGl2ZSBoYW5kb2Zmcy9zLCB0d28gaW5jcmVtZW50cyBwZXINCndyaXRlL3JlYWQg
cm91bmQgdHJpcC4gSXQgaXMgbm90IGEgUE1VIGNvbnRleHQtc3dpdGNoIGNvdW50LiBHTlUgdGlt
ZSByZWNvcmRzDQp3aG9sZS1ydW4gdXNlci9zeXN0ZW0gQ1BVIGFuZCBlbGFwc2VkIHRpbWUgc2Vw
YXJhdGVseS4gUnVucyBsYXN0IGFib3V0DQoyMSBzZWNvbmRzOyBsb3dlciB0aHJvdWdocHV0IGRv
ZXMgbm90IG1lYW4gYSBjb3JyZXNwb25kaW5nbHkgbG9uZ2VyIHJ1bi4NCg0KSW5kZXBlbmRlbnQg
Y29tcGFyaXNvbnM6DQogIDI0IGNvbmRpdGlvbnM6IHY3LjEuMyAtPiB2Ny4zIC0+IHY3LjEuMy4N
CiAgVGhyZWFkIHdvcmtlcnMgMi8xNTogdjcuMiBBIC0+IGRpYWdub3N0aWMgcmV2ZXJ0IC0+IHY3
LjIgQi4NCk5pbmUgcnVucyB3aXRoaW4gb25lIGJvb3QgYXJlIG5vdCBuaW5lIGluZGVwZW5kZW50
IGJvb3RzLiBLZWVwIGNvbXBhcmlzb25zDQphbmQgYm9vdCBwb3NpdGlvbnMgc2VwYXJhdGU7IGRv
IG5vdCBwb29sIGJhdGNoZXMuIENvbXBhcmUgdGhlIG1pZGRsZSBtZWFuDQp0byB0aGUgbWVhbiBv
ZiB0aGUgZmlyc3QvcmV0dXJuIG1lYW5zLiBDViB1c2VzIHNhbXBsZSBzdGFuZGFyZCBkZXZpYXRp
b247DQpyZXR1cm4gZHJpZnQgaXMgcmV0dXJuIC8gZmlyc3QgLSAxLg0KDQpQZXItcnVuIG1lYXN1
cmVtZW50cyBhbmQgcmF3LW91dHB1dCB2ZXJpZmljYXRpb24gYXJlIHJldGFpbmVkIGxvY2FsbHkg
YW5kDQphdmFpbGFibGUgb24gcmVxdWVzdDsgbm8gbWVhc3VyZW1lbnQgQ1NWIGFjY29tcGFuaWVz
IHRoZSBpbml0aWFsIHJlcG9ydC4NCg0KU2VwYXJhdGUgcG9zdC13YXJtdXAgZGlhZ25vc3RpY3MN
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkNvdW50ZXIgZGlhZ25vc3RpY3MgdXNl
IHRoZSBzYW1lIGZpZnRlZW4gbmF0aXZlIGludGVydmFscyBhcyB0aGUgdGhyb3VnaHB1dA0KZGVu
b21pbmF0b3IsIG5vdCB0aGUgd2hvbGUgMjEtc2Vjb25kIGludm9jYXRpb24uIEEgZGlhZ25vc3Rp
Yy1vbmx5IHByZWxvYWQNCnJlYWRzIGluaGVyaXRlZCB0YXNrLXNjb3BlZCBwZXJmIGRlc2NyaXB0
b3JzIGF0IHRoZSBvcmlnaW5hbCAibWVhc3VyZW1lbnQiDQphbmQgImF2ZXJhZ2UiIG91dHB1dCBi
b3VuZGFyaWVzOyB0aGUgYmVuY2htYXJrIGV4ZWN1dGFibGUgYW5kIGhvdCBsb29wIGFyZQ0KdW5j
aGFuZ2VkLiBTdWJ0cmFjdCB0aGUgdHdvIHJlYWRpbmdzIGFuZCBkaXZpZGUgYnkgdGhlIHN1bSBv
ZiB0aGUgZmlmdGVlbg0KbmF0aXZlIGhhbmRvZmYgdG90YWxzLiBSZWNvcmQgZW5hYmxlZC9ydW5u
aW5nIHRpbWUgYW5kIGJvdW5kYXJ5IHJlYWQgdGltZXM7DQp0aGVzZSBhcmUgc2hvcnQgc2VxdWVu
dGlhbCBzbmFwc2hvdHMsIG5vdCBhIHNpbXVsdGFuZW91cyBzdG9wIG9mIGFsbCB3b3JrZXJzLg0K
DQpUaGVyZSB3ZXJlIHRocmVlIGNvdW50ZXIgcnVucyBwZXIgY29uZGl0aW9uIGF0IHY3LjEuMywg
djcuMywgdjcuMiBhbmQgdGhlDQptYXRjaGVkIHJldmVydCwgZm9yIDIvMTUgd29ya2Vycy4gS2Vy
bmVsIGluc3RydWN0aW9ucy9jeWNsZXMgY292ZXIgdGhlIHRlc3QNCnRhc2sgZmFtaWx5LCBub3Qg
dXBkYXRlX2N1cnIgYWxvbmU7IGludGVycnVwdCB3b3JrIGluIHRoYXQgY29udGV4dCBjYW4gY291
bnQuDQpUaGV5IGFyZSBkaWFnbm9zdGljcywgbmV2ZXIgYWRkaXRpb25hbCBjbGVhbi10aHJvdWdo
cHV0IHNhbXBsZXMuDQoNCkEgZGlmZmVyZW50IGJhdGNoIHVzZWQgdHdvIGVudHJ5LXByb2JlIHJ1
bnMgcGVyIGNvbmRpdGlvbiBvbiB2Ny4yIGFuZCB0aGUNCnJldmVydCwgd2l0aCB0aGUgc2FtZSBu
YXRpdmUgd2luZG93IG1hcmtlcnMuIENvdW50IHJlcXVldWVfZGVsYXllZF9lbnRpdHkNCmVudHJp
ZXMvcmV0dXJucywgdXBkYXRlX2N1cnIgZW50cmllcywgYW5kIHVwZGF0ZV9jdXJyIGluc2lkZSB0
aGUgcmVxdWV1ZSwNCnJlc3RyaWN0ZWQgdG8gdGhlIG1hcmtlZCBiZW5jaG1hcmsgdGhyZWFkIGdy
b3VwLiBDaGVjayBlbnRyeS9yZXR1cm4gYm91bmRzDQphbmQgcGVyLW9iamVjdCBjb3VudCBjb25z
ZXJ2YXRpb247IHRoZSBmaXJzdCBhcmd1bWVudHMgYXJlIHNjaGVkX2VudGl0eSBhbmQNCmNmc19y
cSByZXNwZWN0aXZlbHksIG5vdCBhIGNvbW1vbiBydW5xdWV1ZSBpZGVudGlmaWVyLiBFeGFjdCB0
ZXN0ZWQgc3ltYm9scw0KYW5kIHRoZSBwcmVzZW5jZS9hYnNlbmNlIG9mIHRoZSBpbnRlcm5hbCB1
cGRhdGVfY3VyciBjYWxsIHdlcmUgY2hlY2tlZCBpbg0KYm90aCB2bWxpbnV4IGZpbGVzLiBQcm9i
ZSBvdmVyaGVhZCBjaGFuZ2VzIGV4ZWN1dGlvbiwgc28gbm8gUE1VIG9yIHRocm91Z2hwdXQNCnZh
bHVlcyBmcm9tIHRoZXNlIGluc3RydW1lbnRlZCBydW5zIGFyZSB1c2VkIGFzIHBlcmZvcm1hbmNl
IGV2aWRlbmNlLiBUaGUgY291bnRzDQpkbyBub3QgcmVjb25zdHJ1Y3QgZXZlcnkgbGFnIHZhbHVl
LCBoaWVyYXJjaHkgb3Igc2NoZWR1bGluZyBkZWNpc2lvbi4NCg==
--000000000000d8e54c065f0e6b81--
