Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021853;
	b=Ft/8qTSO0X/yRP7kmwI9Fm1FdhkpPoxv8hT483Nj+biyrFnHQ1lOJT2KTcNhh0BdcZNQ
	 LhiR9zflOX9JUEt4SRwP1X6m0u5bKqDoyNuJaGVlqrQx0EmVd6YpAJ9JbfIGZMcg30iBy
	 xHJeW+wbHL4KcqloQz/ndhkGfqUzK0qI3ej4dAepY/suXvIFS0L5CQSfs59eKC0D3PWo+
	 DAJZfRGrQXpEScYnpgFgI4FUUJz9tszO3r3KVKifRFEwhMPccw8pGTMoD6AZec4oA9Iqz
	 EUUh1wERzGevJlrrplDs2hjZY5KcOueUAF5cCHYyRtcQrYAtEJweph6EWQ3HUiko5Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nBY1mmCwepedk2iyITEBFuHFNNd7QJHmRZc1xMAKEUQ=;
	b=gMI0I1ypWsdpMUnho3d2KxF0SmvV8VqA+4u+3ZYsaC5r+Q/do2BjkjC7Lq1ddfKf9ROy
	 tn/cxRvn8DBM0TuSLWg2Ne6ODsL4rdC51gb9565NvQB3lfnvCrT4ZaGJxdw0GmtboZIv0
	 qcp7IFKwXBL5huWMC+4zyZZC+rFwNWjf1cIjcZfxZBvx/yj2shc7273G/Ujd1/SqKrrCt
	 7V3AwvhouoXRu/hS/5m6ABAu65N7Z7IsLXbZP3XUiGg8+imVmiKQi3T/W6Ug9coTfcUWz
	 /rS0/LkzhPlfO51vBf8HZVdoWrugQSAYTich6I9avFpzXB4eIfrvjqz1QWRqpR1fbxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AzhIqonQ;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498B160A262B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 498B160A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AzhIqonQ
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e946155442so25341085ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793021853; x=1793626653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBY1mmCwepedk2iyITEBFuHFNNd7QJHmRZc1xMAKEUQ=;
        b=AzhIqonQL5Uz86TyKnTmu0FB0HM0uW4V7dOpLLwi3iM0SwtC3kaTVxq9rRL0fzec+k
         sFY23eSRJ8JAptFl6fqJ1+tUdlhkmVpoMshX8RebnNCU89+6QKFtets1ud0IVrI9udwJ
         keGhbdwFhwdA4pxUvLW3b/rhSFp9Kdz9bcdbJOHM2DljAycRkyX2lUoSHTq1T3cWdvoW
         fxtlNizoqrdaUxCpvKdLpnrxa+weP6Hd6q1i1J+uendBjvcUrNvh0lqexZIWc7j16QDB
         xOi3EIS3YA1mhNPDw5e9EsuJ+JRlTni2Zbv7N0/1xSnWiDSfEvG/ZjcW2uMbIt5PNnti
         7fRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021853; x=1793626653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nBY1mmCwepedk2iyITEBFuHFNNd7QJHmRZc1xMAKEUQ=;
        b=Gr2t4TWZtmgLWpkjlgjgTyLkjvYZWeUC0V2Drh/ptXMK81GZu8HlEiP4uZZUMBHptm
         5ZSjbRpp2QKgJh5R/FgDwQGJ45wFXuHidbNUuWF4CviC2z9Gb2F5HwbNHaWCA58JvpNL
         Ij7Z1eVcCBF8O4rWZTM392YpRd5qtnb0lZaXN84arYdgmJDFfR/Ys+8ROlJVHIGoDAL8
         7H+Uup59ax7ZQeFrItm+DzXXbwyqb3NLr1GFLL7zc2HrDY3DfVYjxg8K/yJdgbvK8eaf
         9ebumfefuDWWAdtadVoww5949TT6vPdkDrC1V6E+yZe8qHwoQ57TlSK4c7tMVBXZHknE
         QQzw==
