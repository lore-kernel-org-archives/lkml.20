Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303843;
	b=mnf9EGBFeyEUz02nsDGA6XZ7pWneKDfal6J4y35knNLGlCe6YqLV5OjfGif3Bii529t1
	 G1v01OFCHn3adHpNjHDU5apQ+mnTwNB7zYMpulBD2++lmiw62hnTDrk0X68lzMZymTyyu
	 iFkreG2I/lR61lyb6FQnGUko4kEcF78fxBnqk4CEbUeGaLQD0twfuzlmJA+zNb9PE5C3K
	 7cwiRL+EkwqFuVI/mRpOtafoBovL8kqeQP1VKbpF/KTC9o/34PcisqXta1NrF2JdQ9OHE
	 b1wiAl2rs+6kqfmQoFyVXu/kMSZ+gnw+Tl/IB9t4zg39a4gk8i4WT6iQjQe5ch0Tp2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303843;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=hdK+pDEbjtxXIas5PTih8G25EZ5jkuMrar1Qn0ux3aM=;
	b=TOzDWxQPIFsYeZdrgxstP9h/4jgU5QYnoP2HsOwoeL/aJVlMKvts/PQcuBohs3yjG0eo
	 PAMOGCMPGd3o6/vDNWMC1b5FdZdSBY28JDAN8z78HHgp/jxXWPn/1XdfWxH/xR58O9259
	 qlQc0Uc2qd4akMha1ujDnp5JQUQyKeLhQW1Tspz5Nf696UaQvSh/UjfmS2isB19wevDRR
	 iYUIVs8UF9+82pNIGEEYbSzFST1gmzioRmpamkKDiwNnrONH2r867UVQZ9MZHPaH8SVgT
	 8rK2hndiimeOyGWSM3ESUKZmCYuK5UVoA1B3Piaj+Lggb2x+Xsu/rLI/dUZjJto6ykg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CSHsWJ2f;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193ED6076115
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 193ED6076115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CSHsWJ2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794303842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hdK+pDEbjtxXIas5PTih8G25EZ5jkuMrar1Qn0ux3aM=;
	b=CSHsWJ2fiZRpFquNcvQRjYQTzm9y3ag4r9M/qBZtW/hgh8bVQpF49hPnsNQaevTx58Suzm
	AfmOLN3SjSO0ZKxWEB2hZqJ8CQopE8yrbpGfNw59gzw4u2/8uuVvCZknhJynRfKpRT4J4e
	vPByMkIb2CEZMCScOil6HADs6yRE+2M=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-q5guI-8xOCuxhWOGmMLpKA-1; Tue,
 10 Nov 2026 04:43:58 -0500
X-MC-Unique: q5guI-8xOCuxhWOGmMLpKA-1
X-Mimecast-MFC-AGG-ID: q5guI-8xOCuxhWOGmMLpKA_1794303836
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 662071956047;
	Tue, 10 Nov 2026 09:43:56 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9277D39203;
	Tue, 10 Nov 2026 09:43:51 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Grzegorz Nitka <grzegorz.nitka@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Petr Oros <poros@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Schmidt <mschmidt@redhat.com>,
	Jakub Ramaseuski <jramaseu@redhat.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/2] ice: dpll: fix updates of the SyncE CGU registers on E825
Date: Tue, 10 Nov 2026 10:43:48 +0100
Message-ID: <20261110094350.184185-1-ivecera@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

All E825C PFs share the CGU registers R10 and R11, which hold the mux and
the divider of the two recovered clock outputs. Both patches fix how a link
change updates them, both found in review:

- Patch 1 adds a lock shared by all PFs around the read-modify-write
  sequences of these registers. A link change on one PF could undo an RCLK
  pin change made by another PF.
- Patch 2 lets a link change set the divider of an output only when its
  port drives that output. Every port set it from its own link speed,
  which is wrong when ports run at different speeds.

Both were tested on GNR-D with dual complex E825, details are in the commit
messages.

Patch 1 was also patch 2 of the net-next series "dpll: do not serialize
driver callbacks under global dpll_lock" [1], which needs it. v2 of that
series will drop it.

[1] https://lore.kernel.org/netdev/20261106121005.1327603-1-ivecera@redhat.com/

Ivan Vecera (2):
  ice: dpll: serialize changes of the SyncE CGU registers
  ice: dpll: set the SyncE divider only for the port driving the output

 drivers/net/ethernet/intel/ice/ice_adapter.c |  2 ++
 drivers/net/ethernet/intel/ice/ice_adapter.h |  4 ++++
 drivers/net/ethernet/intel/ice/ice_dpll.c    | 11 ++++++-----
 drivers/net/ethernet/intel/ice/ice_dpll.h    |  4 ++++
 drivers/net/ethernet/intel/ice/ice_ptp.c     |  8 +++++++-
 drivers/net/ethernet/intel/ice/ice_tspll.c   |  8 ++++----
 6 files changed, 27 insertions(+), 10 deletions(-)


base-commit: 1d5e2c57e9ffc134e14b3f837c8d7c53b508bd22
-- 
2.56.0

