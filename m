Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC103DCD90
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427479; cv=none; b=JxMvesBV3Z/FkSissuBDzcuhP9tzaLdsG109ePr9zLn+CtJN2Qp70bft7M5x+TGSC5vIChuBLSC8L12mq86JnXSeNeYdh+sh7iTWBhmO98PHTcSux0etmqPyYPh3fHmNtuWV7xXuNUvFlmdhp93mo46UChlvp+v8JAK3Ub6dRAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427479; c=relaxed/simple;
	bh=OMk5IfOKNitwoHHoYng2gfX+pPOLJZRLCAX35DXDjic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r+v36Xzl5QVwCQV2iUnt63EvhAgaG2gYiJ/dV9ZMRjsxUeVk2NiklcbPWzcVqpOAcxAbiEZAHuwv1J0V30IcWEBASaPNEcPzXkKn75GFJSCdW2usOT+Irk7yyXafwKoGPCPhR30sQsUs1CVqkZd01iH4/orP8OgWsoJWXf2rRRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fo1as6SW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=J89iedbj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fo1as6SW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="J89iedbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788427476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pXqVj4qwlcwmsvlSmW6cZLvaTIljNaQVK5N+6FMUDdA=;
	b=fo1as6SWPYHrZLj1Nn1VoFpkiN7ZAZlNYcog8/ounHsD/qyKdUA9fwNDyV+JwIXn+nC8Nk
	OCXIC5us8qd9QFqIlvD5N87IGuAfJhdtwQ0j7RMrTwRYBlLLXc4GV2kAqeleG5HF5TTZuQ
	2Tzn/65DqjxBJwyvix0OdX33hSBnGKA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-G2mtYHBNNpuqtWJMPpwO1g-1; Thu, 03 Sep 2026 05:24:34 -0400
X-MC-Unique: G2mtYHBNNpuqtWJMPpwO1g-1
X-Mimecast-MFC-AGG-ID: G2mtYHBNNpuqtWJMPpwO1g_1788427474
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-482e729ead9so492873f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788427473; x=1789032273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pXqVj4qwlcwmsvlSmW6cZLvaTIljNaQVK5N+6FMUDdA=;
        b=J89iedbjI3m7n1y3i8BRZ2dyYXDm416VD3zvxTxCq51mvX6Ifao0TBvLGHJ2HGKXwR
         i4kpZiRNhVWzn8TM6eDBPZ2j2Pd1oF+9HZbTzii/zu+/rileDoWgwlKy/NbdSSPFqIz+
         mk70wfM8JJBbqkHxsMS4oeXyltixTiQf7YfjZifyNeC5xQ947reQdysKUXTbzRw7czLs
         mIXMClt7PQh/nFRjr/4YoMTt9nEVUUNHce8cd9Vukl+UXaPOYY8499mdLvoxoQ44Ro2o
         XiobM0R86Tk/OxzB7V3WALvRfZdwvcH6SyxctfSQkg/bRNyqqfFbezZs5cmjx8CrlXDJ
         JlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427473; x=1789032273;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXqVj4qwlcwmsvlSmW6cZLvaTIljNaQVK5N+6FMUDdA=;
        b=knEinwa1wxwOvTBLXMSO7nOxTtMtJc9Mac4yy+MndLVRAoPeILnqVFMy2KAz0EqklI
         h/Y+EoTOgUu7T/NmK1QZOR6OMnUFO1VuARO/PrbPCV4hDVTwYp0lbPrM7LGtwWbU3kiJ
         Q+tHs+ic9kyjbeCjl6nIYfqWNBoz4J/PLjr7VLWs5gUd7TYNtZbPMExU4JDtRGqryYFK
         5O9gvLQu45rmxPu6qpT2fDh5JnmCOeXTt1P2h73firkld21i1RaNbKDtTXQi8x2nKu97
         ttrjC2JVucRLp/Piw5lPWsyuOTnhkcnGV5AM8YYfSTw7sBTzIWx+klwjThVVuoQqLj5z
         iD1A==
X-Gm-Message-State: AFuF++mL7cdUoZz0fx+lmsArMVCZVt4F0gn7HLGpKd8EHSQDQysLyjU6
	5WlN3202sL2R0SOHX+ZfYcR04EFyWyaoVZw6O25eOD0sCCbQUu+OLWdU4mqVNdfq8vTbsq/EKcF
	7XLGOVTFmHY1JYrarpzPNNLPCZFKMuspSoYVO66hvS2lMiLC3dpSGgxJR/VnHFFOYRg==
