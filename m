Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7555A3CD8B5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437335; cv=none; b=RrJ/zRnY8YF/8pK/AFMUXPt7N6MYxErfpcMT/6ANK5u6Lk6+E0Dn4se2R6xkrFG/Ba//dMQuVVZtvwcHSYyJVCA6XHbWtB1uU5a9ElxHMe64HgOTqE1WLKxORSVlZMarjYdQa95qCEB+H1rNOx7VFvYZHPJa/8PPletIV5C1ZYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437335; c=relaxed/simple;
	bh=H4sOniYLWo6+KB8DHXp68YHJ7qte+sqivFhogKC0E20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQFJdcfLI5xJpS+x8gWEthX1U7PLybWG/qBhsUB3V2p8N3D3S2ahQPtm6fTdvz1H75tTibANGTyJiFo6WZi7sU5ZRBlshymaserbZQqrOl/TZy34DkAeo+t0kQKMbAqQzOQEHdVbi6jvtk8VBzWwmSPbyy2qpDOn/C0JuXVIA2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUY6W7KI; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUY6W7KI"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-912333a94fdso8119516d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437333; x=1790042133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiIvJCNExljMSljYlzye2b1G5pTXXWKqhzAs8LgW/vk=;
        b=JUY6W7KIpVOulb7t/xW9eD9JTVGNgk7pntYkjaevhtf8+GXqvGNAmyxwls8kr1BE0s
         n2jReTbFh7bphN5veGmmBK7LyvF7tq1mh40oJWnvCb7ZPBfInp6CjN46t7Xkj5kawIPY
         PiqsHYjCb/HbxkpZB+bnKhi81kyyF5UfeHB+6Yg01pIYft0ur9oZAIvjDZ30Ws0w+yUE
         6o89HcdzZY9HtnEW9jG+XT6ivcTL7J+q0cIQaBAlgKRRkrESsEtbScy4cvsUuDKX5rXG
         7NZu5uySQ9YIigwDyafrh3H9a+vQEmvxU1fRzr6xdU/FeAd3fRaCdpXqTIiZ6u0cDtEU
         vUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437333; x=1790042133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AiIvJCNExljMSljYlzye2b1G5pTXXWKqhzAs8LgW/vk=;
        b=0TX/gOj5ZAbpIN5a52KIYJYBSxWM7zk9pun9WqZOBmkumwZpCMAIPlY0VZdSwB6GVV
         ztjzR1KpJn/kyeZ2hRF0nzTApHy8XsJi1i7TpPs+EUsS282yulsYEJ9E1Wt/xRh7+89J
         rNIpfhgfJAgHwsQrzeS1MtPQfXTMhPeE8hFusBDdeLwQBULSgITGF14CSbStyE8+DCcr
         N6rGsuS+o+RdLuqoUXhNkmlYK7S5kam3KDdPd2gQKsHOn+Mc/tWTRN+D15Vjmpw+DZNu
         8w47niNxxu07REvZWmy0A7MZItUWCJsn/Rzt+yIfnC9ZaPFbMp15OJrQpY/mcGMqev8i
         NXbw==
X-Forwarded-Encrypted: i=1; AKwUvBw23wJ4m+YDOTvbuHF+uB6KARHZYV3IJzfXkPzJdsRl4uqvvXlpt+ra/U9IeGu52t5sxw1p9iiperWOC7A=@vger.kernel.org
X-Gm-Message-State: AFuF++ke9d9wLGTUDu9rK5cSfrgrAnzvAsIFX0ee01Znn0bG4256L6lT
	Xie40y9J2T0EDox5AJJxJR7AHSIHrkRmeOSvSOprhzJ6R/bE48SZPCo=
X-Gm-Gg: AYBFou0Y03ISA2O20FI9n8wa83W2be0GNHwjxWwzLRn1G63axwYyY9z/WpUYCJxH8Wi
	Mltfm7e1whheN5xB7u7Y4H222fUd3GfwBZ73N5B1yFeRl9BW3sWntCEOG9mGUCfAs0H9m2suTBq
	qIDuyNNQAwr16UplSWkjdqoVvmr4leMiaRmUAUOc6Gg4+fTxw284Oh80JlKxIvfdAmVK7i4qxk3
	/CvyyNZJ81Kz1MyRiglAx9s8kwRiv5hKVNR//GYA3pU+omZzSfkvKBj2qx52jtucvFXWF0nBXNg
	UVqQt+qaHK61rzz8SZWgYiguzlG8zjebtG13sZm/6Te0G8fUolCD1R4D4Z+YnFGtLlsNKaMJ4W3
	iXb1wSD1F3Kiv8DCc+0D4FNJSAqevLrc/PjUaHw2i1/+PKliPRL2gXVxKUh4v1mjfgxGdXmdoGo
	EX+8KagGQXFgDE+j0Rx4UTlVLUr7p4Z5xyUg9svTj3Sdby0PzDltia5/jAcBIYgiDRdD7yc1eTX
	vVsKYK91dH1NxIn9VwVUXGYGxt8otTSc73O+1jfYuRLd6qd9EBzpu0+mvn/VYAK9TwO5Cl7/ggO
	IINZCfvDem+qE3IBw1JU1t3y3IlcayYnXrJ86D8jrZGnu5Fzy5tQcH8Vd9r5CsKfL9iTKw==
X-Received: by 2002:a05:622a:2285:b0:530:d491:d168 with SMTP id d75a77b69052e-5310d03093cmr74722151cf.34.1789437333195;
        Mon, 14 Sep 2026 18:55:33 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f5ebc79sm109264546d6.48.2026.09.14.18.55.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:55:27 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] EDAC/e752x: Use managed PCI device enablement
Date: Mon, 14 Sep 2026 21:55:17 -0400
Message-ID: <20260915015519.83833-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915015519.83833-1-mhun512@gmail.com>
References: <20260915015519.83833-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

e752x_init_one() enables the PCI device without balancing the enable
reference on probe failure or removal. Use pcim_enable_device() so the
PCI device is disabled after failed probing and after driver removal.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 806c35f5057a ("[PATCH] EDAC: drivers for AMD 76x and Intel E750x, E752x")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/edac/e752x_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/e752x_edac.c b/drivers/edac/e752x_edac.c
--- a/drivers/edac/e752x_edac.c
+++ b/drivers/edac/e752x_edac.c
@@ -1387,7 +1387,7 @@ static int e752x_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	edac_dbg(0, "\n");
 
 	/* wake up and enable device */
-	if (pci_enable_device(pdev) < 0)
+	if (pcim_enable_device(pdev) < 0)
 		return -EIO;
 
 	return e752x_probe1(pdev, ent->driver_data);
