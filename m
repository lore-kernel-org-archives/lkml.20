Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=145.131.90.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246885;
	b=TymJNlQL6ugbWQH6TeakgNIh3IdNlPsbfIhwx2IrPF1LlsoDjIAxN92HkPX1YyrILNd2
	 MelYWPkQ1QlvQmmmNyU0NUvOH+jTe6pzNlnVJFQkUHvaWvX9oP4QdWgXBYxpHTJNjtRAk
	 q1ktVD1cXRI74d52zhfxdREMyTFET8CleyEJNLZsC0ie18MHaFKOZaNHdPZGFhrfGe0zI
	 grshNqkdjCoIG5zxDf5DN9YcaY0kAysFQvgw9tljsHTDMeoownza2YDA1LLab7xbhNae4
	 AW1tJGSIwhXXDAiqixwspQUgZzG3fW4rRhVo//KHJF63+s6jC91MKHgBgL5QU4+qRdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246885;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:Mime-Version:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6xWtChXQBPQ1C6X5kt31/tO1McPybT42OFZhLYS5vtY=;
	b=v9zpSo3QwBdXi/Vi0GUTLth+DK2AmaRvghkaUT+XC3wJMJIrK1RmnNWrPJzreAI1UXAz
	 +bf0qLlNu6H8MqBS5S0mAmd3toFQx+O9TU6Ike2i1O+K+c2EF914J4fIjc+yhg2fDhLEh
	 mjH2kiPkVySDgok28iib5UUuZpYMRnyUJ3GxJ0yO37Y9UPCVzzur++vGgiZ1myFSsj9/G
	 /MVdSWFyjZlFpopenpXcWoZKgpOyIWFe2QRYWGB8n2LAzrREJ5tOxWJot9GWjLGiuUb7w
	 6rAh1YXlPLLD7XVIA+6jnMZ79UvmhfCY4ABNGLRLabfbIXXanPzzENQL7hZjZTnT2zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pyk.ee;
	spf=pass smtp.mailfrom=pyk.ee;
	dkim=pass header.d=startmail.com header.i=@startmail.com header.a=rsa-sha256 header.s=2020-07 header.b=AwUnEXQe;
	arc=none smtp.remote-ip=145.131.90.139
Received: from mx-out1.startmail.com (mx-out1.startmail.com [145.131.90.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4FD606A31A;
	Thu, 29 Oct 2026 04:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E4FD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pyk.ee
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pyk.ee
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=startmail.com header.i=@startmail.com header.a=rsa-sha256 header.s=2020-07 header.b=AwUnEXQe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
	s=2020-07; t=1793246876;
	bh=6xWtChXQBPQ1C6X5kt31/tO1McPybT42OFZhLYS5vtY=;
	h=Message-ID:Date:Mime-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:From:Subject:To:
	 Date:Sender:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition:Mime-Version:Reply-To:In-Reply-To:References:
	 Message-Id:Autocrypt;
	b=AwUnEXQe8jjmGNKY69pwSWMwD9M9i9BNIQtiYyxE8QunYdforYHC1A/CnsbKEMgAO
	 CT302c1+CpbfFJykhBwOJZO1XC0LV+J0ALv5K97MI3fGSDUUCvmPigAaj+/FLXp7q5
	 L2NAtbxDvAp+GLHi26y/3RmX+KcTOGE7tR/kvVEDrblxkBFh0YwjDmGabnnpKBdEjm
	 gWIYHaV3TneFwzeasAaeLk3jQCcDHv3tq5qJulS44CJc+6Umrhk5EZbknQLCNfhzEv
	 ctTsNb/HlSV9qdUMhpVRqFk0F3siA9onjARVlJFdHNCTcDTE86CBvRWYrESY2DGdpk
	 QnygcDQL5dRHQ==
Message-ID: <7c3464b0-db2c-4554-a055-4add944818f7@pyk.ee>
Date: Thu, 29 Oct 2026 14:07:49 +1000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: Jacob Pyke <jacob@pyk.ee>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Retroid Pocket
 IL97680A panels
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, teguh@sobir.in,
 Andrew.liu@moorechip.net
References: <20261025133741.100490-1-jacob@pyk.ee>
 <20261025133741.100490-2-jacob@pyk.ee>
 <20261027-inventive-hidden-ostrich-66dfac@quoll>
Content-Language: en-US
In-Reply-To: <20261027-inventive-hidden-ostrich-66dfac@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Please do not reference random 3rd party repositories for no reason.

> Drop tag

> Keep the entire allOf just before additionalProperties: block.

No worries, will address these in V2

> I would expect IL97680A fallback compatible.

I'll add a "ilitek,il97680a" after each panel-specific compatible and update the examples in V2

Thanks for the review. First submission so still learning the ropes. Appreciate the patience.

Thanks,
Jacob
