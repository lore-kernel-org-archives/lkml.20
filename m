Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2093F929C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085531; cv=none; b=hRAU1t5oWRV2z3l4eODYkcieF1Nl14fA2zMExFeMc0Esm0MXNLKtyNjjC8ul6BVlUWjMaYZssk8qLfferkSdNpDnlHI5Us00rjB4b9OBS6LP1EnJnYeBQ0E5UoXX+euRcvmYw6lEyTw9aIcZz1X0SE3HuebPXiT1BnFhLYNtbwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085531; c=relaxed/simple;
	bh=dI1WStqlpIXOwEbl0Tq1nJF8npf3hJwV5o6BMMo97jY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WF6WJBxm3zfYUBpAVkaw8wGoIZGxKsyzv1vqmu36JQ47jbgMnqKY0mxkqnoNoot/Z4au+UtyyHwN/TJh6TvJAzgPRcuHGmzmDX6/J2E24CwIbNWQOLknm4Fk6oa0w+gBM/6wjAZn6kNznmt8CLYqBvESBrzNIbWc4ZeJxQkfqh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBIxUgvU; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBIxUgvU"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-141395927feso10668883c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085512; x=1792690312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gR2GS+zLKe5N4zqWPOfXWRNDOn0SGujJKSCC0wtMo+M=;
        b=qBIxUgvUO96D84ejDfDAD5aS2cqMdudqKnoI2iph9jTolWVs0Nh8gMFQH+/A8wkwR7
         vgZLpgkUTNuhzKXohA3/zreCZzVpWH8Rk4m2Jo4SVbUdVR9jEhoZrJBflMunavT3pOfq
         kaS/h+jywkDPqrh69Q/jz/jACPd6v/Tq/4FvVTjTpDpkgP+rDikijPxh6cI6UPsWB/yB
         XmzNDmoMbanYu9KZKDbEbXYgrpk//b/l3yPJcMbFXjEU9aS8M99nVkxwSnKqArGV2C14
         IWPrbdcaUJTzZB+aOwE+NzbU52T3jIm687B861yPcMjoiGjxLrytMAb1RWJvfIVq5ZxI
         hirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085512; x=1792690312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gR2GS+zLKe5N4zqWPOfXWRNDOn0SGujJKSCC0wtMo+M=;
        b=qkLU1G6Zm8I35Aq+u3Vmdhf6aXMZ2SkeYZDZfTI2n90cD+wfk8DgpD52DcM4YLROsp
         2QSCoYa800HeKCFzpWZZmRfJhcMoBqiOwbnnf1TSkY2ZStbYKcmqEH6Lvg4WblefJFyo
         7mqFrDz38MWtm4A4JliPsvfzx5PKb4ZW7cW+TX7XgPzMprqG0BxoYIlQRiOf/DDn99fk
         No0ktOk3whjTngZmP9YJaHBQ+rmpmvzNHhmFjiNDjCh5UR5cveTFIVj3+hQbQ+cd9hcR
         Nzi9jBqm+mb1LCwXGqCcCo7I9FWrunKEWEnCxmxDYsZLfvXE/yJPP5dhAOMHe05e91+2
         3guQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxnDDfhCCf3Fgl2AewL1QYmsaWOz6Z8My4U/2Khv5XYD8ENbYm24+NbYQlWtz0OQNI+xlblokzk4RSsgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI9h384A7EbT7kxAuG1upP15tpEEIWfVthLbyc77p2p3aZYe11
	z/bbJP/e+1zuodp2uLHIOBoZV1EsMe/cMS1kMrsQ8wAAVEBYYcvBn/Io
X-Gm-Gg: AYBFou173dZxJqklZlzd6nEG+418HzEaFFDgPT7nBhNBwEFY641fiGJonepo2r0QF5N
	soi7jPMvcH0Idd2tPZOgFsdt6+k/qxYj2eUtbbN3JZ/TeWhLzYkkYl2RC/w8Y2RDyAoS29KJn+4
	53/b2y2w62C/ldPINOjek1QD6pQvIi7mosnmiGwHsuS0KQQLIUtQiZK/UICcmXISVVcmU8WnHtx
	1tytT/VyFnR11+naEJu3VtF6HlfxsRrTOSjFnSP3QJzuO7k18wvUxFgv9brYFcm+Ek/DoMr7Yie
	lC+gjtUVFbW5WlSJrSXq1F3DBZF1nvKS9YvPXMR4DkgqfwUql18wD6/NgGqg/ndATU8CnYDu1HS
	7jVLMC7EXeCU29HmvuLhGMYVzpJbX3ttqafHNSs7iZv/y7jiGnyNqMrgP6/hvItGYgtZKwmzmmD
	AsnzkKKGO95wHrHbSoauNjf2IIeNkXqS5ErLje9aj3b5KpV1d2Jt0lNCOVpmODZzBcjUz7WyAzM
	Q==
X-Received: by 2002:a05:7022:b057:10b0:160:a80f:3ed2 with SMTP id a92af1059eb24-16a5dbfecb9mr26202339c88.10.1792085511888;
        Thu, 15 Oct 2026 10:31:51 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a5a305absm363860c88.7.2026.10.15.10.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:31:50 -0700 (PDT)
From: pdsj2807@gmail.com
To: andrii@kernel.org,
	eddyz87@gmail.com
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	memxor@gmail.com,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH] selftests/bpf: remove unused duration variable
Date: Thu, 15 Oct 2026 23:01:39 +0530
Message-ID: <20261015173142.1361483-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

The duration variable in cgroup_attach_override.c is not referenced
anywhere in the file.

Remove the unused variable.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/cgroup_attach_override.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_attach_override.c b/tools/testing/selftests/bpf/prog_tests/cgroup_attach_override.c
index 9421a5b7f4e1..28a946e2a736 100644
--- a/tools/testing/selftests/bpf/prog_tests/cgroup_attach_override.c
+++ b/tools/testing/selftests/bpf/prog_tests/cgroup_attach_override.c
@@ -26,7 +26,6 @@ static int prog_load(int verdict)
 void serial_test_cgroup_attach_override(void)
 {
 	int drop_prog = -1, allow_prog = -1, foo = -1, bar = -1;
-	__u32 duration = 0;
 
 	allow_prog = prog_load(1);
 	if (CHECK(allow_prog < 0, "prog_load_allow",
-- 
2.43.0

