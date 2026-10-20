Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505141;
	b=vIrvlTwW/NM0HTaM4phvWrIWrRcQ7qEoDY8+ZfeQLjeEAJRab7Am3O5hzEvEuiOs+Hyl
	 LD8GYKxQ+HiTTJAaBXGBpBZ9aZFw4W3AKPxT3B/clA+096tnqZ3CdcXR4Ul5btLI/h/Na
	 S/b9aThEH8NKPCLo4VCZKz46iGMISpTPAmCIzMj/rCaW/zfG3o4A6XMOVlW0CNYA+PJ6B
	 cOOPNeUzMOAE6uX3C0HrB6tbfBJgvzL+bMRLAEdTdyXkVIseLudpmYjGSK+F21e2q9zsJ
	 gPjmi1GzznKEwEn92nQCNtcOHebMdlbNgpI6r1Dj2hBbVk6tv4JIIUclZq/1wopMc4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jkLumwW0F/yIPW3a3VULflIMMv5oMLlwkuByskuyIMU=;
	b=LgH8BkEpFWWGFzTbwymAXl/IWF9XatfKT/CNNf/xo3a+mtT6w3N68dR+xD/Bxn5l++pj
	 9S9qlf1XUD4z+H5TWo8Y710QqmOyz/qyXuqmvgKMZznNOcXQC1cnrayz4/sW08dp2/13R
	 vjp9TF5JHSTFduSC8tUEE4bZtcTR6YuIMVTH4guUkqW3iisgTqqUsPY2wvP+vKNPhArQ6
	 fh1ePTSmz9m4V9cCNUREj5oP1vINPx9WIakKXsXCv9ePbBMLQxqSquXZE2YT7ai0Jq4PT
	 vItbIG/EMZNvzhWrA7zGMh29IyvvMOWPFnBKSIn1yYMhscBYvwjOhFHBOs4oe9fZ86w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eZYsUue7;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19019606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19019606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eZYsUue7
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so656021a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505140; x=1793109940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkLumwW0F/yIPW3a3VULflIMMv5oMLlwkuByskuyIMU=;
        b=eZYsUue72ruKyTWdv3j5zsViPhrAEs0rf6WaSRCGjlsqZcrZIvuDBwR4csUORdFAKU
         NlB6Exw0pT25ctj7TVMWsj6zPxduU6kp0PmXzj9XKzf8ns/PEOlt3cgnkcb5VNug0o+l
         PN0hI9nnRFY0JrrnM+Hwa29l+164dAKRhovDid323MSYW8ErhA1lOQJ3PQBggrTGnpZo
         9tVlxi2FUH9V0qp6dfM9GAA6jgIsPAoEa+S0Mfe8lK5gGL2wMpHuEV7wvSj6KX+rbz4O
         orDQknHgwEkw+BLp18gBJAA6TknaawDJX5Qqkhj5N3ZLW1EUFyuiJS4aNqDoPGi8rSwR
         IBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505140; x=1793109940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkLumwW0F/yIPW3a3VULflIMMv5oMLlwkuByskuyIMU=;
        b=2lF3kGJX7CZD8Bi4vuor7YT8sTV+U7gCXhyP7bqNyBK2bAvxCtVCmyDWi8yBq07SRS
         GeLANE/XVSs2J2p6SojpIakm5Bq0ZydP/hC49sp5P9esvWh7g0hL9HXkyCZeDDnqHoNR
         4xKKLdcdxK+P2yaNyihoJAShUH/HzOPGPBopLSXP/BhyfEbOUEKnhhTjBA6Aw5vM7sBc
         F6T/dXeIPkvvBwaoKWVekTjrBTUkjOSSqclKQYwr7TPA6CSjnl1ZvMfPela0bDBqwWFc
         Kcjv5jQZZanZN1yDvkxjfYyko2BSVTMTY/qhvB1uSR+qB+lersxJ2fEd8qoQwTE2zro/
         S3gg==
X-Forwarded-Encrypted: i=1; AKwUvBw9FXwp/Bi9CHiyGh0DhCu4q6B8XskAalQWfhJaPH9nOJVdbUXrDVcfMQioPq8eIFAzWVVrFKmHXQlb3Ls=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2CQbX/K8s0bDRsF4aXeEndc0cFwzMF3rD3U37wlEHzzAUgxcU
	PJoiY7VEKL6plukmsj6pCoNRuYUhSgbe3uBWh+1ruRUOljs5dOEqOdMW
X-Gm-Gg: AYBFou0s7thNjdboN5JNkjK3lGc3DUURh50EPIKKCzDbusqlLxCCfCKhSq/+Bt8HkM2
	lOVGdHc2UosxpuRgxPPv31xmqiOmHCn4X+vcbvyhyMuoh6zg6r2K9acgjYrTMAvvpzSof5zNYm/
	OyvmSg24fbOf4Bt4TlPVTmSOCSs24vT1XoCVFLhgJ7C/nv7cAmLNLq3q5oSys71OiovW8CgCRKG
	uKijQmeq+6m4MVZ/HSka0C4SrRaAEY4eh9GYw0DnIsP+jxkfbieY1SrLs66OeWvWrFOAPZD5wlR
	fRwhTfssfL66+FlSDAWufkLUVcXsQfwhR3Q+9RVFSowdYXsdaqySb/MYGolQ2Idwf/WMSbvyZDj
	Mfwz8EbwwxwnUCtbvd44OMYzzLQS5P4fmCO/dUkB/eYvTGkfQqS6PfYr9IQm4W79SFYFPfRbRuZ
	g7FYpWgticzTS4xBBtTRYygVcW1JOyYfgQjAotMnBnxlc60/7zospRL7RjZxNTzW5WyoB/1vIcy
	T3oX+6wO1JEvDAar+R9lPleeLOoWDcJ
