Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C0655408E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924341; cv=none; b=p46y/iYnea4oYpLOrOJ5vTvOiT5T3JzEw8OfcyHgXg59uEP6kDvgO8aI9z6A9yM8jjZ+uftUSjTZGG92a0iLAusZF85JGTOUP8aQVVeroC9jiAtfqJBo4CIewZ6EKC/ikEN0NRf/NiWmN0G1RL/dB7cqK2d+tvECZFUVvJIyCi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924341; c=relaxed/simple;
	bh=cMwBAastac/SwLSfCXNFutcItb00suFmuq/i2VUWIL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bc6rO93IbDy4EKJKhrDpUYjs3d5BpVYDqTaDp7eySL14CN3g4rYIgxcX3THB0xSheH8B+LBOK4jQbGwjz9Bkcd4jjM2kIFNbL7FhxX74qDpxh5gaV+P4FDijNOgWReGQeOeyhGA0ajoHfFb96ibcdWYmZ+64WznaQVu5jqhJtd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=C1/u7xcD; arc=none smtp.client-ip=209.85.217.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="C1/u7xcD"
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-7cb3388613fso2109665137.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924338; x=1792529138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o401XOuolgRzvhquCe9eAwBmzW/eK7Qzlg72iAjj6OE=;
        b=z+SCNwlWieda/MmGMbSQf487nt8hOMAGfTCF/camRelg9uUamORrTZK6fCtkgL7kGu
         BZ0EDzQ8s75QCnxs8y4ft0T/wJtyVz5rjzC9EOniPTN8RbfhX15by9EYB5K9eW23CPNn
         dxzUozlpe8Y7jP05mWsLZxFtfXwqxFdXwwF+XZCkTldPMieiu4HQTtCM4N8aIHed0SWX
         6yMU4hFbZU3v4sqDokqopEJ3/E9jYRBKokUBhg+fZzLTSEA58bV9Fek118gC9DgvpnIu
         urPD/RWII4lL+oCTtfJLkMbaFCK4/pS+DJZ+dCvoAdbuEOkwk6FxaO++mWFfMzY1CNQS
         rDfg==
X-Forwarded-Encrypted: i=1; AKwUvBwncyWle2iO5eNduxlkAPrhAwMAuBE7jFQrkIEqSj5w3cYKQqooHA5vWKrEhdT4Irq67fL0IIYlkX5ebAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIUgIZcKwTPJAIgZ7RkFAk1j3b9TV22dP4yaQaBXEnfy49f7cn
	5I3xiLwc9LhTLlS4GtsKFf9W5Gsv3iCgT3VG9Tfo5Vo7YPfKGB1AHp7VGuBIkKuPrEACz6H7Bfo
	2600lPHwLQm8eMDlv72tnJ1awjrb+4TEt2FAMaykcT6cJxmDfiP7qTVt5YxEG3FAl/a3T9SN4Oj
	L1mlBsWdf4kevLOMWrtgxJuNVEuvb6hpzthyNm0NXEE4vOVHlWjqTTJqoGKqhBJFX2b+e2RfnEH
	Gw13hp/bi9661CoWcd4DJ4h
X-Gm-Gg: AYBFou0pvTsW/HH7Ie1sVnaI4nUm8Tn/I3v0nxypawyHnaSVe4yfS28qyDo5cBcajvM
	o9SC1dakdJHO7abuDjhdOTs+UXvCoZUp5L0p6bYG9wYx1x8dlLR3DN7wfbis9t5+f7FBgifWn6w
	pypPkBg0TLsG5BHm7QeRLI1J2xFyxqbae33E8ITbJucFDtTKWN+isQh++B4YqD4sUZSvHHZV6Vy
	FRAxhNqlwcU289cTEw+4wUCwSRtBWtuHLRRorXYvIQh0IAqMPOtA97yW0gqhPK2Au7TIVUtDRDj
	K7CgedEjPakkII7LSL+EX4Ta61R+9MfS53NsewSkUMakP+iHCzfPUPsTRZTA4NgqgTyJPcqljIc
	0uNq2/juXpzg6CBSc817mgbNsU/PwjX6mFw42zsXFN5a/Z5TpupbHhNX5f+wSzUZMlHhM5wzgXy
	ElJwewU9yPYg47iOlq6WpJbB6Wwi8C5Haa42/mj7TDqPM=
