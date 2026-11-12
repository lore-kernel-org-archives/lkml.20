Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504082;
	b=z4UyEe/Ne3ZaaUVKy4mGnE9OEW/ij8S+OzYy9sSjhSS6wu3gkkCFTTjdA/HgripC2SIy
	 w5yCjPAsp/dEedWhrnNhPOi6Y3c6v75i4Mf6DthW2mXHb6hmk9HWFj4jkGS2DPRmD8WXF
	 NzbfE+8y/Gs+jVyeBQT0YJ0BlpQ6EAEeyxZJjYO/YxweXCEAaxQW+rMSnZNqD7sEiJKUc
	 s6VlqU3eCeqV8yGSF5U0rcq5CTA8vWPyPV+d+G0arIRA6I58zVxD3c1fmPcJyyIPLXxLI
	 Ouo2qsvyPETNH9HrV1iX66ezK9GvMVdR+D9msSAM9Y+W8WaSDDEgTDfugdy7aF+TMTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504082;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=5yEBX8ZKycqZOP6+Y73EyUw52cEw6hCVyTtC7UHxHx4=;
	b=1U2k1YAIryf4mjGApKerZnoedgT5rY2bO5/g7/OTZhtH8T2QNx+TGxzlayCYKrwuc2FT
	 qED8J0Rw/0ef31eNQtyQz4LB10btnC3L1geCoJ142PUQKuHon5k95Ocyi1V1eVpglhcws
	 1fr4A12j8K2wnJUw8oGSiLbdO6K8T+Fkz/qSBHHHhXuvU6C4TbHrYUib50OweOiQHx9zd
	 xK0pcwEFfTcivOyKi5JhpvLRaGYGiLLfMGh0MfVvPONWmiq7XrboRYVCWhwxLcImRhO8x
	 xrOxhmrRaBuo84sYtYH1pA4XubPXaOXGdLHpllOz+tvGTlMZIvsDpcGyDIgZ450qzaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=m973B4rI;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FC4606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18FC4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=m973B4rI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=5yEBX8ZKycqZOP6+Y73EyUw52cEw6hCVyTtC7UHxHx4=; b=m973B4rIKJKWkH31TLIyylMdEG
	h2FYJt3osVqGgZAKePwq8VGo8dr0WXFB/Sjr2pO6T5V7CSOEP5HqzAhUBhCesVLoDRG81ldhZt4fx
	L+b7r7MxSoTKVKDZ6ZbywXqnHTb6qbWiCWtCWgPoebHp3eeoZmZILjqkk/ttpbfqpMdWGicVgKmC6
	Kg5Op+G+2qxHLHQjoTz7MnNLfUN2nM7cdc2M8gSW/VJIPIxqJixZ0daIuaec8h99Uj5mz0HZJal9b
	s2Je+/s4YfqiYcA4ht8yohRl9a8KzJuCR/Iw3bfWPx/Kj4pkkIP+NMPSfzIDwHLBsyMP4+PEtm031
	XXUPdQ5Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRYUA-00E84s-0a;
	Thu, 12 Nov 2026 17:21:18 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 12 Nov 2026 09:21:07 -0800
Subject: [PATCH] arm64: proton-pack: Don't query firmware for Spectre-v4 on
 SSBS CPUs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-arm64-spectre-v4-off-v1-1-f03c21744559@debian.org>
X-B4-Tracking: v=1; b=H4sIAIL19WoC/x3MTQqAIBBA4avErBtQk4yuEi0sx5pFP4wRgXT3p
 OW3eC9DImFK0FcZhG5OfOwFuq5gXv2+EHIoBqNMq7U26GVrLaaT5ksIb4tHjOiUi01wtlHdBCU
 9hSI//3YY3/cDw0OtA2YAAAA=
