Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319AA3F8EBE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910600; cv=none; b=Z95XAn74J0YYHSpy4R7cZPpK7rdEXhE5f9THcd2uzL4VDvaKpM21qaSWJtLOdEB1BYiexG6DB4bgWrA4OqWVgJcMPZGfNyyc3GhA/O2jvgfeQOvCL69M3sya4KfudjCB/NcA+FPfv5ML8umivgxrIRGrOOev6yl543Kn7p7BVXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910600; c=relaxed/simple;
	bh=YQI5Ol28VigLJhF7Lu+7aD2wnjckdWNnxFpM0mXQMRE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wri1ACdkpwT2Dhu7l5yaSQpAoVQ252/WCk6wygObzBj3SwllAonh4t25GbDDSocBJ9NhgEu9Nr3ivrksSxaUt7QygU93s8zMcZTPgSMOY5S1+P3MRXkps5ak1iE5GzDC/nR6rTFAfSkTgUVXcMWk1kDWycvTu65vwuLswgQPlJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GhRTkWkT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MV2sxbyU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GhRTkWkT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MV2sxbyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787910591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fjus0cEE64rVoeyJBEwq4yXByfhMwbzT4sjrQJ9cSNI=;
	b=GhRTkWkTXWBRC3/moEgcyqwlRAoyO6dS2lFSghMl0+NnVsQgm3bG+A9qtJ3HUfgk1VXKy7
	Y/rIE+ZLl58NEw3UEE92+UgcH5Mc4+RWA68eZN0XXEMMU4Cihhi+dPvkNpnhBiaujfF9Md
	DHrGSwO16WV8JdWiqhmQm2/H9tF5NNw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-g-ozsnakO_GtZql1vi1u2A-1; Fri, 28 Aug 2026 05:49:50 -0400
X-MC-Unique: g-ozsnakO_GtZql1vi1u2A-1
X-Mimecast-MFC-AGG-ID: g-ozsnakO_GtZql1vi1u2A_1787910589
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-69e984607e7so661118a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787910589; x=1788515389; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjus0cEE64rVoeyJBEwq4yXByfhMwbzT4sjrQJ9cSNI=;
        b=MV2sxbyUyh2OVV/M7tUuZ05JcqAjTvlwvvs2dC/YSfLBaBpQPv71X81Qu80pNXkcdT
         zfLjj9mZAejbbmXxa1O84V9wVx5yLoB307uX1iVsKtqqRfjVswzs1T650DqPsCLaLl8u
         9robnE2Ew6clNvWCsY+TuvN6lVIeTogW6EETxTgKFQVBy1yg32e9tOEItnw4DYMtJs6o
         kyd5QW8STJg26h1fL6S7Ys37wrmYUebPXyQzRa6493BNHzGDNm7O8jtV/Zg5D2CazKQg
         1/BS3kGgRs3slm2WtMqrPlI+S5IOdKlqG66050qAVzFYg+rXu2q0cUS6fTQNJD5+pQyE
         IhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910589; x=1788515389;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fjus0cEE64rVoeyJBEwq4yXByfhMwbzT4sjrQJ9cSNI=;
        b=fSscvbhx6yT+MVhNZj6SISjOm9xOM4QOYA2oqVYWdqJ3BNjUaPmnHdAx/KO735A9RS
         hA0RLSFNBOf8sMemRagXWE5dR5NyhO+yIBjkpMMjwu4VYgM+yOCU0Otw9oGYvKpMvjkC
         Cv8qHYDzjRN4IQwaAcbHkZozCkoozKs9TJjrqv2J0xb3BLlH/Cddx3NcMhc0GY+Ql+hw
         /LEwVeoH59/4yOCdEJcYAJhgV3wcgbMWzjT3x2ifTDezAMoR+HucyAwcjcNqkfDIzhke
         QyeLPILSVjNjUaXCwuorQkj26P4uf4UEKQePmBFhyTKpgmJcPFfIERHCUB1QCkzWFPPU
         GArg==
X-Forwarded-Encrypted: i=1; AHgh+RoMQsk84Eb/2nafwVPgCxfC8+WDF+YSXQAP/HNTfC5OLzCfmpHys1t/NY43MQ/ts0DOz6IT4eMhAB7oJsU=@vger.kernel.org
X-Gm-Message-State: AFuF++midICPlM9ft/w11G9LO+UGzZLnvLAUAPBYsg1VHBGvjpG86HWV
	kwAWpkYPk7nVceR0InKXSQRN++xcdzPMSckTydK6sD6WcidIGwweb1OVtVs2m1FG/7ysZ2EtNLi
	b8gAAnH4g6tApWdIEeiX0b1EBmpN8A0jNn/pvXHuFQnbVf+/fHU7cZUEy+Rv1VJGMchr5t4zzIW
	5S