X-Received: by 2002:a05:6102:508e:b0:7c3:6caf:bdb8 with SMTP id ada2fe7eead31-7cb373134camr4023479137.20.1791924338061;
        Tue, 13 Oct 2026 13:45:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7cb354a3d7esm148489137.21.2026.10.13.13.45.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:45:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338cfe567eso72160861cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791924337; x=1792529137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o401XOuolgRzvhquCe9eAwBmzW/eK7Qzlg72iAjj6OE=;
        b=C1/u7xcD4n9uyfVINVa31DnBXW2ahdIzLgMYhxh2YKT633kw03pMPxU1T2AWXkWOHo
         UExTFur5croN5fMs9jn8UuRmKm1TLRhd0daIzSeYyCyy1oKSKZatw7pUj22/RTGJyJhN
         QaF5X8wZopmyTnKkNlJenoNLaLkySNYtGEoJs=
X-Forwarded-Encrypted: i=1; AKwUvBwo6n1VBDevplwdPAgFBK4lLR1hPyErVoqTtsLc3YiXAJf4DEAxlj9pbLfgkmgm5ZaxLAyrk9FiIzYtg5A=@vger.kernel.org
X-Received: by 2002:ac8:5f8e:0:b0:51c:fc4:a144 with SMTP id d75a77b69052e-5359f46d56bmr233646281cf.4.1791924336722;
        Tue, 13 Oct 2026 13:45:36 -0700 (PDT)
X-Received: by 2002:ac8:5f8e:0:b0:51c:fc4:a144 with SMTP id d75a77b69052e-5359f46d56bmr233645831cf.4.1791924336165;
        Tue, 13 Oct 2026 13:45:36 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535f4eee7bcsm15879231cf.30.2026.10.13.13.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:45:35 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Justin Chen <justin.chen@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Zak Kemble <zakkemble@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 RESEND 4/6] net: bcmasp: fix OF node reference leak for phy_dn
Date: Tue, 13 Oct 2026 13:44:37 -0700
Message-Id: <20261013204439.3494046-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013204439.3494046-1-florian.fainelli@broadcom.com>
References: <20261013204439.3494046-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

In bcmasp_interface_create(), intf->phy_dn is obtained via
of_parse_phandle() or assigned ndev_dn. of_parse_phandle() returns a
node reference with its refcount incremented, but of_node_put() was
never called on intf->phy_dn in bcmasp_interface_destroy() or the
error unwind path in bcmasp_interface_create().

Acquire a reference on ndev_dn for the fixed-link case as well so that
intf->phy_dn consistently holds a reference, and release it with
of_node_put() on teardown and error.

Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
Assisted-by: LLM
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Reviewed-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
index d679c796c8c2..693e8cdfe960 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
@@ -1298,7 +1298,7 @@ struct bcmasp_intf *bcmasp_interface_create(struct bcmasp_priv *priv,
 				 ndev_dn->name);
 			goto err_free_netdev;
 		}
-		intf->phy_dn = ndev_dn;
+		intf->phy_dn = of_node_get(ndev_dn);
 	}
 
 	/* Map resource */
@@ -1338,6 +1338,7 @@ struct bcmasp_intf *bcmasp_interface_create(struct bcmasp_priv *priv,
 err_deregister_fixed_link:
 	if (of_phy_is_fixed_link(ndev_dn))
 		of_phy_deregister_fixed_link(ndev_dn);
+	of_node_put(intf->phy_dn);
 err_free_netdev:
 	free_netdev(ndev);
 err:
@@ -1350,6 +1351,7 @@ void bcmasp_interface_destroy(struct bcmasp_intf *intf)
 		unregister_netdev(intf->ndev);
 	if (of_phy_is_fixed_link(intf->ndev_dn))
 		of_phy_deregister_fixed_link(intf->ndev_dn);
+	of_node_put(intf->phy_dn);
 	free_netdev(intf->ndev);
 }
 
-- 
2.34.1

