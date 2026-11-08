Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169467;
	b=fFtmw3SbJlOdUANmewgeZOIZhPq5fwoIBfqMcJjMHcAZcQuEI3ChmFSqz7kBGb2TuQ/I
	 yb9Jar4K+Qa6KxwRrtSCu20UcJqrKrXt0wyUWx/X+hLthimFysjJ5YLINTIU2muHsjtpf
	 ErJIvW2cfLvZKs0xOQFj8peSyNny9zS1w4lSKnSg1ucBMiqaaR94q6OZK/F+uCXLc1nIj
	 kc+TFvEaH60z0T/7oWSGXpv74NfHN6nlxH5ezJZos7QudXzjpmUDOcByBfvDX/zUYxzzX
	 rhG7/rpJN0+aAm7vV5jj2Twgi7oEz8P1DIOqwUtpvDG/sOllGTwCQVVhO195Xsumddw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=q0L5KoeSSJ9JnTFnKpazoYgvFNGkegOX+bYFdABwfpw=;
	b=tf2ieHV1KEeLHXdMqVCZMgLiGZxbMUQ2IUVoJ8CrHrLLkyh5xo/JN1VRP2uANHy2Ju9D
	 1aK7OYli5GzYXpQUlBwtTM34bNpdlAGwq7JGBysD2MM8thn9ZX/QRKiuuXgJEIeDYxXfF
	 llaZOLfCp+Pv/t3gdNTIw70yYWX+XSoGux+cQqJOeJYU3hLqfw5UAnB8zg9CgNJA+btp5
	 hTk+zLDoKvH0r5ORa7vvaIGp7rr8HqVE3Nae60KgWD6UhOP0Lk0jRiFprhJSOyI16bEVT
	 dz5kz18eamMp1tGHZLi9u8Po4+0QV25Bf6nZxeS8wEBGq7oKYUH8w8GPzZkg66opJOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OcHNMHbe;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32071607A77B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32071607A77B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OcHNMHbe
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a215e64962so2550475e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794169465; x=1794774265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0L5KoeSSJ9JnTFnKpazoYgvFNGkegOX+bYFdABwfpw=;
        b=OcHNMHbe6+Tr5tBKj3Gx21HnsTCetKKcEAwi0Rw2V8sch6vR/a4C4Q8Q612oZhdRqJ
         N2b0PjiuTqdulkbxYXlm+LU/nj1FHo+cE6x1xsGSPg7diqZpRa2ZfPr6YpcOnNJRhW9r
         fiCZKxy0bzcDpqhU+9fsgtTevyNyR/YxIw1snxETcUqb6NHsydLgd9kaf2w0dmrOayS1
         Y2ev+T2O8QZh2vpgnAtekOkOhmSQMcEhZExKkupYfRTlVo4U1yI6wXJOR0uthiUY9MZ4
         2HVhWDhKoQs0eUfz2cT87I+XMeEAFqleexf/f1VZMnjnX/oLxZcIS5BLlw/0YkR830I6
         At9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794169465; x=1794774265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0L5KoeSSJ9JnTFnKpazoYgvFNGkegOX+bYFdABwfpw=;
        b=ASeJckTQLSE0TR5HiS07sOv0PbHm/vRACw6PEYnbzUsGQrfrTTmzByVNpKPMhqJ4C5
         TTv4ekD59Mp/OrICpTlvCPP2P5Fw4ptmzU6DZUd180ZLHN/ZrpdKFk5yUzXHy6V6GBMD
         RLmc0eip62FeK6rTUPId7TraloC4rc+165rptuYVGFZRHDIi05oVsOWVMzByWUlitsCc
         0pZb8u/V+1oQl/tksGogHwmqRq6PKVQE1m94GE4/ktHMIbNsYp4nFxaG6AjoeQ66PcJ6
         vdroTZ9+p7kKMP9fb8GYksxT9hkB5eq2SKvJmuamyQwiUoMf0+JNWgv3+LH5vjB7LG8M
         Zf+A==
X-Forwarded-Encrypted: i=1; AL+hErG0b+Dr0EqGo/P0bgUncn33hYx4zmLmFvSa3+VaUYQTawK67OZDz4FFz5N3rKJiWO7JPblC5NLh3DgUEJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z90/R3urmBqKTlo9hLT0gJDpJ0P8bFmNggsAYzxg1jBhCU6tHoO
	Zq4sd5pJ4AduwBel2kftZ2+3bHgUJT5XGhVbrV/+lQNL3OecZtzV7ZW/
