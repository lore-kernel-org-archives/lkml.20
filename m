Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790403;
	b=KzD/NHJl8uezfDvOiwxPJF1Dure5DWgInhuKv1Py564iGnFE+OTQGnn9WqfWxIRZs/Az
	 VEBgt6jRg6t+wY0vlyVPtsUWEESXQgUENIzBSA4DRTxYtFHNKSxQh+0gZ8w4qCuJ35+Hq
	 YM8IhSMqMNlgoZE+wHVsHbhdwwhjkchv3Iztbf0Vi0FAJZf2TjQrSJx/W+VBVTEstMU7y
	 28g5ulGSLHO3tkzKM+bcE1/+BZqgb28oHiJQyoSTXrCP++1eqjhrZtG5exB4UkL90QYZE
	 dN3yc+sbG4dUUcKNbmGJ03r/jWER+JAoAzFcJpdALkFl43bTbcgpRFrojMy0CTGIBlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790403;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=FwRnRqpq3nq96Jhxm0SmvGfw3D5PN4HcFAMTo6aLqCWXiWQomd6b3GPUGY9PfuXA7S8R
	 55HiMDOVZNDJGB/NDmXogN8lknkRga6A5qnh9BzGlSGCAKlvBhkuf8VjXbxw2NSpjxCXO
	 CqFIKZKw8cUTjvw0K/JvBGdLWA5r0McZA9SENoWRv1AftW//r26LECBRU3+ndDxXeXbeA
	 pdq0QW54kl8cFjXClEU/ZHt8+JG5Lf2XA/qSnscUNl5fo1VYp4CVkrpMBp76SNAMH0B4T
	 /4WlJ2swinTFd5cZofhyDOWQZ8LE/4wcIxL2ccDj7xbczXcBwz8xW6zv867J/vfzobQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6BaEmd6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7C9606A329;
	Mon, 16 Nov 2026 00:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6BaEmd6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EA11F000C5;
	Mon, 16 Nov 2026 00:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794790402;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m6BaEmd6/6JVCZV3/nQyBbu3lsT24dNLmn6+nc7NS4ubLXA+uzYCP5oXtFurSwoOx
	 Pi/Nh651Dp6dbgc+q/ez4Fiaa4RwxdHNuQWkSbjkc2G8DSbZSmER4rx4sPZ+R2j9D8
	 RkThNnuip/lW1JXPgCFKhplRBsHNnMp8h7OcAtxVyuVgj60a1c3IqYvy+3ZMzxDKVI
	 0nPH6CeOpLKvMeQ+NYYVA2Xns0b/fpKUxNx0GxAbTbOHj82+kX9+u7rtUJ6xZP6EHB
	 if9ceRzE01sRr+J+SevQD48PfwAzSkccJrGWk8QmJ9ourWP+g6iL8P6wN+i1natAGy
	 m0EimnnPdPLCg==
From: netdev-bot+sinfo@kernel.org
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: preserve RX checksum capability when
 offload is disabled
Date: Mon, 16 Nov 2026 00:53:21 +0000
Message-ID: <179479040161.3291.5723238689308327095@kernel.org>
In-Reply-To: =?utf-8?q?=3C20261115-submit-stmmac-rx-checksum-capability-v1-v?=
 =?utf-8?q?1-1-ea26fa3689be=40gmail=2Ecom=3E?=
References: =?utf-8?q?=3C20261115-submit-stmmac-rx-checksum-capability-v1-v1?=
 =?utf-8?q?-1-ea26fa3689be=40gmail=2Ecom=3E?=
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
