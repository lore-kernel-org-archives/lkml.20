Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B544EBAF7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452803; cv=none; b=pPZNDao+lQFxhg9eOXqrhojuyghj6wVE1ykRlfWKOkmg1ifWfjhOtWrRWBqTO+gNo76MrozUGaMtR29qPdHfsBF0gwuo56jqcObEVVyCBj7GbSXUx2m44cJCo3YliaMU/koPUshrY+agfsWeIbsyoTr1PrvUCdEeD6ak9sjT2q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452803; c=relaxed/simple;
	bh=DYUlMEbqUsURMwexmCD/xyIYznB1QWbXqfysKMihGio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C89uIFqjVo7qIIewsM06u4nwHdbPFcIOVgOyGEU6L5p/IFCWxlIjK54RigNl1muP6wG5S3S+OPwIdLdciNnWzHHvIeV0U+T1JQfaf0cRmUDf0n83glYCDLGlM+4jlznGCyX6IIgfCo7Mh2Z5fhyY8SFkh2MVHpiavp5Sdo4/fKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1eDp+c9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1eDp+c9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4839fa1517cso8037f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788452799; x=1789057599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ij1m4fx/1NIyn8kVtLRSbyCjXHfqmQiafcPU+9XENi0=;
        b=X1eDp+c9LpDb+C4jG83P/0woUIRxrOoJ9wSMOy+kTPzIJu8/cXVJ84N1znE1xOs1ks
         WSMuA+YFAkcGI+jI8LXj/L44QLwE2cM5kHygRL6nS2VQLqA6k4zftwT54E5PAVUoFitU
         YGAt5YNIoUuS6Rd9zQN2BYMzN9pw+yyTfLGjae7xEN/hPMQRjxCbn9kq6mhwLhClU6lX
         qZMW1FHf1SJvfi1ZZwuLWXGmckXWLs1btW359NYOWnt72zxudytk8YeAhrJrwUf2A9H4
         W5HDE1D1bSIynoYTj5ftph2jxpetrTbl3p8NmX+iT+HP25YxS6MCmoSXDVc/FVrQQnMs
         GMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788452799; x=1789057599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ij1m4fx/1NIyn8kVtLRSbyCjXHfqmQiafcPU+9XENi0=;
        b=XJuVhQxaMnxlR4pLL3kCUPk1J8r7Ls7ZkgJZTm8tHfV5tYdfl/ODND4EbLXRIgXpmb
         +8UPlikRl0Cth7/Idyb8egd6WFt6Ut6BI1ZZE+IrqHxbMCtTQG3rJVrk1tMIb3JZFOlp
         Xbjroj0RQR9ejzJqkfaqEvNfAxwDmXi/f7LrwesxMWIkfMqJJrPOojEJAPYdXQqtSPc+
         p6VZ1dIuXUr/kL+Wx7ZhRD84hxae4dqs/IzShNi7nGfeW2spaE0EiF1Cqajc6ZpibW42
         6zjtZz9Vv/kZ7PV0mg0vqMU//zpQA0H05/MacGbHbyw6St6wjtvHGVGEFgQVJyXhHuJ5
         g10Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyKeY2lbk9KMDyNLh1Y8EFdR1dheHbSARkrpO4pliTGGjW05fO7YVi64kIs1WV5hmGxng5JOdI3kY1t2c=@vger.kernel.org
X-Gm-Message-State: AFuF++m0WOuK0tBfo11NUzvLtVamL6WkXXrx5XK7g9Fdjw+np3dvBNWV
	zOE9k+au+qukeiMcoJgszKthzhLL/GaWXCIpSktq8PBPe2U0A8y08A8i
X-Gm-Gg: AYBFou0eOhOUs7Ghn9zd/g9nqHKQPcpdmd4Kn3DJ4XDb+MD5svA7W3Dk8+IB23PtKRx
	YMEw+0NXfXnF4jRXl8pALgvas8GGjDzn1HwnHoPqPvcEaSQ/a0itv2v8EyLar/6QI4UI1z9Sx7S
	lhDqYdZCyblI8uiZlpcwRcxV6ZycqTm3BWuB35a5JYq39txeu8RGT3TZgxJwqbXabaqLZb/Gdj5
	/QbF9jyY1m6Gjl6EVbmnz3DSuyUAv+vHZeEpeZ4jNjXXCWIKliAZpdXYF3j8NBPLjYaY+jo/Dmi
	dU/V1oNfUoduh4kMbfS9if+ZRuXKafqmk0/8fWHOUeBq2q4qyj4ztNqwOfb28M/9mh5vAq3q4/E
	WF5AeeSbCx0/skq2PMMf3ZhipropzkvMF4FIXAt65FLR67gIYRS45ID/gv5hsh/hPMKXfd+hDIX
	WuHf5mN81tz4sQbDdSqmkTR1LdelCxAmmh+iIrG9v2nczIukE3Ym2aOg==
X-Received: by 2002:a05:6000:41c7:b0:46d:ff8a:c8e6 with SMTP id ffacd0b85a97d-4858707c531mr165606f8f.1.1788452798868;
        Thu, 03 Sep 2026 09:26:38 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::6:124b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm14672574f8f.16.2026.09.03.09.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:26:38 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Thu, 03 Sep 2026 17:26:02 +0100
Subject: [PATCH net-next v4 3/7] netconsole: reject enabling a target with
 no remote IP address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-netcons_ipv6-v4-3-bdd183c844d3@gmail.com>
References: <20260903-netcons_ipv6-v4-0-bdd183c844d3@gmail.com>
In-Reply-To: <20260903-netcons_ipv6-v4-0-bdd183c844d3@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

The command-line path already requires a remote address, but if a user
creates a dynamic target and enables it without setting a remote
address, we currently try sending netconsole traffic to "0.0.0.0".

Refuse to enable a target if the remote address is unset.

Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 351754d53cf9..4af4f3039d4c 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -483,6 +483,11 @@ static int netcons_netpoll_setup(struct netconsole_target *nt)
 	bool ip_overwritten = false;
 	int err;
 
+	if (nt->remote_ip.family == AF_UNSPEC) {
+		np_err(np, "remote IP address not configured, aborting\n");
+		return -EDESTADDRREQ;
+	}
+
 	rtnl_lock();
 	if (np->dev_name[0])
 		ndev = __dev_get_by_name(net, np->dev_name);

-- 
2.55.0

