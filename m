Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792457441;
	b=TZnGhXvsRA+wwMHQtcHP1FSW42BfSZLodicIQIhdJTFCu7Pb55QQnapm3b0MhIURwI3y
	 O9zpPsgTF2+wjdT0VbInty50ogbNgmqBG8rEtoANDtJ+2Ncy0Z3Rv4gfQGAFaUDyj9MkX
	 hFVy9ETUnQlwkolqTaaxOUhY8vAUm/8jGF9N1R4zvppavac1t7ybEsnBXwKHbtzNDaK1X
	 h9LRyVNTAJCm1AwsLqcoBr+m6CB2VTHnWwIQHqYd7RvFBv5tQ6gAYLa14MwYOVum1uC1W
	 afqtlnQBbJ6wFCtGp05/mKySbWtUnG7GcMuChCUB7aKh5Feomy1O0FuMc7QxMaYl7Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792457441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9blM1tq4Eg4vAP7xUabO/Mdku4yW+ki7sKxUpiTn5z0=;
	b=QoIRioPfd/TZzmoG2jLhSdlBD7dbShMjk7ETQqYzJUbebsu7oszGRf6SCW6qChRYA+/D
	 XLL8EAtU246GsepGi5TQB0LhwoYF+TIP7nY1RFxXrmMD5tjmhdU4jhSK8TMdW1QN5S4DL
	 B8n4kaGCT9cCs6oJxSaw9dR9iZEmQIbf+/mt8BGOuyz4pJZhcnaMR41ATDUil1rHuLTQO
	 rfUzNpFbPvpfqtEMSCC+OgrlQppvK0/AeVoD5KX7rw/6cQFCQA1MfpeK4/0Fru6dANlZY
	 IXXk4E5tmxiOZDUWku6VOlznE2cOPkPh0X0dRWnWwV3Qma53KKL7d/I0OLReZ1zn/Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=f5sDjb29;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFFC60A2603
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CFFC60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=f5sDjb29
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1659157a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792457440; x=1793062240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9blM1tq4Eg4vAP7xUabO/Mdku4yW+ki7sKxUpiTn5z0=;
        b=f5sDjb293/4UYDZBvfTGwqeMx47Oi9qg8gQKXZUEww/TzlTv5Btk5pmsOpbtNX/st/
         Chz0HPTFq5B/BCFBmmUkOlw1VJkKmQxfLwXJpOaezmHSWeOzy5g7G5a2hraasbQmBamj
         QOnI4Hwb7m/LmD5N5da9J/27aLE3ebkJFHBnY3ocZeVVKK+ZZn4EszTNU0FVSaW5rRtG
         Iaj8GUrtEIBB3Z3OjCFnBpIfBXqsZcr49kC/SJrsMNdDrrJOc49UISGUE83Fl2Anzzbx
         zcqVgHbP1MGNtqunQQIR160KjilYdeam+UUjnhDwWw6WQaeq4NQfFYoTfrPQM8kRlbtj
         ywXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792457440; x=1793062240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9blM1tq4Eg4vAP7xUabO/Mdku4yW+ki7sKxUpiTn5z0=;
        b=LjgEMaKab9C/l/KR7pWfHdCGGSM4lLmAqac/pWxwev51dhEV2qk8DiLargHYhJn8bM
         dlmzH8XkoWETGAbY3By6IRruJgrN+3GbzJ0ki1H0JRPsox9DsW5huFlGV0d8UnpSjcIW
         CjsBFBcjNsbJPGlyfW1Uxk8CoEBtpEQRFgqSeJ/WcjJvi3rv2k/qqTy5AtqgfErv14Z/
         yKh/oIGklASpvnW1UpqLAWsTTKJXbCqw9ad37bqsJ2ZHQRfNQJCAzbdv1BGasI2sThAg
         pUcl7snoqHSjgpYDDwMRDJyxdYHymfmTTW8xrs4C8QkgVCum5mjcJknsocoMxEqcNtoQ
         XkzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxl6aE7E5gmm2XJEdfqsDZCgcK+Ogw8X2+Xewcgfd3zgwc7NxgDiMPfjU7mgGeQN2GjviMPT4mBgFeJYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI/1GxXP98NFr3OoxZRHiTOCyT1yBbi7ZDDFbEoczTyjf4J5tf
	Z4KSRBTEd7HgZHdc7DGgBZJ6XM/u1XwdNwwIyoGTvCY0dnl0iIqd542E3yXa51IRmeI=
