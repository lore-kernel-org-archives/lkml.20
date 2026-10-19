Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0395A4E36EC
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408519; cv=none; b=CzUFv56cvffzNxL/suJOuYqv+x9OTzMXi6r/deg3xlwHb2Rh2RqqMgdZh8C3SCIXHHv8eM45LRIBMOCA0tPooi4ddJB0YEuijXRbnzwJAOFjvUV/enr0ZwqLERnT/pSix4c8Y+RlMnh848VvfPIGyrSM4qzv74q8Ftost+zTe40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408519; c=relaxed/simple;
	bh=n4FqSLmVAEsXOHXlDEkGaq3c/eruqmAn//5DvPsyRXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fS453HmZZMreA5rWh/5xjJsBxQQFQ8SJdhNbsassGDSGEWIcBiD5YQjd3DBWUk9JV4QYnuHYyS9bppbZU57HEheMG5F6zTzJ4vXOVtLt6Qd3etQCwgb954nmJQU2jcYu93lMybTb/KA8T6njzC1adt95gd47v5baPRH/NAqAN2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1878167a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408516; x=1793013316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=59Dzn78qm0Ddey/ClDGdUsV3GOFiBhJV+gV58rFFcGc=;
        b=Gp1H411P31aM3LaM/Lfhqw4UrpTtrOBhj4h85nrtOI73SuP/xS98s22Pvm8LD7P1rL
         hk/LLO+V46NrAR9voQdzV3hAB5bMr1IIdGPUN4zWMjwj/QPoGn5kvO19yEChvUy8Z2xI
         scfrhV1evFkxcB4zGGE7Y23v30EmAOPS0264BN7/gYjbC34ALk2GdyhRyobrW2SuNHUA
         1CeNR1QBtMHb58E71nPyzHpaxQcvbmbOVoboH+sAp+4VNbqQsKjLg5j+pEHMr8KqDLTq
         KVdLYvBgP57BARuE9zEZxByBFDRGLnUIDQ58MS7z9X9aEV0Yi/9XcO4Of+uZ9NxnZvrv
         96Lw==
X-Forwarded-Encrypted: i=1; AKwUvByvUFJNpjhlKPe00XKWk58IWkf+BzqRGWG2EnaMLy46PmHVnMv3lxuj1k1/ZKbJNJWWKOgmXWW6YfFRdnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTLU1nSbOCxQ/ms4lcYLjyY8JYDSvGg2gkcxqwcknoRQUh/Tnh
	4X1YHovjF3NRamSTG+0HFwf5pKc5jWkb5BvVTSTWJmlXoPrvYKRMU0BI
X-Gm-Gg: AYBFou0QsIWIr1BNGHp3hvw8Wv1Q6GqAiKryT7tYrPTi0FBthNgRagcJeflVU+qbILu
	n4BT7ygxTwUzzHc2MhMUxL1sFjKCVy63N7JjkP/Et0MVWfvv80Uu37QN/g3bwFixWa3HCuN3XfT
	4cSektE5qb/+0UxJD/UyV51ii1o3LVQ0AZjH01CcvygWIEnrJ3twpszaj1Otku7RYgvKQp8gExl
	n0V4gUj3yjQVHUqjDPZKrKzT44H9TWDBZ7Iu/ucFZRplsjAbD4s3JaYrRD0ykWo5BddPBREUg5b
	BBZjhlbVVzzl6OxzqLj4bStbaAaUBGchVr1Biz+ecAFR08MoMsv7FysMQgjgvQ0mLtDfkhSIWK7
	1ChZIKSk8mEwT++jsZ/ZDoiSKCNk1dnuu0vaLKmgi0h4SSohqafEpAWzZuz68sNec/wBLvF/bF5
	MSl078P29Rs5kVqb/cLhj3FMVdZIqVXOnljBhgYeAvnCXfigQmJZyGno7dLEUPz0K80/xJzkW1F
	5TFDwGsuaZuoLcu4SQc3Q==
