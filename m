Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749644;
	b=PTsOhGSW6XezGca89CmyCBPmaz2pjHubi/xwqXAbHoC6BmfeERqUbqAExLMq4zQ3JDeo
	 FwEcqQQPbgvtzps0X/R3ZGmQOtjZ5Dk7g+bsk0upqtY6knyF0TDeeB+Ye9HV7PIJfEnKL
	 CZ16kpuJyip9sQREl1JbJWmtRbGrhx69XCU4fumsynDfgzZLS9aoY0MoXXpdxznajo4ng
	 YopGYhpHnOIPZuzUnG2E/MsAq7Hhgx61rzcgHhj3Wzr9C5J6Vnztn/wEv/QzW5dQLfCQ7
	 BGSD6SG8o4qPeIaeIDAzf9kiRU0cT7tcuFg6gs+T0ASjZkykhlCSWNqOqKY1fXv0ftA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749644;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=1bytFfLq5CGOzx0IILJ9a2zDeD4jxyW+w7M6grr9Vbo=;
	b=uC7lXGCo4Lj/IWLpud7WVUKIstosmjXtXoJO2/SP3kkA/rAe+bfXAOX74m1kQgFMzunW
	 /wkEhAE6hZGG0InPbDoVTcFBJmK7cHAN9wHMSatkTfLgS8E9ps/YNrJ3cSe2hfuEmL7FP
	 YJter1Ut32dwIcV6SczvHfcspqd/ztq5mMbDepxjpMFRirSLSQgjpHKqLgLlDWQKQzIvK
	 saRtlMNboyf1C2e3dFjkhaAibWmVnjqmBSyPFWJ+7IybU7Wv1KW0A2Nv2NBgcZaBuoxoT
	 EMF2Ke2L3zGOjpUhiaH4hzHUnuPbjpPgOyGViEDbIllfsomvAqzGRg9CbUzVWtD3m+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ivjNaf1K;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1675606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1675606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ivjNaf1K
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id SMj6xLYnTVK9USaMsxqFdv; Sun, 15 Nov 2026 13:34:03 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SaMsxT4xkxmi7SaMsxdR2p; Sun, 15 Nov 2026 13:34:02 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6af9b4ca
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=9rJA89_LAy90xbHUIIMA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1bytFfLq5CGOzx0IILJ9a2zDeD4jxyW+w7M6grr9Vbo=; b=ivjNaf1KxWWujcDDlIw1IFhw9q
	c12fT6PRPNN6AWQO+OWFIOvQ4HLG2eyaiucc2sDJ641rQOsat9Q4b70Lt30wpM1u0tOLxdZIbT64U
	0lQN21M6dDNLhdH/cjMbElnRXncvL0GW0MkIGdBBzKs5qpN9LiJYZ0O4t82rPd5mZV6J1cRt9wJ0Y
	duGCdY92TN3XBAV2SQsTgucq/X/0NxymSuU7quU+RwdSaJQJonmB8gYi/L+vux8hycEb5p4cd3YB8
	edA7u0AMaTCUn2HbsDh6XJSJFLs/6KK39L7dRmuuUleop5OLDQJFl52yFVuYyhoCWOb4Q/VwN5u4m
	WJaOCFwQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52946 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSaMr-000000011FV-4AWY;
	Sun, 15 Nov 2026 19:04:02 +0530
Date: Sun, 15 Nov 2026 05:34:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Niloy Meharchandani <niloymeharchandani@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/xdp710) Use dev_err_probe()
Message-ID: <908a05e8-a1f7-41c2-82e3-a6713d89f93c@roeck-us.net>
References: <20261115022053.32321-1-niloymeharchandani@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115022053.32321-1-niloymeharchandani@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSaMr-000000011FV-4AWY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52946
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHloFteOuCYfQlVt1yZTyAvjPsRX2/XCXLdAYj+DWK5xvL4YTOgqbPk8vBgHxMXIrrxbrAYwsrCj3EBA1yzwq694B5RqQurfy1la260Er3xGe6jgvafv
 gnWaBn0k9O+ML8pXgACoffLxzXfB0vCpWPsVXN0tDprg/pcWspzSmxHTYRfl+PPslYZaOGhVCvIdhcV9bYTTCScdVXPEBMHG10itTRoFDitYF7mxf4u+usyY

On Sat, Nov 14, 2026 at 06:20:53PM -0800, Niloy Meharchandani wrote:
> Use dev_err_probe() in xdp710_probe() instead of dev_err() followed by
> returning the error. This simplifies the error paths and prints the error
> code in symbolic form.
> 
> No functional change intended. Compile-tested only.
> 
> Signed-off-by: Niloy Meharchandani <niloymeharchandani@gmail.com>

Applied.

Thanks,
Guenter
