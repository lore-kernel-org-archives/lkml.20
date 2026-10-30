Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338965;
	b=NSWTJzXHxG8xmD+jSFcf+k2ciqmDKsSvWFifvCLBlpUJLk4Os7reNeKd61ZV+HhKnsEb
	 QcfkhvDwENP75FQLZlkBlNR2+bCyQkhdmHpa8v95EyYkw9Uf5T7V+tA2Z7s59mzqhbZbh
	 NU+Woga7O7uW2p1+VbJZFXxUhSUMtS6Zy04rsvyIazXfDLnr3AVkTuRf/mA0/o9LsmCxE
	 uJhGiYPYGeKx2S4Pdz2kPD1RGujommAuuitKtoi4j3eRnBu6s7wR3sY1No1ZvTIp0Wt+J
	 wGr6kBnDO/d/OPykfS4/TpjsholYvVjS0xfm2uV8U+z7yvfnUlyxNhB1umOgMTWE8lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6s0Wt/J+NclDEuptzzJyz2irJjkpiavB8tG2sGhZUUw=;
	b=yaT20CNL5rDCrPzflFVMvBbegOizzKXkPY6RkSw+pA/6SE7XiU2O7bRKJO2gQ78Xr5OL
	 /vTS57OLeJ6OKhuUqoAq8AP6deDvq8PV0paL9SXN+vbF21e7hAP2FXrTwSnQNDYRZqRlm
	 P9fGtyffCm8rRITG2O5tBPNHaJtUm5Z82YG2mN6eF5HKeJr7dd3tMUrBlXH6nvE2ETKbg
	 geXD8rNM1tI46M/Dnmn/8seBwy4Ss/5byqfZf586spUyUtIh0maxkVqFLqLHjeW6XHYUi
	 x+1eqh0gnmdIwTQUwXnYMK/tTP/G6F/BqslRa62SIZ/rzQ+2VdVxQojx+CN+bD0bXbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GsGjbOH8;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFEB606A326
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDFEB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GsGjbOH8
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36888ae05e7so107269eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338964; x=1793943764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6s0Wt/J+NclDEuptzzJyz2irJjkpiavB8tG2sGhZUUw=;
        b=GsGjbOH8JXeRf1/E3GD1GqQUdXWuwtKVrctPgMqx01lk11IExxy6Xy+OVyeocBCSiz
         ySnnIPaJx1pudzG1D9+f9KINd8lVZVdlslnb7RnLlFcVPJm4z19QUpEKUvedRZhIHfD6
         +DEjjfLVhC1uPnnYl67GjS1EU8dnyvP24RKIIu2TsgAtvolSk7XTmDi1bd6wNmCVtj1R
         NyzP0S9fglvK5M8k6J/NDaG/JX4uB0N8bfI0Wi6/zG/rTSfu3oIQH+GxabMtHct1Nl4C
         yMyTB+mAlletob4//HSspgI5JGkJQTc5Ad82UWEd8cRnvfct06hRxSw6rEe2MmJTquX8
         VvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338964; x=1793943764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6s0Wt/J+NclDEuptzzJyz2irJjkpiavB8tG2sGhZUUw=;
        b=CJ57kwnXWjUMwAOn/HvgwAekskjeKvVtdGbuLUA5c829IDaonCiRNJ/hX7STzwDpfj
         PKHMPnHMIdlNREObiiiSDvMCYk7ktfpEH1aNifqaCEbaxn3hyTqos3bJHNcjvCCC46cG
         hZwfXGim+iY1a4/xZvOjbrwjjenLt/FQ5VEFC5ZYluDjJxTCSIDHykive3fcxuOiV8Oz
         LRdDdRuN1uLnUgkbovWWKA8Ny1J2yHzF8SmH3133+2wz5ztllnpaJLzgTQHRamCHx/z8
         Kden2VRO5/cq1kWw9t7rHuGEVxuFfIoYIsAdqTJ+zhnUQZsuvq+d6rNVtJik7oYIP/j6
         PPcA==
