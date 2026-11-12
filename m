Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794465717;
	b=479WCro9wvWakR4oIc67evzc9wA+VBhhOL4a6h0vSgnCrX+svMiJWFc3lKGyiUDz20RQ
	 4VUZXtKBdTlsqFGWYGocBuLM99R/AQiI4hsRWF/3IkmqYxbKzfUbe/2VOKlUNd6HnnyBJ
	 X8z5JAMDcWcgVoRAkt2PGUEBOQSLG/kOTRncJu7E2Q1MdTgblp7551PcOB2P9LzX2U9mb
	 AKjzft31w4p40Xmf9dEO3ijI1FUN0Ijo8vDlAvOBLf7teYM5u4yPOYUA5NRQJxV43/+eJ
	 1e4i1sBIsl19xwxYgBzNuMVM+J9gwjKgI4BVFlU/FaAObl6USIDWzz5EIgOe3x/6Iig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794465717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JhjE2gc4HCfp4cOufnT59igJMtUPToCGKDk00xlKwCA=;
	b=g4zAo/mMq+/3zeFbVf0WuXGDHAXuIUfbVHI46P6i4fkLmDXh5aeXh/+HRCM7lMOprlX7
	 LNl1v8wQq0XsfOungPnBQz6Xv/b9bOlJhcw8mKtZ9XsG2O3f4n0T7eIXGu0nT71iJTS74
	 pWyt+dMCoEefZ75YZ2KzeGj1bzfC+D5W//6zEeKkXz3egPkXIjgwFkB+xzpyF+owmSBId
	 eZOocZ6y0EnB0PUvwNc/TpkX4iUnvaiRaSbRGCrrfhuuTTsXIEpru4TFG8xwmDX61dJCe
	 qct3vSxCTkDfX7LGE+EstFm/p96QMLYJC5NiNPXVh/eL0hTRqic1M5bMTOTEe9e7/hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VNVrijZa;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0336A606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0336A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VNVrijZa
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so4557051eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465716; x=1795070516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhjE2gc4HCfp4cOufnT59igJMtUPToCGKDk00xlKwCA=;
        b=VNVrijZacLMb1WaNLqUE6IG4SRphjBseYTkbf45k5znMbHA36aJScj+izsgxdeb37+
         ubshanwahK8YyhDvrrRp0LYP4R44zzpIuKUBDJY0T+d8pql6bMWNwLQMPO/GvBV897AU
         ZZpVSf+NBRmPwd5gCfkx0NXIZDiHasdKw2lZ+tRdyqX/rWcsq9vEJ7StTfrG5y9QooRE
         M06Hc8KOGxDUorJTDljJZT6KPEKdMxAjiBAxSkFyFEmVNmpPzBmZ7ll8QYlAX1p/F8Rh
         FS/BhjMWDsRsXEFhEwBK9MA1PyKR7+BtBCFJ0ZeS/fJVIXxogmjG4WjyHIpb16kWWWgm
         /Dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465716; x=1795070516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhjE2gc4HCfp4cOufnT59igJMtUPToCGKDk00xlKwCA=;
        b=bu7GsUwXm52qYefxxgAHo3Ysbvy+U7H9ZvYbl9MQuQhUDW8Ynbd716Z8SZmudjMqTa
         EcVpoBqPq0PmcDQvVUxx2YYjutb9owDqWoz7zNslFK+eaX6wIA2279gRyeekY5T0X66q
         1d8LF+kk9PNjIGWBs9SbRK+oNyZgFVFKJDruwEia+NUZfTzGPFPCFA/+ywkkWAfHpLBT
         xjSCzHba5V/6oNS0quK/zJ/HdaEhreRcF9SIEIoGdAP2p+nUmCaFgfmwf8KY2ivCYqnY
         +7DmX7cMNMSmHGwtYOCvjwLXeSZFIRZht2AGlpEdpxf3CDN6jDnSfns25hLYcOQq8xds
         RXew==
X-Forwarded-Encrypted: i=1; AL+hErFqv0hbVjYrlk6RIk3dIv4cm6Xekk6gGSUVEMkuhaT3zFY+99buMjKTz4ixbcleyqgFCDpcRzdwSUBiOTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6ax2+vLVCRtyteflbFqKWy2CjEX6JESLOd+tPR8TxhCksu0tT
	IiUgx3mc2xuVYITE/m3NlTqRHQ12EjoSH9shBit427IGwWMK0uNwThkF
