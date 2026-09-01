Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1906A476CE5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253751; cv=none; b=T6vZy1gPa+s9ABeBIIius47cJSupqCf7IeWDsa7vCIKO6KgEjO/vgCkOJAtP0KQGQVJZAIodz6kmZ4KQtHsGF98LfZ9blBmHpdUmZzUgHtP4S8cmQys5x/PMx51KZSCxGLo3Js7TQbPxzCjapG3UjI6w3fiygMzjIL4ys7Wn8vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253751; c=relaxed/simple;
	bh=t44TDabfynvpRhcL0vlUK37Vp9X/jS2Wp61Uvpjk0tk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IiB5o2hxfQWqT9Kkr85Jpc2R+KFcnzo3lmq7A5VHV2+8vWW1+NisOA69jM0YySq1nmj0FSUzOvyGpATcyCcqsfZSthIIn3ODSlPWF/w2wwY1ZNMt4hKK0HgeVWZ7iP3r8fI1AJE64DlWx5bU3oax+qIBzVSaEb3EuXkAigpJ30o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZVpImK9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZVpImK9"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d6efd73032so6690555ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788253746; x=1788858546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=znJKcoBec7Nt3FmFfze7QZZUuPfc93AsW2GJmhnrwiM=;
        b=iZVpImK9/OPnjiZTbR/Z5BJqo81BpH5759mHm2t9pJpkwo10GL3Yrqptk2wPZZW9pd
         MsByZmRnLoco0lUSAV2SBlTBNjab/zsDVbMMhJdzO31gW3OhFbRTEt89qsXbLClXHryR
         6ApkhsWUa3lqsiiH18RRcpemsy0dOli2km36gJEnu0I8Cu5z6Bh3LuCKsl7UNRqBkze9
         oYUYhRyLmOxU6Ihr1AUskEQrVKRfTYb6jw1/jG0GsNknSUtmE6niTJDq0m4XDqm2xlSn
         8ZSsIEGprYuhYVm1Zrrwt+fneB7AUzDkH3T8ILbBV75FE9MNTyyjlSYN1NYXhR4DO/nC
         xKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253746; x=1788858546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znJKcoBec7Nt3FmFfze7QZZUuPfc93AsW2GJmhnrwiM=;
        b=osRC2II0nFoPiZC41/IEkLkIdMsK9xRnq57BRcwW5Qf38HhWxeCpv2xgfCdqUbQ4YN
         7ZvKct+tZ3azHsb7/3/wM7FoEE2ekB/WvGWxzScCNATIBxOfoApaOar0VnOXHzSKQ4sr
         RfYfURFa8hV6MgTH6ktDWQNe7U0/W+Y9uRuVEyrDxVATe73U8eo7U/cBvLsfnNgGsEd/
         Ih2XuESwQi6L5pobxffH/I0E0vXXS7qbVI6kO1tbxrmFkaJIKoYi8ZfZ0oF+UaFlg+6b
         uHa21+52tri6fb63a3mLQ5hKDfLjriEVLVmK7wnrzYkH93QWFaUK37qlr8mopT+k2ono
         TfaA==
X-Forwarded-Encrypted: i=1; AHgh+RpQt/QkoR4uTbZrMM0EfHZICJDnRj5Izshy5ZPl7uzNI4CX6pvAcgIaYMwHXrwAEFrPJCYz5dlHOWHmNL0=@vger.kernel.org
X-Gm-Message-State: AFuF++liqKFPrj9ZV7WvbNH1bE/HxRcr4PmruIGdJ5cIdULaJ2RHDo2Y
	MTX7CgCfPRr71990vcRNnyWheBKLRYOVCcEJPQ5AYpjUkU3Le3rhZpbg
X-Gm-Gg: AR+sD11oskL3XraR2qSMKh0eksLGHxmhgMYIkfyMtWtirV5+gsF9MSPB8sVN5lGrEoj
	XDby4VeL5qpCB8vC8lbZGC5jmbEMiT5xpPYUwHcKe+/M7FAxTLp8paoRgFm6vgrLXfww7nUboMN
	9+ReFGbtdgi1caWSA+SpFwV9y+KcdFX+Jq9rHJ8HntsMbvYusze/0mLSZX740hMV1L9OMjRSwBG
	BnUoJWyDry3zUuJ5dWkVprXZD0m6y7M1+g7qmiqms0pbQktA9BGE1Y8lFLPaAIn/4x425dfTF8T
	ZtzuZfXxrmureo+ckHwiBDYhmoo8pSdVZgPdPuKE0BFFjxD8rkTdfe+LuCOEjZ16+Eqmgu6Ykza
	McLY2hqAMmWbEJVQJvTIiGekYHpBw3S5qDwbDGXhuKIbSAFf/f5Xq52ldnqHQJc4s4+sqq2d80R
	/Pbzp89GARoiIouME/i94k3p6OJryuJ3KvJfi+vMe/ITDiowHaSMyYy6vdWmxQ7br/Aorakib/M
	zj9pa4H3B/eCw==
X-Received: by 2002:a17:903:3d10:b0:2d7:5da6:2af4 with SMTP id d9443c01a7336-2d95268a8f7mr40737215ad.4.1788253746178;
        Tue, 01 Sep 2026 02:09:06 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bf283sm40042773eec.8.2026.09.01.02.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:09:05 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Ackerley Tng <ackerleytng@google.com>,
	David Matlack <dmatlack@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Josh Hilke <jrhilke@google.com>,
	Wu Fei <wu.fei9@sanechips.com.cn>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH] selftests: kvm: Check calloc() return in vcpu_get_reg_list()
Date: Tue,  1 Sep 2026 09:08:38 +0000
Message-ID: <20260901090839.3338955-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vcpu_get_reg_list() allocates reg_list with calloc() and immediately
dereferences it via reg_list->n without checking for allocation failure,
unlike every other allocation in this file which is guarded by
TEST_ASSERT(). If calloc() returns NULL the test crashes with a NULL
pointer dereference instead of a clean failure message.

Add the missing TEST_ASSERT() check.

Fixes: fd02029a9e01 ("KVM: selftests: Add aarch64 get-reg-list test")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9ddc047d5c27..d15f39900ed7 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1727,6 +1727,7 @@ struct kvm_reg_list *vcpu_get_reg_list(struct kvm_vcpu *vcpu)
 	TEST_ASSERT(ret == -1 && errno == E2BIG, "KVM_GET_REG_LIST n=0");
 
 	reg_list = calloc(1, sizeof(*reg_list) + reg_list_n.n * sizeof(__u64));
+	TEST_ASSERT(reg_list, "Failed to allocate reg_list");
 	reg_list->n = reg_list_n.n;
 	vcpu_ioctl(vcpu, KVM_GET_REG_LIST, reg_list);
 	return reg_list;
-- 
2.43.0

