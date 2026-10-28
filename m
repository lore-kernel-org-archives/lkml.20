Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163694;
	b=ePdbkvdVtFEXTZ1SlxowFW3t3+gL0HoIIFo5HZsdN/s4QdWsRW2ZRkkYs/qz/dcwkeuh
	 Zkxj+VLDtUdHvBAKSPf424+1hTQ1rKh7otBpxSioc7nlKog8ecuj84Or4PNB0VKYYyzkF
	 VvxE1NENLl3dA8DOX7yXkREnp/onwiQsO6R2Suux69mzxXDXTRlvL2oyVVYj9f5oKP3AX
	 CgUaS9FBblA+ugkdGRSaX0U1YTfOwlCrBAC5BibXqIGeimMJ8yaVoOUUFQPBRPv9d/GXt
	 g+ovWCz1iZrU/RU6ryg50wvx/v3sySCIs5r8Ge2Xz/HtWCHwu7P7IRmSfL73yl8V9aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OLhUG1hLaXa/kF9EnkdPlvaJj5GdsFAdoHncTvXoPzg=;
	b=OKeznc3CS0ZRCOyluJiQnaFtMH7AMtfTQNSfmwE/OAd1iRgn9GMMxjeJcDww8Zq7usiz
	 YWR5gkao5All4bex3B0fudt1ZcLFK5xdHy06sE5zYb3QE2lg+lHQam7jaXiAbK8l49E6a
	 fPB+OMiXL/mcnk2KCKNswOEcg8T6R+d96yPBDAphNjTb+ZUw9W1cMyQokNqjJHpOKc/7B
	 idJ/O8UVrWf65DJrk7a25FMmaAeQ2b43TTiDgRL1I9qTcx7GZH7IngIvcPRQKDkxvcW90
	 DrPbDTK8STR5csucbwkBVLcSo+Rr9V3Rr6jUQuv6mIgYDmbDVkaun3xVHhWDuXjhHlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MLjQdggB;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE78960A5BE2
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE78960A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MLjQdggB
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so1441225e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793163692; x=1793768492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLhUG1hLaXa/kF9EnkdPlvaJj5GdsFAdoHncTvXoPzg=;
        b=MLjQdggBVL2AD1h0GOcUcWDuqReZnYU3b9qfaK8ue5A9xcWUG6KfpRAt0Wl6NXqoER
         fZ1HDrz1QiQL3FfIvS4zjI4dCab7S7x0XYqx41AGuJWbB+x77iAlWot635Lg8zYPfePc
         xaMfwHlgUr2ujy60Q+jW6fuwDFqHRv1GG4wR2Zl1k5422MUalyNd3NnsxhEOpsjwWEKl
         13T0iNnDFY5yXvRG6aFInUIBY5ZBHOFFWg+Ol/tNBtk+i0Jiqqp6SZCVRLoJSfyzvVfU
         mpcmx99srpecN3aTgQNnxt5ls9I8+fAg3ynhU2jWvJ2Vlrpas79RjuwjSUmvzI2B3YUH
         59AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163692; x=1793768492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLhUG1hLaXa/kF9EnkdPlvaJj5GdsFAdoHncTvXoPzg=;
        b=W7xIxxawjVlgx8DgFYREKy9yS2DR26A+CYpbk605+dIy7KDKGi/vpPXX9PxgAdD7Pl
         sucHYJK5sFThqExqx9HsJGghcIBIdGbbNXet+Us3P4jPb/yRoQwE8qvQmbJqJorLkDbV
         /02jKCmTEh82hhaRwWx4DEQRYnBCk9p4c7TAwlXBLqDQ3IiKsepOtwxPpw9uyWTE+3RB
         Nc39VvKDw7/HDN/vnWtAyIIZ+60YevV5MYYoGOUYVS174O77DLg6teTpAQXFu8/YPcmM
         tW6g+mtAIsHSkwHz29bKGF0FlMhmdIBCNGNWMdjQkixYTMfMppQfjbymB6LLwWLt6MY5
         U8mg==
X-Forwarded-Encrypted: i=1; AKwUvBxixqsuTE/bSRmB4yCBwIl7M8l1xo7VPPS0qQl2iVMcSHe32stR6yiUagxOrl7XRYrKoMJ/A1CDK5yN2XI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5WXWlWwlh7lJSmpM616MxClG3W6ioPyx3GdYT3/BF82mGS3Nn
	LUkTRkQ2Hz4OTBcyDYsfnJgeokLj4KTyPp9DGAmLCmLgS/ECjyeCh0GR
