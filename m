Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656AE2D738F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119786; cv=none; b=UZ6ri1EBry7FFBjDjjpYdqq/BC7I7ZmgYlKBz/Gdin/ZF793slovvWf/RpKRzJXAceSajrluGGN1v0H161naAOHy9oXeuTiPc5nUBrjLowl44ClymAv9MoaGLHhwW4DW1fUbbiL5G/Vw0BEde/TXaGNwzmICc9qxZ5Tap1K80yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119786; c=relaxed/simple;
	bh=kQ2dKaQoE8x00XszrgduAM5ljTPA4kY00EPvVgvfkZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoRggX9yJaFIYrPqoCYQ/bgVDMxgK2fQkOrerYQTvLxIgCqLnqdCIMxvA9JXXojKRaBZtDJQbpEFD/JqefB9lyXXuEC44A1QGum1daVhHoWi1PfHbTCGoFNiviQilx0LM7BnlYafge6vohG357+OoKeu5hBLakyQlHUt7ZDjZlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=ULhmUn6z; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="ULhmUn6z"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so4458733a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792119785; x=1792724585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4v+dWiCRAdthtI0M2qpP1oy65No/E58vyRYWnt7MYQ=;
        b=ULhmUn6zAT+nk4K8eSJdLR6nUmG7K5noPKFEAFjn2JKwKesDPmILe1aDLOxFS1twQ6
         NuUY4xARvrl9ps6oKyiAnXEJZJIjyRXL6MfE1uNevfqc45HpeiKRFsHPCXE2SdIPuBHI
         GBkOGZxnVz6qN8QwOg3l/tGVwDHAVrvo6uz7VzAVNvdzrpbsktdzTeD52Sg+rkSRHPK2
         u6A3ph8FckrNnudjz/L0X0jkDj4EmO1A8pOj3vSHL5Mk7Y+r4ipRotVj2u1+L+lOmJ2v
         jsOLqelwnECC9cKik72MR0DRbb5LCIGJ4PRNPC76tChaQvWfowYN+XtTRowtXVsQvh2I
         6Gzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792119785; x=1792724585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4v+dWiCRAdthtI0M2qpP1oy65No/E58vyRYWnt7MYQ=;
        b=P5RZlmC8ulNfNgWhAca/RfgG8Q+cWabAHWXCKm1Hv30xiGGJBKjQ36Wg1zBGuFJ3d7
         c8veZS2jI8YhUEpOZZlsa6AhNodcDxsmGzI9ISvH3GNugOjf9O60gFo3LPNQd0sXVogQ
         0gL9ZoPZWeKudiHBqm4GH9SLaRtmn1mLe1Lj1K0Vkd1KSdV5S1wIlMogzHzsn4V3D7fM
         FxxhMcno/WIw2mTgD51ha8I+FVd89BX7hUvZxKX5TllyUXImjRn6hSlDY7/WP37eezun
         RLWr6eVK0k3XVofHlBy1t0Dv1V1x8RSPGjDgsSNi/ZJr63vx/PjCyZV1JLuzI6jVvRvN
         dE8A==
X-Forwarded-Encrypted: i=1; AKwUvBxNo+rMnUxknwmoHKk7ZQurRtZvFBt55K8JPi3XJWyqlcAEjnS5I9Ff3sGZ9xHv5O2BHeAMZx76NLFYyhE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsE8r+4a5z4sz+2P8IrWt3xZuuZDWqsxZT9cZhnpUOTQSiDibb
	xtsuIzqCJQ4QGUv5txEiQu3RgrocUQEyQpSklxtxWlN36uErryhM7zAh1tzK3RyL7IA=
X-Gm-Gg: AYBFou0A4V8aHprZGANSYXrtVJJnjlfIqbvBXS5o9iXck6Q+SLkuY+LHyGxLY5Mrenu
	nvwmM/ypzyz6AuC/BDiTMl092m51KjGe+t+IPBa0PtaRibfzfTHLhtOYIJdm2D34zaeqCq9JBs3
	o8TpETVO/j6HL1tUt01tM5MeEZnnREgnHxN4wO1aih/erBzk3WrxtuQ4Qbt9E7OwNzb3uePRQi2
	UjEPJQMLQRfnObONYuQZLUddJzLJJdTnQm1QyTYFM9J5t0wBnThx/wQ0YF1vpF1uAmFQMkoXzMj
	8i7JAKJyzttKJ5gc2dupVbNxIjJF1IZu6Z/2aYMgicYH7TTpkC7oWB2L0+29zeYj9Tn4dpXFhNi
	/snIVHUlPwaptiklO/lceugNqUSViFphQnRH9eZJPBlV+D3hAELbLR0Jh8BMIxW/7LztpBPSd74
	/9fDP0p6ByiGll7amdw5tvDQGyN442kleWWwgEAqqJKMonUiGsIKM+pboMdDx7Q6blQrJs46c6E
	JLSyg==
X-Received: by 2002:a05:6a21:3511:b0:3dd:85a9:55ab with SMTP id adf61e73a8af0-3e16be2877amr18484077637.36.1792119783810;
        Thu, 15 Oct 2026 20:03:03 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8c490sm422493b3a.10.2026.10.15.20.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:03:03 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 2/2] wifi: nxpwifi: bound the TLV lengths in the 11AX_CFG response
