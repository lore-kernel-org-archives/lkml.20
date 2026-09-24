Received: from mail-dl2-f22.google.com (mail-dl2-f22.google.com [74.125.229.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2E831E84F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253783; cv=none; b=IcSWRDkONKHDc+NQAsnLrau35hc6fGV8RSjZ1yzjDmU+UE+Xf/oNyu95EStf4vRBWW7eXyVmltL0+KSmLbO5akEudPK7fhcL/sNIDVyz9hJEzlDZow52yDwMSxz5n7/SH6TOK2VMgZ7vumbln/QCpx0pYjW4QC5YGs71EHxeNjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253783; c=relaxed/simple;
	bh=zcsQVVHG/G9+6qqRVAx1sDrnuXrYOr6+3mo7RH0lCAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KucMiCJn2KmrV8m1tGxcu3uuPBzsikRLMl8R8gCqpB3KUwBIY9p5SwJHh5PqIsc0j1x6M+B+YhlFSgUAcMZgqSsutegcgWdDILXmKR1pVtU7mlngjOXQUOZ2Z5UUmH10F0juRu7TzsbYUZuBuhrAWocJP0x0u52BWyT4DkFQ3bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aj7ctAZx; arc=none smtp.client-ip=74.125.229.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aj7ctAZx"
Received: by mail-dl2-f22.google.com with SMTP id a92af1059eb24-14383fddae4so1305500c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790253781; x=1790858581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bELcUaHa80x3oRnyW7uPxII023inc9Yoea4iI4j6aQo=;
        b=Aj7ctAZxcUT2DsFWBcZuTx3bUp9PIO6VyoAg7r2/92U8y9vvz32Fd+/FwXE86dTnBJ
         Jwaa1yQneWb5BWlS6cdzpSWvgWA6C54r8HSSsUhs9iatD0cXS1OcDm8Gw2oHng+Ylevq
         49d5CKr+Z9B101H94tx1/A6i47BQevxfuQlQgWw2DGgLKIf2zD2NcgH16N0nBdVnhn9a
         JMVaceQopf97SMXJFIJPGqva1GSzrHmatCgJqsJLiHvocaHExUj2Wy/IYAeR/pMkElK3
         1uxj23ictd2VjzXzPdTIb1B5cvEzLDNhH6YVPv9TBMJ7tUMfPiZv5pw70L2/7xIHoj8N
         +EpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253781; x=1790858581;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bELcUaHa80x3oRnyW7uPxII023inc9Yoea4iI4j6aQo=;
        b=r0s/Yr6qGDu9Mn9GT+BybVkAX4u4HqCt5mfq2B7WEZyusqU1XAnUFusdua6ALDoZDP
         4SyalDWPRNEtOXfC0rFImTs+l/zp78wtSQP19NSviZAvY58L5/W0+lGdjZw5nmzlibyh
         znNfu5Yxnp0Y7KtqgV5RealQiiXm6uWsuDPrWPstHk/leNm3+3/ISr929/65oW6ZrLSy
         AlHeLr7xu0B6sTTT1/KJYhbOP0jjSUhau9uM3cyd+mzAM2MpS6xB1jKoJwFzA9HlViab
         GJ4S2lTDjsou9sVY1G8AiVGH5NYaA8Gty35joCnNeBUip/VWoRt0oOM4bPD+CUMS4nck
         MmjQ==
X-Forwarded-Encrypted: i=1; AKwUvBytsx5FpdBjrViUXvzPSbu/augtX0BJSERm2cvoEYIAKFBASLU+3hVVoYJEfbx8xJk4oAG5o9buqrQlRx4=@vger.kernel.org
X-Gm-Message-State: AFuF++lNIB8aih+64MBL4pJlKdmdHzCtsB0tHL9mhkjq5+xD0rlG3D3C
	15YUUCyDMnhwvwF1BlrHpaoPJLXQifFoMs6UzVnB5V9WAeO6Dg7htqPk
X-Gm-Gg: AYBFou2tNXvYJhoshSlzVtziQoQtWKA1kwinJ4tSM56g9sI/e6CcD61ugokOfw0jJ97
	yoaGmrAlTYEJXR50wxy7+BicF+raY/P3DNlpKAtKwzrBNJmI2tn7JIh20LbGrU9Jw8bRFup1DAR
	LaHcNxxsU9semI/JVtDI2RTHmOCE2qXc2caX9tnf1uETsqo/UJTfMQWKLSP5TK0Q1qxRxaq0wMG
	yqnJICFUIaRZV4yyQow75yyd0G2Xk0qIhGEkQf5CH/440HPUv5put8Rk4vCM0Bx/XaNdpuL8zoN
	l/Iic3h/Q4L5r1aqHjbCoTDQnmPjCBHzfB/izEQNW3IEab6YpXkR1sKqGmjPIAY+zYRMpwU35so
	KlQYFLekEMedC+jq5nRxSuqr++LW82vXcTedwsKxwRr+ot8FKWztOp25dZlWviYr95QTzlzhAEg
	+mp0rr/1OXC/bkoCEjYZCIsepYR2eU5Mc9wEEc4LkyCjnnfH+eXjW0bLFyGxeupbabmauMb3ZyM
	gBg7Yb9
X-Received: by 2002:a05:7022:5f04:b0:144:f4a0:a399 with SMTP id a92af1059eb24-14503f2edc2mr2002874c88.1.1790253779736;
        Thu, 24 Sep 2026 05:42:59 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f986e465sm13466113c88.9.2026.09.24.05.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:42:59 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: bhelgaas@google.com,
	linux-pci@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] PCI: Do not mistake an absent device for an active link
Date: Thu, 24 Sep 2026 09:42:21 -0300
Message-ID: <20260924124221.12374-5-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924124221.12374-1-fbeltranmillalen@gmail.com>
References: <20260924124221.12374-1-fbeltranmillalen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pci_bridge_wait_for_secondary_bus() reads PCI_EXP_LNKSTA and treats
PCI_EXP_LNKSTA_DLLLA as "the link is up".  When the device is gone the
read returns 0xffff, which has that bit set, so an absent device looks
like an active link and the code waits PCIE_RESET_READY_POLL_MS -- 60
seconds -- before giving up.

Treat an all-ones read as "no link", which is what it means.  On a
MacBookPro14,3 whose Thunderbolt controller does not come back from S3
this takes the resume from 65 seconds down to one.

Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4773,8 +4773,16 @@
 		if (!dev->link_active_reporting)
 			return -ENOTTY;
 
+		/*
+		 * A device that is gone answers config reads with all ones,
+		 * and all ones has DLLLA set, so an unchecked read here is
+		 * indistinguishable from an active link.  That makes the
+		 * code below wait the full PCIE_RESET_READY_POLL_MS for a
+		 * device that is not there.  Treat it as absent instead.
+		 */
 		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &status);
-		if (!(status & PCI_EXP_LNKSTA_DLLLA))
+		if (PCI_POSSIBLE_ERROR(status) ||
+		    !(status & PCI_EXP_LNKSTA_DLLLA))
 			return -ENOTTY;
 
 		return pci_dev_wait(child, reset_type,