X-Gm-Gg: AYBFou2oe4UBkmuZHq0baIlvKS64CMAmqZjH6O4xrSglfysfl4WwdlzIvujpi6s5e+i
	27rhoZvAYJurITOUJjjvCjBOGIlXjsLGzXYrvV1FSyo6iECFdaliybhUquaLJSow2V+Bq7WdkOj
	v9oESCCugJJPjjt4eDt2/CHZ/VdN1Ym4qFERH/GrPvTV3xjbYAp0eiPqpabNMbejyJ5S1kbjVI8
	7ke/YQ+KLRIyckq8WngpWiJ8KHrmwDsyiZtzHZ13ClJ7qLc5W4VVFcw6y2G1RuyVbTc1Z8B3tsp
	MekyVDTyKTNEuGhmN5jRk/WqBCgn+YzOKa1XURVkU7APm6M93qErZYGdgWEQS861Fypw0DuW2yM
	eppkckSpPUgaoR+7+IvfWfy5sOf/nCGsBHnPpazDOGfT1ym13ZYMufNneuQNGh+1VxZKsxwDvyX
	mJvNWtHVWfyLPYnrU5lIteyzwD66BbyfCVvSzc3+2RAccqHF4/6u4BFyXpmRrMUmO1EneaucvQ8
	78Uzmq2ssgSQC6SQ/mHPnwOeRlBzsP/aN/IahnO4RfVuA0gaRBw5LNEKUnSrVd+F+Bwmhu3aPYX
	NAmRvUZYTFKTZmbeGgLJummO/jpQCMTmQJkmub0Wd1/lH9m37Dg3W/BJ1WdrLxJ7BbkmUZvBYGI
	ZE6GfRcGkmkSdvxi+AW20ghPGberjm/qUQNRZD5XMjO40nTu18VnTNBkyuapc8zmnagDscBinbG
	+aCC6zzV8n7b/X01o9B6avM9zUppWDaVs3vqk+2A==
X-Received: by 2002:a05:600c:3e15:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4a9961f3d36mr12218315e9.6.1793163692052;
        Tue, 27 Oct 2026 22:01:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94eb8a60fsm13523365e9.3.2026.10.27.22.01.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 22:01:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] KVM: selftests: arm64: Test pending writes to active level IRQs
Date: Wed, 28 Oct 2026 06:01:13 +0100
Message-Id: <20261028050113.10046-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028050113.10046-1-kmehltretter@gmail.com>
References: <20261028050113.10046-1-kmehltretter@gmail.com>
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

Add a two-vCPU GICv3 test for a level SPI set pending through
GICD_ISPENDR. Re-pend the interrupt while it is active, first from the
handling vCPU and then from the other vCPU. Require a second delivery
after deactivation in both cases.

Also check that the other vCPU observes the initial pending state
before the interrupt is acknowledged, and that a remote GICD_ISPENDR
write before the ack merges with the initial pending state without
causing a second delivery.

Without the VGIC fix, the pending state written while active is cleared
on deactivation and the test fails before the second delivery.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 140 +++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index 3cb85932ee85c..83091e0384c22 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -959,6 +959,145 @@ static void guest_code_timer_spi(struct test_args *args, int cpuid)
 	GUEST_DONE();
 }
 
