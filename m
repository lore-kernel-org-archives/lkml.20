Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17933F8ECA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913174; cv=none; b=mFh4v6Faz7tuyWtdfnbWP8CpwCPx7VEo+ZI+t2385/bJQ252rzaXC8khZT/9Z/0H/MDfc4uqFx/5tUmEcKzqPGATCfEfhK4rNJW8kgvI1CksWGG+UMUHAEf6Mqgyz+dft+b9DXRtPlpqYDly6m9ciY2x0DEu6bN/3Z9BauEtP7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913174; c=relaxed/simple;
	bh=UJnV+cllfeOv0VeeSIei/FJsmHfrLvqxs1SP2W1tkwM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cR1bxxB0S/GS8CupMcfnERS7zWPnDcCnMs55+Rdib7YokQCd5v/kSCGfFqYE/k/MNsR3SRUsrTtU9KoP6QA3Ctx5Q4CCo+/Hm8/j9t58wML8ILaSnsLMRw5ZlLGujqRgXm93Jj2aLpBzfXeVwGQvo3cQ5Hmjo58mYyZexJAcw7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNV6cJmD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNV6cJmD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BE21F00A3A;
	Fri, 28 Aug 2026 10:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787913172;
	bh=UJnV+cllfeOv0VeeSIei/FJsmHfrLvqxs1SP2W1tkwM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=SNV6cJmDYmhTes86sL7gtL7NvJNpQ7h1iJs/ndBn7MU61XXbmDVf5lkSMp5w1mTHv
	 mbcdaS/PQLenxgIV9vh4IwivYCB/wBL7dlVCzWj/o2gl+Lv5KZx4g+cVdnGsd+8qBx
	 Ec3196EYuYG2p699hLeMSxAiGj5H7oBp/2I1ZL+R8+XCKueUCWCHPBEsogbu4IyoZf
	 ahpfJ7KzyHPTPSAkpKkvTLmwJyC2GjaLAAsacCDZwJLpDV6slRaTrWiw4lQASMYvah
	 CLOCz/lWMBtzVEV3br7+YEXVVWqoagtgAqJn4q5o4rGKjcKW9utcFmPaTkz713qzYD
	 UDY4e8CjtLQJQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4B445198003A;
	Fri, 28 Aug 2026 06:32:50 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 28 Aug 2026 06:32:50 -0400
X-ME-Sender: <xms:0GORap9j1MT_suefMlkjp33LUpCrzOlygw7ZXkoliwh4hEDgKCXYcQ>
    <xme:0GORaogYEjTsytuYcqTjoMuVVuO-ka7PS88C1PQYYsPRYaaWmVTNBxCOsAAB74A_j
    rg4r0hEnF60I1m1VUAoUorgZwpp-ZGT63ZRc9GzkZh2kmbhxwOSXeEK>
X-ME-Proxy-Cause: dmFkZTFZLtHyc0mfoLhyYS2kAfo678+yTRdZrbHWl//oP8sLV8EWFLfFZ3lao6PZpFjixZ
    WOeEAwEfA7ymvmUzQAGYm+bBEfMXiH8VpjDXsvRjl2uniLh63jJT96oL5pk1E2IA+ARxIW
    xAuAOX2CCYFzBRMmXQnOQtMSzcwO04OSiFHrv7FsTJCynFXyS2sgihBhrLIFaLRCEuxQ/1
    22aOWCbwfQ1rqlQwPMx81AL/aH66i4KQEmI6LYniqDFMUwKKIWWRkfQO9EN3wtNTJvrjCt
    wBFX5nDQgHQinLndZ1fp7rMxlP54kCFtgdhg6e7iiPfrRw15cGYR5JJbE1EI3xDoQHfzfa
    VmCgzDzuKxYHhmbdAXTxW27+GCagvcK58UPLxLurAAgifxKEKiVtTvg3ErP4iUvRJQPdA3
    K1pED8g5b3DGfH29/Z25lUg2yFnxq1Ty3qpwn+H2no6FxA+PWJMP8N0GaMocPod1nXSPZF
    6D5wNQndPO2JylJpu8WZ+cTk52FCGaxZyzo5KC+1vRtBVpOEZ9zua/GBzItlHkLvWvWzXL
    6cA8vB5QB3eEep/XX4BhZi0rW23O/+g+KeA4ssaZDg9yiBBb7q+KN7ewGnFLBJps3JohZ3
    1pi3tVl7WwwRgYaIVN6e2lkyG9hfFLp4fMeIByf3KTGX5TzBnCHuSaSn88cg
X-ME-Proxy: <xmx:0mORareFdZLu45K-4oivNGhH5lPQTcrtP14-RsP9S1ZwEhuRffw-RQ>
    <xmx:0mORatNWmMmyARe6MiJoV-l6nuZqJwd44ZU7y2hVIVR6tLn6RMwjxA>
    <xmx:0mORamvaJTvNhfXEX_cH8iw7wLaejBQK0tfBmvzXt9-JxO8mVZrySg>
    <xmx:0mORauABsogHBrkn5DhDRfufz8Jt0bxzsu6gknAo7b7XTx8EcN0kGw>
    <xmx:0mORalbhF6NkTBzKNpdSHdEyrj0iGwQIEkRubrZah8RUCbB9PIR2e_r3>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 53211F8007D; Fri, 28 Aug 2026 06:32:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 12:32:27 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Bradley Morgan" <brads@mainlining.org>, "Will Deacon" <will@kernel.org>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "James Morse" <james.morse@arm.com>,
 "Marc Zyngier" <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <4cc971de-2fc9-496a-a5f5-002bd6b6bd43@app.fastmail.com>
In-Reply-To: <20260825205839.14571-1-brads@mainlining.org>
References: <20260825205839.14571-1-brads@mainlining.org>
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Bradley,

On Tue, 25 Aug 2026, at 22:58, Bradley Morgan wrote:
> Everything object compiles and passes checkpatch and sparse. I could not
> boot or run a hibernate cycle on real hardware here, so that still wants
> doing before anyone gets excited.
>

You can easily test hibernate under QEMU/mach-virt: just create a file on
the host, mkswap it and pass it to the VM as a virtio drive (e.g., /dev/vda)

You can then swapon it in the VM and do 'echo disk >/sys/power/state', which
will perform the hibernate and exit QEMU. If you then restart it with
'resume=/dev/vda' on the command line, it will perform the resume from
hibernate at boot.

I've had a go with your series on a NV capable system (Mac Mini M2). Without
the series applied, I can hibernate and resume 4 vCPUs without issue, so it
is not entirely clear to me what your series intends to fix.

With the series applied resume from hibernate still works - I did see one
intermittent failure where the secondaries failed to come up, but I only
saw it once and so I cannot say for certain whether your series triggered
it or not.

Tested-by: Ard Biesheuvel <ardb@kernel.org>








