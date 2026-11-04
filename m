Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811413;
	b=TaeutPC3Smuxhj9FTgv9yKG5fNNDMlAomH37bIwfC/6nHkmeUbsNj/UvgmAOyD8b7OOU
	 WCslP0X4VeLSrGDU0UBsIB3lwFoLT7V7CfboW9bIN0u7Km4mZxvA9YGuDjlYHXifCaytc
	 JgDolkcu8Xmixl+u+JL6le/qBTYyT6kCqMQ/KkmfI89ILfToYrKuW147M0pAmfcEdcQxd
	 5kMNMDTXO26y6287zGLCyFs8RHllSGpTor7aLVCkOZVVR2lZK4wSoZ43iAFslnKNBcUq0
	 GCi/Y9Cte2muSJ9pDROh0fFjlIqwNN3okuJKuk3RKt8hrxP0AlnjjKkEVZ+2Gx0rE6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gn7Vn4SwsVH+p5VUqdHL4flc2b/Z4fswSqRV+byEjsE=;
	b=RMziB5QtWQaQg9ASOeC4NgXdZdvrU0p/i+/Rxt7+FVh4jkj+phc6bZ1fYtk53Wdv0q+L
	 l64h+lTurA+aFvOx/1EK2kmSmh9anmV8Uqoh0JIyAwUDBAEVzNFu3e86MsZqElguGhcLr
	 46xCk30STQTbcs+T0MVVXiek6RLw6X+nlGHC0aIx5PW5vdTCWjCAgsA8AcXfMroHNJHDN
	 K3BXB8dY/ZgNFE8aAL+1IXBjy7vdFYnwaSz3d/a8jqcyBNC0HjbqHBi14fICsSbhO0J2N
	 lQSo+8TFXqJngrvLJIH43WzP6/6jQ7N8gzqkY8OLh+bBQsANtFGf48m3QAKSgFs0wHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCP9s8Vr;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27C6606D811
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D27C6606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCP9s8Vr
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1532018eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811412; x=1794416212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gn7Vn4SwsVH+p5VUqdHL4flc2b/Z4fswSqRV+byEjsE=;
        b=kCP9s8VrCg/13i0ZvqMzZuUmktyH+GlFZ2KrzEozRxYNjxwtUFfqQ4YcRch8Qeyk6u
         Hyn0u3av8Oq/ekitd88yUopP0KS5X3nfx5bJN9XLDCihsS9/B+LmIOjoIg8kMGHp55AA
         itpmpYPOnoIXeErCCDxkUnG9ddysA9lPc9P+UN27efB2O7duIM4/z/uptdK27yKrupJl
         wGzjO2kl3X2ToG59tSS1CSXqYjRi2kMx/7bC8MIgy1Ghv4RO4R5aSoIy5zr5UcYM7Z0f
         APMXkid8qQKM47Pb5yXyT1eLecZbbRtPU2rV+l7kFLzHqUXv5g7AxolJjZR1ODawytlm
         oxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811412; x=1794416212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gn7Vn4SwsVH+p5VUqdHL4flc2b/Z4fswSqRV+byEjsE=;
        b=vkqkLkndxUwBhsVUxO4GPJ2YbvZ45gJTuMlEXv82++YwxkaUpTLb7IcNQ3NIu0r5t6
         BsfjJeUldjSavoxFNJ5mmr3rLhc2OSSie15PO5Badf3mY9STgqBdKtZJE/zunIY+DRyV
         v3KCp/QM5AEwKO6iTyXDOQ2iItETBnfRRg/dR3nG+6ZJTpPZ6dNLv023vvSfHgnJPZxu
         Nv9hz8nxj+gVCq/n/0em0C4VSnQcNOTR7VZFcniSMKvoI1lA+QOzs80W5IwMPTEQkFFi
         S/V8yBzadVPqtCnXvv662zR736KlrUn+QXb7WrVeiul9Hc3ffdePKmzPw6JbOLQFsrYV
         i2eQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/Px6C5uqff/imgVv2xnH6ZnD8Pv+hVQFS/qrVD+B1OBI/OIn73M3pmcl/hr94ZpR3h3FfFlOOlK2Ut+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z85lKzKMbyX6JWsVLBPbnKLKdaxqJYnTiwZOepX5Clr/QNOaF9z
	YhNHR8c3MMpV4m6105voEoXTNBzX4y/qArPauf+dZegnpbgNkQWD2Fa3
X-Gm-Gg: AYBFou1SIWerh0fX8edvWENbb3IAz4dABLhqHB9e+lFEnI9E5lRf7VfwuKp9q3SaLmB
	NuPW/LWxsY9FDeqIE1n/tNlNhJQu7Vs16qCojvgwcTnNBT6XRa7AZOw5JZSh3QqVtfDvqXAjivH
	oNmZy1/hYCHUKXxZypbUQ24+FVXXOmN/VVo8HwCXAXkavykBgU2EGgrVrFc64fEitVaEP+TkKFz
	W0g5Mv4ODRCFrBQPWaQegJnNVqUKRAqTMqG0a1Sa/7CXjO6LK4QFfu7M4ggrbexd7kaYL/skGKb
	jEkRGwfQMYdd/xBBL5GDlIpnN6DqcAXdFnQrF4xXekrYxd0okcv6CHmqvIRS0jE8BKD51/hYi2U
	IHzELSXkm0LQbkBzAcc1uiyoR0YAPTDg43k9trnhtC7zWMS1dHTcGmNhoqZoXBIloDfhD4nFThH
	Z+0sPiWyzmeYNtg/OaYoXnC2avwv7nh8SHxRvCsWSfqAaRn5+gZElldaCPTo1lJhqumRA2cXvFW
	7rFCyKZIhp/J76uZNWjRToKJUqkJmmT3c+ZgtQ8nw9+vjn/kzT0chbFevHxb+2QNUOlCZKZJ9wu
	2Q2M8IMVNlMAIu2LYodJCD9vy347z2YX6YIGRbM=
X-Received: by 2002:a05:693c:88d6:20b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-36a4244db5emr23827711eec.30.1793811411412;
        Wed, 04 Nov 2026 08:56:51 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:51 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 10/28] hazptrtorture: Add 128- and 256-CPU configs
Date: Thu,  5 Nov 2026 00:54:28 +0800
Message-ID: <20261104165504.2430480-11-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Add CPU128 and CPU256 configs for hazptr-stack torture testing.
These configs exercise the shared-scan path at larger CPU counts.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 .../selftests/rcutorture/configs/hazptr/CPU128   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU128.boot        |  1 +
 .../selftests/rcutorture/configs/hazptr/CPU256   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU256.boot        |  1 +
 4 files changed, 34 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot

diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128 b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
new file mode 100644
index 000000000000..079b463607e8
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=128
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
new file mode 100644
index 000000000000..1d09a6446080
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=hazptr-stack
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256 b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
new file mode 100644
index 000000000000..b00a984977f3
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=256
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
new file mode 100644
index 000000000000..1d09a6446080
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=hazptr-stack
-- 
2.43.0

