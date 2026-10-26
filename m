Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000409;
	b=PUnTRdtOcWU4s4S6D6t7tLFhJ9i4umrb1jK57fQkmkfOMJfZPJnyf22T8NsLRyzACPbn
	 aNNrMrA8rfykL7fZV6IZl/UtbZM39mKwOXkzGrCQKtlz77s9Zip/p6TTWsXWc4dZ8ZWxj
	 6rAE0jWgwi++o6aF0YxgnwjJvMGqqpYh1CypH2HsKVxd239vpe+OnT+rqLQNonTqWqY5V
	 vjWNHINuLYyPCmefvNfBqxrKckA8T1EJ0Xreys46vQVdvsBIYPtBN5Cs881Ya5torG8FT
	 cDau8oH9pTRqAB8IqM2TGeBzTgAodWOpG+q3C56mTDVLOmqMtNWKuf4Cpc1FR2JYYEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ii4dJpXYne4C2QVhe7tUkpX1jXXey1W0Pmp0/lKBrNY=;
	b=O2XhpVGe4dDE3ed2dYQLOQRoz2QKW0met6Hfe415l149dR+rlfn2xiZzCvXNXHQZ09NU
	 TysH2N6II/6kMsUlkOA/D4DGnKm5PGG2FYuLx48siZn2A9yiHLCiKz9RpJ9PN1jAHdJ6P
	 GasheM0r3z/uoN8xFuo0e374eQ6kbKXNEPlLFEWpW12A0Nm+F3QULUIJKCWaVrTobue8/
	 SuvlntXwv3Qm22agRIJzeINSvRtTmhODVgw2P7trspv8KqoFhmsBlTctc3K220Cxs1eAi
	 V2lhU91pu7ch6haCHx3k1DOLlrQwrDpPOPLyTCVsXeEVH8hfJjw2AQ8qqB5cUT4+eYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tLP+lhRN;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5869606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5869606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tLP+lhRN
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so5817935e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793000407; x=1793605207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ii4dJpXYne4C2QVhe7tUkpX1jXXey1W0Pmp0/lKBrNY=;
        b=tLP+lhRNLkDTOXo2paHqdLLRFvGlrnIePJnkhSxHWoMNGbkJ6iTI32WKYZbLGkHNvY
         oyaOGy7MqoGWa9Aov1dMT7M4e6aXNSbSk8JWMk4uY3wUaxYZh9lRwdU0tm0rKHcUGHwq
         55BNpKu5Nzr6qKexNGplRMa/7LYH+yx0Ed61UCPm1m4QJQ6dB9Rlvc0lPl1iCmpoLiYv
         S3pfjL4yw3NHi44HO3nOvv1b0N9HD6WHhRK4hYx6O+Zsiw2Fb1yhY8JlXWnVUY/UvAZD
         GkndLv4JQQQuiw9v75k4aOy0QPx+7Xuj11osBNuVu3Hl78kwxmVg2ElcHSqYLoKbEU1n
         jHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000407; x=1793605207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ii4dJpXYne4C2QVhe7tUkpX1jXXey1W0Pmp0/lKBrNY=;
        b=dVDRkHFatprqCPeAnFwdyeo9tur2WlE2Ge0zFlK4VUaggpRGXl1oQ7fFgcHToL8Kkg
         gJ7KolghjQZ9cSB4JlkGvZ1jO+gQ5g3Ft87Wf3smzYEg9xLbFjXJguUvjFN2n6Am+9q+
         UEuWFVSDbFM9FXYkkz7/SRUyNMIQVoob4ozYDBZMzzxBtbCynBGhbjyu6TTmNT67zVmu
         qBsiAHYT+EwlBlWPhOMIsKUck+tOs5jV/OUSfk2BZzvBSpujh6T2tmF3PlAqiWglNgaP
         l41aSivbMYu1J2pF/CqmyWfjrfDJT+4di679P1Yr7A+xV4sIQe0KA7luE07ku5Zsw4uh
         A7DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbLSxA8f7dNNoSR4avmJ3Ww+neh4xYMK6cVmg7bVBQaH7c3ZwAuZ7FDdtCkVwipK/1hodhBfaUPKq2wYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvP+2fB7/kWXL6/74x84TI+P8WVgWoFTncD9P4REwgJ3SDVIF4
	O1WerUovvYMCm01nGw1vOLAIEmDbffiLQcJedyG6iqXc+C6y+Z+Z1vz0
