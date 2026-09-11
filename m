Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12790358D37
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102161; cv=none; b=mIIK+E8JZlHtbdp1QbxN3AgbRQYYrO6PVH67tUZ2caa5N3ZkQAy7gKguemI125CXoOsxYrm0Gg/UqYw8GoGy1DAvHo2fRqNKzyv8uw345UIysHzVV5nQyCzaJE71Zp1WyW/TK466ssS5OogZFTKMbmpRY+IfW4PTSVbtEX3mECc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102161; c=relaxed/simple;
	bh=3xaeQIQc2KaFjv0ggcS8pa3Y/EhOi0NFRXZLjn9IauA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rzSublOiFqFxwd00fvThKb3jK1vSge+qakkaldklktceCNCTuPUKQQbeLxJESAFRTWSLshdxKFfK3fBg7MulXgcK0cRriEUtAG9B0naHCj9sNxjp50JpmxdMew36T8lvxJ08bSmAa0SJM/LeckoBCWVKUhgxTZLQ42UrR+K+P1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rn4Yhu4q; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rn4Yhu4q"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caced6038eso5784015ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789102159; x=1789706959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShzPxubAIgCFioqA8zTb5jVlls4ez8Ik0Yod6CKj41U=;
        b=Rn4Yhu4qe0KoS/uQuWpXKcDP9tHxsRdEMEugdafehEVI4uqm1MIxRQ7vKd8ORwGzL2
         Ao0sXPKK5kIfl8hS1ul2aBKjsJCxlrdNCy5SMf/pxDKDcw375A5A+fSvEEKmi+xWE/d3
         MbufxkbO7/WGiVM5/8KiRPeYUUgT4xjgvQZb+EzDPthWeOwEGT6MvsU82Xr/XFEFObjF
         aMY7+ltK3BEw/G3+p/3EuhUUh9FJo1NoDc5xeQkZJ4GSddpze+V+09oBueGMV9MAwdTA
         B//qtLvL0hc+ZCPEN6HOdssMreejujIUgLQqZ3n6qb/5UuDuHAKfQldawkfjbhXOfcM6
         PtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789102159; x=1789706959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ShzPxubAIgCFioqA8zTb5jVlls4ez8Ik0Yod6CKj41U=;
        b=rE8O2Cctfw5ou5K6vX/S8ioKjenzMekR5F9VDChdGv0d8SPrOwuHCyBHnB8TqljcMU
         +oYedt0fbZRCtSlDjkGIx0533aC35KoQjWXNS/dysqvaBp3TUWZ+106tXQ1bWmi6mWVI
         Z9cUMJPpFSaN5hZnelKMucb+/wErDwe2lcoyAGvYEem9JUIXm1AmAZWYTKrwoj7mtHrc
         zHbB9w+5Cf2pcIx/Qol88yW+VzzvwU8ls/AK3jUjunxXScGaOvRAcHqm8keWuNJ3RtSb
         o9GIgZfwrRTpk6u44OpiE+pgcg73fyDG8uHi83jWb3l4yV+6gS+Kdt3DzKqSDKom2gK6
         AFxA==
X-Forwarded-Encrypted: i=1; AKwUvBxmFOkCCxtnFQ2Lxpqt1YyZVTCatpHO8fUMAqpaU3sTzrJ+0aNXf/t/93ClxNAlzz9hdD2hYnt99pEpxyI=@vger.kernel.org
X-Gm-Message-State: AFuF++lGjE0XCtEId5pDZlOLzk1Pywlm47Oq/v3I9bzkKzlJ6zHquKzE
	9mUxCVSRdCaGuT3FGsbKRvYnfbfANiSyatVL6vTZumj3mkHuKu8dFwAg
X-Gm-Gg: AYBFou2cKmaRygPOeDFWmB/KzDBjEoMNKss0oyTTIdaoPAAMNWRXTOKb/+BFV2d0mId
	p35uvpun9raTvolR+oNSdg4J5F0rSJwDt9ttxYNtr35lyywWNRtwtV8dfDG6t3IDCX7RZ7nh2yy
	Wfke2mxEqGIZ2WBK4Nyg41G1piDffZ2dvbSuUIaqQ+SS6MvtxzpgJQgzYCiord1msdcRKWjoDc1
	KeKcvg0qb8d9A9R7faOOqRFQXTv+lNDmc10I1/KltZKSjjpz30HvPW/ymmU5aUMY53sAtaNijd4
	BHqmt1MpzXpMJe5nu3bf0ER86eipDwYHiz/ZyXzrxuSdTYaoy4XV2ySL75Y2C3zoXyIFDU1TsGw
	XRd90uiTvH57ov2yIwL1n52fqEE8evjnILEdfGJsRyJ+hZlNaH00bBV61Lz03oLiI6hpAlcSMG7
	+Z77E9uzd2jdFN9hF8U9gxlK6999wJqU2T63BhrNb/DIu4z9EtRnrSDMlk/NF49qzGNmmY8JVec
	4gGiP+hpgq3m8zutG7OxsTe9vYdqBWCotlqfDjg4exRkJnEY1tjPoEpBUWlPO+pTaDIb/v/
X-Received: by 2002:a17:903:f83:b0:2d9:2ff6:246e with SMTP id d9443c01a7336-2dd0eecb344mr80244625ad.23.1789102159392;
        Thu, 10 Sep 2026 21:49:19 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f1e434sm2883077eec.22.2026.09.10.21.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:49:18 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v4 2/3] KVM: selftests: Enable kvm_create_max_vcpus test for powerpc
Date: Fri, 11 Sep 2026 10:18:53 +0530
Message-Id: <506a93b99fedcdeda87bb4a9dc520c358b7acebb.1789097569.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1789097569.git.ritesh.list@gmail.com>
References: <cover.1789097569.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

powerpc's maximum permitted vCPU ID depends on the VM's SMT mode, and
the maximum reported by KVM_CAP_MAX_VCPU_ID exceeds a simple non-SMT
VM's limit.

The powerpc KVM selftest port uses non-SMT VMs, so add a workaround
to the kvm_create_max_vcpus test case to limit vCPU IDs to
KVM_CAP_MAX_VCPUS on powerpc.
This patch allows us to skip the vCPU ID test when running on PowerPC
with SMT support, in which case system topology is encoded into the vCPU
ID, and so a VM can't use the full advertised vCPU ID range without
crafting a valid platform specific topology.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 tools/testing/selftests/kvm/kvm_create_max_vcpus.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/kvm_create_max_vcpus.c b/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
index c5310736ed06..59ddc3757943 100644
--- a/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
+++ b/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
@@ -58,7 +58,13 @@ int main(int argc, char *argv[])

 	test_vcpu_creation(0, kvm_max_vcpus);

-	if (kvm_max_vcpu_id > kvm_max_vcpus)
+	/*
+	 * Skip the vCPU ID test when running on PowerPC with SMT support, in
+	 * which case system topology is encoded into the vCPU ID, and so a VM
+	 * can't use the full advertised vCPU ID range without crafting a valid
+	 * platform specific topology.
+	 */
+	if (kvm_max_vcpu_id > kvm_max_vcpus && !kvm_check_cap(KVM_CAP_PPC_SMT))
 		test_vcpu_creation(
 			kvm_max_vcpu_id - kvm_max_vcpus, kvm_max_vcpus);

--
2.39.5

