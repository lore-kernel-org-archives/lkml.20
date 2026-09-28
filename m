Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3243B413787
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610225; cv=none; b=laLTkos9xXLoI+8OTtkFSI8x4hLsOU+bB4/2dnMUk+4UHSSGTD9dreZNIP2l2QH1AnnRGCkgyPaWeOFvRY3zgITw1mascCT9GhZRdCaIvXm6zPB8oYUZmIrWCgPB8Fuk1qwnpMZhRiH7NaAstBVFE9q4/w46epdAyYhzSOLYn80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610225; c=relaxed/simple;
	bh=fdvGTm0XJB7apiFO4dy/nRHYvecWmvWH+2/zLv7ZxOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=re6NEvOqC68sc7zcm50mTx7MqZahu3DGPoYKKIAVSxBpia7gipaK233T0Bv1cThE3HVZtu210NuGMhwWGzWDRPZT7Q7MNqBZfGgomlgvdv4/DPHJ3xlYdJ4KJePwkk5IaMpREhyw674lMf1COoMjmC5P+dzG4mKZOgu/y+dX7aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com; spf=pass smtp.mailfrom=miget.com; dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b=AhFV3pww; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b="AhFV3pww"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dc50c6eccso197160466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1790610221; x=1791215021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwfP8o6zwIYW3W/+Z/SliTtN4CfWDbHolfBtqGrp/gU=;
        b=AhFV3pwwDg+GGPtVHiRfGae2tNoGPrEg+TfzBRVpAflE8Jsf+ulhdnZsP/jNI/B1uR
         6/8z4TfSbWK5UKgS/av4jBqo9AWNyBh3UzULugPD4PMXNZ55qAuumVgvQS55rfwLLZal
         E3bTSRMUv/6mfAEs9PzanxkBu3HFck+T9c9LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610221; x=1791215021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwfP8o6zwIYW3W/+Z/SliTtN4CfWDbHolfBtqGrp/gU=;
        b=vs95dYZwZub5BtmH0mobCMB8mT4fYhEr/Z5Bj50XM/lCkFnRo5Gh/iqOFRP1VYFNNR
         BUS8df5GJ7SPKw5qWp++YKYY9C+D2gAyr4C5hiKojdrVIV3ur7wnGpp+137niRIMYuon
         Olg3njeWf6vQRee5CGh1hNPtmIz1bo7I3t+v2/hEbtuRzx/fMaWSsvfsLr/O65JPK3Nw
         ALt4yv5GM6Rq6mrThV10hTb/nXavoF45ZabzTGzd5bVmRB8DnJPfE48BUCrtLVWWuP8O
         3jbGEmUp9FdPxNwLeMTSM14GTYbJbg7h/DNH4yeNmDpW03pGDHkOhy6pnl42Z14UPEVo
         i7ww==
X-Forwarded-Encrypted: i=1; AKwUvBzSda/chLkORz9KpJx18ytI/RcUppWjMnW95Wp34KAtHLD2wH6VcdfjEqbRpTEc45FdtvdI05+Q6lCYrBs=@vger.kernel.org
X-Gm-Message-State: AFuF++nlPDEhMuyCNePxl8kGdbkMkh0SIyIKZX+JQLMcn3ZG93a/3QlZ
	B5L3qe8kTONDjYj8y9JZZMblrXlSDX4Q/VLNWDVkP5wqwSCxAnUXi/0qt1/qcmsVlMMNHtfPP/M
	hearO/oWvqA==
X-Gm-Gg: AYBFou005IxbFgCW3HUqKWb6sCYdJllTiE5KVyjKVh5cCYEOIfY1ocn0za8lTpLJwBY
	wDo6p1bLzBoXM8ZlPN6I1rfi38IjBf1PFZoWragvylKMG5RwprFfkd2jwz/Vr9lj9GRgoRpwrB4
	AGNfwuObE5Qlkuy1/Fvx/D9md7iF8gF8rozdgGiaQdXOh7Vdx0qE9of923Nc4arVLzfdTXRpXJW
	SpKqr/Bo0axoHKnKRDKUS31ZcEcJ6VWN2GTQ7mxQsYxTe7k7Bmk1cpRgPJaHdcOSnx2fqw7X0uN
	b1YAobLhhx0uNUqB9uWybLc2iLpVsbiwuWwl268f8Si3jVKxCKhWLjxw9CqOUgc58KPwqLTUl7h
	9nsaATa+KRZioZSL/TfKY5rrlTEIXrayVtRRiweQWnQ4bcN16gzSvfDEa043U8ebZB3AVcYsbWu
	KyEl7s/JsRJWwKlgjisrm/heGiJBfLExVvIQvgIVgshrLdTPCitc/ilUCOt0xBImYVCzXo/g3M+
	IqXyI+QbdIOMcZbPB1I
X-Received: by 2002:a17:907:f497:b0:c25:8fdf:5d with SMTP id a640c23a62f3a-c2ac2395ae9mr1101349166b.13.1790610221319;
        Mon, 28 Sep 2026 08:43:41 -0700 (PDT)
Received: from xia (user-31-175-132-26.play-internet.pl. [31.175.132.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757857bsm490538766b.24.2026.09.28.08.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:43:40 -0700 (PDT)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH] platform/x86: bitland-mifs-wmi: Only check the function id of GET responses
Date: Mon, 28 Sep 2026 17:43:37 +0200
Message-ID: <20260928154337.154969-1-chris@miget.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 23cc56f6dea6 ("platform/x86: bitland-mifs-wmi: Detect failed
function calls") rejects every response whose function id does not
match the request.

The Xiaomi Book Pro 14 firmware (BIOS XMAPT4B0P0909) only fills in the
function id for GET operations. Its SET handlers clear the output buffer
and set only the return code, so a successful SystemPerMode SET returns

  00 80 00 00 ...

instead of 00 80 00 08. The new mode is applied, but the driver returns
-ENOMSG, so every platform profile change is reported as failed:

  Failed to write to acpi_platform_profile: Error writing
  '/sys/firmware/acpi/platform_profile': No message of desired type

SET callers pass no output buffer and do not use the response, so only
validate the echoed function id when the caller asks for the output.

Fixes: 23cc56f6dea6 ("platform/x86: bitland-mifs-wmi: Detect failed function calls")
Cc: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    This is the separate fix mentioned in "[PATCH] platform/x86:
    bitland-mifs-wmi: Add Xiaomi Book Pro 14 platform profile values".
    
    All SET handlers in this firmware's WMAA method behave the same way:
    only the GET handlers set the function id field. 23cc56f6dea6 is only in
    pdx86 for-next so far, so no stable Cc.
    
    Tested on the Xiaomi Book Pro 14 on AC with bitland-mifs-wmi from pdx86
    for-next plus this patch and the Xiaomi profile values patch, loaded on
    v7.3-rc5: every profile change through power-profiles-daemon succeeds,
    where before each one failed with -ENOMSG despite being applied.

 drivers/platform/x86/bitland-mifs-wmi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index dd1648b7de77..f4817b59dcac 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -189,11 +189,14 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 		return -EIO;
 	}
 
+	if (!output)
+		return 0;
+
+	/* Some firmware only echoes the function id for GET operations */
 	if (result->function != input->function)
 		return -ENOMSG;
 
-	if (output)
-		memcpy(output, result, sizeof(*output));
+	memcpy(output, result, sizeof(*output));
 
 	return 0;
 }

base-commit: fe5030c8cc7156223f48530e9b49aa87c0305bcd
-- 
2.55.0

