Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801843;
	b=eimRueGV8WPzOllFelFoN2Mr3kO3c7oQyKiRjA6jrcTejSxuVRxgeeXijuuN4K/TP2gl
	 dMW8sdjciNwTsIO/WULY4YAiuGtnBdgXi1l48pwkpoWiU5jg0OMV/M8Wd1OZmfEXT87MO
	 8/F7hso/sHQCd5nKgRLo2a0RNXipOU8V8E49sY/hVHtVRAoA9US0VDcIc7nWo6EODU8pF
	 apZhl8g7DWWoDPbxyuIoxGgJplPtN4jTZj05Feq9BsTcN1uUqtYojI12LV+1g0bFmI5af
	 D2Uzop3C4ptQ3EwYKtnngMMGEk16zcfjEUKq50ftm35mFgmgD4BLqAEzyYanXLhOqXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dVHG44+BDIBCBwDY+96Lk7oESZ3fyFBd8Aec92tJSYg=;
	b=KACINeUIbFV7j3464fUn+9GWWhSqPaxpvrgV1X6idp39rMIGWjeMzk/loW/98ZHR65sQ
	 mCyfSlmfmp9iw7njXg2wiAMtPCthMr83zBuofOaKBQ6eatUUudckRRv71jLT1IbUTd0kd
	 yEZEBS7/iDagMlQpg+w7vfACvlqVvLoP9tWrcTOtQBX/LvpeRhM3ZDSG7FJus9UdRvNsm
	 b3l87z0RlQw1G4K0/loMFzseWlXFPYaKzrz5uBXe12tIwVLOpLOA4mxrZTCRzU1h0qCLP
	 +vsCQqbpBSdnoJLUrMXv0Cph1eno13/Cv5CDpTNvWRsHef4gvNqeJUWwA7yy/CVqWIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ToATedU9;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC863606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC863606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ToATedU9
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4550d8ab15so114949766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793801841; x=1794406641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVHG44+BDIBCBwDY+96Lk7oESZ3fyFBd8Aec92tJSYg=;
        b=ToATedU9d4AKlw1TrrcSx/rpQqZJKU5ptfLvpNhrtrjFQdMtoINZFG4rPpIrjIXCV+
         IVe/cNotw+557JLtvVZbTeDduv/m5TUx29giIs68Hexdp8hKmIVZFzAkG6cnnXmMGKnf
         08bGt3gEH4AjURa26dm+mGQBohqrWiBHpetP6sNc/DNzeNCypHOPFzKIUyrisurCCHPl
         vHjH/WtGiJ1Ool+HIWLHn3o4WkeGgDTdc64IPQSy8Au7+1HQuWXFKNxns2KxF43YsO58
         lKv725PdTYPVd8HM2W38F4u372nPQh9J3ZI2JnHpTFXvtH9zcaSluEYc8MpQJzzHBkW5
         Burw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801841; x=1794406641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dVHG44+BDIBCBwDY+96Lk7oESZ3fyFBd8Aec92tJSYg=;
        b=kIcaee9IcJFricFHfhKTAXCTrfgCvcW1UZPU+QGxOXwRSdarQd+SMWQbyfKnTb+nNI
         ciX4Du8mVnKEpKkazyQDpZJbRqcKd6iGYVkwdNdmeYfPXXsIKJCN+AQk+Bn/Q7EGtY2A
         W3/r/JqNdi2WQ0naPdCLawJT9ihO1D3548LHP97i2JjCf6Sb08CVwM7HLqNTI4Q1l8Ny
         1YUa07ldv3E0FUk9Vv+2Ebm9I53UeDANJKYeoTdxxfFS/873Vcwi4YlAqAPWmLxyOrRI
         /x1VAAZhyh/gBrB0gPLobTcNpqop6ku77pW8i8Fn2WqM7P62Q+hqzYfRdFz+04jCGmWw
         5Fhg==
X-Forwarded-Encrypted: i=1; AKwUvBxaQBxFB4y24BzDBNI0vhlChZL05gwrtb0QstqnNzSjtQNtalgL6HceCLP5CPB4rqBU0Gz/W2awRjSxDec=@vger.kernel.org
X-Gm-Message-State: APuU4Z83aAWUTM4nPQGmShcaogl9+jtOCENVsgBKukrsLOePS4cYj4XW
	AkfD5fLOK9XEOINZnsRypCxJbu4O/mRlGLchZIZrrwGmSGyXHNSRq/a6Xrnw/ILPaq6l6hxG
