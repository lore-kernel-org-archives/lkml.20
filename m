Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8991E2DE70D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 03:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791172080; cv=none; b=XlfpimP6DCLOye2YOIEnzkxzsTpgrokzoE4EdKThjz9eVmRGg/uv1ntTAPaQN8jRbKqS9+MEzeu4u6XReERrcFf91m0SydWPWLWEumw9mP9UcBkLXX+IvLY14n04I2m1U2c7hlvZSiCV6Vyhq/LzTA0340UqwTwB/fjk0EvJL0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791172080; c=relaxed/simple;
	bh=6K0x5TLULsGiDePBL5sXyC+y3q6f1TV2jirLnbU54ys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cFZengdImE3ONqM5j9rbWF29PMjobbkfn0Cc/11YKwSqWSUz7nvX04SF87aMAKZvk1A6fIcO04d0ERb1tvRELy4gL9i7bHXVpweeuEAihcRla8fp69ZdZRrRNl0AxW/uIAxHJ1XBSnvWVNIv9tWEZ3NbR6xNFMHi0Tt8QRjJCLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3g+dv3A; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3g+dv3A"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so3957711eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 20:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791172078; x=1791776878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1SCblXYMeeDfQwJe65yiAdl+ST+ro3b/dUm5JimbFA=;
        b=f3g+dv3A2I5pbNNLG5evyYZhFjfoHf0TaeAT7jZGIhD3S2AkN20+AaqdMC3iRmrlPO
         y5PAEgldTrnzoyC5xnitkfoErAwSjVC60bJBXD1EqwVgi6ClfiDozNd6woXt1CRPk8OZ
         37zhS4lGCS2eBov9f+ZdEo8mSHn20IOMXM1VaGI1udBWQHvcSahy5/NOZG8hr7lipG4I
         oupBS/ugZSVgtxJREhDwG+bBgpVdNSb5T40+6gu+efPQwHZbyDMmS//DIYFM5dnuQQz0
         /wrTNuOIYWhbJyAFffMgWZOHVXr2Iw9s2i6+OwTDVWq3EigazMXYdVMiGq5F+3JxXeAY
         IA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791172078; x=1791776878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1SCblXYMeeDfQwJe65yiAdl+ST+ro3b/dUm5JimbFA=;
        b=lChJYirjGY+N/cJhb4tqG0AifWb+4K6wtiRXdskCEDxDEWaDoEImYVwIjmLY/9suYQ
         Kr61YDCeANJnHAQsqHAoo5mijWcRA4k+tKu1QH5I44fXQ3/JIhv07ncvWizpH9Fv0QTn
         j8EQRJfbr+/n+7aL6xfQBndrsyAdk1urCEEMdspFJqQFwkH/yvgRMlzbDOz6cRKa4SMq
         /pn3Lsx3FURrL8P6HWHQYIzUVSr/b2L5Pt/PW1Pt7UrAI4uHz5nhU37bG8ItIkWza8gC
         xArz0nxU3PA1VuWEdzvY+n+H051wscZ1XmFSL36pzGBPnZs6OKrQmTaY4TgLFj/rljkK
         RuaA==
X-Forwarded-Encrypted: i=1; AKwUvByO4p5RlK0D3XVadH4AT8NYT/Sk2jNoAUxCDhd4m4IrIJjWcUsUA5eNWGYNUr5aVQYSCaXQqTnWAgfWpCI=@vger.kernel.org
X-Gm-Message-State: AFuF++lK74WYVY0jiu8fK/wou2QuNQhY2a7svBhxC8ZqfHwaHfUCTT2y
	yaT89TwTuuBAWee4CQ/jISOVdTKChKg1VmQxSid/OL4EBzV2D+huSza3
X-Gm-Gg: AYBFou08HEAALESVwDCLtB0kHIVPiFzA7gNvCl9ek2t/cvS/y55/0uLf6zi7/bp/Jco
	Hp2k5DCVIC5ORf/qtIzslofSjM4QlrFZvZD6yRpmYcc69mocDpaiiqhhR3WAyGkhc4SHLw1fa9l
	4B/cpmUOXHOxxdsUarHclToauQsHOrSyjpwwSEjrbSGFTqvZIEr7/DiC/cOZsNkPdV0gbvzkS5s
	esOsF0nel0u+vUkHGwJdSQxFtF6JKvWo0mYbYma7cLV7kZpZmY3kdDFLltRxNbFkl6wclgcUsX+
	9SwOnuZ/oQYpRSarffQvw87TkZXplBXbI4d6Qombon0Ag4oyX2e5gVk/mWnMt5r/AHQEhQPPVNP
	gQRXMwYOLeXnpqgffd9p7Olj30Fs/PQqHF2ic+3Zq+/AQdbpRe5NP+16atB5PPjgG0fn6qkG5RS
	ht3CFrhSYJxyaFRLF5ERScz+VU20a0/9AINkLOGb5gTShVp8xTnQEQKrg1icJujnfUQMDF46Ank
	Rqz2WEJvGyYs68CY+i9LE4Xa+Pj4RF8COcQRdsaAPuw8syjCKGCIvttK/tFXGllaBZLi7n8
X-Received: by 2002:a05:7300:8282:b0:340:9d9f:a5c with SMTP id 5a478bee46e88-351117064b9mr9289417eec.36.1791172077441;
        Sun, 04 Oct 2026 20:47:57 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718a18esm10840958eec.17.2026.10.04.20.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 20:47:56 -0700 (PDT)
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
Subject: [PATCH v6 3/5] KVM: PPC: selftests: Add helper for checking if running nested
Date: Mon,  5 Oct 2026 09:17:26 +0530
Message-Id: <2f57ae5266c12f34cb12d68c65abb643d2065ef4.1791014924.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1791014923.git.ritesh.list@gmail.com>
References: <cover.1791014923.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

access_tracking_perf_test needs detection if we are running nested guests.
This adds the needed helper.

Tested-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 tools/testing/selftests/kvm/include/powerpc/processor.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/powerpc/processor.h b/tools/testing/selftests/kvm/include/powerpc/processor.h
index f0ee21a8e2d4..a46f6828991c 100644
--- a/tools/testing/selftests/kvm/include/powerpc/processor.h
+++ b/tools/testing/selftests/kvm/include/powerpc/processor.h
@@ -6,6 +6,8 @@
 #define SELFTEST_KVM_PROCESSOR_H
 
 #include <linux/compiler.h>
+#include <unistd.h>
+
 #include "ppc_asm.h"
 #include "kvm_util_types.h"
 
@@ -36,4 +38,9 @@ static inline void cpu_relax(void)
 	asm volatile("" ::: "memory");
 }
 
+static inline bool is_pseries_lpar(void)
+{
+	return !access("/proc/device-tree/rtas/ibm,hypertas-functions", F_OK);
+}
+
 #endif
-- 
2.39.5

