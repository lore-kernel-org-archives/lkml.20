Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320559;
	b=EXFpyTNs6Uo2NpNkIbEaVWvsnWXRUL8fquLFIUeERKlledJQLecbRNdSpLc4bQqnwgEx
	 GVTAZI329HsZOrkWY/rg5VrZCxZUww3BmxmsvpB9+xBl3v+bCXPcPiwQWASG66pqdZWi9
	 nuqQ8iWMfnMakno845bK3QTV6kMZ7Hwdef7Jsqfgiaxb9OF95nP+eKEG2cu7vYJ1Q18ef
	 srLSbDvnOOAqPfyLPKglPalzyYdfBaZjtPdGckTM+9SxWIUnzEeSZWLX0HpMyk24+wG1R
	 ccehsZGgIbgbQrA8GqhjufBe1xf8w0vFkUe5yc3I9Ta42PtCERtUU38DGJDQ5/+wg2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vW6Me650CnRCbqpTMm9ScZes8RV1bkmpcr+ZWjp/+oI=;
	b=oALhvhVaIBAFbH49dhErxYPx8n2PxL8u21WAHw5/M6CeJVGVx21U8nkTcko3qI7gZ/7s
	 uc8bBwVAYyct96Ld/gDkq0EWhrewbWQ+WNXYlLGvsIK4nZjgY0gr/+zQ2U9baXnqNGcGw
	 X2hXHfT7wdVYVuRNO7pvUe3ccMkSlS2Wi87gqEE2TqS9ksYNDe9PKvmxogmbZ3Qy0YtD6
	 hkqtkVvDMPE6JAiNPQ1uL6bsLf8EPZKCAFs5Wh+HTXSdEp99BJQsW/Wbd5Tw5v01LkARd
	 pV1JB21u+pKlovLbOf0dv1t7AD/VX8NqHy5REb76OujYyw1apy7u09u/eCYIwnvmf2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+S1rZsg;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F91606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F91606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+S1rZsg
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3b0d11b85f0so1250859a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794320559; x=1794925359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vW6Me650CnRCbqpTMm9ScZes8RV1bkmpcr+ZWjp/+oI=;
        b=x+S1rZsg7K4t+eNcKA8bN9ONE2k8DAq5dMIW0eRDE/qBx3gUIRLbancnNA0XJL3wuN
         rbv3XHNXNLA+thMDnuUTZl6mU5nEFo4LVh9MAxmWN8TbYGgfWFv4Yd28Q9m/A50jnvX6
         OBS8Qy/wqYLqq3zQv1XmMRjNhixHEUwZ4BVbpeIz+cnyXlnk1LpxwfCeglZNgFz754km
         1dwW6vLRW2pFsGlw3cbbmULYIxHu7as7ECpGXHxEnzpmYsgR+YMPkHXCaRtM7ACwgZjz
         4z2lgKosNm1g1/jdXNvjXd8U8DCX66L+uihyjJ+pbd937my0cer6wMSqTJpAoD/ohHlD
         6eXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320559; x=1794925359;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vW6Me650CnRCbqpTMm9ScZes8RV1bkmpcr+ZWjp/+oI=;
        b=Gm4x8duM99BnOH1OR4CBX0BUCdDS2x/ByIBEcWz7zZ1wmQ6yalrcD1v0mvu2wlyFp2
         uvF2FjUJQ+oP5+oxbrltvyofB8BtUDMdDSQmy6LR97SAJP635JEQrQup9FZdcP+52nNV
         kxq5yimxEatDHi5/WXEi7xJKhCXCHc5uy3L8gCNuBMgCAdzrA5YQg9KNuEIs4F7+ukHU
         xVt9XuA6+d4Seswp7jnBSNqThkUXLmcy1OfchQNh6fGsdxp9rvl5Nsrfpwe15uvxlE4K
         Qz01+Jr2/JwpaMpzicme11BleaYLU2jjxzhev745+f7qmeN1VEeFhhoLHYNRzhw8u446
         P04Q==
