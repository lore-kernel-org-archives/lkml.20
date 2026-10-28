Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158309;
	b=Md4Ep6JVezeVXzPDhJX1YjbyOt5ou2cFPMEWkZPjgQ2Dic2Gg4GAEx/H2mTMDDWrzA+d
	 92o97qhe5Wst6PM9ZLKYe2An80RxhijLjeNNOfplXEBI9Twt6XaMFhgOjzTsrlB7LB5C2
	 jq7MDLypJv4doYi/N+0tN4RnqXo6d9tQz2IKHPXDKT8cgiMNvYaMw/gh2CuaKseH/dABC
	 hqZNl/ZgZaFUpUZEvgAHBzcsWt6W1gC0ZHfo5aDnZ82p5WrODW9QASxH9JnwHovecoscg
	 Uk73z62kwLjyvtInH6Xf7S4EQ3QUdimMV0UnHzJudBywj8b0igOa835lvRmNOKQmbPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XMTbYYVHlMzt/kOSKupfitaPTvvxuFfzu7jXp67o424=;
	b=jRb/ldEn3bFf3XTzGhqgO0IxllWi0ulXwWz/ncG3DrKpf/h49M2aInWmQN9RI/GRxZoo
	 GsYA+8jHQVD6HddbrTbIHiGsfN/VzANsIuYG5owI7CCioD+7/E18dr2HcyNivwnlmILRs
	 tN8+rbzD710uqE96mQz2sH2xb042pvvyvoNyA8XKgF2OBvJKHHMyBEMTnYCYecBCkJQHU
	 g8VWqfis5vaQ6JI61zpR7vbyHDPV2aWeOwwTksZk+bplGDFXvem+K0NKPP5u21pf0dhPA
	 eiYtJEticl1FcnsUDvw7YxYsnq1v0RLY/GiZxKX2/FoQzgEI7q2GWiduyCdNupA2Bqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBKeCNf5;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE092606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE092606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBKeCNf5
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e4831c028so410848f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158307; x=1793763107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMTbYYVHlMzt/kOSKupfitaPTvvxuFfzu7jXp67o424=;
        b=xBKeCNf5ITTDcklqB6jjif7vTfdV2S6+gqmE3n+nD6xcvqqK/ms1k46RxlvyqTFTPR
         tg0Ok2ZPztpGofsrbFwqltnbRcBObY0jQ2oT7bcsJihnVn0retaP6WmYvZSnZRafJaSF
         lzyLC4cgf7vVmHVrhNe2lHXvKZCAavK4pVUVQDZuzJty1+0y8+MO92i2n+ZI9/LcRieA
         AR+uOT9Na0OlkKSbgnEB3XdRgG3YkGA1EJrtpIOmode+Ttp1Ops99NyzsrbHJ2J7oiVg
         ipm+uP9HWhXMDLxLU3Be7rLWH60b9UpOpalvYdsNG0Aj6oMjxel/K3CLNJhDAGVLQKnC
         PdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158307; x=1793763107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XMTbYYVHlMzt/kOSKupfitaPTvvxuFfzu7jXp67o424=;
        b=j5ylFMNtwS+X1905xCa9wG6D1K7UNdjtj6rrnC5QS5siXfjY2lxqaYvSa6HmcILmS6
         fRgjxRrlpVLs7+0rEGez253XNW9kgoKHG6A8W1YKaxjQAQIpzRGxRbWKdDUZb75k/l17
         ArXLpyDZfC07jQGZHMqJ8JZNPcuuZCx2XP8C8OTAWvfMTQoKCoYpI4qiRItKuNdYWCVW
         ZY+jZ6VCpLVtvWvAe1ZG6nE0ojEa/3UbgAnKFrnhWpHmZTbelRx7qFT2PHWVDzVaaUcg
         wjT5aOG9EiFtfsVOHz9RsnOUpKKthiYJKBFOjlj9wiySnNQCoND6TtmHl+pLD7RlRJg/
         1aGQ==
