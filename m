Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D733E49C8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184216; cv=none; b=mbTqXdmPR4qutNJtHLQc2MaUyufBLMsduygqjDBj+LLpPDpEVfSm7P+b60lzBNhBmfx3iQ3aZBNYxCmoi1zN8J5xUoTzYVFDbHk2+nXnkMU3kHAMKRRHpvSNPQVp8u0OoScw9a00Td5PO/rEBFubxGY01w8mttbtqp66Ga0jvA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184216; c=relaxed/simple;
	bh=J5/KF/+v0NyFlqQylPJlQovlsBLXV2sqWmq4lTWNg5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gh/N7wja5tQWUicu2rgKi+Me6PN8m/FoIBrafLf2xbyU9zxBYhx4qOEoC5nbJWfK2JqCxg+sFNRa7/5rz8WKpkxZogm1gPX0a89RZsErESpFIqA1akdJiPwXQJ+NJZeaqQK5s3fNLZzPph8T+hMEoJykNxP1P9yhIcI2jHZ8q2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=iETmO5tC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B0lPuG25; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="iETmO5tC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B0lPuG25"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 1E8C0EC02A7;
	Wed, 23 Sep 2026 13:23:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 23 Sep 2026 13:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1790184213; x=1790270613; bh=Jek+CieuMQ
	2lP30DpdpudqUEpUq0NdIrKVu9Y/BlgCE=; b=iETmO5tC2VGePpc3Obx4wRG6PY
	xaHQSe/ZW1EXOjTn1ATQw6acD1dJ9+yGNuci9HlGuTS/1xM6Hs51kIo4OHSrz16l
	UNaBN5GHLelI79c3Gp/DSoPTv4ktuQkI1qyfK22IckgCF/M7zOCHdWlyOp3m9j4z
	P5kL+cmO4dzekxITohOAL3Pex5ww0xglFjCD+QLQOt1cldajo8iOKdMKk6RxTiSS
	fnH4VyyL991EqttADf6s+ky1I0kE+Zf3qXBy73Cujsv5NqQhq2orwdKnhIMkd98i
	P1w9ojbNOb3h3XJcG7YntubRGHVhAthVvslUZtTEUZ/pVKrW2sVhXPAWfyuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790184213; x=1790270613; bh=Jek+CieuMQ2lP30DpdpudqUEpUq0NdIrKVu
	9Y/BlgCE=; b=B0lPuG25DbhqpSPDv//9nANgL0kT9py8MZfP7rHhqRXRu1xiORC
	rs03tA7X9Of9VmuWkedZVej9RvqPZmK7DNxJ/pVeyqc+I1RMxtbTsHB2ReM94hbn
	D/2rPhLZZ2kXDf1wUD1jxrHB5RwnYZqZlu8R904A3SXm6LWs38/JeBh3h4R2yB1y
	RaF0S0yNcU4UyoXJwasSMSKjuoaSRzkHeGaCk4JZPf4dG5hhX+MRi3hU0F1/kBto
	Ee5cWVL/i5ReH2W8meBEdMSZDcLA6RF/P2ejeS/oVSzG83u3nqJ9ZU2gqKUTdxBl
	C8JLlpazBeX0jy210TjjgBcg83U95eoDTJw==
X-ME-Sender: <xms:FAu0alD4EwmFZSEd7PhAteCjmcY4yPWCtTPo4p_yOqqaduyhu8tqmw>
    <xme:FAu0arQdIwFR8d5i_Bqgx3jZ1N512oo6TW4xk00yR4_piXuSJZnx2kSSW8REYgA8I
    fJhcx-r83JSRx0YfFySla8i-3gNlyzRepNqDLPBBtQNGIFo5SV-gt7b>
X-ME-Received: <xmr:FAu0ajrZ9OwfZv4uwBACldYKE19qgyNiH9A_4SbPndMijHhgzWpBDdwgaH-J--SNCPZ_psB1pfVPSBRCdmTsjslvUBLGW_CBbXtlwi9MYFqj>
X-ME-Proxy-Cause: dmFkZTGPrfyqPpi1DZZmjnACLc/fQx5mrQa5OwiAEzAytUDUBUQtvV5SS/k6DUQt1SYKwK
    RAu2HGpy+5KlDlXeVSQBLyUVWcM8OhgG0A6305k9NyH6/Tt3DeKM8EL0lF/rRU9fGVlGQg
    u0pMojUTiQk+dv6fvs4xT5mc7pz7CDsPauymo0RE6nBsyhQVN4J2yfQd/F5c0Z8Kjvv5s+
    /rUIZkMKMxzjlP7Se/Af6toKLESOMlZBE+81bobY17HcbeD9on+PgStwzRkOKHgaAaLzza
    vwCw4Yv5z/ktHSfmqYfdhT8HF4ax80kVY/6HguOOEKRijQf+gRKWBi49u4J2EWc75LPqNg
    pvd0+GbhG33+cPxlmO940XR4N8TUUIfZIIqXLQn1GKnJzZLlZBR1Gf9Ko+uQrHqpBo6ZVx
    b6vAfxMd62erXraPwiHYytDis/RfX2GAYppsR7/jFpXuEpjpqNlg5Hiz/ztiWbEYgXvyz+
    FIRxF92wkAhLl21Obn5cl9hQDgz7mOWNRKNgNmgYXs3bIX5IRbf/Tzkx5baYH5z6r4SiGB
    YK1pjibu2/VxIYuNB+J7knVDSrZpTJFPEox+KAcTnboFCfkaxuCnnRf/Df5MDuI2Vc3e6x
    Tdjw9KjXjbCsq+8J1/c3JNPQakGC6SbwApz04E9sV7xa+5IT20z09D9OyV4w
X-ME-Proxy: <xmx:FAu0atwadHdV5kiVH4S0lqjgJa8lp8SFp70eBIk0D_FYZZfKOrFuRw>
    <xmx:FAu0aoIhNCWhrb_vu4z9CSfwwuUKMKwiwXTircfl2Ek2p57XWFFIdw>
    <xmx:FAu0avLQU7DWm9NnDrQNATRIuQAZtcITA-EAE1buOTVF0qwng3gkwA>
    <xmx:FAu0attwa0r4TXJ_0uahqx5r_2NAxKWIktxOLUJ9dzA3lV3_XYX43A>
    <xmx:FQu0akppF7DfxY3nwHdgudayh8SC6Y_KpU7Ri4I2jf3lXbc47yiDtdZ8>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Sep 2026 13:23:31 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: dingiso.kernel@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] firewire: cdev: fix client refcount leak in iso_resource_auto_work()
Date: Thu, 24 Sep 2026 02:23:26 +0900
Message-ID: <20260923172328.277232-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes client reference counting for fw_iso_resource_auto
objects, reported by Dingisoul[1].

The issue is caused by ad-hoc client reference counting when scheduling a
work item to handle the iso_resource_auto client resource. This series
holds a client reference for the lifetime of the fw_iso_resource_auto
object instead.

[1] https://sourceforge.net/p/linux1394/mailman/message/59317811/

Takashi Sakamoto (2):
  firewire: cdev: hold client reference for fw_iso_resource_auto
    lifetime
  firewire: cdev: fix client refcount leak in iso_resource_auto_work()

 drivers/firewire/core-cdev.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)


base-commit: 4eea44fefc15929ac2de10bd9b12319ea42e0e0f
-- 
2.53.0
