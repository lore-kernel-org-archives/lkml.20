Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843151;
	b=shTLzTV0dF4ogGeMVIL93N5JBbA9RSOAc+A6Hys+SXFb2D0n8gbd6VyK8laAYqhZeceK
	 IfI4zPnle4SN5oTu3faEcxrPm2wyqpEwP0qRD05PWyiv6o6USVntdFaYWw1TD3r7DbXeQ
	 j89Qq53vzCd4HLEdfnEBjPAABm/QQ+hQuNNL0lXjoJFmIS5xmfziOm98F0xO7qFXMGVL7
	 gY5ToxC/kq4UJbx1arv/ZzqJfXo2+Gq5VHGDQiXA6PyvVEvdz064IUTrBDjfZvr8NaDsQ
	 Ip5G9vJ7+9rVxWOGUfbI5zT0vAnev8DiU7VhWUkP/YOpMblIua0TEPxbHTPulS43Ejw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843151;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R1jIRfB3ox1HJm5a/fEcBWWhlLh4Dq97+JTDcDcZ0rw=;
	b=5CIiwoKSriNL+nGnbFLLfPniU70K6QGHnMNq2J3Oi8JdE3gRll5Mq3KIgiGfqnRKc+L7
	 KLypP0by5cI+tNgFS/ZqG/gqfnwou0+ZckrS7VivonMfCtfKeGwNqDPDw1tSM4n0At6Ic
	 wXqiljfSoZJKToABYOeU019qlIth6T1GfJk5gY4iVVtPzUuixx5+kVLc36r/+fEhwKCtj
	 RMCRfsr+X+Zbu53CAQtYtUfC1Ns2ivQvRo/TtgYIkDEBz254D1xhLArzaqqqrdd3SjOdx
	 mYi7QiYt1WU58V6qnqJ1KW/85ZxKF1cdb8OLGtU1gFJz0dVT5vVXJ2p9B7++JycYp7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96F7606A326;
	Thu,  5 Nov 2026 01:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C96F7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9cc8c31ed8ba11f19a56ed5b684f684d-20261105
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:180433c3-3af0-485a-a815-f7c2618ea917,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:866045d403429875fc3256654106fb97,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	5|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9cc8c31ed8ba11f19a56ed5b684f684d-20261105
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1407439296; Thu, 05 Nov 2026 09:45:43 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: robin.traftec@gmail.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ALSA: hda: cs35l41: Add support for HP OmniBook 7 Laptop 16-ay0xxx
Date: Thu,  5 Nov 2026 09:45:35 +0800
Message-Id: <20261105014535.47907-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

Add a configuration entry for the HP OmniBook 7 Laptop 16-ay0xxx,
which uses the HDA subsystem ID 103C8E13.

The laptop has a malformed _DSD which causes the cirrus,dev-index
property to fail to parse, so it needs to be supported using the
configuration table.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222202
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index c50c7e689533..958432058285 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -85,6 +85,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
+	{ "103C8E13", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "103C8E60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "103C8F07", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
 	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
@@ -543,6 +544,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
 	{ "CSC3551", "103C8CDD", generic_dsd_config },
 	{ "CSC3551", "103C8CDE", generic_dsd_config },
+	{ "CSC3551", "103C8E13", generic_dsd_config },
 	{ "CSC3551", "103C8E60", generic_dsd_config },
 	{ "CSC3551", "103C8F07", generic_dsd_config },
 	{ "CSC3551", "104312AF", generic_dsd_config },
-- 
2.25.1

