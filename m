Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926853;
	b=IJWn04+o05eL6uw/r0SKp+k9gTojda6k+SKrup6iO1c6iOYzYUuhry9mxf/ua9tDbyea
	 xqpe0d94pm07Beo2zj8y7C5QQHejBscqudz6nF/3+Q9F0JuaKOwKqqCBFKkr8D5dzQySL
	 gRDNleGPWVDI9CJ2C+Zk7v3+WemVbTR+/EtXpCAwI4/FsEwbpufNK1JeOe8YyZjppnc++
	 hJP0vjiFp+SdGMT4zKsLFezh4FZz0hbEIU9GBByMj/XMphnh7T0Iz2VVjurHdKYybS4HG
	 BAvga+fslqfhM5hA1+t/Vgy4i7Kd1B8NH8esxsv/H1LH6fiXCSvx951lqxoNhuukAnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926853;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	b=LICZyPHu7X4IVck7tcyldft9UHXz3o7M22EaJqgHIktyXFrJS9DcaWEAnJodVAn8tJcp
	 ABXAItKzV/R6BlU0WD6eo1J1opT+tEG6uyBif3JlnXvk4JRnHm24Mqb8SJV4wFVYdoXVw
	 bEfH1gVIJ4k4Iyx73Que/3onFU815YeY0oW9hXeSm29Edd2JaHFcnpNCawe9l0RfIk3DW
	 7gnWERz3YULru6quXJ3OQ47HMA9UerT1G5huyqwXbvHqugHiFy8dHnuajQpmpgjBOyzii
	 V+Gv7fCVH7AKWN9bNvteOQIyslX+st7dcyJQQinRsB+c00MvtYh9WEQ51D0JwlxEkjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DgvzNZLY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E951C606A31C;
	Tue, 17 Nov 2026 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DgvzNZLY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4084E1F000C5;
	Tue, 17 Nov 2026 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794926852;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DgvzNZLY7h4qe0jzCmlKFp82hv2gl2xZnkfWtmBjyfTUI7yKbRehoNvKKXtembW9x
	 PF9XEp63PJsrr8lJPHa7e7qGuTdGJhN/VEPKhZ4WEZu/v5jG1sFUkQUjKxmDsd8Vi8
	 m3b9171y439IkaCrCElJhzE+Yo2BdC5lcM2FXH8yQgs8CFB5V/R/sJfT48rSs1Q6ob
	 pZK4jkYHEX9PpK5G9D14oVcl03WKDpNsS3MxQZ9SpGW3iMKDSQ6ubYzxxA+ksI9kJS
	 xEv6HvglaBhfIik0bO7I/d9esp+GDvdil3HdXCy1GK3Qk/UqyJSSoheDdejm3XYjUM
	 egjJuk+MQ2yzQ==
From: netdev-bot+sinfo@kernel.org
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Boon Khai Ng <boon.khai.ng@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: 
 Re: [PATCH net 0/2] net: Keep MDIO resources until netdev removal completes
Date: Tue, 17 Nov 2026 14:47:31 +0000
Message-ID: <179492685179.3291.7664135046736995469@kernel.org>
In-Reply-To: <20261117-571e631490-net-0@mail.sdu.edu.cn>
References: <20261117-571e631490-net-0@mail.sdu.edu.cn>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
