Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658942;
	b=WyMYkQlfXgz7+QiiJknz9R7CYDQu8+hdE7mA+XFDLAcSKudYX2hWFZuP3pWKDgE37Xtz
	 LGnPJvKKGr0x1d5xgnUnpQMtFQGOS9O4fBNYLyd7OXWQWV3dxy6/npMgFSJXsdAqtb7Hb
	 jm+4x4BP5YidtPWNvmQkYNqvyiHB9IdmestWG7y6OxuidRYVgDlaXbncFr6lUL5wUA55K
	 xtqyRHLHJkRY2GNr9dhn7ScCNWDqgAavttKwMzF0iyZiIA5IrOYw1TIrNVa3DiIygRn1h
	 4xAoF6fInsZCCQTwLzRwc5VktubMw8Vi/MXLcFlYBJ/r7LQ5d7vjy9fQgbjVXLy6P0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=56F8g7Mv7DiOapm18g1wrka7Wgg9xFTAcIlGCMlZEmo=;
	b=GJRMb1wu3B+l8t1U8+c6W0NHMGsfVMcGaB1jAWrcI3WFOgAh/wWWxie4VYwYXkMphM3p
	 /vQ2XjnDVQY43gFN/ZEisZHYVMcVuDP5nYkmkmzHg/7bM0aH48ozAP/bs7UPUe0ptTl9W
	 n7fr3DFMr6jDS0q4Wx383YfHcOeh/BDA5UxCkSumWfAib8zDltnuWNAyiazgViAvT8gGD
	 or4aN/cwi712dDtawW6DAGpJx95ySbSThH7T+d4gMjmZUZxY65Z7iw4SQyFsdUHdcroAd
	 fyq1xl9g2JNvaT9rnnSwxdnuUUpYSymj+755VWkDxRSoPy4DnPIxOzNgSxPlD0POQ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KqvEMzoT;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A04460A261D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A04460A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KqvEMzoT
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2764516eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658940; x=1793263740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56F8g7Mv7DiOapm18g1wrka7Wgg9xFTAcIlGCMlZEmo=;
        b=KqvEMzoTtb28KuqtFbbWU+sfxJbpAPus7et3gw69bOMr4KMcDrvt8gV2nK08PFGy2M
         TeLBhAtTesCjBdXBxDzmjkeEZ+CZ+NSk5V1vXI6OqwrtlPHCJvKonKG+7uZNj8bCSS1M
         Q+zVGrihb1JB9pr9AuZM/t6MvkIvciTngBHxIYu71m3FE1N0Y5wQVik3scOnBAt3yEIi
         Q4wfuL9oiRDqSe82LqmrIwUPhao3GZm+2lb3uoZIQD2dltyBH5GbWGSC95+1rFo8SNIO
         vAzxIq+yrTFoLZ8O1ZjPYubaYKrxSvBpWlvb4fnr/busXJag567rwut85t0anfsTr0O1
         hBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658940; x=1793263740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56F8g7Mv7DiOapm18g1wrka7Wgg9xFTAcIlGCMlZEmo=;
        b=oe66bxCpo8cqde0HSSuDfeoCo32SosZRojdmsRLQ+gPJqMiI0n9pcpQH3mDQNZxh5d
         9lLFEexdZkNWZ7A2kpB8yhDS96NZ7VL9H9ztRo8/+hLnj96asIcHBABTVFMeAYSl4KJd
         3VWCPZ7JEOfz9alKQv+65dLEfoR4hZLSqrl5kKAi3vu/qJrULrsUGxGneeVtg9nkqe5M
         LuhEs90IagCYmAYgmyLecuYliVLYCblyQxRv/vAVUiHo0u8i2oAYJMb+99tUQYuobuV4
         85tUH3KgOF6GM/iJKxqsdC7mspLYu5UYvie6W4bWX1ljGcyjK10QmiTfAsld15l4dbCy
         rnGA==
