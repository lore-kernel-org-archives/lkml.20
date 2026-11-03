Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667607;
	b=LL0DOuCbi8HEiYH7m8+ASSPsXuxkJYYOQwwv1dMlNe6NG0MK1MFyCcxS0Ug7Fep1e38U
	 vo2V1pR/bfKD7XLnnVuKtM+Wtrt9z0+odup+DCMUpoaOpcXonhjMrMqetAw0eyzx+laIk
	 sEvBLLrBNfyAmFAZeLYdQqkDzgrbnlp3rHM7zA11jx3nqSGQyaOyR8brvVkOw7tzuoo2T
	 d4GJ50+LsFWXczwkCzNF2AoF1B8eLKCsQeoP+sMfhr3Mci7LWMsW6UYzOrpOl35R/NWJM
	 sRB6301gzuBfJItoh5mP3MuMQ9cwGDMDPu5apHmvW/69u752uXd63GipJ4/jbPgTZCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rgf2pfOTtNT7kQ2FL/sm/kRfh/JMjlNMJIMy2PuRMDc=;
	b=wNmhKMJYLqKrc0y3wXVBmCcleSUxDSjWwKM0t6QtrvAGMar7rOyFggOmyNykA/V67Bwu
	 DUI2JI58hZsRPblkkXFG8a024E/mL+2mi3TrNkN7WVjqgn/VGytr4IzqTyQyAtf8sAKaz
	 icCwOC9urzzRntdftFxUHbKK/axf6sKHzBD5yCQXdeX1C3WgvM3B3mvlKubXbcxnu1Ivk
	 HFZSOCKjtb4HFVUgLfh2gKS3lNGThYQr6Xt1acZsHhps2oBQiuSvOm/7AzRRGASzjzB+x
	 P2zhs1KqoJewfeyzzTOTvvfQz0TswAwdyvm5AJmFafP/mUof0cp28B7JMAaDVkMU1VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=H44d32pZ;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D231606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D231606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=H44d32pZ
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b060ec084so2120100f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793667605; x=1794272405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgf2pfOTtNT7kQ2FL/sm/kRfh/JMjlNMJIMy2PuRMDc=;
        b=H44d32pZwokLDMSgoh9+Nvbo/P/ap7vZB52me+Ug68acz81TKTTqqOnSjxJpxO0wX5
         Z83VbRakNPQuAtP5L9K9hIcDtS1hRclX5REOXvAPwCIYpRqGnEPergMfn78PmTwDNWxP
         vg9ncXk3PbeeQ3MChg8OWYBfahu+FuwpIU6hM/WXrSW/56SRZaOTpkJKbF6hsYeO557u
         aYBPiWjIxgk8eC6N3YHUhjXVTAnuwlJ80kKbDlhpmpY+SefeYL2SO25kagXagCN2IoVS
         jdK0uOeAhHwEnmdH8bnCrwG2s9Ytp2578aW/BmEdDZeY6/Dl6u5EtryKqtKmCCq5iMly
         a6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667605; x=1794272405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgf2pfOTtNT7kQ2FL/sm/kRfh/JMjlNMJIMy2PuRMDc=;
        b=NckFUC3CLffaudGqIM911SwMPuWSqImk/kJNfklL5TH2jzYnOezwF5H7COhTd7o+y4
         GnsWvbjXK4nRB1FZZF3SaEhMk6IioX/ulFwqEzaR/AWDduVmbY7RyExsjJ8DisS9pXnP
         8j9nIwMzrNtKr92lIhzsjqzl8q+SHve1scF+UruQvMlpkEVGlSasn8Y4L4C1Li+h7Z0R
         d1Cl8pqK8762hlPYUmZRcZhMjkI3+fwUwjx0W0KYhy66tU8wv91fNKnIBDSR60HFXXMP
         aSRcv0QAS+yvkkLqudOMB5p6ZzmyqpKlHPhnpPk5xmTMm8nTlwoUDErGjShBAJ0VJiXi
         rlLA==
X-Forwarded-Encrypted: i=1; AKwUvBz+Fp9hP3SAVdstINexVhc36SovqAtDwZA1HQRMDTd/KehqywV8//VEMuAq0qghaAhUsKNP7neVOxiy2Ow=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l3o8WHCG3F9Pm98ZO4WkCjntYI8uXpCBTVX4/Gur8e4H+OsiJ
	x0xftbwDE9jJmobd8bmGtYjKQ/UVpXFW5Ae5iqmwGWHf2Ei0onqIDv42o0URavXcHBE=