X-Gm-Gg: AYBFou2W0NQgIG+uLIJDBR5xGVrUITH5ZGab9jTo34WY/e8OaLXhu7mKcs5j76p09y3
	9Z5DZzZbKz98+UFjf+SLdNUxVYnbCmPlb63mdEjKv1ECvbh7awKOiIwwkkzCvO2F8m7wCkwq8h4
	SIsye9BgSQ1ap2aMFIhciIVvKhXDKjLDz1B5fsxygsgdrpgmljUS77WaparFrPNTSUnEbZSbx3f
	kHEDjwDx7YMKdw71aWzhettVJgK/P/1x6c+rY/p4ZQSSwkDB9ksXi0F6BA25mb/WGpVhw8agzwq
	/nfL0OnCY+L+En1RI2k0yQQV0vDKRb8oPePrQ6W3rzgsh/k36N9tCD+7FSfdDvqKD3Lq/jODT4C
	YRuRo4xgSAqU2+taBIi1Nqqzfpu5Wce+TI/HNyUJrLzUTouKclHiYhjY4DGwy/sgsSHVzkPLZn8
	hmdAOWYiXk7sNZ58RK4DdjxzlHEZGavE3Aeym2RG4qwaIiQO6ARWrJmxJ23FDKZBjtG2cAEWGxE
	ZGAmzeXOQPNkCbRcFBSA2ZbCNZ+OCKtL0T62NtyaMR7mBNxcRN2j/Tht6JFdGye2R0zy+peBnka
	yf7Gv9poducjC2hObuEuvUFEmwfz19IvMe34X801fmMFeU3N6AT67A==
X-Received: by 2002:a05:600c:811b:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4b94d7632b5mr38260125e9.4.1794169465512;
        Sun, 08 Nov 2026 12:24:25 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90619bc91sm80029115e9.2.2026.11.08.12.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:24:25 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Sun, 08 Nov 2026 21:23:49 +0100
Subject: [PATCH v2 2/4] selftests/landlock: Test that layering does not
 break refer
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261108-b4-landlock-refer-nonfs-layer-v2-2-2b405fc1b3aa@gmail.com>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
In-Reply-To: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Regression test to exercise that layered Landlock domains do not
accidentally deny the LANDLOCK_ACCESS_FS_REFER access right.  This
used to be the case when layering a non-filesystem ruleset with a
filesystem-enforcing ruleset.  In that case, REFER operations that
would have been allowed for the individual rulesets would get denied
when layering the same rulesets.

Link: https://github.com/landlock-lsm/linux/issues/67
Link: https://github.com/landlock-lsm/go-landlock/issues/66
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index f725882fa4a7..b92cb988a39f 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -2612,6 +2612,45 @@ TEST_F_FORK(layout1, refer_denied_by_default4)
 				layer_dir_s1d1_refer);
 }
 
+/*
+ * Regression test for layered domains: The two enforced Landlock layers both do
+ * not restrict the tested "refer" operations on their own, so they should also
+ * not restrict them when they are layered.
+ */
+static void test_layering_does_not_break_refer(
+	struct __test_metadata *const _metadata,
+	const struct landlock_ruleset_attr *const non_fs_attr)
+{
+	ASSERT_EQ(0, unlink(file1_s1d2));
+
+	enforce_fs(_metadata, LANDLOCK_ACCESS_FS_REFER, layer_dir_s1d1_refer);
+
+	drop_access_rights(_metadata, non_fs_attr);
+
+	EXPECT_EQ(0, test_rename(file1_s1d1, file1_s1d2));
+	EXPECT_EQ(0, test_rename(file1_s1d2, file1_s1d1));
+	EXPECT_EQ(0, test_exchange(file2_s1d1, file2_s1d2));
+	EXPECT_EQ(0, test_exchange(file2_s1d2, file2_s1d1));
+}
+
+TEST_F_FORK(layout1, layering_with_net_does_not_break_refer)
+{
+	const struct landlock_ruleset_attr attr = {
+		.handled_access_net = LANDLOCK_ACCESS_NET_BIND_TCP,
+	};
+
+	test_layering_does_not_break_refer(_metadata, &attr);
+}
+
+TEST_F_FORK(layout1, layering_with_scoped_does_not_break_refer)
+{
+	const struct landlock_ruleset_attr attr = {
+		.scoped = LANDLOCK_SCOPE_SIGNAL,
+	};
+
+	test_layering_does_not_break_refer(_metadata, &attr);
+}
+
 /*
  * Tests walking through a denied root mount.
  */

-- 
2.56.0

