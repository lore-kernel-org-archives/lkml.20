Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47797378D8B;
	Tue,  1 Sep 2026 17:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282413; cv=none; b=tEUzqmGWAsxXmq0KYaz+HGKEhL1CkDwF0pkxmC3tUWCrp3vHjxnxSgU22bFLB8A/d7O3whjZs1tNpbjKSRyv4r1Zv7WgRe9XCKxEPusxiQQwxWVyyIXn362lppVppT5XJtXnEVuJxBOFFB6jMCNZYYd9ZpHBTrl7Qfj/FBDAjhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282413; c=relaxed/simple;
	bh=sNSa/voaOsHZjjRDqp25c+/MX+/wj6BeRzvBnb1IUhg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MKWocVO1DW71zHN7jW+tYLGctVrpH6FRlAckkDZ4NczCr6uOqEZPPpEzzVVYUnSq2Pkq+2+drtwHGu6SvbwHIfs28RIoID5XJIuRd/KcpRxBVbYljBZps7PqyYLxYeGUb2wVN59DzlFk5h0mXBXatiZgIeMcIV9/juMtzwPGflA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+9hs4x5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+9hs4x5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8801F000E9;
	Tue,  1 Sep 2026 17:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282411;
	bh=4X6ne0Uit8P26QhcBLgYQcoxfNjm1+NrZSLM/Ma+6Gs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=B+9hs4x51CerXJGm2Kz2FazK25vRVZnw8AXRDpfnZWrX6t83Agp7ZgfH9lRIsU2sc
	 PV4wRQI9tH3q0oA9/9/qU6HPvtJVVLCELewZG1LQI53enGfV2Bw8QO90JQrrIo7bCI
	 QHl52OrK262QmCjAHB/ahRMvx+nPPAVr80PT0YJXFP7GnZGApwHmJbqOixngb0ppbv
	 2bTk8QJ7q62nTpcT+YszZsOfQAhdF9mo/KdlbVjeekMthdnJgYnBUon/zEVrelLr5k
	 tlZFEFPHh13B45ZcgKCOPoFoUoAeD0cF+gaEQq8GkdiR+zj2VSdmXwCP5yZhIrthxE
	 lvly1PZVaNbcg==
Message-ID: <3b916a31-3da8-47b3-afc0-51c9d178e645@kernel.org>
Date: Tue, 1 Sep 2026 19:06:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 13/19] thunderbolt: Add QUIRK_NO_DMA_PORT
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-13-44bc9348683c@kernel.org>
 <20260901090439.GD106095@black.igk.intel.com>
Content-Language: en-US
In-Reply-To: <20260901090439.GD106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/1/26 11:04, Mika Westerberg wrote:
> Hi,
>
> On Sun, Aug 30, 2026 at 10:19:31PM +0200, Sven Peter wrote:
>> Apple Silicon machines load and update the host router firmware with a
>> separate, proprietary mechanism and have no DMA port. Add a quirk to
>> skip its initialization.
> DMA port is Intel Thunderbolt 1-3 thing and not expected to found on USB4
> routers. The current code should not even be trying to find it, if it does
> then that's a bug that should be fixed.
>
> USB4 router firmware upgrades use the standard operations and if those are
> not supported then we just don't expose the corresponding NVMem nodes.

Yeah, you're right, I can just drop this and everything still works.
I think this may have been broken back in 2023 when I brought this all 
up for the first time (and still had trouble with the Type-C PHY and PD 
controller which is why I didn't try to upstream any of this back then)


Sven

