Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704667;
	b=j1ciWtwWP3dHL9oR67Dxdifqk52Jw9/NgCLyXWqgJRvUq1YXKIjVo1x0bz8zlO9dnc2T
	 OG3lsuFbHyoVCdvuuB7eK5C/COV3u7PUv+7mjqWaGqdRz7lFKY+9+IGmnmXWaGbrvgxXC
	 zWxpOHZm1G7jxOgJWYR/tGVZFfSuEIlo9Ikn3i3jY+YQ4ypxiN3O6WQAWbPqzAIMGY1t5
	 lvQlrYE8nSiEUtO1oZdnLnqG9RifWRLC1N9xNdEkG4XQ2jZJ5dvQe9YflKhUIeqXfnDsW
	 GC3LV89AHeN40sJ3oqFP+L6Dl5ah7hbxjyIxdus6XJ0BDWu5jd8ElFIt8p8d8RpRk+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704667;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TKM19QPJ4Jj0dvfeqi6UnxgPl3NHO8xYpykL+RJDXAE=;
	b=nrcEaovQhxeG0ktD7xf5eIbMU4U+8noUb13TwHwIitQuW2cDRMn8jLLR9AhgbFnNMx7m
	 IcP6D1bB4cvxXOxqbSRfyARnOwLd9r4NsKOqGTL9w9rS4nLeG7hPEjskITzhDa4vcI2Hb
	 xaEglyYpF47BKXAMJsHr7BBI/IbtJ+PMYBBli1982VS9L2uT262/XlsCEHcNCSZzUOTQY
	 Hugljt9U0Tu8ikPeXUvgd8IebERRG1EcSZUsAAzNfdfU4/WTNV/VJZdD/Rp88SyTbvsc/
	 gBoDwZNbztQrb/chFsvdC1Elh7deNHKdRmV/uVEre415VQLfRSiXUWxDqbX5uubXNVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=P0EcXAcn;
	arc=none smtp.remote-ip=115.124.28.173
Received: from out28-173.mail.aliyun.com (out28-173.mail.aliyun.com [115.124.28.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E148606EEAA
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E148606EEAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=P0EcXAcn
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793704657; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=TKM19QPJ4Jj0dvfeqi6UnxgPl3NHO8xYpykL+RJDXAE=;
	b=P0EcXAcnISjh32z1T6WwP79693WDdqGD8D1sftsLOjAhhg+1DJazQb28cJPmUwelJpJEEX0bhWp1v9uWrGUi9bLJph88AvOWSVC+JHKOGRRK7YYrMJAnAP8O5Oqz5XE83khhl21GKnJq3RBYyvGOQEMRvzy8rq5SkvgPKP01HnA=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.2805699|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0110284-0.00355894-0.985413;FP=18282358029834381283|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033040092104;MF=zhugl3@xiaopeng.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.jvnrQTN_1793704654;
Received: from DESKTOP-UL5U09E.xiaopeng.local(mailfrom:zhugl3@xiaopeng.com fp:SMTPD_---.jvnrQTN_1793704654 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 19:17:36 +0800
From: Guanglei Zhu <zhugl3@xiaopeng.com>
To: mst@redhat.com
Cc: amit@kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liuc63@xiaopeng.com
Subject: Re: [PATCH] virtio: console: check the control packet size before parsing it
Date: Tue,  3 Nov 2026 19:17:34 +0800
Message-ID: <20261103111734.472283-1-zhugl3@xiaopeng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103043238-mutt-send-email-mst@kernel.org>
References: <20261103043238-mutt-send-email-mst@kernel.org>
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

You are right, the impact statement does not hold up: the reused
buffer still contains a previously valid control message, so a short
packet makes the driver parse stale - not attacker-controlled - data,
and that is not worth carrying an extra check for.  Please drop this
patch.

Sorry for the noise, and thanks for the review.
