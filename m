Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793912216;
	b=0pJf89iWa9m6bk0lfYkOYdGCnssFP7mtZ7/IdKwb4zU2uBQ2RJr6YtJKljpCgzqT5qTw
	 +pM9ENw+911/xcf1kEEyJvqrSJEYSWNRajFnjF4HpsdwqWNK6wFPlDQOND/pW+6iQvBPR
	 gkNbQJuZwUzGKRa2i7GZPbvaKMelCf9uKSGkbagFTdLrcLwV4Php2e1K87noeeUQLnuht
	 qZu1/tYM7ecwFqxvbQqj6ejW2mnUbfarM4s4+C6+/iR9E0lDwNNGHhnrRFDOxY4XHaFMe
	 iYMXZcgHXIjlFu6b6xxpahJImBk/V/NThKBzwsdwNijutYNqof8KpQToKnBJYKBzVuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/phxpzI1UKsSV5tNfaw6aHcef/RF4EXbM4Y9RmHS98c=;
	b=hbpqmo5HbjLdk7zmkU73gW3q0usX+KSy0pQVddmCTKgwSl5BkcGQKpH2PNvF4j5ElQ6V
	 Oe8B9fWh+YjukQYPln4u5SLh3MCzSyT39JVcQ3AuUcAiDcn1ZBgAz6VEqWpm02vcU7GeW
	 aNKcycDQDLWWZEjyq9eCeg84sHxxAEF8NfS8SHp+IZRRfvPMN5A7mCyOT47tcix6o9rYr
	 7KK5T5dRdRBZtCFo3rBD/VwfHkVR4Lj4lU4Oq6GR7eF2vkJi+V7oEluN5kcuH/m2/WwVh
	 jtyFamaXosrQHVOxOmloSPuUPRf1SS+xe4jIMBBgedMziSUqeXVAzr8PRA4kyyfy/GQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0M7hcgVG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22788606A33C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22788606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0M7hcgVG
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2994063a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:56:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793912214; cv=none;
        d=google.com; s=arc-20260327;
        b=Vli35X4erGQswK04vrDSk707RWT4boYZdGW5PN23tICr+t5sIJfiJhUv/CIZSlyQGj
         nxZTLQKreEG+HpkmoQWgST305vc6xHd5V6PgJbb9ImDGTUGTC0ac/GWGpIy4ozCJnR+t
         U6WRhYc4lXa87wFwpiiLDAeVP6OQzL5sUTxmZDNRXbo26yJqJdEzJvoOnsAD3+vZD+hw
         LXTAWUoiY/SiozVH8Fevt2l6hJWiimzKnMCN2cxX60FWNWtE3Hk5t82tS3azlBKS4Rcz
         refYENrfH4nEN+BCbX+wz9ix1SHL/z+JKPR8sVi/PnR0CAvlTL3LkNZmvVvmPyDwuG1v
         TzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=/phxpzI1UKsSV5tNfaw6aHcef/RF4EXbM4Y9RmHS98c=;
        fh=eiR8c5V1ezsvrn3j8/ioKIQ8llN0c/MK31QuvuA/VrE=;
        b=PI8ayjfcILuI9l4wmJv/v4E2dXMphexLEJs6xNXsuWwFy4f3fmhFP9vyRPU9RR7Se/
         rvfzdGNQTljyFNQPgzlGaSn67VdLwfYz1z3RL0kaiMWskYF5QgyE68f0EUQTpRitYvm9
         LI8Q1oIreaw4jTHD6oIobya9XGLGZwSmnAYXVFmm0r535kGhnKNRIh1x5YsURv0bwQ0q
         SBqX0j9/rFiaJQ7Tc92/GvdUPSXhidf4EQzCygbZR60GdQd7B0Cn6I6wmLPFZKJCDwH6
         /T+Jjhu1oOv9M5yMiIWigWyN+mVuyat/xaQnEt7FecYE6xSaIMlK9AMRFdAWCOIISW/0
         nV9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912214; x=1794517014; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/phxpzI1UKsSV5tNfaw6aHcef/RF4EXbM4Y9RmHS98c=;
        b=0M7hcgVGFgbIE5Udh48jwEMtd1uJ9LR4UbVv6DCxojXW6j3R8UhDFSKAnhUGXQyBAP
         HWcgdTD1KqurD7nNt9eufJyaFyQLA/CJ/e/23I/S0hpWbus/b1LjIgMpGllTFpDKT0aE
         ZY5R8RAXJQBoULgo6hE/Z5o0G9URUAi8ASI72nE8RbLA3K96xmwpk+2m7UY4FoULju7G
         GnNlDpdioj/I22eZFoRrp3LlLh46W6hXtPiH18pQljJI1QDAjCJycyIyJ2vfwJQcKgKG
         uZvfd2cYNhNvaOuwFj0zjWsijLLosFqSN1L/+uAeDMsfi8JJX1f4K5Od0jFmQJ5AnIm0
         V/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912214; x=1794517014;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/phxpzI1UKsSV5tNfaw6aHcef/RF4EXbM4Y9RmHS98c=;
        b=Z4vJq5XJpcTJF3cZ+gI2VUR754JEooiDTOpQbvPRn7xLNkkls/THM6sE0VWgW7Cmnc
         DEEiNRVVUWXhnB2bM8ToCpbiOisupSdue9ga08/BfUmFJDcopyEB5Jja+eYXlk+AY1aY
         eIUtOU3PYeipLSdyY1orKxLIa1m7lSm8hTimmmwvQwVtICuuJK9VO5NsmSBWlkRXLZRg
         4isCDM1V7SVDOM2Y3x/sj85FYoHvsF0a3W/pZsYgTV1A1Iu39l6a7R0WSxjTQsqd7yNZ
         XXXkiO9gmlzWBIvUiHgfL58trJ3DLZOVuFLtQKJjUHgTr/B66DKUiopFChZKkcgml6Gz
         4WGQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+Rg0JhsEerO/SfqN1ybQV/6ID46m4DX9/PjnyXtmvmBYoB4juCubU6G6fwt7rEivCJFkOd0+gDNitmQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a0AjeC2Xo9kTHgPeBT8mOZb/8KPJainYk8M8Rianpr9XTlvXN
	2hOz7WH4klXHgmKVdr2UBqc4Y8TFekxkyf4dVN9itxX2zFJ+SEtlP0ujTxhG0Bj4A4n6RlsDdQ0
	nuDu9YlVm5IbAg++6zXZoh/TazQBEew8=
