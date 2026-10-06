Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC83E7BA4
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282631; cv=none; b=k8P5yWWPi0mC/pN7jbO1Xskn5rzmAWwWZP5MYkFn0xSPwdkVcs+93cSUyz55Gu7jw9V0deJtennQeBSyf9HdCxzsVoIAzcL7XUbZYIy2o+6Xn+V3aPSU4ao7y1o1JBEHpeoqNoCfAUFIxRbxNXopDKi242Q6cKaaUGvWCtgcMUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282631; c=relaxed/simple;
	bh=uQmCMZwihw4Qw9mL/HHStendEYwoKyoVWYrwmVDy4n0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OeSFhfkT4LQsw5DRQI/m2g9n6efexeC0SLcHEFV5HExcwchPT4Lhi1CbeD5uFEed790xjHHAJkjvevob++CW88R+rwL3ZlObhIwxgHyUzHXDatihBWggJ9YN+1u5DIv12W+h+lzKCG4Qw+49qoleyQeK08tN+j9ZMqM6Y6ezi08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7CCoq3/; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7CCoq3/"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-34ceab2900eso536125eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282628; x=1791887428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EA/0ZEGZrte27R/NKRLHTW1lEfVA+wxAewcBQb4Z8UU=;
        b=F7CCoq3/mz+ZRKa+w2CJA30W+HqSXy25kQJxdYyuaxxJajZhI7bNezA7KrnvqZul/j
         xa0Ihe/cJoZHv/z84lKParXsSwlL7PQnTkgC60mq8n5QWO6qBdsdVzyibAlYbfL8cn2D
         ZxKLCrezDr1ERo6hKjTHQavTCEMqzQLr1NykYrYi1j676uCIKpmH87XJf62Rn3MZk4Ck
         pTnvw5QLLQrokGKvlNO3LS8cW8Pq1ELUV/Az6NCEROL90kZYFLU95g9q7+Q3G69kyVMi
         +HBV7G0ct+vnIJ27aSNBP2aeLMDsz1ThDv9WCKcVSbf7Cc0WvxPAY8agkSzu4MQryxlj
         Fh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282628; x=1791887428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EA/0ZEGZrte27R/NKRLHTW1lEfVA+wxAewcBQb4Z8UU=;
        b=nANssV2EYJMQlpqXzIif7MjdEHOaCnQ0n+cf6iwhFPmZcjUyaKYpOT8m4aAtl9l81W
         jcaJ7ICV9K7y9StrqZWbcDRuO3ArUoAnGh5bVUQY4im445E9DyL8Dzz8Rw9GxckBmlbB
         vJxCIqcVK5hD0N2KhZ5SIMlS8Dzlnr8Fo6LtXOdZy48vZys2xGCEP3BsD7HWRzJAkO/C
         XZJbCSslC0F6M0VzZAkqO48VDdQvG9gk8Cw1Jpem7dQDfMjee5JEsS/w4k3o+8SLGHbp
         F4E2C6ysLBJopdx9fipAf/dBsB0Sil8Bal2SjLy6NNvoJMKe2U1pzrLWghYyA5yIc4FU
         0tNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxveaDdg0mO4FSabb98eDUqi+T3QvQn84FG4VEwQEC32A7n/iSbPolHtZZ4rXKMwJ/YRjjDzlkMVblTz90=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtsR5eniT9MK+cZG8fIuCvllf91kEno11cgLad45nJGj+CWXqT
	NYrP5ULO33ccZH9QT6WSQFtN8AqgjKVfNNrXVVf7gWuYFp/mBIMiF7t+
X-Gm-Gg: AYBFou0/9h/S3hkPBvBnHasdnJEUzRPc6zn/CDIy3G6OLdPabaxDV4yKe/ZbtXXJNto
	x7c/KfrfUQnC/JvfTuIZGc93/O1AYr3mz/t4UAbMQtW+25jvCjlaC0ctI3n4D1K0xjwb+KOg4+F
	mJs7jL41UGdPQLlW97Q0q0QDefEdmGH3TGRCEL/0PVD529erzvFnmo6L4bPtjxpi8TFQwWZoGvY
	h4K9AUXEqHKpQLNXYvkn6uVqaWtBNFZYQQ484P4RZcUBoWtVJazhjdYXJT9e5V7oBzCW51i92Y6
	Yi/KwBdrwaBZwkw/sve7sKr0X4l7s8Dc4Y79szbgXCiUdWiCaMxjOnSzCFWocm1k/S5tBz0cCzu
	YPEJ3IDogAhsgA5ffQ8GUq4w2n8g8jdxsqQzH0LRKlczxCh5w8huGqviVvl/Bd8KlTTFdK8pf55
	XGgbwAv5bAdoxyf4hhzzXUPC4Ou9NXf4dOzlgpncMacfC7nHS2tVgOmclBBlJrkbMjkCSdGy7P+
	NtQjtmK75azQdQVV3VXgSkROXk/MDp66eI5AR0YZFK14O+9+B6eHvN5rUiE
X-Received: by 2002:a05:7300:a98e:b0:351:4648:3611 with SMTP id 5a478bee46e88-3514e334d5emr1545061eec.26.1791282627586;
        Tue, 06 Oct 2026 03:30:27 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469fa189sm7443970eec.6.2026.10.06.03.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:30:26 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: kvm@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v7 8/8] KVM: selftests: Skip hardware_disable_test on powerpc pseries LPAR
Date: Tue,  6 Oct 2026 15:58:42 +0530
Message-Id: <23f36aab5e9c849719ffeb796e1a74e69eb5d142.1791280439.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1791280439.git.ritesh.list@gmail.com>
References: <cover.1791280439.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test forks 512 children, each of which does KVM_CREATE_VM and then
SIGKILLs without waiting. On a PAPR LPAR that ioctl is H_GUEST_CREATE
and unreaped guests may still occupy L0 Guest Management Space, which
means create can fail with -ENOMEM error.
Hence, skip the test when we are running on powerpc pseries LPAR.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm            | 1 +
 tools/testing/selftests/kvm/hardware_disable_test.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 692bbae44a65..38c3900cac68 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -258,6 +258,7 @@ TEST_GEN_PROGS_loongarch += steal_time
 
 TEST_GEN_PROGS_powerpc = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_powerpc += access_tracking_perf_test
+TEST_GEN_PROGS_powerpc += hardware_disable_test
 
 SPLIT_TESTS += arch_timer
 SPLIT_TESTS += get-reg-list
diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index 43a36ef3ead8..0104b7e840b5 100644
--- a/tools/testing/selftests/kvm/hardware_disable_test.c
+++ b/tools/testing/selftests/kvm/hardware_disable_test.c
@@ -130,6 +130,9 @@ int main(int argc, char **argv)
 	int s, r, cpu, i;
 	pid_t pid;
 
+	/* PowerPC PAPR L0 cannot guarantee 512 overlapping H_GUEST_CREATE from fork+SIGKILL. */
+	TEST_REQUIRE(!kvm_is_ppc_pseries_lpar());
+
 	kvm_sched_getaffinity(0, sizeof(cpu_set_t), &allowed_cpu_set);
 
 	for (i = 0; i < NR_VCPUS && CPU_COUNT(&allowed_cpu_set); i++) {
-- 
2.39.5

