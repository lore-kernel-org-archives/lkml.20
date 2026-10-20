Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792457444;
	b=h6eepQxe2sNOh3xGR7jpQdtce048PMdGDGnyP6dpEeioGE8IjowmtbndhMYfB0riAQj4
	 kNgrWP9bhfpCJVd7XvUij1OC5bunNSzgiEJCbPcbwRpoCOuK44PVGazh5hAj8oHHJXcF6
	 fexzio/6cptqgUB7qDUmIJ1x5hBXN0YSNNsgg9NIZPBRvXCZXrk1qq+3XtyQ5H5OpUp7f
	 DqEhZqA7pHj2UKSla/NNqqOr5u0EBwxMlJc344xaZjVn1b0FSfE0rDLChfwgeRX2O7W6f
	 KXfpPLDsz/+ylr19TxLPiVv6PX6d1KrOyAtxga5CLG5AaHwoLN6G/wr1b0X0DeEz28w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792457444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XPe0JNEbr2LiKTaVjn34vcDqNA4MmDzPEYnEmiPiiyo=;
	b=tbzABIFRp+PJAubewgeeEjGw9lUvylpJ9DZKcilwHIrx0PYpvLWJaWoeZfU7j+DilCMI
	 cgKZPWITDtPnDKo8770VWpKHfrUx36Jh2S3JoTEESGWSgJ+oc5h8s/Pu1kAOeTKBCF3EJ
	 6fCc7O+nLBTJ/MMpwhrQJ10rzsK07bqtUkbx2M1UX6rxFF26jnfiiu+feyQzKEBckJ4su
	 p9v/i9pjEIXwMUGanncD0U29+t0SHoHxbKx060BfX6Ar6k8g0xk9Ang7zb6Oijs+8ypTf
	 MpT+vbMIjBQ8IW4ugB2grCL3WK+QzA6YHzj2lOIUwemQIDOuoG58Xl2XDT77nAi3LvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=h6UpW3Wz;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C4E606A339
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C4E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=h6UpW3Wz
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so2308503a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792457443; x=1793062243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPe0JNEbr2LiKTaVjn34vcDqNA4MmDzPEYnEmiPiiyo=;
        b=h6UpW3WznxnyArzXBPrbHGIVe1IhMpKDdTTi36iKnXZ3Eqy09f4SURmiAcGlqyhA6A
         CfeQfpi2AuU9ozSMUH82IsrOOXYrgOCjkbbiml3RoKhYaLkN/+SfJ4c2fJY+1SR4pTYw
         WUJzCc1V5FnKbdvJbU9yMcJCtxmLNw82nKPeQaLImlBr+Y+c7VInSrhCDYbKpMHWKIJj
         rZ1sZQdJQC/Nkn++kkNwvz1CsW2cKVAmhM4dv19B238AXy9tWNoGjVCETYl3vDg38C9/
         D8uQuDlnfw/+bIlA05XFQXJHt2Kc+6Y5lfBgzS5UeJkiOoOPY/+evXZD60uPqxWICleP
         rwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792457443; x=1793062243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XPe0JNEbr2LiKTaVjn34vcDqNA4MmDzPEYnEmiPiiyo=;
        b=WHGlbFDyO4spkfBLqgP/Fu5LV/lM8EU8Ix5/6n/M1ExhO26y6cAxHBDIvrgxibkrxy
         2Caa9r4KOlj5pmPgnwhkdU1YNdOKxpYCCOAv8Sft7pDGbrU/q/9m2Gx1Do8OotlJLNNN
         Yno26FEjqIhJf939QoHG1Z0eN6a2HjgDITCD1XVjwyvyk+oABe452eXs3/LGd0S7GIYc
         gSoEdxEyPy24Lc2l2ufV3l0HnwDJd+oet7ZFhoR+CgbqlGwq7FEw+T9R7vwDu51wBSkk
         R9E74AHfVgiQuJK5Ik1eo/ovdXwrF/PYRMasGwjtNAbXp4++DuFLjjzDytWkhBhW7jIj
         viUA==
X-Forwarded-Encrypted: i=1; AKwUvBz77MhLsaubccnL/lq0GPi7AEQlmCFk6rW4am7QtWvxT/hjedBp/Z/kl1I0u5/AiKdBs9XhoVOkfv6LrDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0lkFPIWO1AN0zHbctGxvUIqovpfnkBNluF9GSAEKbWNpAkI7S
	3aY6VCSphiFY1v87+k6csOoCrE+GbLeHPtoD02FA1hOoiM7Xr7QysqH++K6hXkvwaHo=
