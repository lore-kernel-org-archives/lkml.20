Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502975;
	b=YM1AaU47LwqCLcQYfvh+MB8OPNNTihNzzmWXGX9CxhystgTsH2mUFdIB8/XwGgUdwtLO
	 gtW/gJTBKhPZZssTRg+rGzHg9Fz1dVktEo4wrjtDzKjAhrc/mgtq7WPrPuZ0ag7vDKeZT
	 mgCBJ9xie1L1F1cB6zILbShqrZD4x98qO2u0MUNgW20REA+08dEdq5imLQUixj3AfrJrR
	 r/KoKoRyn1oylYjheFz89m9ub4yWTxbSstYSrop2r2k1ZyYCarnKTLDhGRYVfpK5TPszi
	 JKIk5Akr//DfHXCCF7P7AMMWiAU+6PnE56S0c7sLxZgLwS794IO0TxTk7LqEE5wMgDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502975;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eDwVtk9pYiB3AX1GpUwrH+ex2C83NZAN3p5E4NifyNw=;
	b=3vUm6DsHFxrEPCklUTlisJzNeP6tph2vgtzBZRDKmRad3PAE/pa3MG9FzQaaU9ZXgwVz
	 avg9HjtM4HaxV0MThjTe7u9qonW0lKUzh5A4FkbDx0Igu/Hld64KhaUCYz+EP/QO8HDXO
	 7lxm6y3yizXNAkNSJG38YUjP1OtgVtmDsm1npFAH+CaHf+niljcSI5NKs36cQSpkrRico
	 toSrLlPrFkC22pMkuev2p9tgQ0/aPYuHCU/rA3jX14rwn2PQZLCgjbmK07koUK2sa9vwH
	 EsIcmVvr5Ow2ATzfhJKSB0+p+pTyfmdRbEXetsMI+7md58mNBr9Nujp0P3h1LDJMq3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Slp67J6w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACD9606A31E;
	Tue, 20 Oct 2026 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Slp67J6w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D3A1F000C5;
	Tue, 20 Oct 2026 13:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502974;
	bh=eDwVtk9pYiB3AX1GpUwrH+ex2C83NZAN3p5E4NifyNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Slp67J6wJQ2VUhpZiBOI8ZxQ6E4cdUnNmE5iVEH9gsEzYp2JB499FCX1s+zWBEWOk
	 7ecdiGga2Sge0IfjzTK6GiLRhRZnGAqPJfehpOQumqwvqFeT9WB1R3R/rr3qvHE56i
	 rw/n0lj1QEEjb2Xg+D8y3pumKuOuUabf4Jjpg0I2zlogEpH4pIxS4hRs9oyrOG7j7s
	 bLhMX4RQf46YXgV0+Rm4R84DaMTdUGYzJntNLSsJqf6JGoh9yyfaLMJraJ1C2rEReQ
	 HBXND/0f954AQzS6DgOcTCFmFYcAi34WAexhB6/RcmFqZXWqAUsxyBDi+ocNlmrK4m
	 jkX2F5K/EQvYg==
From: Sasha Levin <sashal@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: broonie@kernel.org,
	corbet@lwn.net,
	error27@gmail.com,
	geert@linux-m68k.org,
	gregkh@linuxfoundation.org,
	kees@kernel.org,
	konstantin@linuxfoundation.org,
	ksummit@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	leon@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@leemhuis.info,
	mst@redhat.com,
	ojeda@kernel.org,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	tytso@mit.edu,
	workflows@vger.kernel.org
Subject: Re: [PATCH v3 1/7] agents: add infrastructure for agent resources
Date: Tue, 20 Oct 2026 09:29:31 -0400
Message-ID: <20261020132931.3149082-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <348BB89E-AD34-4B22-A7DD-A91E9657D566@mainlining.org>
References: <20261016152828.3765695-1-sashal@kernel.org> <20261016152828.3765695-2-sashal@kernel.org> <348BB89E-AD34-4B22-A7DD-A91E9657D566@mainlining.org>
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

On Fri, Oct 16, 2026 at 05:02:58PM +0100, Bradley Morgan wrote:
>I feel this "agents" would be ok, make sure not to let it conflict with the
>
>base agents.md file.

They don't overlap: AGENTS.md is the symlink to README that tools look
for, and agents/ holds the skills.

-- 
Thanks,
Sasha
