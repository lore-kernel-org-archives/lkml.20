Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793426769;
	b=vaqN/N4ewGgw+Yf8RM5DQhZiXeNDgxe7qETe1gVvxm8MnLY4CD5UE6bK9P5t37IVHnAa
	 X1fWKjNdBLkYkYd6VO865ZlTh7XwKjoYzHKTq2WxTPX4nvjYjNbaXxeARxRU2o6Xu1Kj/
	 nl92Fy6avxmLoUKfhO1vfo8bpTuZnQoN6v8XUnXqjLmBW4uVdEHH5AF/WlYrAtg1z5PH9
	 fJBEY5csrXPg2jLnU4GleGLuf32yLoSIi2ZxSRa1pZfy9QCr6f6BWfDzUH9/+3ZXPpIR2
	 VQ2bInYHFzTbFF20HNdDgbCn0r5xL6/G+9qu0uieIhjJMI1ofh8qp2dB2bPSVwy6XKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793426769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oz93Axx1rMTC+L2SLi01u9xzZB+E0GNIYflNZoyMX0I=;
	b=ZjQLYA1f0OiZ0ikXjlFWHQlWaTNNgYExHAIyS0RJDUtPGrIOrwyVaKqlurMDoaTXEGjg
	 Po8vJ+B348DUd3g0aGdKBCbOgGXoE7QX/9G/7sGwIe1im4ZVJBM/xtWxwWVbQP5o9hB70
	 /4pT3pM4lff1dWQ6LcvMJE2YnO2nkn9d487JlSSmFXfCEh1s8q7An22HsNFvPKyLCY3H8
	 +HcSb2WHsR6z3V1N8uvvzmnS9Cqh4oMguuMgvG2JrFjlQkN8NtV5NmdL4mj7toEgpLC/q
	 AKklHBpD15nik6R3Ql08avMs0FxAlv9xdMfmZy3N+ru2woxit/FdEJd/2sLpS1wTWig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WRZrU/57";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026D9606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 026D9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WRZrU/57
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so15233885e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793426767; x=1794031567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oz93Axx1rMTC+L2SLi01u9xzZB+E0GNIYflNZoyMX0I=;
        b=WRZrU/5798CO9ZsQHlh2sO5qSKWmqXyb2VRh1U3V1lkYgcsm1pKpp6E86/7StWKNPi
         TqQufnkOMAW9I5cTRl6RpJhhI/Pj2QIEcI+Pvx0hfy5lMnrcjAdxeRXlNgrKVTOnrcC8
         yyzJkLNmsH6xbd3OwZFwSjLslKzX6Gj4UM7Cy6Z18jxhzX9cslbwKbfKuQ3RJsCoNZ6g
         7ptiTkvWcIMsIdIxs5/8NR6CaxEQh4NtpUJcQjz7+hIrQRCAHDSODT3exzKHniNhjU5j
         Nh+vQantDuhKtabrOB5j5LTvD1RIQvz8ApdxR7iZViN2wCH/CGrbvEhuz4ZW1O7GWl5m
         wTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793426767; x=1794031567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oz93Axx1rMTC+L2SLi01u9xzZB+E0GNIYflNZoyMX0I=;
        b=2oO9Q4ULGJ2E9YoYCKPr11pUdXNtiNwbJdxmiRr3vn6hsrZXJFErCjiEbM2WEnaDVN
         8nLAyoQlwrqUnsAIsuqPNEPUZGH2+wdYIfdEzceAxsQE8lZlHlojMATVtUmXj086Zmyx
         atISgpUjbgNJnvzxS7w60B4OfqGgSGsYSt3vbhNsEiaZUyP9WJ0Bt+KYHT1s3JmT18eH
         LU7TD+rjrZkYSJB9yvHB4YQMACEY6T4Izm5wOW8bYp5t8eNIKuBEm3KEOLhoRzMuGimi
         bLK8zd+xu7M+7kgaM6hcD7dVVD7yG2GGejoXhGXzqbYdbxgsSJJvt0Ru7bLQHpoRDIB5
         1G7g==
X-Forwarded-Encrypted: i=1; AKwUvBxa3qtnMM57JhIOZSeBlCfQQrLJqYzwFTRp1IY5Pg5pLrS8ab140QJ40vJVDkFkpJg8mFOsM5kvQKQzw64=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh4yMmFWmNGloWlvA8aQieGI6SWhIX1+NzyG0u6KdvlRdoCFrp
	9xyWyiHRroMkgYfmv+17zU6eR3kLjv7AwkOKPQT9HQswiVOncHg0m+fJ