Date: Fri, 16 Oct 2026 12:02:50 +0900
Message-ID: <20261016030251.690780-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030251.690780-1-yhlee@isslab.korea.ac.kr>
References: <20261016030251.690780-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nxpwifi_ret_11ax_cfg() walks the TLVs the firmware returns for
HOST_CMD_11AX_CFG and copies one of them into two fixed-size
destinations. Nothing bounds any of the three lengths involved.

The walk length comes straight out of the response:

	left_len = le16_to_cpu(resp->size) - sizeof(*he_cfg) - S_DS_GEN;

left_len is a u16 and the two sizes add up to 11, so a response claiming
fewer than 11 bytes makes the subtraction wrap instead of ending the
walk, and the loop condition is only "left_len > sizeof(*header)".

Inside the loop, header->len is used as a memcpy length twice without
being compared to what is left or to what the destinations hold:

	memcpy((u8 *)&he_cap->ext_id,
	       (u8 *)header + sizeof(*header) + 1,
	       tlv_len);
	memcpy(priv->user_he_cap, (u8 *)header, sizeof(*header) + tlv_len);

The first destination runs from ext_id to the end of struct
nxpwifi_11ax_he_cap_cfg, which is 50 bytes; the second is
priv->user_he_cap[HE_CAP_MAX_SIZE], which is 54. header->len is 16 bits.
nxpwifi_set_11ax_status() declares the struct nxpwifi_11ax_he_cfg this
writes into on the stack and issues the command synchronously, so the
frame is still live when the response is parsed.

Do what the driver already does elsewhere. nxpwifi_ret_get_hw_spec()
checks that the response is longer than its fixed part before
subtracting, and nxpwifi_update_vs_ie() rejects a token longer than the
bytes remaining. Add the matching three checks here: refuse a response
that cannot hold the fixed part, refuse a TLV that claims more than the
remaining length, and refuse an HE-capability TLV that does not fit
either destination. A TLV whose length is within those bounds is copied
exactly as before, including one that fills both destinations completely.

This is not a claim of a reachable out-of-bounds write. The lengths come
from the device firmware, and whether it can emit these values is not
something the tree answers. The arithmetic reaches past both
destinations, the idiom is already in the driver, and the checks are
cheap.

The driver has not appeared in a released kernel, so there is nothing to
backport to and no stable tag.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/net/wireless/nxp/nxpwifi/11ax.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11ax.c b/drivers/net/wireless/nxp/nxpwifi/11ax.c
index 1665bd514596e..ddbfe0939edc4 100644
--- a/drivers/net/wireless/nxp/nxpwifi/11ax.c
+++ b/drivers/net/wireless/nxp/nxpwifi/11ax.c
@@ -204,7 +204,7 @@ int nxpwifi_ret_11ax_cfg(struct nxpwifi_private *priv,
 {
 	struct host_cmd_11ax_cfg *he_cfg = &resp->params.ax_cfg;
 	struct nxpwifi_ie_types_header *header;
-	u16 left_len, tlv_type, tlv_len;
+	u16 resp_size, left_len, tlv_type, tlv_len;
 	struct nxpwifi_11ax_he_cap_cfg *he_cap;
 	u8 ext_id;
 
@@ -212,16 +212,32 @@ int nxpwifi_ret_11ax_cfg(struct nxpwifi_private *priv,
 		return -EINVAL;
 
 	he_cap = &ax_cfg->he_cap_cfg;
-	left_len = le16_to_cpu(resp->size) - sizeof(*he_cfg) - S_DS_GEN;
+	resp_size = le16_to_cpu(resp->size);
+	if (resp_size < S_DS_GEN + sizeof(*he_cfg))
+		return -EINVAL;
+
+	left_len = resp_size - S_DS_GEN - sizeof(*he_cfg);
 	header = (struct nxpwifi_ie_types_header *)he_cfg->tlv;
 
 	while (left_len > sizeof(*header)) {
 		tlv_type = le16_to_cpu(header->type);
 		tlv_len = le16_to_cpu(header->len);
 
+		if (sizeof(*header) + tlv_len > left_len)
+			return -EINVAL;
+
 		if (tlv_type == TLV_TYPE_EXTENSION_ID) {
 			ext_id = *((u8 *)header + sizeof(*header) + 1);
 			if (ext_id == WLAN_EID_EXT_HE_CAPABILITY) {
+				if (tlv_len > sizeof(*he_cap) -
+				    offsetof(struct nxpwifi_11ax_he_cap_cfg,
+					     ext_id) ||
+				    sizeof(*header) + tlv_len >
+				    sizeof(priv->user_he_cap) ||
+				    sizeof(*header) + tlv_len >
+				    sizeof(priv->user_2g_he_cap))
+					return -EINVAL;
+
 				he_cap->id = tlv_type;
 				he_cap->len = tlv_len;
 				memcpy((u8 *)&he_cap->ext_id,
-- 
2.43.0

