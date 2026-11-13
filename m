Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546139;
	b=4QvNMk2mtM5FZuFQTE2tvDrth6Iwi7zMGTG6pmA7wMWfLVXqInnAqJV/TiiUy30eRNw3
	 /wr1YdU7MpWf55yUCZ0HROH4sfCbBd0T87y3OKzqYniw8s1/KDFhBZ6zfme1/F00jrZ/Y
	 MxGoS0Fl8zr6dKmLpcnbXbg9noThf9mVHVYpUa5UuDiZjn4UUttScyTs9mus0yc85JlWG
	 99C00YNzYV9Ph7DYqnsTaF2M1QgikFfx5gKYnkn02B1KWSAylh/nzfEuiActzyn037qIo
	 ydPE3QdssZX+fABJ4e0enaYR+WSkvCPY73iyhGrtl1lniyhRqQ8RI9Ym7g9qheaQzng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uA+jUbftI5pDBjLN7+76TgU0keQFPHitOz2GQ3zM0l8=;
	b=b4eyM74ves1EguaVnnCXARh5aQFmkyJBG/JSkvqzON8UqpNxYfVC9P95GD/bHAq3FUPs
	 qd96esJxL32qpWdfrpY4d4d8sQ6PYPoRu6V0VE7pQPiFQ7EXTW4JHt+a2hYj3r2D6RtzA
	 xoanj0nVmCWvDsBulIgAGl1N1UPhv2FCPCuvNBd+sTfDE7+s8y1SN+3HeTMpPvxToY2s7
	 jdhawqtmDj1teytPcbCjVaEf0/D0rS2/brBVNZj7aHOgL0oU4xPDHGFsQvQkOpla9eOr5
	 Gx2BbivOVdtW1LXmp7rI9YSeRMVjKqcCCNbymze3HAB8b47jny8at4AOE+4UuYbYLyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsUz1oS7;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B4F606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95B4F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsUz1oS7
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so1385110eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546138; x=1795150938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uA+jUbftI5pDBjLN7+76TgU0keQFPHitOz2GQ3zM0l8=;
        b=PsUz1oS7zQoJtPyHe8I0vGpf99X2b4rF0LkNX9qAph1x3unBt04wRnicmkiNE+EKVE
         BDKx2uueZtmIrmYSkBnr1L1Y6O5ex6dmgxnfwEbeTFXiYLAhoPzvaNp/9UOwRzEsKNcS
         8st0BeWwpq6zlD61hk4VWDDb/kHKdnqhC9ePQkcXe1+PnFcehMLhxwgrA4i9CE9dU38X
         OQXrUeqfMK5tTydtx43XYhAGEwePcCaDfs3oNc35hJFXGNprjXdjNYAhOqfXQ0+LH5sV
         eD7EEZw2mfWmpxWRf/jVL6DN3DqJ1sNIZ9wdIeoEvXoZoLXezvZeVdmrwoBWz3gQfMPz
         tFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546138; x=1795150938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uA+jUbftI5pDBjLN7+76TgU0keQFPHitOz2GQ3zM0l8=;
        b=UhxOnTJyqQqQQ4tX/Ebs00unWwioRZ+jmFBjudnjRauEBaLeCkJ9fcdBCe9qmjLGeL
         TU9hGQ52rFRCLipq+bVBl8eLE42WX952ZPSNY+dookwRTPmB6TUNN8PBgXiTo1FbvH4O
         hScCKFtB1xjoRAaUh7NYgy7HTawpJe/7HYkgJYcM7Ajcesre9cAdqazvG1EMabsqDMm3
         C46GubDlcD4FrI13xVDL4ymf/f+y3RBnkwrL626b24ZtaIkhNZdtIej4WbiMkCP6xB1w
         bYpcEvQtb6Cxkog/7kTF+0rj/eibfzuM5HdiuK/SdBRnVNk007XGDqj7J2CrIXwzJkFX
         D2jg==
X-Forwarded-Encrypted: i=1; AL+hErGefFF9l5Ad6t3HvhOGwpGsjOsGZ+1UNjhl8FOjQn64hTH1qws0QTpSNTF+sKK4iMYRdS/Doy6weJaj+U4=@vger.kernel.org
X-Gm-Message-State: APuU4Z804qsW1bBWe5tGTrvrttls4uNJz+/Pt7bUW5I7fARavVh31E7V
	kB1H5HMSfm6orQRoUrP7kHfit5tYfFi7GvpN3CjxnP3zY+sCLx/7HOdn
