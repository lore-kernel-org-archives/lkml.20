Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169327;
	b=ekwwipFBdETYDxsXKbDTOiCZdzSOtiB3OU2KBBtToepGxoHW8mBogXWaQlZg2uAK0JQQ
	 3YTrW7AXtEigo/E2QRKbPZXzRnftLcJUQoMYvJeMvZz/mWKtrPOvKEBzXwITvB84KlWi6
	 QHAbr/B+kxaA4CMlgIzHBtUhXYzr9Vb0RdyN7Grq0XM6IrV58QXYBnrQX03WFQI4BWPo5
	 qhoib+LoNK7aOjeLr3ught4UVEJfA6VGCPdEpls+jovmzRC87Zams6W7f9bYBR6hNWnpw
	 WDn+XQTCgUdXps/I7z9INQOWhXPLpVxaeobDAxBiNgJKqnT0WSyoo1c2uELoINYckoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169327;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gGByZvlmOswAyOTpap/9v1Pyid07Vs1MgdbZMiZcqvk=;
	b=ZNi436zU4xQQfzXwxgEbUAzaVDbGJVpRMuV8Pakd86t4Cpb63cZcmUt+5RRZzWXbhOy7
	 AqUE75OCAus5TPiiwAboPlzV/m9RrcR7z0a2kEevJhrBIfbAPQ8w2gPRMfjA8lBHNjDfA
	 yPSZfJwwBlqB+cpaYcGk1ia2H74P0I+KTWDvIPPt2ElIUfQKA2M5x4ZEX/BUFdEZzDeXv
	 QUrzOVVnBniLlsdN3OikprGL+eYvNe0bs+p+elOx2aVmKkkJapA6/PMbCml3ZSYfKacep
	 C+1frt/RbE0xMEiysqeYMeT6jF20BErN8xJAE/4F64TEv5yDRAGfJmXAZIb18mZB3uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MEoHRJkm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F838606D829;
	Sun,  8 Nov 2026 20:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MEoHRJkm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55511F00906;
	Sun,  8 Nov 2026 20:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169327;
	bh=gGByZvlmOswAyOTpap/9v1Pyid07Vs1MgdbZMiZcqvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MEoHRJkm02PYyZ2Lb9AmCTcXKTnGE5rbYkqUuJ8A8NYcdaD95oMeLAclEvC0FM6pL
	 6OTzvYtHwrY9BJc4iFCLr8YW4Uhu8bWi62ULPHCjyODqqXLFXRTxq8iMvESI2JCABs
	 umDqmtiAOPenqh5/khsYeUmgsy5EJqitN84zSZsh0MVx8Ru418kNU16cvwVY3uslYC
	 k8OcmV9+UhPPDcj0pT/65s0cV2I5M92q0LMFRtPe4JkoU1Z2Gx2758ecNoIZqYYpHt
	 pGXdy2o5KCi7Cfa/Tk7gpI8lXiZF6F6h3LUHe2lUlXwPkzaEceqJXsCpOrFOw2sB9j
	 yK06AT2Oe/ciw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: (subset) [PATCH v1 1/1] soc: qcom: cmd-db: Use %*pEhp specifier to add some sanity
Date: Sun,  8 Nov 2026 14:19:22 -0600
Message-ID: <179416929318.628393.1799058654382535448.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002103209.875124-1-andriy.shevchenko@linux.intel.com>
References: <20261002103209.875124-1-andriy.shevchenko@linux.intel.com>
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
Content-Transfer-Encoding: 8bit


On Fri, 02 Oct 2026 12:30:46 +0200, Andy Shevchenko wrote:
> As Sashiko pointed out in [1] the %*pEp makes the whole thing
> like "no escape". To add some sanity to this the used specifier
> also includes ESCAPE_HEX.

Applied, thanks!

[1/1] soc: qcom: cmd-db: Use %*pEhp specifier to add some sanity
      commit: 467173658f6c10e130025d4c358ae28a8c47a889

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
