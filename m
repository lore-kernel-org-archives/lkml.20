Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F8F346E51
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790423782; cv=none; b=ZDQmH+FnHXP0DWaJlGnpLxIyoAEXQPAnYm4ikP1S8m77x3xAhsjgAaSFklWl61MPCq9/1Egjf0UdwX/XD2Bu0oWwCKWzxsAi5T70ZcO3EAoBwoRjBD18v/RY3SFlPDtM0RHnkmn+Ob5fn4dNy5iFMtd/1C75T8uSlF25YArucZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790423782; c=relaxed/simple;
	bh=p/aA3q7dGb6rMTLZdywmMWZ771K7JU7OE4990Soo7h0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wgk8CmrsW5NwdaDeuOu/Nbf4jO8+AGJvDnQodBScQRdxC46NXGGM2EqkUxbaOPNHqn0v3GDVysngdYxJVfsVDb9Lo5gHSuM1130Rs0BJIJKQDzxHKBd8HlQtkRoqv5JBT8RJ1QBXB7pzjV3Q9AZqZdKkJ7s9xJJJZK7gSJMgFoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJWzWTzQ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJWzWTzQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so12376485e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790423778; x=1791028578; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjEi4VNevqX9s+v8m/m8iSJ8qE2I19ueR5QHAcHq+jU=;
        b=oJWzWTzQ2gPAeaTAsCG5w0gE4CpuXHvanr2QgZN0jZJp0YcvSvpjsjRnJ9PTNCC5KJ
         q5+EaLF1uwlp31qL8DBWo91zLPzvWX563cljEcndPTdYjnHX7aXBuuA4JLGBxPmKkUOz
         MhNhf6mVwI/pfom+5Kkd37Cb1XUX0mhnWsyGiCuF5zoNggm4tdnP0iars7ydDhO2x361
         59fzap7GHxgeX9IhxN0gDZOKhQL7JytsirH/XX7vB7waJ/fTvXCnfC64QVpsiSLS+HMp
         3YTiQwg6OlBs8fYxTXBcm+42pOaHLrikLw8klvrONI7CTLf+3WAMJiE1HwauHWaFiUJo
         ESwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790423778; x=1791028578;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjEi4VNevqX9s+v8m/m8iSJ8qE2I19ueR5QHAcHq+jU=;
        b=MYvdXIVwcR2Ajro+mK+JQnLCZBEmCXHPIJD4auVJwwbOrQOM7PVgz7GHgEbH9K/ZOr
         YF3MT1I4lrjflCFS0H5uWGQNzqpbvl0Y2bpzQSwRRZvHcrb/BX53L0MUG9kfCU4Acx2y
         sZx/6mhmR6PQNHbzDIsVIEvPZFtUIjPtkymG+6ah9lJjnxu1SeXHXdq7GvcVzLaGBlnx
         Ian+9XMn4mIugMb4oAtakRPLGD4q7o9Q8sx7ZySTTBlefBCERRujCthCUIi/t0FFIud1
         pTsYYI6W8mvI6Zho85zLr7DDCGiaWOov5zHySuAk4tD5LiEJUlR5zXti8TuthxdjW3Ww
         PCzA==
X-Forwarded-Encrypted: i=1; AKwUvBx2aOgK2bI8b7oKRF7Ts1YKv32qNH6gpDhVKVyRgrATQP1/zI3FlMztnOMiXg3NHkK8k6lKyQiBqjVToas=@vger.kernel.org
X-Gm-Message-State: AFuF++kvwZewqU/56LHqPmdaD2xTgg2NfVoSlFnFBno+sQZxnCCq7DgU
	BjGUk3+4dqV+ia230424WUf3KVooQA1tYJCiOK24jCzIPPVniimgVmey
X-Gm-Gg: AYBFou0yM3OLR2dl7iUMuXZHif0868wpQqMmy/XYJAabRcA1EfTUuJpmwiRH3X/v2Fq
	WrLsM2yGe0y4Uws0prFFoGCVSIMIGBzO/3uxrY8gtufBEkBDAMXRVec1ZBkCR4LcM+hrV9z3bJs
	VPMrBOTFXxBRA6oXAEL11i5V1Su5kg97zYoKWCvqVcGsslAKG6qoX5Z+cywSKXm/fBoC8Wjq9KI
	mkC72vnQuQ9pe2Vn36bcwdXqae9LRxC9bQAG7kL9I6Up1mCb4pHkhS4ofh9cM4JMNuaSvaS51rn
	uXSlKsOlaMVRsY2/5kctrtb2ghBTrd+lNm4d6WoHvP8OYwARiUPpzjz9nSTUwcuJCariwnhGh0M
	so/0Sxpwun3EMbKEmbzcnM4fo8caRflyRRRqGNp+JG8uBxjUvdeQON2xt66YdjVNoEXnahHocG7
	lVm4rycQCgwzrrFCZSZMrmqT55/I3dndVfRSCij26jXzdCEak/0zAU050S+TkrmwlIkI20bY/FV
	4q4Nw==
X-Received: by 2002:a05:600c:8b33:b0:49f:f9fa:fcfe with SMTP id 5b1f17b1804b1-49ff9fafdccmr28010155e9.13.1790423778140;
        Sat, 26 Sep 2026 04:56:18 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fedec53c4sm171071455e9.4.2026.09.26.04.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:56:17 -0700 (PDT)
Date: Sat, 26 Sep 2026 14:56:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: enetc: document enetc_msg_vsi_send() return values
Message-ID: <09f24cefc214455305543a0528ceae6349c77419.1790357822.git.error27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Smatch combines the return values together and wants all the callers
to handle the positive values so it leads to static checker warnings.
Add a comment explaining the return values.

Generally functions which return non-standard values should have a
comment.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/net/ethernet/freescale/enetc/enetc_vf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index ee9567998c7c..f70b6d4290f2 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -48,6 +48,10 @@ static void enetc_msg_dma_free(struct device *dev, struct enetc_msg_swbd *msg)
 	}
 }
 
+/*
+ * Returns: 0 on success, a negative errno on failure, or the positive IP
+ * minor revision for an ENETC_MSG_GET_IP_MN request.
+ */
 static int enetc_msg_vsi_send(struct enetc_si *si, struct enetc_msg_swbd *msg)
 {
 	struct device *dev = &si->pdev->dev;
-- 
2.53.0