X-Forwarded-Encrypted: i=1; AKwUvBxw/Bo2Z+VezNv60QmVGpw3jFiGYf6rRoHiihgNGmaHm/wgkle7KritoFr763TVuxLomj81ZG58InlrlzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgdy8seYYz1yLRW1Hysmej5izdSlk6pZaJe/LZgd7xouKhNWGg
	5eVzLjL+J+yi19dL1NlDDZEVvI7hRtVYiL2/ouLRxaZ4ilfG8fJHCZTAAhPwCa0TiOE=
X-Gm-Gg: AYBFou3UYGXg0j/6urS6OyKWf3iULdZOt0jqzmOuFfmE0KhW0apZAXmBu+OkGSBQDZH
	2dl1lTtYMTpLpcDtATpRSMqHBMiJ1+ePSOW6SeohMP6IvQPTTfNqq+/a53VQDqZa5kxtPIL+1VE
	ryq5hAnrH1hYWM3cUEHeQFVZSC7Efs9fQiDAovyRAgZuZGdwFEIhkY0T2r+Rmn05NohsnPHaMhQ
	Z2tc70UB4LtJwDgXSyQS9S3CeZQc7sQryGCHTMlk8fTybX9rPjD/FzNTTCEEatEhbzrDJnSJOsi
	qypWUld9q4wk7s0dKGcx9pn0otunK/sJYzOVvvUaAXLhPtLfQIp3p1WG2JpjdFaUChR/yMrQXX1
	NogVw7AmgQz8ETkzdfEHAjnaVMZyuIfxhE9+lLDGgZeVX0tAFqa845KY2SxvXbYj3qDhF061AQh
	bBL5WfvQmbB3FnN7hrEV0QpSgNUz13Kj/Ovad8qSy5NcOar7ZY7lzecObnZkYlQwkbxJ5n+PnKK
	ZIyvkahcMptMD0IAg8yUq7cecDpi7UAaf97FxfFrQtSnnOSwTWB3zqqkAHXUO9W+nb3xGjzDzWY
	vlsxta1RWKfFCSbSo1YvqKH8gO8V8DTiP3IHN/m0od5sl6QfM+5zDVgeaHA=
X-Received: by 2002:a17:903:2c0e:b0:2e2:c995:b00a with SMTP id d9443c01a7336-2ea9c83f0acmr63903965ad.48.1793021852505;
        Mon, 26 Oct 2026 06:37:32 -0700 (PDT)
Received: from yafangs-Air ([240e:46d:2600:484d:51ee:4f49:b5a8:aabd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a5cf0sm17447055ad.52.2026.10.26.06.37.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 06:37:31 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v13 4/9] livepatch: Call klp_init_patch_early() earlier
Date: Mon, 26 Oct 2026 21:36:46 +0800
Message-ID: <20261026133651.40061-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261026133651.40061-1-laoar.shao@gmail.com>
References: <20261026133651.40061-1-laoar.shao@gmail.com>
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

Invoke klp_init_patch_early() during early initialization to avoid
mixing for_each_() and for_each_*_static() variants later in the code.

No functional change. This prepares the code for an upcoming patch.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Song Liu <song@kernel.org>
Acked-by: Miroslav Benes <mbenes@suse.cz>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/livepatch/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 9d25685..7240e72 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -1155,13 +1155,6 @@ int klp_enable_patch(struct klp_patch *patch)
 
 	mutex_lock(&klp_mutex);
 
-	if (!klp_is_patch_compatible(patch)) {
-		pr_err("Livepatch patch (%s) is not compatible with the already installed livepatches.\n",
-			patch->mod->name);
-		mutex_unlock(&klp_mutex);
-		return -EINVAL;
-	}
-
 	if (!try_module_get(patch->mod)) {
 		mutex_unlock(&klp_mutex);
 		return -ENODEV;
@@ -1169,6 +1162,13 @@ int klp_enable_patch(struct klp_patch *patch)
 
 	klp_init_patch_early(patch);
 
+	if (!klp_is_patch_compatible(patch)) {
+		pr_err("Livepatch patch (%s) is not compatible with the already installed livepatches.\n",
+		       patch->mod->name);
+		ret = -EINVAL;
+		goto err;
+	}
+
 	ret = klp_init_patch(patch);
 	if (ret)
 		goto err;
-- 
1.8.3.1

