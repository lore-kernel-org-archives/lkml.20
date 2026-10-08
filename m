Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117D339A7EF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439386; cv=none; b=Ga2JuLQsHSRl4aF2HIyqeB3LTyP3hnRWMdCtZ/AHCyG5KIEAN8uQgLoAJNFJnm54b+4VfNABkl6Fz2RJ5qoIzsLKrVWq1XLhPg6wJfj2C5N2NtshIeVIw+CptiWXNnwzBDnaprpWE/8nt90SvKkjHZvp3LIiOR4/MNPsJtaE8FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439386; c=relaxed/simple;
	bh=fIRMhCIOyrVw9rK5CsCSRNLHttPMgUeKuQmICivAfvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N9qomlXzkh1y9XoZYL8i8A5FOC5HWXk6B1XRNDOVJrKI9eiotNNy0sLQQmrJ1GP+WNucrcMbDfLKmBfJFFvvVyIr7wo3hgFgBWUMs4t5iYcXuCj+3D+SshBl/SDNuJ+Tw7Qiy0WhkC3eygycU3JsXznHUeS8q/fTZfMuJz89MtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjCYWNN0; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjCYWNN0"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30b6dad2382so5954875eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439384; x=1792044184; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVxtblLyGNciWT4y5SJ0lTWFuCiEjX394rt+jaGOGh0=;
        b=PjCYWNN0irK30+YBKuZunkP2rBGIrY3MhHwpLTcT4ZzbnEe1EfQAXSncsq438/3s2O
         Kn/G53VYSG/gOAOygQ/2MJDCsnlDdauPUQOSuBrcB8KUWaN6ihIcAWei8ZoPLO5541TU
         5zEdK4WMi6ecJJIjZraBYcnQO1KNZE6E+Qg8Q38Imhv46ISXNuRnaTgZsL3uqAEvYqIH
         VKzDNXljXlFtpP+bNolJ4XZNyDD8TFcelnMBaBXwoaQRl89cPteXkoymb632tF73DptB
         Zlp2zkAyDZUUi8DazBwJa38DzHerUP3bHJkzonFq/8Ib/rcWJ7ulDJv/dhu9JeKu4Lri
         Upjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439384; x=1792044184;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVxtblLyGNciWT4y5SJ0lTWFuCiEjX394rt+jaGOGh0=;
        b=KiAYawrnZHDAzowFoBA1Z/JzFr/4xhexenNHmsGep4qCAkkBf2PdMbRaraxuAgkTa8
         Og5E4Dd3L8aSg3rJBvDFz5SfHIsKseepEtVfFQHx78catcf4jGSXCCeAYGWta0mXOiAo
         72Jcy2NstgsSMGRfWvEBIyjHbqqeo7PruyMpF/ho44n6yiNGN/ZQpFuuOT9uo4ndN30h
         3c6z7fuNfLEC7gjQs2gQew2iyiujXQf54qgZMAMvMRJXtuBegisyAWBDUiSoelJCCk2C
         DGTyxJgX9nnAx8FPgS9ewTSrkqW/mJaBdbR3y8xoL+v4fZn+CtWsBYf1Im8/EQvk85O7
         54vA==
X-Gm-Message-State: AFuF++mEKR/zeBYIrxWC0EAiBQuFPmo7GZ1zVA5wNOxdZE0/2gOGs6/u
	xrGbn0bSWJjjezps+Vn5pE5dLJCdfzsS15U3YQRY1xKMeLMkkb1K3nCM
X-Gm-Gg: AYBFou3iyBHyDbpjXOGvc/odyO9x4iyEIU+9I2vh64zaL7JjKDQvjCpNIPpqtnuK6aU
	P/0HtwOjM+v4VtuLwxisNWFW0sBoq8Y7+T8qN//9P4hrvntdV1PYv1O29w7GXrVq/6OcxHNq+4O
	fdfNT8kQzdLXX66li5b9Nb7n+te1uf8XJLwoet7XAao/MXZor6/q0zkQGJ2l6CFTqaPei/2eb0C
	VWttEiChzOU4TdV0iqMrqW7rL0hrnWrDGaY4B7Um3fNvWwphHpJlaBCQDVAX75WD8nh7/fx6ewD
	yIQWCE7ii3Gf57UrLAMjPtQiDcUxHJ2fh5BXhDb4OlPZxB1b6s9J6ZFwjr4TGTWsfeKBJErCmoF
	/T14K8KWPisxPhm58JY31pdWD37S/+NLOwRieqzMWSzPRnyPUBwSY+tE55oAqytXCIX0fQ8qtLX
	IVBhWjVnJSaNcpP7iEBBFVMM1+O7WKf4HnqTBQZv6BqP0kKfVNzfUm/opqbX8bvIQnVuXA8FSey
	mnnZl0t651c3o89HedGta/ozYQWvt1l8q7c2glUSw==
X-Received: by 2002:a05:7300:ac94:b0:343:4a95:f120 with SMTP id 5a478bee46e88-3515dddaea8mr6197394eec.25.1791439383599;
        Wed, 07 Oct 2026 23:03:03 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3002:e11e:c053:ebcb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb67e5sm12906403eec.4.2026.10.07.23.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:03:03 -0700 (PDT)
Date: Wed, 7 Oct 2026 23:03:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] Input: cyapa - drop redundant input->dev.parent assignment
Message-ID: <ascx_F_LzRalepyi@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

devm_input_allocate_device() already initializes input->dev.parent to
the supplied parent device, so the explicit assignment in
cyapa_create_input_dev() is redundant. Remove it.

Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/cyapa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
index 159cae446824..936ca4b08550 100644
--- a/drivers/input/mouse/cyapa.c
+++ b/drivers/input/mouse/cyapa.c
@@ -453,7 +453,6 @@ static int cyapa_create_input_dev(struct cyapa *cyapa)
 	input->id.bustype = BUS_I2C;
 	input->id.version = 1;
 	input->id.product = 0;  /* Means any product in eventcomm. */
-	input->dev.parent = &cyapa->client->dev;
 
 	input->open = cyapa_open;
 	input->close = cyapa_close;
-- 
2.56.0.385.gd3acb90ef8-goog


-- 
Dmitry
