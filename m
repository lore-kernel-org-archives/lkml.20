Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA67637C0F6
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.116.240.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789804425; cv=none; b=LICRbvoCDtfRMGn2lYIwg0W/D0kTzc+J4RXROXZOWK5VNHJES1vFrnpwnuXoqm3J3gn61J+So7AJx/+BPSXtX9vuT2DGzAOyvdO4kge+cFXSVsQxMA327gaQj7tGlmSMB+DiPaFC/cWc9yZg2rOEjgG5H3eoc56HotIFOLRqs4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789804425; c=relaxed/simple;
	bh=fqh+Vg/0RXujtW+aoNMagRfaguimc3bCi6A3l9CfVBE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=db6/wNvAsa0fyE8E0K/TnLgvnsW6T2U4GV2AGmnC2/r5XxNPXddLj3e3oWAu0ClsGZWT+5Oz3HUquI6xl9IWCefbKoidMFcd660WCMpq03I3Ip361b9jlN4KRzMk4RA7bAvy1vTa5FkppHMHA433HfiqaF6k9WEYClGbiv6/Jf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu; spf=pass smtp.mailfrom=arkamax.eu; dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b=oYPKntqD; arc=none smtp.client-ip=128.116.240.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b="oYPKntqD"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=fqh+Vg/0RXujtW
	+aoNMagRfaguimc3bCi6A3l9CfVBE=; h=in-reply-to:references:to:from:
	subject:cc:date; d=arkamax.eu; b=oYPKntqDrXHD4vrhb1NxQYqcKg5g+cHppazfm
	JJb7qm8jOA85IV06MQmajHC6vMRv2FvLVx5JMKqj5KdOGOuZ3uubDcf5VF775Pvc9ox+0S
	nUS5PVkQr2/gazHsoBbFMKUawFyQK1IBqirpx5pCByzci0sYFd6mhbtOaXLF2P00Dv8yen
	Y24hEIDhCiq8YbpYE+JlC4M/K0e8paT3aVlpAjzGs4davnABUy4G8Q6ac8Y7mRskwYaKtS
	6UKd0b6Xzb2Lr2gNqDzIO8B6hH9MgDjGVd5SuT1BR/5LpE+SuUYUtQxaLtqgmtFTDVsbFG
	hoHK3bQOAtybTJBGH1JEbsJQA==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id b609f343 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 19 Sep 2026 09:53:33 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 09:53:33 +0200
Message-Id: <DLJ4POIDTYXQ.2AOJP9BJAWEOX@arkamax.eu>
Cc: <hch@lst.de>, <sagi@grimberg.me>, <kch@nvidia.com>,
 <linux-nvme@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] nvmet-tcp: report a bounded MDTS instead of "no
 limit"
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
To: "Ing. Alfonso Kuen Arroyo" <gerencia@idkmanager.com>, "Maurizio
 Lombardi" <mlombard@arkamax.eu>
X-Mailer: aerc 0.22.0
References: <DL41D2NGEUHW.2UUHTZ6LLM9X7@arkamax.eu>
 <178978683646.43804.6940923486189370705@idkmanager.com>
In-Reply-To: <178978683646.43804.6940923486189370705@idkmanager.com>

On Sat Sep 19, 2026 at 5:00 AM CEST, Ing. Alfonso Kuen Arroyo wrote:
> On Tue Sep 01, 2026, Maurizio Lombardi wrote:
>> #define NVMET_TCP_MAXH2CDATA 0x400000 /* 16M arbitrary limit */
>>
>> So the comment should be fixed, it says NVMET_TCP_MAXH2CDATA is 16M.
>
> Agreed - the value is 4 MiB and the comment is stale; it predates this
> patch. I'll send a separate one-line patch for the comment rather than
> fold an unrelated change into this one.
>
>> Also, it's not entirely clear to me how the target enforces this. Suppos=
e
>> an host sends a 2 MiB command, violating the MDTS setting, what happens?
>
> It doesn't enforce it, and this patch doesn't add enforcement. MDTS is a
> limit the host is required to honour (the base spec says the host shall
> not submit a command exceeding it), and nvmet has no per-command check
> against it, neither in the core nor in the transports.

And indeed this is what's missing, because the specification explicitely
says that "if a command is submitted that exceeds [MDTS], then the
command is aborted with a status code of Invalid Field in Command."
(Identify =E2=80=93 Identify Controller Data Structure, I/O Command Set
Independent)

Maybe it can be added separatedly with a dedicated patch.

>
> What the target does have is the hard limit in nvmet_tcp_map_data():
> since 4a3f00262a04 a data length above NVMET_TCP_MAXH2CDATA fails with
> NVME_SC_SGL_INVALID_DATA | DNR before any buffer is allocated. So today
> there are two numbers: the one the target will actually accept (4 MiB)
> and the one it advertises (none). The patch makes them the same number,
> so a compliant host never builds the command that the second check would
> reject. With MDTS =3D 4 MiB, a 2 MiB command is within the limit and is
> served normally;

Yes, but your patch sets NVMET_RDMA_MAX_MDTS to 8, which means 1MiB, not
4MiB, so a 2MiB command should be rejected, even if it's under the MAXH2CDA=
TA
limit of 4MiB; or am I missing something?

Maurizio
