Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489295;
	b=kJUtJas+VkVD2BCUQDqGweY/c+miM2MDKvMWiKfqEZhMW4xj+WxUNtk6ZxpmjKWiG9RC
	 KQ3s7W+UPDqzinqPUll3xK4ziMIMz+5gJfKpXGXs33XynvoaZMXf4MrT88nSzJyvPkah4
	 vY2VuvKaRD8TqbFLRBZwOUM3+vdBgxJPeDynMpoZbG4xth5+aXsZLHZqEPLcwke1l8wtc
	 99G+0ea2wu5xMTJKBV1EQQGK1VRitB/8w6Tn5kAhV9U5yqqM13uzNkg++lVqHij5VORpj
	 AK1X4sHlgs+nyCiWlDI5KAIK+0vkpfMIjayzrO8WhnMOXOLJZTFg5fP5LZASgb/+0vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pEd3z9MXCanS8Ka4a/h6F0U0CisvJlSwqV3A+qWLfjs=;
	b=ind8/AIgNsNVz5y11f9DclMcFtBen19MpHtxpvEE1jenBJXguyzSbuZsxoRWivspnI8G
	 pcCpMJzDs/9PR6JsZ8ixyHLEfbK0rS7ZUSkKV8EIdbNYVHIjwGZLFttHb8TZntz7jaDmE
	 NyFCMg2p/pwswISeJt+veCNUBx+ezemu1yjgOGO8pCY87ozI9ZKQ7IGHjqiaD1AxKD9LF
	 lXCvQqYiKNDm4hUGb7koRr3fR8cKCNDrYlhODKcZgKh0+2LL8sI9iapn/iGJHSTLfk8fW
	 J8T/WSsBvPR/wNN+PSY8wMfoIOeRx8DT0OInfraOAP8qhdTLZksC6EFGR1Php6COq3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3gTTP+H;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC651606A8A0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC651606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3gTTP+H
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so52082435e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489293; x=1795094093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pEd3z9MXCanS8Ka4a/h6F0U0CisvJlSwqV3A+qWLfjs=;
        b=I3gTTP+HL30VFjoRwtLs4qSDYh8dL9UGbx7RkEi0ruJsLpN2Xtze460v0FzRJMc4Oh
         OSa/0LvNqadDMZABhvgNeBLIx2okLKQTK6flYRhayFxQL5YxUs9aA5C8HVeLC2w4aKW7
         3WE+OXlxbGZjqgRyBLGladqfVFIeAINjG5QsYpo7Yj1dCmzDl/bTEQUnrUfuYr6wZm+a
         s4UQOfL2jQP02N5ieNuKgzbllJOD05d/DB5j5bcGFCOs+r1f2hlDYuszQngxN4PuS1vJ
         vFVpQJSgUwfJaYawHEzh2KI9Xe3pyu4zQ2/m4y20wVJVhxP4Jq8hgo+KW1/IGufAeEbU
         Od8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489293; x=1795094093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEd3z9MXCanS8Ka4a/h6F0U0CisvJlSwqV3A+qWLfjs=;
        b=YpcmrbMpuonT9ck+Ucua7pgdwkzv6fBnCfuPpryrvORlF+1ASo47jLqxmkq1pxyx/K
         Zw9Xys74YI87KYVNmGjbbwRTYSLeJT5+oBmPfUVK6vo6mRIePYXDY5poxFVzlaGdtlYK
         VZjN80rGCTHUxtenPpG9a9gwYp9RHTxhlHylUW8lhM15K+e3WVn123bLegGHqbXCX9m0
         fqC7enfTQOHP8lsjfiSJApc9qk5UodGTc1sqAFGgi8tD/6OCk+F++Ncv8wDf6bNB92y3
         URqrvByJUf4wldRtq4CJ+z4KjwN0dcq4LOM6s5eqF+m07DAVaHEGkfsNokATmoSl7HCN
         X/qg==
X-Forwarded-Encrypted: i=1; AL+hErGCNKJF8QXvrYy5yVVUs6Op31LlgwgkA7Jx4nRe4BTo80+ipCs7l9SBe/LrQ8qSpTK23nULfY9MMKfu1O0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uwm9Rwy0Qw7DcCrGC/XTDjZhZTTaUG8yEBZqNTluaOnKLrcgA
	94mxsKGCssEODf8yufh2H08UE8hMa1SvIfr+MJ8V2EM2Wqph4PiWKX7s
X-Gm-Gg: AYBFou07BQXiNxsX5gy8aEtf9OiJekoe8fpiaV2AG9JGV06pPs+2iJZTWJYX1Dq4Pq5
	Y64Bchd7BsvBtQGLhmmkXgZ3aEgGCPlmFe6p8BUE30ioUzQ8h28BHc67gXm7NvZ14Hjmp+vKSfE
	7hTDZlDEEOdue+mqj4xLUzbD6hovEdvLoBNlfuz0yFW2fcsjfpXJpqhxNXOD31nt+x2PHkioj7R
	xemySDjIPwsLk18AkY8936WQ25b09790+noM1IJjimNG3FAyZUf20UVxb7u/rfvPXTOg9xZadQJ
	/g95Q5jX0fgmTwqOyDiHLCUt/Nu9ZQmtSS9NP8/Zizy3bh433Sv+WfH5mqASxjKd3zz9MnOfl73
	hsSm9k7oBQJ0ACdwvWIjk1gl35FA9Unsi7NjL7wrjCe87XN7BwMlbtP/3sp1M0aTwoduNCCxD6V
	ewUsmpsEZ6HvbyCb1AKjQZ53pAsf4Gmj9BBOWp6DOkWR/cSWsoUHNjs1nXx0tq5Jkz+I0s7L8RT
	q2mFMpJBSi5061JE/iEeMxraIi1SplbP3yDEukj8zVcM9Hfr0w9InEROfbNfsrpEWK2VMm3ebKJ
	RzO0LjpZsxGahoQVudcffY1GbGOpXtk22tYunTC/EiqRBvowtYKQwBnHL/0T2H183LEv4NQLs34
	Ek1ypH997mw9DZDLDFT0vcc+OBsnFxojPcMQ5Rxj84UAiu1GMf4Rx
X-Received: by 2002:a05:600c:8b34:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4ba093775a9mr101916085e9.7.1794489293257;
        Thu, 12 Nov 2026 05:14:53 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4ba0951fe22sm146453225e9.3.2026.11.12.05.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:14:52 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH net-next 1/2] net: phy: use const char * const for phylink_an_mode_str
Date: Thu, 12 Nov 2026 14:13:56 +0100
Message-ID: <20261112131358.106442-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The local string array should use const char * const as reported by
checkpatch.pl. Use the correct type as to mute checkpatch warning.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e885da1c2831..bf1962e572f8 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -184,7 +184,7 @@ static int phylink_is_empty_linkmode(const unsigned long *linkmode)
 
 static const char *phylink_an_mode_str(unsigned int mode)
 {
-	static const char *modestr[] = {
+	static const char * const modestr[] = {
 		[MLO_AN_PHY] = "phy",
 		[MLO_AN_FIXED] = "fixed",
 		[MLO_AN_INBAND] = "inband",
-- 
2.55.0