X-Gm-Gg: AYBFou1XKmgQky0a2+WjyyrUb90nYfHBNTpq2af31udxOY+VqkPc3bG9enGMsTDKCor
	jonNOXls983ox6E4HWSw5D+UKPo7V9J+SU/m6E/t0qYQCPYjwlj10uBIEThr2njjDJoc9cvnJtR
	jMtfZ0S7uSLK3RdAj+N2kyIRChdLmz+LkAGKpLaazlGc3suyN20AswU9CnSlBt4/ffnu5yHtKZz
	9hxyNFJbe5Y/RnXDru1ml/rmQ+TNPzVjyn1yFLO/MMqKTqWyLkeMvLunUm92d/oH2i7yBXCelRR
	cbfEA5Tgg5Mv7pDu879odVONSEyKPEw5mzdUTVBySnGs+AfzMjwiu28kfN1tpK38tfEXvSC2VAg
	T5g29PaFD6CaIJd2cKT8PfE/xjLmsOS8apGIrp1YH6AY96asRMiOFFJvo9QvP9FA/o8FBpF6ZFO
	NgaU1ZEvpcN49YO/V3kjCaO7PbJALEKqVQvzNW6jPp/TAhPPXLgDhpR6dWeeiKwatglQn7vaQ2Y
	RZ5XQUabZKc61iAm5FWFtH4nKMWoPNZxv59hAlOZ1ri69TrzxsHMIqC0LmtzO8dJHWJjiSVLDUP
	fxb/e4jPjCgw4l+isnMZQblaXHVLJZpki7CJJtnqGpbHJ+PpnbLi6/n/9JI6zA8ihq9lNVl1mr8
	2WA==
X-Received: by 2002:a05:6000:4014:b0:48e:5071:420 with SMTP id ffacd0b85a97d-48e6e2bc75fmr25470918f8f.2.1793667605476;
        Mon, 02 Nov 2026 17:00:05 -0800 (PST)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9eaeesm22351872f8f.49.2026.11.02.17.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:00:05 -0800 (PST)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: [PATCH v5 2/4] sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE
Date: Tue,  3 Nov 2026 00:59:51 +0000
Message-ID: <20261103005953.56271-3-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103005953.56271-1-qyousef@layalina.io>
References: <20261103005953.56271-1-qyousef@layalina.io>
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

We already have uclamp_rq_is_idle(), but it wasn't used everywhere.
Replace open coding with the function and add new wrapper to set and
clear the flag which enhances readability.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/core.c  | 14 +++++++-------
 kernel/sched/sched.h | 10 ++++++++++
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c6780358a7975..a2035d66270b9 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1626,7 +1626,7 @@ uclamp_idle_value(struct rq *rq, enum uclamp_id clamp_id,
 	 * max-clamp.
 	 */
 	if (clamp_id == UCLAMP_MAX) {
-		rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
+		uclamp_rq_set_idle(rq);
 		return clamp_value;
 	}
 
@@ -1637,7 +1637,7 @@ static inline void uclamp_idle_reset(struct rq *rq, enum uclamp_id clamp_id,
 				     unsigned int clamp_value)
 {
 	/* Reset max-clamp retention only on idle exit */
-	if (!(rq->uclamp_flags & UCLAMP_FLAG_IDLE))
+	if (!uclamp_rq_is_idle(rq))
 		return;
 
 	uclamp_rq_set(rq, clamp_id, clamp_value);
@@ -1890,8 +1890,8 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
 		uclamp_rq_inc_id(rq, p, clamp_id);
 
 	/* Reset clamp idle holding when there is one RUNNABLE task */
-	if (rq->uclamp_flags & UCLAMP_FLAG_IDLE)
-		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+	if (uclamp_rq_is_idle(rq))
+		uclamp_rq_clear_idle(rq);
 }
 
 static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
@@ -1930,8 +1930,8 @@ static inline void uclamp_rq_reinc_id(struct rq *rq, struct task_struct *p,
 	 * Make sure to clear the idle flag if we've transiently reached 0
 	 * active tasks on rq.
 	 */
-	if (clamp_id == UCLAMP_MAX && (rq->uclamp_flags & UCLAMP_FLAG_IDLE))
-		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+	if (clamp_id == UCLAMP_MAX && uclamp_rq_is_idle(rq))
+		uclamp_rq_clear_idle(rq);
 }
 
 static inline void
@@ -2122,7 +2122,7 @@ void init_uclamp_rq(struct rq *rq)
 		};
 	}
 
-	rq->uclamp_flags = UCLAMP_FLAG_IDLE;
+	uclamp_rq_set_idle(rq);
 }
 
 static void __init init_uclamp(void)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index d87bdbd2121df..4706f73838a86 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3743,6 +3743,16 @@ static inline void uclamp_rq_set(struct rq *rq, enum uclamp_id clamp_id,
 	WRITE_ONCE(rq->uclamp[clamp_id].value, value);
 }
 
+static inline void uclamp_rq_set_idle(struct rq *rq)
+{
+	rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
+}
+
+static inline void uclamp_rq_clear_idle(struct rq *rq)
+{
+	rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+}
+
 static inline bool uclamp_rq_is_idle(struct rq *rq)
 {
 	return rq->uclamp_flags & UCLAMP_FLAG_IDLE;
-- 
2.53.0

