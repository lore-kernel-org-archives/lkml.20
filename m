Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112241;
	b=hQUOZJ3vHwN2dpLATb7l2C/VXdI0MiGc+NA54yWcSal2O8WaW3BaDQ5cwrPjFehGBn+Z
	 HT667vJbBcvrPkMbsy+z9SvEqSeAph99WCiOsH5raQHIe+GhNcL1gCuNQjMWhfmDLU/8E
	 8yxLXXAZkZL3sVxCyDd+zQe2FVgodOZNZ1u91W7H76K4lT0+H/yDL14XzH/6ZAk1W4eb0
	 AZggR30JcUWlo+zhKmacugURGKs2H4Ob3TZ73Kysd835BCWMx+H1UwEMLln8ORFeIgxnz
	 QzMNox9ZVARFl44R91aYYvvFI4cgvyQdBVEUlmxVkvvXn9uPV3qBZ+TckehYU8JEn3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eMqLobo7VkmEKx6VZ6nPHT3O1QdYzqTpUBW8kb9AOmk=;
	b=OefR78ch8iuASH+LDEUPICkVP5fF+5xw+sETNbfQqfr8vMToUJFil6yO/odROs2NYlhm
	 KjAJvEnvRo0bHEtcxDSS6uL7q4blOioGzEUd68iQRjugo0GHsUehQSjPq2qu+LR1b6bix
	 TfuPk3Y9fxJKgqM4ZJO31awOQCO4jZE/+1F1DhC9vdAqOHFqf6QPWNzomyJVELVJi9GiZ
	 iOvoDhkKSOAQ0tcEw1GtfMcv2NKURrI8e6z9K6WU/10cN4+/onzAws8P676XesUr/M0Pe
	 V/fi+zQGXc2PuhKUkfAId+F6jG3AUpcc0C/Ed5pdSZTVKRe4mrcFGQZ7gFQB10BEkQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jribgd62;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4378D606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4378D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jribgd62
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2761c69fbso3435724c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112240; x=1793717040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMqLobo7VkmEKx6VZ6nPHT3O1QdYzqTpUBW8kb9AOmk=;
        b=jribgd62rdL1nuw6e74hurb5f/Zx86CJoYqOEdsXG1bNiXzuqpXgVP+oXKzBhOxBdy
         dP24fntV/MWaLaDPVBNLNPWKvVOK2QPymaROBnTacx7PPnu65bSC9T4nX0GgoJdJCLmQ
         W+cQtHFqzwDv6eRnp5R2uRI+pBes+vm+IkKMI+mft3tvP2lwLqMqjv+aLwBBloXRrbW1
         TEGdnk8CvZt469SacT4+AtJIb1wd/yIMfFGg0lDOZm82jUNF5ag2oApNX/ZMDFcUO5WY
         rsjH8TMdss7yBm3gay1M9FoxPgdZm/rqyuCs16UwfJ8euhOJ3xTNtvhG/s7Sf7zMQAZs
         bkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112240; x=1793717040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMqLobo7VkmEKx6VZ6nPHT3O1QdYzqTpUBW8kb9AOmk=;
        b=bC6ItQ1gyAAIvmU1hxX5tkmwqN6M7zhcLbv2ay98d8zuny+VpDfXVx57CIOvnzb0Nd
         1iI3tAJ7okqyOxUUvgf+iexUKTa4cnpWnV6m6SZPfTdsJ3eJ3vsrqGLH8yb7fHOjCcdr
         U59lpveI/F/VtrZFKJqhm9+7NAYmimG28oEqfH99pq6tLcvIWbVl03l8njvPOP4+AnH+
         dU3NEdQi6CygSmrfo2KZ5BuVYVQLpUhOfD7+5PzmbhmlcrQwh90EnnVTYlTh58LPYgoh
         w/TjkljkI37T1CpV8Zdu54l6syUSOO7RZxk+YiR1FrpFMtLIlUnXeZnjKTmQlFlBNPZ4
         otpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKHhWFoEiQZ2z62x0DKYQySF+0AUzbalpnVe4w3AWL7FwBfc7R9TwfWDhbcaI05/2/zUIfz+sRRVPwt5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD6kokhFCzR0QFjFfsUV65LmeG+LnKL4lll8voWsS/ut/st1Hx
	BGdQEk4btBgX6HwZ7LOiBRu40NayVdPVrVTedLZwQCB23P1GLeAV5qHY
