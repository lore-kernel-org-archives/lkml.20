Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355904;
	b=DiOEXzQEcuni9sSTnn7Qucva/8T3SdmXI9AFLCRWaZAo+g66hpT9OGxgocei2tdxlETT
	 QA/XWFE63YFhV7qKAsxDqINosvGdxZkWhme50lWbBlU1J+AP3KCOxgAh9Z1itlrkYVJNg
	 At6VENjAXhWxFT91QqXZOU9LDKEHmg0VnbbiFQe8Oaf1T6VKjJuPSyt8kHx086vVt9wSx
	 aEZAsQyqybrx7ikTtPFp3ubSEqhBMZg1GfQNERsm+XT916b6q61HRhFpvRrKDlZqwY35J
	 t2UrWjEGuCWyDC3GU+vVn+0X51K7/wuZkzO7jyE/XjCq3vFoQfjd6rFvRJe7Xd9LuUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HuBbZFfmsbv55VA2uPYkZzZXFL/PczYYekIANInBKXc=;
	b=Mi4HV2vxXripns4Y09n5GBuWDU+8LoJnsYlKRXjoTQHfM/F8q+wqckJ8LpPOqaY4sDWD
	 fmwMLeRf+kdTt4N1fBwKtQnOZ9LE8cZ3/Ft+dYkf37eN5J9GeDCZnr+EDgUZSJi9eTLfa
	 oFGrL/uOkP6GmZpBCsERyO3lhr9cY57fTkYTpqPfmfuPeFTEHzOpi7wbFvdhdRFSfbHrQ
	 ZAGJELAVq+k7HTiNCSSQ86eaGRGGwMUA15+F1WOfQssmYaBYPuIVmW4O0PjQOGHEuuKNH
	 +YKI4M5+1gVTQR1X1Y2igSjxxOymIa4KIDFhcXYI8ArDp6OWKKH8f047yMnXOExI9Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WH0pUumP;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23BB606A337
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D23BB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WH0pUumP
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so4671725e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793355902; x=1793960702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HuBbZFfmsbv55VA2uPYkZzZXFL/PczYYekIANInBKXc=;
        b=WH0pUumP62m2FpRN4el6/yxdfGNl6glm5dxHyT+PoslYBKWOtwcJZzUidXa1s9ElUq
         qn1+gtJ7p95+v3ARiB3mG6GmGabemikbRTCdSf1o1O4+HIOPPKJjggFWO+qISQ9gc3LR
         2d/yqhS2Kc+wtTOMgsKflInybDn50AEl2qGkstwRej3nPe/Tolo7I8opj7HH8t10966f
         qBAT0U8U1LWx80j5U58927Z68iCE39qwPzWmiONerj6wzT24q/w9E7mwq1zdWFQd5FVV
         z1skikCAaCh+iEXLa9Iz+0xv99Tx20Dg0J0NH+Z/T1cPSm4OEowrHSfTiM4z0CHIKU72
         wcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355902; x=1793960702;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuBbZFfmsbv55VA2uPYkZzZXFL/PczYYekIANInBKXc=;
        b=BBc7Y+70qJn9NeoScZUUTJRw2cdjoex4mVcpUN909QvW4EAQybgYZy2F9YwJPZ6/DW
         wYe6QNn/iL1M+WQsSb8mim978WkmQhQchvlIOU5g18W2gbIjyGmWv6VOL4eqQdYlYyqh
         1E5xGeLk4MwZJ1sk+4v8jZX+EFwu5nGqb7afTZy8tL+EJt1M1nqB2Ylli1BxD1YCt9SK
         +gOOljCbkwYx2XUY2VJAcxhB5jnUKlu2rZfRlv5CyTSNXipVkxhjVDK9cV/icDTsIjSS
         /7J5+tq+EFCw/5kb83ql5qLOYgLcChsu/5DoieBbzyB4vdbV3QlhBb5AVbYqOXac2YMm
         6ttg==
X-Forwarded-Encrypted: i=1; AKwUvBxvjDsiU+mvR14LFRivdVUWdniKNwLTYkNX4wCtojDUs5S2xOfbnSzGetIPPI9wwEPOV2U++CezC0xRr/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUIV1slSd8dBmYEKJdYa+frDCRElBSNf8fgvB6uNkznejr+fDe
	NtPMFRJw8RSGrQKjbAp5Oi2u0B74c1anvrZkJS56kczRREKo644KOgYo
X-Gm-Gg: AYBFou0vUOeJ2pnccxgvtcCAEHPOjr5jTOqy4tTetusuZUr5CoDotVySIQlGsZqkbXM
	1pmw+CTYJMPW2A03V6ByiMNt+bb98idDBdNaffz9Gurra3KNCB7QnFBmdz2rPzNjmBwFEhbgLzA
	PtrLAKXmFr0wqKAv+5GdSPCgPd4z7B5NPboup0qO7mBeOU6kpLnU3dg3luAJtnbqrR+CXfBHGjt
	N89YlpB3PYoPUNyYUjY8AKLxpjVrxv3POVl8JIIiIYH9CkicpTHjT5bzU+O/ZX/iIBPKP5jCi39
	RLLL+CSO2KsA8kQw0FlOo63ANJSyy8QW+Rv8ciz4NEgvlrwEon/6R4V3KHR9hdlpKxbf5vmLr51
	EfLY71pTOnvROxnccdJbQWCsgQ1KUqH0q8NzZlrs0pq+1Hm6c8b8oyvpzyJLnrZ/uEG52LdhHTs
	5pfEMbLGphAXV6dfKy/oW6jqhEl3NHfN4aH/aXajHiyWqjNdXrEc3eR9CEECHw84iJrAdo7YnOv
	Kx6yj48ODz+jpzrDGenw5IPJyZC2X2c6+ee6r0P/DJ3duk3QhfuMNi5ebQa0qri6/o7+Yq0pvHt
	dClTz/XuFVJa+7Gk0nxSSV1bKNJioM9y+SdD+FzJHuwQStrt9wXOJQ==
X-Received: by 2002:a05:600c:19d3:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ac1209eafcmr39549955e9.0.1793355902258;
        Fri, 30 Oct 2026 03:25:02 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm143295135e9.11.2026.10.30.03.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:25:02 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: linux-security-module@vger.kernel.org,
	Dwi Siswanto <me@dw1.io>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] selftests/landlock: Test that layering does not break refer
Date: Fri, 30 Oct 2026 11:24:09 +0100
Message-ID: <20261030102411.12985-3-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030102411.12985-1-gnoack3000@gmail.com>
References: <20261030102411.12985-1-gnoack3000@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
 tools/testing/selftests/landlock/fs_test.c | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 6e979cef884d..c319bcea1437 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -2619,6 +2619,45 @@ TEST_F_FORK(layout1, refer_denied_by_default4)
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