X-Received: by 2002:a05:6a00:3e24:b0:881:be70:448e with SMTP id d2e1a72fcca58-8a04d34914amr8255299b3a.53.1792505140313;
        Tue, 20 Oct 2026 07:05:40 -0700 (PDT)
Received: from HXDQXTDYHN.bytedance.net ([203.208.167.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a04493551csm3769242b3a.44.2026.10.20.07.05.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 07:05:38 -0700 (PDT)
From: Jinmeng Zhou <jinmengzhou22@gmail.com>
To: sarunkod@amd.com
Cc: Jinmeng Zhou <zhoujinmeng@bytedance.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/amd: Reset IRTE notification bits on every GA update
Date: Tue, 20 Oct 2026 22:04:58 +0800
Message-Id: <20261020140458.13755-1-jinmengzhou22@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260821055611.27138-5-sarunkod@amd.com>
References: <20260821055611.27138-1-sarunkod@amd.com> <20260821055611.27138-5-sarunkod@amd.com>
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

From: Jinmeng Zhou <zhoujinmeng@bytedance.com>

__amd_iommu_update_ga() clears GALogIntr when the vCPU starts running,
but leaves GAPPIDis untouched, so a GAPPIDis value programmed while the
vCPU was scheduled out is carried over into the running IRTE. GAPPIDis
is recomputed every time the vCPU is put, so the stale value is only
ever visible while the vCPU is running. GALogIntr and GAPPIDis are
never both in use, as GAPPI vs. GA log is selected when the IOMMU is
initialized.

Clear both bits up front and let the not-running path set whichever one
the current wakeup policy needs, so that each update fully derives the
notification bits from the new state. The only resulting difference is
that GAPPIDis is now clear, rather than stale, in IRTEs with IsRun set.
Update the kernel-doc accordingly.

Link: https://lore.kernel.org/all/20260821055611.27138-5-sarunkod@amd.com/
Signed-off-by: Jinmeng Zhou <zhoujinmeng@bytedance.com>
---
This is a suggested cleanup on top of v4 4/7; please feel free to squash
it into that patch for the next revision.

 drivers/iommu/amd/iommu.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index d89e3ce97e57..3d4d44be1ecb 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3962,13 +3962,19 @@ static const struct irq_domain_ops amd_ir_domain_ops = {
 static void __amd_iommu_update_ga(struct irte_ga *entry, int apicid,
 				  bool wakeup_intr, bool is_running)
 {
+	/*
+	 * Derive the notification bits from the new state on every update so
+	 * that an in-place update doesn't carry over bits from the old state.
+	 */
+	entry->lo.fields_vapic.ga_log_intr = false;
+	entry->lo.fields_vapic.gappi_dis = false;
+
 	if (is_running) {
 		entry->lo.fields_vapic.destination =
 					APICID_TO_IRTE_DEST_LO(apicid);
 		entry->hi.fields.destination =
 					APICID_TO_IRTE_DEST_HI(apicid);
 		entry->lo.fields_vapic.is_run = true;
-		entry->lo.fields_vapic.ga_log_intr = false;
 	} else {
 		if (amd_iommu_gappi) {
 			entry->lo.fields_vapic.gappi_dis = !wakeup_intr &&
@@ -3990,13 +3996,13 @@ static void __amd_iommu_update_ga(struct irte_ga *entry, int apicid,
  * a vCPU, without issuing an IOMMU invalidation for the IRTE.
  *
  * If the vCPU is scheduled to run on pCPU (@is_running = 1), configure the
- * Destination with the pCPU's APIC ID, set IsRun, and clear GALogIntr. If the
- * vCPU is scheduled out (@is_running = 0), clear IsRun and set/clear GALogIntr
- * and GAPPIDis based on input from the caller (e.g. KVM only requests
- * wakeup_intr when the vCPU is blocking and requires a notification wake
- * event). This API is intended to be used when a vCPU is scheduled in/out (or
- * stops running for any reason), to do a fast update of IsRun, GALogIntr,
- * GAPPIDis and (conditionally) Destination.
+ * Destination with the pCPU's APIC ID, set IsRun, and clear GALogIntr and
+ * GAPPIDis. If the vCPU is scheduled out (@is_running = 0), clear IsRun and
+ * set/clear GALogIntr and GAPPIDis based on input from the caller (e.g. KVM
+ * only requests wakeup_intr when the vCPU is blocking and requires a
+ * notification wake event). This API is intended to be used when a vCPU is
+ * scheduled in/out (or stops running for any reason), to do a fast update of
+ * IsRun, GALogIntr, GAPPIDis and (conditionally) Destination.
  *
  * Per the IOMMU spec, the Destination, IsRun, GATag and GAPPIDis fields are
  * not cached and thus don't require an invalidation to ensure the IOMMU
-- 
2.39.5