X-Forwarded-Encrypted: i=1; AKwUvByAoWshOA8u5FPrhgnhqrBTz636IllTwtnPOgHTQDZA+xSq10qLX5b/aDD9C/oVza3te1tXbX1zRok+TwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqUo3vGvr3ZeQKVUF57eRxkAZT20hgZHGqMIuTR1HWEo5DOHdC
	7hSfBF+utAn/QypYSdCfClogd9bprJbzbTcduwuSyNNXb+gGeoWZQx5t
X-Gm-Gg: AYBFou21uOlZdMTiWtqP2L/tsr3EFt4VzazRboTCcMBFn4dofsxlDgPd9fUjNUevIhH
	Z1u44AZgEMbZtOGnOMm+TeQjCNqReuGSt6/Qx98QM2UiOZdmrU+pGKZ5pfdjyo5DWgQU9HH0JHt
	oZP439PiZF8qFmgBb5GXB/v7iwqPdpaMi+hiGZd0Vd8zobv4S4e2D6p06bTFmEtDKexN6vR272k
	o+fFo4QUMvuhhw/DUvJ2YBiqjCiotKmjSPwwTkqxHkANm32t9/Ty+ufFjH9FjGw1pqmmhXbcRSS
	BcKytj+byHWQmR5m1ERlbWIxhOz8ljXviUFIf/IOmN/nHmcCgmkeZRpUIBtZoY34ltHELCeGFNL
	sLv3XXDs9jglmuHgWiQ1DMDmIdRzw9zQ7FFIcf0MjFvQaMPBCyqrBCp1qYkOfmWnFzK3oWNb0Hc
	kER5glKtmfSB8muUh7cDgQOK6PNbWZg52HTJaUlPyhjnFbcRvxEPvBAl/UPDCM85HKciuG8HDMn
	lv1//eK0zNf03+Y75uh+1f3+O5qbn45aCDJiHmJORsrjmUPZ8lnSQM40vGbbp9oL9fpv+Cck9Tc
	MtEunFcndVjYVrxSfj+2SGW61eRCSKcGfGrnZeCJzOQioT/+0obWGsBJLTQv+9M15vtGDi2CrfF
	VRusgrqPCf133hyUnuzmLsYu7K/uUutXHRSektnBAcj5+YJBgDp5A3BE3UOMTO7jVgLLYuppwqn
	cJRjoqiUzpD6uJHcRg/VmwKfSDJl/IkMards3KtyLG+IwIFbdmiUxQkA==
X-Received: by 2002:a5d:6f13:0:b0:48e:4e00:b737 with SMTP id ffacd0b85a97d-48e5d56d4fdmr2944765f8f.54.1793158307173;
        Tue, 27 Oct 2026 20:31:47 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 02/13] arm64: percpu: Annotate __kern_my_cpu_offset() as '__always_inline'
Date: Wed, 28 Oct 2026 04:31:16 +0100
Message-Id: <20261028033127.82193-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
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

From: Will Deacon <will@kernel.org>

Allow the use of per-cpu variables from noinstr functions by marking
__kern_my_cpu_offset() as '__always_inline'. This will later be relied
upon to detect stack overflow of the overflow stack from noinstr C code.

Signed-off-by: Will Deacon <will@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Link: https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
---
 arch/arm64/include/asm/percpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 3cc316091d665..105f659bf8061 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -37,7 +37,7 @@ static inline unsigned long __hyp_my_cpu_offset(void)
 		    "mrs " dst ", tpidr_el2",				\
 		       ARM64_HAS_VIRT_HOST_EXTN)
 
-static inline unsigned long __kern_my_cpu_offset(void)
+static __always_inline unsigned long __kern_my_cpu_offset(void)
 {
 	unsigned long off;
 
-- 
2.39.5 (Apple Git-154)
