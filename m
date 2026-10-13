Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA2753ECF9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919191; cv=none; b=tQlrC1q95UcoMv5iHbZCLcq+H6Dm9TdD4bzBP5+ugAoUSA4vb54SswKe954FpoRMFzh9hVBLceLs7Z2AaC31GDJ8bIwcGhA60/J1iuvDCyQTkWc6CWBp8pX6Po26OW0MB5Vv3WHBCoGeuPdNVAgYOSjNyUWYaEr/TfjyuNhh9zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919191; c=relaxed/simple;
	bh=YprzRlSBQO097fnNymkwLoOkj/kncmNm/McSsUydoqo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QYHVOxZSU5mW2b2KFhinzV4vGtCt8FRARuigaO0SiXlvoCkpk8ziDr+jybo8zw8qvNQyEZVwLCIB0IYvRE11ae8Hgg0aXn+EkH8dO5mdCDAUgMaikrbT+grB/KYNiKT9Q8t7jsO4/SU/gprsRRVYA5Sd7f7kIkbI+Fodyfxpz18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMLgawHx; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMLgawHx"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-82621039b6bso141069a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791919188; x=1792523988; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m/MFCfPNCZQJrpx+S7Eyax5BhDmU/GYfaQ7qYqnUIsk=;
        b=UMLgawHxwYB3IdRJAPm9+eA57B7M1fYCskNO90N2eIUXp6UeFME2Vb1V4pyinyBmza
         6sGRMNybx5ARsPHDr+jgXJ++kwdk9LexqmpB0DIOhSlu2Fha0kZeHF9v+lVRXbto37oz
         UtU86KQuz1Ed4cyNLXBAzB8e+GZyfXQTWjpkmZrscgD5j604bBps0yQVRjJKDerFkDp6
         WtEFi8WB1hNGfU2ET/hPwOug0fqa1nFJdJB7UNR6Nq4FyzHPcqlK/dbavfNHlsV4vwua
         gadAwhF1oSU2bprGqIPu73lIWPClfDwLvz3w79bWJiAPjZDxsHmh4tHoJKuOjkpGKRmh
         IqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919188; x=1792523988;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m/MFCfPNCZQJrpx+S7Eyax5BhDmU/GYfaQ7qYqnUIsk=;
        b=S4lqtrtZeNKOg81Q/FculXoOgNZ3Hgn/qzhW/BUhGS2vnwLY5vWNMfxq8J3EuFQNR+
         IKu/4gWkHmRvWlInkeOPbtjy7RNNVV82SAjRW/llzFcibO40BJXf6z46NLMzKnebUp53
         bCAWAeN/EMV4dCLxly5UhK8jnfh10KPnDYFtYRUWVVR0w+jDTl1Hvtaxf0bXOa/8+juS
         7uX9iUQtwlVtbgF0KvTCJPYDmgPq/BPOKqnmkgah5WeCT0ZA2LtwJgaLgJ1xAcGUJtgy
         F7Y2x4cXsLMeipY2THtEgr5TuSrhDVS20OyNT58mh+iFDqEl4aKVLQ8gdA2fT8H8BDa6
         4rmg==
X-Forwarded-Encrypted: i=1; AKwUvBzhsMerBlJuiH8hJCnjmZ0TfqBG+ponjqaU1Ule/v9tuQ4vE7n8x43eSJqarkPpgjgNeERCUavm0nkpDbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYISCBE08bQp/V0cXiCzW/2cY5esenGQq+S86IS9qZH7j4Wz7m6e
	qT9xaGh3vkJ6VTlsYbhcpxPjxBBpn/GTwZzyomGeZbLER3xrPTy0KBuU
