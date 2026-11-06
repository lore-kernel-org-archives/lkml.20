Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976009;
	b=rxgTQ2eWoMDT0wRKPxeslsaxpF/ZihLYxRD8UuKzbrjyChQZahSuRVjjPZ6UopyNwcOT
	 0j8mXqbbaSC2aolPXVs/YOOdcXDWuwPhYbFbZpJ37A3MqVdjwLh+Ul7cSdvcXugvoX3ZS
	 UcxG356fYPlcDVPSrN2ruPiuHRIQfiR+fulgc04yWIQ8XgwR5oIqFCANcrKftqBPetKCb
	 z2w765azhjG/zc3awZa1Zijs7y10h1MEHTaB2UJm+v2TVj7qP9+1vxQEC23+613x154GE
	 bA6bS/zRsiqBPyBSlJ5B3NKrmFYYtPgtXOYJjtywPK6S7uGC6Y95WhyBJ3WFm0fer8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VX9HHcw2MD3Gr5P9Ztz5qkm8xBMf/5Qk5NjDMCVJWCY=;
	b=siBcCJCzRe9GZ2SOnp1C8xV0YMDTz1Rmfa0KcXlobxQaCh2m8eKnLWtk3JQmUUa578HE
	 5Z2G+L8X3mU7Viu1/d0qToOby3UpsHS2haVfXOw8MIg0ps24YHCp/iGx9reCVsB6PHpFj
	 fyfnjDIrELmyKp0q0EyMmrPnUduEpH2vja42g8QX1hV2JYyQ0pf5WRa6bkWbusYTijPLC
	 lsmGPz6Q3c6Wg5VISOtm2+RGoKAmervi7CSd7Ws65xvTFDxqON54u/TfmRl9m3CxPP8iR
	 CfItN3NdY2Dk8S8wRM5XU3HpSfE4IaimvleSMqlvsbaX4OyB4Rghf1bigiBMHvkviKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NUYt/w0W";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC09606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC09606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUYt/w0W
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-370a1bc464cso40879eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793976008; x=1794580808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VX9HHcw2MD3Gr5P9Ztz5qkm8xBMf/5Qk5NjDMCVJWCY=;
        b=NUYt/w0W2yY1B6gWSKEl+10ga20huiLHLffz5z4qjB7JIyJPgCftSaIOpzZVsmZbF6
         kbMrpLlpxRL0ijlUh0rDGdGS6j5S3PSXz37V34ZppjT33ADpI5+vBf3kwoCtRoeoA3AL
         jRvoY62taTx8LV3FLSQB3i+W3Ujo36cOMWdicPoxJBVQUn1toC7vbjmPHg8LNyLnETnc
         n2CV1b2+TQV0J6wTi6yNkzS0k9QuCkeNpECIR1uAM5mAZKqoPoMQ96agbDzKdfVZtb/W
         buDtY2pELMedR9BcZ4TQzT8+jq/2XhYpVO8wk41OeXE8KoqDOvdCzSCw6UbBFEFbK4cc
         KKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976008; x=1794580808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VX9HHcw2MD3Gr5P9Ztz5qkm8xBMf/5Qk5NjDMCVJWCY=;
        b=EjEN2Wvrhi6RU9CeHegoaEbiZjJZhEzOrv+VUzy0yDPmkLqBrtFMcddxJwVjhBHW0J
         kHfw/H+s8c7uvr5RarJy3ovzDmdfzqSHkTEO76Yn6Lwd73BqZe4/1lYZWKu3aPDKbX7Y
         ieF5Pd1mVoMJHbRu4LOh2yenf6ViF42Mr7CquHV2dIAh1rU60zAjHEwKE3jJHxw/eKRi
         WuUizvbK6YG0lL0TlqfKZi77DV7FUNZe/+eFr8pu9UUEGywG5f4/ZiKemJ4kG8Xaoyzh
         RQ7DkAr/0XaQS4GYcjLvOaRmm5Pwvleh2uu7BjaIFDAjBgcGgDcWn049TNHdidg8FDnY
         tUPg==
X-Forwarded-Encrypted: i=1; AL+hErG9vEP4KaEPbyvam3R0tAJPzh27AywD2DclpDHGLpdYKLlKumuzOhfA3ftpm8xdlu3Oi0mN8N3YopwTksw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8knJsek+Zooq1lLBXVVDUptODAJBP/j5z7GaMF5PBKYl7c2Yau
	fFZY+nVxoNyZxrEDV/jnwV6cMerocA0Jotv2iubdX155WcxhjFfaKOHb
