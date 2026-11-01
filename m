Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793546925;
	b=4ezsO3yajcz+thg0NGr1XIKYWIOKOU+0q854t2yKRi7PDestIh02vLlnQQ0F2lY1fjLV
	 IRsmFlWC6nIWfSXLcjXQf8nRim3fiaG0SuX5+i/Z62xwML+PAFWW5/HDqF9aWUiNrHKAi
	 G8b592Veg6SH2Ee0vmLF70WNFucc5IeOTNMsORWngqoe+e+twEMB/SbPvO8BmP+lw/x0+
	 8RqdRt4vzcemxi7xVXA1f6C9MePcLe2b8QJRxdcywm8K4Ir9j0GZpa/mR2EhXSvWm0Q/I
	 MUiRAAXHdufMWGpAe0bfbUrWgTrNJIo1B7eTDMnsOTUURF1PLJd505HUuBDuGw/FAQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qduAH+VDk53vSkstbY9xaGv+g9KfxKxHxkbXDOSNrm4=;
	b=SfXdsKA0fWhDRo0+QRwJe/bTCXA6/eZtelk2zFOJrTZFzXtOpE7AxqOdLWcj9aahEgkx
	 uOi+uqO3UhMoLNVm8Oz0H/07X7LvVEIczYE8fQcD319U84bzcPx4LxmPe4/PIZiGTJEBB
	 0mM0DkyxOlj67QvY/7z8cAUZpV9wLypHeIO40Yvu4KexgxilDD772JmKoE21eCOaN/eFE
	 rG0MEJ5Xz6hVPHSBZLpz8MC72Z3JNoddmgo2eDBHtO113vsWd9pUIDgxk4owrzXcnYbtB
	 /bwwNaXWZmk8ywW1jB95q6gIbqo7mJLCiwb+2NTZsS3pot0wvjhvtITbvR6wI18ljQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+W7JEtw;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9029606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9029606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+W7JEtw
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35b2c599f43so3055687eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793546924; x=1794151724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qduAH+VDk53vSkstbY9xaGv+g9KfxKxHxkbXDOSNrm4=;
        b=B+W7JEtwvAB+w3vHEi5aZ6qBz/STLM/ZquA3igTgLD58zdAVdC8c/7EfsoVvMetKFC
         wW5ruwtnd4VYRUqztvXOH3Yt699LwPgK3y/Bs/ipxck0J5Ch4OPjSaMxRqH2nVRgZ9j5
         n+qc8jOvIscKPcl8CwAcOCOBIoR6fXXLNtrNXNB3wHp/b/eS/yMjOzOSOSAY0X3ehJrY
         8X7uu5JO9WA0o+Y4YeSHrnb5jbRru5IMSz7sAWz3p82Ip5RZih1n92gAX1XWYk3TnZR4
         wb/OtJKkBOadV8J6vlbNMmo+0JNCP3zjLDjfRVcbJ/YGXvEAL5+3/23XW3fEYQk11Y3d
         Z9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793546924; x=1794151724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qduAH+VDk53vSkstbY9xaGv+g9KfxKxHxkbXDOSNrm4=;
        b=XWwRqOXVK5pCYFuBygjao+5IHTNfw9Lm12pN1CivR+bHMNPETtObcp+aiInKdYlyQA
         /D3EeCWv6Pk7pEgnyvFwr+b7M37Ykg3udCyL+T4wH+6EZpCy6e/8IL908N/ZT2joeaV4
         OpBqZ0GX1pCpNok+kT9g421E90/iJtrEmGM7aZoGaRyvdXBZ4zUnUeXK+LLYLJ9Cvzq5
         uD0JgLWyC7zwJb74WKdcxzQUEWF5lZohlIuiOtz0Q+sQXVeaMut+so/H5q3mjbhiSPJ5
         vXmO4ia3gNTCEIObvowbB+DRbjFFgO8U4oY4DgdskcaQP1CBfF/6QYs0umh3VKEUBxO8
         QFcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXXPEn1TYPQ0dG1eagjnXt0AYJNtUg1yCR/nfsP/X9Kst9eEpTfyyg80ls2cf2ZO/js2TNfg43CrFMUls=@vger.kernel.org
