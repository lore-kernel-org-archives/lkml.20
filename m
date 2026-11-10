Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341188;
	b=dEHZ/Y2Fl6LiKMTV0OSnT6vvRaOx7ixusTsMI2XACqn7mr1UHXfVlI27tFSuomKUd1ji
	 Zd+fTgwwMDlJKSVBXHqJ+TjcZq+TRV4WUL3xY4ewoFe/HpXdvzMJYsb8naOuXYSR8pvhc
	 OCHMe65lH4nr6ksU8Y1h52e2NLxi2mg/dAmvn2hL/09w8ed8fdgVou+bGIimQG8UaneNv
	 97TCuUFU9Ixj/A6APdzhB1mwEiFnRBWXPJh/v7uRNLho2bnejUQHv5niJTltq2QumHpAi
	 mHYpsCKsZ8jpWa+2IoJCOBGRmz2PSjElqjFUtg4AW6/YZxltzohouBqw0c8YhvyjA+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341188;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=alD3fGtjQd9CCc7M7nbOuP3nu43HinJ6Imab9qhCwWk=;
	b=xOTWAsUgRcMDtPAUU5xTlHz4qy8T3C19IU3qgxWtvbgvy7XyZYAHJXi8YEUp9x4RB/jG
	 wTuXhfkkr+NDNmbEA3+YTmk2yPnG/1P03134Pan4fXKJFcYXQ0eRhnvNrVU73nmnDrhEP
	 +1U7oeWJhEaaeSQ7Xtl+r6p5sZ1kY4k5pt7idIlOrLaPyN+RWIageUSikg3DDHneqJfSE
	 SpldTh8j4wXr74F9aznKAKOVTDkXpOZzPYJ2xJ9evgbQkY2pRhiyYWsiPXRcNKvD9Tb08
	 ZaT/GRHHTwqkECStlITZLTdCFh6hXgKsyF4xVN5gMe0WrnL6rZ9DKcekRMDGRQyh7DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="H+BbA/2o";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4004606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4004606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=H+BbA/2o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=alD3
	fGtjQd9CCc7M7nbOuP3nu43HinJ6Imab9qhCwWk=; b=H+BbA/2o2lW/5M6/l8NT
	tW7m23UMVgUFK1pd62lc8xhVwor3DTtfyk4b1gtqwvkwJdUeyhzGUKAxU4bj74Qh
	YDB0ea/8aTh/r58NjJEib+8C76I/HX2NJArp22utwcj7zu65XZ2fMOD+FJtrF17x
	gTk+CJNH0Fe540MGbqpSn8m/48EsxeXglyn/YXRyIlUA/kS9rMsg41rQAvcaeJ/9
	7VgTMZPMaVbz0YnFhBd31TXcyKPmrGVSu48tn11a1B5dH5flCYCIHVXpAY+SNiG8
	GR8K2RKFr9VTcca7cxEOk+GYYXLKGYtaSns0L9QlWRImlnzFr44dlJejtiMK3rjI
	pA==
Received: (qmail 352277 invoked from network); 10 Nov 2026 21:06:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 21:06:24 +0100
X-UD-Smtp-Session: l3s3148p1@oH7qnPFfQNMujnsO
Date: Tue, 10 Nov 2026 21:06:21 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i2c: dev: clean up registration
Message-ID: <avN5PWgseDWJJq36@shikoro>
References: <20260827102043.673273-1-johan@kernel.org>
 <20260827102043.673273-4-johan@kernel.org>
 <avMFCwqx2X6pl4hP@shikoro>
 <avMRNeDGriRh6D1N@hovoldconsulting.com>
 <r7a57zw5h253lhdecxdoagdcok4lobodiouutxxq3t237imdhy@n4t46uvgvf22>
 <avMW-hz61zXUbQWV@hovoldconsulting.com>
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
In-Reply-To: <avMW-hz61zXUbQWV@hovoldconsulting.com>


> If Wolfram insists, I can revisit this, but I don't think it's needed.

Well, I can see both sides. One the one hand, it is a bit of an academic
excercise, on the other hand it is more "correct".

I favor the incremental approach. I won't force Johan to do something
which he thinks is superfluous. But if someone interested sends such an
incremental patch, I'd vote for inclusion. And with all the code
analysis out there, I think such a patch will come eventually.

That being said, it means I could then apply this series to my for-andi
branch and add the comment I requested here myself. But I will wait
until tomorrow to wait for further comments, if any.

