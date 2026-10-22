Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651608;
	b=5XFyVmVtEYDv52GiUY1wtKeKFmlNSm3e+3wirBi54aJT6lqbGFPXVdJxVKSTolre3G/j
	 YAC8F8e5UZvL3iNKyK3r8VibaSFH/7S4HqhgV7xvFG1DqKE8qJ7gs6ePagAgDDZmwfV3T
	 jRdvlcgib3V1g4f/QMfRI0mV3zfalLasOt5iD6cVDE9I2MhUxsE/Gn9PH1HuJfH9w9RJT
	 HPj6Px7VjXgSx9kC4VEFgHtsaVzzcX8g1qe5M+vKFqGDK2xjMwlg9OPXgXm6V5tems+3r
	 CffNAUW6rzxpUBoQ76uOX6ciJRHyiX3xa55PTH7ZfynORzgqMXyQ/VRs9LE7N3NXqag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U2m1NOxjt9F2BRgX+AxlY6ccXZ7NGdaeYHeYEfzi92w=;
	b=ZQ2ooncmiUAiOIHiRU4xcQ8R/WKDW5hyEivUN9AVRltRbXJcUSPgUxw22QpilaWIb1wB
	 4PH/NNA1df8S1OuYVJYEyTCTd7NuQ2Eo1Bc6fJseiyxl5nMy9rG7NiWAhtkhv9nDvhKrl
	 Hf+hBSdBA4ZbDXsi4imfjgV1vqY55wy8xd1XezE+P75wu3DmFBn/7sxe3/gLg1nL3JXV0
	 cQTSt0xzvqTBORhCtYEFT+T/b+pQKcPL2RVCJwPds828UPN74f6JpWuuDbbNQeGEsXx2Y
	 5dIyRflexUtYKW7ZdBldN3FXJvGY0XBD0toNqNmX24L0qfAFTU7xCosdZO6SjVq3cng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GF7ZGPL6;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61E2606A336
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D61E2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GF7ZGPL6
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b060ec084so1115662f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651606; x=1793256406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2m1NOxjt9F2BRgX+AxlY6ccXZ7NGdaeYHeYEfzi92w=;
        b=GF7ZGPL647B+FNnG04dpET3G8O5xXb61EKo7cJWaxZ39oPa+V/POXl/DjBPqCyvukr
         uxvVa726bZh5CWEE9C7t29Ca44cLmFKZB8DJAH7gHp2zbYn6eGy3iw/+MTdY/Y+c1dLd
         bsFmozeSaCQlewtrAFN3OOFEDHko98J7y/YjiPzAcRPMrS20L8WbdKJ9qmumOOE4DVoc
         l2PknbSPoWVGrlc5N7LF0nwMjR892vdBSDTGyLSerl6iFlzmnvYoF/OysRdU1WZs4YeE
         K33nwxsxDqHVwCzDED4gqyWjfL/dhrrbehq2DtdmXAZPe0x51KBUtwPLlLd3WNi+aPr9
         1/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651606; x=1793256406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2m1NOxjt9F2BRgX+AxlY6ccXZ7NGdaeYHeYEfzi92w=;
        b=w2A21NaurjNXvZpKBRwxPljh4OlIUxzUIT7RVYxs0xQXSeQUbf+s8LrJiinJtxT+hB
         Y+Zbrb01CPQkRW7hRCPm/pVev3EzPJt+kTNjsLsTQHUERw+Pv2T+XIV6xdpwBqyVgX2J
         wOJVFqSUWjE/kRfBv76YWXgRL7HQ3s3sGTHt/wELK/uu7bpb11isCbpB8C2FRLsM9idN
         KocDNeiOvUTaArJkSdI4uLb33Zy2NjuZhQBNiSr30bX2eugAyy6RGoyNWC9fTgOZusDR
         yAPwiYxP6j8WkgL8/7cn0Prt0WOSe75EY+OKJT2iVy3Jj5KPkzdA43Bi8BaKHBjiymNX
         wcHA==
X-Forwarded-Encrypted: i=1; AKwUvBwuWZ+F6R+5FZldqFTFk03u+vCCXwHeADfktYGs1JGIBxS4HUvneVpIhcUQez/oZyIQFipPyGS/3TZ9MTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+cGIO3e2Nn8PlzbYGU1QYoWXT9OZtSdtWMNnxOuHpcDB5pAPS
	s45XsTqXtkGjUUvdysX5zCKfg4DpWpbVkblcmLGjp4ZtETXOJ5B+/zP/