X-Gm-Gg: AYBFou3S6y/Y4mEyGZztz/0nNdeR6XteLEQFWVD58MrnqyFns7I2R+HG0ag93/ZXzQE
	6p/0B93Kyikg+dE2fONva8VF8yFx9t4Y3cvMBBVesPAhp8JF2ObLqyEBnY1BeMY7i6CcW/+TG/6
	5eN8EKSv5VQQho2YqX52EBWhwJeSif8dyAzlfdeAdIwR6Ex0L+oPifxwTuwmYHgluYW4MrzDdCT
	GQfKNskVku6KxsJAlDtGTFLWzHX5XU3CiLYNS2e6ZctyKSSCRDWM5eafMiXSb5hk7iRKcbcaSey
	Chz/PHOfl55SEhKzfajtpus1UrSRVPi4XC+qFiXAy/o2ADSndWSXHCAQytYIWF5SN82cLwcDPYC
	6pwjoOsJsns7v9T7gtK9RRe71g6FInTfAQdjj433GZFuh6nU7ntO2xfG7LVYTzuR5yda3H4p3yO
	9Pdc0jKL9jKYq7hrrrRcIfRlcIQyChQhQjM2UavuuLG1kUB9S7QWbH2wumESNZCN9ChzagKuBPQ
	Probxbtzlzf/qapNaMTMj1q0P9XwSlnfqZNSnmXu8wUJp3DGvMtJfZT863OuQOs6gSROno8K5tC
	ycdEBzdWb9p3hTjmwRkwzl+/nsHe3ncj+A7hSNuO1WhifU2VeUV2uz4/BQhq7s1x47vHvDShxcl
	R8pDyLD/uvEYaCCDkX4UGBny/QypoOVL+jvLo7lHpfXsuha9FUmr/m+MoOgPRLV8Y+b8uyt7rve
	IpXOZWHGJnSojFJsYFKNDs/y6iVypCaRjg8VIBhIa2mr74bAnlYLzCha7X9pnvnk4tG0GyWmg2B
	w==
X-Received: by 2002:a17:906:604c:b0:c3f:55e6:83e6 with SMTP id a640c23a62f3a-c4cc399b6f7mr687400066b.15.1793801841000;
        Wed, 04 Nov 2026 06:17:21 -0800 (PST)
Received: from Ubuntu.tail0f733b.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e43e2eesm77311566b.31.2026.11.04.06.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:17:20 -0800 (PST)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vedang Patel <vedang.patel@intel.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/3] net/sched: taprio: prevent cycle time extension overflow
Date: Wed,  4 Nov 2026 15:17:12 +0100
Message-ID: <20261104141713.355958-3-krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104141713.355958-1-krystianmkaniewski@gmail.com>
References: <20261104141713.355958-1-krystianmkaniewski@gmail.com>
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

cycle_time_extension is an unrestricted signed 64-bit netlink value.
should_change_schedules() and get_interval_end_time() add it to an
absolute time without checking for overflow. A positive extension can
therefore wrap the result negative. The schedule handover test then
ignores an extension that should cover the admin base time. The
txtime-assist path can use the same wrapped value as its extended cycle
boundary.

Add one helper that saturates positive overflow at KTIME_MAX and use it
for both sums. Values that do not overflow, including negative
extensions, keep their existing behavior.

Fixes: c25031e99344 ("taprio: Add support for cycle-time-extension")
Fixes: 4cfd5779bd6e ("taprio: Add support for txtime-assist mode")
Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
v3:
 - split the overflow handling from the advance_sched() change (Vinicius)
 - use the same helper for the sum in get_interval_end_time()
 - add Acked-by from Vinicius
 - drop the obsolete Assisted-by trailers
 - rebase onto current net/main
v2: https://lore.kernel.org/all/20261009123309.284193-3-krystianmkaniewski@gmail.com/

 net/sched/sch_taprio.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 2a31b189d654e2..e4c937cf74c10f 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -239,6 +239,18 @@ static s32 get_cycle_time_elapsed(struct sched_gate_list *sched, ktime_t time)
 	return time_elapsed;
 }
 
+/*
+ * Netlink accepts any s64 cycle_time_extension. Saturate positive overflow
+ * so comparisons remain monotonic in end_time.
+ */
+static ktime_t taprio_cycle_ext_end(ktime_t end_time, s64 extension)
+{
+	if (extension > 0 && end_time > KTIME_MAX - extension)
+		return KTIME_MAX;
+
+	return ktime_add_ns(end_time, extension);
+}
+
 static ktime_t get_interval_end_time(struct sched_gate_list *sched,
 				     struct sched_gate_list *admin,
 				     struct sched_entry *entry,
@@ -249,7 +261,8 @@ static ktime_t get_interval_end_time(struct sched_gate_list *sched,
 
 	cycle_end = ktime_add_ns(intv_start, sched->cycle_time - cycle_elapsed);
 	intv_end = ktime_add_ns(intv_start, entry->interval);
-	cycle_ext_end = ktime_add(cycle_end, sched->cycle_time_extension);
+	cycle_ext_end =
+		taprio_cycle_ext_end(cycle_end, sched->cycle_time_extension);
 
 	if (ktime_before(intv_end, cycle_end))
 		return intv_end;
@@ -916,7 +929,8 @@ static bool should_change_schedules(const struct sched_gate_list *admin,
 	 * next schedule base_time, we can extend the current schedule
 	 * for that amount.
 	 */
-	extension_time = ktime_add_ns(end_time, oper->cycle_time_extension);
+	extension_time = taprio_cycle_ext_end(end_time,
+					      oper->cycle_time_extension);
 
 	/* FIXME: the IEEE 802.1Q-2018 Specification isn't clear about
 	 * how precisely the extension should be made. So after
-- 
2.53.0

