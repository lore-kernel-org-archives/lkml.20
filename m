Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CDA26982C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840122; cv=none; b=PV153Ng0vhiXS3d1iezACRwL4OYISpJckEW8Wi6Utp6ELi4dtcaV9XBpTuDers8BYlDZlaq4PnBKYjn1knpCW1qJZmnnbgdeo13Qs+eQEMzlJi6dLLGYX/syq8B26L3oiyMT6iBleOe0MJK8NZ0OTg9uxigmjzGZZ/4v1NOGVgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840122; c=relaxed/simple;
	bh=9Ow88ngY/eToV6q2OOUEvhdkMKoiN6ZQlSDSuhIxvjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gsBOmQjcexot9ZI0j44SN4siMiV7RX6u+BGp+Ed+TwRlPZhBIYt7DSv+29Zxoi8NtUAMIf6m/n4Ivagd86SmKLe/jLvaadzEwFFsxnQqdeigBIL3CVG564VEoYcGYsC6UKcSpAgO08yqNfu1/xPyYxMJW9MzCYXTvucQrdTsYHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=butz.st; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=butz.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso17118295e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840119; x=1791444919;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b+RBOt3rS/J9etAr3asGin1fc499s7yddsi1unBuAEY=;
        b=lplPF1bV9SnqBGWJC3oEnrlhGqLAFgPuCwBLp2BRWH0M7Y8qDm9LLyhnoEmBJaSwPL
         lrBkjIIhiI+GcIUpDvBDrZiI1/w1tfgiZNBNbcQJQZES4jg4zQlHzpObwwKyzH0rJ+oL
         /EzGw7tX2ww0YIZE0j5H/F0O7CusSnxOQkzl4ypbTuENChCibBIGcsOsATNz2o7fvHrq
         PtpgxI4zmSOpeAyYFXp/Dh5Uht0c3aL178BGDXsIRiWv6xUH3A62f7uvuSStgC7tqYV6
         zuxrUxmJyH0ZR6I7YeAz1Rt54XkrSisNrMrEkfYRwyQC3arIqO8B31hOvJjMxtsu3qR2
         I5NQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkME63sFDLbKrYa0vH8LrWkrof0owJVxIy+SCAsgGAxTHhI/bosR0NJRr+Gm486IdZv9ztht+2gsfo04U=@vger.kernel.org
X-Gm-Message-State: AFuF++kAH/5Whu57uwhRiZrWaOk+mZSIChMOBRaeKggd7E2d/h5BCtmC
	aN23jmtzFczS2G+bqt+XU/OONLQmss/j8hoVlGxsPIvLPAL5UH6SzQTq
X-Gm-Gg: AYBFou0cbM0D/UpXYKgfbkzVx5FYjgpzJRoCDgdpy+0cofI731LBZWD8H6XGiImR/YY
	s2OVdlnNLwUqa0PVE8pc07wlqSOv+WZ76MDutlgGfezjfHy+j314c3O5I2Y78XpjKPdIplr9bI9
	8ZG2rXMQbissgc+BszPI9nDm8uHhK+KKlyGqB627pXJ5E17jc4xm7vqsU6d6RC+14HMqD/opuhX
	4DLjHL9WV1EIwxBWWAfHbsiAaomjZVw3leEAUmpezyERQl06tZodtxWOhysW6zSu/mF2RWp09eh
	Dtph46/YRCLR6NTnDoBmJbSl+H13wRFXliAy2chS4DXzg+iPUCVI9bxascWoV6SiwiT25CIg3zR
	iXNIqpbVMc+rpGAMH8QHvLUDjVBAUNVK6B5W46JfYbhdqX7ckO9J7ODHYq7+JHOfYqg/kA7W3uD
	QJgmy1+uiBob7csm3S5GDrSx6Cs2WXieBsgQYqxtP0vzfbCpvVsN+RDeJjBnC8hIfJGWo0rCa+x
	PnB7RYp6kqa3/pfmwRzJRNz9aHee0XCLc0RudXgcEPr6vIdci6hwldosD60ESYHHa9LJpS3O4B8
	AA==
X-Received: by 2002:a05:600c:c3db:20b0:4a0:37d:9e21 with SMTP id 5b1f17b1804b1-4a01affcedemr49892375e9.29.1790840119247;
        Thu, 01 Oct 2026 00:35:19 -0700 (PDT)
