Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951363;
	b=NpRjvYxyKRQIv0z8vxxsu5QahBrPvzlKbSnkFlDEewMMiKL8P5M8okfuo0eRqtvkbd06
	 a55h8GAHSRP93M+/4UZIwAwXRS+deuh6+ha4+jzVyhk1PJ6ikhl0uohSkXxxij0oP0HAr
	 NbcDM7SCDwmpwlUFxzY02rbTDw1z8aBGyWwA8C2egzPri0NLwYeLp2XH9jzyXnDogcE3X
	 7O5Bv21DwATkOuB/IV3AFt1X1yrdy5nuuwMca8lpakQurwbS1PIf4Svw0f7zsSQLgugPt
	 e71+U+mVpq+rjfCMGtkr8GPa4/nEac6t5R89H772HlrixAAwDDol+DBfDlmxZ3zUxUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uvWB+cWQ5tAH9q/mNwHxkCim2VtHEwZoSQ5glTQJ+xw=;
	b=yeHGH/JFwqitpqOvsHNSXdOfLMIX1o9qG9KZfSucOdjUUKdHxxnht2FVB/PV91LtpdD+
	 HfNGI1CSZmDNq4fuA4qDcNWZ6KQVyNwCkfvE9doW0cuPXjhaL2u+g1pQLE8lnEICkTXxX
	 vym1rj8k8p7QFjrT4ktai72vIPIVb+9u6ZGS8fZxB/5qxDhLy4udVMR/ysICBAPpPmE+Q
	 gGDNBAoj1bxkkF6hSWRSIU1P63QnnXgxukb0awJLQzviQT7D/6NZR9UN+M8LUp5by9SdZ
	 UV5DiPG0pv/WcCola2M4hQsD4hxqn5cSj8WKmBQoirmBKHLKAVK/8bxnKpkPedNk5oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GIkf9kAK;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B29606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B29606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GIkf9kAK
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso20392445e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951362; x=1793556162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvWB+cWQ5tAH9q/mNwHxkCim2VtHEwZoSQ5glTQJ+xw=;
        b=GIkf9kAKGm2WIoQZEexvqWpzEFiyxVpWcQAuI3yizHai3paX8FMUWCNjw55di2kcHn
         ZjPV3GRiHH/nM/w+5R47bfWoOBVWFfWg/I4U4PkCP9LohxuVNWrCoHDC3Wcb35/chDwv
         9W4Ijvtfa/sw/xt1EANuaFfZXzTWo2nrpyc9QHlWbuAIEiOyizPIqT5Mx0Qqyg/lXyn6
         y32FlV6Z221tY4FkiHXtnHHtY2a58mq/PYVR87oU8kg+AkbiWbt8HojPdS5hggv8WOD+
         fz3r8Z9040gzO45WC9tcOEcNo5Ack/73m3aS8Wc5hQtQEF8CJoX6447XoP04Ocvd+bBE
         MrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951362; x=1793556162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvWB+cWQ5tAH9q/mNwHxkCim2VtHEwZoSQ5glTQJ+xw=;
        b=Eagdb6iaZ6vK6g54wTUKbTx+GB4AupkDAa4uG9y6iloJDoHpuQ5JB2hDy/xNoWsAe0
         WxIjI+7E525Xse9Cpm5/QuIGGZ32FX8vAU6ss0245r3YFVl8T37UYfvw2FJv1GpxLNvb
         oIMS2ppQ1Yk++TCcH+7PqGztHA3DJA6pKhxoX12fmhiiaeo4tlw3BtDRwqDve0W70ZD0
         fYX7Zr/QDIdSfreavhVZtLKdawtD+k1a/80jbY7zfNIOhTx2Z5qqklDZxLaFguNzlOUv
         V2NCU04vegIJn6iBgm0eW/19wbF5xJAeCAQLdvSApND7eqfNK6h5tIKr6ZalTBdmIfbO
         L5iw==
X-Forwarded-Encrypted: i=1; AKwUvBzYCD54F3HnRzaA0034lQ9jocLDzwDV3h4WTazFUvuxcxyoIZo+MS0/xMiNc3I4XEBfndEDindOCCdWBdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPmaFxIfALMIq5hoCWlKlmeyoDvtrSdBB5iodn/OQZ6htVDtvh
	uw5QA5/twjmYXLuDBrQooHlpIKhC9HlXJ2yIfIjSC6laqexQNJS2mvrB