X-Forwarded-Encrypted: i=1; AL+hErEEKO3fU9OXWduBQHin/EpOVhwcN63o2zZHAhMIj8yWV5OzKCouqvBRs106LUvem8/OdS2X6YNEbdzvKJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pZiNazzEyMaPzJ5yIc9NDY6MwhHaDTT7t4IZidE+toJOGqs6T
	/Hs9PcIk8rcXJ3Wp7lT4mxLVvAeqxrVn5alyT4hGjyQJsY3unti2prbz
X-Gm-Gg: AYBFou1fPsDNLbX/IFls03T7unzvJH/A4RHK2nA8Dcq5JiI8zUvS2OPTnLpTva8zMqY
	MgJw8mukayXCKDivBeFkeeXQvlv8CzCmgoGfnFVa+mTSq8aiuMtmNK/od2H275jdY9KDU4tzr07
	Zm5ZFJzUFdfB3Wvayxgi+o91MnJrkKFqzb85tet/91Ys6bfZ7npukkoLd5HrfiXxovjAl1ggK2x
	86z0yFwSBAqPtgUF5zXLxcpxBDhIy/pNrkGCP4sD1qIlCKM/g++PuYoX4FV1zh5GcM/XSX2cM6R
	2GuLYV9d0Yal8It3fdmwrVuCCPd/j8x6PVRXqHJIDORFZWkpLnRrDKH4zXwJ914dw6rhnxay+kl
	07es12LjyWxiVRJ8VUpTU4/pY7uB083vkIRrzNOsl2OvTn0CvFCykluV6dRRjA9yK6iMQuBPCWa
	SeJOoMEl3z5yS/tVO3UC8nWWgY9n5AzLlrnZRG9svHPAnf4vng8o9BO9P7LsnMmeu7WaeJtuvge
	YoVEbdzMFsSz3lVxngbcrxwYS6pf1Sj9nut+zEqk1a2mm8JbRzrYEH+xogjlobhnMmY0h/7TTuK
	2tbEDawg1zZ7tuMhjnIX5FlzpeqF2BhvMDEqBGNkNjpXcqAuB++z2dm5A+mdSz42c/2Y
X-Received: by 2002:a17:90b:562d:b0:3b0:968f:fdef with SMTP id 98e67ed59e1d1-3b166cda37emr3135880a91.49.1794320558504;
        Tue, 10 Nov 2026 06:22:38 -0800 (PST)
Received: from [192.168.50.100] ([114.252.97.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db9d1fbsm70817a91.15.2026.11.10.06.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:22:38 -0800 (PST)
Message-ID: <ce2231cc-e554-44fd-b931-5627219b534c@gmail.com>
Date: Tue, 10 Nov 2026 22:22:33 +0800
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
Subject: Re: [RFC PATCH v2 9/9] iommu/riscv: Add riscv_iommu_attach_dev_nested
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, gong.shuai@sanechips.com.cn
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20261110115137.184160-1-gong.shuai@sanechips.com.cn>
 <20261110135615.8073-1-tanchi25@mails.ucas.ac.cn>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20261110135615.8073-1-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tan Chi,

On 11/10/2026 9:56 PM, Tan Chi wrote:
> Hi Shuai,
> 
> On Tue, Nov 10, 2026 at 07:51:37PM +0800, Gong Shuai wrote:
>>   2. Use the guest PSCID directly, but allocate a separate host
>>      GSCID for each vIOMMU.
> 
> I agree with option 2 as well. My earlier suggestion did not account
> for independent PSCID namespaces across multiple vIOMMUs sharing the
> same S2 parent.
> 
> Allocating a separate GSCID for each vIOMMU seems simpler than
> maintaining an additional PSCID mapping table.

Agreed. I’ll work on the new version soon.

Thanks,
Shuai

> 
> Thanks,
> Tan Chi
> 

