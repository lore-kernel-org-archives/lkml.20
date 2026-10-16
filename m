Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714192D73B9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792115391; cv=none; b=TYj/hxhO0HETe85HSl1JSty75etmGXwxSuwsXYQlBE+PL000cgo9qbJX5J/SVsh/rp83hf+tojOTxdSkm1akID8fFxh2twRTum1gFZSIt1WzphHmg/Zu8JA8lKwgX61FmVLToq3T/JKqX+uc8cSUFAzOZe+2BT6oPoVATYNGDCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792115391; c=relaxed/simple;
	bh=vHQMynQAsQVRQK8pdrAkY10aqxVPqAzaOxtEB6Poo0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aI3YwoUbr7MNDHxh7VdNXr/DMUWqsvrbgmFI9VYxbUcZcrkoS5jVKf5VHWFOwSHtNTRltUL3rOCosc0S9Ezh0wCp5OlPu28P9gEcqmKeXqVMrGKChsIE5bEjFvcaqUrLoTRUzHGzegft/h50nKXla/NdCOtiub6H7mBeHXCypOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=TfF16FCD; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="TfF16FCD"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so4861744a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792115388; x=1792720188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dPwVl4c1uwtawzWgRvw8g4lYEeVJN5sxbD4YoVW5ucs=;
        b=TfF16FCDYJt9EvJmkrUpsF+Ru4kEsgZTuuD0a6bck5pebxS4Duli95eF1OPFoM/3lL
         MB8Fn2WEZ0CRngrVdzmnSlJ6QiDBjAZPwMJJbOETgsbtF/7nrBxncADYTDR9f+iOAoFT
         6NJDROllO/AgTqw86i8yZu5YqTLiR+W2acYhtDOaFrAXPf3oh4sr5EJ94ntzm+0UnlaK
         pjfVx5FOZTMIedsUMfImpipXjXxORI9djmSXkCD408rkaGSkzajF37AhPfLZgUO8uSdM
         a0JJ7waNzSfV3QXmJLhG81w7Z+a/MEaUXCx1r6KxAc69eQMmh1ccbYDNJBujtqg4CE3Q
         lOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792115388; x=1792720188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPwVl4c1uwtawzWgRvw8g4lYEeVJN5sxbD4YoVW5ucs=;
        b=nwoIVMfsj26ziO1gY+X6P7ni6tGeSZO1p8HUniOnPlz7aUDMxbrD5UR8XyPMD1JAMk
         zXFNGs5VMkc1nbJ2qWRLDG8s4qk9DDrtZHO4UYaWaYTGHVs1bqf0P0gzcUb+7vxg9C7C
         MnDuI19VLrxAxhBEa7HGX9oNe96kJ3JKlhD6i0ju38Bcirwqbfc0LHV/zHGw1UWBIz6W
         HpHQRw5RTc+Ka4saAibxcwJwj/mArrKPcnWzGgnC10YX8za/A6vvirsTai4FPoYhaUya
         qCdWcblvN26cojsM2NBrUv5J+BvGc7g5H7BuNUaDQiVcXLaQWVXsZk7TRNmlIPCvPS70
         xlXA==
X-Forwarded-Encrypted: i=1; AKwUvBymQst6xcFxoGbeGPX3SL1gyUmsqmkwbOYFhonLsrbCE4jCwgyTneSgLYd1H+U6SbSTzk6B5v2iqmsoe/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9S2e4dyuja/DHgxO5lPmWXQ/aCWAisHK1CnZS2RHdBuZ53kUW
	aFWjync5ATCCDKutzOAV7FnMFymq12ZwWa4JZuez1PgJ06ri/KAggpMGsPe4zk3ZIBLaSbaR35Z
	lQChL
X-Gm-Gg: AYBFou1Tggz1+mZ1yoA0exRPlwftWVTIyUS5kK2y/fBQxY6ecu3n8ZNux0Y7ExomsNP
	vJy3C3Dw+XzqVxcAbmN+7XxQZpD/lezqRYFHGGeavLJ8yIfZdXwRGYjQyIxILDQHyaIJ8DTQBGa
	NTcgcOSV2d0WB69r08JsOeEFhRz5SiHcJqSCOyLkJaXbNwoH8vZuX/oWoDUtXQBaT3gVfQMO/7y
	SrOu+JZ3qo5waW5DxwOhB0MWXTyJs4Q8aAIA01yeqUV2E7iZVHWmzpcSxhrbHqlPN/L8R0Bcodp
	Divqm3Q38culrVkA8vIFAFB54w+xAOvEyT0EiGXLTiNCjEhECM+nrC+NLgSKbuDzg5O2USfW88T
	HQMnZmx+uREh9zO9C+++ZSkVNblsBg9oeof0frcpWgA3NJItJweVBlSctO25KwdNtXiE0npLPJ3
	60Zh9WS5SqVdadpt7KvqGq1BIMWwpFp+efOyJy2se2zJuNcO05+V1BmlzwOYH0vTGNoLvEtqtRi
	9hofw==
X-Received: by 2002:a17:90b:57cd:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3ac9d1501d1mr3636662a91.31.1792115387985;
        Thu, 15 Oct 2026 18:49:47 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3b798d3sm236472a91.3.2026.10.15.18.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:49:47 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH] wifi: nxpwifi: bound the TLV lengths in the 11AX_CFG response
Date: Fri, 16 Oct 2026 10:49:27 +0900
Message-ID: <20261016014927.434473-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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
index 96540914f3cf6..7e05dd5ccaa81 100644
--- a/drivers/net/wireless/nxp/nxpwifi/11ax.c
+++ b/drivers/net/wireless/nxp/nxpwifi/11ax.c
@@ -204,20 +204,36 @@ int nxpwifi_ret_11ax_cfg(struct nxpwifi_private *priv,
 {
 	struct host_cmd_11ax_cfg *he_cfg = &resp->params.ax_cfg;
 	struct nxpwifi_ie_types_header *header;
-	u16 left_len, tlv_type, tlv_len;
+	u16 resp_size, left_len, tlv_type, tlv_len;
 	u8 ext_id;
 	struct nxpwifi_11ax_he_cap_cfg *he_cap = &ax_cfg->he_cap_cfg;
 
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

base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
-- 
2.43.0

