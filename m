Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DB139891F;
	Wed,  7 Oct 2026 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365358; cv=none; b=F85z/nWyQfqHsH/KiZzfUurTnve+4PgcQXq5n/YB3H/0l2h+jzcQz7nQCVtt6wyiHywMJnb/J5dZH+8ArSIK65mZEKkGn33dGQmvbS+IScT+EBE2CvYQaAOngzENTVP7DqGQtFBmT3J4rwvf2PMNe08cURkTnGCMW6UNmPmZXSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365358; c=relaxed/simple;
	bh=LhZg6aNeVmAeQJORhmXXI5psCyiE6Iz7uZ/YX5DC4Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qaUH4FGSiObnHsU/qCMI7CMT1rs4vZJ6gsGtWnHJT+KUZ3bIrK6r26CvzvOv9lShaL83kxxJvYiPEOW9Tg3M837SMlapvo6T2s7PBZsJrQ2lJhZ1OatkDLYHHOBfN0JBQX5xlaGUkdqGJZXIbyHwRaFkwn0Nbr4sk0xDL9IePUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W3LJw9rB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W3LJw9rB"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A99DB2C6;
	Wed,  7 Oct 2026 11:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791365225;
	bh=LhZg6aNeVmAeQJORhmXXI5psCyiE6Iz7uZ/YX5DC4Mg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W3LJw9rB9hQwl792daoWDBoZ40IIIzqezghZbJyLTZ0REertsNTDutTqzrKV1OfMx
	 D+gw8BUPP7noVoEbLvf5FukbJXz8DfxuSJ4aojpIxJQyu/5XxUBO7FUSRt7is6W+/i
	 uF6M4bee3xw9G6w6GkYw2X5t0Lh5ejd+Ba+l/3tE=
Message-ID: <f7987857-7516-4184-9a50-2b42a2d01234@ideasonboard.com>
Date: Wed, 7 Oct 2026 10:28:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: mali-c55: Allow wakeup source
To: Linus Walleij <linusw@kernel.org>, Li Youhong <dayou5941@163.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Nayden Kanchev <nayden.kanchev@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org>
 <20260929-mali-c55-irq-supend-resume-v1-1-e3af34afff12@kernel.org>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260929-mali-c55-irq-supend-resume-v1-1-e3af34afff12@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus, thanks for the patchset

On 29/09/2026 13:02, Linus Walleij wrote:
> The Mali-C55 interrupt can be wired as a wake source on platforms that
> support it. Use the standard wakeup-source property.

That's interesting! How's that work, though? In the RZ/V2H particularly the ISP is in an offline 
mode, so I'm struggling to see how one could trigger the interrupt whilst the device is suspended, 
since you'd need to instruct the IVC to queue a frame.

Thanks
Dan

> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>   Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> index fc4fcd19922a..acd57799ccd0 100644
> --- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -20,6 +20,8 @@ properties:
>     interrupts:
>       maxItems: 1
>   
> +  wakeup-source: true
> +
>     clocks:
>       items:
>         - description: ISP Video Clock
> 

