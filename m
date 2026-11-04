Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820323;
	b=QLG9KMo6AV8pycW70MqmJCVjWbwButJMpuvqYGgkLLjK9xcQSnBr/KAJW1siIsP7gFRB
	 dCyoHiOcDWF0aY0ikF5uR3qA4Chcc1TceUbpQUHwvhw+mlObJV70rnmD/KcZeg2wifBbN
	 7dWOK5y0X9KZ8UN1CE/IaziWzRkJ/5oBMY3lwTmWg/v4DqWKmNE1FRGXoSQuMzUkD8sLB
	 0TGekLBLqcRZjBf0Exbprx938ui4JbiQgM12hf+xzFGxumgQmDKAomoX1E2WOf8t9TVDV
	 DOpp6xk4cxYGURzC5nQVwt7tyo0xsyRqNwleTWkii63AaLvvky22rpROMJsUIHjBZcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820323;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Uk0o6FBoGcY5NBuL2LZGlytPcIssZi7GRrhUphWLTxQ=;
	b=1j6gZ5EZXavzWzoP6xeFCWKg8G2pn0bQ4SXN6NBGQxzL29JhqM9krs0+gLOZYYeY+DSA
	 4dD5HqfvZX0xZD8NEXkRPMgc60GIMIOMB6iGKQsCxeCuuQ/9Z38rFaFnwdTyZApqmHzun
	 vG7KTbpVLo2qtphUfDNpcp+NnXYRqe2mWF+bEuL5YO2TwsN1u22NRNixt/GcIxL+by1hM
	 0lKu4mjXm/8jJm7MwEj3vTlQyFM8dPvwQpf/X7cJyZEiABgtJf2w0a7wxbeTkWXkGEtoX
	 EGFzd8q+/2DkOfk9obydLabH6rmEEAPIifI07knjN9AcEFCtL80WVLEKkOANntnzuvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fERs4CgT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6FE6082098;
	Wed,  4 Nov 2026 19:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fERs4CgT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18A21F00A22;
	Wed,  4 Nov 2026 19:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793820322;
	bh=Uk0o6FBoGcY5NBuL2LZGlytPcIssZi7GRrhUphWLTxQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fERs4CgTg6+eT98lS7Wr8OWNaful2DOb7NsQ4/EFDrOoKGxYJKwqzRoSGs1VFWJO5
	 zn8qCzM6X3gZ7FurA6/7bJMPt8k7ToEKifwCaQCx3kEvdCCuxcJCAQQaOBvA/tDDpQ
	 yFNZUNqb1XTbZVdGbooCeloWqex6KsUz7r6YX8HZ/lSvjpCmVg0mkp6/0ISbZlxKVU
	 jdgHO1GJDi7jchtTT0P2ifxoQ9D3aKmC5GY1CODPg4DAbuU4A/lnKlJY6x9IA/IUk5
	 9+xOKvDbSr9FZ/owkWyilWMiGFGUs9UgeIHHjtrcjQUWFYreYoK/853HwMDSHWjVJl
	 yFDNKRh33DnPw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id A6DED262AA11;
	Wed, 04 Nov 2026 19:25:20 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] firmware: cs_dsp: Fix memory leak on cs_dsp_power_up()
 error path
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20261104152402.1153795-1-rf@opensource.cirrus.com>
References: <20261104152402.1153795-1-rf@opensource.cirrus.com>
Date: Wed, 04 Nov 2026 19:25:19 +0000
Message-Id: <179382031940.2456854.940954168773032652.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=442; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6ST5GjTKv6pWjG2QugZsumFA9GJltuLOJEHUi+qAFNE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJety1Ye3D9H9cc7jzdW++dHu7UW/2vmONm3p43kglsj
 k/CPkxK7yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEduYy/I/OjczriVCqV7Qt
 mb3rZvzRA/9XyHRcjProdEPto4/tli2MDJ83eVy8nGX9cn3ZEcVsJZsFk6sEMj8WqxxJzL1QNX/
 6bBYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> If cs_dsp_power_up() fails on or after cs_dsp_load() mark the controls
> disabled and free the alg regions.

> @@ -2838,6 +2839,11 @@ int cs_dsp_power_up(struct cs_dsp *dsp,
>  
>  	return 0;
>  err_ena:
> +	list_for_each_entry(ctl, &dsp->ctl_list, list)
> +		ctl->enabled = 0;
> +
> +	cs_dsp_free_alg_regions(dsp);
> +

Do we need something similar in cs_dsp_adsp1_power_up() as well?

-- 
Mark Brown <broonie@kernel.org>