X-Gm-Gg: AYBFou0zzxUgZP3TvDO2QD9Yg/0OnmFSk/jXBRrXGvsRF+99wzJ9AyuK+u34NCvNDse
	0NczZlPD9GsoadJEyQib5Re/ZiRWSEr80SwtObkRrtvMKsl5HGmnDJ+c6y7Xht7I4L7wbrGNg9J
	k7ITobUqXjsDXJyJYDzNUqIhC/u7HSkofgKwAktpiTuDZljrL85JRffnJPDZ8LgkM3qHYQSTB2N
	jzbOys34vf/V2zzONvVXvR8p5xaKuRs/gix+QR7ZFRNSCdnYvLPRwrOhBPPg7qCb2K8Jda207td
	zA+xaviuv3ONNPeBRWbnZY0P215aQpoXiz9gCoeYRs0C79JpVpebJ6gLjpJuX7p9nkSN/boWk+H
	ji5JJFIPE4YZze8qUlInpZJJ0BwFpxB5szXRkMNTWkM+3DsTfU+sCnNNMdXWJzd1Z7RUTbLwuAb
	+SpZU57dhMjP3lPD5UsEf/+oM5OPPJxdXNk5BwamWvAu7DZEdR9HE1wJz4zX4TB1BmMvmWupnyE
	LlUxw==
X-Received: by 2002:a17:90b:3b91:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3acee97ab0amr8126582a91.7.1792457443246;
        Mon, 19 Oct 2026 17:50:43 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3b16c2asm8520499a91.2.2026.10.19.17.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:50:42 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Aamir Ahmed <elb12345@hotmail.co.uk>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v4 3/3] wifi: nxpwifi: bound the TLV lengths in the 11AX_CFG response
Date: Tue, 20 Oct 2026 09:50:27 +0900
Message-ID: <20261020005027.1105121-4-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020005027.1105121-1-yhlee@isslab.korea.ac.kr>
References: <20261020005027.1105121-1-yhlee@isslab.korea.ac.kr>
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

nxpwifi_ret_11ax_cfg() walks the TLVs the firmware returns and copies an
HE capability into fixed-size buffers without bounding any length. A
response shorter than the fixed part wraps the u16 walk length, and
header->len is used as a memcpy length without being checked against the
destination.

Reject a response too short for the fixed part, reject a TLV longer than
the bytes left, and reject an HE capability that does not fit its
destination. Select the destination buffer first, by band, then validate
and copy that one.

The lengths come from device firmware, so this is not a demonstrated
out-of-bounds write. The driver has not appeared in a released kernel,
so there is no stable tag.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/net/wireless/nxp/nxpwifi/11ax.c | 49 +++++++++++++++++--------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11ax.c b/drivers/net/wireless/nxp/nxpwifi/11ax.c
index 16bda167fa66b..be38a034be325 100644
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
 
@@ -212,34 +212,53 @@ int nxpwifi_ret_11ax_cfg(struct nxpwifi_private *priv,
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
+				u8 *user_cap, *user_cap_len;
+				size_t user_cap_size;
+
+				if (he_cfg->band_config & BIT(1)) {
+					user_cap = priv->user_he_cap;
+					user_cap_len = &priv->user_he_cap_len;
+					user_cap_size =
+						sizeof(priv->user_he_cap);
+				} else {
+					user_cap = priv->user_2g_he_cap;
+					user_cap_len =
+						&priv->user_2g_he_cap_len;
+					user_cap_size =
+						sizeof(priv->user_2g_he_cap);
+				}
+
+				if (tlv_len > sizeof(*he_cap) -
+				    offsetof(struct nxpwifi_11ax_he_cap_cfg,
+					     ext_id) ||
+				    sizeof(*header) + tlv_len > user_cap_size)
+					return -EINVAL;
+
 				he_cap->id = tlv_type;
 				he_cap->len = tlv_len;
 				memcpy((u8 *)&he_cap->ext_id,
 				       (u8 *)header + sizeof(*header),
 				       tlv_len);
-				if (he_cfg->band_config & BIT(1)) {
-					memcpy(priv->user_he_cap,
-					       (u8 *)header,
-					       sizeof(*header) + tlv_len);
-					priv->user_he_cap_len =
-						sizeof(*header) + tlv_len;
-				} else {
-					memcpy(priv->user_2g_he_cap,
-					       (u8 *)header,
-					       sizeof(*header) + tlv_len);
-					priv->user_2g_he_cap_len =
-						sizeof(*header) + tlv_len;
-				}
+				memcpy(user_cap, (u8 *)header,
+				       sizeof(*header) + tlv_len);
+				*user_cap_len = sizeof(*header) + tlv_len;
 			}
 		}
 
-- 
2.43.0

