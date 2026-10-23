Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792735697;
	b=Z6T5vNySYY+xEXtUlnBdxTaEAscZ2b+1CMhD5rLTvAJU/F+eH6xO8zZlJaQwnBCe12mt
	 F36K+dbv901oYWXUtagaBR/Gx37vndje9fUBvqoRWQuLXMj+IulJ7+G2/NVHsZOrNeEgy
	 V6BMyiCxWh9UGvUB46aLTcUbjALHQXKycDw6qe80XMVXbftW9TBkKKnC6o1WcS2KJZTfO
	 RjxG91ORWPzTJKSwM9hf4LNgVH8kg6VQqVEVksPYqcHCX7IlakuZWgaFGJqKKt22cQGGs
	 A8J1j0p3uCZilIKrOF1nyd7lUFh4qGCDdUfEkYeIurQPptVJhSw96C3DnmPwcCeavGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792735697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KVLSe50V9P9os9fCF9Dj3HEzAcIkO7g0/a31qE5pUY0=;
	b=lKF8cuJQEpfONbEjMjzmI+9/8K1k5edqVFsLFQTeMjXlxAX4bCm1IXQIAi0u8+VpxcsA
	 K6aug+8SBvOM70J6d6MdAUZvXhzdXDOtmWcLEDmuxRYbnqloAHQ3CPWziWhmTXjz6+nsj
	 4fpzsYFjXA/ZfATEWakxLMaJqNpd/p1zihspFmYZs/jOH0h+dxvn8Gb97tJIGuUtO0Mqt
	 ax8I2dULth7G8ClGtS2nmh9z4sezWHjFdmjUxCXNPr2RbfRHXVYC930mhTz5Etc08w1W0
	 X0IAcHLzCm4++mXOPN2sPfpKgEinlqDIb3tvsJaAUAUXexjr6zZlR3rlljw4Qgjx13A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RN9GJqUr;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E78606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71E78606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RN9GJqUr
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso551044eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792735695; x=1793340495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVLSe50V9P9os9fCF9Dj3HEzAcIkO7g0/a31qE5pUY0=;
        b=RN9GJqUrNgYW152LEzWnO3/31p8ZkSA5sbLGo9jMaYa+FrWyGL5h5CgWMkM4q9UnL4
         zKQ5ho+nSmMDpHc11Tw5Pm0J2uK65CCtB1pVwsfJ4r5cxMXjpcJJtFwoeKjTWa8cyet0
         dYqU+4sZniyv/O44oWyEG486TffTVqmyfP1tpz7bm4Cd1YXassnCoGwcTHGiAl4ID6Pu
         k1lpMHpslUf74kJHiBQ2eoJzGOyssEPIiRnSwrTRZXuK3U6Jc3oF7Jd/z6suEZjaESKS
         gQa1f/rrhfnlPvDYN23ZD0Fbpw+zUB3xZQjeEYHZExCNNfFu03XW2Fs1dI9W2JDIEk7Q
         m1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792735695; x=1793340495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVLSe50V9P9os9fCF9Dj3HEzAcIkO7g0/a31qE5pUY0=;
        b=u1G3iwLWFWdMAODhbOivslwab8hAYrodv3sox7DgdQYNpAteisp3RIpc+bt0DipT6s
         zYWq3T0JQmQrZTE8CRHRmg62hE5npuPxWyT3XsFKYPNQgIDlFR7A48UPG8FH+XsB9+bF
         Sj5GzNuWmYomGZlgqPnSqpTC4ckjk4AN7zDUU0leix7xsspLVqVSHQcupwKRKK589hEs
         tgwGBRrRNxAsm/x9BaUvpGk3B8wFYjtHg5YQu4Zx7CVyA21c/GG5wyQ4xABUJ9gzk+9h
         66uGyx3f0JQf+cYrrBGPVqEqconjaMfBx9c48BZIVfatg79bwAPZg97gQ5KK3Wzc931o
         MwNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1fkb8nuRVXJ6BT6JFlENDMa3AfGcUjOT1TLg0PUrHnsQq5tXq+kNZrkizKt0fxPVh2uj3YZI05GWdW6I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBAfzjKI4eNieQp4Q8qRHnt6ltMZ765Th9S3Ca4AcmFpBEQmas
	nucuCOdJZt/qMMQmGvMPSLVxsTkUZ7Q7Arvf+GFhik0FwiSObaF5Vkjl
