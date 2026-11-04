Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811561;
	b=0B343SSlUPkQxrl0P9AodarlQTXXIRvJRTwnvSCv9sTfV8X3cYCV16hEMZHplWwC8qQU
	 qjdRg6Fmk0MFV+INInEcgsQLjBV/H59kKf2h295Q1FDbhgVPkFfLPSXa8NtYjtgD0kELS
	 6Dr5zVPSZL6NNv0mwSh1jzvopWtb3ft2RnxPvdQnqp2y60L+f9jhneyZpW/oL7RtQnFyf
	 UUHDoGPsmrOdQqtS1sHe6mwIx1jm1ap7Iu3iwXBM1p8vzrPsYAN5OTE0VXEWYstEXc0Fb
	 cX5Tej99ullfHpglH1a+P1qlitTpWcC/ZDX4eDvtcmkFPJ0PYEDQq55uNclgXqAZ6qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ccVf83RTacEiSDDfp2h5xNH+o9FDf22bxraZEScVifs=;
	b=ItEaUIJkyC8pAPA/ZAsYpVvXp1ELHq/hUPIJm1NqgDnhU6voEnvDOFdI3/KWf/u4GqiA
	 ymueHKrU141JP+tw11dTQbhkmq96VcBK6zeW1v77JpxvaPsAFcaS+bBgXRyxD61XmyrcN
	 1ZaizX9dL14shljlHn41CFca9sperSH4/OzyRpSecGPxENVAR+UrA9HhGRJf/eX0FdEB6
	 8T9k17SDCC6hq+xC2Xwes1jxmNXBWyD9UCwTuZvzafHq6/EbexHmFldlKZaqAAHGybblq
	 s1h7ySnNXU3Pxr8UdxpLQxv0rJOry2LaFH+eQYtmOC7NO+lFZxZeprpBWp8mHf6SEdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srwPcV0C;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A960606D83F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A960606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srwPcV0C
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514b90bb89so1750782eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811560; x=1794416360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccVf83RTacEiSDDfp2h5xNH+o9FDf22bxraZEScVifs=;
        b=srwPcV0CMrFf09RumsTb6kBXvwJSmyv7F6Ok6cQb4RLoNTiP6mDJJ41AONoG3IBegg
         379AGoSfjaRazt2ZxU+Y67WdxSbYjW8t6oX0gLgWERE6FMNjvMjXxcOd6Ktdnc/OnQhg
         7CkFVW/HO4lzzZI6IXqVLY7dzdszcT4WWgR0uw+rX31a1/YYlmIrQ8cwUbAIuGACbM6w
         vKAA4UG+0TPX7jAJmab/BP2MApuRxmhM4c5Sb5Z5knQDN6HhMTR9IWNkB1xVYiZxbAIe
         H2FBfin851fcltS4cy0iogqxcy8G6CzVVIxlrmHwDWg2Y/Rj6tiru7Gg2HoezRX+hjYr
         SwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811560; x=1794416360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ccVf83RTacEiSDDfp2h5xNH+o9FDf22bxraZEScVifs=;
        b=2Gn+w4z+Otsb9oKb68EIQmSQ0d+jN+xu/oL/5Lg2BhRugeeMfDOZSJr5Xh1Vpu+AVH
         cM5VEeUnJ5prMP/DTNUv9xQBmrbj74QHsA7payoV43YnGddFGLozsHe2hcJMqOGJKT5i
         FvrV652u9KP14yo/9gn+IiSIXDRVaDpCjRviZmVW7NrEpXFUdlbP3gW89ljlH5kIAYaN
         J6fhB060TsvraXo3flzMoKCkiCnXUj3M8w5QVpewPYRSnKzKMEQMH2DRK0xAOH2EIPq7
         6gBvjyCMb8uYH8+LMBWz0NBGX8OEa+8jTg2qLVrj5DK1vIbgh2IxFbHjP6XC9Wcz6fM+
         j4hA==
X-Forwarded-Encrypted: i=1; AKwUvBwoTfvJ0Uz6HIlpsdK9A6OeBlJU/X9Pq/KG8LKB6H3msWY+4PXzfyhDMiqcFaV2IC30V1QCPCwVmQO1vtE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a+xuuwsSPXfliqjXUvsfsN8xlkboRLBhnFSrwZlwXKoM0f2le
	rN15jpCNxUTTM6zcxRvnnBonKwBBLYDRk2kNj33d28XCRQimA/h1f4CD
X-Gm-Gg: AYBFou35TjSRUVMHomQEzinx0eVzIII6Tv7AQYo/4C3BYzwbqktFn02C9iX/NQngEwb
	/F6l0lXWJk1tztQspiE6l7CvpUK5SrX/4ZYjTgH6cUhBpVecIVH5nlskEui6d1EqEEvK+T/Ck2k
	hPUB9RLKZ58LtbbKnkYYmc+02vQ4G6uQszYFDdDw8baQnEMXEtasUvchi3tWLvcESRy1LGag4T8
	Mm3AXfhfHTIjoXKHDnG3XhRK1MFBretrQdncJMEd+JoPgK516l97ycB383Sg5NIT008graWD25R
	TCVHUzxDBcjBev3YuAUfDsSMc+uES8o3ktcytoZeHO0VzN/Jq+EBefLQq76GbHwj0qEbyWEpxS6
	v64Ou+yq8uX+QqCncMnKmCqGOK1HHWJU8oezsDqLbjuMsnogHrM7ra92sLwVkEfRbmoQphXN5us
	ng/t5kR5aD8jSIYMdLYcQzeJRsM4MHxKuiciVE/Fb2I/6Pil4cWaLLcBGloJaiOPe+RKSN+LyPj
	1vt1aaijoPAd5KIutn+3/Rd+u+1xh1VU0pT1Du09ZzouSleCKEFN+MEinnuJkOv7Rbx5Y8niccp
	iJkFIgmBnT1f9IF7+c8fhT2Ck0i8M/uiZuGuJKI=
X-Received: by 2002:a05:7301:640b:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-36a42363ef8mr22540460eec.7.1793811559006;
        Wed, 04 Nov 2026 08:59:19 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:18 -0800 (PST)
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
Subject: [PATCH 26/28] hazptrtorture: Add torture_type=none clean skip for rcuscale coexistence
Date: Thu,  5 Nov 2026 00:54:44 +0800
Message-ID: <20261104165504.2430480-27-kunwu.chan@gmail.com>
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

When both HAZPTR_TORTURE_TEST and RCU_SCALE_TEST are built into
the same kernel, hazptrtorture calls torture_init_begin() first
and rcuscale fails with -EBUSY.  torture_type=none makes
hazptrtorture return early without registering, allowing the
rcuscale hazptr scale type to run in the same boot.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/configs/rcuscale/HAZPTR    | 13 +++++++++++++
 .../rcutorture/configs/rcuscale/HAZPTR.boot         |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot

diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
new file mode 100644
index 000000000000..c5e9cf0184ae
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
@@ -0,0 +1,13 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=128
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HOTPLUG_CPU=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_TORTURE_TEST=y
+CONFIG_HAZPTR_DEBUG=y
+CONFIG_HAZPTR_STALL_DETECTOR=y
+CONFIG_HAZPTR_STALL_TIMEOUT=1000
+CONFIG_HAZPTR_DRAIN_ASSIST=y
+CONFIG_RCU_SCALE_TEST=y
diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
new file mode 100644
index 000000000000..e9cca4cf453b
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=none
-- 
2.43.0

