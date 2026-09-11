Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C2B451981
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162688; cv=none; b=Vyt9Jifh4Na7mgSns2VV/jrlpxkWghA3PCnLGr4CCV+qC0lFuI9S/g779sd6Y3+JrlwgSOUdVmQYem9nynz/I8F68+iZdvdBf+0RXvMI4I5M+pY3NHAphwyszU/d2fpAvmuf9HSUdBbPAkujAuF+8PH4uxSfUIYJggbAjWJEMTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162688; c=relaxed/simple;
	bh=ClD5QORMe+T7KlqLkjuBAZ9dv9PM3PDkhKBRwgMoWLU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Hw0KjNllDsysmZq8AHZSBTRc+/dY1k14xpsQrJamMoSlpNwOrjAioj+VrAwkBkiUi1DwXlUywPUqp/3rrsSFwWscpIaovi3YtQx2ym4bIEZbKi2ayNRKb8isCFvJ1lJjqMIK3BBP/hN+zbknB2ms/hnpWdae5ClMxlDXGV8gI2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fx5Fls+l; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx5Fls+l"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so2125665e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789162684; x=1789767484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=24Mzmp7Zxy4s3Cg5qdBkPUcd813XnEgqkzISXqGAntk=;
        b=Fx5Fls+llyhAQ/U7oMHF29YA5eb1u9hM711yRbW2yBCTNFicl/+Bvn57AZ2nudmr3s
         t2IPYWaEMQ+GCS3blUWNDgkZUGsy9GnM/C40+4yD3crdUcl+UDVH4QzObTj90yzeUrIy
         XwYnVN98V3kcfkM/Y4XjH0uG3H6n/vO8Splw2DD2QjJ+ATJtvhjk4UgZqgrBDXs03cnX
         gCsvNZ16gYFUqfnNRqXTpv3CIPLrApIQ8WN8WyOjbg3tjgH0C8+nDM17DQ8yL6Hp2jEn
         rwGkvHijJ+N4ioXyolcjpe/yuf1wsqgysmAFPd25yXDMMB0U1wh4KU344kv6uzUfpYMT
         K6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162684; x=1789767484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24Mzmp7Zxy4s3Cg5qdBkPUcd813XnEgqkzISXqGAntk=;
        b=ngl1xMtc26861JpRZ3kjTgjwfjQkLOCRTpAq+l4Uy7YA0y9VNLdv2LaCkIHGA92CUd
         JT3OnMVT+KdQ4RoVpWsHEwe7kQj4mYn/eGKTC+AXPolLD0qxdBxa2ekvJ4ukEbn1yXIR
         tph2OtZDqhK768uOYoNPhWnWASJOWsJ+dTCw6AvalA1BtRpPeGpkFm3ZIkRPueLXP8BL
         Uy77fAaUo7MDQ/KMSyvmP4jYj1h3s/O+UMJpzcWH5HcNjSwmAyGTstvHeyfCsAb2kDBV
         IyUg9NAigiPuz7BU3NUEaMLfpKdqCBGivNRcUfz1LcHy9y5EYfnKyRTRCA4mVbQ8VOqT
         iPOw==
X-Forwarded-Encrypted: i=1; AKwUvByt/BskQzp+8wPAQyxYHTcRIzeBbv1HChbhgBC94ONjEppoLs/kEVOuVleRv1+vQaBDiO1S36yOH5QbwdE=@vger.kernel.org
X-Gm-Message-State: AFuF++kxqqDzhiN1axl3P4rxQyl8e/twgH3ey1O1SQ33iMetl8Do9t4x
	lAa4NAw0PbW8btx+hYgTXboZM/Iv+I1DY/UoG5+XOsJeNz0nkfyTnAwv
X-Gm-Gg: AYBFou1/mK+VaoOf786eB3H3XIo7I3a8+cZFh47f/GO6W9VC68T/C8tNojj2wmDqPG9
	8wQNzK+YPF5hd8QrLHjnQFOVYlNIRNCwV1H8aXz8FSyRe2aBd74/yVO2J1BOKxdJ0V+zHXAYB6w
	T0InzgC0TvX3Hb3YtVTtMx7qobZOLlI6WjCvp1L9rWl9MjFYXHbIrTyjK9es7rDWB51bv9qB3eP
	ZPMTQTAiXv+TzdYPQ5zFknSIoy9sZnOY/DfnmQN+r1MiQeiZgBXpScioAjrqm1TgVCERBdt9iKF
	rYaIIangakbVTXjxqNaBbzGW1mDig6CFTm6l8TTJhh9r6M1hF0HA1RokLPR3deKUh7m+wFAnSNF
	BMImM7bt/zbwFHpp3ufR0aLIyTuwDmibfuum2mijWmQChx/DWMkafyIoBFkmVyaPCG7WvwNQ8AY
	lBZPZ4W+1D8wggL7hSwdYyHnUqJ8sGlFe3UAqnYczF12vgS+PmR+ZlHPPV2uYI7mkzej3awa+5C
	cVfweYJ32Dch65BoXrUJnNWdJk22CpqYtF1dWw/iuiM/NNOs3NXeaOac8PBMw/rhQtuAQuZGMUB
	KQBu4sBrJhjVD4QmYzqnkSeH+P4UQzpYY9/KA8B0nZtBU/gSSrKI
X-Received: by 2002:a05:600c:3b23:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-49e619c2722mr120896775e9.15.1789162684154;
        Fri, 11 Sep 2026 14:38:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm151033685e9.14.2026.09.11.14.38.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 14:38:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rcuref: Fix the rcuread_is_dead reference in rcuref_read() kernel-doc
Date: Fri, 11 Sep 2026 23:36:43 +0200
Message-Id: <20260911213643.3781-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of rcuref_read() refers to rcuread_is_dead, which
does not exist. The name is rcuref_is_dead. Say rcuref_is_dead.

Fixes: 3efa66ce6ee1 ("rcuref: Provide rcuref_is_dead()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/rcuref.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/rcuref.h b/include/linux/rcuref.h
index 2fb2af6d982497d346c821863aa366c9082526bc..01fee161b67c3ec9fbda6c3ffceab127a2721da7 100644
--- a/include/linux/rcuref.h
+++ b/include/linux/rcuref.h
@@ -34,7 +34,7 @@ static inline void rcuref_init(rcuref_t *ref, unsigned int cnt)
  * indicate that it is safe to schedule the object, protected by this reference
  * counter, for deconstruction.
  * If you want to know if the reference counter has been marked DEAD (as
- * signaled by rcuref_put()) please use rcuread_is_dead().
+ * signaled by rcuref_put()) please use rcuref_is_dead().
  */
 static inline unsigned int rcuref_read(rcuref_t *ref)
 {
