Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922481;
	b=4tCouJixC3APprLGJeRyiwWCy2gzBIU/3h+K2OygWB2Arn8KrsdVk6FJDynSUH+lhYbc
	 +zjdpn9pZj5Sii9Td2rDrPIDuVWuXx14nwudRFp58PKimzKo1AoIlYJRRbH+DlYkWLsvC
	 b0JyvzlfyioO0YrCi90CrZIK+M0HOeGPcZJFHgAsyApTjptRIVgOGvkrPG283pLAMLTAN
	 hRxyCZ+n3ZLQXocYhlYy00TJU5fL5gxWCq3k4NvU/K1ifcQgSH7Hd0LwzkF1+ymSlHmg3
	 CVbwjreUahT3/ugiMmk+EjHu/rJCU7cw7bpgSxOu/WiNSL2kn50g0Z7wzD+Uo+67IjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1FN4tBVcJFBQsla2n8tME6jrjpUGnwmxW8ysKp7MZ+A=;
	b=cSFQLWSeNneEtnHKBrFgf+lFlU65TjAavyFWNrQ0XIEjiHIPvvo8E6K4kprH2ZP26YfZ
	 42xiledGBNigGRgS4JLWd9E2+cYpumrGovd0gp10PtOFfwb0/Kw2qXWxg7kbtBsRO4Glw
	 V/ZfXQIRaC+1PYDgjkScWXSel8m2pPRZi4k8sXQX0Imh+wo1Zi/pA+igVT4fVUElZNrlS
	 clPL66rUrNFlBva8mEwJ6xojINW4Bt+inYfuU3/X8pdpPBH5usgHJKqYmrXjZeQs+rcQf
	 wB77ZTl3ABvXI5IBM6MYXxjo6clBELV21AJUN5HKvWwLB8ZUCvf/qbYYR3Cb5yArt+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TPzzakC6;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A8560A380B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A8560A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TPzzakC6
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9995cea88so811345ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922481; x=1794527281; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FN4tBVcJFBQsla2n8tME6jrjpUGnwmxW8ysKp7MZ+A=;
        b=TPzzakC6GVpiAq1eEc7qhcAOaGNzBo4rsPITX/Hep7Lqt08hw8Cwb6hXhSVJo8jZ7E
         tLX34Zr8lt2I+1Rhntgn3cI/+jmdqfIwjs90WsrGf4cwuM5Dta7vH3am0Bl0JL0hkXAu
         HVEyR68i9FR/ZAdY9+/z1nAMVZM4LG3ph1vuakYQk9Pp1YC9MXiH3G0w1xh+iUe7fKuu
         TTRXfEoFmIsNYDgbJ8WmyrW/gBEqOnFF7c43qxG0yJPDnn6L38/r9spLNPAoiXKz2YJW
         AwD4y0pseUmLSYJe5FJA7qFWU+CNWlOLe0eg9Vz2pQ6deIlgr+lwF1IxlzgwkOZ81eZz
         dPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922481; x=1794527281;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FN4tBVcJFBQsla2n8tME6jrjpUGnwmxW8ysKp7MZ+A=;
        b=00txCrM9Lvv/SLxxPaXgIPenfbmnTwq4tPAWByPPgmzZI7EhpS+P58Iqm3zDGVrDMS
         HZk0/kRW41vhJv6EXVQYB+Yun3BiZlzdKhgsL0EBsRr/mBCl5r1GHi3x0MeTrDbVJL1j
         mM98Wb/dnBptqRTxiSp9RwqsRuU32S9QTJTmpugCsgi3saea6CfsXYTEnrB4EsTTpywz
         JNNlk0m6oskRXR5g5xtyEs+aq0prMrr7NULM9+CIwhofUymlHp//4XE8UwchvA74900T
         9jq0TGnTbetMZDpQQKv1vLeF/pNzBSkemOxVoKCMUThHgEsoZxhbKFWG1tZhGk0LK3Cv
         4Q4w==
X-Forwarded-Encrypted: i=1; AKwUvBwQIT/V+y2iBdpoLLEQJ0NtQ12m40D7Uv9MuUqST84fmVZ4k3x68qXiWMnvjlMUpyE0WiZCck43CEcL7Ck=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vJPBb9Jld7GZ4/zWIoWHNzEyN+brOmyatiqu8Jaj1hCXhyeY4
	1JSnSWOQ0938Y+4xdVBJ1J8tJoV3pJMCqW6yZ6mOzAItKBFeKeM8Sm+JNR8ih5UdDDVuPDjiDuX
	yZhvC5g==
X-Received: from plnu5.prod.google.com ([2002:a17:903:1a45:b0:2e1:326b:da73])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ced0:b0:2e9:6645:e99e
 with SMTP id d9443c01a7336-2ed40c48331mr10886805ad.28.1793922463383; Thu, 05
 Nov 2026 15:47:43 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:55 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=858;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=d6A7oZjd0INte2bacSdXjbStFoBPPx7rvs9xlbLb3u0=; b=9jtIvl+Z+cMjsx274/HuhhAQ0MpGSG0pXW90v5FO8GZuKjRtHljxjeF11lqZ99IZQl8XR/8JE
 EqPOy1Nb/shDDVDDDMoSkur5WKepYwfyJnbEp+GLF3pMlsAKq9tFrTh
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-11-2024e8fa517a@google.com>
Subject: [PATCH v16 11/20] KVM: selftests: Require guest_memfd for TDX VMs
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

Force guest_memfd for TDX VMs.

Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index d42e201eba76..b73a7bfe8531 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -494,7 +494,7 @@ void kvm_set_files_rlimit(u32 nr_vcpus)
 static bool is_guest_memfd_required(struct vm_shape shape)
 {
 #ifdef __x86_64__
-	return shape.type == KVM_X86_SNP_VM;
+	return shape.type == KVM_X86_SNP_VM || shape.type == KVM_X86_TDX_VM;
 #else
 	return false;
 #endif

-- 
2.56.0.455.g6c5a503b38-goog

