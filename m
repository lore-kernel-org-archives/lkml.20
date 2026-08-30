Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43722C0303
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788126083; cv=none; b=oAZKXK01SfOEOeaIUDHpOxnDHZCL4t5+NmhUwAlpS2kLZnr95xcunWelpHZRmoHEP36qOH6BFZgllVzcev7n5KLKcM5FTconNMw9CJjKOEj6TWzHUjY45VTXf/MoEhsioSJV1sTSnHszEobNB8WCzMc6nVYredTS5QotdEKBIMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788126083; c=relaxed/simple;
	bh=83Xu6UqXx980PQ+fn6M8Iu2SjJiRGmNuPm+GX5QnBT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=pgrY9rzsRxczix4t8rGmUlOzp4g4iF5shiCureLPbwRbbSaJAtmLrUaJCV+wr1aIjdNeE2atVuox6iUNQQIYDJKahL08ReOy0jCpXJwOPJoomBNvLCrEAvLVCEXY+/yc7KRVrUneZZzc5gd1Dyl5Q5h56wP5Xua1p5vPc7wagVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l48rzhk+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l48rzhk+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A911F00A3D;
	Sun, 30 Aug 2026 21:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788126081;
	bh=PPdCUtCInIBWEak1mgsFNsJGF7Hlkl0Cm5NcOzPtPLU=;
	h=From:Date:Subject:References:In-Reply-To:To;
	b=l48rzhk+f5p03YtmsiF2yDbXA74+OJkvu07Vmid5r9HsoN4keaq5tXu62UQVGqZ+1
	 wLCdX3YFaeWtyV1v5G5zvVSIVbbuNnH/xu/MsOrxj3rNagEvgmNIr+47YuRrytYoNi
	 xYALnXHzSOCaTKT8RLk94/rghHGVMwUT8ah1IHbqkmEnj00Gy8IzDZA7uEanS98xzC
	 GvwVb2oTr/CVcsBGRY3znsW9CNkd6TlanGUlzhhohrTPfKFL6p06dnptCFU4rsZ+H2
	 vpIcD1ota2Je2UKUiRUH7veicBJbsetvKY2YDUNKDVxLF2+abB9gHVnPVAbvbLgtHL
	 oV/ZxxdR0hLlg==
From: William Breathitt Gray <wbg@kernel.org>
Date: Sun, 30 Aug 2026 17:41:14 -0400
Subject: [PATCH 2/2] MAINTAINERS: Mark ftm-quaddec driver as orphaned
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-orphan-counter-drivers-v1-2-3b10ab8b3876@kernel.org>
References: <20260830-orphan-counter-drivers-v1-0-3b10ab8b3876@kernel.org>
In-Reply-To: <20260830-orphan-counter-drivers-v1-0-3b10ab8b3876@kernel.org>
To: linux-kernel@vger.kernel.org, William Breathitt Gray <wbg@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=751; i=wbg@kernel.org;
 h=from:subject:message-id; bh=83Xu6UqXx980PQ+fn6M8Iu2SjJiRGmNuPm+GX5QnBT4=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDFlTFjfUtbX9/HLvfZ/7txcM8rYXHyy6tX115LzJt+8Xi
 istesD7oKOUhUGMi0FWTJGl1/zs3QeXVDV+vJi/DWYOKxPIEAYuTgGYyMU8hv/RHSJnSr92B391
 SGRXKxYQfnHfo0a2rGrtRqnMI0XMM0MZGfa7LM5q6O/weOm6qX3SDA0btpCpa79tmyHWU5Yas1p
 IixUA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

The maintainer has indicated a desire to step down. Remove them from the
driver's entry and mark the driver with a status of Orphan for now.

Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f5bfa46536d0..3a2794eb1cf5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10134,9 +10134,8 @@ F:	rust/kernel/firmware.rs
 F:	include/linux/firmware.h
 
 FLEXTIMER FTM-QUADDEC DRIVER
-M:	Patrick Havelange <patrick.havelange@essensium.com>
 L:	linux-iio@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	Documentation/devicetree/bindings/counter/fsl,ftm-quaddec.yaml
 F:	drivers/counter/ftm-quaddec.c
 

-- 
2.55.0