X-Change-ID: 20261112-arm64-spectre-v4-off-707f3d74308b
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 atish.patra@linux.dev, thepacketgeek@gmail.com, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261; i=leitao@debian.org;
 h=from:subject:message-id; bh=LWkbKAGp3Y7xDCW1oETznHpRWADRbc7ruRh+moLNX7M=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq9fWLed+k3k0ibZR7//SagnIMHagA9+NN/gfB7
 7QsG7yM0N6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCavX1iwAKCRA1o5Of/Hh3
 bUl3D/9s4UxixQz9H1237FraklLHh/z3vqlJrSBY/2LDDrBkVI3UJu9lMIQRl/+/1lZpj0/6Nq/
 aRYv6fgyL4/j44IJiNHyMQLADFuZBlS2oJOdHvODgSLJhfcuCxpQxovcfZWaa5iFmjeUdL6FBS7
 mwNDby/KY9vrPsvoN5oraVm1wC++s0rP74QdnDhWV5d9kJMMs4jBERlZ+ZUp7A1SR/+wzsRHOXB
 NpfhkeHSnGaedEpau4ntrMmI/rcaaUM8Dlh6kLIh2G9CIC705aUq9p6WiHL3OUM4HElr0L3UUKv
 3zHtzvn4+p544aVs76lkvbb/8tLWBtXeCck4o0fKwmR6TH1lYP38zEHfVjK+fqvPdN2e7z8BCcV
 Woc/SGT8REoodInHG8vSA4ZVeOpnU6Mbnksd2RmhwEWmvB1QT1/csNDsqfV0XLZQSji4xu0cwmB
 G1Oo1Ew80kEqAQGeysOyv8w972Z7DsHHQFDKfxfkaGmqI3ihpqiZARSLUnl9SMhYrN2emoqmE1T
 xWnxE/NfyRUJHPyixAOLe94XR0MLOhGjpkACaKQRAZWF1CuZz0pBwE/7IY0k58Ecy075lqC4rJO
 ru3QCj1umUHfl2kJPtHm7eNDgoFSbdgbuJZ1vqhunWT6j2U+MPx5NVKpUtx/JnEm5Nr0BSVSvqk
 zphorDxVfiFCXrQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

On a CPU that implements SSBS, booting with mitigations=off or
ssbd=force-off makes spectre_v4_enable_hw_mitigation() set DSSBS and
PSTATE.SSBS and return SPECTRE_VULNERABLE. spectre_v4_enable_mitigation()
then treats the CPU like one without a hardware mitigation and queries
firmware for SMCCC_ARCH_WORKAROUND_2.

Firmware answers that query about its own mitigation. For a CPU with
SSBS it can report that none is needed, as
SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED or SMCCC_RET_NOT_REQUIRED.
spectre_v4_get_cpu_fw_mitigation_state() turns both into
SPECTRE_UNAFFECTED, so spectre_v4_state keeps its initial
SPECTRE_UNAFFECTED value. The kernel logs "detected: Spectre-v4", then
reports "Not affected" in sysfs and PR_SPEC_NOT_AFFECTED from prctl(),
although every CPU runs with SSBS set. KVM follows spectre_v4_state and
tells guests that ARCH_WORKAROUND_2 is not required.

Before commit c28762070ca6 ("arm64: Rewrite Spectre-v4 mitigation code"),
a CPU with SSBS never queried firmware, and the same configuration
reported "Vulnerable", which seems the correct approach, given
mitigation=off ?! Same for prctl().

Only fall back to firmware on CPUs without SSBS. When
spectre_v4_enable_hw_mitigation() returns SPECTRE_VULNERABLE for a CPU
with SSBS, the mitigation was disabled on the command line, whatever
firmware says.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/proton-pack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 3bcf86154d95cd..80c5f6a198241c 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -638,7 +638,7 @@ void spectre_v4_enable_mitigation(const struct arm64_cpu_capabilities *__unused)
 	WARN_ON(preemptible());
 
 	state = spectre_v4_enable_hw_mitigation();
-	if (state == SPECTRE_VULNERABLE)
+	if (state == SPECTRE_VULNERABLE && !this_cpu_has_cap(ARM64_SSBS))
 		state = spectre_v4_enable_fw_mitigation();
 
 	update_mitigation_state(&spectre_v4_state, state);

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-arm64-spectre-v4-off-707f3d74308b

Best regards,
--  
Breno Leitao <leitao@debian.org>