X-Gm-Gg: AYBFou0Koap7xv1YnZCjcSH1OMPI1PSZtj+gfxf77UHchJ3FA7+msA1l1xTbCq8APRG
	dT9UvIuQFLS7FyYB629aiX7GMZ/3W6bFl1RwaoqIcf4ta3yBo58fS1ydtKlCF+uRbBItXZlzplI
	5SQCumD7tOMY9OzV6UoKaPCkTZ3eecpg/TROFLUO4PuYe2hMJ3fsRWC0gNX0bHpLdBpOrDtGDvS
	AQ4P6JUu1PU5AbRZzHjwB1xxCl06la+Ai8A4BTPMDw2MgJhIDHRO2Ve9nKSI5U3a+hJv2e6ZC9c
	lLchGOUTqGX2BgYdFH276n64t1FEBJ3+2/wHapAfgEddL1C3qV2SADnnFUEz3U0Khkh55wZZSoe
	C++i+dd9J5zy9mZ08DkGMb0b7AYJXoMVWZBHA7XM0BxiYtFxTmxG7drLlZN0GD39oGSdw74E0PD
	nvAEMiYOIDnz9q2ISxLIA0puZPVGvTCWq6kc5HHwpRCZHwQGXXlAkXstN7ZXPv+bk7Tb0Wf3dMA
	wAJJMXcMz49vXVeum2KyHTzs34hdstrMYcG8QdzzdQdCkMzuQWTqvQGUR/4BXfnH785ug==
X-Received: by 2002:a05:701b:2902:b0:174:cf1b:235c with SMTP id a92af1059eb24-1993f6d2389mr13877306c88.43.1793112240015;
        Tue, 27 Oct 2026 07:44:00 -0700 (PDT)
Received: from yocto.amd.com ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm33804482c88.1.2026.10.27.07.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:43:59 -0700 (PDT)
From: paritoshpotukuchi@gmail.com
To: linux-nvme@lists.infradead.org
Cc: justin.tee@broadcom.com,
	nareshgottumukkala83@gmail.com,
	paul.ely@broadcom.com,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	linux-kernel@vger.kernel.org,
	syzbot+df0058a8d0bdce7c4059@syzkaller.appspotmail.com,
	Paritosh Potukuchi <paritosh.potukuchi@amd.com>,
	Ravi Kumar <ravi.kumar3@amd.com>
Subject: [PATCH] nvmet-fc: extend critical section in nvmet_fc_remove_port()
Date: Tue, 27 Oct 2026 14:43:04 +0000
Message-ID: <20261027144304.1177203-1-paritoshpotukuchi@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Paritosh Potukuchi <paritosh.potukuchi@amd.com>

Currently in nvmet_fc_remove_port the critical section starts from
the call to spin_lock_irqsave(&nvmet_fc_tgtlock, flags) and ends
before the call to nvmet_fc_portentry_unbind(pe).

nvmet_fc_portentry_unbind takes a spin_lock_irqsave on nvmet_fc_tgtlock
again, to execute its critical section. The problem here is that,
releasing the lock before calling nvmet_fc_portentry_unbind, and then
retaking the lock inside it, creates room for other threads to possibly
enter the critical section.

The solution proposed is to extend the critical section inside
nvmet_fc_remove_port, till the point where tgtport is being used.

Reported-by: syzbot+df0058a8d0bdce7c4059@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=df0058a8d0bdce7c4059
Co-developed-by: Ravi Kumar <ravi.kumar3@amd.com>
Signed-off-by: Ravi Kumar <ravi.kumar3@amd.com>
Signed-off-by: Paritosh Potukuchi <paritosh.potukuchi@amd.com>
---
 drivers/nvme/target/fc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1b557775e033..96d8aafb9f56 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1271,15 +1271,11 @@ nvmet_fc_portentry_bind(struct nvmet_fc_tgtport *tgtport,
 static void
 nvmet_fc_portentry_unbind(struct nvmet_fc_port_entry *pe)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 	if (pe->tgtport) {
 		nvmet_fc_tgtport_put(pe->tgtport);
 		pe->tgtport->pe = NULL;
 	}
 	list_del(&pe->pe_list);
-	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 }
 
 /*
@@ -2922,7 +2918,6 @@ nvmet_fc_remove_port(struct nvmet_port *port)
 	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 	if (pe->tgtport && nvmet_fc_tgtport_get(pe->tgtport))
 		tgtport = pe->tgtport;
-	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 
 	nvmet_fc_portentry_unbind(pe);
 
@@ -2932,6 +2927,8 @@ nvmet_fc_remove_port(struct nvmet_port *port)
 		nvmet_fc_tgtport_put(tgtport);
 	}
 
+	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
+
 	kfree(pe);
 }
 
-- 
2.55.0

