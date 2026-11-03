Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736101;
	b=JgHeYjcrA+/Fvwk1s+MgIR/RMqarpiUE1p7oBR/HSEBwZQxbYy2rpdHPqV76YA2dnh8K
	 QmSnLFk6JkV1elE/u6LCFSEaOxXD1uuFJdS7d2WLAhKGbVzkC6uiTzkfQbQ31o3WQJ46e
	 z0rn4+dQzMqaxRRzU0S8Cte9upX5tQSli7XMxKqVbuwuk7BoeHysUkNMCJa1KX1fK8Ori
	 wOxJz3wRih748rpY/10NXTAAtULfDuqKaKW+w7SE9nmYtk1IdZonNcU0Zdb/LYYORpU2R
	 LFnqFKcRtVNAfMV7mRo9RTbkzVrpECYIyLEnng8EEk0myVfRn6/Zvy5GYGznvflH55g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736101;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7H1RDtJDysjjwJhjmvJC02gigYRM/VOFCjnNa1uDYbQ=;
	b=He/rXkkx3u51RAEESQvkP9MJnrQWZ9rq5XCqI4m140HvtmsO7k2jbV5Y8+DRQ0JZZO7j
	 ccfcC8yTxqktisu4Venll+Pq/fqHSoAdECG+U6J//K3lfll+2Hyq/sXi9nppT+FKjRjnE
	 PCzMwZVkC/cmG+Gaf0oQ6k+F3RXCKXmr/oiEoaR/sm5UFF5KYhhGGVVXQ8dK3ZL9cu8tF
	 Fb6dJAnSuOzJ3UNLiU7e4qKws4nENwmktNNnkAyB9VL9wf9uvEeUooXaK1vttETD6D4XG
	 dIO71NNeW0pmy8A0PC3q2UP/Jx2zQLLLAwfbLwZfJwK2sXIECpeKtCFkZ0TLkYUp5Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlvZnhnR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD01B606A326;
	Tue,  3 Nov 2026 20:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlvZnhnR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81CF1F000C1;
	Tue,  3 Nov 2026 20:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793736100;
	bh=7H1RDtJDysjjwJhjmvJC02gigYRM/VOFCjnNa1uDYbQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZlvZnhnRmewFgvwIRJro08JNu0WSP6OzJkDcGl3OzqTNu5KNxytSxbN9oDpjfiZe5
	 /NNxGXtgpOOX1tt2yLiI7Ixx2n1yVsiOHZY+Kgiplx97WvnrCBQiPrSoueOnqD8NiO
	 pVYXFOiOD0s7RkRg64ebbKucvcXB1MThbX5vnwtSd+eAy1gPkz79BC9Hw2LTJ+avcH
	 biDxQgSuLFMdxXFQ0iWWv2ZyloixiIZ0IEtF/6Xs0mV8TOK3F4Bjm6ensswYNztnYf
	 FFbbv9jheckLXMD1xwof6CwCWkM38zlJKXO/8DT6oDJabdv0PIWKryqhIoRT10NSVN
	 EAHeoLZ26BCKw==
Message-ID: <1583a8a1-c039-4c8d-8607-7bff0b284048@kernel.org>
Date: Wed, 4 Nov 2026 05:01:35 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] reset: k210: Use regmap_test_bits in k210_rst_status
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Conor Dooley <conor.dooley@microchip.com>,
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de>
 <20261103-reset-regmap-test-bits-v1-3-1b33607a76b0@pengutronix.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20261103-reset-regmap-test-bits-v1-3-1b33607a76b0@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 23:51, Philipp Zabel wrote:
> Simplify k210_rst_status() by using regmap_test_bits().
> Now returns 1 if asserted for all bits.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
