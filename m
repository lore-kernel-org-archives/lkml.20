Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E2F3446C5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.77.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788022190; cv=none; b=qLnVqxe4HwfkvmidbajgW7N1Ki095UTSwLd4Wk+IobIa2t7uT3Ia//Qtt9T5h9ous8wOqiGL2jsjdszoqnrNihDFSEnXTONSQ2wvG5cmH314yB5ZHnY5znvee4gcUmO3I127J5LVVCHMn6MVoxryfJAs8BHgOdxOId43yQY6uO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788022190; c=relaxed/simple;
	bh=Iw0cjK5UJL//41MNtoD+NsSkbfZWLwujm39NtbsdACM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oElQ24ft9YPxxg67UrbzrNO34/onNpqnsqc3RSouGj6n3yU9zuo8XE0tidkBRVAIXDNe+Ytu4XCFyNPqtHCjm8sEFE94xE65mp8lwXU9ExEAfo70kcaztl05MFrR2Ug67aLK9HG8NTVK2+LjRZdk0TnDnHdggNiWkjg5yIg3g2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=wsDVzIpw; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=wsDVzIpw; arc=none smtp.client-ip=140.77.166.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="wsDVzIpw";
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="wsDVzIpw"
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id 5408CA03C0;
	Sat, 29 Aug 2026 18:49:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1788022186; bh=Iw0cjK5UJL//41MNtoD+NsSkbfZWLwujm39NtbsdACM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wsDVzIpwo+QKSM25UU56wfI5D+8yrlBTlAiNPF1iE4cskKiAGVqyJ3djJpQbM8rZ6
	 /k/CqYXlN38LlKgRwIV6zZogbLOjRtnkWbveMEdP5t+W6469EaR5XbQepzGY41kF/v
	 7zb0WbRlJH42vIKriwV02zHmzy3zWa9P/7wLb/vHlLOmbQTXKhOQD9C9E9YjHaufaX
	 JsBu+N6M5daV7ChnFnjtzB/Zc3F09lI9JuQU2EhSKn3MrH7o0mdclSH6NnZJgAGqIK
	 8VlwIlr/ffnf6OSw6RYiuFWrjfePKFHSNir8Df0mU4wiNFQlEGqT+6FETNL6g/kjYU
	 acSek7WaGVWIA==
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qg23DjotVU79; Sat, 29 Aug 2026 18:49:46 +0200 (CEST)
Received: from end (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr [83.192.199.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sonata.ens-lyon.org (Postfix) with ESMTPSA id 1A898A0191;
	Sat, 29 Aug 2026 18:49:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1788022186; bh=Iw0cjK5UJL//41MNtoD+NsSkbfZWLwujm39NtbsdACM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wsDVzIpwo+QKSM25UU56wfI5D+8yrlBTlAiNPF1iE4cskKiAGVqyJ3djJpQbM8rZ6
	 /k/CqYXlN38LlKgRwIV6zZogbLOjRtnkWbveMEdP5t+W6469EaR5XbQepzGY41kF/v
	 7zb0WbRlJH42vIKriwV02zHmzy3zWa9P/7wLb/vHlLOmbQTXKhOQD9C9E9YjHaufaX
	 JsBu+N6M5daV7ChnFnjtzB/Zc3F09lI9JuQU2EhSKn3MrH7o0mdclSH6NnZJgAGqIK
	 8VlwIlr/ffnf6OSw6RYiuFWrjfePKFHSNir8Df0mU4wiNFQlEGqT+6FETNL6g/kjYU
	 acSek7WaGVWIA==
Received: from samy by end with local (Exim 4.100-RC3)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1x0MFV-0000000BI8W-2XD4;
	Sat, 29 Aug 2026 18:49:45 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: gregkh@linuxfoundation.org
Cc: Ajith P V <ajithpv.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	kirk@reisers.ca,
	w.d.hubbs@gmail.com,
	Samuel thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 1/2] accessibility: speakup: refactor deprecated strcpy
Date: Sat, 29 Aug 2026 18:49:44 +0200
Message-ID: <20260829164945.2691317-2-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829164945.2691317-1-samuel.thibault@ens-lyon.org>
References: <20260829164945.2691317-1-samuel.thibault@ens-lyon.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ajith P V <ajithpv.linux@gmail.com>

strcpy() is deprecated, use strscpy() instead.

As strcpy() performs no bounds checking on the destination buffer. This
could result in buffer overflow. The safe replacement is strscpy() [1][2].

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Link: https://github.com/KSPP/linux/issues/88 [2]

Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
Reviewed-by: Samuel thibault <samuel.thibault@ens-lyon.org>
---
 drivers/accessibility/speakup/varhandlers.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/accessibility/speakup/varhandlers.c b/drivers/accessibility/speakup/varhandlers.c
index 462f8d879053..c6d3b4cc1af8 100644
--- a/drivers/accessibility/speakup/varhandlers.c
+++ b/drivers/accessibility/speakup/varhandlers.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/ctype.h>
+#include <linux/string.h>
 #include "spk_types.h"
 #include "spk_priv.h"
 #include "speakup.h"
@@ -265,10 +266,10 @@ int spk_set_string_var(const char *page, struct st_var_header *var, int len)
 		if (!var->p_val)
 			var->p_val = var_data->u.s.default_val;
 		if (var->p_val != var_data->u.s.default_val)
-			strcpy((char *)var->p_val, var_data->u.s.default_val);
+			strscpy((char *)var->p_val, var_data->u.s.default_val, MAXVARLEN + 1);
 		return -ERESTART;
 	} else if (var->p_val) {
-		strcpy((char *)var->p_val, page);
+		strscpy((char *)var->p_val, page, MAXVARLEN + 1);
 	} else {
 		return -E2BIG;
 	}
-- 
2.47.3