Received: from mac.fritz.box (p200300eee7049d00f14da2a424a76ad6.dip0.t-ipconnect.de. [2003:ee:e704:9d00:f14d:a2a4:24a7:6ad6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f922ac4sm45890045e9.6.2026.10.01.00.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:35:18 -0700 (PDT)
From: Stefan Butz <mail@butz.st>
Date: Thu, 01 Oct 2026 09:35:07 +0200
Subject: [PATCH] RISC-V: KVM: Don't write MMIO load result to x0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-b4-mmio_load_protect_x0-v1-1-90515d86f201@butz.st>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrA1kgnHhVUoJMZnUkWokSYsg3
 t20Lj947z8gU2LKMDQHJPpy5rhWYNuAm+z6IsG+GpRUPUqJYuzEsnA072i92VIs5IrZpdBBB4d
 IVisL9b0lCrz/y4/n7fwZ57r+5eA8L7Cnm3N7AAAA
X-Change-ID: 20261001-b4-mmio_load_protect_x0-5f5fc11ea52a
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>, 
 Yifei Jiang <jiangyifei@huawei.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Stefan Butz <mail@butz.st>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1790840118; l=1161;
 i=mail@butz.st; h=from:subject:message-id;
 bh=9Ow88ngY/eToV6q2OOUEvhdkMKoiN6ZQlSDSuhIxvjU=;
 b=U1NIU0lHAAAAAQAAAZcAAAAHc3NoLXJzYQAAAAMBAAEAAAGBAOJW8yHG2FdKcC8jiWoQyd2Z6
 SNHh+aJB0RLkH7BFF7Yy7MymfE5UJE2mmoucIa3HiNQdlVZjgqLY7wph/VSM4kniDO57IG9Q9jN
 x96oOAzzWWJEVrh8vlxRGXatNy8ywcO9WExvzLop5s2ddP08f0Wrzn/55mpqoLJyoKaIbk10kxz
 JW1GONHT8nsNvBpVB2lnzA2jhv7DC79UlHzA98+sp8eX6kmUips+9LpTJLDeVna8f/vwkU708PI
 Qxt/5nhmFXKj/su/CMFivCLHckdmMOem/4UNoTyRcAbcoFQ9WWyYHvAD/bRuYZVEA2hfoBEQVu2
 FGHdG/OimvbT/GseVmWjiw7WV9HUOJJawVmfoTEJynX9BbV+VNMKZVpW5YaAaps6/KOC7V2bM7P
 hvORUmj3b8eUr418GYC3M4rLJtrj6Vu2cUyTV9Q5dvq9Lg2TIj/jpbEWpOqn2FSGkQcLvcDksNk
 jOSGmdG4h+OJ3vbGrva5UCJF/KIyuV4ozlSU7awAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAZ
 QAAAAMcnNhLXNoYTItNTEyAAABgNFm4MOaEyzELZNBwbPaVz9/x1KmXNjfSW2SxHyCKpy6XafGX
 BCXcTrwCvg1f/y/bHmlxQanPGKYZp46WedmvlcguZHU4ivCQiw5rnXtH9OxaKHdox/dRhSlUHWj
 SnOPY5e79+yrKjpMK/uzUY16o6I4aIusq/3qQ+mazCVEmx8t3Gt9tIo/y4swzu61Zze/LmMDIjH
 R4pLtYxuWChtgj0HgOU7+oA1yIKWYY31cq4NNXsBDtzVsAxKV/BvmX49yfLB3iqN6oN31Y4srrc
 5R+hyD54KYZJ1dx6toBBzUnNMtsCaox4R8hIBYAJ04wQ8qnWez7ie4GbLSJu2h1Y/kEqupriFHx
 Yz2fv0TxpEdzXtw8P4pNHAQ0BwVnszRLvbN0ZgNngYbEgdombqJAbfZ2yw9kzRCdiik+NDxCHsg
 4sdBkUV7/mU+ifx+ZPbsOlkqDb7cvzm+JNnmbH7xaIMoGelqUVTMkTkcVRACC1R67RkpnITYeXV
 6CnNZONNm2anAHA==
X-Developer-Key: i=mail@butz.st; a=openssh;
 fpr=SHA256:jcZFBs39daoQJIontO/rJaVachWp/oqTbhNpQk8+REQ

An MMIO load with rd=x0 writes the result into guest_context.zero,
which is never cleared, so later emulated reads of x0 return garbage.

Fixes: 9f7013265112 ("RISC-V: KVM: Handle MMIO exits for VCPU")

Signed-off-by: Stefan Butz <mail@butz.st>
---
An MMIO load with rd=x0 writes the result into guest_context.zero,
which is never cleared, so later emulated reads of x0 return garbage.
---
 arch/riscv/kvm/vcpu_insn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index adbbb59a0f36..2a8dc2b88ba8 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -647,7 +647,7 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	vcpu->arch.mmio_decode.return_handled = 1;
 	insn = vcpu->arch.mmio_decode.insn;
 
-	if (run->mmio.is_write)
+	if (run->mmio.is_write || !((insn >> SH_RD) & MASK_RX))
 		goto done;
 
 	len = vcpu->arch.mmio_decode.len;

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20261001-b4-mmio_load_protect_x0-5f5fc11ea52a

Best regards,
--  
Stefan Butz <mail@butz.st>