X-Gm-Gg: AYBFou1l+IN30KhUtLAyqXJdcKkLvQ3WpQDLu9E0C15U5BS8LGjbyZh8QHQ2AtibzTC
	CKJvLKukQ6bf30cSQI8CD8PA/T//vD/JTVl77kmcngUrw0o0LPm7Jg100UugeuCYQwHjHIUwnE/
	A2voFkfM1EnKktrGmY4x/JTQWPkvS1SPP8Rj6Q1qBOnkkCOkj2MPDORct8jxnTyyLaj5Sio2OIb
	+eJ7kNcfRshhO9WUg/MTQsv036VTFkctyE436t+oanSIewT8JUtJbqj9Oir/R3vGlvW+scP6jJR
	YsOW/D8z5rYVUhLJlJnAEe/cDwEtXUVMkvzTCxl5a6uGe3pJzpCAXPb8a+ruRGbpmWA3ADGCRrd
	Mntyjc3BebfmDR2JgfRqIZc/6JpU9UjGd3YwLLKceX2cMydA2mvbDe41ygPh+noIkmoQpkt07z4
	aUFyyEsetS5aR0MTz7aYoyHp3iWikGEG01FsF3EW4awcfcmfVXHLf4vBmmMk+7kfDOCsWr7In4f
	KLRvXPWDk56nQmo/BkAGbI0uzGpG4DD0/eR/LY3X7D6oNSuZZfVITSZZLFdfnD5H7faYnPU8qRp
	B48yK1mmnusq0xq7sd1aDAT0NDDNfwi0YzenRDk=
X-Received: by 2002:a05:693c:414c:10b0:369:9062:c392 with SMTP id 5a478bee46e88-379680cf511mr1413668eec.37.1794546137511;
        Thu, 12 Nov 2026 21:02:17 -0800 (PST)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm3328991eec.4.2026.11.12.21.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:02:16 -0800 (PST)
From: Priyanka Mani <priyankamani2100@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Dan Carpenter <dan@pereq.eu>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2] KVM: nSVM: Check full nested state size before writing to user buffer
Date: Fri, 13 Nov 2026 05:01:14 +0000
Message-ID: <75b8ccd5e278ce8f13bedeceb196f5b4ee9c5256.1794545500.git.priyankamani2100@gmail.com>
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

Move the size check to immediately before the first copy_to_user(), after
the header, including kvm_state.size, has been fully filled in, so that a
too-small buffer is rejected without writing anything to it, and so that
any future additions to the size are automatically covered by the check.

Fixes: cc440cdad5b7 ("KVM: nSVM: implement KVM_GET_NESTED_STATE and KVM_SET_NESTED_STATE")
Cc: stable@vger.kernel.org
Suggested-by: Dan Carpenter <dan@pereq.eu>
Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>
---

Notes:
    v2:
     - Move the user_data_size check to right before the first copy_to_user()
       instead of computing the size up front, so that future additions to
       kvm_state.size are covered automatically. [Dan, Sean]
     - Add Suggested-by: Dan Carpenter.
    
    v1: https://lore.kernel.org/all/57324d544da1e92cf3b30ff7c40595dfbca1933d.1794465097.git.priyankamani2100@gmail.com
    
    Tested on an AMD EPYC 7763 host by booting the patched kernel under QEMU
    (nested SVM) with KASAN and lockdep.  A reproducer enters L2, exits to
    userspace from L2 and calls KVM_GET_NESTED_STATE with
    size = sizeof(struct kvm_nested_state).  Without this patch, KVM writes
    4096 bytes past the 128-byte buffer before returning -E2BIG, or returns
    -EFAULT if the next page is unmapped.  With this patch, KVM returns
    -E2BIG and reports size = 4224 without writing to the buffer.
    
    KVM selftests nested_set_state_test, state_test, smm_test, hyperv_svm_test,
    svm_nested_vmcb12_gpa, svm_nested_pat_test and the other nested SVM tests
    give identical results with and without the patch.

 arch/x86/kvm/svm/nested.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 1cecb82702e2..229b8dff5506 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1916,9 +1916,6 @@ static int svm_get_nested_state(struct kvm_vcpu *vcpu,
 
 	svm = to_svm(vcpu);
 
-	if (user_data_size < kvm_state.size)
-		goto out;
-
 	/* First fill in the header and copy it out.  */
 	if (is_guest_mode(vcpu)) {
 		kvm_state.hdr.svm.vmcb_pa = svm->nested.vmcb12_gpa;
@@ -1935,6 +1932,9 @@ static int svm_get_nested_state(struct kvm_vcpu *vcpu,
 	if (gif_set(svm))
 		kvm_state.flags |= KVM_STATE_NESTED_GIF_SET;
 
+	if (user_data_size < kvm_state.size)
+		goto out;
+
 	if (copy_to_user(user_kvm_nested_state, &kvm_state, sizeof(kvm_state)))
 		return -EFAULT;
 

base-commit: cbe54fc3462b3949ab27b9ae81fb9ddb509040c7
-- 
2.43.0

