Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952135;
	b=le2Tdx1+9yE78iJLR1DKpZ1T7AJiwdWINJhRvgcMKkVRLnXUNXSe8jLcXMwpyn6uCte3
	 RqMhagZgBcWndPVKrEgA87Lq75ObtfSrpi5+9fTcDYeNF2h97Mn/a7qU/9md1o4lNylZ7
	 hoJr+XLsSPNWY6D+AliFHFd2U1n7B/YppTmEZY43Gcq1P4q65Wtyj7tSuNvOo4tLkxtOc
	 c08YCtTG9/XlOz3Vea9koDsYCc6Mwcdz/BoY4LztKuXakJ+pyo+FCH2D2UgGoqbXqZsUj
	 Z6HpqSTOThweDtpWGExhFZs6QRjGQOFwgpogJqrdkci9e57koDXiAicjxS9u8vfFChg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=04oWWzfIpYNAPZyDmdd+igxHJmbJK3/MT7SSmprnQO0=;
	b=dOEAQm1V6PrzgHFidAC3gl6TGe1Oe3kjUJ1US2RZjlo/NjjG/Iqm3XMNy/Vr7GZrkdmA
	 +sbdAOp01FToc+O27h/DlhUdyVXEb3FRuNI5AGzCK8FpOioGSSigXi7b5u5sefy78f9vk
	 fdgYX06xQS3XVRl3blMYBfVu/b+E3l4RmN1hQ29J/lS6dVX3hp04paP7PQSAik88wTH8D
	 KflSoaYe3lgrPAEfOboubyhObcTS30IfOt6/XYFNBUsEwxKH0taGh9PovXRv+vWXxaD0W
	 rd26Vy+fMXtonVwTyEl/lHKjOw60Dy0kWrYeXtSVyFOlaxkbjfgABvAwS4iaU6UFiAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ItefY2w7;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08372606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08372606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ItefY2w7
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1387110f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792952133; x=1793556933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=04oWWzfIpYNAPZyDmdd+igxHJmbJK3/MT7SSmprnQO0=;
        b=ItefY2w77k/Kqn+lPWITcS5PXxUcOwecuNSjmwxQxuuPVK1Dk1Uzf7RgqufcqAlpj+
         Y5DQS5qS1u8yBmkgfZc4TRTeK/zv9x9fVCOXuEES3AeuXaHZ/erTJpXyKEEmRIMIRpxZ
         h1bYSRj+NM15ERmDza9UiiLvIuZ1OBcdiMNKoZz6l6cV7JgU91rCTsHOLirTiypNZCYM
         VdrhcTfuGkh+6/l0NogEc6ETClwPKjDrE7tjJiJ4fZYQdjLYswnKXUl4lMHtKkzpBlMf
         VFKLpkAvw1F4tzXLq14o74rRXMru+0AWVg7lMzmrDLSX1yxDCuFVTlrsJlJ81kkYmuIj
         HJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792952133; x=1793556933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04oWWzfIpYNAPZyDmdd+igxHJmbJK3/MT7SSmprnQO0=;
        b=rOPusMvYzmBXGOhzTUn7EuDmd3Rm5dUCRYncRPHq68WO3yxB4QS2Z2oSKKbGFVs/af
         UK0HKSKCnICb1FSN7YG2U85C9aTYl74+y6ZXonmKjjq1p0QEBrREzrb8Q9M/yiX8/JUN
         GsDLRA2XlT6uodgp219Jj2Bwxm9u/RBaxhLlYpwxmEB1iPqTZ2AvpxCPsavCdqO1M/cU
         fdVr8DXBCsCekPVp1LPMSZ58m5sNI+AM9uOcgd7v2oOmlt5TTncIju50EEERqZjNVjCN
         CZSiSWgpXFYPMJjb5oiTUShCg9hNMdjI/WJ8HFWuBf2iF4bYNRCZxuJo+MM3/+RtOP3T
         B2Vg==
X-Gm-Message-State: AFq9FYLN9bpJQGyfAAHMT7NW439yop9shv+OQBvHzKVcFxklFodzrV/V
	/jBK1hEZHZwpXgy6d46isFf532Iyf6YQb5LYazKJkK3X7YB+/oU9ja7HKbNY