X-Gm-Gg: AYBFou0I6tmZFu+AZZicYpSO336LIMghjw1J5zmsDPHl5erOwlscyuoSOgi2kA3hCAK
	Tcz1s6F0VIvWhqXrLMAEoE27xZARbhdTq9naD39kBQWmbaAlMGOU3a81WLTrPTnc5xSN3BzYZas
	iPvGuuPAuvXEdWSmOgUyzd/4+xuDvjgWQ9KzJZNdjbsnDdcBy4GLArN9VxN8esaJPi3aif678T2
	JQlC6o9aBLs5bPi8b0vU8Tv2KehrqScfa3uFm5T99yrL9r/bDxD5CI5lrhQXRiJElkv9CkRhtlT
	aWmcgEUwwqOkrAHleGj5d9i+qy5Bt3Xzoqz9gLXnn58/yr1EdDkWC/8z01H9lKHttd/9dmAB2OA
	JETB5X15PnCRvp0s9JZ7P7Xt7ClgfBLFvFm+ooW5E+mIWTLQ1cLEY+exaQgi3OiZS12r+Iw8aoQ
	e4qqc5QtgV+TzDjVZ9eb5MRvCuYVPJc31TurOXMo1wVp62GPb+KnxKfCr9GPY2RH3Qqr9yy1kp7
	TkRQZPKix4mN5VqeLQ7WEGpNf0318ASNH8z7p7PgBcU8Xrpb0GG139HpRtup9cvTnmJGjB+hDfx
	YNq014uE9DhmgH7qM30si2KZjnXrEipMXJT3JhU=
X-Received: by 2002:a05:7301:5f87:b0:377:678:2309 with SMTP id 5a478bee46e88-37706782738mr3563883eec.15.1794465715885;
        Wed, 11 Nov 2026 22:41:55 -0800 (PST)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm22055758eec.11.2026.11.11.22.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:41:55 -0800 (PST)
From: Priyanka Mani <priyankamani2100@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] KVM: nSVM: Check full nested state size before writing to user buffer
Date: Thu, 12 Nov 2026 06:41:43 +0000
Message-ID: <57324d544da1e92cf3b30ff7c40595dfbca1933d.1794465097.git.priyankamani2100@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

svm_get_nested_state() compares the userspace-provided buffer size against
kvm_state.size before adding KVM_STATE_NESTED_SVM_VMCB_SIZE for a vCPU that
is in guest mode.  When L2 is active and userspace passes a size that is
large enough for the header but too small for the vmcb12 payload, KVM thus
skips the early exit, copies out the header, clears and fills the full 4KiB
vmcb12 area past the end of the buffer described by userspace, and only
then does the caller notice that the returned size is larger than the
provided one and fail with -E2BIG.

As a result, KVM writes up to 4KiB beyond the buffer userspace said it
has, and if that memory isn't mapped, the ioctl fails with -EFAULT instead
of the documented -E2BIG without reporting the required size.

Compute the full size before the check, as vmx_get_nested_state() does, so
that a too-small buffer is rejected without writing anything to it.

Fixes: cc440cdad5b7 ("KVM: nSVM: implement KVM_GET_NESTED_STATE and KVM_SET_NESTED_STATE")
Cc: stable@vger.kernel.org
Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>
---
Tested on an AMD EPYC 7763 host by booting the patched kernel under QEMU
(nested SVM) with KASAN and lockdep.  A reproducer enters L2, exits to
userspace from L2 and calls KVM_GET_NESTED_STATE with
size = sizeof(struct kvm_nested_state).  Without this patch, KVM writes
4096 bytes past the 128-byte buffer before returning -E2BIG, or returns
-EFAULT if the next page is unmapped.  With this patch, KVM returns
-E2BIG and reports size = 4224 without writing to the buffer.

KVM selftests nested_set_state_test, state_test, smm_test, hyperv_svm_test,
svm_nested_vmcb12_gpa, svm_nested_pat_test and the other nested SVM tests
give identical results with and without the patch.  kvm-unit-tests' SVM
tests could not be run in this nested setup.  Not tested on Intel; the VMX
path is unchanged.

 arch/x86/kvm/svm/nested.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 1cecb82702e2..9a70136172f3 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1916,6 +1916,9 @@ static int svm_get_nested_state(struct kvm_vcpu *vcpu,
 
 	svm = to_svm(vcpu);
 
+	if (is_guest_mode(vcpu))
+		kvm_state.size += KVM_STATE_NESTED_SVM_VMCB_SIZE;
+
 	if (user_data_size < kvm_state.size)
 		goto out;
 
@@ -1925,7 +1928,6 @@ static int svm_get_nested_state(struct kvm_vcpu *vcpu,
 		kvm_state.hdr.svm.gpat = 0;
 		if (l2_has_separate_pat(vcpu))
 			kvm_state.hdr.svm.gpat = svm->vmcb->save.g_pat;
-		kvm_state.size += KVM_STATE_NESTED_SVM_VMCB_SIZE;
 		kvm_state.flags |= KVM_STATE_NESTED_GUEST_MODE;
 
 		if (vcpu->arch.nested_run_pending)

base-commit: cbe54fc3462b3949ab27b9ae81fb9ddb509040c7
-- 
2.43.0

