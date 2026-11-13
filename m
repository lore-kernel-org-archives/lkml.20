Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601441;
	b=gW72/CZvtMhIkoggx7l3AdMD1Joipnrl9hNbNBwzy8swhFWCYfLSGVkXC0NutFYbkG4c
	 alNeOohP0qdavuSd9sDWJ3e8bQae+VO20bU77qmLgzO3RN07dz5lHiLW3GXgJQxclUUsj
	 2shUwzTdHqFSIKySBpWqNycGQXeg+gkUUIbtd0F+7R3rzCL5iqVe4NRg3aoWHmDBMejPo
	 6ACJhw50HLW/rcmD6jTEMkodvTGg3LmzWdjTy6xsJWeLhRUr51xZJF2oJ+ndOSq8EiaJ7
	 z6o7y4qeNq+4o70QjKn6StKXxJpwPa/4ohYFKsj4OurL/mUh/SkRSMNR9dxtPkchA8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=u7Jx9B4XiDyCzWqvWYy2iq25I09vd8jKOKtiPXq+9CY=;
	b=NuqaPdBeYHwdgeb2Pe2ayvgI/KqTxtmUerkL4SkLYq9mYEHhYX94r4HNDYMHJ+BSwKqP
	 hU1YknpgMGyjkKao+jMH3GzXqr8v5R2ksJlDzn/lLCA8sThve+cN/qbnfAbw7SltMbxik
	 GqhmwM9x86higrjzzysLN1GkSGFW4N72IIXy/RwsIkbVDeuj1PsHL6K/6srJ2uXT3FaKA
	 OoA2ftSttpkx/LNY2lgZg7wkIobdzqPZG5wRA5mjgOEfcOV/yF+GMAQKCNHqkGpZOymPt
	 0822Y+i5+NwCx7QRheSV/RGvzeb4G8KvwmAxssVUTkUmcy2EpwjQA6CAUk4CzO35uSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpsjCMtm;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82A8606A89F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B82A8606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpsjCMtm
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so11109885e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601439; x=1795206239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7Jx9B4XiDyCzWqvWYy2iq25I09vd8jKOKtiPXq+9CY=;
        b=YpsjCMtmCYEgPWqV+30pK7N1ZmgaoyTqGauBzlwfhSeCNLAGr2JTsjyWcQwjkuerTf
         oOqJ7kKIeDc9RxClm6MskoSOOKlqrF+a6tAbWaxr2DQH+czdaqrPCJrqgS/uLRYPUNW9
         gDHVaqqcR/PGNSQ9ksVsLEl2AsFk4Aluv6F/s7lsfpncTSnPHdKriiLafjotRrTFqSoM
         /NAoNribSHaasKcrbhYO40bnHctgDriSDtrWTAaOnrzH99oYgWVz2nfRk4s/ZeveY2md
         UYRM+1ujFTkHSmf3BxiL5udVKNgpihild2wK5OeTyCdBnjxDd9YTvkiY/8HF+UVyywhL
         OsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601439; x=1795206239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7Jx9B4XiDyCzWqvWYy2iq25I09vd8jKOKtiPXq+9CY=;
        b=DzXD8NIg8cgnnyXZ6T9fClkqDFGkg30CCry53NmMerKfv5bsiqPH2IMVF/sTMdGGXq
         jgF1GbBa8tB/Vxrc66gNlop8xP5v/my8k4fiF0iGoTTFY1DvtHbV4zwXtV0YB72vFw6D
         PvQTN0xOEnkhpJkT4lr4qydWAqxTp1/Xp42MByz7WYqbvdo1A1mkZtCrLKO1W2+3gCO6
         fzU0Omk7A1dVl/lPu+wmHZrY8ADSo1SH49jlWoFeTCOA4yFswhfg4hlTnIPtn2jTDdIq
         S4rLQzG+LsnpgYBVMyH3uUReHSb2G7y7/3/Gj/eA390pBjaj/eEZEOTprQR+d5tHIw+C
         iCmg==
X-Forwarded-Encrypted: i=1; AL+hErFAQL0nci/OxB8jpPlfDbIZF7OI7h8yjOh6dedaTYcwuLczvua397IY+HCsqa6+SdBANTRyctVMQdWKfD0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jXwC1DtTOlyS7X/6U0xPngxUry/a2+UbkNqNwsljQMtBs1t1d
	iITgkcdzj8dQxy2noVJ7ebAKYhxrbpZgUhJiUqK/ajOlZKyMRq9v7cLq
