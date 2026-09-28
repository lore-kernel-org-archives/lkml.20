Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F96329E4B;
	Mon, 28 Sep 2026 02:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790563084; cv=none; b=tjwgD0Ipj6l91566Tp+iI/w8+KMeGbyU33TU3ej3R8/sLjF79suTHzm26paoly7muIFkg8YjHoOPsbI8eHtjpSeh862pKPNKatS9EBi5Wfm12vAaWvsyogYXMP/Fe4HNL4ohArmqOs6wo0LtSeR+7yQFs/ZbF03zYI3Q7Mj1lSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790563084; c=relaxed/simple;
	bh=P+ozHXXzbc99l5W2TO+4GV9+gDsHam+tloYu5S074HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OzeyBzfarWSnT6FQ3lt0q49w3qhvB083Pn5jkwCgn7K2gcFtYfymnoz6cWUGxxdWj5g3S8DmS/WeZtMmLauF8MFdi+zWZAtRJ4lNBy2iaIVIyO58eo7leLDxkIESVm9p4ThY+3yA4b3bbukq1EQmF1XImbMUPWb22CSw7EOauEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZFpJp8Xf; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZFpJp8Xf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Zu
	L58/ZwTVO1G/8FczzDO+eS4OSmnaixwJyDc3790Gw=; b=ZFpJp8Xf+R0W2HD7NV
	HwtaY7wPY1FPUMz7Xl89KQD4Zf5NrgIeI5HK7woJwwlXOR6Ywvb0UZn4SdlyQepU
	VoArsNTEHzAzAZnRrZxLRkwGOKxFRcHUu+lhL7CzkIuVF1caUxdVPPxE7g9p0JF7
	I0FjsTj42inK4yPXe2Y5AhSZ4=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDXX97F0rlq7pg8BQ--.54366S2;
	Mon, 28 Sep 2026 10:36:54 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: [PATCH] Documentation: sched-preemption: Add a SPDX license identifier
Date: Mon, 28 Sep 2026 10:36:38 +0800
Message-ID: <20260928023638.1397038-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87v77s2f02.fsf@trenco.lwn.net>
References: <20260922083101.99685-1-quchaosheng000406@163.com> <87v77s2f02.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXX97F0rlq7pg8BQ--.54366S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurW3XF1DKr1xuw4xJw4fZrb_yoW3WFgEq3
	s5WF45Jayjqr1vqF43tFW5WrW5Ca12kF4DJw4kA345J34Dur1DKryDWF1vyw1xGr43uFy5
	X390gFnxtFnFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRAhltUUUUU==
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC5AbuZGq50sbccgAA3B

The file was added without a license identifier.  Add one, matching the
other files in Documentation/scheduler/.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Assisted-by: LLM
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
 Documentation/scheduler/sched-preemption.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/scheduler/sched-preemption.rst b/Documentation/scheduler/sched-preemption.rst
index bfa22559c29b..b48e53587a7a 100644
--- a/Documentation/scheduler/sched-preemption.rst
+++ b/Documentation/scheduler/sched-preemption.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =====================
 Scheduler preemption
 =====================
-- 
2.43.0