X-Gm-Gg: AYBFou06SUJ3AGU18wKkMTFbCE8TNwcaAtrit3jTusNwaXqwe9JGHi5sfkDqg9yGrd0
	f2HzYed+rqb1xKMbrVBZPxfcxmQhDxkwiw1rQTbPAYyI2SozuPDmOqpTtmQcaBerKANL+r5Z0rn
	oOr3pBiViqHPK03452XYSGrlFyMPN6m6nAuWuF/UEWyzkq37yhEZQEvTzOXWZ4EnPgRMMFTT8k0
	B7kmRg8on/quuqzOIQcdvfBQpshvcmI13sHBOx7N28rFuZEUR5Nusa2WUDK4xiByyE7Hw1KoG2l
	5Z2VqKW9VSRdd6A55a2nY2dT3vMEIUAQXcb83xZP7HQCVY+w/1oNbNjTAdrHoakbVoLIOYD2PgQ
	jsQwhYwit+1x0VTFijNgxdz5tQCZIOHHNCd0NbJME30R4LhatKg45IY9VCN8rlnIZWS0Gs2G9LZ
	ojwseUacVw0+D4wZOqB/kFmSQx/HFxoeYB5taYhVHO/RgvHtWB/Xn1KEyJo9crkyp6dAGQ5++dP
	pzoMUdTGa9NJb0DUUvZao58WA7HL8dWSjiKrKNJ/TwTUx5XnWIqrFTLBR8uNUjUPdD1rRaxKH0w
	4970fXbVYkAFBddtz09F80GTzsij5MQ+pxK/B3Y=
X-Received: by 2002:a05:693c:608d:b0:36a:1e50:e45 with SMTP id 5a478bee46e88-36f7681436cmr4458864eec.9.1793976007904;
        Fri, 06 Nov 2026 06:40:07 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa6a649csm7182068eec.26.2026.11.06.06.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:40:07 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH 5/5] rcutorture: Add KASAN aux-stack verification scenarios
Date: Fri,  6 Nov 2026 22:39:13 +0800
Message-ID: <20261106143913.3627722-6-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106143913.3627722-1-kunwu.chan@gmail.com>
References: <20261106143913.3627722-1-kunwu.chan@gmail.com>
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

Add one rcutorture scenario per RCU flavor for the aux-stack
verification test: TASKSKASAN01, TREEKASAN01, TINYKASAN01,
SRCUKASAN01, and SRCUTINYKASAN01.  Each sets CONFIG_KASAN=y,
CONFIG_RCU_KASAN_AUX_TEST=y, the appropriate flavor choice, and
the kernel config needed for that RCU implementation.

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Cc: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 .../selftests/rcutorture/configs/rcu/SRCUKASAN01    |  6 ++++++
 .../rcutorture/configs/rcu/SRCUKASAN01.boot         |  2 ++
 .../rcutorture/configs/rcu/SRCUTINYKASAN01          | 12 ++++++++++++
 .../rcutorture/configs/rcu/SRCUTINYKASAN01.boot     |  2 ++
 .../selftests/rcutorture/configs/rcu/TASKSKASAN01   | 13 +++++++++++++
 .../rcutorture/configs/rcu/TASKSKASAN01.boot        |  2 ++
 .../selftests/rcutorture/configs/rcu/TINYKASAN01    | 12 ++++++++++++
 .../rcutorture/configs/rcu/TINYKASAN01.boot         |  2 ++
 .../selftests/rcutorture/configs/rcu/TREEKASAN01    |  6 ++++++
 .../rcutorture/configs/rcu/TREEKASAN01.boot         |  2 ++
 10 files changed, 59 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/SRCUKASAN01
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/SRCUKASAN01.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/SRCUTINYKASAN01
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/SRCUTINYKASAN01.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/TASKSKASAN01
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/TASKSKASAN01.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/TINYKASAN01
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/TINYKASAN01.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/TREEKASAN01
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/TREEKASAN01.boot

