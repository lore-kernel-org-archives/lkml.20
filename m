Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082371;
	b=HF9or2ZEQ+80gyFeMUYwxy2TY7K5Wy04plZUyK3TIQip8VswtC08+gs4RVAQ62iMNOy2
	 IU6RGMYCxq+xQxo67Bdjw+gneEBlT+XZ5VQuGbHMEHiPh61aMR+mZKEUseuZ8mXMr3yq/
	 mreZEAsFrX7jknCi4mefNjzyP08xqOgHGgomYN5f9GjSkAwBJUQEKujajXZlBGkWx1g9C
	 P3600SCTYsKDs7QpudwkFZ2kwX3L55bV6MDickYpVGokDsNuHWWN5MNfo1u/QxBZVbL0z
	 k57h5tfgRROd9jst1vRbudX0Mm2n97mdWUY1/JxE4CTITpZLL3VoNW+sm4JjGS5GcBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FNh04yRIP0CE19slce4i4RIxfhIIH5488gtyMIknFlY=;
	b=3fgfdyRaa3F01oC7npHxE3ByBXP1cNTOX7ZF8cmQO6QdAU2y7t9VSA/2U9/mlzBvXWfw
	 7l+EUyI6aY8uAS7MgGnGzYDOMh+doXFJOhD9AyJE7HjFokg4ark9byn3Ix27pt79ZA0Co
	 fHshht97b5Qax9MpAEFRySVNvlfvhfkW0MyHO2Spmf5GfMHmQgW86wIGTLdUwEZCWUOlX
	 iD5Zx47Jz2uM/X8zLP8qgZBjk3aXebHajslBwxPKyuRVRX8/qAmCyBFfBN6poqKP2DwDv
	 mNyIe3lSh+piNIeFD3kx8KvvHsFXGc7tDW8r6367B/OKLct9YSiIogBsE2xfAOvRq2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Tr1UmgNz;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E4C606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2E4C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Tr1UmgNz
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8fe8e343fso22109475ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793082370; x=1793687170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNh04yRIP0CE19slce4i4RIxfhIIH5488gtyMIknFlY=;
        b=Tr1UmgNzIFhIsCU53Vk9vUO8r4O1V3ENts7ePvhxZMYpyYaVBPcya6VHQ5OYtx7VHr
         P4lxvBf6YbylTIa3oPLxR0/Gs7jJbEPlMLNcLoEcq+nd81Jeknp7hvVR8A0WpbQSDoGu
         2k6NdFQyFhQ2Urb/59gH9YO/f5I9EI+9W9wxTqwSEka+Y03BLaxQADiw79HgPY2N+uYf
         6fuZ9ntD0FklhKVg0BrQ4npz8f370IPwre0uUlF+LSDfxzflTtW+2pVTtXOsGhpVrxVH
         iICHBwq69gKP6QOxlon5RpqIuNWIL5S0lJ4L71vdSfDeERINYyP9IjJcruFd1694tCaF
         dLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082370; x=1793687170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNh04yRIP0CE19slce4i4RIxfhIIH5488gtyMIknFlY=;
        b=Xa8OlxA5cXHlhI14mGNUCex0ICYEWm+iTkiO/TnX6o+/pbJ7SNzSUmiCmWbm8AcQmq
         deGFkvYpnN4W5KC453dl036Q0aN8KaH7NmDxzpmUWxVkyyDJinw5NichVqh91Nty4TUT
         /9v/sUcLaN9EkkTstxAmgHsmlyy1whjJTsO7cBF6LzWj4s5qCB30PVVmTPdn8//loMqs
         JeggeqmOsRvjXd+P16Lj/PVePO0HFfKvFiSAvDDJ+SgD17hpUl8E06RuXJUZDVMmtA9W
         x50bTeGia375mmhDPXy/00tXEXU4bOcr2Drr3/SkaC3ASONtBzelc/lf+oPhjpLq4+sw
         zdYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxS1oFDMq0aL2sYvRGPoChRgOSxCdR0tFON5IAotfJa7GbTt9HXEH84+2l6uy5tedqM+sNELv5GKGQKn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeU05crb0wjm5u9E1Y3Cb86PpDJozi+8pvKPUPElPj8FJyeILY
	s0VpXfWVwA8wArBUXOHuGhKZOg8Z5Hoi6RXDOTKPCJWnL23xIHLQ79CPC1pSXGcDXsg=
X-Gm-Gg: AYBFou0PWJweYVQcdbvTxfGlU8vbh61WMgMA7OITpcN/LbglgJOprQLtRVMTgrqGkiF
	W/zwZWQTUu2i87PUGghntq4oAxfD/IRrw0fO/l5wkNkQCR/ZjwBVtpxxMS83lSC5HGa4gVrKJkt
	ntplpsUf6TWUds7FnCLBvr++3vfHXAkuyhfrhGpviCx/1Lj/k45S3rU/7eDrT82/m8Oh1lcguWM
	pVicR3afPxkUNYxEPxb5HzLkJAgV9GWv48cst+pW1g6tjZ2W3P/GdJ1sSrmA/BMfipE7hk9cw4T
	kxavxhaXzeqnEz5e+g7Lb+SuHUXIJ6Q0lj5FTufslS23t4cXbosvMMn+VIVK3f2DNoMjHoqexYu
	VRg9hsM8qbXINs2wISvm/8z63vv7/5uWIi23EPEo4GDTqe+COehIv8kEidWtDAmocnzuZtITvNM
	QBzuwiPALKm4gcxGN6UWrU5mItZX3YOjdAqMKKI0qXZKUchSG2JpxdqWFT6c6hd4jz24K5OdP45
	4CysrFYaYREgWyLySD9OARxiuJuTT1N3GK7ClqtR4u3neLSLDR68fmaGrFdWYbsWiWvYTwXv/yB
	8//jZqkeMq+TyuNYpHbQ5+46YZSP8yAvx+MPrZjIQAHEYijggQ==
X-Received: by 2002:a17:903:26cc:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2ea9c913694mr67964825ad.57.1793082370138;
        Mon, 26 Oct 2026 23:26:10 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b79ce2sm4079055ad.21.2026.10.26.23.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:26:09 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH] RISC-V: KVM: Validate PMU counter info using available counters
Date: Tue, 27 Oct 2026 14:26:02 +0800
Message-Id: <20261027062602.323691-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
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

COUNTER_GET_INFO validates the counter index using the pmc[] storage
capacity rather than the number of counters advertised by NUM_COUNTERS.
When fewer counters are available, a guest can query an index outside
the advertised range and receive success.

Validate the index using kvm_pmu_num_counters(), matching the counter
initialization and read paths.

Fixes: 8f0153ecd3bf ("RISC-V: KVM: Add skeleton support for perf")
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index e095d1ff439f..ea788619091a 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -560,7 +560,7 @@ int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 
-	if (cidx >= RISCV_KVM_MAX_COUNTERS || cidx == 1) {
+	if (cidx >= kvm_pmu_num_counters(kvpmu) || cidx == 1) {
 		retdata->err_val = SBI_ERR_INVALID_PARAM;
 		return 0;
 	}
-- 
2.39.5

