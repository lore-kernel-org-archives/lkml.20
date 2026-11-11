Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416461;
	b=l00RaEBpUUgMlapS4p9du9fvaQQCtR1UOm3ZTCu6rM41OzbQVK2tfKyjVlQCuaqz4N+4
	 ma2tjhxEff8GRJlGOwadFaSVBG1ftbQTW5KXRiHRcfUEKbLDt+QX6094N5Z2fARry1Q7J
	 T3NZxu4AfX4ClAiPZZFiXw8Ud5V6BUwKGM+i6nVFnF38fQYCPS3OHcfzKMzv+W4SZFVAy
	 MUCouw9UbJc78T5Ns82TXrPpl/9aM16EXrLwfn4xXywpRJzs0IFyxc58YGK9qU1jUNMMe
	 89Dc/k0eJiwOUDB/URQnKyqBsgqiz9J24TcA5cx1SX1LG9iOk+2Qp7FZowSeQ3VOWhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416461;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=PPAtSBIyb7Mc4z7TThL4xmlJYMwdUa2O9DNxDimc1oY=;
	b=xwQTmtG19Rn1FMLQ3Pm5Z0mMMLlZREez6cjeK2OIA1gwOvM07lgPD1B37E8v658ngX98
	 dJAyIn48n0pehtnuAo2ay8SHFGq4Wd63Sg9dWZ5qZiW4JYDuRSCzKMg4JxgaIgo1q1JV4
	 Ldpmq/lHnhI3ECo5QSUaGPtChGwbPF2hgl6ywsvtzrezXmJSuBSTSmjXg5FK02apxRpDw
	 Z3hDXXp2I41F5zndZh74ruJBL5f94eIICyatQ6TDU1VpP6uhkZ90hQkvEBBoKkM3ohNEc
	 SJJSA+A/qp58x7p6xky83EzDO/rmravkwvyoWsRZ32jfUY/4QoGj/Ay+xpP44XZ2Nng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAc11aE9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76239606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAc11aE9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D511F00A05;
	Wed, 11 Nov 2026 17:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794416461;
	bh=PPAtSBIyb7Mc4z7TThL4xmlJYMwdUa2O9DNxDimc1oY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KAc11aE9RtMHFKRldONd7qnLSpOj6Gf0Lc/I4PrbhnoFFp6cqPrIhMKgc9uemS94R
	 /8rczeWU+x1mUfxq/kqfKh3ewi87f7VupeHfdlHVDfF491yCLnJ1piS0lwgi2igJ5Q
	 G8k5wU+jWiUBXEN6bzHfl+joUz32Fsa9T7q9KMfN2mk6yCZ3X2mZrMJzgyV3coLjcV
	 q2O55UIzYNPPXNWcAALTDFJDzaRTw8NTxLXGtwBmY7CGgD4emsQkedNF9QM1NrbzHU
	 KURIAAg081TzqB6B/vmFeaFi+qckP0XiXQ2chbwFr+UjtdYJIa9NKKFURS2e4wSogH
	 MeV0hshJmYofA==
Date: Wed, 11 Nov 2026 18:00:58 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 4/4] Documentation: no_hz: Add tick stop in polling
 idle
Message-ID: <avSfSoAmG4RauC5L@localhost.localdomain>
References: <20261111114406.346953-1-marco.crivellari@suse.com>
 <20261111114406.346953-5-marco.crivellari@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111114406.346953-5-marco.crivellari@suse.com>

Le Wed, Nov 11, 2026 at 12:43:50PM +0100, Marco Crivellari a écrit :
> On nohz_full CPUs the scheduling-clock tick is stopped while polling.
> Update the documentation accordingly.
> 
> Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  Documentation/timers/no_hz.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/timers/no_hz.rst b/Documentation/timers/no_hz.rst
> index 4006cab64079..86cea04d2a49 100644
> --- a/Documentation/timers/no_hz.rst
> +++ b/Documentation/timers/no_hz.rst
> @@ -246,6 +246,8 @@ Known Issues
>  		be even worse than that of dyntick-idle.  Furthermore,
>  		this parameter effectively disables Turbo Mode on Intel
>  		CPUs, which can significantly reduce maximum performance.
> +		Note also that on nohz_full CPUs the scheduling-clock tick
> +		is stopped while polling, as in the other idle states.

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
