Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274B357EDA9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883491; cv=none; b=uIbVQCci5SHkKTUtGGXRwdcp2TsenQ5JPyWG8oIGUeRSdVgNhOgxKatT6DNqebIqx52urttK3nK48Mie9v6sXW8a4g8yrGHCjJc1agKdM6vzrt4hBZuZV9j2CfqtBn9hE6it7t+ft6CStEIGNU+Yfqg0rz6C9+yfQ2efnsuV7TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883491; c=relaxed/simple;
	bh=7yF6qk24zs7GwL8mnF2yvNXOoswzv1qxjksGdcX06Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iEi2Xp1mJqbWYqKU1bf75VfOjGHngXxp4ZypRtz3HAlPeui1lbp94VfHyuwPODT+HhhEDkZJHc7TB3xX8PXauODy3u/4pnSgcKAPqRH4OsEaeAdFSJEO0DMUjkhOAuvfT8gImblLDvJkcyxqaY5+nnb5PUqmENtyJ4q5QeBF1D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7e6KmEO; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7e6KmEO"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6aca0f482e5so5461588eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883488; x=1789488288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=51011n7DKhl5RNF5xzZ7n3Z9WFktYO/WAIKo41x7Fmw=;
        b=B7e6KmEOGoI5oH1WEdhVnVY/XNAOTTr+5LSR20Z1cmJQ0l5pzlmeI2lnFebs4ERsTa
         6oeXfLJT4AYN0dU2n68SG0Wma0ugfskJYTFvHfFUJPES/3JaniI0KKwv5Teia2SZc67N
         sitsywkjFvLQkVMgoxp6lcjTqTEZ4JND5QerY9FlYN3b7jg27UC9OQoTu2o7rPa1WpH3
         ZsIwTGdNjmxJVfgc5I5ompvksjsw86zXc1QDa44L0P9G+Dqz4d8bUAwZJJAFkDqFpN5K
         /dxBiBBTh4oKg8CI6MsEl/BVEKQIju+6j0bgt82MFgSANiALaKFMvT/CA1Va0q2cnVa+
         bBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883488; x=1789488288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51011n7DKhl5RNF5xzZ7n3Z9WFktYO/WAIKo41x7Fmw=;
        b=mouFA0U5BhzKSZq8G0N4oY160PBXa5+2JEcvKJLOw6NmVTPy7KrsEMo2SIEmJw5uUa
         qg6ywpUiSLxsFl8LQPfjJv60Npio8hsMOOzlM9CwrQZRMPB83ceTuJkhwb6ntAv0OxKE
         CKLkeBzaYoUB4fDihYEf2uRHxeny0WCQyAdFW1jROy4vWUHqpOmVk9N2wphB5L76X9TG
         10mK+eogyGlt+05+iQn3j5QD304SSeEX0IoautXS8U4QfAa++xPJL/vnvNaTxk7cTifa
         upGbhE87wkQ9IJIP9q641U0Nbuhsf7VVKOeT9ASwOJ1qsvh5FVVl/CKBDvZLab4mPVYJ
         p/vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyzv5cZq3YS54/ZZY2HezSB3WXWe90koUtu0mKvLxjoD3Vv2rluuoClUojHTIQ4RVA+GiIU5bg0JSiAd0=@vger.kernel.org
X-Gm-Message-State: AFuF++knh5YBF2rLkX+cptGha1jNpWxq8Aw0ye6YfEk4KRr2JoRdCvpr
	eCkR5PZXJlvJb2qincqm6AGPzwtHw/NnV/EPVP46qJF73ut5ArorZnIZ
X-Gm-Gg: AYBFou1XECRM6KhmBmxsX7lKwB2uY7FewEfWhyw75KWiR30+tqdGoXL/pexQVz2Q/pM
	lKfbKIPwUXL+oSsBt0LY269jFvtWudHyfSB0jVlsIoc7t7P3WpePEg7y68byTDo9id82fBVALhs
	BW/qvSmE3zMqE0PYIjzQ+bOpK1w+7ZO0Pml93bhJly3kxKVqpqAH6X+D1HicndnmKeDg2/KB/du
	+aQE3BRyVfRSfj4t5MPXkk5KHJWZlQm78aNRh7SBgk1rtAMowPP67fY4Ie1zyGyoiewUfcms/U9
	6F67Jfzevww+ueqi0+NT99ffgKP7/3JaMI75XqAdOT4A+rt4NbW7nhAfyxT6FCN/7RpVoQJRjYs
	yuXL2RHVQd0gx7BkQbpi83p5ZUr6E2HaniX05Q2HZ0B2UFehe5wLDczSrHvfp2KDCP20iobMryG
	jbUPB/oGT/BuC9SVgSvXnx9HQpT3Bf4hCPuAXJSixI2qRp4pqUon0RZuclSBQCKYXqYNEVWuN2v
	rhC/L2rnql9
X-Received: by 2002:a05:6820:2219:b0:6b7:8415:d77c with SMTP id 006d021491bc7-6b78415d829mr15051491eaf.39.1788883487843;
        Tue, 08 Sep 2026 09:04:47 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:3ef4:ec38:7826:6c9b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm14204525eec.3.2026.09.08.09.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:04:47 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	shuah@kernel.org
Cc: hpa@zytor.com,
	binbin.wu@linux.intel.com,
	kai.huang@intel.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v1 0/2] KVM: x86: cr8 reserved bit check
Date: Tue,  8 Sep 2026 23:04:24 +0700
Message-ID: <20260908160426.6547-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_is_valid_sregs() validates the incoming CR0, CR4, and efer values on
KVM_SET_SREGS but never checks CR8. When userspace passes a CR8 value with
any reserved bit [63:4] set, __set_sregs_common() forwards it to
kvm_set_cr8(), which rejects the reserved bits and returns early. That
return value is not checked, so the ioctl reports success while the
requested value is silently dropped, and a subsequent KVM_GET_SREGS then
returns a CR8 different from the one userspace believed it had written.

This was found by code inspection of kvm_is_valid_sregs() and confirmed
with the selftest added in patch 2.

Patch 1 factors the reserved-bit check into kvm_is_valid_cr8() and uses it
in both kvm_set_cr8() and kvm_is_valid_sregs() so that KVM_SET_SREGS
rejects reserved CR8 bits up front.

Patch 2 extends set_sregs_test to cover CR8: it verifies that bits [3:0]
can be set and read back, and that every reserved bit [63:4] is rejected
by KVM_SET_SREGS.

Testing
=======
Tested on an Intel host:
                              Unpatched kernel    Patched kernel
set_sregs_test CR8 case       FAIL                PASS
KVM x86 selftests             baseline            no regressions
kvm-unit-tests                baseline            no regressions

Tharit Tangkijwanichakul (2):
  KVM: x86: Reject reserved CR8 bits in KVM_SET_SREGS
  KVM: selftests: Add CR8 reserved-bit checks to set_sregs_test

 arch/x86/kvm/regs.c                              |  8 +++++++-
 tools/testing/selftests/kvm/x86/set_sregs_test.c | 12 ++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.53.0