X-Gm-Gg: AYBFou0M9zw+6LRZPFxxlMQDb6+C0kaJoP00TUbhSSmWc8kTEC4li3gxo+6NNjVhJ5G
	lMwY9SwkYI8XaBn6NvJu7d0OGkNiQQOD3gwJcvjV6OS8CuLTaltOEQHoBsX7Za6DHaQtC2LLB/T
	yWj6UX9YbDsK4F6jPpSBYxNrEuiNrXmPPBn05zc7QPqK0ah6vnKVip9hLJFKJ3cGvdzoQPv3swF
	YFM2FeFYQef1/E0IprJyvIs47GXyvyNrT8QKLq2JmMKHtqEv4zPmcBjt/N3+SPHpM+IuRKpfxxS
	gM+X1iwv720cRobJa/yahc6sMB7a37bf06palIyOf5HMcs/fa6s1qqlb6nXwMGm9VAZFyCK/Nfx
	tu7S9vi2WMlw8ZXDVvRm4UkSuzovYjrpAweKdoIRtYrNvXEzS/b++ElAf4eFNuJ+LLVWNuZl/wc
	SoiIOpJOAQzDPZifWmp+t8PNHQsT+n8Sd+Ow6tU2XbDwBxmdDvjLshnazCqSl3FVFI18QKFE/Bu
	K/qxr1TKyV4+JKW/fbuy56s1Z548MUi9cu10U8q8qwgcigHlv7lSPZv1Ry+QwM0fQeVffxQx8iw
	4iw02zD6q3rQolMNwCwcnCnz8jtqydVtwCSiIKIHBEMYGnLdodQ83qIDbaQz2SQrPenN9I3rGZ0
	2u1vP5KlFIsgOVFSF1rIR
X-Received: by 2002:a05:6830:82e6:b0:811:72c5:bd19 with SMTP id 46e09a7af769-83097c62e15mr13853654a34.25.1791919188430;
        Tue, 13 Oct 2026 12:19:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039a3dfa1sm13280507a34.18.2026.10.13.12.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:19:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net v3 0/5] ptp: make virtual clock sampling and teardown
 failure-safe
Date: Tue, 13 Oct 2026 13:19:44 -0600
Message-Id: <20261013-ptp-vclock-sampling-v3-0-d3ee4ea62fc6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ7CIBAF0Ks0rB0zQ2tTXHkP4wKBtsSWEmiIp
 undJSyMC+Pyz8+8v7FogjWRnauNBZNstIvLoT5UTI3SDQaszplx5C2KGsGvHpKaFvWAKGc/WTe
 AQN6LrsFOiZrlTx9Mb59FvTJnVnbLx9HGdQmvspSoVH/RRECgiO6K2laQNJdhlnY6qmUuXuIfg
 xBPvw0OCJ3RxHWjCWX/bez7/gZeIEVt/wAAAA==
X-Change-ID: 20260930-ptp-vclock-sampling-902f98408c93
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Yangbo Lu <yangbo.lu@nxp.com>, 
 Miroslav Lichvar <mlichvar@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Fix virtual-clock sampling errors, registration rollback and parent
teardown in separate patches. Keep failed PHC reads out of the timecounter
and serialize extended samples with virtual-clock adjustments. Also
preserve the zero sentinel for packets without hardware timestamps.

Unlike v2, this revision retains the existing cyclecounter mask, scaling
and conversion windows. It does not assume full-width nanosecond samples
or promise recovery of elapsed time after an unobserved counter wrap.

Changes in v3:
- Split the independent fixes into separate patches, as requested by Paolo.
- Retain the existing timecounter arithmetic and conversion windows; drop
  the full-width rewrite and extended-read anchor updates from v2.
- Propagate registration errors through sysfs, including a failed initial
  PHC sample, and initialize the counter before publishing the clock.
- Preserve absent hardware timestamps instead of converting zero.
- Correct the sysfs teardown rationale and its Fixes tag.
- Rebase onto current net.
- Link to v2: https://patch.msgid.link/20261005-ptp-vclock-sampling-v2-0-8ed12d4d10af@gmail.com

Changes in v2:
- Drain virtual clock sysfs changes before parent unregister walks children.
- Use full-width samples and overflow-safe scaling across long sampling gaps.
- Update the anchor for extended and cross-timestamp reads under the clock lock.
- Link to v1: https://patch.msgid.link/20260930-ptp-vclock-sampling-v1-1-c11bc16691ae@gmail.com

Assisted-by: Codex:gpt-6-astra
---
James Hilliard (5):
      ptp: drain virtual clock sysfs operations before unregistering children
      ptp: unwind partially completed virtual clock creation
      ptp: vclock: propagate physical clock sampling errors
      ptp: vclock: serialize extended samples with counter updates
      ptp: vclock: preserve missing hardware timestamps

 drivers/ptp/ptp_clock.c   |   5 +++
 drivers/ptp/ptp_private.h |   4 +-
 drivers/ptp/ptp_sysfs.c   |  18 ++++++++-
 drivers/ptp/ptp_vclock.c  | 100 +++++++++++++++++++++++++++++-----------------
 4 files changed, 87 insertions(+), 40 deletions(-)
---
base-commit: 513444cc62e231a11c9b15ea88de0890da9b2b4f
change-id: 20260930-ptp-vclock-sampling-902f98408c93

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

