Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616560;
	b=izgODnA4YmR+enxgc/xaZwF5YXXlIH/NfMu2QLKJvpBFGWTuKCplvgxszDvsVmR6c8r/
	 AKkpH4ZaS0DOZwJCHh4EZiYoiKk8VkkFbw2UIABtGP7u/yw+fK5N+wjNkN2dBz2iJZ91p
	 RevHoWVEbqw/0e9jQ+pbx0jQGP5SSwtXL1IOt92ZJBIRw1UTnWMEo5p3+3IUWMNV3Mb82
	 yp2et7ouo1f+bOL3wrTl90GtQUvcLur/78jwG7Jq2YuCveRpTzi0vQJX7LRFS8+ljneSG
	 NZu8XROM0fR+ILRP453Bz5eG34vsHRS5pNczkeTqJt5ezsAGFEEYXVFWemBYWFR+TSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616560;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gpIxHqVOMFNtoSJJTK/5AEEVucJj0dS5sOclUQy4pQg=;
	b=z+3fFUEhe4Qq5tF0/r5ukYOBapVtapVx7jpmrgL2dlv5rnCTQVPOBqmJuFqfscD8Fxoi
	 jgT7Bvl8KL8aV3XNqpg4a2y+H8Nfpc5JsNYV+5Amf0fA284niwX4js1Gmmhfmm0y4Rspf
	 SCWVRhgWJ2de1MExhScDDjg+ByCtABuqNzE/xQmx8YoDzJQCD+dKL7yhM7zT3s0AVcofO
	 XkhnYWtGYGe/LbWaMfYM1cdqsWro9t6u4h31p/AQv7plu8skWah5TXXBVF8UzWcQXsdbX
	 cXpPV8pM+fgxg2iEdeQjIjnWaHLsSVG21c4B2PFvbg461JYywEdDTp+FgvhVe00KIpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqdcBxY6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D08606A32E;
	Mon,  2 Nov 2026 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqdcBxY6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D9A1F00A15;
	Mon,  2 Nov 2026 10:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616559;
	bh=gpIxHqVOMFNtoSJJTK/5AEEVucJj0dS5sOclUQy4pQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MqdcBxY699YWjuPFCOnibOLIKrMu+jh12hPCQsy8uEdcbZrjgLWgP0TadCrb3wFQN
	 3LGa0JsCzXIR77qqR4BBdGgnTbar2l2/3+3Ct2u0TbuhrknF6xYHuymRD/uBG6LOUj
	 3qrGqNNrlAhNCh8StbOf3d6V7IgKNtJUyt9zh03wPhTpi3RHrdlA1rc4X+rwgmQchm
	 ornWfPSr9Inhvd+5Ukz1SI3oawKEdZ502qM0wcmftVp3Zpr957n50ILvc2GKDb/WJK
	 lOY9UuVHNS1zLBEgYUpK6ymmjAGbSmQFgnrItJ3YAwjDBbUg7tDtyGTw/2T1evEdRX
	 flXmljFbvGdcg==
Date: Mon, 2 Nov 2026 11:49:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Selby Mashiki <mashikiselby@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of: overlay: fix device_node leak when attaching node to
 changeset fails
Message-ID: <20261102-versed-giga-gharial-edbdcb@quoll>
References: <20261025180237.445403-1-mashikiselby@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261025180237.445403-1-mashikiselby@gmail.com>

On Sun, Oct 25, 2026 at 08:02:37PM +0200, Selby Mashiki wrote:
> In add_changeset_node(), when creating a new target child node via
> __of_node_dup(), tchild is initialized with a reference count of 1. If
> of_changeset_attach_node() subsequently fails, add_changeset_node()
> returns the error without calling of_node_put(tchild), leaking the
> allocated device_node.
> 
> Furthermore, because OF_OVERLAY is set on tchild before
> of_changeset_attach_node() is called, calling of_node_put(tchild) when
> tchild was never added to the changeset (and thus never had
> OF_OVERLAY_FREE_CSET set by __of_changeset_entry_destroy()) would cause
> of_node_release() to log a premature refcount zero error and skip
> freeing the node.
> 
> Move of_node_set_flag(tchild, OF_OVERLAY) after
> of_changeset_attach_node() succeeds and call of_node_put(tchild) on the
> failure path, matching of_changeset_create_node().

How did you reproduce it? Looks like LLM written log.

Best regards,
Krzysztof

