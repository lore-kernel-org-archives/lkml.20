Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794410645;
	b=tNMGBAT9mgEB4qAtE4Bq0jyxd+jhQJQ4Yd/XVLRLgLnWrCeIAqS/YbekYzGk36Czkzw3
	 8YTUneeemfV0tT/eZlm3Gh8nJt4swt3JpzZfLorBtM3IB4D7DWz1u7fChvwcai2kuZppe
	 irhneXLEs9PURapnc4j7lWrOMrE18ITbDIaAi1+VdeNrBQblEVZmlMyDspdPmYftaTQpY
	 TiSOFHfV5+q/PEnVTZ0YKn+Jka5orVs1g2OvrpKKVgo7FXlqe0wgiy/idrqa/RkFjmXHu
	 kmYQjQS40BBjZD4ez4ShrvkqTQXmw+Wakbiv7AJPAkt+S3YNWh5aIIbzqP7OnyGZwMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410645;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=l8E6CAg871M6o26VCTM4QGlPjPFhAzOzf3/AvOe/bZw=;
	b=XCs3kAg1pIIg5YEsvGOkTIYfdxooVjWgbST4r3bG0SLRnOKQecubQLuOXS7jqDz+5klg
	 /yK57AmbKkKJ7jhx1SkCpUJehYAQfHRAS9D9HaExyXTbGm/5rcbaAXIrBrKB/wcQJeiTF
	 iUDlHsf7aujt9noqLSZ4zxJPK+8bTTMcWTyS2+AlHRXD8uqjlJX9GrygCi58nXcOghK2q
	 ORt3ZkhFWahpXoebqEhpRHnLiFB2/KiSgkHnLSinax0OafIRn6UaZEhqCf8POttM+BVh3
	 mbMdLZQN2Nq3pRUBNSPkKnwEBIZhdKBfn3OjvciXXJQuI9EwvB3UBGSSQ0wPRJ2jlKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mVMUlHyQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD20606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mVMUlHyQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0B81F00A05;
	Wed, 11 Nov 2026 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794410645;
	bh=l8E6CAg871M6o26VCTM4QGlPjPFhAzOzf3/AvOe/bZw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mVMUlHyQqTAVZ1c4DLJvZbwcCJgUDUZpTbYZkG6wrtulkAMbkGPxk2NZdUwcFVBqq
	 lmDEBuJa+vz44ituuC2uC76Co0foxlZON8fGb7kTjDNQzmZQnCltsiLAzLPoVKAa5z
	 Tvyihu7VOquOgvua+XMrM+9/FL6BV3IbEmX6+TFzjNJU1aWhMudXLYRcCXp4whCSiL
	 X0qNUBZbN6Fq4vx9VYqQ1lzsErh2qs8jU9BzR7DEuCobvL2Kqbyn/CKU5GVneiom6o
	 pB9QKRPvjdFUmJasukWWGqNvxWDl2reGfRiZdfGHHqWxDnnK1q5aZ2/OS7AfBXyc+O
	 mipV08l5OL/Jw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Reid Downing <skibletz@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261109134708.263012-1-sashal@kernel.org>
References: <20261109134708.263012-1-sashal@kernel.org>
Subject: Re: [PATCH] memory: fsl_ifc: Do not dereference the unset global
 pointer in probe
Message-Id: <179441064353.189405.12967857924485810562.b4-ty@b4>
Date: Wed, 11 Nov 2026 16:24:03 +0100
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Mon, 09 Nov 2026 08:47:08 -0500, Sasha Levin wrote:
> Commit a78ee2e05f7c ("memory: fsl_ifc: Clear fsl_ifc_ctrl_dev on probe failure
> and removal") assigns fsl_ifc_ctrl_dev near the end of probe, but probe still
> reads the IFC revision and fsl_ifc_ctrl_init() still programs the event
> registers before that. Both go through ifc_in32() and ifc_out32(), which take
> the register endianness from fsl_ifc_ctrl_dev, so the first probe dereferences
> a NULL pointer.
> 
> [...]

Applied, thanks!

[1/1] memory: fsl_ifc: Do not dereference the unset global pointer in probe
      https://git.kernel.org/krzk/linux-mem-ctrl/c/1a509eca07176bc3363031c030d038ca9be9dfc0

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