X-Gm-Gg: AYBFou0616tg9ZyS/WEfdre6vlwsD/seHUTzaGZbaHq3G+uQzK//kPkztloA+TnmQEl
	8GkbMUy46ZgCUguEUs0lLeKAaS04SRt//mx4jIPm02M5gOa90dVFnLPNEKAU6n39SRuPa4AKN2Q
	O2G5ijxnOj1e6Vv9eSiZV/c2vZpCEv3ICPnT9wwasBJVuB9NqwQBQ3np3pzwrJaI5uF/KzDxcKd
	KVvFx+MtmnM91irLRKR6mZohlLUB1HMGR0D3Plm111R6cIz7zrw92mgwmUTN7x9q8nDOAOxNi6S
	6CkcVPL8tc5kb9vW6Jm/PeCk8FsNoTRG+okwAZoPJOLBSw6OlU5x7SjmyQ8CpH4jEQzd9bgzlqL
	9fnzPQtuXjZKs2LOijvEvuQTRB4cB/Y+orlnHfaH2XJdlR4AUM4/NwAqOGKhD/0QiBPIh4WraPC
	igSfjgXvGpwX2bbeHo2sLScdCrHM6rzCT1fXS3TiX6uO7nAUvveuPI+4+BLBXfG6eGvzdo6kuZX
	e6kKCBcOZC9WLZmv9ghkr36ZmK908/kQilR30fvEOxF05Y7mUvMb5fhZ6zcvO1Px381GdZexcPc
	AuYqrXM2hKrM7b4oFyJol6DedQ7h3sX0ySas3myTCmMU0AoeGDAZvA==
X-Received: by 2002:a7b:ce9a:0:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb55a911aemr55129645e9.28.1794601438992;
        Fri, 13 Nov 2026 12:23:58 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb566a4a2csm46505365e9.0.2026.11.13.12.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:23:58 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Fri, 13 Nov 2026 21:23:25 +0100
Subject: [PATCH v3 3/5] selftests/landlock: Test that layering does not
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
Message-Id: <20261113-b4-landlock-refer-nonfs-layer-v3-3-02d7e42bcdfd@gmail.com>
References: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
In-Reply-To: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, stable@vger.kernel.org, 
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
Fixes: fff69fb03dde ("landlock: Support network rules with TCP bind and connect")
Cc: stable@vger.kernel.org
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 54 ++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index f725882fa4a7..6d9baab0fae8 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -2612,6 +2612,60 @@ TEST_F_FORK(layout1, refer_denied_by_default4)
 				layer_dir_s1d1_refer);
 }
 
+/*
+ * Regression test for layered domains: The two enforced Landlock layers both do
+ * not restrict the tested "refer" operations on their own, so they should also
+ * not restrict them when they are layered, regardless of the layer order.
+ */
+static void test_layering_does_not_break_refer(
+	struct __test_metadata *const _metadata,
+	const struct landlock_ruleset_attr *const non_fs_attr,
+	const bool non_fs_first)
+{
+	ASSERT_EQ(0, unlink(file1_s1d2));
+
+	if (non_fs_first)
+		drop_access_rights(_metadata, non_fs_attr);
+
+	enforce_fs(_metadata, LANDLOCK_ACCESS_FS_REFER, layer_dir_s1d1_refer);
+
+	if (!non_fs_first)
+		drop_access_rights(_metadata, non_fs_attr);
+
+	EXPECT_EQ(0, test_rename(file1_s1d1, file1_s1d2));
+	EXPECT_EQ(0, test_rename(file1_s1d2, file1_s1d1));
+	EXPECT_EQ(0, test_exchange(file2_s1d1, file2_s1d2));
+	EXPECT_EQ(0, test_exchange(file2_s1d2, file2_s1d1));
+}
+
+static const struct landlock_ruleset_attr net_attr = {
+	.handled_access_net = LANDLOCK_ACCESS_NET_BIND_TCP,
+};
+
+static const struct landlock_ruleset_attr scoped_attr = {
+	.scoped = LANDLOCK_SCOPE_SIGNAL,
+};
+
+TEST_F_FORK(layout1, layering_fs_then_net_does_not_break_refer)
+{
+	test_layering_does_not_break_refer(_metadata, &net_attr, false);
+}
+
+TEST_F_FORK(layout1, layering_net_then_fs_does_not_break_refer)
+{
+	test_layering_does_not_break_refer(_metadata, &net_attr, true);
+}
+
+TEST_F_FORK(layout1, layering_fs_then_scoped_does_not_break_refer)
+{
+	test_layering_does_not_break_refer(_metadata, &scoped_attr, false);
+}
+
+TEST_F_FORK(layout1, layering_scoped_then_fs_does_not_break_refer)
+{
+	test_layering_does_not_break_refer(_metadata, &scoped_attr, true);
+}
+
 /*
  * Tests walking through a denied root mount.
  */

-- 
2.56.1

