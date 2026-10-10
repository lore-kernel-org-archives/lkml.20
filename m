Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CDD37FF67
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791661502; cv=none; b=b4he35ugjGA08qTAlMzP8Lv03GiIkSGvNlZ/kntfCrl9xJl6hmmo1H7JM6Ot1hvpqGvHAvhMl4L++vcl4haG3hdFj4pHx2c7Mv9syhVTfcErb3Rp8WlgKaYkmlvg2Xr5hPcQ1ztWpT+e9T+UJ7z5h/QztsLyjnaOPY3ecSxvwgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791661502; c=relaxed/simple;
	bh=pfwEH21ZQ+VyqbpwjBgdY6h7pqqNcOg8os0RKJ44Bc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hpSWIfaPfC9bQkfA2vkeyYQCcMEq5SbWFUfuw0MfLOya1FlGrx5OO3YjkiF7G3e8se3bIevYKu1M6jTZ6V60I9k2gJbC0XqgBSeWonD2eIhdCHx8+1onU9rlakB5JRkcRa12DwZzKgyn/1OqpXNiTrnG9TI7EjpyNkprPdanm2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgklvrWg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgklvrWg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA32B1F000FF;
	Sat, 10 Oct 2026 19:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791661501;
	bh=pfwEH21ZQ+VyqbpwjBgdY6h7pqqNcOg8os0RKJ44Bc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IgklvrWgq5zL5cWRq1rSvtIcEFJQjUcCu3GXo9Mmj6gFM6Lvhiytk9xAq3+E8SZhM
	 HqeKRt9zwoGlQVnOEExrWwybC1ekvgNtvF005zgS7d2Eb7+DItRC07cB7mD+9t43KJ
	 a9+nZ/73ulUdj2PuQTe8scL3yddtcCD2iHlHnt7Ab3qq7p6+Ywv/ih0wqbU5GK6BNG
	 B4da1FE/RnDhEbuDcrZV/oNDqN+Qmx4LMG/DIPCaC8YwD9O5CKz3cdJRMORsy2nUJF
	 vDC6TgE64LGSZb5veghKvF4Qt/nJ1S8j4fxS2oFLeY3wzvd0PBAvkblypux9+tcg23
	 8cqaB+D8a2UtA==
From: Thomas Gleixner <tglx@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Radu Rendec <radu@rendec.net>, James Morse <james.morse@arm.com>, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 0/3] irqchip/gic-v3: Memory-safety fixes on the probe
 paths
In-Reply-To: <CA+EHjTzCG-vR1MFgMhuVtn3PFfW1rQjhGUBBgQawSw6ptsK-QA@mail.gmail.com>
References: <20260925085000.753400-1-fuad.tabba@linux.dev>
 <CA+EHjTzCG-vR1MFgMhuVtn3PFfW1rQjhGUBBgQawSw6ptsK-QA@mail.gmail.com>
Date: Sat, 10 Oct 2026 21:44:58 +0200
Message-ID: <87mrslfih1.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Oct 07 2026 at 05:22, Fuad Tabba wrote:

> Hi Thomas,
>
> Gentle ping on this series, which Marc has reviewed, and on the
> lifetime and range fixes [1], which he has also reviewed.

All of that is in my todo list which contains the backlog of vacation
and conference travel. I'll get there in the foreseeable future...
