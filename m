Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863195;
	b=GAwDMPFL4EmcF3AqNzr9QKxS/OoNIAPDcyAoHew8BNpacF3YiprHsMnK/pgjkfmeTphr
	 hnjjh5M5T0JrvKMbR4qLGDzc9CwyETg0v6KnHkDjjh+tk/bG08JnNx1J9dcW8/TlRAdM/
	 uviZBlbTDJ+xqCJEtutL0VBcWMdYkL5hRw35gjcAdEj8wUtPidHrlFJPAYip/u4jmhx5b
	 WGEZhKdm/2veVpGShtqiKR/t2adxmMSey2QD+Y4awVeSuQXqGLlEQedf40nfDZvdgt+7m
	 yskb9NjBZhhLnv5XpfLrosXhyjIyh9zAEtL7y7fO4qmR5fIPqPxAIXd4USxJvBJsB9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863195;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lUh1wibKi7G9dCYhcBDpclO8Fe2uuXolVKBGJ2aJNAU=;
	b=1IzG3ZciXS+wysI2/gpgGiDsS1AuMXrX7fiZIjRbCxkkWL5qdlY+m43uyr6My0lZnQ0/
	 ItIIQsvSaPj4U7klhNkaHkN3vPK0zNiHGGmeEqI3CRhM4OA9fIdoJ3BM0x9EDPmnPd2Pv
	 K/Yj2s/eHstii6WfcS4ZSXODdsOTW2vsQAjSs2avFBHOPlZsLA4aUwN0M/WPB4U1jvdkg
	 rl8g3vDW4u3b2zvpD1Np5ZrIWL8q1jdzaInD1N9AKcmiYVWBwZMC1uHLYj4n0O0NV6PpB
	 +9KfldbA76t32hO/Uj3r0BdMsekavhzf362qx9BGxzB2Q/lAWvxoQcoLFrAc/BQqinQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPmCt1Sz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F66D606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPmCt1Sz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61F51F000C5;
	Mon, 16 Nov 2026 21:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794863194;
	bh=lUh1wibKi7G9dCYhcBDpclO8Fe2uuXolVKBGJ2aJNAU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XPmCt1Sz6VTK2yDn60uvYq9E2mVbOj4o11KwovBBd6F2x0IxMiykN2SC1olPqR6Nq
	 pS2PpkduC14uBRK6+l+JT9gpZFQTv+cuXjjbjX+3AuB3ruIBjBtqZ2eY7cBqJZ2u5u
	 bvYhpjo2vt1u+7ORsWpgOAIlljsScfVTlmTJuBBr+/Qd+1D3cJ1TRX2WEFkgvIN/+e
	 24hCwujLLqG3yrgcqsOt59hnDlQPLVO86y/FW1GKqG56/8cPG4yAMiQcOBZtBbr3m5
	 elAlJH9buUNtbX3ekDQxg7qBHZKydLgwm4LPv/PBcGRV+xoWDXcamcNafEd7lqnEyl
	 NvGNcEOoXWKyA==
Date: Mon, 16 Nov 2026 11:06:33 -1000
Message-ID: <fbc6c2e5da2565f97889b836d9852843@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v6 0/2] workqueue: Make WQ_UNBOUND the default behavior
In-Reply-To: <20261116155051.157875-1-marco.crivellari@suse.com>
References: <20261116155051.157875-1-marco.crivellari@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

> Marco Crivellari (2):
>   workqueue: Make alloc_workqueue() unbound by default
>   workqueue: doc: Update WQ_UNBOUND and WQ_BH documentation

Applied 1-2 to wq/for-7.5.

Thanks.

--
tejun
