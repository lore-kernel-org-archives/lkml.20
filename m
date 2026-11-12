Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478419;
	b=itU1BceNh9kC2B21MTtA2WDcc6tArOjZoFqy6RBmWKmn7MhfLK5Fq2Hk2j9IVs5WX7wI
	 mVpkElO58YJz8kANBuIUwOGu0zCLzdv9OfEy+x5A03uo2UDuhSrogdKdMUiblHZ1JbOzb
	 nYAeKBWDE2xUq9RKM3EtrBeoZCO2hGce2kcZvBErFK6lKeB6qVT5RZYyWtX8CmPZ8r1Td
	 pyU0Cjuc3HCX68bSTy3oeaADk+fvcTaazlcdWUncCfzO/YiRTzBL7pMtU+XENtdPiFcrU
	 qeCqEJnwmEef2gj4Z1Ack7NYnjOSFMa4jXTZdoCWOZZ2zcRl/tHcsPypnn0fW4qDjnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478419;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ZmNNrkYoDlObKGEWXN/NM8TQ0vBE+3eTJ9t0fVYsCNk=;
	b=dde+jFhNZoGYMXZwa07Y4ifaCEvURivHnJRhxXHCbKQ3DvK2PBFB1IrBcTP/V4b9ltcu
	 ZOCadUy4EPZJFf6AzLoHl5OR8RQnsWdaOkfvTt/Q0Aq9mXQjLNgNizk3yq6+3dx0MJdJA
	 BuCjsp4aQpdvkr+uczY+fzKfNuBGnAPRJI7RMw3piUIYZYnWjKmTOsXCob6GDGLqU7YxZ
	 U8pKibPvSCMlppJHJ3ESYXRiGQTJgWF3NVQhCXzSdlXOkU1b6mhauLCTZ2TEUzLLMJSJt
	 gp7BGJXv/AmRvNjekIcfTtivSuMB2QsyPg+RO4kCyLnt4lwKj3ytQ5uxrVLkqtmgGLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGTg2ZDf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044CF606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGTg2ZDf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24AA1F00A05;
	Thu, 12 Nov 2026 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794478418;
	bh=ZmNNrkYoDlObKGEWXN/NM8TQ0vBE+3eTJ9t0fVYsCNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YGTg2ZDf3iYzt2uYHKEqZhYIdqLwemfsaiXCvrbzHPTvXrChKwnX4kZuFOLJX3VRu
	 2w5jyR403QHNohpvEprbr9c0+06LLW7cCLHgl5qf/wSj9AnZ1aQ60yMGyh+DopNZ1o
	 T0oERaGZ7cobW+IZ2f5Ob1uc+2IPxbI1nvK50I94uiK2kSYd1tT2FLrQzcXQvFcJID
	 b5lHiZLpE2BnhbCnvcnVDy9F2ysWmSOu/IZdirBBZpLG+vpPVVfpogoYfeeU8twVXZ
	 C0AWUYxpM9IBngJum+WCKEhlNBl9WtSiNV+T4b4BJN1LxGJdKeAIQQVASqTylhcD8j
	 rm7EFKnqbSYGw==
Date: Thu, 12 Nov 2026 10:13:34 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-kernel@vger.kernel.org, dario.binacchi@amarulasolutions.com,
	Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] firmware: psci: handle unsupported
 SET_SUSPEND_MODE in PC mode
Message-ID: <20261112-attentive-gregarious-beagle-9c1fbd@sudeepholla>
References: <20261029191624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid>
 <20261030-origami-tarantula-of-contentment-a70ab2@sudeepholla>
 <4690f55f-dc13-4e43-82f9-d508253f6c64@foss.st.com>
 <a2432129-613b-4f17-813d-82ac8af9b6d6@foss.st.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2432129-613b-4f17-813d-82ac8af9b6d6@foss.st.com>

On Thu, Nov 12, 2026 at 10:40:48AM +0100, Patrick DELAUNAY wrote:
> Hi,
> 
> To complete my previous answer,
> In  last PSCI specification v1.3, we found this description:
> "
> 5.21 PSCI_SET_SUSPEND_MODE
> 5.21.3 Caller responsibilities
> The caller must be able to cope with the following error return codes:
> • NOT_SUPPORTED, in which case the calling OS can assume the platform will
> work in platform-coordinated mode. In this case, the PSCI_FEATURES feature
> flag 0 for CPU_SUSPEND is also 0.
> "
> 

Yes, I can't disagree with that, but ...(see below)

> My patch only implements this behavior:
> the PSCI stack in Linux assumes PC mode when SET_SUSPEND_MODE is not
> supported.
> 

To reiterate my earlier point: if PSCI_FEATURES reports that a function is
unsupported, we shouldn't invoke that FID in the first place. Dealing with an
unexpected NOT_SUPPORTED return from an advertised FID is a separate case, and
we must keep that handling unconditional as it currently stands.

-- 
Regards,
Sudeep
