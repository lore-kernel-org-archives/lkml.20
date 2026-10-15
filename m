Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80040568FC7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792086638; cv=none; b=esOchKESEfvhC6zQI2YUplGVmwm2EDFaUAmr8zfDM6kHF8lnP09g7VKYKTqKUOCNjr1CAwJ2/8pvEq/MBMrMHbLLPm634KpZ/O2MJlgWGdi6YwYN5Rm6QFkCjaRXath74hRxQF3kp0O41U+hDlAnXC1oIOZNNbXjOnFxnQSCfHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792086638; c=relaxed/simple;
	bh=Y1ffjjU3TrGKI2kHTODgUpjtuJFHQuy5DoAq4oKEq6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l7fK9mW5u3utXDoEVfDyoK7P+3Huil7xSh+bmdQr39C+ZDx/W3pJZTHayuOiFGW+Lc72iIneu4M1OF+j1nAR6aCEoLtGkx6Oq+HA9BmrpGd8WumvgqZkt6JAM8y8wdIIpWPMSb9VQusfcdlb5wKeEFrJ9e13N/uHmMTDrNVo5Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ2kbsZb; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ2kbsZb"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2090517eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792086630; x=1792691430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=grYpFloO+4FhzPg3/7Eg9rJ2UBt3fs+5KW5kcORLJrw=;
        b=WQ2kbsZbKRs/+4mwUcf39+OWJ4iv/UhN+hEbOVAiDDJAYZo99YfJP1IxxRaAxtYn7k
         XQkJHCDawGJCbqgClGb1yz0bSAu1bxtl6HZmIudd9xGt3YuiGii8TrXne1yhnmHsAt4R
         D8mPYpmHPNqdq8CM1IH/3+HGdooIuKjev1LM4hMviwijm2Ctiinvsbqv/evGVzD3zkqJ
         +EmSYd2JoEXQG5VlNSHALJz6xQMLR8+v2VHdekWwX+hQmbOWurqdibe15gMKolcAYriV
         mFgulLYlIaX6iGUmSkRS/amrSvO87fLe1M+DNJ03ucQJ5Xgue3uvoJw8x8KTy1cTrfob
         aUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792086630; x=1792691430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grYpFloO+4FhzPg3/7Eg9rJ2UBt3fs+5KW5kcORLJrw=;
        b=zBnmcG+IAOQ63EGDnghPtC84S7KXDpv5Ja270llCwNbgg034Spy0gp5z1BS2U1OczZ
         kGFaZ65bZfnpnLnXJr/8qp4dMlsSiHilufx2JT4i6lpoNQLINfwA9Ic1ud8AoKxJT1U7
         29Wu2w+hw8zLXnPA3MYD3uDbxo4qTJHG0u8k2bSda1v7yf1vPDALtWZXin+hSI63deHm
         NuhVjwtaazEYR4FNAvttSnIi8Xi1CWFE9nmsdoRSSJPds4WaPos8iDrvvVMDx34FLQGY
         LlKiaBfhk491Ki3ccY2ayOu7tr8Hil8/Eo4w5YAbMdxB0pia8SGLF3q9HcMedMsA8/Ry
         J9SQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1WwUuOHoDSccc1+gH9TkhopiBBwkiiOLP/XZ/e1euO0sMoFDb4+kvUXQOrRRrIaRxbYsMg1CAeAhH3lI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFMKR5Xw+xfUJScxZ/qN59lDpE4X8aLoUVa4G6Wdh2Fj9cRzPC
	Ju8t1gDQJPYusmBS17v45kK9CXnl4ZN73MS94NoIBluqtkMFZ9OlyEbl
X-Gm-Gg: AYBFou1PwEAXPNrydcxzonrm2OJCEaUoLhsYT/6mGhPRI9A1ceAxdIEeCMGE9Vs31If
	HXTpbK6u1HRSwyTxV3RkOd3ho5bFok104D95BCF/UxYTIzQvrHyx6HJa525VQPOGp5PLIskOnzY
	Yp3lziTx1NfXx5xsI1NoFhLXuRw2E06byO7tOABkmKNBkN+pfWzXpNkiWcs2/TbIZPuUI2T29nE
	s6MbBKbJZgLiXERIvTzBmAYxyg3jMywJPhPKwhsobol50FNv3E6gy2l+y3UFsh+SJcKBVIl6Ujb
	6oSuPJzKo0JUuzvKRqVc3D/dvr9wePy0w6PtrGbVae0FHh5Lhp5/2b00n5mRwjcjP33IQ7qaJEV
	UtEUPxyve3qKNKartAWfTeTbOd1XBRIYti5jUwBorUcwKhgD8/Vp65zJEXDDbXEb6E/5SJUPct5
	F+iFzrQTNZlBLjj5bzSF3a5ooio1/YUefCVw89C1mLpKgt3/boh8xqdM7kKFnHv7g=
X-Received: by 2002:a05:7022:2211:b0:143:271a:308 with SMTP id a92af1059eb24-16a6222be3fmr39515113c88.46.1792086630287;
        Thu, 15 Oct 2026 10:50:30 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a8a4a56bsm519697c88.20.2026.10.15.10.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:50:29 -0700 (PDT)
From: pdsj2807@gmail.com
To: andrii@kernel.org,
	eddyz87@gmail.com
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	memxor@gmail.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH] selftests/bpf: remove unused duration variable from cgroup_attach_multi
Date: Thu, 15 Oct 2026 23:20:17 +0530
Message-ID: <20261015175022.1370503-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

The duration variable is not referenced anywhere in the file.

Remove the unused variable.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/cgroup_attach_multi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_attach_multi.c b/tools/testing/selftests/bpf/prog_tests/cgroup_attach_multi.c
index db0b7bac78d1..9037e98f6f76 100644
--- a/tools/testing/selftests/bpf/prog_tests/cgroup_attach_multi.c
+++ b/tools/testing/selftests/bpf/prog_tests/cgroup_attach_multi.c
@@ -81,7 +81,6 @@ void serial_test_cgroup_attach_multi(void)
 	DECLARE_LIBBPF_OPTS(bpf_prog_attach_opts, attach_opts);
 	int allow_prog[7] = {-1};
 	unsigned long long value;
-	__u32 duration = 0;
 	int i = 0;
 
 	for (i = 0; i < ARRAY_SIZE(allow_prog); i++) {
-- 
2.43.0

