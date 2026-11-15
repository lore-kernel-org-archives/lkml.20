Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794733402;
	b=TYuCqthqfu+iFWuFJg1t411K2mkfXpPaiglPtNvKrphrLygT05GoRRDdHKB14hVulBho
	 uJi1tSWUu3uwMBm8uKXKHnNlS3BCDsasbIHQRHyw4E9LQbO7FaA9cOCrWoIH1PVi2nSMa
	 EFHOGz5a7SK4QdkicJ0oWZNAoAYxCm12SD7V8XhIDSO/Ai0jgSmI65OeZf/OEj5F5lsSq
	 ooyy54JWToxsAsstBsnL9x6KTmo9WVpjFPYFVFgOizQdVMdBdXNPjxyoxSfboEgtrXQNp
	 JN1PHZI1CTvf/ZJMtUwPpqQ3TKOGmMhp0aehnUKsgti9teAFO65++Fu7bAU8ayVOrYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733402;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pMba/fAQ9LV5HZY7mVQeguaGAhXHEn/TxlAqRbl3dpI=;
	b=gcene4qXefznucPohBSCMzzIlzHICIAJhKhDFcLJBZLLGogk1f61nzH/N228piMMqA/V
	 InXmiqJnNvdRYhoLowzwKRM63qoPHWN4eUdDjDfW52lsdAjuLH+n5x5wW2SoloIQusLXh
	 magtsVhA+lguaR/euXyttKAM1GKrnYDx1LCY/yOLnN6LtUgkN9vBPgkOu96NF6ZESiOfs
	 ROOa1hDWQyDXodC6Jp0soJV4HttuY8Y40m7gHpzyivkZt39DPZxeUVoFTvR3fOl1yF4AW
	 klJfZnRUmtrowWvdWSiRMn0iSEisd8mtaU1UQKE/KaXIGSsLWW4r+4bgzxgX8KUsY1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CYH9GlQy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96AE606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CYH9GlQy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794733402;
	b=bVKVw+qZVYU7HAJ/OhAFDDbArUUBOd15wGMpQZ1u1mpvTpZRSNh58trMWGu/t1A3nwva
	 sMsFmzjaKND213mujfG3F9frt2DRaswVG83sU5eW2j4U5MrTYfwjgTsbtS8i5BIwyiYJf
	 /f9cY6aHSPG1U5wkPB4yeSYAvTSTkSH5MdwbfTfbxs3r2c34RNGxKwGWUknPABZNElgQ5
	 CddhaB69NypJplqCYCs7sRgGqD2zGmTCYl3mOAP51AdK7HbqAF0mUoaqG5oGxOpch8XKb
	 NXF7U//xGntI11bqbTtI6nhX5zdKJo/8y/Mwd/zONrwVJqdH7H67TpT93YxXU/YOIfw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794733402;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pMba/fAQ9LV5HZY7mVQeguaGAhXHEn/TxlAqRbl3dpI=;
	b=KLX65OM9lhiAkPpMnLgW1FdtxWuT4DbIY/MoA3joAcZTWXTDm/TiC9rD5BVpNEEMdCd3
	 nuhR8DfsbYsykrCqAJGGa+y7JQuCYfMPIZe5MLKvOuiZFnNArAWMVzK2tdGPSa6wgqE+u
	 0ak2JMtbfLFM+TJDsv6WLPSYr7RSRy8FquQeDy9PpQ1DqytU2vXUVl4U0//d3KxePOwHl
	 41oyKE/gNW7/0rELD2COc92co6vCTTsjrcB34ct76rOxHibDESmpYcQLHM/0fbFtpkxmL
	 qzTG6X/eopNM2qgFWotDcXuvsa3GsgT/1cvu+ywP3azR4XB/A/6q7qaQh9/C3YlPOMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B40DF1F000C4;
	Sun, 15 Nov 2026 09:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733402;
	bh=pMba/fAQ9LV5HZY7mVQeguaGAhXHEn/TxlAqRbl3dpI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=CYH9GlQyHnMYy2R6GVab9NhUWATMxFt1X5zbUR03c46dHBajNGwNbafA0pbyeCDA7
	 +1ZSYYLL6aPa1eeuM9gBu3U0n4kvC+Qu0OwPWBtr1FEYC8/Hz6h/FjJbcidCKv07tJ
	 cDTIu9R1eWUXLurBMZbMbPL9iscBhjDrOfnRGYY6tYZUKzbrAche0iD0c1kZIzlNA3
	 1Hvj2jTJr8S8Z4Hx4RIH2LsbEDqcBW53kos7J81X4P15jxI7SE8eM5eai6zPF5VTLP
	 oeMxlXfmLDKj+UpTI7lxIagU7gJlVm66HBndWZ3RoTt30y7dGzhhc+q3h6pt+JmUnj
	 pgn1uGHMrLTxg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 155CE49FF3;
	Sun, 15 Nov 2026 09:03:21 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 09:03:21 +0000
