Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223463;
	b=bpoKifaI5ym+6EhgFEA+RaYtLCscHm3sdi2OuI3xCEnxmp+K/YTuT6fIYwuuxfcVs6Ma
	 oA4Y3w4qRdqHF212k0B0yeyPwcmK8yPe4+mq0OPAQYUdXRkGjMtUZM3OYAq1n+ceU+d9L
	 EGDeiZhDcmyf9grQUWzC9Sxi9ps3aX2xFC3GATwm3IOlO14cmlNAuLcNdLWYGcxPexn78
	 sXfNmV5SNNVI1WTNq9f8Wp3oPX1jDUJfrbLfAxNoqNHDDUyKAI8qLlgVvFttm8+TYU3ds
	 mVeJov5g3poltL0mKP+1guYqS+DpF8VrhDdM4+P4TkS6FwQXwMtS6++cR7MzlqoQi4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223463;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=G3Ba0p/h751/9m3dnnXnltfXm//v4b2yBGW0yblY5kk=;
	b=FExDtrvpXLS5Q6gmOV0pGi9PQyvv4xjiB5olQfLQxHGosfRrgAW68MnB9pxnbrKjKWvZ
	 UzLhzHu54bpybJP3rCMSw8QfV1JP3bA6uKYmG1A8yLFYZ26pacr0I5DaxErqAaheKzeS5
	 P8EEM8UahWAr3fCNhM/spz6pMWEy4F70p7BS0Sem441dLjObSTRDuBupq4HoJnhQmqEIT
	 JCbIljlHzTF5o58k84cqa1FmOUdvv7JGqObSAaOf1ex/lt3ReDiZCyh8EoYvaTueDz/Cl
	 dkOBUKEagloCqeuXZHos2owS4adsDLdzIOKRYgvS5nsIQHnKGWvdozv7ZP6q8wWuNVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IPLLgTIr;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E808606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E808606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IPLLgTIr
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23F2A1516;
	Mon,  9 Nov 2026 03:24:19 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A855A3F85F;
	Mon,  9 Nov 2026 03:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794223462; bh=JxhGBRgLcIwUFoRsO4Q7rZ/Z5w2PFVEbenlFpICHqXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IPLLgTIrbc1ltih/cqihkwzN7I5GATwEqDV4npsfe19gwNuW0ngAxnVPpDWwO0w2l
	 1kiTDPVcl/vqmYVpUu8MZkOlHvbYPotghjzRdBM9V+dJncb4HxjPryyWjn1NChuSCY
	 8J6MnRdFyQ87vzaM1vzEaztLf9+yYBvRDO2TUvP0=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	Chao Xu <xuchao066@163.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] coresight: funnel: inport schedule by priority can not take work
Date: Mon,  9 Nov 2026 11:23:56 +0000
Message-ID: <179422341587.3275439.15606482552305642928.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027151457.5713-1-xuchao066@163.com>
References: <20261027151457.5713-1-xuchao066@163.com>
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


On Tue, 27 Oct 2026 23:14:56 +0800, Chao Xu wrote:
> The CoreSight SoC-600 TRM, section 10.11.2, PRIORITYCONTROL, a funnel
> rejects priority register writes whenever any port is enabled. The
> current sequence therefore prevent the configured priorities from
> taking effect. Write the priority register before enabling the
> first port.
> 
> 
> [...]

Applied, thanks!

[1/1] coresight: funnel: inport schedule by priority can not take work
      https://git.kernel.org/coresight/c/533e91f192eb

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
