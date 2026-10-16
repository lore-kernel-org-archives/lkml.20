Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB313AFCEA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124760; cv=none; b=QMwrX94koQbGL0HlE9MgaMm2jVUqMS4Xop2AFgG0VZW1cEAZm/GYpqeOgRzwzlj/CsIpNSd0UNNHJsV5ceRcB8JCh1LGXOrOSg9n8FQfB+t93JzxFVPrLg8gFXSN+5Uft3tz9anqByAKbnFVrWKBI6VBtW8Jk7028W9Tu5Ug2sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124760; c=relaxed/simple;
	bh=AvFSkkBXaTLQaYXlLs8U7Ru/H9/uYPTAtG20hLgeY3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZ1m7wHNs0WlJoYl608FsIs6jEpWm2li913nUIMfRxh6zX6uOBFsD+59T2XBUzoYUvQuWJwPhAJFAQSqPo4sFoLoBbqvG7KUYLEdrUBUC92aPrxeYz5Uf+pQv9g83GoAkOi6brN0x9voUyXiyDgnedrZOS6RCXhSXAcsOh6nIWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=YkCBsgh2; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="YkCBsgh2"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ccca948203aso2506831a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792124758; x=1792729558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sDa7AgSRCyble15tiDzF+aYI4tsftz7KyCtWm1HB4U8=;
        b=YkCBsgh2/oknGO0RWY7tBSOMVqLjIfyHKPnnBV7Tna8M7wb5I6rfRsMMGGEe/hnFaD
         WQG5Kw6OxMByk0/GAe+UKBzLu4Lw+gE5Ag3Pvqq0z4cE4XirzbCOKqUgRvdhiLRsvZoU
         2S/VQ5WGoF4srogKCweSLkWp145SOyhwfIuf6AAafsKz4AuirK+q4d8+JEUALVYlb+am
         U2AG/7uyW8OfbI3nxyS4fxBr1tfJAO3r4P36btm1Gx5CTVTPA3ilOPXfbVulImxP8lo+
         GpgFiGZp87HQCECvMY2PMtastWr0BK+xB+4De/BfgzswIIMQv636UI+a21xJEtwxu+YJ
         yNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124758; x=1792729558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sDa7AgSRCyble15tiDzF+aYI4tsftz7KyCtWm1HB4U8=;
        b=Imd6Xw58M1pKXyVPtnvHW1kVdoQ8c2mCmQPvwOWCG5lr/uiXkFsge5czJrgJl3CfM7
         PDWy/wHKkffgMtlAAHz6X4m2ng9IHNOecve0g8V/5AM0Aq/Akjg1lnQdLHBO1BcfIZ6S
         r14ht/d2uMuKILH9JhKkl7bt5Gp+OCjF+akbAdLvx/3lzP5X8EVBI5NyiYAw4F3moNHx
         Jenn/ztKtKL9nrESUUwCEcLDKAZZY5x2zWdTGPE9rfL1p7xxFKPsaFb1Gh6+NGoMeA/Z
         oXjsiG2kpWCwCZ58Tl6keuVWUxKlD5Qpnb3br13mLJz6lXlTSNA6ZHzCTNu7eUbl0ArY
         5QaA==
X-Forwarded-Encrypted: i=1; AKwUvBysMtqTiai5o9qy6qTd/thQv6bv0dK4JNtYCvgS3o4Ph61LWf8W9GnbZjmSJTjohonatcq4s6rq/9I1CJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE5LTmjDgayQJah3hTqSZc2k8Npx/p9LNReYzphmDEmkgqqiPe
	YFJMls3TsVYnopNWlHzGW8fJ4tv0lNZtmt+76EsptL8A8h8cUxnvZUcsAF8jBbLx2s0=
X-Gm-Gg: AYBFou1uJ9TubLkMDqT7B+NhbRA3pCxNvRw/RbjoN72VmATFrHn5xSyEyGkagiNeZpX
	sa6WBWPfG12F7CYOEjnBdPrTKssodNJseTmhG5VTjVTo3wcp7xxYqw1GlbS7I5D67T2cLHFoE/a
	sWMV7Vq+MVZw7KVLKpUMkiQvJlVqry7PCS7aqbVQJdU2NAnEnqhuzrtJwpmQMf082gRjYHovm7E
	thK2LT7oWmfdxInzWXPyPm4HP2KXxTFO+NUJ9up0/rvflixTtL/urOxfbOdRk2RRDrr/d8uAPXL
	jTtH8RWMmRwSPcDRYnmOJSsBdBc9BCSqv18pjG74MJNPwJU/IB/I9GP1Qpe5VWzSkTYO34b8mgM
	zqr6fBEsuvGczsN/SPOSEiULiemoSoisVLx1EEnOGYUOnkxQcP557T1VED0K+h84Lmg/lB2voK3
	yNgkCOAKJHRAFOvX8c1OSoBTU2xpkKIi5JLHK4HD3mW0CLPMbg4kPGbKZFjN0gkBSztWWe9WYp8
	fzjEA==
X-Received: by 2002:a17:90b:2d06:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ab3acdf2e1mr15724116a91.42.1792124758492;
        Thu, 15 Oct 2026 21:25:58 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b761bsm424443a12.15.2026.10.15.21.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:25:58 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v3 3/3] wifi: nxpwifi: bound the TLV lengths in the 11AX_CFG response
Date: Fri, 16 Oct 2026 13:25:42 +0900
Message-ID: <20261016042542.773945-4-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016042542.773945-1-yhlee@isslab.korea.ac.kr>
References: <20261016042542.773945-1-yhlee@isslab.korea.ac.kr>
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
	       (u8 *)header + sizeof(*header),
	       tlv_len);
	memcpy(priv->user_he_cap, (u8 *)header, sizeof(*header) + tlv_len);

The first destination runs from ext_id to the end of struct
nxpwifi_11ax_he_cap_cfg, which is 50 bytes; the second is
priv->user_he_cap[HE_CAP_MAX_SIZE], which is 54. header->len is 16 bits.
nxpwifi_set_11ax_status() declares the struct nxpwifi_11ax_he_cfg this
writes into on the stack and issues the command synchronously, so the
frame is still live when the response is parsed.

Do what the driver already does elsewhere. nxpwifi_ret_sta_get_hw_spec()
checks that the response is longer than its fixed part before
subtracting, and nxpwifi_uap_parse_tail_ies() rejects an element longer
than the bytes remaining. Add the matching three checks here: refuse a
response that cannot hold the fixed part, refuse a TLV that claims more
than the remaining length, and refuse an HE-capability TLV that does not
fit either destination. A TLV whose length is within those bounds is
copied exactly as before, including one that fills both destinations
completely.

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
index a5278375329a4..d59bd213f3e45 100644
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
 		return 0;
 
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
 		if (tlv_type == TLV_TYPE_EXTENSION_ID && tlv_len >= 1) {
 			ext_id = *((u8 *)header + sizeof(*header));
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

