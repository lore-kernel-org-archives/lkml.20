Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280982;
	b=2f0333HnBO0lBPxKdLLNoxX8vRg2cKTP83k28pX2KPvSu0X2lEnTZguKv97znQOirZzW
	 dsLAh8AqZiYamqWfI8aLQnfn7kL4pjwrz4nRFG4tb2NtMB1GDur7d9tECuxFsglDLyyzV
	 TZAuZUbxnQm1Mo1kTK3a76VijW7otuJXfW2xuHY0gFKk00D7qClfdnHPRJz5lczKg57bK
	 yK/UWioXw+2Mti2/gr+ZgV0VQJn7LsjMasikiCCUKtjzp8vX7mqeCnkpCtdZa3EoCaELP
	 VxVm8TBZqDgyYIVQF7ujiT/HCPRZoktf/BWXnZcCidK7KROudKxd2nuCF29EXB2BF8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280982;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=14Vm1MuZdODm8CbXSh0X1i4gRTiqjUX8wH9i415apec=;
	b=tviw6LwKn/vQUu14sgC+GrnXlaiS7uBsyji5krgqwdhQFrCKguBYTIjDTT7CnBwOxSwf
	 vg1VYVnBw5bL/rqUxgigWMY8pE43YPu0JQMDkrY+wLGcgNlvUsIFZxTe/QFgns/mEmY/n
	 V+WWBh8VGVuyrUFuiEmVIyuZPO8khvtIUi1iaVn495re2DLV55SaQ1t88z0Z+cMUVr048
	 0NMSNSgmscCcV/9YNVj3qaeMxhzYFkFrM0WJp6bSqqhtAedKQSq+SPeRUcSyKJXuGxqgb
	 6xWEQixcct4tQK01DrocQFOedEQGl8iSyziKRqeo3vNn3WMExVoj9SQNQHSKFh94iLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n6y6wpX8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80A560A380A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n6y6wpX8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9AD1F031E3;
	Thu, 29 Oct 2026 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280981;
	bh=14Vm1MuZdODm8CbXSh0X1i4gRTiqjUX8wH9i415apec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=n6y6wpX8Ua6yLzMo9Fv5wHGtcQEMXsqSNqSQoMKo8EbV7J5pqLLUCh5UdpLnq14yp
	 VAvLVrmBXRMxv1z4z1OLizmXK1oC4yCOw47R5lTeMwnUUeHogkJNepxt+0dTmfSUzq
	 lxHcPIrGKANCgd37LsRLFz9DJXPCsSFyDm3zO/BMrzquY1nAzFKKBkfPWIYuXgKeUO
	 tMn2Qpo9n7GTc1IFF9dEzi765G+uvCiHHRWgIjVL7ewcyDzu7qR/9rwUA/m29XwDfP
	 cydiY/d962QJLIASZwua9LRANSlUE0wVH6szLaYqwkwy3asp3CZaon67TjBC1QNwUv
	 tiu6VxdssMnRA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:35:53 -0500
Subject: [PATCH v4 06/31] accel: ethosu: Fix runtime PM get error handling
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
Message-Id: <20261029-ethosu-fixes-v4-6-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

pm_runtime_get_if_active() can return an error including for !CONFIG_PM.
Do not treat that as an active runtime-PM reference.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - new patch
---
 drivers/accel/ethosu/ethosu_perfmon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_perfmon.c b/drivers/accel/ethosu/ethosu_perfmon.c
index 26f625374f9d..0ae2df3ceac8 100644
--- a/drivers/accel/ethosu/ethosu_perfmon.c
+++ b/drivers/accel/ethosu/ethosu_perfmon.c
@@ -71,7 +71,8 @@ void ethosu_perfmon_stop_locked(struct ethosu_device *ethosu, struct ethosu_perf
 
 	ncounters = perfmon->ncounters - 1;
 
-	if (!pm_runtime_get_if_active(ethosu->base.dev)) {
+	if (IS_ENABLED(CONFIG_PM) &&
+	    pm_runtime_get_if_active(ethosu->base.dev) <= 0) {
 		ethosu->perfmon_state.active = NULL;
 		return;
 	}

-- 
2.53.0