X-Gm-Gg: AYBFou0GwarvR7xTaXtxiJx3Jar19y4r8f5dCxQW6aeqPiDg3D+bCUaD33IH5ndrkyZ
	xv3rhYYqb7Ck+kuQA/op4UisPkhTzh5nDmWInGe/0Ms1DZXxFZmii04K0iCiqUw2DBDtrik4+8I
	IHNVuCv2bxBxYV5hCJ6CzQ4evn2ISkkdOIzTJx0pkrmdw7fwEyelg1w1dQxqvNOVb2iXHvaGYZk
	WwRXDYPiyDeZuF7AiVcaPfFMm4TpO9jpzmIG8nuYSQmqXoeIQ20ufob+nOz3c6C1I0O1fhNpU51
	MrasperwvOamURPwn9YcsnSY+5wCNuKQ5YTRU6wjygYS+kcc27oHV3WGmqUnB4INDzAaeH0afDA
	Wy14NqeGq5AiBdVLYQ2uLT3t50O2Prv9juBWiUeYLhzIEVoBdm89z63dBOpp4y/W/xQGLDCiJMn
	hWHjPRoV9IXjVvQb711eWNtOJAqg0V5Cz5XlgorcFDfj/7tQqv/OReC9FhnML+eFWZWBQI1oFOD
	ifqrcwlZfo5wTny1dq4tQnB55XS5cJ4yj2+qvMdYtBhCpF4fVzP/hkQTIPunuqRxbLxZAFG
X-Received: by 2002:a05:600c:8591:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4a526b84dc3mr46077005e9.21.1793000406964;
        Mon, 26 Oct 2026 00:40:06 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:4409:7786:c809:2fc3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb902sm15319939f8f.24.2026.10.26.00.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:40:06 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] genirq/spurious: Recognize handled IRQs with threaded wakeups
Date: Mon, 26 Oct 2026 09:40:04 +0200
Message-ID: <20261026074003.2805797-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

try_one_irq() compares the result of handle_irq_event() with IRQ_HANDLED.
For shared IRQs, one handler may return IRQ_HANDLED while another
returns IRQ_WAKE_THREAD. The combined result fails the equality check,
so misrouted IRQ recovery does not credit an interrupt that was handled.

Check the IRQ_HANDLED bit instead. Leave IRQ_WAKE_THREAD-only results
unchanged.

Fixes: 3a43e05f4d06 ("irq: Handle spurios irq detection for threaded irqs")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

---
Tested with simulated shared IRQ handlers under QEMU using
irqfixup=1 on Linux 7.3.0-rc5+.

The unhandled counts for IRQ_NONE, IRQ_HANDLED, IRQ_WAKE_THREAD,
and the combined result were 1/0/1/1 before the fix and
1/0/1/0 afterward (as expected).

Both primary handlers and the IRQ thread executed in the mixed
case before and after the patch.

 kernel/irq/spurious.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/spurious.c b/kernel/irq/spurious.c
index 73280ccb74b08..48d3ef35e763f 100644
--- a/kernel/irq/spurious.c
+++ b/kernel/irq/spurious.c
@@ -68,7 +68,7 @@ static bool try_one_irq(struct irq_desc *desc, bool force)
 	/* Mark it poll in progress */
 	desc->istate |= IRQS_POLL_INPROGRESS;
 	do {
-		if (handle_irq_event(desc) == IRQ_HANDLED)
+		if (handle_irq_event(desc) & IRQ_HANDLED)
 			ret = true;
 		/* Make sure that there is still a valid action */
 		action = desc->action;

base-commit: e74798f2f8e1562f2bbd2fed8d81929eeef39ffc
-- 
2.43.0

