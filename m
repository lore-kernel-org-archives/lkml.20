Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792522442;
	b=kjFK8ieeIQkL53XOa68NtdiR7jNZK3x0CsqxD+3uccykbTCVrbj2TrJotvqBlWP11/do
	 GDFpuy9fbZikUpSHCXkZCOlV9M4OKJUWiXWLMyBICLp5CWLLrLQF/Uc5oQHN/hloCaLfQ
	 0ESVTIDEYL+I2uPhYZ3Y5siQf0YrntK9ng0yAm6prJ+54CQo56HlyrF+XmtsXRrqa6VT5
	 A5yojfhb5EHNxqpPbnYD/pWBMtKIhlhpqD8/VRLcMh/P/StaafRKP8chx87drJ5fIUDW4
	 Of4YOP9RxfnncLZqYQNJcVjX3LyaCNnEopgu/r4kuHZT7xVZpKuTmGLLJ52RPkm3ReA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=JFx0fVMOKwTm/FUUv5gLEMYZwxcfyaAQbWnu0iJxtNE=;
	b=ZE06HDWhS9LIB1V/GkxGgXFvNTh8efyVapBV466RVvWL8vkt97kKC6s03jtLfzFLHDs7
	 LIP3fIZkcNdL+W4I41kiZ0bINuWkVKhv752EZxKgkFPbpAQdBgdPMWZl7eO5464/eWmFO
	 fepgYGQIbyV80piEkIGnPgkNPxV5tcY0jpgHpM/9XWX6XbVkVHHfaIbj9DXvgjd1PQ7oh
	 MIgIyG9q5pN949dNsMskXpCPvG6C4MB35HlIeOY9pBN2pxWEK42yo0cBvJTffgtSb8XX1
	 Gqb4IpfSWj7oMFxerMOnZ1bDYFk3PC+6ySdU8oEAhnyzUiwJ0r2FM6y4ZYSm8uZEUWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=weLRjVV4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CC4606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CC4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=weLRjVV4
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so8682595e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792522440; cv=none;
        d=google.com; s=arc-20260327;
        b=KIO9cFaspkIl2S+WxJOa8GEcnEqqFgAZ3dB3jIF0E9l/GLv/PTIAyS5hEl1DrisoJX
         qjGi0CnAKIE6MK+iHvib0NA8EbTi9nJGqvC6+3GkPPp1vOlsm/ScV2D34POHhgz5K0Dk
         mjVW5Car9AS6aAr63RAA1dbILXSPEe0YCNh8l+7aylMYx0RSLvnJl8RP2QSafm5ZI3HB
         6jwh4LbPazPgpSAPTXPJQSCeL+DZPJcGFKjWMeHqLuSn4pq0VW0QN5EccOWG814YCOWc
         MBOX7AVYv+yUlwwJ6NdRYruTG6K4rUzhDNxcNJo6W8cbA7u+357n3ikzy4Sj2UkBMU/s
         t4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JFx0fVMOKwTm/FUUv5gLEMYZwxcfyaAQbWnu0iJxtNE=;
        fh=e5YHUmpEMd03N/+LKLgNRpCXj5k2zgZ/OgsLbp5vvK4=;
        b=RsRHSW+W+CgEKOtxcCZZJJ1tABMPeT/cgluIULyybh9D8tpkGWhV7+CCfeo8BI05O2
         FB1pKig8NoZBmJaMIvJQb5UF9ef8EEMHSi4Rn1R5vfj3rFtYXVKccw4QgnMNpAYAoHRj
         BJeMA5zMR3ThUZrkaEjWYnNkmTYLNYmPI8J7ovj4ENt3kW50dVT1lLzCFRNx8XaLHpxB
         v/Myxsu5ssyvrxM4Yu24hRxxfD8L01RMgAeWVGb5u9Acoc9Cn2J7t7SDlqWK9HgUL5SM
         LvuTngHsNieXqShSXUzHWiRSJOKmaEqhE2Vj4beA0IV8y37OK6rheJ2tug2kL8uocR6n
         6BIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792522440; x=1793127240; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JFx0fVMOKwTm/FUUv5gLEMYZwxcfyaAQbWnu0iJxtNE=;
        b=weLRjVV4kN6JILEuhn91fV3uUprwNy+LuIDypdQ22ik+Gr7PBvNjtl5Mt94OvsyqxR
         9Ha3+gSaO3N8npJr4q+Uw7xXqwvUjQ0+bw2z64muCw2fA29U+O5PlCFUEufj+EISdZ0V
         AQ84u4Y53+7H2mlmsLVAPEx8Ud3yAqPVB7U39Bf4TDqOSbvs6uX8wr0M5QAuFkH6epZ5
         tkK0jBj8HnDZa72wR3i+ps5C3Eave41FjHsC7QKzyjoCEbCyeQNGdpnH0/mkHPXvhlkN
         JhYlzTNf0uR/4KXEP6cjM7kQPhj8j2DDcnDA/emkzr3mM5weARZ7am76dQYEC4maMQfX
         MeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792522440; x=1793127240;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JFx0fVMOKwTm/FUUv5gLEMYZwxcfyaAQbWnu0iJxtNE=;
        b=lV51rizStOf+uiVREDS2d9heoQTxOPUkrhXXzPiJMED6t7vdzDFa2EzD52ePxIFZKA
         XS+LfNYVvQ8ua39MI7GtKacDgm26Jx6cMzDUROBEhTiCl24t+RziLUISJJXZUhG710GQ
         1GZdmNbQkQpTNm0f0gtEdponOtyM2rgRZMIrsQcZNCsWT79FAz28+A1amcqosOB/eSzN
         V57C3tAUQbTDgPSf3yyyQzhCmqwC+38MAKYYmeDd13cDYJGJLHVA/3lFtrreasy8D2fs
         qoV+bRloA/rOlXSaVlVPbPm05jnldgPMNizEu3JMAw6hzwyFI9Xn2SNqVsjIFvI+k1Fm
         UM2w==
