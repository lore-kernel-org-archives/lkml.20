Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931068;
	b=VbAglL+sEy8bvmHJaEi3kgWHIwS3TiaC3jkYzn8ack7Wd/3+rFVbiI5jb18YvoW599Zc
	 rV8T+s1JSXAJ78cl5nI4j3wZ5BrB+4jZHIIU+1tGIWNGiriam21hVDouBQ9sMDRWtkqLM
	 +YXmtYi49hLT7spoveqyAyy+b8qDAGrmUK2KRqu76kB3kIbAErQSCfpPm6X3zGEAk9mJB
	 1gchuYpJiCoJqgdQoNjaO0EABH42q8dJb+86fYWmaAMj2GDLr6Lct73XeQ9DOiqdZ0kya
	 dDgD6RDPGL0Tq/uLDI/xFMnDogwpsRX5JhcNgSdqjRZSVQ3GhMW39tydKv5joSoYNbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931068;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	b=tptiplgsDTOETAHBNaOLXsBguh+Iuv8cOmn+/symZAsvPe8wClf8/AUsco+mm937xEE7
	 cSu8t0vzgTaHFclqr8GBnwL/ziQyilnPdaFF0k57OzRFITx4F5KhJ05p8HcGRApETYqi9
	 rqMU/c5D8MtiGUB1qwskzElDPg65U4h5a+9guzi0xcqzmZ+qI7koCynqk2GOMJ/bGQDld
	 McwHT5zAXgNfgo8Sxkj5yCFpiiD1ZDeKdbXThs/XkDF+m9m+O3nG/t/iiCvf90cC+6kOV
	 Jwc+mg0+qvM9bnmiwFKjUs78v7FcK4+bTScOKjqGvDhDFJvQVEhRq8XfVam4LkiJB2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbPN6lW5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4AB606A333;
	Tue, 17 Nov 2026 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbPN6lW5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AB91F000CD;
	Tue, 17 Nov 2026 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794931068;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mbPN6lW5pPEr4cJXZEtjlFj60bN5jIgtTlutNzTQ1zegHmrDymI0BNP4mi7+9R4mc
	 sasc76g3RoAGWQHT2KsHJMcRqJsK4sSOjgyS/XjUWe9RaRzlHvuaIXD6pdxh10Fknm
	 /P7Bk82WMlpjJJskoIO8BCK3OsN4Tuy8VUesIM4sUDiPiQY/5ySP4Dgns4S1RGqdGu
	 pi2fKRMad1FIGXmw/DnnsAFujrA1z0XxqmVfK2sOKqc1ft0anDzZdtR56dJsugYLfo
	 mwo+ah7cRbuWR+86ZUfIA+D5+Ke+9LLnx492RLoLcXWRGLdpkyMntiz+aUrU/935Uz
	 ZfC+AwK9T71SQ==
From: netdev-bot+sinfo@kernel.org
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, daniel.machon@microchip.com
Subject: 
 Re: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred doorbell fix
Date: Tue, 17 Nov 2026 15:57:47 +0000
Message-ID: <179493106742.3291.11434436383058043225@kernel.org>
In-Reply-To: <20261117155353.2250540-1-joe@dama.to>
References: <20261117155353.2250540-1-joe@dama.to>
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