X-Gm-Gg: AR+sD12lz6jtCJlC1us6WZvvDI9Rpgaeez4Htu1BltLMr2Gtco1gdinMQGPxRrHtxOM
	lVCnCQTckeZHCuI5IIqJ8wfvY+b1NaPf3TPpA3lCWMc/arBAWvM5jlFngHJFXkLyL9apFi3oeL7
	5nkDa+u9smQdL2wPXlS3/9Ovexo3X4RH3Ia5ooKn43xUAc5rqJMec+buJD4NGNnMMKw9L830IR8
	Akuu255EYUKUIoj6/lDVg2V8vWxYtDieiB0SEFZ2BMieL+crfv4w/Q58yZlSVIOHVjQk1PNG+H/
	sqECRwBqvIejzZ/3uBoVeEQrhv+Lb/XEC01IaTwp4l5D5+jIet3RtGr44kO9tqLgids2MGPDe3i
	f7+2zxsLpd/FZmgxePDnTPo5POYZx40SP7MG9ihuaK0jmrKAI5QFT7RH/HacCZ31+5Y7thg==
X-Received: by 2002:a05:6402:2b86:b0:6a5:f9c7:7f61 with SMTP id 4fb4d7f45d1cf-6a60d2ff287mr3359144a12.3.1787910588859;
        Fri, 28 Aug 2026 02:49:48 -0700 (PDT)
X-Received: by 2002:a05:6402:2b86:b0:6a5:f9c7:7f61 with SMTP id 4fb4d7f45d1cf-6a60d2ff287mr3359090a12.3.1787910588305;
        Fri, 28 Aug 2026 02:49:48 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c56ff0sm332874a12.25.2026.08.28.02.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:49:47 -0700 (PDT)
Message-ID: <f9ba0be51e1a3c27357bfdd9a78160c06214f291.camel@redhat.com>
Subject: Re: [PATCH v6 8/9] selftests/verification: Add tlob selftests
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 28 Aug 2026 11:49:46 +0200
In-Reply-To: <c1305284e09e0522c5c88e8ebf4a0f6e59541999.1787243842.git.wen.yang@linux.dev>
References: <cover.1787243842.git.wen.yang@linux.dev>
	 <c1305284e09e0522c5c88e8ebf4a0f6e59541999.1787243842.git.wen.yang@linux.dev>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-21 at 00:45 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
> +
> +/* start probe; busy-spin so running_ns dominates */
> +noinline void tlob_busy_work(unsigned long duration_ms)
> +{
> +	struct timespec start, now;
> +	unsigned long elapsed;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +	do {
> +		clock_gettime(CLOCK_MONOTONIC, &now);
> +		elapsed =3D (unsigned long)(now.tv_sec - start.tv_sec)
> +			=C2=A0 * 1000000000UL
> +			+ (unsigned long)(now.tv_nsec - start.tv_nsec);
> +	} while (elapsed < duration_ms * 1000000UL);

I really don't like repeated code, cannot this go to a static inline
__tlob_busy_wait(duration_ms) and you call that from tlob_busy_work() and
tlob_preempt_work() ?

> +
> +	tlob_busy_work_done();
> +}
> +
> +/* stop probe; noinline keeps the entry point visible to uprobes */
> +noinline void tlob_sleep_work_done(void)
> +{
> +	asm volatile("" ::: "memory");
> +}
> +
> +/* start probe; nanosleep so sleeping_ns dominates */
> +noinline void tlob_sleep_work(unsigned long duration_ms)
> +{
> +	struct timespec ts =3D {
> +		.tv_sec=C2=A0 =3D duration_ms / 1000,
> +		.tv_nsec =3D (long)(duration_ms % 1000) * 1000000L,
> +	};
> +	nanosleep(&ts, NULL);
> +	tlob_sleep_work_done();
> +}
> +
> +/* stop probe; noinline keeps the entry point visible to uprobes */
> +noinline void tlob_preempt_work_done(void)
> +{
> +	asm volatile("" ::: "memory");
> +}
> +
> +/*
> + * start probe; busy-spin so an RT competitor on the same CPU drives
> + * waiting_ns (prev_state=3D=3D0 -> preempt event, task stays runnable o=
ff-CPU).
> + */
> +noinline void tlob_preempt_work(unsigned long duration_ms)
> +{
> +	struct timespec start, now;
> +	unsigned long elapsed;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +	do {
> +		clock_gettime(CLOCK_MONOTONIC, &now);
> +		elapsed =3D (unsigned long)(now.tv_sec - start.tv_sec)
> +			=C2=A0 * 1000000000UL
> +			+ (unsigned long)(now.tv_nsec - start.tv_nsec);
> +	} while (elapsed < duration_ms * 1000000UL);

So here you'd just call __tlob_busy_wait(duration_ms).

> +
> +	tlob_preempt_work_done();
> +}