X-Gm-Gg: AYBFou11MdFU61qT8TTiE7IL1mw6nCN2X7vBbhtzV/2mbvXoOBKdY//mT2THQegr3Ki
	0mNK+8dCSdIjyOG/4cDfgNsyDEmBSp2UUeGnOO383yfAs614cxapF0spvubmAzo3dp/4EOOL/Tm
	7UbJKB6MviKdHI/3G8R0DDmsARL6NA1IsB3svx89vufLp8elpATW3brEU5VxG0JBElSIsNS7g1u
	Pn7JXSz6JSDaKyyX8adr1e3E/rJTUAVFmrUQTzZgs29AjJ/rTYnSEjy2FSpfdjVYFRRQC/ZA0Sw
	lITKyFxobZt1OX9IuWJSeI1IrxMoUkWZmQJo0zkz0gDzPyBpf8EN968ZbmM+6WGvKKBuF9ZCAoJ
	fwWkwdnGHfQIAP5vei5kO3Zu97xx4eCQlPOYzsj5YAaN2jkjiUBtsg3OkGgIkyQacFgexn9D0S1
	JNiDQ9G5x5xJRb0n9vv7Z2RnuFXKAgKDpOU3Y8O0a2nRxgk9Y8aQ9dt5w+jfEc9qyxxofLZHajO
	NJrSFl7xQDAY355EWtmkho/1Fc9Rns+ZcysFGSMgIGHH9pi9+60TJlv70h1Hp+XkwBD+3JbS3zt
	caxTFvXPy1qA+dycB1VexS40FbPVDMv2VLMBzFshT1MqPU0K2G8uruZVFcpu6957/4bsYT14uPv
	uazt51+UXQTfUGt9Gapt6j871VV9IuQm5mS2PnJLL2Sjocofp4zbjvKj8xypchDTgYg==
X-Received: by 2002:a05:6000:310c:b0:48d:faf4:54a8 with SMTP id ffacd0b85a97d-48e26493bedmr9081092f8f.11.1792651606193;
        Wed, 21 Oct 2026 23:46:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm10215624f8f.22.2026.10.21.23.46.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 23:46:45 -0700 (PDT)
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
Subject: [RFC PATCH 3/3] KVM: selftests: arm64: Test pending writes to active level IRQs
Date: Thu, 22 Oct 2026 08:46:28 +0200
Message-Id: <20261022064628.4206-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022064628.4206-1-kmehltretter@gmail.com>
References: <20261022064628.4206-1-kmehltretter@gmail.com>
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
before the interrupt is acknowledged.

Without the VGIC fix, the pending state is cleared on deactivation and
the test fails before the second delivery.

Assisted-by: LLM
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 101 +++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index 3cb85932ee85c..81f38e523d3c0 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -959,6 +959,106 @@ static void guest_code_timer_spi(struct test_args *args, int cpuid)
 	GUEST_DONE();
 }
 
+#define REPEND_READ	1
+#define REPEND_READ_DONE	2
+#define REPEND_WRITE	3
+
+/*
+ * A level-sensitive SPI that is set pending through GICD_ISPENDR stays
+ * pending for every vCPU until it is acked. If it is set pending again while
+ * it is active, it becomes active and pending and must be taken a second time
+ * once it has been deactivated. The second pending state comes from the vCPU
+ * that handles the interrupt in the first round, and from the other vCPU in
+ * the second.
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
+	}
+
+	GUEST_DONE();
+}
+
 static void *test_vcpu_run(void *arg)
 {
 	struct kvm_vcpu *vcpu = arg;
@@ -1073,6 +1173,7 @@ int main(int argc, char **argv)
 		test_vgic_two_cpus(guest_code_asym_dir);
 		test_vgic_two_cpus(guest_code_group_en);
 		test_vgic_two_cpus(guest_code_timer_spi);
+		test_vgic_two_cpus(guest_code_level_repend);
 	} else {
 		test_vgic(nr_irqs, level_sensitive, eoi_split);
 	}
-- 
2.39.5 (Apple Git-154)