diff --git a/tools/testing/selftests/rcutorture/configs/rcu/SRCUKASAN01 b/tools/testing/selftests/rcutorture/configs/rcu/SRCUKASAN01
new file mode 100644
index 000000000000..c115af0446ee
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcu/SRCUKASAN01
@@ -0,0 +1,6 @@
+CONFIG_KASAN=y
+CONFIG_KASAN_GENERIC=y
+CONFIG_KASAN_INLINE=y
+CONFIG_RCU_EXPERT=y
+CONFIG_RCU_KASAN_AUX_TEST=y
+CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_SRCU_TREE=y
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/SRCUKASAN01.boot b/tools/testing/selftests/rcutorture/configs/rcu/SRCUKASAN01.boot
new file mode 100644
index 000000000000..69ed391bd61c
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcu/SRCUKASAN01.boot
@@ -0,0 +1,2 @@
+rcutorture.torture_type=srcu
+rcutorture.stat_interval=60
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/SRCUTINYKASAN01 b/tools/testing/selftests/rcutorture/configs/rcu/SRCUTINYKASAN01
new file mode 100644
index 000000000000..e42387061bb9
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcu/SRCUTINYKASAN01
@@ -0,0 +1,12 @@
+CONFIG_SMP=n
+CONFIG_PREEMPT_LAZY=y
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=n
+CONFIG_PREEMPT_DYNAMIC=n
+CONFIG_RCU_EXPERT=y
+CONFIG_KASAN=y
+CONFIG_KASAN_GENERIC=y
+CONFIG_KASAN_INLINE=y
+CONFIG_RCU_KASAN_AUX_TEST=y
+CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_SRCU_TINY=y
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/SRCUTINYKASAN01.boot b/tools/testing/selftests/rcutorture/configs/rcu/SRCUTINYKASAN01.boot
new file mode 100644
index 000000000000..69ed391bd61c
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcu/SRCUTINYKASAN01.boot
@@ -0,0 +1,2 @@
+rcutorture.torture_type=srcu
+rcutorture.stat_interval=60
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TASKSKASAN01 b/tools/testing/selftests/rcutorture/configs/rcu/TASKSKASAN01
new file mode 100644
index 000000000000..e4c1d9740498
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TASKSKASAN01
@@ -0,0 +1,13 @@
+CONFIG_SMP=n
+CONFIG_PREEMPT_LAZY=y
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=n
+CONFIG_PREEMPT_DYNAMIC=n
+CONFIG_FORCE_TASKS_RCU=y
+CONFIG_RCU_EXPERT=y
+CONFIG_KASAN=y
+CONFIG_KASAN_GENERIC=y
+CONFIG_KASAN_INLINE=y
+CONFIG_RCU_KASAN_AUX_TEST=y
+CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_TASKS=y
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TASKSKASAN01.boot b/tools/testing/selftests/rcutorture/configs/rcu/TASKSKASAN01.boot
new file mode 100644
index 000000000000..b9b6d67cbc5f
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TASKSKASAN01.boot
@@ -0,0 +1,2 @@
+rcutorture.torture_type=tasks
+rcutorture.stat_interval=60
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TINYKASAN01 b/tools/testing/selftests/rcutorture/configs/rcu/TINYKASAN01
new file mode 100644
index 000000000000..219e599fa8f3
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TINYKASAN01
@@ -0,0 +1,12 @@
+CONFIG_SMP=n
+CONFIG_PREEMPT_LAZY=y
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=n
+CONFIG_PREEMPT_DYNAMIC=n
+CONFIG_RCU_EXPERT=y
+CONFIG_KASAN=y
+CONFIG_KASAN_GENERIC=y
+CONFIG_KASAN_INLINE=y
+CONFIG_RCU_KASAN_AUX_TEST=y
+CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_TINY=y
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TINYKASAN01.boot b/tools/testing/selftests/rcutorture/configs/rcu/TINYKASAN01.boot
new file mode 100644
index 000000000000..d5dafe68a5da
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TINYKASAN01.boot
@@ -0,0 +1,2 @@
+rcutorture.torture_type=rcu
+rcutorture.stat_interval=60
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREEKASAN01 b/tools/testing/selftests/rcutorture/configs/rcu/TREEKASAN01
new file mode 100644
index 000000000000..578711fb2d43
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TREEKASAN01
@@ -0,0 +1,6 @@
+CONFIG_KASAN=y
+CONFIG_KASAN_GENERIC=y
+CONFIG_KASAN_INLINE=y
+CONFIG_RCU_EXPERT=y
+CONFIG_RCU_KASAN_AUX_TEST=y
+CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_TREE=y
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREEKASAN01.boot b/tools/testing/selftests/rcutorture/configs/rcu/TREEKASAN01.boot
new file mode 100644
index 000000000000..d5dafe68a5da
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TREEKASAN01.boot
@@ -0,0 +1,2 @@
+rcutorture.torture_type=rcu
+rcutorture.stat_interval=60
-- 
2.43.0

