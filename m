Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98693E49D2
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282619; cv=none; b=diex1Ot/3ZLFkKPzG+agLzyqkInlOT+//MTuLdJ4EFGuS6tEJm92QzZHuVmz5gq+c3r0tlWen4paizrYbLzdUWLa1xPwVrRtSlNNJMgmtFptzyWWwAwdFI4bofOwJtjkyRvWcgRu/CVbZfjSOZyOcuZEJRI+6TNhdoDYlaLPtLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282619; c=relaxed/simple;
	bh=HMaTu5dap/in+IMb7xSYXgqwggJzp61fMmk5d6fvDHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n90V1uucg7RIoVm5Vm73SBLanE9CW9gTFdWvzguDt8UtkU7JqOOUKialQPPOmIIKag4StwT5DX9U6rHR4WZSp6FZkpGy3GA3rik2LCrCWKx8GF6x7l3gWT6ZV0Xo5Xh37Hu1fVeuep/RrEvwDjhVLTttLLQ6wcMx7tZitGhEfoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMyxJ/gM; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMyxJ/gM"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-31490970b97so647420eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282617; x=1791887417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2zCsQ/oYn3ghBOOGUriCrZuEtWUXY39VXZEGkJ0WUI=;
        b=iMyxJ/gMUv5Ce96D/YOn2Rdn8MRRxKSyXBDzVEaG64gmYj34pyQlaZmM6XBMgbwem+
         wp6CIL/Du1v5sflYThYJChNVq8dXmQQXo6YbKewV4S+gxsFNQ3DNZYeikxIWTKafom58
         DlGO82WtoSbfCj9H8g40ppuVjCuc9RdlEn3n6gXCLi5HBpSWlKNXRRD4zcBm+RSj1CND
         EvpKDTyKztq/44wjB4gFFLUJ3gmg6eXHa9csivrRBO5RMVGxBHAC9SGG2ZRjp8I8uR1D
         Wi3GdwqgWLAkViCrW+tXXYuKWY8WhowY8iwtEW8Ax3HNCLlCS2FilNjuKswPCxSdcrSn
         371A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282617; x=1791887417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2zCsQ/oYn3ghBOOGUriCrZuEtWUXY39VXZEGkJ0WUI=;
        b=LM8otC+UgkpVyQ1+b8I8mUmPiNBGXkniM7Mz9Lw9TBjhVv1KU6pfr8GDeiW3eSOM9G
         mFlUBg6V1zKtoAHKHgJTDQsXdnMw+3ghi44jB7PmftEIxv/S/7YybSWW1pBZgp+o47xW
         417XMxPxDyR4l7s6dRUSJ5yrwaJ5B+f99olZrPXUZCPAMnD/1rJqbJVRlrq2B5nMpaTb
         FKlptCc1M/wtSnRPPFcVH7ZtHBic0EObdXanZ9EPMmoLC9NL6XeFlX+mNRhakkkOw+BL
         NknOsYCiSNUqwcORXaqyjnZRH7KFFmlCR22WYdyH/YoKpYHmGdFInh1Ejda+i3qgYf9P
         VzZg==
X-Forwarded-Encrypted: i=1; AKwUvBzCYwwA7KFESomICDFpUuFetGtmL8Yxxy1Wp2i1/eMiaIsPW3WbAxw3Cf+UUZg3DNF5Z6G46C9K3Sb7xaE=@vger.kernel.org
X-Gm-Message-State: AFuF++nqFiB5B0w1Bk5tnzESBAJvzzJ0HCfMedXRBNGU3Fj5hm3UqBNx
	zbOfAdvEU5dpeZ8u3NZNJcvRUudZTehmu7p9aI19t53wS1mg3o/zWbfRb1kMm52W
X-Gm-Gg: AYBFou35lop9aDUGRaoJVPKoFlwkn9rUUOi8XXp7uKr4jYLXjgb5Tv+GFwoS7GdX6+3
	YX2P3M9Koo0mhlPQ338iWr+9nHcwRE4RuRrQyfX2dt+h5tBlyEu/I+HeK+rgq+qxcMxnNXHQKwf
	avapz5bax3mnGbmbJ1XYq0MMxDcYweIhZFRLRLlOU0y6bZypPx55yG10Msxi2ydJWor77B50yaI
	2PjM3rpEfev6adZPN7i4O8gTENCWVN1za//5VTM2cLvKPPO6Dbq2at+BMThTjPJBE29sfl7DFd0
	iNx2ZE0RO5stF1d/gx1+C+1lFINxAReKNFuJcvbiWaFRdgHEBVzSP/9JzqZEy8JpUY/6XHDCgSZ
	fxI7fCbO34wWnskl2fxEhPvg0HhjotuTbE+HOmUglHfpxOExzQCPglDhBmsiMK3/0Ua5HWaZf/6
	mHBUBpX7foHNEJQVdlBwkfY9nAl//wMtwwoV3bfDNJ0ebkZRlQcriVDksH1ljyU1j+lwlI8o15X
	J/6kp+S3DBgfMSfRrCS21rbxuot/1XFkUdk7EFK65fniJaqPTs9MYlqOZn+V9Qu1RFbY8A=
X-Received: by 2002:a05:7301:6790:b0:351:248d:d63b with SMTP id 5a478bee46e88-3514e2b30dbmr1487049eec.11.1791282616520;
        Tue, 06 Oct 2026 03:30:16 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469fa189sm7443970eec.6.2026.10.06.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:30:15 -0700 (PDT)
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
Subject: [PATCH v7 6/8] KVM: selftests: Skip kvm_create_max_vcpus on powerpc pseries LPAR
Date: Tue,  6 Oct 2026 15:58:40 +0530
Message-Id: <c8856b73b06bd4b44ff31e7454c8fc56dd402428.1791280439.git.ritesh.list@gmail.com>
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

On a PAPR LPAR, KVM_CREATE_VCPU is H_GUEST_CREATE_VCPU and
KVM_CAP_MAX_VCPUS is only the vcpuId range but is not a guarantee from
L0 i.e. because L0 Guest Management Space can be exhausted before that
many vCPUs exist, so creating MAX_VCPUS is not a valid assert.

So, skip the test when powerpc is pseries LPAR (running nested i.e.
ibm,hypertas-functions is present).

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 tools/testing/selftests/kvm/kvm_create_max_vcpus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/kvm_create_max_vcpus.c b/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
index 1b95027d41ba..22279c638d06 100644
--- a/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
+++ b/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
@@ -39,6 +39,12 @@ int main(int argc, char *argv[])
 	int kvm_max_vcpu_id = kvm_check_cap(KVM_CAP_MAX_VCPU_ID);
 	int kvm_max_vcpus = kvm_check_cap(KVM_CAP_MAX_VCPUS);
 
+	/*
+	 * PowerPC's PAPR L0 does not guarantee KVM_CAP_MAX_VCPUS when running
+	 * on pseries LPAR (nested kvm-on-powervm).
+	 */
+	TEST_REQUIRE(!kvm_is_ppc_pseries_lpar());
+
 	pr_info("KVM_CAP_MAX_VCPU_ID: %d\n", kvm_max_vcpu_id);
 	pr_info("KVM_CAP_MAX_VCPUS: %d\n", kvm_max_vcpus);
 
-- 
2.39.5