X-Gm-Gg: AYBFou1fG7EJ7rjEJU9FFTvYfqcGOA3kX+6O4GH0UkllVhts83W/ERy5Jqsg49D++Fm
	u2vtUPWm8VUoJ/Rsf+/55Pw88xA0JM+JFPjZ8M4yt6y8zC7KW+4as6NHQqHnZGJtk07au1iwWHa
	ht7EedeQqk8nyvy0eZJ4FIqxvH8ix0fOUwsmCEwNeKOGnx0FrkPvwxrXrUt1s2FfJNkJlkFrCy2
	+Vg85sGmvZj14tecdPFIcqlsRowOGx4MSzUVKqcd6kUz6X2epZYIdqTPfcel0id3fQFO59lxzso
	GVzk50EvXWHiMfQqNb64J7dYcysQbu7nLBpLy5eaLiqCMjalWsh3QZcWwvm7XF1qdKa2xUaICsI
	Pl7kvgP/id7OjQsRxjFA8Tef5PkU=
X-Received: by 2002:a05:6000:4022:b0:481:4f2a:bdb0 with SMTP id ffacd0b85a97d-48488f1b90bmr18495820f8f.18.1788427473466;
        Thu, 03 Sep 2026 02:24:33 -0700 (PDT)
X-Received: by 2002:a05:6000:4022:b0:481:4f2a:bdb0 with SMTP id ffacd0b85a97d-48488f1b90bmr18495748f8f.18.1788427473089;
        Thu, 03 Sep 2026 02:24:33 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (alrua-x1.borgediget.toke.dk. [2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea961sm12516411f8f.28.2026.09.03.02.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:24:32 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 906D897C7EE; Thu, 03 Sep 2026 11:24:31 +0200 (CEST)
From: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org
Subject: [PATCH bpf-next 2/4] selftests/bpf: Add assertions for bpf_program__{add,clear}_flags()
Date: Thu,  3 Sep 2026 11:24:09 +0200
Message-ID: <20260903092416.223294-2-toke@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903092416.223294-1-toke@redhat.com>
References: <20260903092416.223294-1-toke@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add assertions that round-tripping through bpf_program__add_flags() and
bpf_program__clear_flags() ends up with the original flags value.
Arbitrarily add these to the kernel_flag test prog since that's where
we're already checking for the bpf_program__flags() value (and the test
name contains "flag").

Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
 .../selftests/bpf/prog_tests/kernel_flag.c    | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/kernel_flag.c b/tools/testing/selftests/bpf/prog_tests/kernel_flag.c
index 25eb59f460ab..72c0ef8da409 100644
--- a/tools/testing/selftests/bpf/prog_tests/kernel_flag.c
+++ b/tools/testing/selftests/bpf/prog_tests/kernel_flag.c
@@ -10,15 +10,31 @@ void test_kernel_flag(void)
 	struct test_kernel_flag *lsm_skel;
 	struct kfunc_call_test *skel = NULL;
 	struct kfunc_call_test_lskel *lskel = NULL;
+	struct bpf_program *prog;
+	__u32 flags;
 	int ret;
 
-	lsm_skel = test_kernel_flag__open_and_load();
+	lsm_skel = test_kernel_flag__open();
 	if (!ASSERT_OK_PTR(lsm_skel, "lsm_skel"))
 		return;
 
-	ASSERT_EQ(bpf_program__flags(lsm_skel->progs.bpf) & BPF_F_SLEEPABLE,
+	prog = lsm_skel->progs.bpf;
+	flags = bpf_program__flags(prog);
+	ASSERT_EQ(flags & BPF_F_SLEEPABLE,
 		  BPF_F_SLEEPABLE, "sleepable in program flags");
 
+	ret = bpf_program__add_flags(prog, BPF_F_ANY_ALIGNMENT);
+	ASSERT_OK(ret, "bpf_program__add_flags ret");
+	ASSERT_EQ(bpf_program__flags(prog), flags | BPF_F_ANY_ALIGNMENT,
+		  "bpf_program__add_flags value");
+
+	ret = bpf_program__clear_flags(prog, BPF_F_ANY_ALIGNMENT);
+	ASSERT_OK(ret, "bpf_program__clear_flags ret");
+	ASSERT_EQ(bpf_program__flags(prog), flags, "bpf_program__clear_flags value");
+
+	ret = test_kernel_flag__load(lsm_skel);
+	ASSERT_OK(ret, "test_kernel_flag__load");
+
 	lsm_skel->bss->monitored_tid = sys_gettid();
 
 	ret = test_kernel_flag__attach(lsm_skel);
-- 
2.55.0

