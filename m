Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773192;
	b=1b6aoIq6tnjDIkoEsHNOAW+bqljBzCZ2YOB66ZeoHrcWloXORlP+Xz4ELbNnNUTl0/uQ
	 Aro48KpPDRRDbxrdVLiyGHDro9T4tiGe22jixuoCr+6bRPyk4Pm3+Pu2TkNLPEghacJiy
	 bCDkDq0Lp0aJwnYyKy3lmCb6TLtcmJmz0pD46ZGxq1O0wsyl01n4nsuET1cu3SuMuTX9L
	 yJ/GeUrVHl+pJJ/Zr+r0J2DW8XH0UAfDULleBy8QlCabKTGxOKkaqx/wEN53I3uT303hg
	 iKEcKTiJtlIr4Ojc8mzfkX916d6PslAW52p0IWyc/qwlkxKv87Yi/cSPmDafg5b02cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773192;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=E/untW6/reUPvy+egSfmvXLBKfxdiV8HsdFInEzIGw8m0VAZztzMg2d5uycQm0NrC0TY
	 JO3EvAVg7kNxaEIr0sjg3rWs621AW7PglG2ogwQw0zMJu/e1L19/mLrBIHfTKSHBdj8QW
	 JbG5Ui3hQQaxaVPapgtZzW80Xnvo+TvEeRmdBjPekH+g6960wmu3jXYBRSHFlQ5zf+oTs
	 jJI3SjEfU7i33UMGZrEcvyHkNpUyoPo9G05OWCY+thOQuq1kBGlcuhIDxa0v/+dMWafxB
	 5J5yLb9K1gauId6AwzsGRxvgEhNxsEe6nCbIGw6BJsLEHC/4c0ZPW1tH2neptV6R23w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K3SIcwOC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA09F606A31F;
	Sun, 15 Nov 2026 20:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K3SIcwOC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD551F000C4;
	Sun, 15 Nov 2026 20:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773192;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K3SIcwOCpAW1rB3gE+koWlEgwQPfWeE4wSA4j5bsLpplLrp/TwNqFxfcFSUwO97BD
	 Vi5ix5BPyoSmmghUJjFLN1OkZxU3pLMyJ6aK8sL+OZwGszNAa4z4+XlirOqJrSl5PM
	 h6rQPR0CDfXLF4Xo/vmLaT3eOY492B+zlR7vs844VbM2nB4ewcUiiO63akYV3pXkkN
	 wKJ94Irp1NK7xQ2P5KpnoiZP4Rinp8xpjmrVZShkutTw3/qIG35wZ+xCwT5Fv1oIaV
	 /UAUthcyDi9XqHC3BEK/QVXH8niUHXxIp6NM2DXBGp6LEvmVCAfHX1ZTKufaxHY21A
	 d30cgOUAzuNwQ==
From: netdev-bot+sinfo@kernel.org
To: Daniel Wade <danjwade95@gmail.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: af_key: fix use-after-free in dump_sp() on
 policy migrate
Date: Sun, 15 Nov 2026 20:06:31 +0000
Message-ID: <179477319143.3291.12335649021318391220@kernel.org>
In-Reply-To: <20261114223529.1791-1-danjwade95@gmail.com>
References: <20261114223529.1791-1-danjwade95@gmail.com>
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

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
