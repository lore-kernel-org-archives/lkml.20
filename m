Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404953;
	b=dLo6qtxvfgiq76wamRgcPp4G3/AwX4kOiQ/kBM8N0XJs/thXPn/RWd0lykit9cP0Vql5
	 250rl2Crpi0A9t3CAFkW9DaJQWhrlfZ73gnR1Emh8KvS8lG1PBlp5zJgwBw7i1WpwgGzp
	 nKBScaOU4ohMpnUEkgBvykv2Nk3x2PFpWpQWKQZzhclhZdQblolPXBkUW5kkyo+Ebo0IK
	 EnQLV+aFxXYBzAq2Y8/teKoVOuKzehjRUKz+86Lm69+c1o/PzhJq29zWgsgVlKVMszk3l
	 UnNuUIjSp0mDU6iEknYWMHGlJOC5rg85S+JXdOknNC/PiKT2lf21obeXvV1/P94f85Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404953;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Qdx8SBFr5A9el3l62V1Hnpyo8SLW7HjNDS/vMXmANvM=;
	b=bmIEsnjelFDDUV6uguEFEXpS6mlWWiE/RCucd+LOlCDk6SDDK6SGRWWVlsjw/fiU8VGS
	 af8oOjmd2wRcnxj3GjjLWsvoekxXUxtI6f3y3O+1H0bMYxbR4rzUUeosEQ7iTaOdCHh4U
	 gm9ccQgugypr/ws4UXVaELYJ0gIBxtHRWH/gOJtKroEa7QARvOTazlS0oCNn2EqHZaR0W
	 SmoWgw5RvFmUqUd9QEzk4CQTmfI0Rdr1Sryo97LI4fhZ13P9gGys1UwJfsNDbOkenKEVh
	 zYjZkCGoK/e8+bDqVRXVwk068L0APvTd5Y/VqsYRsya9gAxoOuVDPLz/kwK/mItRamQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHGSC6rH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C69606A326;
	Wed, 11 Nov 2026 13:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHGSC6rH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C871F00A05;
	Wed, 11 Nov 2026 13:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794404952;
	bh=Qdx8SBFr5A9el3l62V1Hnpyo8SLW7HjNDS/vMXmANvM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=kHGSC6rHES3fHGZkuagSOTPK0LWKUZKCjuI+lKf1BasID5OyztlT+Ko/nNpHMz4Sv
	 vPAcVMYZPLUMmmqJCkf1oJjzzW6wkhqQ8ypErW107oHctP34/qcyCdss4xUTb6qQja
	 nOqGHv5GsAovhkdPZxCk1ybqg3zw7k8AXnC2viWd6wc+BVvA6sXa4KHjdNry0+KKQ3
	 M9neRAmq4YT8GzC/oY/GKN2OGEC1piS7TW9gn7ccAXrbMDsGLeqgqOQ4Ui0G7OvsxZ
	 aUxrSMvyzFwDzfCJUFgYI6yA9/fWRUlZxJVj5/nuV3CRsGjZXBe78pwJwitdKROhku
	 Fu43Uec9NT9ZA==
Message-ID: <5b068d22-4f46-4f82-8914-ffed5a0f6f0f@kernel.org>
Date: Wed, 11 Nov 2026 14:49:08 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 0/2] media: aspeed: order probe cleanup and last close
To: Myeonghun Pak <mhun512@gmail.com>, Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jammy Huang <jammy_huang@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Ijae Kim <ae878000@gmail.com>
References: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Eddie or Jammy,

On 10/11/2026 05:58, Myeonghun Pak wrote:
> This revision requests the IRQ after its dependencies and synchronizes
> IRQ/work before manual probe cleanup. The second patch fixes last-close
> ordering and keeps the engine available until VB2 release completes.
> 
> Compile-tested on ARM64 with LLVM, W=1.
> No hardware testing.

Can you review/test this series?

I don't feel comfortable merging this without your OK.

Regards,

	Hans

> 
> Changes in v2:
> - Rebase onto managed reserved-memory initialization.
> - Remove the research sentence and Assisted-by tag.
> - Join the IRQ and delayed work before manual probe-failure cleanup.
> - Keep VB2 release before normal last-close hardware shutdown.
> - Drain the IRQ producer before cancelling resolution work.
> - Balance IRQ disable/enable within stop and check STOPPED before power-on.
> 
> Myeonghun Pak (2):
>   media: aspeed: join IRQ and work before probe cleanup
>   media: aspeed: drain IRQ work before stopping the engine
> 
>  drivers/media/platform/aspeed/aspeed-video.c | 38 +++++++++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 13 deletions(-)
> 

