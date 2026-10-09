Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8CE3E6392
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545550; cv=none; b=ANND4khCAExbLFg9lfGg7yfbJ2edEQMjP8ft3O7YzxC1NZj0d9V0hrBoIiSG0oO1uXfzuQHgvH/VRa9uJHC5tlf5smgEKdnBcUWE2AWp4LktKJQXuvOGegmBdskXHmxIOV4rHx2Lr+9KiS23c18qMlySOv4z2d4i8DZBr7xoqPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545550; c=relaxed/simple;
	bh=JOfTL5sJbEeKUPqnV8GkeCHd+99LXw7TYpKTV4o3L18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oLQr4hAOqalHymnm7CQmKpQ4bJW46cNqYVW0JXxGAc3bIQeJA3m+irlXFGAWewnQ6HIbrA3ZZlcGVsun1g00i6hbBC+jqTsq8p8vAjPniSpTKIdFGOdv21vhUJNsbDdMGWAFMTdzcpXN5LYQU2Cch2vkE6rxEoOK5ACnOEHmI/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/eXhsNR; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/eXhsNR"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-34c4a0868b6so5778084eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545540; x=1792150340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bMlxewub9p/T2xvh3MjzZ66gKld4I4neePTrZHO9Yw=;
        b=k/eXhsNR+usBjAXoyI5R3hSe/Tls1hLcb1FDLXE8BloAjRwR9NnUoowy4K0J4VaY+2
         IPRF1OHh048i2B2/zHyy39954hSnu+A3kkF0or0OgBdkM0uKwI55NE7bMBEpMKcfXhe7
         cmGrnX/2bKOTt1aSnJN8WvB9dFrf1iamKPwQyExe8oY3q+7kwg4ZpGSwj6sdsoASO7DT
         EmHK4dQTchqXroWSTorMQEm2sjx/tYbC2lvvBmNVIbUMhpLWhaSmKt6/w2vaCtwfiDoL
         wBcKmliggW4a54Ia3Fvbxj2fd/vhNmAWgk2yWuzwd+w/ybh/qjx7wEX1z8k9MmJQlLh1
         inSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545540; x=1792150340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bMlxewub9p/T2xvh3MjzZ66gKld4I4neePTrZHO9Yw=;
        b=yeq16a8I/q2rp1rKZ1B/LQjOm95ptgKXrYZzXFslHgDzVthYBuG9ci41KUnxLPsKAq
         ymJID+NQl7uA+/gWxv4dWau+Vs8zu1mk49bQnKci9AyWI9mWx8QFyfyg1BMdqFG+xzLT
         ywqy8573iYNKc2CY9Swy6O9ZNCSKrXE7LQVYVMwtPg72W1n5Mn4vJN5q2bYB9kNBSdXe
         SIHv3exL8F0RvphzUrcN0qx7rE9FvHpkBGde9UzVDCQI5Gf04b2AcImOV4VCPBOrjAZW
         g0agkJSwVRz7cWAoWi7VHLHCpZtmRlLI3jqh5Rrp5vCGjXJ8Qr//QxPSppsLyod0u6kj
         Kq4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzLiBAsti3+fIAgZoMpByNC5GClwihDLyAMmgaHYhISJiLeTeRz5jKeWFksNedMoGHaJjqr8GaktjZFw+g=@vger.kernel.org
X-Gm-Message-State: AFuF++ljXnCSMIz2fJB8l6GUX6l+Vrcdfph35DDAZ0uFllFQjBm24uEK
	tQCyc8geHPzpEQSC+HciAKdl+di5/d5W9tf8lUbnoesDbnQr57NtQ9/NIc0RbEqn
X-Gm-Gg: AYBFou1l99QSl+7rfX4oVvr1Qg8PjTE71XDWwhMGkTVSiNcdz0zmJEdfGpYNvFszBal
	Z8nSFdWCbAUv+MSt9eDoiRN0jZJWasXyjExXbcDShCumLhoCDoJQhqw+MUlf2KNjqTvJ8g8Af0q
	/sSelk30ORrZBnyKX0AEl3x/0JwvsT1arUtlfrxL3zBqGDEnuRzvZc5FOuLQLy6QyoPtBOeFKcO
	DI1VnCYiYHGtDdUr7i/yEfGZCBskT9b63mYcIYXQ035TddBnmZCD5caXMfTBie7ypNYJ7lUPzPR
	7eRq1mFDf/TgKT5BydotZ3dfTzRv5AFpStgqoeur9Qa+1MRWGETQySPMzOl2axhJgyw58YGuKSa
	uLnJ6Po9V4tqsf0QvQ/3OdN0gL6iUaX4QtJ47pe8RGIwnDix4toNSAHfZdAQfydL/hFFFDlnwtV
	Zr0SCZzGisj64sTTJf8yp1zj16vDqVwtlnFu9pvrx+1E8GwlJ7szqdNkPjf8VK7lTG7R299gnFo
	b2514y8
X-Received: by 2002:a05:7301:dd95:b0:353:58b7:b5fa with SMTP id 5a478bee46e88-3535f48136amr3132590eec.1.1791545539457;
        Fri, 09 Oct 2026 04:32:19 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm7529934eec.17.2026.10.09.04.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:32:19 -0700 (PDT)
From: Priyanka Mani <priyankamani2100@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <iorlov@amazon.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: selftests: Fix ndata size check in test_mmio_during_vectoring
Date: Fri,  9 Oct 2026 11:30:17 +0000
Message-ID: <eef6bc34bdf7391c5d3eb4b1ba5e97819e22ae8f.1791542392.git.priyankamani2100@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_mmio_during_vectoring() verifies that KVM reports the faulting GPA in
run->internal.data[3] when an emulated MMIO access occurs during event
vectoring.  kvm_prepare_event_vectoring_exit() always fills five entries
(info2, reason, info1, gpa, last_vmentry_cpu), i.e. internal.ndata is 5.

The test, however, checks "ndata != 4" before dereferencing data[3].  That
predicate does not actually validate the array size: it passes for ndata ==
3, where data[3] is out of bounds yet is read just below, and it spuriously
fails if ndata were ever exactly 4.  It only happens to work today because
KVM returns 5.

Assert the real expected size, ndata == 5, so that the subsequent data[3]
access is properly guarded and the test enforces the exit's contract.

Fixes: 62e41f6b4f36 ("KVM: selftests: Add test case for MMIO during vectoring on x86")
Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index dffe9654f45b..627ebc2ba024 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -606,7 +606,7 @@ static void test_mmio_during_vectoring(void)
 	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_INTERNAL_ERROR);
 	TEST_ASSERT(run->internal.suberror == KVM_INTERNAL_ERROR_DELIVERY_EV,
 		    "Unexpected suberror = %d", vcpu->run->internal.suberror);
-	TEST_ASSERT(run->internal.ndata != 4, "Unexpected internal error data array size = %d",
+	TEST_ASSERT(run->internal.ndata == 5, "Unexpected internal error data array size = %d",
 		    run->internal.ndata);
 
 	/* The reported GPA should be IDT base + offset of the GP vector */
-- 
2.43.0

