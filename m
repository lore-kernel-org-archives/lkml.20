Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A8148EBFE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101767; cv=none; b=LSj3zr8aIBgS3RY4dKX5uLRaZfBQ2PAbA2JcFRTdh9eZ9OB+Eh2VsqzJk4ZIMaKKJWZBP0sQqu1c1rRuBkUYip058/QZRISUDxyTfKc8lDF3bOXbCzId7EPp11PlnR4Qg9HiSf24yZ+TJBl5DIpYNBJ7G4w6idMDALHOijbX0tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101767; c=relaxed/simple;
	bh=VzWPPh2bCY861JFyY27bMmmD9NuIzarCZumP5A9xkto=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O41/OUevpYg6KVTeEXge/mGhhbmRCHojnG5TAwhlvaMAVV0eQkdmrC8Ggbxr0uZ+/fpOcK7/eoYqxvfm7hJkYPMpXBQjWLOgvfuZj6ZJ9x5m2kl1O6E4XtNI73xzfv2NNZXSPnUMitHDPtfUps2/XScr0aVxVSp93/La2Yhm+0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+T3sqEM; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+T3sqEM"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso87871eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101765; x=1790706565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShzPxubAIgCFioqA8zTb5jVlls4ez8Ik0Yod6CKj41U=;
        b=T+T3sqEMsHOFuyaJgkLJjcY/+zEht5X0TfQSM1dBBlrVCt8RdcgJOa3l9x42xk1Q+t
         7L/DftWnWkloyPZTy9bdUvo7bjhixX9dDAeu/K94kncIpYtILDgS1ZPDektHJfxhEaNE
         jem/jkfH8B/9GT6W40/wPAMLEDmaGsYVV86zstGwu9UfZMz9telAk0i5mUz6DN9iTuGg
         iLPUfJUFwNX8einA4Jc03myvYjrFPVVwOPN/yS9SGA4fQgGQdHC1R2ACjoUzIillgUOt
         mxDBAu+cmk15pPaCTOxx/WLokyg9z31XvpP3thJ0+4zFjy+dJliSOYArmC0HzCdS3L6T
         4ITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101765; x=1790706565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ShzPxubAIgCFioqA8zTb5jVlls4ez8Ik0Yod6CKj41U=;
        b=aUOdZ8/kKVsjty6YrrgY8MFSK7KycalxKHDurPRdj/6Ohj9hyMtr6ZujjrnI6wQ9iI
         D8LMDh0r/DU1w25nZ7QVo1wrxsNDtsRxaNq0aBkbWglsrRWxrYoMiexKrISQX4x4149Y
         /HaVB5GeYbu0V3l+KRNp0AiMk99SkiymqLl0aoYuhr27USqE4d3WcYhYWC6tqdJjjjBX
         /bmhSA5FhT6vh/fGj3PnNeNs/XjeRJAVCnkuqdke4FCOoCq4Pb9m2ndYEPovCGlqprtS
         WySdShttuGnNUE9OC0lecCTnDH7+Ym0h1QdSgseG2+mHzNPINkc/5bMnWIFMF0NICcuV
         WR+w==
X-Forwarded-Encrypted: i=1; AKwUvBwjHQl4fHp1tk0rpsZpy7yUd6+uAZb3yGGKQV6gj5NFLTvW9Cc51vxq3PF2uJntiLIVU8twVRmNVnzjAdc=@vger.kernel.org
X-Gm-Message-State: AFuF++m7O4cbVZLS2pSGLqXXEdJA6XiP6hV2xQDXoP6rtsZdRKykIMk+
	xPPXQsPhVErDRQ6f3TMWeQRgfy3+dJoNkLirwJzCsVU+zjyZZEeR+C4u
X-Gm-Gg: AYBFou17wJd3MB9aoq4bWfWdNoDRnhAOE//c7CSuJD9UL+3MTPZtpftMpeqokBaATKi
	+VCN8Sq2SmW9cWjHkwRxJAk/enWl7ojF7qN9BCz2Vt17/3QZhfhGRqd0m5c68o1IOYXb1CNXPNj
	mBHSljsELd5DjaQA/JDc5MIdbz8H2QcpDfTxNbnbqwWqvbyqXwI54wjla325Sz04sjsafnG/Vv5
	vEdFGIFC7J9RGMIIlCgc7UvA/7yj0a4VhRepwhhzSQ28XUelWbEUTnt3sTkzA98YCaC03uzPXhU
	z7hFjRT0eiCQln0i1doges+pwr0PSKJW6w8TJKlrEnAAIdJ1Phl5oD0kKRH/cI/HIBptJ/D23a9
	f3bqDp/vY35KMwdYKoC/NjzZtHWIUgr3sV9lirkuZwRVaWJ5g6pXpEtUpjjQDAjrRveDK4dGnOl
	1hd1YoQgcPtfSwhYWcZMuYgqU5YgKS+S7pJZ5uHoVmQA7KiobqdL/796bROTDHDBtvItTpqKHjG
	BFLTTpsqGBMLI0YLirUf2gYxZL3FPJcnm45oLixPLsbO/NBEdA875bfpIbPrBANjNBhvVLnvcG9
	xLtkMw==
X-Received: by 2002:a05:7300:c72a:b0:33b:dc33:7f98 with SMTP id 5a478bee46e88-33e8c24feabmr158640eec.14.1790101764641;
        Tue, 22 Sep 2026 11:29:24 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdabcsm154315eec.3.2026.09.22.11.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:29:24 -0700 (PDT)
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
Subject: [PATCH v5 2/9] KVM: selftests: Enable kvm_create_max_vcpus test for powerpc
Date: Tue, 22 Sep 2026 23:58:46 +0530
Message-Id: <3f876f362466177e8c826e1ff656cd02d96b7069.1790101179.git.ritesh.list@gmail.com>
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