X-Gm-Gg: AYBFou1gjkmhBRLYp9WcFQq7WNxv2r6biX944K6G62dE4iJfQJ+B8MoSQol6OBYTXRZ
	6jKSX+2GLwx4P3ujilq11MHICOlws3d+jNSoKjfpx+y6ktA+jJoJBdn16f55nPFTECxUFoLctNQ
	OWarMjgCC+l7KPx7e4ZBtWvzvZFvfNsf+41YOYPJ/OkqmcP53qx2RCVKBYZXDMHTBAElI+BedNf
	FsdMg3K/SOCKw9yGFT+yojtYnw9TL9m1Ws4BIc7PumidmzUqzLBKITynWuCYqKhA/ADdR58jv06
	fWw3siUuWoM7kE1I/frQdjhLQ3Ny4+xvWQwEwTjGAWBJVN9elGrjl9LvM9RBYBb5AHPHSa8Vp1W
	UTmbfexT/MaeCQibPEqoUsGSyJyUj4X0zAYyfwHRtXW1cshly/3tv8+yfCw1lFEX6Bf8BIWx2E4
	3+J56A51t/2BwRZJFGF/0Hur7kdEXAkhWVI8SUGj5kAoPRN+w7itHzpMmxUptZjuCDS1fe2A/ej
	LlqRg==
X-Received: by 2002:a17:90b:4c0d:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3acee293046mr8361923a91.7.1792457440525;
        Mon, 19 Oct 2026 17:50:40 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3b16c2asm8520499a91.2.2026.10.19.17.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:50:40 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Aamir Ahmed <elb12345@hotmail.co.uk>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v4 2/3] wifi: nxpwifi: read the 11AX_CFG extension ID at the right offset
Date: Tue, 20 Oct 2026 09:50:26 +0900
Message-ID: <20261020005027.1105121-3-yhlee@isslab.korea.ac.kr>
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

The send side writes the extension ID as the first payload byte of the
TLV in nxpwifi_cmd_11ax_cfg(), but nxpwifi_ret_11ax_cfg() reads it one
byte later and copies the HE capability from the same wrong offset. The
capability test runs on the wrong byte and the copy reads one byte past
the declared payload.

Read the extension ID and copy the capability from the first payload
byte. A zero-length extension TLV has no payload to read an extension ID
out of, so skip it.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/net/wireless/nxp/nxpwifi/11ax.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11ax.c b/drivers/net/wireless/nxp/nxpwifi/11ax.c
index 7e9127ae2f421..16bda167fa66b 100644
--- a/drivers/net/wireless/nxp/nxpwifi/11ax.c
+++ b/drivers/net/wireless/nxp/nxpwifi/11ax.c
@@ -219,13 +219,13 @@ int nxpwifi_ret_11ax_cfg(struct nxpwifi_private *priv,
 		tlv_type = le16_to_cpu(header->type);
 		tlv_len = le16_to_cpu(header->len);
 
-		if (tlv_type == TLV_TYPE_EXTENSION_ID) {
-			ext_id = *((u8 *)header + sizeof(*header) + 1);
+		if (tlv_type == TLV_TYPE_EXTENSION_ID && tlv_len >= 1) {
+			ext_id = *((u8 *)header + sizeof(*header));
 			if (ext_id == WLAN_EID_EXT_HE_CAPABILITY) {
 				he_cap->id = tlv_type;
 				he_cap->len = tlv_len;
 				memcpy((u8 *)&he_cap->ext_id,
-				       (u8 *)header + sizeof(*header) + 1,
+				       (u8 *)header + sizeof(*header),
 				       tlv_len);
 				if (he_cfg->band_config & BIT(1)) {
 					memcpy(priv->user_he_cap,
-- 
2.43.0