X-Forwarded-Encrypted: i=1; AKwUvBw5MTjpZBJl2ImlENLG2ND1/XBFw2iDKCo8GpFKcdV+Q1z4Y8TFuF35CVf5R5MZ4c/bgX5N6jAw99H9HVg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXyc9VixfpCiqjL9LfM2acQud8dN8sEodqRfwJ6PX1ZF+b+DDn
	q1cBHMCRB892/8l38ptnUKfccfamDUk1B/Tv4vtnfKWaeq784ysgf+qI
X-Gm-Gg: AYBFou0hPIyxNRg8Z/HxrfK65bqRBIs3hxuurBxqGzlqvUl19Nnj3K6IM+aFUJFyfzf
	e6Ew7yoLBix7IA/JTaWOOeRBIvx9e04ChlA/tvt7931oRoJ6dzrhNJP5GnqAmHzd9CcfwxNtjie
	CKH01cfIZdwpYnsGHT+RciEQW91GPotKCWzWQEEDk9tZSInc/2c9Xfc1mWQonrMw95yamgV7tg4
	GRQmx2z7FVFjj9JlfMFiXSQYH1SGyKvqM1CGts4lYo9qQsRciK117G8P+PczUpJQHhUW5ZUJ53E
	GSfL/C6b+uzHnXWjj6dQCZTcEaMJWHJSU7kYxffoLnG7Eo0Jr6E58QSS1v8/wRgr3DLmwHP0l11
	98r4JUBA82Rc63BMUCtsiU29WIrLEG1Q1/grSVOcl6r6geABWdSPK+i8AyBe1vnb2oY6kpDKi66
	+EPt3N9ecDxFqcjEeUCBKHiNe+vAPUm1esjyQaLeVyvFLFPkAfDWLuYZabNZj0JC1aKgCksx9Sw
	uKcsy+n0uJrH4mCHEIuFI2VOkUCRjvP9ncwT59cnZQxBTohStQKMq8WgqHjJ5OWG/8NeHn5
X-Received: by 2002:a05:7301:2706:b0:353:5b04:8d19 with SMTP id 5a478bee46e88-3674c92e2d1mr6183474eec.9.1792658940316;
        Thu, 22 Oct 2026 01:49:00 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm13962472eec.21.2026.10.22.01.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:48:59 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 22 Oct 2026 16:48:39 +0800
Subject: [PATCH bpf-next v6 4/4] selftests/bpf: Wait for the struct_ops map
 to be freed in assoc_in_timer
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-4-2c0f18e82582@gmail.com>
References: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-0-2c0f18e82582@gmail.com>
In-Reply-To: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-0-2c0f18e82582@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

st_ops_assoc_in_timer_no_uref runs .test_1, which starts a timer to
call it again 500ms later, drops every reference to the struct_ops map,
and expects the timer callback to find no struct_ops associated with
its program anymore.

The association goes away only when the last reference to the map is
dropped. syscall_prog holds one through its own association and drops
it only when it is freed, in a work item after an RCU tasks trace grace
period. With other tests running in parallel, that can take longer than
500ms, and the callback still reaches the struct_ops and gets MAP_MAGIC
instead of -1.

Have the timer callback restart the timer until the map is gone, as it
does for st_ops_assoc_in_timer_free. Calling the struct_ops through the
association until then is safe, as the map is freed only after a grace
period that follows clearing the association.

st_ops_assoc_in_timer_no_uref run 100 times with test_progs -j32 running
in the background, on a KASAN kernel with the fix, x86_64 VM with 32
vCPUs, before and after this patch:

              before                       after
  outcome     2 of 100 failed (MAP_MAGIC)  0 of 100 failed (MAP_MAGIC)

Fixes: 0e841d19263a ("selftests/bpf: Test getting associated struct_ops in timer callback")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
index 6c85d368bf167..9b646d134a45e 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
@@ -188,7 +188,7 @@ static void run_st_ops_assoc_in_timer_no_uref(int timer_ns, int wait_map_free,
 
 static void test_st_ops_assoc_in_timer_no_uref(void)
 {
-	run_st_ops_assoc_in_timer_no_uref(500000000, 0, 0);
+	run_st_ops_assoc_in_timer_no_uref(500000000, 1, 0);
 }
 
 /*

-- 
2.43.0

