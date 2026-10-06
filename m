Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29433D525F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791329954; cv=none; b=GVnja+IohjcqUVTnkJxGj2NjI1nIXSU17kxxzUVWOS6nbVRarsMGWYcb3WGgLSoDGzzvjnULysLF1hGU+CbdYlQIaig2ZKxsxQwINteR61TG6kY7P4S4jEVZbfS4h5uKg+YXzhtGrn/7kFdWFSCEkUwMKpatYSPBBxExoUNYyQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791329954; c=relaxed/simple;
	bh=BWQi6+OUEp/tu9l1mkI7xW4X2+ly+BWbFk1Zcp5roxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VWoK/9karQzEyizPAE3oSV4ZG/S1Q/tYoo/zHnaIlZvioK6szUbUqvP+kHV5PuAoQpMj7mcge21xrfAqGGH0hsCXGd+CdAQT6soL8di4jVlBNeo0Da2JbZisEv1jvVYJazc9to2OcKSuomXaqsSU6J2q6rDNkKq1Pfyh+r/tXgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiofVYFT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiofVYFT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-486e70f2457so1556319f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791329951; x=1791934751; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p6vQUbClVDpSCeEbk4enL4LsUUIDighbOrvskTUgMlI=;
        b=PiofVYFTKU/KAwZeWrVD8/JjW97PY4XEAEDQqplcTZMzg+UCIe1Bvjty8JCErVZ4Hf
         lKauDFOt/0tjSicNXJeQJ43YZjpP0QDzw6tWnP2Qtm5o7PTRgZ4+NxzcvDMpJJycyS7G
         cnUkvHz97paXvS+niBBtJPIFOy6Wp9q9elKcDTSi5eF2ZlJbtuatcPPmZp2gtr0rs+rO
         +r6yA27HI2xH4pf2P2FFsosgMCziKvX5w7bQms8pbFzi8piIvpZie28ad23v2wA7cJw2
         rT9GrXkVmW69e0IMRjgbjcYVXiLmTL9lY9rK2tXeqqXiYjYmV3WWTXEp5MscgGnGpf65
         c9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791329951; x=1791934751;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p6vQUbClVDpSCeEbk4enL4LsUUIDighbOrvskTUgMlI=;
        b=pBoJPG9M+RCFWWSTSPV7tR6RHl5NaZjiO70UMRulrgowYqJiJDZInJVSfSASWA1gA7
         L3nz6BDMacw71+gvHvEoBKNXv6Bj0FxRy/81DmOEH4zlva24Ovcvokl6v6v561IDVXvc
         +Zr/7z3ZlUrpULNni5ijKXkNpobS1WaqySxrdYFO3O4q/BEdI24ItKtj6mNtctdm6CqQ
         7XeXwjCfShSzHhujk2JvtueWVP0z/wcyJvZunMnYecKNBsC4ogQa4j4rCn5fQtNeRLRI
         jNXuWEscIDpQDDXcjlx7WEL6WpsPyrqSHkc+xp/OCp6zRSSs1a0Ylpzu8c2qdJFVanjP
         GLCg==
X-Forwarded-Encrypted: i=1; AKwUvByuXFEV/sVf++15rqqNjocYFt7BuNxmk6U5cbv4bxl9yLE9swkAtfDKc18n33x9dMBWKPzlxpvbKpVr4ag=@vger.kernel.org
X-Gm-Message-State: AFq9FYK75fZ8rRrfJMsLVPM3uYFnmII7ou7mrp3c0cENj9VHOjOWJTdC
	vOF8HFeuH8wFhfSsFeBeS2blj9jlhGv/Vr6gEuvlEfd7sKXHz7es9ccH
