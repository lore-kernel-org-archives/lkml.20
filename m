Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351363;
	b=1crx2Wz/Td7q4tvRsZepqXaX0459nJtAOSvSUkiIE/q2rIOyfLAV3RjHeP6pP5MFSQWc
	 R0n2Yg4iRPdF/UXCLFi+iSZS+BKzY0urPJRMAqet8DBAzxgQmehDO/Lt7LGiRdhat6crc
	 OHHpkAl8Mca6JeCOhLK9Q84Vz/5A5aGDhSqn/d7wWjUvXDqtRdUFpUA5Ge3qBQozwrKgO
	 BFWQ5AtVuOIP30ITKFXmhNaiDgXtWxCya1hHOLDaQJH+ieHw+FJWBKPdPRMcxCc70/igf
	 2OTCb2sOat6kBOPexXq2SNcmiTF15CWsQnX4uvSftu+9LjWUKUgmQ7dHAYZD2KCyWOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351363;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=ZkMDNCTbHZPjo1kRABP18CGjONpKH16ExnHAKYrhxSk=;
	b=m4anGpP/DlYQjXFiHB2caq3AH1K4KcmIkL8kHyYGGdehzJlQ+GTsr8AKamnJqtoJ3oFa
	 NgDqAgJxXZJXMG5mbw+KP8yG+rB6KqtQkWORgXbzS8myBzBLS9M1nPcr5IrNPchoIphHX
	 ytlN+HikFDJnd93pAwivCxmgB5F6WTRq04DweiaMSIDBXKhFHgpzuUVduyybdmvA6Eh/R
	 jEFWyCXG8cQ1RPA5Ge5bAj2sz4tc6QQEJ47Qp/2BhED08wqCk/Sj8FxNxGPiyLQZmWtoo
	 R+p7chmRbiTl6aCVwC//tXcM6AUOTtU8p3HmKV4pKEo/aHqtFU6V6mQJ59/OKJX9bxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WRv7Tgxi;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CA2606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84CA2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WRv7Tgxi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793351361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZkMDNCTbHZPjo1kRABP18CGjONpKH16ExnHAKYrhxSk=;
	b=WRv7TgxiyoJ9eCclHvGDOG/LKRwz1WiAt2ZkftrkQPhFq9ar3Zv6A+7rMRb8PKVHb0sO9s
	ePR9B13mc1xSS3rje1Q9Nt0YY2Wb+A4J6RckhLZdVK7Asm+Vs9NCA9jrt1RrtiNgIGdE6S
	BhSbduilM+Hdlp1Uh0jKiZaqvMBASo0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-_isT2R19MFe_XnFa7sZTSQ-1; Fri,
 30 Oct 2026 05:09:13 -0400
X-MC-Unique: _isT2R19MFe_XnFa7sZTSQ-1
X-Mimecast-MFC-AGG-ID: _isT2R19MFe_XnFa7sZTSQ_1793351352
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 59E2E1955EB0;
	Fri, 30 Oct 2026 09:09:12 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D0AC11800495;
	Fri, 30 Oct 2026 09:09:09 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH] wifi: ath12k: fix wrong register read for RU start index of 80_3 segment
Date: Fri, 30 Oct 2026 10:09:06 +0100
Message-ID: <20261030090906.298234-1-jtornosm@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The RU start index for the fourth 80 MHz segment (80_3) is read from
rx_usr_info->info2 instead of rx_usr_info->info3. The bitmask used
(HAL_RX_USR_INFO3_RU_START_IDX_80_3) is correct for info3, so applying
it to info2 extracts garbage bits, producing an out-of-range shift
exponent that triggers a UBSAN splat:

  UBSAN: shift-out-of-bounds in drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c:302:22
  shift exponent 284 is too large for 64-bit type 'long long unsigned int'
  Call Trace:
   ath12k_wifi7_dp_mon_hal_rx_parse_user_info.cold+0x3a/0xef7 [ath12k_wifi7]
   ath12k_wifi7_dp_mon_rx_parse_status_tlv+0x621/0x990 [ath12k_wifi7]
   ath12k_wifi7_dp_mon_parse_rx_dest+0xa9/0x2b0 [ath12k_wifi7]
   ath12k_wifi7_dp_mon_srng_process+0x34f/0x560 [ath12k_wifi7]
   ath12k_wifi7_dp_mon_process_ring+0x205/0x270 [ath12k_wifi7]
   ath12k_wifi7_dp_service_srng+0x1b4/0x5e0 [ath12k_wifi7]
   ath12k_pci_ext_grp_napi_poll+0x43/0x100 [ath12k]

Read from the suitable info (in this case info3) like the other three
segments do.

Fixes: 5db19c488413 ("wifi: ath12k: Move MU user processing to Wi-Fi 7 module")
Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 1e29c13ad66d..0e69d9fe138b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -293,7 +293,7 @@ ath12k_wifi7_dp_mon_hal_rx_parse_user_info(const struct hal_receive_user_info *r
 	}
 
 	ru_type_80_3 = le32_get_bits(rx_usr_info->info2, HAL_RX_USR_INFO2_RU_TYPE_80_3);
-	ru_start_index_80_3 = le32_get_bits(rx_usr_info->info2,
+	ru_start_index_80_3 = le32_get_bits(rx_usr_info->info3,
 					    HAL_RX_USR_INFO3_RU_START_IDX_80_3);
 	if (ru_type_80_3 != HAL_EHT_RU_NONE) {
 		ru_size += ru_type_80_3;
-- 
2.56.0

