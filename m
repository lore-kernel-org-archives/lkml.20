Received: from mail-dl2-f32.google.com (mail-dl2-f32.google.com [74.125.229.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0648749E157
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101788; cv=none; b=s0LUdIPkDON4t0K6caUNw9tFyq7t3UDkAalrGZCoqqEFLZR0C8LaDOUVxHOwPLUGdoc2fnO3ko219pyBXxvjOMwB5KNU9IOLx7Ahwh1vDklrJbYX+78gB4/UXXn/DnJ4hNrP7Z5pcN+tObfJwAPlT40iftirQQjxmnRv3/2BPE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101788; c=relaxed/simple;
	bh=k/cS5EsQzwWWdG/s4MpHv4F471LkL6gXphxZFFDqj2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rc3WWgPjv8l83/dKnAgKIRqf5T7cAOD1Davu6GC3Gh+1eXisgaBGXaUfq82g/sWd+pAnE3+IqgLWtc3Sg7RZz+LET0aOHgAd+K8LSJ5e7w9egVHgU702AKyl6cAuN5Z+9rmsJp6LEGh4qFZMTCW/xFvg1Q+Fzzqz6W4x4DdOFbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLwVMlIg; arc=none smtp.client-ip=74.125.229.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLwVMlIg"
Received: by mail-dl2-f32.google.com with SMTP id a92af1059eb24-1437b77c274so70491c88.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101786; x=1790706586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWNx5fuW8O/XLl14TRTirLP01kUfwqrdwxvRgBlb4x4=;
        b=mLwVMlIgAxhRyLc8j1tGXv3aCHBPoDTaFAba3aHnyHaMCn1hWVWE+9qWV8GAmexolR
         3C6pkyxveSuL15DLEZu8OIw0gqDQcxZ8Ls/eOxeDxlC9KJMNdm7OuA2rkYl0+0v98vtb
         00Q04YrDdtemChgpraljzPcxb0SMwvMeyRWaJev891pVr5oIsfQ4ItZ0RL2aqGU0XgDh
         fXRDEeQQrpCyqHaAyUtLS64hXm+qkWm8n99jhCV4ge94YxfhYlR5m9AzuHcy+QUy4ou3
         MqSccS81KOVsXfSsU9BTTeTOEOGX+lSI1qT3kHnWyl/aRySa/HcLe8Ox0cjJeQHJqPn3
         1e3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101786; x=1790706586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWNx5fuW8O/XLl14TRTirLP01kUfwqrdwxvRgBlb4x4=;
        b=x/u/RaTVTyJYse0kBPjsCZDDOU/LZ+YOdjiT3B7c7Nm+ZhHAMXyLfw3tpTHzUub7Dd
         B8jsPE2fudA/Do2mby+LMxTkK5Pv3GxXk7drYMDYNtYekUBito6kcifImQojBYwnRW5o
         6oBQSX475fdRnWytrX99mP13BFIZWsO19IRvR5r7Y+JSa3YqI2S8s4nPf21hcQzziVoT
         fUiIvT+XZJdAogH8riA/Rc1Qwt5/d7qHHZ5rOlitDJet8ik/XGkNBhKPEW+49wcDHONm
         yyfgrxUYGBiN+ebjoYls/OjWLarMXTNEFHQPo3gOWNX3SOAIcRynbhsrQwFr1QmOE6Zo
         73lw==
X-Forwarded-Encrypted: i=1; AKwUvBxAWJaZQXPGufS5CpVeUW88Ev4A8i37iRkcgaSQAnhxiTaUCEiXLuwTStueiohexB9L+evryTrFA+S5ZLc=@vger.kernel.org
X-Gm-Message-State: AFuF++khr6Av8EwkGmBf55uAoj7YmwdOh2FAyM1CSWbfN2XRZOu/n1Lu
	yAYBLb3LIPOCdQUnGziPOwmc96ueGbCiKyIFdwg75/HYTTeswVvOVkTZ
X-Gm-Gg: AYBFou238CMW8e9/VugJ4VwbKDfktFQsUoNG8FWUGU+E/gVJzqhDCW8TJ8jxnTJs9s9
	NbIAAsumFH/79OG4Z2y4+i/OdaQ/dG6+yXWY6bdPu17vy3siIVtMXagSYoPf5hUt6aS7QFV3ftp
	PDD1eRJkIGcpWKIdkiz9xcjs/qzQ/7TBSJInsPG5GEOU2HTKF34D3GW577gFtMuVsOfcDuZatJk
	PZST2HeYhymeR65/iO/ZiS+VkpkBBmUvT6Dzpyb8EbHNsBO1ETAXHp1OYe8KCaiVGL2adfXW+HK
	9noZV2P5gJYlonye6lMzD6eYINH8GN2x9Z5VQ2SwN1/cOcK1kPpDbOk/0owQvgk+t+5amBCEwCp
	kmS2Dwr+bDOO/dz13J4sexV9yGEieSdrBdZKFCPrZfA+TFWGy5myXtUcqo95zYxxvU+AkP4JJ/5
	yCHkVypBspml37WnPLTMqK6JgqZ6lmO8rWB1eB2bsyqjxYbpNaisLX3cWSilDHvrUEe4Dx5gD0f
	s1vJB7KhcSfASvads4zlgsFKLU2/v9ZmMvoasSUc9V+WrKNwDN3z2jvDthL
X-Received: by 2002:a05:7022:2099:b0:143:7dea:f6a with SMTP id a92af1059eb24-144f91dd840mr209295c88.32.1790101786036;
        Tue, 22 Sep 2026 11:29:46 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdabcsm154315eec.3.2026.09.22.11.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:29:45 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
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
Subject: [PATCH v5 6/9] KVM: selftests: Limit the number of VM creates in hardware_disable_test
Date: Tue, 22 Sep 2026 23:58:50 +0530
Message-Id: <db32438dee67a69609e75d8c43cb070f021137b1.1790101179.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790101179.git.ritesh.list@gmail.com>
References: <cover.1790101179.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hardware_disable_test forks several VMs (NR_IERATIONS=512). This patch
limits that number to 4 when we know that we are running in constraint
host environment. The number 4 is just a safe minimum when
kvm_arch_vm_create_may_enomem() can be true.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 tools/testing/selftests/kvm/hardware_disable_test.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index 43a36ef3ead8..e90a17b8160e 100644
--- a/tools/testing/selftests/kvm/hardware_disable_test.c
+++ b/tools/testing/selftests/kvm/hardware_disable_test.c
@@ -20,6 +20,7 @@
 #define NR_VCPUS		4
 #define NR_SLEEPERS_PER_VCPU	16
 #define NR_ITERATIONS		512
+#define NR_ITERATIONS_LIMIT	4
 #define DELAY_US_MAX		2000
 
 static cpu_set_t threads_cpu_set;
@@ -127,7 +128,7 @@ void wait_for_child_setup(pid_t pid)
 int main(int argc, char **argv)
 {
 	cpu_set_t allowed_cpu_set;
-	int s, r, cpu, i;
+	int s, r, cpu, i, nr_iterations;
 	pid_t pid;
 
 	kvm_sched_getaffinity(0, sizeof(cpu_set_t), &allowed_cpu_set);
@@ -141,7 +142,9 @@ int main(int argc, char **argv)
 	sem = sem_open("vm_sem", O_CREAT | O_EXCL, 0644, 0);
 	sem_unlink("vm_sem");
 
-	for (i = 0; i < NR_ITERATIONS; ++i) {
+	nr_iterations = kvm_arch_vm_create_may_enomem() ? NR_ITERATIONS_LIMIT :
+							  NR_ITERATIONS;
+	for (i = 0; i < nr_iterations; ++i) {
 		pid = fork();
 		TEST_ASSERT(pid >= 0, "%s: unable to fork", __func__);
 		if (pid == 0)
-- 
2.39.5