X-Forwarded-Encrypted: i=1; AKwUvBzM0sWIInOt/L2B9lyKdwTEil9A62Ur5CgDRo8qPc1lDxX0eHznYgCDDeOy5iokEG/2kGz6MdmL2KLP7rs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpZU1wldt1ES0JHJbHQIthavLLpd3TSv536g2v4dyTvUIEyOP4
	jJgnUiEHWQqgAUTPTVAgPH+67HzQZoKXr3qxJd5IoPM4s5deoKjS3Tr6
X-Gm-Gg: AYBFou3GYLocYOz5flimjZ4jAOs36KJqAh8tMFhL6UP7oUE7EvnQ87zuBLwYec7It7c
	BlygMTAOFMh2CKm99JkQ4tyXXlzoTSYJ6xAZy8Az5eQwdQlez7GhLU8OWNztquI2o3Tz26vEOxG
	KhnBAU8145ZU1XKNcaXugBrfnVcsv2O+941tev6p+XdtUtWo22/motXsLaXqFSFE527+8xPkdBs
	hTEN5E+8UJ56/U6+ECoE4NoGLER2L/HqqIA/ICfY1lJsboX2CJa2w4Lv+YPch0QtjX1kgbJNUc0
	oZNsnJR2IxdYMRCL8DecdfMCl4AZxIl0g+xaXySNpMDix9GfTKOU1GlAiKcjuXYheI4j4z40zCn
	1lXp0eJBuqaKvz9AGRe4LhIwOvvSyUaRdNdm+v8q8v3x6V1qzqZBm3xVw1xh/GigqPzzDi+teac
	m1ICuCL4vNG+f5KuASjfxZ+zh0m9q2fsSZuV/M7HnNfme/X7lny6xtbVT+7yGft0xWCxOWhC6jx
	PI965dHUUnCCWTAMpFN6YZdwZxOyvCSjBUG7Ablr8ZoqBeWAqvTNimWh13I59vJqguFmMikvAcp
	jqM+9IwMXjv2Z5i4joxQWrN1Z5JymI2a+hzGYIi6BGPjdaPcBW89rfAsev3passS0+8KIUwMckg
	gYbI=
X-Received: by 2002:a05:693c:20c9:20b0:351:245b:d1e7 with SMTP id 5a478bee46e88-36a42061e10mr1964517eec.0.1793338963697;
        Thu, 29 Oct 2026 22:42:43 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm4380426eec.26.2026.10.29.22.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:42:43 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: tglx@kernel.org,
	jstultz@google.com
Cc: sboyd@kernel.org,
	mlichvar@redhat.com,
	akpm@linux-foundation.org,
	oleg@redhat.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 1/2] timekeeping: Read getboottime64() offsets under the sequence counter
Date: Fri, 30 Oct 2026 05:42:26 +0000
Message-ID: <20261030054227.35453-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030054227.35453-1-dennylin0707@gmail.com>
References: <20261030054227.35453-1-dennylin0707@gmail.com>
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

getboottime64() computes the wall-clock boot timestamp from offs_real
minus offs_boot without checking tk_core.seq. A concurrent timekeeping
update can leave the reader with an inconsistent pair of offsets or,
on 32-bit systems, a torn 64-bit offset, producing an incorrect boot
timestamp.

Read both offsets under tk_core.seq and retry if an update overlaps
the sample. Convert the resulting local value to a timespec64 afterward.

Fixes: 7c3f1a573237 ("Introduce boot based time")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
New prerequisite in v2, addressing Andrew Morton's review.

 kernel/time/timekeeping.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index dcf47f1ffdcf..7d7a7372f3c8 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -2700,7 +2700,13 @@ void update_wall_time(void)
 void getboottime64(struct timespec64 *ts)
 {
 	struct timekeeper *tk = &tk_core.timekeeper;
-	ktime_t t = ktime_sub(tk->offs_real, tk->offs_boot);
+	unsigned int seq;
+	ktime_t t;
+
+	do {
+		seq = read_seqcount_begin(&tk_core.seq);
+		t = ktime_sub(tk->offs_real, tk->offs_boot);
+	} while (read_seqcount_retry(&tk_core.seq, seq));
 
 	*ts = ktime_to_timespec64(t);
 }
-- 
2.43.0

