Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281008;
	b=XU+amqsLy1c8hnmK437rxHMI184XEy7IYhLUHSYN0tUGhnaarA9zhi/ZqGwJWj2c5nUT
	 jcEyN0Ql7/D6bDbAiQbD/H3FmG69+VpfMhLg+sgcOsxjfm/7w5iXS0113BVUmz/nHSytP
	 K/PuH+VD/d0OwbcGdi41g0jr8/WFEdDh4v5BgtQFCSRK6Oy/mgNd7G9TruBZRvvbXVYI8
	 4UnNKAw/drzB/JxbdZMDCqexZ0+X5y5AK9KRaYyA3q6iOUWhtJ5Z91uabcW9U5OSa8RUu
	 tA6CYaxENCk7Tu1LBm7kIliAQQlqbiDrmUoYCcoqXtD08xaSrp7HJk5f6El+eqpxQKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281008;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=NkVxA+o6fjcltuZ3tIBQMS7Elx/7acMSc0sr+pVDZMo=;
	b=ANCQw3ph4UdM5EkEAvz5kbopwXnRqoPeYo4MsGkLw0LG4D3MTlwc98sf/8mPbOiSt/rB
	 l57exUTMzdadhXnzpWFyNQQk4iDzRhCokwYkgoOqmhAQWadb0//5kUrEanUyKhG53exia
	 BhDPjaH0E+h0gxlTG4cexYzUNAfEU0GSF4Lq4uu+XEWrGAt+faST9aXNfQwxFv87ZEtWo
	 b1PossDLVgIWiWiH+aGADZL40OG1dLTM6g5BwuC+ze5hBLlNoGF4sWCXFAwiQgpU7Qy6C
	 qOq1y5Yn/Bq0uFbSe0hIo6k2S7DRkWREJwmVFkmlXX/YQwpsO1Df851DiNCQYCDIBtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RpPBK8PA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42982606B547
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RpPBK8PA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55AB1F01825;
	Thu, 29 Oct 2026 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793281007;
	bh=NkVxA+o6fjcltuZ3tIBQMS7Elx/7acMSc0sr+pVDZMo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RpPBK8PAEQg1vqWvKj4BegP6oPeKdtCmDyTcGe4fYbbM48UMJoS3RnJyGx7Dz/pXI
	 F4o/T26tkG5BlzzVddX/D/DKvzBsjsbIukhTEG9eUPHS1p6QsVwEe550aMLeGgjcTh
	 dXjNXO+T6O6ycVNy8WkRUkP0WpK6+jPvzNRm15v6qornntvFlmqkqodY4rXbG8RoWt
	 qdDWQ/MvrFnd0QJjmy5QAzIinM+TaTPVuK5XGZRIIH9sXOJ4dvm13eXIkdKQIoI1PK
	 KfLTZGXFXdULBLVFq9giw6mSDdu8RWNsBcSUjsKBJdrk5pLR0SMYy7leH63oF1TJrw
	 tS4fNBAlbxrvA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:09 -0500
Subject: [PATCH v4 22/31] accel: ethosu: Validate convolution parameter
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
Message-Id: <20261029-ethosu-fixes-v4-22-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The U65 NPU_OP_CONV command has no parameter fields, but the
validator interpreted bit zero as the U85 weights_ifm2 field. A crafted
U65 stream could consequently make validation skip the weight buffer
that hardware accesses.

Require a zero parameter on U65 and reject the reserved U85 parameter
bits.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_device.h | 1 +
 drivers/accel/ethosu/ethosu_gem.c    | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index 86412c152f4e..61dec8ec23ea 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -89,6 +89,7 @@ struct gen_pool;
 #define PMU_EV_TYPE_IDLE	0x20
 
 #define NPU_DMA_REGION_INDEX_MODE	BIT(11)
+#define NPU_OP_CONV_WEIGHTS_IFM2	BIT(0)
 
 #define NPU_CMD_CTRL_CMD1		BIT(14)
 
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index bf1489734769..143021a3f9ed 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -776,7 +776,10 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 				st.dma.dst.region, st.dma.dst.offset, dstlen);
 			break;
 		case NPU_OP_CONV:
-			use_ifm2 = param & 0x1;  // weights_ifm2
+			if ((ethosu_is_u65(edev) && param) || (param & ~NPU_OP_CONV_WEIGHTS_IFM2))
+				return -EINVAL;
+
+			use_ifm2 = param & NPU_OP_CONV_WEIGHTS_IFM2;
 			if (!cmd_state_reg_is_set(&st, NPU_SET_OFM_PRECISION))
 				return -EINVAL;
 			use_scale = !(st.ofm.precision & 0x100);

-- 
2.53.0