Tests look good. Apparently all that started_list/started_node thing in
tlob.c is for multiple tasks sharing the same binding right. Shouldn't
that be tested? I just got a simple test for that, it's generated and
manually fixed but you may want to double check if it's really relevant
for this.

Anyway that isn't too important, for now:

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

Thanks,
Gabriele

diff --git a/tools/testing/selftests/verification/test.d/tlob/uprobe_multi_=
instance.tc b/tools/testing/selftests/verification/test.d/tlob/uprobe_multi=
_instance.tc
new file mode 100644
index 000000000000..33404683d29a
--- /dev/null
+++ b/tools/testing/selftests/verification/test.d/tlob/uprobe_multi_instanc=
e.tc
@@ -0,0 +1,68 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# description: Test tlob monitor multiple instances of same uprobe binding=
 (concurrent tasks on same binding)
+# requires: tlob:monitor
+
+# Fall back to the verification directory relative to FTRACETEST_ROOT when=
 not
+# set by make (e.g. in installed kselftest environments).
+: "${VERIFICATIONTEST_BINDIR:=3D"$FTRACETEST_ROOT/../verification"}"
+
+UPROBE_TARGET=3D"${VERIFICATIONTEST_BINDIR}/tlob_target"
+TLOB_SYM=3D"${VERIFICATIONTEST_BINDIR}/tlob_sym"
+TLOB_MONITOR=3Dmonitors/tlob/monitor
+UPROBE_COMM=3D$(basename ${UPROBE_TARGET})
+
+busy_offset=3D$("$TLOB_SYM" sym_offset "$UPROBE_TARGET" tlob_busy_work 2>/=
dev/null)
+busy_stop=3D$("$TLOB_SYM" sym_offset "$UPROBE_TARGET" tlob_busy_work_done =
2>/dev/null)
+
+# Start 3 concurrent instances of the target running the same binary probe
+"$UPROBE_TARGET" 30000 &
+pid1=3D$!
+"$UPROBE_TARGET" 30000 &
+pid2=3D$!
+"$UPROBE_TARGET" 30000 &
+pid3=3D$!
+
+teardown() {
+	kill "$pid1" 2>/dev/null || true; wait "$pid1" 2>/dev/null || true
+	kill "$pid2" 2>/dev/null || true; wait "$pid2" 2>/dev/null || true
+	kill "$pid3" 2>/dev/null || true; wait "$pid3" 2>/dev/null || true
+}
+trap teardown EXIT
+sleep 0.05
+
+echo 1 > ../events/rv/event_tlob/enable
+echo 1 > ../tracing_on
+echo 1 > monitors/tlob/enable
+echo > ../trace
+
+# 5 s budget on the busy probe - must not fire in 200 ms loops
+echo "p ${UPROBE_TARGET}:${busy_offset} ${busy_stop} threshold=3D500000000=
0" > "$TLOB_MONITOR"
+
+# Wait up to 2 s for all three pids to be registered and transition throug=
h start.
+# This proves multiple tasks can hit the same uprobe binding concurrently.
+found1=3D0; found2=3D0; found3=3D0
+i=3D0
+while [ "$i" -lt 20 ]; do
+	sleep 0.1
+	grep "event_tlob" ../trace | grep -wq "${UPROBE_COMM}-${pid1}" && found1=
=3D1
+	grep "event_tlob" ../trace | grep -wq "${UPROBE_COMM}-${pid2}" && found2=
=3D1
+	grep "event_tlob" ../trace | grep -wq "${UPROBE_COMM}-${pid3}" && found3=
=3D1
+	if [ "$found1" =3D "1" ] && [ "$found2" =3D "1" ] && [ "$found3" =3D "1" =
]; then
+		break
+	fi
+	i=3D$((i+1))
+done
+
+[ "$found1" =3D "1" ]
+[ "$found2" =3D "1" ]
+[ "$found3" =3D "1" ]
+
+# Removing the uprobe while tasks are active must succeed cleanly and unbi=
nd them.
+# Active tasks will be detached (binding set to NULL), parked tasks will b=
e destroyed.
+echo "-${UPROBE_TARGET}:${busy_offset}" > "$TLOB_MONITOR"
+! grep -q "^p .*:0x${busy_offset#0x} " "$TLOB_MONITOR" || false
+
+echo 0 > monitors/tlob/enable
+echo 0 > ../events/rv/event_tlob/enable
+echo > ../trace

