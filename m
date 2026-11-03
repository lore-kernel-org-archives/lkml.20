Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695695;
	b=rJX0PCTsOwR6Roo5nmSBzRUrxCvupMgf8oprHtYJVKErSELQkAOofD2YNYy08wLIXzV2
	 gMoeLLL3SMglbcYDtyMnQGmNrW6PJ6MGquo+MIEx96+1gJ7iVwEgFQuDLabEnQym+aDVz
	 zAyNCMmkv0V1rh97pKc7Yuf9DdY98NRqmhLGDhqufm/PROUIzfuJlQhMdboAXwbEL1tc8
	 bEy9Bc+4YJJwqAKwVIY3Czm6oxAKeJVn7h5lFIIyHLAzJK2b49RP3YiWqFf35oNTdZKxK
	 l3RdZ42YKNdFUk3snojpxbMZwJ/bnhKCKtpkdmjdmd8hyr6uyxqmyYQ2TnxUdPIXbWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aoUFhuYQcJ6QU5ydKv9+uxtt5LR3lX/aX8ZyHdDkimw=;
	b=NlCw2uEJOvEK+G8KKRvmO7/tDWH56jTzJyleJ8EDjEDazYxATl9l4IVwChZ2QLi/4cBf
	 T4XHW4znA4KuKegEitBgrchfGkUgw7dE1L6+WoaVE+fh41axPs+ftGNJsm0kfQldhR+TK
	 VMPJwp52DClTwyK5JI+BGb4EjWiLD+YiS94X0P8OIQw31SJ5LuURzI/jqSWdS+eNrfo5W
	 RMuCihTF7auGVL9gsu9r8C6NfDOnsz4e+ZOv86io8my7pqL0I0GEnGMCvjiLpEShWXrV/
	 msV12WpMMkB4BzTkC6NQ4jmiqbLb/zKLHieqTdA3X2XDzlYNQXxWxhHORFSYG1T9v1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hO/AVRre";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D51606A941
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27D51606A941
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hO/AVRre
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso2591174a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695694; x=1794300494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aoUFhuYQcJ6QU5ydKv9+uxtt5LR3lX/aX8ZyHdDkimw=;
        b=hO/AVRreSkmJNBbroRdWHY4CAWf0ZWUnXmQc6xO8pLv7yTkJPUDSATEN2Vu7yB/rrC
         70UQ9rzBfKJSocbJyhTIThAtk4yPC/N3mvPHjgsgpf66Q2OdkYSMK5odKfaDBXRfwZUe
         EiglXPDb+CjITwD/ZNNCx9yxO5MjUafCW5ve8/RwPKGYEgNSuTQ7UfDO9d8Ws/rd66uL
         50cgWH40R/q15E9TrAASX7Q0AY2K/iGUDxcfff5XGObQUPasfWEtv5/CDGnYE/iEQNul
         jl9E4FcuKBuZ0oYqFsWBrd/B9LiJYSlcw03dby2kr9QGyhKgi8RTdEKkaj/9qSVvV6JP
         uq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695694; x=1794300494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aoUFhuYQcJ6QU5ydKv9+uxtt5LR3lX/aX8ZyHdDkimw=;
        b=LdH2OxaybvuF6o9hJdDQa0QJiGmsuibrhd0/3CR78OQp5HslhBMoyQJoqpNXLHHLiQ
         XeNyh2iEOqQlEi9K2DEh0k9NH1ZAbl93toj6BWoxhOhJxy9w6v+3QiGSqf2CZpYiJvgu
         gP+1w+Qpc0VCp6Zzk9+zECRPxBj+yR2stmUDuU8+S+7srveivZeVwd/04hbswCq6C/Ax
         x0BfeGS968rQ55ZJwUo0sSnHDKdVXirmVU6pGvt3axZ51oopVftW5HtwNY4CcJvtMvJL
         SgAvo8IwHWZuMUiWahacuh4hHpPmLM8YghuuDBf1FTwqSHbEZDWs7Y9ixahpf6nK3s5S
         nY0A==
X-Forwarded-Encrypted: i=1; AKwUvByjxtVifZPjQ1gNHIDHBdlGSXzg7KwYFCMTPO+CUT3MzlwP9v6h5dBgQ7gb4vZT8olXMU3VRe9OSmOMItk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JCIFETqjwr8h3iyRtvikxXBeZmc9VMfv1yYwgjqm48slqFPH0
	JpbSI724GqE0Wn4pKodGj06+XNSRaxvnxXUiCz9P+iOL7e7PgRoL2WE/OV6JzQ==
X-Gm-Gg: AYBFou3rPAXdCeHqRMDScgH92c9mkopJF6x36P6EtwDIAC2lsEcIwEFFhobFfDPTKPC
	G1YiKmTxsOOTkWwmVkFUn+uyA+So5oQskQ4g/beM6x3jz1U96ft5Fzh0THrrM/xc5/N7UDXc/oS
	b99pdHvTzRsp0bPkN0HbjU1HsWv9MdSTMkllEr5qfVVF31fLPVnVjGaVU+UPzSKupQEOyyDTZwK
	NgzqX7R9VdqyajNOO+HeFgCpOLbDf1C6KlLTOIc86gO9iid/wthugCc2hJBwAfkPWLq2T33eop0
	aJF8cUTpjHhImJ4iuUwVDKq/uSeeh56gvFeCSYVvvOq9kYnynw3dM+RBRoYL24Vfl/YUBx6IOoz
	rWewHT7nioYwDq+Q5U9eUCE8hhbpcTPK5P8vFjq/M/Bo+pte4c45DWQFdU4YYDTZF9s2oIvmZbl
	JKYWySMxf2O1CxTrX2VQd/ptpuPyvg8qsTPhbH1M+wnPY8Jm+5JiACx3mcyS1qghr9PeizDVRCq
	l5sRN8XoK1b6lJHy39SPkstHj8hNAgKiNzNCwvTShjVuKRksmoc6090akEdOTyiH3hm4FJjj+wT
	Ww0NPWPiTrXFMW8KsB4m4Mu9tRmqJWJl2XzSk3tbcUQtlsAZ
X-Received: by 2002:a17:90b:3c0b:b0:3ab:9c73:130 with SMTP id 98e67ed59e1d1-3ae89764119mr10317018a91.33.1793695694619;
        Tue, 03 Nov 2026 00:48:14 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae880a46f1sm8608222a91.3.2026.11.03.00.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:48:14 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: Re: [PATCH] iommu: Guard iommu_group_first_dev() against an empty device list
Date: Tue,  3 Nov 2026 16:48:05 +0800
Message-Id: <20261103084805.2465010-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261026143758.GA1674867@ziepe.ca>
References: <20261026143758.GA1674867@ziepe.ca>
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

Hi Jason,

On Mon, Oct 26, 2026 at 11:37:58AM -0300, Jason Gunthorpe wrote:
> Are any of these even possible to be called with an empty group? How?
>
> The giant wall of text at the top failed to explain how this could
> ever even happen.

You are right to push on this. After re-auditing the call paths on
7.3, I could not demonstrate a reachable path that calls these helpers
with an empty group. I was wrong to present this as a real bug without
a demonstrated trigger. Please consider the patch withdrawn. Sorry for
the noise, and thanks for the review.

Best regards,
Li Ximo