X-Gm-Gg: AYBFou3jz0aqNMupz8F5iWRE6aLDlDBiKevKGtRr0ceg9/sYLy4w3b1V4RZbZ6rPjUo
	YkYKMzU9XmwV3tP08Bu0qdneZgEQuLxPcUpjcFOSbUt7mhlRhv34mrVxVmL6od6X+l85DwT5iOx
	y7j+6YRlYfrvtqJNYhIAeo4bwdD5DjJ/j2Yycdg3gy0ak1LNNfZfZwTapBu5zjCjZJ0j2+0KtCp
	DKyOz7oIqyt4ZnBRHLu7eF1hRrlSGaI4SxLboLmPG/Y1lRTJGKQnnbfOpI0Ds1ozR2zobhsXLaU
	4Vn88CywFmDhEvdyPOH2hy17XqxTCGGvdS+CQdF7PKQJBXHUUnM+RmzZ2Lf/LsFPfBNRb2o5SDX
	cfxBxOvQ6ytYq/ZoAgApSRisOfUI1ArRaPFDdNJhGs9pAJWsIslQg3yxI0EIPDZ/+0nNUQEzm9V
	2p56xQdn9P3W0GoDNbZGUnGlleoRQrQxVUehoguBA8vh94SQpVFpmJ3UXNZMZUmjYs87cyduuXP
	mq9K0USv5/8VSUQFfBUuKcPNJbAZGnFCnHrRQ==
X-Received: by 2002:a05:600c:4704:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4a35acb115cmr88717975e9.20.1792952133411;
        Sun, 25 Oct 2026 11:15:33 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a59d998sm143804225e9.15.2026.10.25.11.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:15:32 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	jeff.chen_1@nxp.com
Subject: [PATCH wireless] wifi: nxpwifi: validate scan response TLV sizes before indexed access
Date: Sun, 25 Oct 2026 18:15:31 +0000
Message-ID: <20261025181531.3744345-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

The scan response handler indexes into TSF and channel-band TLV arrays
using a loop counter derived from the number of BSS entries, but never
checks whether the TLV data is large enough. A firmware response with
fewer TLV entries than BSS entries leads to reads past the TLV buffer.

Add bounds checks that verify each indexed access falls within the
TLV data length before dereferencing. Initialize chan_band to NULL and
fw_tsf to zero at the start of each iteration so that a short TLV does
not leave stale values from the previous BSS entry. Gate the
neighbor-discovery branch on chan_band being non-NULL to prevent
dereferencing an uninitialized pointer when the bounds check rejects
the current entry.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/nxp/nxpwifi/scan.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/scan.c b/drivers/net/wireless/nxp/nxpwifi/scan.c
index 67d7ff2f10c59..304113b24e5cf 100644
--- a/drivers/net/wireless/nxp/nxpwifi/scan.c
+++ b/drivers/net/wireless/nxp/nxpwifi/scan.c
@@ -1993,23 +1993,36 @@ int nxpwifi_ret_802_11_scan(struct nxpwifi_private *priv,
 	}
 
 	for (idx = 0; idx < scan_rsp->number_of_sets && bytes_left; idx++) {
+		chan_band = NULL;
+		fw_tsf = 0;
 		/*
 		 * If a TSF TLV is present, save its TSF value in fw_tsf. This
 		 * is the firmware TSF at the time the beacon or probe response
 		 * was received.
 		 */
 		if (tsf_tlv)
-			memcpy(&fw_tsf, &tsf_tlv->tsf_data[idx * TSF_DATA_SIZE],
-			       sizeof(fw_tsf));
+			if ((idx + 1) * TSF_DATA_SIZE <=
+			    le16_to_cpu(tsf_tlv->header.len))
+				memcpy(&fw_tsf,
+				       &tsf_tlv->tsf_data[idx *
+							  TSF_DATA_SIZE],
+				       sizeof(fw_tsf));
 
 		if (chan_band_tlv) {
-			chan_band = &chan_band_tlv->chan_band_param[idx];
-			radio_type = &chan_band->radio_type;
+			if ((idx + 1) * sizeof(*chan_band) <=
+			    le16_to_cpu(chan_band_tlv->header.len)) {
+				chan_band =
+					&chan_band_tlv->chan_band_param[idx];
+				radio_type = &chan_band->radio_type;
+			} else {
+				chan_band = NULL;
+				radio_type = NULL;
+			}
 		} else {
 			radio_type = NULL;
 		}
 
-		if (chan_band_tlv && adapter->nd_info) {
+		if (chan_band && chan_band_tlv && adapter->nd_info) {
 			adapter->nd_info->matches[idx] =
 				kzalloc(sizeof(*pmatch) + sizeof(u32),
 					GFP_ATOMIC);
-- 
2.47.3

