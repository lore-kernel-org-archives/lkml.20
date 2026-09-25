Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF683372B50;
	Fri, 25 Sep 2026 02:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790302036; cv=none; b=LJjeRJpSgrVdrYKkilghVWftEpkFcrqkiQRS9G7MFqLyqg0ZznqmO6wpWS5+vNYnQbxgYjxi2wQxwHrUK+Txc/e8Jsrcyqh71U4f1QxjfojohHE72sJFmPRDm5FAKcy2X1ROBMHVxc3BaziFIJxPtsvaVhCig9FzG98PlCk/u9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790302036; c=relaxed/simple;
	bh=oy40Gp6Rag2wSK10iZUZPR9R7oMp/JDVWYeGLLE2t1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxGJmc64ps327mmY3HYbNeVA3ft9SXf0GNvrMviEsPiYbytzFc0rWa4mgzHiOh+Y5wqdge6EGwSbyIMhZ5K7OK8h7Rn7x+g1GUbSA0lzOm60SwzxdNYv7HxfDsU9qMWdJ1uScoeERvbjJ8pKWQpIzVgQ6pU8OQi0Z5K52aMkdgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3ZrmD0g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3ZrmD0g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400121F00898;
	Fri, 25 Sep 2026 02:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790302031;
	bh=7IMr+1Y1gs8musuB3lxBDbTxUTorIIZaFvz4JGe/z+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E3ZrmD0gEVbadu51DlEnTFlPiQkxkkUgK90N3+D6DZjEmmLLpjTW1okHt20EAoM9h
	 OIMcjpA1wi7msPiFj74jNombscyGa1IT1JjMRJ9ga5IFMMrxtRREaaYk94sWecatG9
	 GlfRToEhu/Z9kHJaeokPPaZsOiPKtfgdyfrp1e/drGWqUkhZ9AMG0FkIQowQC4UE/h
	 hVoy44X4JCV8ertbl4BJARqLZxABtqalhf6VNupmtBDWagLwjexRa1cisAb9TC0HZb
	 mandoVixuNcsVsJKqP/H0kwzofol1C225s5NGPezHL/EURmdBJTx5z/4d37Bt+vVfN
	 9HsnY5WLmT/uA==
Date: Thu, 24 Sep 2026 21:07:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: gpu: Allow Hi6220 Mali resets
Message-ID: <179030202997.2926646.12844524842767365149.robh@kernel.org>
References: <20260921232758.3136548-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232758.3136548-1-robh@kernel.org>


On Mon, 21 Sep 2026 18:27:58 -0500, Rob Herring (Arm) wrote:
> Hi6220 Mali nodes provide both ao_g3d and media_g3d resets. Require
> those two resets and their names for the Hi6220 compatible. Other Mali
> Utgard nodes have at most one reset and do not use reset names.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/gpu/arm,mali-utgard.yaml         | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 

Applied, thanks!

