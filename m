Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920018;
	b=Q2u9SBVmOTBGbx1NR55R/jqxZArOLVGzYJA6IjIurX2c7T/uYh+iKtk8wMFWYM7xSN+K
	 8uqd84iEya7d6W2gkg0LoDoxYDPFz+HPQwxOVAjW08HFuIgUrWhZ+GHdRMIXxQOtTnBKt
	 iXvbtKppvbtKqqm/TCM0KgbA7bHvMzDUMmzPJpcbyG5rA1BP2Vdo7ZH7lKwGJaXWurrC5
	 nmaDlz+5Aljne8b3soBKTLGomsDdit2ElsiRbRRstNxmKsiy1xMLsZoGCXmo1Q7DRHdF/
	 wwFtnxgFM4Ho1lFg4rlyTyK2EDJ21F/VgWqzciMlpZpYUBG0669Bajdz7P4yJTSBp/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920018;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=MW6T6e3f8g1GmYprDznaVtPQkcORYuTFV1xQB/hJ0EfWT4eLOnXdQb3FA/EpXn9Tv7RQ
	 v2ZSHtxCag4oR5Zpy11s4pRQQb8YkWRAbi1ISYLzZUpbW37bOhxoeblkki/RD7z0BsGl1
	 EtEbWHx2YKaupf8WfaceA+ogvzsXxdZYorR34qC/X1LHHWDsOI2KrLnhWDgSj1l3dtNJ+
	 Y21m8SI/1VEvrLq+mrl2mCsELT/p9tDETy4l0ZXEVGMORvg5ftkRDWrdZU01LoAnaTLt8
	 7RfyrnrQYTG15eyrc+8var4k/Gk/PglqNNnEfAH2G0OFzOf8bSJmED0ZA45IWYpBIcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=COOIT3SO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D65606A891;
	Tue, 17 Nov 2026 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=COOIT3SO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335D71F000C4;
	Tue, 17 Nov 2026 12:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920017;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=COOIT3SO3/NXNXsFZOtF5HcLruL4zF1g19T07qHTjXgWkBYEXV64r4Wm3oE/YKf/A
	 WprGl97B2p2t/whgzIaMxyPZpSdCQ00lvnpzZWTVeO3bKZWlymzXKq99sooKQz/DPN
	 IwMpCjpS/uMCtNkPllAHBwPV5q23K9W35Cehx+IGFaU/9OEPcjDqqCTNkhLvip8R9o
	 b7ue5tPTa5TzDMEcRgrTC+8FgzCH7iHCCqTTxShD8wOL76heLurKH3U4l34/lc9P+5
	 vfyx2tgL0Gz3qAQeN589KbELur9gD+dBCZ2TJosgjk+nuO+GMuCSs7xC6T0jEnvBro
	 r7jhZw0lueflw==
From: netdev-bot+sinfo@kernel.org
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: lan966x: free the RX pages when the TX
 allocation fails
Date: Tue, 17 Nov 2026 12:53:36 +0000
Message-ID: <179492001673.3291.3550339481226838535@kernel.org>
In-Reply-To:
 <20261117-lan966x-rx-pages-tx-alloc-fail-v1-1-13f310d66650@microchip.com>
References:
 <20261117-lan966x-rx-pages-tx-alloc-fail-v1-1-13f310d66650@microchip.com>
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
