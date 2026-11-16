Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794791004;
	b=X8RYuQoXUk24tcSHhtiTEFUQ6xUuYYqdppTOA4GhHa/gRfd5Rg1jg9tHbbirzG3QvXA/
	 lNLi4XpzU6MdD6yCL6sqxLLrxAE/6riFqwAJCxRBTt+ijaS7Xi+DXTqB5T5TxHv7PsQk2
	 RPJ7Ncjr79LhHixlNqFNkF06hl3ZeCzN5BgA8MXch4759rru3TKPGctIQ6X+js3NbkVnm
	 akvlrpUcrVzirFGBXMtaLq7Z038nWB0zJMadz3hsNs41ohQfI0aOoirzVJn6ep6pstzYt
	 p+x1UDCkvXtUeJ+KbucVA1Scq15gqOLITy1kNWhbsJ8aaq86PyU51LcDDwSfiMS7VXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794791004;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=1P+YO1H+H9NnRJ3bfuliz9qc7ur2x4q8HblmIYnByKvD+1O67kNwdcmG/n52mKQCqcwM
	 +gNSRRucYMhtGvotWMUm7f0lrylK5WZXlqbJVA0L3LI3Ej8uZugWoUWDBvVLw9LpMTzPQ
	 PiQU02xB+h8AbqMMLLPo/HuBbzyfakDN9+aynvUxO9NJUEdzXF2g92bWYPCa4iBJ2x2bD
	 n8jJ1UZnStrjcYKoX+vMuL8KCRCdqczOo1sU5vRk+9F2CnFnD4yLH/I3iVat3gl1EvME4
	 Beezv9iXatJ6/8/POG20TE4H1jAsujl6jd5+Z6lAYlUehWSmcl3/4r08T6TgBoUwKGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X7+sLhBw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958C4606A329;
	Mon, 16 Nov 2026 01:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X7+sLhBw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E52E1F000C4;
	Mon, 16 Nov 2026 01:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794791004;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X7+sLhBwXSrhQq8NDotV6TqvWfI8jiWt1azu594DUT+onWbSG5bOov0/9Wkz7K9Ld
	 BAkjhPU0r8fTe9UWSTHOz7BfdnGyS8pUNFKsDKYE4NZ03+Jk1EiN1QyjSXsrdEd6+N
	 rMKWuaUdpQg8rydPVRO/7lcSncRdSRUXPn7QgCopMBjTpzqfR/k9beOdnZG2G5OI5S
	 mO8V2HUQheSdB1W7i7HNBEXRoCBJMgexDTWOAK9rs0kNzWO9IyPZNjULfvJLxtPiNT
	 35l4SVfaNkhDu1omfUK05oRJu0Fxa1GtTqJ2PyNZsGgYEsYmEuq8vxcPufNILsmkXm
	 /CyRcxdJom8uw==
From: netdev-bot+sinfo@kernel.org
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 LABBE Corentin <clabbe.montjoie@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
Date: Mon, 16 Nov 2026 01:03:22 +0000
Message-ID: <179479100276.3291.7162632058743254408@kernel.org>
In-Reply-To:
 <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
References:
 <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
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

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

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