+#define REPEND_READ		1
+#define REPEND_READ_DONE	2
+#define REPEND_WRITE		3
+#define REPEND_PRE_ACK		4
+#define REPEND_PRE_ACK_DONE	5
+
+/*
+ * A level-sensitive SPI that is set pending through GICD_ISPENDR stays
+ * pending for every vCPU until it is acked. If it is set pending again while
+ * it is active, it becomes active and pending and must be taken a second time
+ * once it has been deactivated. The second pending state comes from the vCPU
+ * that handles the interrupt in the first round, and from the other vCPU in
+ * the second. A remote GICD_ISPENDR write before the interrupt is acked merges
+ * with the initial pending state without causing a second delivery.
+ */
+static void guest_code_level_repend(struct test_args *args, int cpuid)
+{
+	int i;
+
+	gic_init(GIC_V3, 2);
+
+	gic_set_eoi_split(1);
+	gic_set_priority_mask(CPU_PRIO_MASK);
+
+	if (cpuid == 0) {
+		u32 intid;
+
+		local_irq_disable();
+
+		gic_irq_set_config(MIN_SPI, false);
+		gic_set_priority(MIN_SPI, IRQ_DEFAULT_PRIO);
+		gic_irq_enable(MIN_SPI);
+
+		for (i = 0; i < 2; i++) {
+			gic_irq_set_pending(MIN_SPI);
+
+			if (i == 1) {
+				/* Not acked yet: the other vCPU sees it pending */
+				WRITE_ONCE(args->shared_data, REPEND_READ);
+				dsb(ishst);
+
+				do {
+					dsb(ishld);
+				} while (READ_ONCE(args->shared_data) != REPEND_READ_DONE);
+			}
+
+			GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+			intid = wait_for_and_activate_irq();
+			GUEST_ASSERT_EQ(intid, MIN_SPI);
+
+			if (i == 0) {
+				gic_irq_set_pending(MIN_SPI);
+			} else {
+				WRITE_ONCE(args->shared_data, REPEND_WRITE);
+				dsb(ishst);
+
+				do {
+					dsb(ishld);
+				} while (READ_ONCE(args->shared_data) == REPEND_WRITE);
+			}
+
+			GUEST_ASSERT(gic_irq_get_active(MIN_SPI));
+			gic_set_eoi(intid);
+			gic_set_dir(intid);
+			isb();
+
+			/* The second pending state must not have been lost */
+			GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+			intid = wait_for_and_activate_irq();
+			GUEST_ASSERT_EQ(intid, MIN_SPI);
+
+			gic_set_eoi(intid);
+			gic_set_dir(intid);
+			isb();
+
+			GUEST_ASSERT(!gic_irq_get_active(MIN_SPI));
+			GUEST_ASSERT(!gic_irq_get_pending(MIN_SPI));
+			GUEST_ASSERT_EQ(gic_get_and_ack_irq(), IAR_SPURIOUS);
+		}
+
+		/*
+		 * A remote ISPENDR write before the interrupt is acked merges
+		 * with the initial pending state and must not cause a second
+		 * delivery after deactivation.
+		 */
+		gic_irq_set_pending(MIN_SPI);
+
+		WRITE_ONCE(args->shared_data, REPEND_PRE_ACK);
+		dsb(ishst);
+
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) != REPEND_PRE_ACK_DONE);
+
+		GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+		intid = wait_for_and_activate_irq();
+		GUEST_ASSERT_EQ(intid, MIN_SPI);
+
+		gic_set_eoi(intid);
+		gic_set_dir(intid);
+		isb();
+
+		GUEST_ASSERT(!gic_irq_get_active(MIN_SPI));
+		GUEST_ASSERT(!gic_irq_get_pending(MIN_SPI));
+		GUEST_ASSERT_EQ(gic_get_and_ack_irq(), IAR_SPURIOUS);
+	} else {
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) != REPEND_READ);
+
+		for (i = 0; i < 64; i++)
+			GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+
+		WRITE_ONCE(args->shared_data, REPEND_READ_DONE);
+		dsb(ishst);
+
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) != REPEND_WRITE);
+
+		gic_irq_set_pending(MIN_SPI);
+
+		WRITE_ONCE(args->shared_data, 0);
+		dsb(ishst);
+
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) != REPEND_PRE_ACK);
+
+		GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+		gic_irq_set_pending(MIN_SPI);
+
+		WRITE_ONCE(args->shared_data, REPEND_PRE_ACK_DONE);
+		dsb(ishst);
+	}
+
+	GUEST_DONE();
+}
+
 static void *test_vcpu_run(void *arg)
 {
 	struct kvm_vcpu *vcpu = arg;
@@ -1073,6 +1212,7 @@ int main(int argc, char **argv)
 		test_vgic_two_cpus(guest_code_asym_dir);
 		test_vgic_two_cpus(guest_code_group_en);
 		test_vgic_two_cpus(guest_code_timer_spi);
+		test_vgic_two_cpus(guest_code_level_repend);
 	} else {
 		test_vgic(nr_irqs, level_sensitive, eoi_split);
 	}
-- 
2.39.5 (Apple Git-154)