X-Gm-Gg: AYBFou1AoF6LPYslhsr5e5NqMC1dcsLMYJvsvhe7tVYQw6F7CyDuoN6o8G9EkMBnZwa
	2DNzIkIjmkY2UD8yvK7Hhb19PeUVXTIs/5Ef4FBfm4ZqAyxFHheaSpK5sb8xnN2Z05EaRdo8GCp
	mMAvd4JkLim2iWmljQaXjh8/ap72rFzgsu32MObydNNs9ROvO7FMYOG6ZVkGFsWSmzb/gpD7zyX
	xdjb+MfRfnz1e46sZDCOdwq8ccs/YXOPovmw3Kn7jTSZhEotYSp64XMeSxDD2wEA0eMn7w8yWcr
	6fvabvdpfPSWxcbesUnAXPWCBpJuAvQvahXejq28xL+Yg79UAK1bhVo5a/wCOYRUrXh8lacXjl9
	GSGDu9U8eyid6b+qvqyct592L/r45c3KyWROg
X-Received: by 2002:a17:907:d22:b0:c3f:7e8:235d with SMTP id
 a640c23a62f3a-c4d351f3023mr53078166b.5.1793912214402; Thu, 05 Nov 2026
 12:56:54 -0800 (PST)
Received: from 374130946952 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Nov 2026 12:56:53 -0800
Received: from 374130946952 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Nov 2026 12:56:53 -0800
From: Joshua Warren <joshua.s.warren@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CADjP6_CC-jv6nyEHaLj=Z0eyjubOJZuiKESqszW3LgTJTTQ_Aw@mail.gmail.com>
References: <CADjP6_CC-jv6nyEHaLj=Z0eyjubOJZuiKESqszW3LgTJTTQ_Aw@mail.gmail.com>
Date: Thu, 5 Nov 2026 12:56:53 -0800
X-Gm-Features: AclHuK8S9km1Ew1lvTGzMPLE6UCtBo_MM5e2JxRFpB85QJDvElEn0nr9hBRZ3sw
Message-ID: <CADjP6_CNzjdi795ZgSeO-RuOou1h97zbp-D-T9edH6G8HPf0wA@mail.gmail.com>
Subject: [PATCH 2/2] perf/core: handle first AUX mmap on redirected events
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A redirected event (perf_event_set_output()) enters perf_mmap_aux()
with mmap_count == 0: its first mmap() can only be the AUX mmap, since
perf_mmap_rb() rejects count-0 events with -EBUSY.  The ring-side fix
is commit d06bf78e55d5 ("perf: Fix refcount warning on
event->mmap_count increment").  The
tail refcount_inc() from zero saturates the count and reports
REFCOUNT_ADD_UAF, which refcount_warn_saturate() raises through
REFCOUNT_CORRUPTION(): a WARN_ONCE() normally, but a BUG() when
CONFIG_BUG_ON_DATA_CORRUPTION=y.  A saturated count is never released:
a later AUX mmap() of the event adds to the saturated count and reports
REFCOUNT_ADD_OVF (a WARN_ONCE(), silent after its first report), while
perf_mmap_close() takes the saturated count silently --
refcount_dec_and_mutex_lock() fails without warning -- so the close
path that detaches the event from the borrowed rb can never run.

Reject the AUX mmap() of a not-yet-mmaped event with -EBUSY, matching
the ring mmap() stance: the redirect keeps the state
perf_event_set_output() left it in, and the shared rb's counters and
its user and mm accounting stay untouched.  As on the ring side, the
reject avoids creating a mapping that aliases the borrowed rb, so the
shared user_page and AUX area remain the owner's alone.

This changes observable behavior: the first AUX mmap() of a redirected
event now fails with -EBUSY where it previously reported a refcount
error and saturated the event's mmap_count.  Only flows that are already
broken on this base are affected: a redirected event's ring mmap() is
rejected with -EBUSY already, so its AUX mmap() could only ever report
that error and saturate.

The impact of the defect is availability only: the count saturates
fail-safe, and no use-after-free was found.  The defect is reachable by
an unprivileged user through perf_event_set_output() (PERF_FLAG_FD_OUTPUT)
on AUX-capable PMUs where userspace can create the AUX-owning event.  On
a default kernel the first such mmap() prints one warning.  With
panic_on_warn=1 that first warning panics the kernel, and with
CONFIG_BUG_ON_DATA_CORRUPTION=y the BUG() oopses the task regardless of
panic_on_warn.

Tested with a source-level host harness that compiles perf_mmap,
perf_mmap_rb, perf_mmap_aux, perf_mmap_close,
perf_mmap_account/unaccount/calc_limits straight from this tree and
drives full ring, AUX and redirected-event lifecycles over them
(single-user, single-mm, single-threaded; nothing runs in a kernel):
the previous commit's source fails the nine redirected-AUX scenarios
(the AUX mmap of a redirected event saturates mmap_count), this source
passes all 33, and the 22-case alias-charge harness still passes.
The harness is tooling, not part of this change.  Compile-verified with a
focused x86-64 defconfig build of kernel/events/core.o; the kernel was
not booted and no runtime kernel reproduction was performed.

AI coding agents in the omp harness wrote the patches, the reproducer
and the measurements.

Fixes: 448f97fba901 ("perf: Convert mmap() refcounts to refcount_t")
Signed-off-by: Joshua Warren <joshua.s.warren@gmail.com>
---
 kernel/events/core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index c8bb805bc..d336e5747 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7419,6 +7419,17 @@ static int perf_mmap_aux(struct vm_area_struct
*vma, struct perf_event *event,
 	if (!is_power_of_2(nr_pages))
 		return -EINVAL;

+	/*
+	 * A redirected event (perf_event_set_output()) arrives here with
+	 * mmap_count == 0; perf_mmap_rb() rejects its ring mmap() with
+	 * -EBUSY.  Reject its AUX mmap() the same way: the tail
+	 * refcount_inc() below would raise mmap_count from zero, which
+	 * WARNs and saturates the count, and a saturated count cannot be
+	 * released by perf_mmap_close().
+	 */
+	if (!refcount_read(&event->mmap_count))
+		return -EBUSY;
+
 	if (!refcount_inc_not_zero(&rb->mmap_count))
 		return -EINVAL;

-- 
2.39.5