X-Gm-Message-State: AFq9FYLupEjQAvGWGpoXEAWh7thTvXNsJcbE89Aq9Q3qWqmdnmIEwi+f
	YLFgIb2DM5GfPhRI+8t+UmcFhBsCoDrJSX2sfpZqAei8Y+WUsVsBKliO
X-Gm-Gg: AYBFou30Wz95jXKB356VagWw2gYpxlHSLOQC80m4gzaPQkm8UjfLAGhM8RjFxfBqgpi
	gJ/dooxB6gOqbWqTvdeXISnw7iOVyACxtQ62LGiImWhdcDcg1ggj4nHy+Uo5AkinBcMQQwEhLO9
	GHhiE1TGLGqVlDWvoxmxZ5Z7zf2BeW0OC3VPg2Eoi6K1HhpHI5jaGctqWDfhmyYXQErDD23lJFK
	Xy52+JBOHF6lLzSd68PxXsPelAPyD07R5tSBBfPbY/VoOTT9PRhWa72WZh7skdzz6ebDn5sdNJg
	5MP4/TmxDlB6PH0tgRWSy0mqZmCGfuDlFr6vsHtKAYaxroqF395UrakHhXl7/2/ENkeoKVA2JAc
	ILscS72FMKKgxwgBJ/i+DeM9WjuyNOo5px/cUOBTYCKOPBeuFILO0z1NjkUsE7JhRSeRkNnJbQA
	7ahdgSPkN/IxEM3SV/86/2sR9GXHMgnRNgUq+fwcXtW7dvsMaMB2fEqC3knvO1htQH72MJKNzpb
	rA7BFOE2AzRChs6qjzbb2Oh6bH1AlJFs1quRS/UTc6NOgazm8SMebXujYAL4qaDTdNFuFPi+VOz
	o5PQdEvTU9RN/TlQ7oXImWRGfWwOQgBv3A==
X-Received: by 2002:a05:701b:4784:b0:165:4b88:abc2 with SMTP id a92af1059eb24-1ac5b5ee632mr14506105c88.26.1793546923991;
        Sun, 01 Nov 2026 07:28:43 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm24862665c88.8.2026.11.01.07.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:28:43 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv3 5/7] KVM: PPC: Book3S HV nestedv2: reject vCPU ids beyond the PAPR limit
Date: Sun,  1 Nov 2026 20:58:10 +0530
Message-Id: <3b233fa135d54d3ffb569d7febdc1cb8e0ed406a.1793546707.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1793546707.git.ritesh.list@gmail.com>
References: <cover.1793546707.git.ritesh.list@gmail.com>
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

The previous patch caps KVM_CAP_MAX_VCPU_ID at 2048 on nestedv2 but
nothing actually enforces it. The generic KVM_CREATE_VCPU path only
checks the id against KVM_MAX_VCPU_IDS, which is 8 * NR_CPUS on HV.
That means a VMM that ignores the capability can still pass a larger id.
That id goes all the way down to H_GUEST_CREATE_VCPU, where the L0
rejects it and prints, ...

        KVM: Create Guest vcpu hcall failed, rc=-56

...for every such attempt before failing the ioctl with -EINVAL anyway.

Check the id in kvm_arch_vcpu_precreate() instead so it fails early with
the same -EINVAL. Note that PowerNV and nestedv1 are not affected.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kvm/powerpc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index cf620b6534de..5f9cfc34bec2 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -778,6 +778,9 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 
 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 {
+	if (kvmhv_is_nestedv2() && id >= KVM_MAX_VCPU_IDS_NESTEDv2)
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.39.5

