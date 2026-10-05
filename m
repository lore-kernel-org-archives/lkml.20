Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC6930F7EA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 04:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791175122; cv=none; b=CZirSwVR4ZS/qHAdQzkXSRe8oEKr5FRc3ELvu8yyYCrbAUKrysQJI5nMGgjJ5KpI08bMi0v1mnH1KtKdd9L95u/ZYit9mYUkzJPZPOkzwDiJtDyPssBVgO+/2RUuoVRZPWm+fqtDw8W07S/aq4RxiSb0i1ltawLek29LGJD7Ajw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791175122; c=relaxed/simple;
	bh=nf2VEgIA5V8IZnfrS95/iUAfy7BDBD8Wra2bFqecV04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tudnGZE5GmrcQctAPvLrhTBLmQXvHq3ulLQeopZ4pXuVoqwGQYJ32PsthFIKoUX1qPgBSWb4omHHp+HdXhtj1wDBjsu345D0DBDenPIAlvxkxXh5p5BBXQojV7XKHtmKXS8xzcEW347Dc11bTNHEdSwkik+KNSD7KnGCTWFY5lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaE8jOtu; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaE8jOtu"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bffc8105eso1677461eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 21:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791175117; x=1791779917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3RnpCbUlx5vRacAcPCSy9Sv4WlyTpLU86dq8MXP9H0=;
        b=gaE8jOtuCGegXLBMhd1ZwBC3fROPD4NUTa//m1FawlArPwMSJoMmAxqNjYfkZLduyv
         A0I0UrrklyRVApEiMXJPhgUDFt1Df0beMkl9Dy5U9c6obI3LCJDVs1iBVrV/Gnr6OyLm
         TiWRtmkJ5J6B6uQXKiGnxNB3EAtvyrJqj0j3JKR1T4aNwBcpv2r0ZPfagMcD9SvFgpZ4
         JR8Jd7rMSj17sMv1Nsf2taWWHTa1SE7qgz8bHXwq3/ssDtAHX7trnbHUmn/IIPgWVpqs
         Q16NEdBR8KAyCExKI6960xzlObKZPUzwu2HZuXry5sewJ8BMCSYtgN6WOi+vOabQlBiP
         NQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791175117; x=1791779917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m3RnpCbUlx5vRacAcPCSy9Sv4WlyTpLU86dq8MXP9H0=;
        b=cVppMJ/JZqKY4VDlxH9g74nkzI0IrNvKobtbU/CEgg1POxL1VrCHr0Tyzk5g6I6quw
         P6FG7pgMW1yzM9PuB2+kcS4kHtzbQRuLVkC2sQv/aBclKhRFQS3EQSrZPbstPtZFOUCq
         POJhldjh1xvWt4uoaXqgHWKRUqgVJxIfrgg3qAGnKjflICfZq5wsLiCo19znRJ7mYADC
         rEvrzllC/dVE52hVv2gFxxP/pgQuA2aL/UGc9/VbGpl/jEk41NejBU2Rf6mLd6HachtO
         2nQQ6aBCPq4kS9RDPm3r2gYT/l19jEfDXKT1PjE1Gz6cKbdZt63aV0tOe7Vd3eJ1MXQY
         2FuA==
X-Forwarded-Encrypted: i=1; AKwUvBxOtiedsnmJHuvJT2CmBJ7iMVAfEvNWaVpb8JiyYng2HuRSAnIpSrYeqKKpIS2XqTywrc2vdXP+V7onunY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqKhMxa9k2ZZKON+zPsNzW7uUh5TfF91EsImJcYHuJEFTX260Y
	cd+bII3Zk4mcm34ljJqCyzpidfkBj96q1wDWShXBsOTot0z/ljo3lBAx
X-Gm-Gg: AYBFou2BVS/DU0fd1EGwVB4cG6mVtHPj+flECek3tDFl66lkEu/+4nncOTRxoBXqIDe
	ERNmSw06GkGs4fGan68hId3l0PChjRDb/sphF5ofh3FFlw7GtUMoWQ4DBGxFlSjLwCw1hHFPo2f
	C3LhqTA6uVdRqylsMN0+NbS+4IZR0eJ8bwdoAQfksjZryXjKAjpKL5qWkvzY4nGmrfwwl0BEtVu
	ATaBdc76bU4lB5dp1L8ZlmIAa3azI/gEEJE55p+EqcKHTIixXpLo2rj01zz7HqOgShQfPeLe0Jf
	zux7nLiUU86sN0i/KB8aNALDi5QIS83VoZxPFzi+kpC9l05qFg4jpgDRMQVHC2dJ/Q5YswI0tl3
	I6KCZIwJ6dkb7EWcJHFKpk2kAoX1qT2XR5dZHAbdl2sFOOPOa7xWEym43fiMknuenYR9jnjxqdV
	+JQRYCrT0sZY6UbRJAKtvQV/ixgXaWKsuVHxAI8uvM16HU4odL1LSriLXS0UThvEPqzGsP4RvrN
	aAN/ms=
X-Received: by 2002:a05:693c:41c7:20b0:351:11aa:5d5b with SMTP id 5a478bee46e88-35111aa6037mr8207069eec.19.1791175117045;
        Sun, 04 Oct 2026 21:38:37 -0700 (PDT)
Received: from vscode-11-19.w453y.xyz ([59.164.88.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127136b8esm9518581eec.6.2026.10.04.21.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:38:36 -0700 (PDT)
From: Abdul Wasey <w453y.me@gmail.com>
To: netdev@vger.kernel.org
Cc: razor@blackwall.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	horatiu.vultur@microchip.com,
	bridge@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/3] net: bridge: cfm: send an empty CFM nest when a bridge has no MEPs
Date: Mon,  5 Oct 2026 04:38:21 +0000
Message-ID: <20261005043822.3106580-3-w453y.me@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005043822.3106580-1-w453y.me@gmail.com>
References: <20261005043822.3106580-1-w453y.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

br_fill_ifinfo() leaves IFLA_BRIDGE_CFM out when the bridge has no
MEPs. For a dump that is fine, but a notification sent after the last
MEP is deleted then looks like any other RTM_NEWLINK for the bridge,
and a listener can't tell that the CFM config is now empty.

Put an empty IFLA_BRIDGE_CFM nest in the message instead when CFM is
asked for and the bridge has no MEPs. Ports still get none, as before.

Signed-off-by: Abdul Wasey <w453y.me@gmail.com>
---
 net/bridge/br_netlink.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/bridge/br_netlink.c b/net/bridge/br_netlink.c
index 5160e801d..68ec4529f 100644
--- a/net/bridge/br_netlink.c
+++ b/net/bridge/br_netlink.c
@@ -603,7 +603,10 @@ static int br_fill_ifinfo(struct sk_buff *skb,
 		struct nlattr *cfm_nest = NULL;
 		int err;
 
-		if (!br_cfm_created(br) || port)
+		/* A bridge with no MEPs gets an empty IFLA_BRIDGE_CFM, so a
+		 * listener can tell that the last MEP is gone.
+		 */
+		if (!IS_ENABLED(CONFIG_BRIDGE_CFM) || port)
 			goto done;
 
 		cfm_nest = nla_nest_start(skb, IFLA_BRIDGE_CFM);
-- 
2.53.0