X-Gm-Gg: AYBFou2YyKnGQIg/oGPPGrmQF8CcCNdRXILZO12kRMj8cmq6MLf30bKlZnRpWkVH/iu
	ifFxLUYRQWL1+2lUaeDRZmkAJqs2VIgerLDSaXXhF3j6/dKRpYMx4jIQvyHlppeLWwVCEmHbuTL
	+3kLs3OP7rlUt/Cbsh4Eb/ZwZBIMILC3u0Vv4hWYeu10kPcIaEKa/16Ry4UZ3obOSnxLlyQKjjO
	Mqo77AWmbXT/C9eNtXpYpNN+IA83cP3qcBfSIrCy8wacEXVubsp44aeEHZ2Pdf5xSYP9QHG4rSW
	MP0YGKmuUGcOSFzy+Vz0Bo+gKkiXjCejFcX8ZrUuqLMFPQNf1iWxLzoxumJ8MXQfIB/oe0Uo7VE
	mf2W6vVKEWZNtnJSTxnzRPLGHN+Vj502MUm3mCFdAJUtl8de63G+I3/NXpMd+BjmZglCRRMSbod
	GpgfmAyTgMzQMIKE778YA6GbVnCNbHeWsvf3wJ1OjcvIX6GCmR9zJx2vqCuiX7zzyqIXJYnLEkk
	+OTDHTPKpx7kFm3xq+Qhzhi4btllTZuBOy6nAAB/n8cfYQQe7Q455ut4SHXE9BcrHamxsMgaL6l
	k1IaUvGuYQEbf4HyMnyj4GAWPIw6LhZdIlVUl0IGpAeqcR5wK/UiiPQvpNpH1hDqfVAWx1H/Re2
	MON4OApVwMqIVpZOsg2mGljC4EQxmyilhPWiVwhLLWYIJfpNrxGvLfBSbnMnk+WN8zus=
X-Received: by 2002:a05:600c:4e87:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4a35aca7643mr99183135e9.25.1792951361603;
        Sun, 25 Oct 2026 11:02:41 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:70b0:9267:4b0f:4193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm367961345e9.1.2026.10.25.11.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:02:41 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] of: overlay: fix device_node leak when attaching node to changeset fails
Date: Sun, 25 Oct 2026 20:02:37 +0200
Message-ID: <20261025180237.445403-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
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

In add_changeset_node(), when creating a new target child node via
__of_node_dup(), tchild is initialized with a reference count of 1. If
of_changeset_attach_node() subsequently fails, add_changeset_node()
returns the error without calling of_node_put(tchild), leaking the
allocated device_node.

Furthermore, because OF_OVERLAY is set on tchild before
of_changeset_attach_node() is called, calling of_node_put(tchild) when
tchild was never added to the changeset (and thus never had
OF_OVERLAY_FREE_CSET set by __of_changeset_entry_destroy()) would cause
of_node_release() to log a premature refcount zero error and skip
freeing the node.

Move of_node_set_flag(tchild, OF_OVERLAY) after
of_changeset_attach_node() succeeds and call of_node_put(tchild) on the
failure path, matching of_changeset_create_node().

Fixes: 7c528e457d53 ("of: overlay: add missing of_node_put() after add new node to changeset")
Fixes: 144552c78692 ("of: overlay: add tests to validate kfrees from overlay removal")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/of/overlay.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 08d535174..936d5d742 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -442,11 +442,13 @@ static int add_changeset_node(struct overlay_changeset *ovcs,
 		if (phandle && (size == 4))
 			tchild->phandle = be32_to_cpup(phandle);
 
-		of_node_set_flag(tchild, OF_OVERLAY);
-
 		ret = of_changeset_attach_node(&ovcs->cset, tchild);
-		if (ret)
+		if (ret) {
+			of_node_put(tchild);
 			return ret;
+		}
+
+		of_node_set_flag(tchild, OF_OVERLAY);
 
 		target_child.np = tchild;
 		target_child.in_livetree = false;
-- 
2.56.0

