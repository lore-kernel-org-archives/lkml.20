Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D52B2D73B8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939093; cv=none; b=rbBkIXoE3sC8cz6xv2SIHsdhvHzYKPTlVY2qALG/jcuwLMkN3XO0fVhf7ww1bRnDgJ/9Y4d6+ezD0UaK+dbbKBi+5qrR9poUnnh8AUGppUFloSmVymmKw9ZfZfrb44B2e0Fz+3HX5yEbEJIFa1iYsckQ824rVqXi5ODp6JiNJIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939093; c=relaxed/simple;
	bh=540XQ5z5ZX+dzE3i2Si74tWoZ3+0fQ4SNxrtmsuhkhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sY1Ofyg8MeuB6/yiAMck67obXlR+7LXs24CeDIH5iXQk0pIY49s5d0I12MxyZV/UAURYJhod55L+AdC8SjaJCXrYIn/ZoK9A0kIaDD+sSDngAWvK3BPAfgdqlabQ6wT3dxE1N1+aEYJwkf7m4KIDXm0/lcx1H7/KvO/a7E2S/oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKbeITJd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKbeITJd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D431B1F000FF;
	Fri,  2 Oct 2026 11:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790939092;
	bh=DhtSlGxVpN4gfAt2heOQ6JWTRzQQHHGc/XLa2VbWt84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jKbeITJdCzmPeTovw+XZ8kkJAJpKYLDH1Ks+q/vxE+FoY/du4MhtEZqvgorR1ZT6n
	 4Z+EABNUsCA6Qf/3zZzW+1pVBNL7laawoWexu0VNCUDSHWUmGcnOSjKQ7tBPu/fAqX
	 5+sxi11HAKt7afK2aPjA/dXc9MKxKODNOlxnxdk8SvRw2jgmmC4v4eoGyZUC7Vm00z
	 JMPf/FZvtTOFjrKbqBTApvrxuLu9bFl0zJ2mANOBCScPm99dEpxeLJLd7l1g9s+2Vr
	 6wOEKY6UaQZRTtJQZK/f1STWf+0pcaV5bk/fW8IlKvRhY0KdKRgh/EFSd1gLY88R5b
	 xLAq8hohXeR4Q==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vincent Jardin <vjardin@free.fr>
Cc: Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: fsl-mc: drop the fwnode links of the dpmacs nodes
Date: Fri,  2 Oct 2026 13:04:40 +0200
Message-ID: <179093906677.150939.1030233104910633428.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930-for-upstream-fsl-mc-dpmac-fwnode-links-v2-1-13f7b6ef000f@free.fr>
References: <20260930-for-upstream-fsl-mc-dpmac-fwnode-links-v2-1-13f7b6ef000f@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=631; i=chleroy@kernel.org; h=from:subject:message-id; bh=ILFrlKdhUCWpzIUG4as2word+u2G/Sedm4tKKOcL2/E=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTt7z/rwCgxLzfkVHOUx5uClVeCVRs6zmz8+1zQwuSza tzj8CXtHaUsDGJcDLJiiizH/3PvmtH1JTV/6i59mDmsTCBDGLg4BWAi6Q8ZGXbOF1kVwbapjzF7 A+f2i/PeXF8sscpw70TmkL8C0hkP7F0Z/vtosnRs2bnfaIPwno3abAsi7n/Ksn6ySN/3qsKTg7U VyZwA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit


On Wed, 30 Sep 2026 22:15:48 +0200, Vincent Jardin wrote:
> A DPMAC node under dpmacs/ is never the fwnode of any device:
>   the fsl-mc bus creates dpmac.N objects without one,
>   then dpaa2-mac finds its node in dpmacs/ at connect time.
> 
> fw_devlink therefore attaches the supplier links of those nodes (phys, ...)
> to the nearest ancestor device, the fsl-mc bus, as SYNC_STATE_ONLY proxies.
> 
> [...]

Applied, thanks!

[1/1] bus: fsl-mc: drop the fwnode links of the dpmacs nodes
      commit: 31053c50487aa7c5fca9a139f28edb35287a1f45

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>