X-Gm-Gg: AYBFou1U1b3mmJJlBQeCrU4r7Un40FvOGAvi58iIqzsMIj8+MqNZmLvcECnGzF1bi0G
	YlEe6lX9zoV63vQ1cVY8k2yQFcwfFTiutR3wPbTHZ44Vdjo7N4zLAJkdijq/Ec9PSNfDHerM+PV
	1ogBwlhcsAgTgmYZuPmbeQQfSdxWqBH18kYkYZJ1KqFM/0YICSJyYJ8BlcP8tjK+ryWBwZuIbBr
	gpan1WnPfhc8JHWtE10bmVMESHqR2/7sgwzJkWY1blvC2iy2HTEW0a+HAg3V85Iu2jxajxqMN5W
	LEYCYS78IZegOA2WShidR0yX/E04jM7cJsw/zOGoYsyJ4ymTHqR7Qh7wEZ9j6xPexefyFcxRYJs
	2YJmogYTCWWx9/n2V3MbuD3VN/vZOFRwdZXt/OsqIYfMO1IVJT3Q+tbGwAW0SkLwL595cTLsbYs
	YMgZcQ0F0mfMLUSJpaljmzr9yop0HsQwkpAPtFs/ZLnSyBRk3g07WydkWS38tMdamqOvjVLCoxu
	YcRkJYWlPntMvh3K5CHcGuUmUEHrVNRIpwm7J6sX4OUDPrlMUNLV4zu
X-Received: by 2002:a05:6000:2585:b0:48a:f8fb:cd49 with SMTP id ffacd0b85a97d-48c72889ca6mr1289357f8f.22.1791329950735;
        Tue, 06 Oct 2026 16:39:10 -0700 (PDT)
Received: from [192.168.221.223] ([81.0.216.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d10216sm1881368f8f.20.2026.10.06.16.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 16:39:10 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 06 Oct 2026 16:39:03 -0700
Subject: [PATCH] riscv: KVM: Fix compilation when CONFIG_RISCV_ISA_V=n
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-vector_off_fix-v1-1-9e48e654d445@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QpAMBRAf0X32WqjFn5FEtsd14NpYyn5dxeP5
 9Q5F0QMhBGa7IKAiSL5lUHlGZh5WCcUZJmhkIVWUmqR0Ow+9N653tEp6rKyWo3K1VIDR1tA1t+
 w7X6Ox7hw9F7gvh+hxdj4cgAAAA==
X-Change-ID: 20261006-vector_off_fix-938d61b1f906
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Andy Chiu <tchiu@tenstorrent.com>, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791329949; l=1885;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=BWQi6+OUEp/tu9l1mkI7xW4X2+ly+BWbFk1Zcp5roxc=;
 b=fIJD49rfeAewk1vKo3AGACkBEa31o13TCmZF61L5MsBbstc43N/TbELEyoRMR0rhStTq2fWGD
 hT5PT2sRkL+B6oSNnlTW2Mo4/PGgShIdVRbZ3Yn5vuC3tmu1dzV+Rzw
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

Fix the KVM code to use stubbed out versions of vector functions when
vector is not enabled instead of failing to compile. An alternative
approach would be to ifdef out the vector code but since a handful of
the vector code already just uses stubbed functions to tell the compiler
to drop the implementation, follow the same pattern.

Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector")
Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
I was reviewing [1] and noticed that when I disabled FPU and tried to
compile that vector got disabled and the kernel failed to compile.

[1] https://lore.kernel.org/all/20261006075303.205216-1-radim.krcmar@oss.qualcomm.com/
---
 arch/riscv/include/asm/kvm_vcpu_vector.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 6371d5ea5392..1c9efc6048bb 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -11,9 +11,9 @@
 #define __KVM_VCPU_RISCV_VECTOR_H
 
 #include <linux/types.h>
+#include <asm/vector.h>
 
 #ifdef CONFIG_RISCV_ISA_V
-#include <asm/vector.h>
 #include <asm/kvm_host.h>
 
 static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
@@ -55,6 +55,14 @@ static inline void kvm_riscv_v_exit(void)
 
 struct kvm_cpu_context;
 
+static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
+{
+}
+
+static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
+{
+}
+
 static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 {
 }

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261006-vector_off_fix-938d61b1f906

Best regards,
--  
- Charlie