X-Gm-Message-State: AFq9FYJFFFeDzzWQP7HxYueOZHXxgyoXsYpwiJUma7JD6ChNPs6CbSti
	pq3qODSw66mZJSikGignNqns8xnBC06bfkQKwcOTIyZNYv27G2Ri5eL6kVBu7Hi139sB6os8piN
	4PtClL5b716bttyN2VnPCtQFGLECIComtSoncxJc=
X-Gm-Gg: AYBFou3euHwMbfGQsPwL1s1F3SkJQTafjVpR1v/uWJdnDpbWaoTC/o5D6CpTLBmfRlz
	mlKImk6s86BXSCJAY70kJnY8YTVBp09EkjCmffDfn58/hvhN+InkpiDpeHPlymXbJc9iPwq87Hu
	soGmgyWZRLos7F4AIrZsii0k5WmDLO2htdD1E5uVOLa3xYo1XIwZOQkA0bXOPQWZL8SawjuZhzq
	fcaeX/Cq0Nf+lq+y6jHXS7OYSy6Wz1XkBjQodbJYAiiHKRf3XbHE7gi3ikP9NLgiZUfoZ3jE55K
	psoQA0Jq/NCn+ABaPf3/kVLlb7SV+dEcBjXjInpb5HRp6h5lCS95piAqRRPkuXyUdmicX/j3H7h
	usMXsKPB+wX1J248EXcd6FBGNEzf++XGCjDeOea+spD2wn8Db93h8UJ1+MogzlJr+z4Iuv+H2hm
	Od5x/RPYLTpIDDh2GCe6O6wtXA+4oQ/GcL2LpJCB+Sn4XcFglc0kH/rsiZoIHvIHTuRYQ3
X-Received: by 2002:a05:600c:548c:b0:49f:dc71:e609 with SMTP id
 5b1f17b1804b1-4a1d7610f2dmr257707775e9.20.1792522439722; Tue, 20 Oct 2026
 11:53:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: John Stultz <jstultz@google.com>
Date: Tue, 20 Oct 2026 11:53:47 -0700
X-Gm-Features: AclHuK8j8c2w4zXgBD6CRYrRTZT8bUhTFpock37-aEG16sPDISOF0mlFPX2G-84
Message-ID: <CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com>
Subject: Uclamp races due to non-atomic static_branch_likely updates
To: Peter Zijlstra <peterz@infradead.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Christian Loehle <christian.loehle@arm.com>, Qais Yousef <qyousef@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Hongyan Xia <hongyan.xia2@arm.com>, 
	Ingo Molnar <mingo@kernel.org>, Wei Wang <wvw@google.com>, 
	Patrick Bellasi <patrick.bellasi@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hey all,
  So Wei Wang raised an interesting issue recently: He was seeing a
race where when uclamp is enabled (from calling
sched_uclamp_enable()), the static_branch_enable() call will go
through updating the static_branch_likely(&sched_uclamp_used) sites
where the inlined uclamp_is_used() is checked.

The problem being, while the jump label sites are being modified on
one cpu, another cpu might be executing some of these functions and
get inconsistent results.

Specifically in the case where uclamp_rq_inc() on a task is called
followed by uclamp_rq_dec(), its possible that a
static_branch_enable() call modifies the inlined uclamp_is_used()
check in uclamp_rq_inc() first, then on another cpu, uclamp_rq_inc()
is called, sees uclamp_is_used() is true, and increments the buckets.
Then uclamp_rq_dec() is called, but since we're still racing against
the jump table updates, the inlined uclamp_is_used() in that function
returns false and it doesn't do the decrements, leaving things
imbalanced.

Most of the usage I've seen around static_branch/keys treat them as a
magic-compiler global boolean, so to me it seemed this sublte
non-atomic updates could be more widely problematic then just the
uclamp case.

That said, I'm a bit confused, as looking at the jump_label_update()
usage, we already have a key->enabled guard value which can tell us if
the update is in progress. However, despite the logic table in
include/linux/jump_label.h suggesting enabled is used, I don't see it
in the static_branch_[un]likely() -> arch_static_branch[_jump]() logic
(though I recognize the whole point of the static branch logic is to
avoid the conditional, so adding a guard check would undo the benefit
here).

Maybe should the jump_label_update() logic be using something like
stop_machine? Or should there still be a conditional on key->enabled
in the unlikely case to make the behavior consistent? Or is there just
something about the uclamp usage that is off?

Anyway, Wei has proposed dropping the if (!uclamp_is_used()) check in
uclamp_rq_dec() to ensure we always handle the decrement side to
resolve this, but I wanted to see if there were other thoughts on how
we could still preserve the static branch optimization there.

Thoughts?

thanks
-john