Subject: [PATCH] tee: optee: release the supplicant when its device file is
 closed
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
Message-Id: <20261115-optee-supp-close-v1-1-4e0b14f3a97c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrDtgrGbhVUoXNf6xU8SEjEpBv
 LtRl9/ivY0USaDUFhslrKISpgzzKMh9P9MAlj6bqrKyxpiGQ5wB1iVGdmNQcN30vvQe1nZPyll
 M8PK/lq/3bV26H9x8fmjfD+bgvR90AAAA
X-Change-ID: 20261115-optee-supp-close-45df0ffe66b3
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794733400; l=3584;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=9VPYkWm0p8RjYbs/Xy1bmWk92a26aVMFxpnV9Mp2w/8=;
 b=Vm2WeCPp3VonzpMnH8cSV0X4bM7QePHJCcJnN8/8V3p/J8S5tIPV75Yzfj2bQyixAoHBBl+cj
 5m4ij9PXa/eDzjhvstMuhbyySZ/N+4LeOcDVuOzlQsJd+4UKXIfGMLU
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

optee_supp_release() runs only on the context's last reference, which
RPC shared memory can hold. If tee-supplicant exits during an RPC, the
next request waits forever and a new tee-supplicant gets -EBUSY.

Detach the supplicant in .close_context instead.

Fixes: 217e0250cccb ("tee: use reference counting for tee_context")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Tested on an Orange Pi 5 (RK3588S, SMC ABI), 7.3-based KASAN + lockdep
kernel: tee-supplicant stopped and restarted during fTPM NV writes, no
hung task; the fTPM TA then stays dead until a reboot. FF-A is
build-tested only.

Developed with Claude (Anthropic), which wrote the code and the commit
message. I reviewed it.
---
 drivers/tee/optee/core.c          | 4 +---
 drivers/tee/optee/ffa_abi.c       | 3 ++-
 drivers/tee/optee/optee_private.h | 2 +-
 drivers/tee/optee/smc_abi.c       | 3 ++-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index a52c1f498b99..f446b40d7827 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -184,12 +184,10 @@ void optee_release(struct tee_context *ctx)
 	optee_release_helper(ctx, optee_close_session_helper);
 }
 
-void optee_release_supp(struct tee_context *ctx)
+void optee_close_context_supp(struct tee_context *ctx)
 {
 	struct optee *optee = tee_get_drvdata(ctx->teedev);
 
-	optee_release_helper(ctx, optee_close_session_helper);
-
 	optee_supp_release(&optee->supp);
 }
 
diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 702da7d98fbc..155ce9856de9 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -957,7 +957,8 @@ static const struct tee_driver_ops optee_ffa_supp_ops = {
 	.get_version = optee_ffa_get_version,
 	.get_tee_revision = optee_get_revision,
 	.open = optee_ffa_open,
-	.release = optee_release_supp,
+	.close_context = optee_close_context_supp,
+	.release = optee_release,
 	.supp_recv = optee_supp_recv,
 	.supp_send = optee_supp_send,
 	.shm_register = optee_ffa_shm_register, /* same as for clnt ops */
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 94a4f251f5cf..6495e0f07deb 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -370,7 +370,7 @@ void optee_set_dev_group(struct optee *optee);
 void optee_remove_common(struct optee *optee);
 int optee_open(struct tee_context *ctx, bool cap_memref_null);
 void optee_release(struct tee_context *ctx);
-void optee_release_supp(struct tee_context *ctx);
+void optee_close_context_supp(struct tee_context *ctx);
 
 static inline void optee_from_msg_param_value(struct tee_param *p, u32 attr,
 					      const struct optee_msg_param *mp)
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 51624443359b..0278dc6b0119 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1264,7 +1264,8 @@ static const struct tee_driver_ops optee_supp_ops = {
 	.get_version = optee_get_version,
 	.get_tee_revision = optee_get_revision,
 	.open = optee_smc_open,
-	.release = optee_release_supp,
+	.close_context = optee_close_context_supp,
+	.release = optee_release,
 	.supp_recv = optee_supp_recv,
 	.supp_send = optee_supp_send,
 	.shm_register = optee_shm_register_supp,

---
base-commit: e21989d08e0d6abacfff71387d0cb36dd96a4079
change-id: 20261115-optee-supp-close-45df0ffe66b3

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


