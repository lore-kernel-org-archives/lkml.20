Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748107;
	b=hb7psj3vX+Kd34bsLmX+8lznYAL8oRvYF4K15y3djH27VK0mjOTvnJcVJpC0nN7EmXFM
	 azorVb6cNG1e/GPSmUJdjIoh1S++E6YLmqyDOdCrtDSTZ5h3wA3C+Nz4FuN7As3cR1d3y
	 IONC7JeJli9T96jC+MS2pB6Ho3xNfCGMwKZsuzhCFIth9/3BC50Q5y0cyViUMcOQaWReu
	 eM93vdjX2PKP+HQCjRj8HjUSZAbiDhDzzZR/iJHTFIEPtqrY6qezZ6JFM1sPXdabMShaE
	 S31qPdU6wnudtDOdrco5RH/McQyws4Zz8AEa9AyAuv6t2d/CLeTvt0l6GFIhcJL2HZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748107;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q49VUA00x5uwNyTjfQDoJW5O3dFV558y68RO2tYrc+g=;
	b=eyinsii68cpZ8m0cakFlQOWCFHYed2LeSNc8xFXegwEKtismqfeLh8Rz9fL0X7nUjrxR
	 A0GsMXLFRysT8x5ErLGgtmFFiYB+kKLVUP7xzhrlXgzFhF3R1Wn4MOaWAJ+J/18yCuBls
	 Hq/d7dwiwh9f10MOsFTZwcmOyqbYyvMMEa8+vrAZarg+IHa3R56up9YArhmtN2U/5mgcE
	 L9PEeuq7rKydTANHt9VijdeUZk7JOyKCTmwth6gJ3ZSwGkmAgZZdGTCj5O0QpNHyKs/61
	 QAm4FvLxZDXjFvdZQhOVkkaXKNJmvGRvxLmpCLdxsFqOVbwoCLy3zt+X5jQQllxkMCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ysI2M+o8;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542B9606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 542B9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ysI2M+o8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792748101; bh=Q49VUA00x5uwNyTjfQDoJW5O3dFV558y68RO2tYrc+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ysI2M+o8YXDhbNqM13zsUEyPFe2hRy3xnKtc34JIxBzmULYUdnD5MbSNLXPZFI3ma
	 6pLItR4EWQ7Ci8gSpBwSGiQg2DFpNMxUvwIbe3vquxpYipBpHpzZq0t6SrPiw08XMu
	 TbmixLTgqYZstPK2i/jO72y5sjneYrTjaW0UcRCk=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 8BA976D0; Fri, 23 Oct 2026 17:34:58 +0800
X-QQ-mid: xmsmtpt1792748098ts3wyb2of
Message-ID: <tencent_32B822621313A1EE74D2622CD2F2BE4D7208@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznYNwCOoVeajaew3v2Spxco+a06QtS3Kz423FRXqd/AT3815vgAq
	 PdhNN1XO0QtTPUDn8pN+gSRk189GA1cTXK5WsPcq5LrXT8V3wKxcpg+r9AtBmd1LyI9WdeUNop5u
	 Z1uE9KuWL1ZySGy7zpB3OKD5olw6Qdxg+2+Rh4e8C5TE/OvfNRq64TJ7NX3+HzzJEwUMFBbzUfcM
	 WBpOZYiUomNP/hIZrLTCQ5jR7VkGlt8b77lsPjDn+kF+/S4sVPy5e6GYLyh+Ukbu3XXECkZ3wtQ+
	 WQl6iY7SzSpsgJVpUSfeAfw5Pilqbi45LIGeNdyak0TMNAMs/XF4MrHujqW4cYjjpvS7CqiNfEVi
	 ym1587xbETMJOyMY2gAYeXAtN7MlL+QIu+BF1LhbokhulhVsnSC5ZOO8HT1OgfeuafuNYI+etPF7
	 RUhLW9GICTbPW6QlW8pN2Z3bW2+01PhAtRamuDGPh0uhgvnawuyXZwkqTeRqvhYk9BXDC11hnpx/
	 dTesIB2d5keQU75a/0lybVbvMGZblyuKnA9oCFxSb/44sD7OKZCjZF2paqjBKSu9eEDByMaRteAR
	 ywKZ4cqsGVswV2RRrGXC9g/O+3NyWebM7WdLlHzveTxbXYzmJs7Q4mU4xitekiN8ZLT3ufy9M9bi
	 LDJ6dAGeKdQpo9/MCVCIMsbid5mAoqukS72IHIxkg+qVR9X4xQBzCJs6JNdF4stAUAe5n+if2sMw
	 KjMwjdXFA13uoAHztYsgX+Ku+gVKZekpK8NJs3SoUH9d0VtjDx+/txYG65gEBsSn9n9TDyckoW6i
	 6Oic2fzo7Xpp39GI65fIYQESh2zVBQYpgEHEzoA5DP0y4mO7iRo/r7DQMzbyLqwLwBRZ6NKjSOLY
	 uh2jdEIJV1lIwrqTzL3AFkWniAb7VtU0MDZtZElF2hhJW31ymyT8avFgluh3qPDmxYmVmeIwfyti
	 K1rZzuIb2tS6WbLxLqmDTR3QyAGc+MspJQuImOwp/6pc87qLV9BFFqLpEqHs9hwBLRtGV5oX3/4e
	 va+ICaDLcHPMoRxkMJfQ0bKCsq9TYcLkZh7//0+qPh/XQFHM1YHf1gmn+D3Mc=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Shuai Liu <847807867@qq.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: swp: remove unnecessary else after return
Date: Fri, 23 Oct 2026 17:34:58 +0800
X-OQ-MSGID: <20261023093458.3974496-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023092445.3969055-1-847807867@qq.com>
References: <20261023092445.3969055-1-847807867@qq.com>
Content-Type: text/plain; charset=UTF-8
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

On Fri, Oct 23, 2026, Michael Walle wrote:
> So what is the checkpatch warning? IMHO that change make the
> readability worse.

It's the "else is not generally useful after a break or return"
check in checkpatch.pl.

Fair point. With the comments attached to both branches, the
symmetric if/else reads fine, and I agree this isn't worth
changing. Please drop this patch.

Sorry for the noise.

Best regards,
Shuai Liu

