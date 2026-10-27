Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112980;
	b=A8e0EM01qatqRtnMVSb8DJiwDyuHewk0TKxgbTgeOBx2pfeGivxFHJhWY6svPuUpJtXE
	 srBm1MsWrB3lcaEbwBQ7COTetpRXYrFhqnh2u6mRRlVEEm83VPNhwmgFUwyOgo35gzJHE
	 JnAWkMDIaJ3TVWqvPGbJmpIDv2k0I4EiCGgE7sfHgGkDrSIyzAzpAjwwiHer/iFzeYHso
	 jotZnTbeda7O+eM/mW9zNBnrCf+Yx1C+s8HGyuRlkLp9XgrC4SkYPzmI/sKjf3DAuW8LP
	 g6k0Ecb8DKnsjUyKLm0nPcd2GlfKkz7dkdToSXawfMannovU0+mc3dGFzGzm9zSDInQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Obe+0XIIsqY3BnVbbgH1QXLQqnb9dul7kNk0NHZTe1I=;
	b=ty0SAPe3aSlPU3BZvXEkHJZemUclldlbOpi8CCUjXbTjmuzo4pUyfJDyq1kV/qbXmJFi
	 O+/4yBvgjEg3pNIou5aIn7kIdyHeqtRA1Td9rtMPFUiBpNFzB++D6XSN4ObV0ToxcsG7I
	 r8KbQBakq4d+4a6IF64AxJJefeKVlohQmwB1o7K4TEB/0nP07cgRqv3AVTa5lU8AzYDA1
	 U6dzn+ElW/hkYLUysynawLPdhQodukqe5wdL7wg3a1LpXliRAf2g+HhdSGnjD+LVmSSrR
	 8yJuU0JtqAUV/NsxN+RmJhbFvlArrIbRfeANzXNiysMqLIuQfDdmu9XbUG5I8GzBwTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WO4ptmNr;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0964606A331
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0964606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WO4ptmNr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso32836305e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793112978; x=1793717778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Obe+0XIIsqY3BnVbbgH1QXLQqnb9dul7kNk0NHZTe1I=;
        b=WO4ptmNru5vqKIA3nkv48kjnNCPquLjM6qF3RFGK9moJBPs/dW8iO1V/XRVfv64zZo
         m0buZkR358oiOUkEAxZRXF0eGVFC6h4YyOEDs1vhVShXmghO6ozUOqTC7fEtdiq3OfET
         Q9hJHB9aTOqSBRKkc8Lii+cFq2LlRaJE/OW2oRHwptK49SHDpamEYgnsNGnZWTah6e/p
         wbm3OeCqRYRMVpRAlUCu7LqxhdNqcdvQK+Z/hWEH+mXJDaPFBdwhBHCXHpCfMW8xFYjC
         Azq4I45YR1dwo3qhipFN6ZoIzoikL/t84JEOSGKliocG4VeFnw3KDpbRNzZCsH9+kyk+
         LRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112978; x=1793717778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Obe+0XIIsqY3BnVbbgH1QXLQqnb9dul7kNk0NHZTe1I=;
        b=Tl8itPrqZT6miA5Gaz7fgMzwzx2XaJ92bDERX47QkZPcVjkdFtOmf+Xx8q+iVTNC26
         tNanB5dhB0qrPobctgo/THCF0FXxL9VIWDiDwMUdlZ3p/kIr9c46u/ADcm/0I17K9cHM
         ij4fPzfBGl4CeDyeMz0Wl0pTIs8MkbRKU09ZCyPLV9Yzjb7PHUN+zId5asFZNzocmOy3
         SP0TDsU2mT7avM01Fb2x/H6H/r7yfhcK98eKiuEN+cPIa/PAc6uUSnRp0WmlwrlWhmue
         3mN5wpX7duJ7WPthbTjbruS6OfPjiPramLB7oFbdKoTNOMVJQZ9fTqqZo0q4VoK8RqOj
         oB8g==
X-Forwarded-Encrypted: i=1; AKwUvBxfHtRSY2IcfhnwY84Ds8Wk4yxCRnKVnsMLgq/d9ak/oyn6s8o87WM2D/VVevoUZh95hy2y6KyfXsaNfXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4OwBmonJw2e9Xx8HjlZfgKKf0iFqEc1zMVas353dizNSr2qfd
	pQoG4ayeex0eodFUXgp82JZfYXs0OYCYRosT6P+ng9TFFqpjyRG4/DQqGjwMhuXScCo=
X-Gm-Gg: AYBFou0zdhfDe9YSvB+Sblx+4qCKRyzbkMJOAxJPeqI1BVGGlQ0oxAUDvw8w1LHQqSJ
	KNpZ5KVuWE6ps6mVm/ZScTGBmDWmRYVm4rmVB9UCR8DEUb2BYjR331g0dCWQCKyQn9VWL95YFHH
	2gDFhkrBrPetinq1Iw/ufbD1r1mc0A3Ie6wr5rDXlPUnSVD62b2a9Se/YtJzIHPZx1gdB9S7AuD
	/UgcxJdNbcgSHIDujSrexaxhU+W4PuKQyky+Oze35rdd437cVzeLxYNf3F3s9JXIaNdMUznLLYP
	DN20b5KcTRr7xo8XrRykVrkQoFA7RKxkUYDIOV/eqeUFlw4waTGert62PwgJ1hxthHa1v4QZ5eV
	JW+8eQAdi+BLuw7BWqbjSlrkESgz8JZD377vyMZIvaIB9/9ksH3KAFlTnPosV37JTi4qzduemEb
	5/lLU4fcvr1xb+88nmi1t17DmusL3l4JX+q9VVRHiLhgRKnaVSblZjM7ku/2Lk+LNKvdDueDo67
	tZmOnxdPIA2YcDNdfHTdGQF7JpydyQBznjnu0C5SuVLzJJLGBVdvvmfWTI=
X-Received: by 2002:a05:600c:a03:b0:4a1:d992:9476 with SMTP id 5b1f17b1804b1-4a35ac9f30dmr202425775e9.23.1793112978097;
        Tue, 27 Oct 2026 07:56:18 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm273188835e9.2.2026.10.27.07.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:56:17 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 27 Oct 2026 14:55:49 +0000
Subject: [PATCH 3/9] coresight: etm4x: Fix truncation of nr_ext_inp
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-james-cs-sashiko-easy-fixes-1-v1-3-db43c4668644@linaro.org>
References: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
In-Reply-To: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

TRCIDR5.NUMEXTIN is a 9 bit field but it's stored in a u8, so values of
256 or more are truncated. Make nr_ext_inp a u16.

Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-b3468d48-ff08-49c9-9ed8-fb6af6979e1e
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 5417280cdb27..8628dd4e15db 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -874,7 +874,7 @@ struct etmv4_caps {
 	u8	nr_pe_cmp;
 	u8	nr_addr_cmp;
 	u8	nr_cntr;
-	u8	nr_ext_inp;
+	u16	nr_ext_inp;
 	u8	numcidc;
 	u8	numextinsel;
 	u8	numvmidc;

-- 
2.43.0