X-Received: by 2002:a17:90b:2e45:b0:3a6:dc51:cce9 with SMTP id 98e67ed59e1d1-3acef10a75fmr6456476a91.57.1792408515890;
        Mon, 19 Oct 2026 04:15:15 -0700 (PDT)
Received: from localhost.localdomain ([116.162.92.112])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a3a592sm3907989a12.30.2026.10.19.04.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:15:15 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Hongyu Xie <xiehongyu1@kylinos.cn>,
	speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	chris@the-brannons.com,
	kirk@reisers.ca,
	w.d.hubbs@gmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/4] speakup: Do not hold spk_mutex across catch_up()
Date: Mon, 19 Oct 2026 19:15:05 +0800
Message-Id: <20261019111505.2048-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <atUPbjRxDtzBZ4Vc@end>
References: <atUPbjRxDtzBZ4Vc@end>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Samuel,

Thanks for reviewing the series.

You asked whether the blocking this patch removes is really a problem,
since an operator who loads/unloads/switches a synth knows speech is
being played and can stop it first.  The report that motivated this
series is a case where that cannot happen: it comes from automated
module load/unload testing on arm64 boards that have a serial port but
no synthesizer attached.  The sequence is:

    modprobe speakup
    modprobe speakup_acntsa
    modprobe -r speakup_acntsa

speakup_acntsa attaches to the serial port and becomes the active
synth, but nothing on the other end of the port consumes the output,
so the tty write never makes progress and catch_up() keeps looping
while holding spk_mutex.  modprobe -r never returns - the original
report is a hung task warning on a stock 6.6 distro kernel.  The trace
below is from a qemu reproduction of the same sequence with the serial
port backpressured:

    INFO: task rmmod:84 blocked for more than 10 seconds.
    task:rmmod   state:D
    Call Trace:
     __mutex_lock
     synth_remove+0x16/0x60 [speakup]
     __x64_sys_delete_module

    INFO: task rmmod:84 is blocked on a mutex likely owned by task speakup:76.
    task:speakup   state:S
    Call Trace:
     schedule_timeout
     _spk_do_catch_up+0x1d4/0x2d0 [speakup]
     speakup_thread+0xd6/0x240 [speakup]
    locks held by speakup/76:
     #0: (spk_mutex){+.+.}, at: speakup_thread+0x1b8/0x240 [speakup]

There is nobody at these machines to stop speech first: they are
headless test boxes, and no speech is being produced at all - there is
no synthesizer connected, the port simply never drains.  The same
mutex hold also blocks loading another synth module (synth_add) and
any synth switch, which is how the load-side variant of the test hangs
as well.

The "stop it manually first" route itself hangs the same way, because
the synth sysfs store handler takes spk_mutex too:

    echo none > /sys/accessibility/speakup/synth

reproduces the identical D state on the same mutex:

    INFO: task sh:79 is blocked on a mutex likely owned by task speakup:73.
    locks held by sh/79:
     #3: (spk_mutex){+.+.}, at: synth_init+0xab/0xe0 [speakup]

and a task in D state ignores SIGTERM, so even timeout(1) cannot get
the shell back.

Patch 1 alone does not unblock this sequence: it adds the loop exit on
!synth->alive, but in this scenario nothing ever clears synth->alive -
the port stays open, the synth stays alive, its output just never
drains.  It is synth_release() in patch 2 that clears ->alive and
waits for the in-flight catch_up() to leave before releasing the
resources, so the unload terminates the loop instead of waiting for
output that will never complete.  As the cover letter says, patch 1
provides the loop exit, patch 2 provides the deactivation and the
drain.

For real hardware the same holds with a finite per-utterance but
unbounded aggregate wait: /dev/synth accepts arbitrary amounts of text
and with the current code a switch or unload first waits for all
queued text to be spoken.  Patch 2 does not add locking on the read
paths - it drops the mutex from the longest-held path and replaces it
with a catch-up counter plus a drain wait in synth_release(), so the
synth structures stay valid for the whole call without holding
spk_mutex.

Hongyu
