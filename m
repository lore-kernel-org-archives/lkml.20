Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E099B2E7622;
	Sat, 10 Oct 2026 19:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791661942; cv=none; b=GTgE/36d2ZyhGWact7aUKvwz0NWy6P9aAfUtRB4cCyB/kIMnx5YnID2wFIGM47rtXXdFYNq0M0sbTNFyRJ9xOnRQQ8dFIsAE45NZCUrYjhWiSnI7uaWt1Ox/1QdvOus8txvvlMn8bYwsVUFH8oEZTVQjI/Kijekc98STHSCO4CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791661942; c=relaxed/simple;
	bh=z20t4eyrSZO9qnTBTHndz8FIcICFC1pVdp6SIPKlOw0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UWGKSgjcjOluDS0Hu2Pm3H0QVMPSwJTNYCHZ+1O0uULT1qN1XlQuBi/yBOiXkVRsEaCQtFFrDpCiu75HkbLcJf7luu69g4nKMJEpO5wYoKlEP2goTgtb4uMyFIIO7dPnNYqAHpzO9yR0ewYX0iBb0YjVvwfSIFpn7bSFC3Z8yns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaFBslUY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaFBslUY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D5C1F000FF;
	Sat, 10 Oct 2026 19:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791661940;
	bh=A4qxEAeQZjRwcbEDvQVSiP48ZIS0+/Hrzsm/TnGqMSY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WaFBslUYeqm6IckxmSEpB9nyUIyLCk6VWxIMCY73YWjGtZA9ythH3LeyX++I1y7aR
	 lqPqvtWoWjX2Pw3Sc+vVZocxtMgVA17QML6o/lwLPstdtq0hKUruy/nQKEbnx0hnZK
	 jIpZf2wZ7DOuY9YWDRjPc0AVFDK+WzepIWmw76a0VxN1LXngWCsyNMFGywBryzl/4G
	 teO3n0IW+Le+fPIRVq9PKh8lJeVfmcPn91rGjTgShiYerSNCe9UM9mJx7hCYS7eiKQ
	 FE2HnSmFIV4GSULngrSx9AtO1wFrE50+JkiTkv0AbcV26uAasTrIYR92w5tNTgcqQb
	 z8YDlx176jZRw==
From: Thomas Gleixner <tglx@kernel.org>
To: Eliav Farber <farbere@amazon.com>, Talel Shenhar <talel@amazon.com>
Cc: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Eliav
 Farber <farbere@amazon.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 8/8] irqchip/al-fic: add irq_set_affinity callback
In-Reply-To: <20261008090058.38591-9-farbere@amazon.com>
References: <20261008090058.38591-1-farbere@amazon.com>
 <20261008090058.38591-9-farbere@amazon.com>
Date: Sat, 10 Oct 2026 21:52:16 +0200
Message-ID: <87jynpfi4v.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Oct 08 2026 at 09:00, Eliav Farber wrote:
> The FIC aggregates up to 32 interrupt sources into a single parent GIC
> SPI and has no per-child affinity control; affinity is determined by the
> parent GIC SPI routing.
>
> irq_set_affinity() fails with -EINVAL when the target irqchip has no
> irq_set_affinity callback, which prevents drivers that call it from
> probing when their interrupt is routed through a FIC instance. Add an
> irq_set_affinity callback that returns IRQ_SET_MASK_OK_DONE
> unconditionally.
>
> Affinity requests cannot be forwarded to the parent GIC SPI, because it
> may be shared by several FIC instances and changing its affinity for one
> child would silently move all the others. A pr_warn_once() is emitted
> when the requested affinity differs from the parent's current affinity,
> giving visibility without failing the caller.

No. That's a horrible hack and just pretends to solve a problem.

We have the interrupt redirection infrastructure to handle that
correctly. See fcc1d0dabd and subsequent commits.

Thanks,

        tglx

