Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991D842AFA2;
	Fri, 11 Sep 2026 08:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113858; cv=none; b=ZenS74j3OcGKBRq2xmrXr+ClKJ26VSmXRYhVo+1kzs8/dktKQlHV9dMu1KY01FbhxWzYulgOciAVE5P6J20kUs+z9TgP4T3oVoAqtof+0npFRjrQYu3q/zAfXbL+iW14a8u/wF2PCe/dsVrNx/gL8uAioCPaPS4Utn4opxOQQdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113858; c=relaxed/simple;
	bh=8GaiVg6s4uQWj1gggoVsaf4ZLAPqVyr2yymvwbDBnaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eAGmlnG247AiYpZ0IiW17EmxN9BCe1VREiLMjyLKLRYx1EqG0XY/BaMjmbaaVoqH17lgyWAV8p+zmZaj+sFSrtnGe8uvyYLscsVAbj03bDCMamQzZ/TlH6xw0SVTE6NY0BW0DXt77YdSokrssGBtOq8z1ogt0pkBGRQ7z1m77Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.102])
	by gateway (Coremail) with SMTP id _____8BxW_D3taNqzuIKAA--.31869S3;
	Fri, 11 Sep 2026 16:04:07 +0800 (CST)
Received: from [10.20.42.102] (unknown [10.20.42.102])
	by front1 (Coremail) with SMTP id qMiowJDxBc30taNqsjkfAA--.39557S2;
	Fri, 11 Sep 2026 16:04:07 +0800 (CST)
Message-ID: <889faf03-1883-45ce-86f5-756940bf1bb6@loongson.cn>
Date: Fri, 11 Sep 2026 16:01:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] edac: use named initializers for acpi_device_id
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
 Shravan Kumar Ramani <shravankr@nvidia.com>,
 David Thompson <davthompson@nvidia.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260904-acpi-edac-v1-1-ef93d60bbda4@thegoodpenguin.co.uk>
Content-Language: en-US
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
In-Reply-To: <20260904-acpi-edac-v1-1-ef93d60bbda4@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxBc30taNqsjkfAA--.39557S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==


在 2026/9/4 22:41, Pawel Zalewski 写道:
> Use a named initializer for the acpi_device_id fields which
> makes the code more readable and consistent with how lists
> are initialized in the rest of the kernel code base. Also
> drop explicitly setting fields to 0 where it is redundant.
>
> While we are at it - unify the list terminator to have
> a single space between the brackets and no trailing
> comma.
>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Acked-by: Qunqin Zhao <zhaoqunqin@loongson.cn>

Thanks.

