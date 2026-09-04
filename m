Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD15348C40F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519623; cv=none; b=Qi8lH3BJZgzAAW3Q80w9q/iAB8UshDu9knFZ84JAlKv+pM1On8rjlFKpbbI0XIIwgBD9QmFxUhHbGmFM6kXOpcG/NEIKMXePdos0o1jpTMVSDvveDC9/AeoFXvc2VI6TaqmUEuL+5bHgJhzGcxF4zIy3KhFyVHoM6s6+/lycaK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519623; c=relaxed/simple;
	bh=kNNmMJ08HlovFe8FUVGZx7SQMVsiXJKFTSldnLo7juM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=doZCaiWlX14Cw0ikW5+aNmM6U5jTE3RR8rNbcDPjzSPCXfkQmF/U3CvL4uSQDJe21Ao3vVfhWYYkNboLL9PbR3GDVrCIMCXWHu1vLMMY5R3izpoE8dCv5x5U9xz0DlXkFCqSq8sIBEL/JuXu/oxC/GEJJOpltx+JtWaVIGyXWzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFWfUdSI; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFWfUdSI"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so542315a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519621; x=1789124421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/C8XGb+ugfjeqG4CGw+R8wROppGdlopAORJYbktvls=;
        b=kFWfUdSI0UA1HSJ9tVUYR/fd/7jQbyX2a+tCNSWcMRmXvJFoOv7SoAt6ypHRn3Kwb5
         xkhZ/ij3/QIoZvR19ZRQvvINMTUhas98FcS9419k1yUlVU1tjD0jIpx3HHqdtc/N45mQ
         1WhEs+V2tDyEG18t43LsLSwsak7vSxIEvZ4KhuLiUmjkrGIB1k4ALpmvDbC68AVb3ThI
         RpZiw0XcKQbrhpggDXR6hMyy3OuHjPNWoOBKKc1x6WpUyeXSpU1kKtalSccNiLy7ldRJ
         7hmhoDtSdqWqqEEJCKTvdRfplV4bXWeczReH1BGspjFpEkadT948bGQVypfEy/hzzkTA
         sJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519621; x=1789124421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g/C8XGb+ugfjeqG4CGw+R8wROppGdlopAORJYbktvls=;
        b=jFLsbKXcoJT4hTMMwF83pm7FoihWTZOHOhUHG7eICcEFEelEwnfQe+lgxP4XIbR86Q
         enWsCAQt3LoHGBFpj2BTOKes3ouRhuWK2ho83u2AbW48pS9cJTr711fIQ7F32p74Yw3x
         yVSsLFxaR9wSQKMo183VixquWbPok1yCA+22Grik5Q8kXt4oEgyV8i1O7piU69ke/4Vq
         Vlg6FBpPUmQMfSUm2iKKlZsLAMcsAb471s+i7E2RD7qMRG//NfWiGsWEHgjPOUgr03C8
         NSNad/xzDmTQCTtqJSsVPOgsUIP2b1ZfSGF3HfmqfxWeX05pFYmL785yTsd0qF739Bk8
         loxQ==
X-Gm-Message-State: AFuF++mSlJRBHfur6ykR9DSElZTSviZcct4gx6KP87rtAcQLAdb+Z2nd
	cO+ain+C9WLajFKTGGEVBU/wgSEqtJKt1/6yRvqDR/Uu5N4wKdjEOp8u0ePE9lGDE0g=
X-Gm-Gg: AYBFou1U2SZSEjKEYMblmR83MXahAVkVDQYWyVS9zCmQ7SJrhXLTkyemQ2fxvmbV+J6
	8BoyMOMXwXwpvKfkf7iqqZhLg92byemCJY8uucIMoZrKG6+rwmBXP+z74+5CZYSeBcf6lrYk4GR
	7f2OovLjjsoSmP5dtszaAibHroEyLjccmT8SFI0C7Ct3KYSj1LleGf5gCa8EK1c9QCWKb6d+4Xo
	sMpLOELHu1bQtuhUOV+XUUQ/UH7W7k1iF73/PqyYdtEht3luhKMQbWEHRyCjzFfm7b10YntrLvq
	7pVOpehCVMUvR6Q9B8ai3BkSAmsAm2+C9K3fxcntlbVf8v8KRJA9ACQc4smB147mcCPCN535Uxp
	dnktMe+zSCkZf1UeXdHJWJv9C8tO5m7QXWXX5aAZfReY4ONi6X0fxgsKw1f8DqeYZB3Ep+LDWoT
	Tta6W8UPOr48nK/oEnjC68cqF6P9WUgEpo6/HO6tjjqJdsktXpE1hmzYF+3W8+J6k60/qnPAZ9I
	DJ5P0FAx598iM4ZMYsiy4VBLPc=
X-Received: by 2002:a05:6820:1985:b0:6b7:8415:d788 with SMTP id 006d021491bc7-6b78415d841mr1086028eaf.51.1788519620517;
        Fri, 04 Sep 2026 04:00:20 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm6813221eec.7.2026.09.04.04.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:00:19 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] pcmcia: fix repeated word 'both' in comment
Date: Fri,  4 Sep 2026 16:29:57 +0530
Message-ID: <20260904110000.6304-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904110000.6304-1-hemanth.selam@gmail.com>
References: <20260904110000.6304-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'both', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/pcmcia/ti113x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pcmcia/ti113x.h b/drivers/pcmcia/ti113x.h
index 9ff0deaf73ab..9bb697b16aea 100644
--- a/drivers/pcmcia/ti113x.h
+++ b/drivers/pcmcia/ti113x.h
@@ -758,7 +758,7 @@ static int ti12xx_power_hook(struct pcmcia_socket *sock, int operation)
 	/*
 	 * all serial/tied: only disable when modparm set. always doing it
 	 * would mean a regression for working setups 'cos it disables the
-	 * interrupts for both both slots on 2-slot controllers
+	 * interrupts for both slots on 2-slot controllers
 	 * (and users of single slot controllers where it's save have to
 	 * live with setting the modparm, most don't have to anyway)
 	 */
-- 
2.48.1