X-Gm-Gg: AYBFou2P4pTDfR/kob9HUx8DrEcYscImSvp5dCGnyF7DfkL5I3ytOrRBQO/5QgWErcD
	JKuHlimaKO3L9Ci8HsocH0o0m57km41eYjRkyRreCB+CnzSLqQGrrWng+c7xyj8RMRquTlHQ751
	4I9YAMbVQs9bgg6vIij2k1HcEFu6kKFY5H/DsZ8Qgjt9Eh/zQHTx0i/tNXu3JO8rpSYG3HQYeiV
	3xcL8qXtKdzcXLwQvRnOM9uOR350feuqe12VD41R/DwvnH2mIV2iduPYDvT25REUUc5slkGwEqr
	8ylhgxAzedQqCm+iopPp1+FjjcUffBswZpcCK9XV0Of/qIr51ys+AkgyNhr0u7AAradS/3k787a
	7+WrHb1/AzgOf+d813thE31ouxI8dixYoVeAl1R4jVhMGx5SIQt0pAz9f7RNpm0CkOs3prqymH6
	ITJj4G0tU6DgdrS9YCSlweUulIRpi4AI2AQx/FenW/S3cGhs7D/p+YZts8H8TKfaA1Rip8Mgo6P
	LEitutBzyvgiHi8ftC4P5pstbFhDzUMzW94p92pB8C2AR6CkPpxh/5dd5oXXM2UGoob/ELsYCun
	b0eN/KdT0xdSCXkIp/R/NWYUXaGqPEcfJcnQwknAoEXa06gHJvNNKviw89I6rVaneA==
X-Received: by 2002:a05:600c:1f93:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4ac17ffa050mr100686095e9.22.1793426767039;
        Fri, 30 Oct 2026 23:06:07 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:c8d4:ec29:293e:f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c0b6sm6658430f8f.41.2026.10.30.23.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 23:06:06 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matteo Croce <mcroce@microsoft.com>,
	Petr Mladek <pmladek@suse.com>,
	Bradley Morgan <brads@mainlining.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] reboot: validate reboot CPU against the possible mask
Date: Sat, 31 Oct 2026 08:06:03 +0200
Message-ID: <20261031060602.2949895-2-thnkslprpt@gmail.com>
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

reboot_setup() and cpu_store() compare the requested CPU ID against
num_possible_cpus(), which is a count rather than the highest possible
CPU ID. On sparse masks, this rejects valid high-numbered CPUs and
accepts impossible CPU IDs.

Validate the CPU ID against nr_cpu_ids and cpu_possible() instead.
Reject negative parsed values before the mask lookup and update the
error message to avoid assuming contiguous CPU numbering.

On an arm64 QEMU guest with possible CPUs 0,2-3, reboot=s3 selected
CPU 0 and sysfs rejected CPU 3 with -ERANGE. With the fix, reboot=s3
selects CPU 3 and sysfs accepts it, while both interfaces reject
impossible CPU 1.

Fixes: df5b0ab3e08a ("reboot: fix overflow parsing reboot cpu number")
Fixes: 2c622ed0eaa3 ("reboot: allow to specify reboot mode via sysfs")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/reboot.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 9a84401adde5..7b09116376e3 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -1146,10 +1146,9 @@ static int __init reboot_setup(char *str)
 			if (isdigit(str[0])) {
 				int cpu = simple_strtoul(str, NULL, 0);
 
-				if (cpu >= num_possible_cpus()) {
-					pr_err("Ignoring the CPU number in reboot= option. "
-					"CPU %d exceeds possible cpu number %d\n",
-					cpu, num_possible_cpus());
+				if (cpu < 0 || cpu >= nr_cpu_ids || !cpu_possible(cpu)) {
+					pr_err("Ignoring invalid CPU %d in reboot= option\n",
+					       cpu);
 					break;
 				}
 				reboot_cpu = cpu;
@@ -1351,7 +1350,7 @@ static ssize_t cpu_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (rc)
 		return rc;
 
-	if (cpunum >= num_possible_cpus())
+	if (cpunum >= nr_cpu_ids || !cpu_possible(cpunum))
 		return -ERANGE;
 
 	reboot_default = 0;

base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.43.0