X-Gm-Gg: AYBFou23vs81omIuppArfnDzaS8iH8vXX2GJMhyXVvCLIf0aExRTCYclgUs3fZ3MjR1
	/XbO7NqdrLBxvVA8S31ZPUff4MOdNfzLf15utdKjSpdrzXXCMX07uLXRQV7zHBBP3hhUV9x5QAp
	i32WY4rgUBEH7pX8BX9fS7Lsruwud1IHT06QvL3ZOJOVYNj9c2AJyzkVS48SUpMltdfixjJ9o5y
	JPPImNYpMA702tlMVD4gzcl9yvAW84lDis9BiuNYHeNdHvhqDAehS2erP+iuiArI6MyA6vj2yXE
	m1B8eCGioLxg90U1YmRnmtiKV9cg4YpOh75jtcZVBcv11w/pcumRSuRBkJBj/WiZ6+JO5wzSDBL
	zAhNW/2jHquFSDore8EMfhISuuetlA/GEkbZES5GEg9id0Hrj3N+y/v0gr6RTFD7Jes5Atqg4pu
	+MpMHQ+fB+Z1P1qo6ItKaKBxOcp5MvxPyihsXnyNw7wBmOfD6TPvsjw+ITG9bQRQywEPCyKL12s
	WvInwpFgCwgddSKxE49NlA61h5PTYL4NSDN3VVtUHeat8puGJPVGw3PbU80hirZrU2+EcbhZoCZ
	ARn81SI4cAEwOso/U/urwvasE1vZ
X-Received: by 2002:a05:701b:42cc:20b0:176:d885:4e94 with SMTP id a92af1059eb24-1959f9df88bmr2076945c88.26.1792735695388;
        Thu, 22 Oct 2026 23:08:15 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195e5163e1esm4156742c88.3.2026.10.22.23.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:08:14 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: rui.zhang@intel.com,
	lukasz.luba@arm.com,
	javi.merino@kernel.org,
	rostedt@goodmis.org,
	edubezval@gmail.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] thermal: Fix CPU mask truncation in power limit trace event
Date: Fri, 23 Oct 2026 06:07:24 +0000
Message-ID: <20261023060724.5691-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

num_possible_cpus() counts CPUs, but CPU IDs need not be contiguous.
Using it to size the thermal_power_cpu_limit bitmap can omit CPUs with
higher IDs. For example, possible CPUs 0 and 64 produce an eight-byte
bitmap on a 64-bit system, dropping CPU 64.

Use nr_cpumask_bits for both sizing and copying the bitmap.

Fixes: 6828a4711f99 ("thermal: add trace events to the power allocator governor")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/thermal/thermal_trace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/thermal_trace.h b/drivers/thermal/thermal_trace.h
index df8f4edd6068..2f953fd8289d 100644
--- a/drivers/thermal/thermal_trace.h
+++ b/drivers/thermal/thermal_trace.h
@@ -119,7 +119,7 @@ TRACE_EVENT(thermal_power_cpu_limit,
 	TP_ARGS(cpus, freq, cdev_state, power),
 
 	TP_STRUCT__entry(
-		__bitmask(cpumask, num_possible_cpus())
+		__bitmask(cpumask, nr_cpumask_bits)
 		__field(unsigned int,  freq      )
 		__field(unsigned long, cdev_state)
 		__field(u32,           power     )
@@ -127,7 +127,7 @@ TRACE_EVENT(thermal_power_cpu_limit,
 
 	TP_fast_assign(
 		__assign_bitmask(cpumask, cpumask_bits(cpus),
-				num_possible_cpus());
+				nr_cpumask_bits);
 		__entry->freq = freq;
 		__entry->cdev_state = cdev_state;
 		__entry->power = power;

base-commit: 503bb6e70bbf6304b8113373d09dfffcc4aa9183
-- 
2.43.0

