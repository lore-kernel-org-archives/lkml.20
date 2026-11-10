Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318437;
	b=Fvc5tdFUDHcLYwJNYlBKl3CQn7KeYtxCYOV3M3BvfuMn5Gs/NVRA91ci7CFSCadkMp/p
	 kh3ydW1QGfhBZn43E1u1pb7UfLYJGCScvJmEqkiA2TsTe0YtKafpP6SI9HD8iaDRAfo8u
	 mDFylqkG1Hc5zsmJik0wOg2ZAm6TWuJH+dVrIkgN2XD6K9yBABQjVS6xIOZB+4wsCp5Sl
	 OHJVp3YnWX7kw8hEd7minEJ4xFe1FSVS/SBho5xyBUW5+8pQP7zb7Z0cg4+Axl96ftvBv
	 qCFpPcaiFkq7T9k2LOaaPo2+24hif9TPqOajIZmFu0B10Kd0/JbTiWLVeI+2ILhuSig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GnZf5t7UPSoR7hVFC72+KtUOhGomuwzXct79OPnbGl4=;
	b=3kyexwcmBFPZ9VvVChMgFXPI48wRKcEAXVoy0j03u0Qjdu4WEJ0py4zxsBkYkZBwnC+z
	 kc8Q1jUFWPMqDonSUQVw/OxOvU0hOsnj6ZlOEoj8idUFyoAprOYQlqnu9eXi0pAlrEVm7
	 F1jlnOLV7KdszvFQinSG+mt288kGDRGXyJuYk0+GRwqentacomkNJ5Q3Og/RhTAbDXNgx
	 yDHZUOu6WP5rG/JXWd6LArA3F8Ti8QkSBcaSWYQE8K1fehY4/zfzAzJFqQJxTQ9wYZ9oe
	 imTBwzAFWmJqBrtOsOD/xbnULyx6i/d8NriwX5fwVwLzocW5ANAp86P3ZgKo5ZEs0qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TotfFPlc;
	arc=none smtp.remote-ip=74.125.227.202
Received: from mail-pi2-f10.google.com (mail-pi2-f10.google.com [74.125.227.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A4260A380E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A4260A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TotfFPlc
Received: by mail-pi2-f10.google.com with SMTP id 41be03b00d2f7-cdac0ac5f19so1029012a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318436; x=1794923236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GnZf5t7UPSoR7hVFC72+KtUOhGomuwzXct79OPnbGl4=;
        b=TotfFPlcTFZ5CfmV1PiPkYGsN1kKgdwuGVBKSnRwJl+8Vhq6S1B830id141rXih+Gy
         3baA3FF1vW4v476sJQhOlxjRMPDZbditQb583rvJF83L6sTW85CHb6JAOqQfi9+hkXTL
         yYAdfhwkWiibHb2UZKPjUiFKGQkWpT6pTaCmTfR8eHNEwoUxcGzeaqxg796ADZDTOvp1
         rAtQ1vAnmBu5lbHqZkbFt4cQhy2cOXkoAzFDdJSTxtOYY7iX14aklG/1vlBUVWlXDVfx
         k42Xlyn+Eu79ntwwEWeD3fzLik3vhZerZo56FJAkHWV73bORkS6qQoB3fJCZimx37uG1
         ujZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318436; x=1794923236;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnZf5t7UPSoR7hVFC72+KtUOhGomuwzXct79OPnbGl4=;
        b=beR0T0clbuk7kv3bTCFyeReQpYLFF4mv47AjKyZeltr776u5ScomsGK4IaKJbdoPjH
         2F4wncS0qOecX9hi3AOt1+QZyB6ixTZoaBl6EsO/L8G0FsXGyO7RKawDYx4GLizqAU7J
         OcaC/IAAdHsnnE1DPtTlMkdSNdX94lLmY3T7CC64h4kawac/h+2thUpTeUcuvpH5m62r
         Sd78wkbIMTebjiPynxOGUUf7uv4yxbPDiTK+JOKX7vFVob8/1wQdB5AyjtIXcjsBxTM+
         VSzaqUjL6ZLCfmyIVe8mabbRmEboQllZ8jcXEfRf1hL215ddlRIwA9oEDPkQlHMlNAeE
         yr6g==
X-Forwarded-Encrypted: i=1; AL+hErHbMVV3JmYvUPGHSVT1cuhMqcA7lpi1FSsEuzaRNIG1nr4qhIqFJFH5i0oJchWw+3K/bQI+mc21NHTsF3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AaDudP11IODH3Bpo9Kgq1mSuEv/Ch6SAOydsXvuxtW6XqwTnn
	VcqBmWVp8ZwBC5/xSMHLoJKYQ6UWXSv+f7x4KH655k3VklXM2Gfc+JAU
X-Gm-Gg: AYBFou2NXtUCEbUZJv3eQfQchd/LDB5DT2gmR+7FXCv5a4YkvOrJvOFjjBhPTeumyIO
	pDp+hfDKUB1jCaOn7QeEyLZIAbl535JZhg5LIBGAEzA/h1FMJjiwg0kXlMgJNKunSunEQgdyZCj
	A7duPfdBgKHMH0wjDlkWLWTdZeZLt4Ik2wli+o5Hc4NmaIYmVm5WxRGv5M0cInoynp1GqvSXkKD
	offd04lXnWxspgJ+FcphVoWabQj1Sjb36zM/kJPwjbzZ0Z+YI0CdNHUlbwzLvdM3D9w563UGQkX
	Vs5ARo9dpR/h7himeNdOYjcL+Rb9wMjjeHw5WXobdYCde5TJdZ9HnRa73sRdgQURKLzNieU/7h8
	To77tD0QIVooZMIeS/Nbxood6DxSBKFdDDTgO157prLqDrXu0B7q3WAQ0grvnGYmYXT/z/0iNEA
	QpFqnjBTzlpdaDzUcuZV8cEvffPCnWtdcINoYh4/eelPfd2WVtE6wq3qtep+7bPiJvehF7Pdcq7
	u8lMSZVapocjCfuAjQpr1TKq9yuCb+P6qGBKXIXpeYGsljdZHYSaWETS2O4anzK/Ln04+TFdeL7
	CsbVTYxw1GzmO7S+IiNMRW5sW3srSyBstjntO6FQ+51uM2k=
X-Received: by 2002:a05:6300:210f:b0:3de:48e4:c37d with SMTP id adf61e73a8af0-3f18f0b86e1mr2622791637.26.1794318435879;
        Tue, 10 Nov 2026 05:47:15 -0800 (PST)
Received: from [192.168.50.100] ([114.252.97.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm867486b3a.36.2026.11.10.05.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:47:15 -0800 (PST)
Message-ID: <42ce73bc-0fb5-46d9-bc45-34a5bef25cb2@gmail.com>
Date: Tue, 10 Nov 2026 21:47:05 +0800
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
To: Jason Gunthorpe <jgg@ziepe.ca>, Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: tanchi25@mails.ucas.ac.cn, alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
 anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev,
 fangyu.yu@linux.alibaba.com, iommu@lists.linux.dev, joro@8bytes.org,
 kevin.tian@intel.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
 robin.murphy@arm.com, seanjc@google.com, tomasz.jeznach@linux.dev,
 will@kernel.org, wu.fei9@sanechips.com.cn, zhao.qingye@sanechips.com.cn
References: <20261105144944.10193-1-tanchi25@mails.ucas.ac.cn>
 <20261110115137.184160-1-gong.shuai@sanechips.com.cn>
 <20261110131658.GW663069@ziepe.ca>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20261110131658.GW663069@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jason,

On 11/10/2026 9:16 PM, Jason Gunthorpe wrote:
> On Tue, Nov 10, 2026 at 07:51:37PM +0800, Gong Shuai wrote:
> 
>>   2. Use the guest PSCID directly, but allocate a separate host GSCID for
>>      each vIOMMU.
> 
> This is the right model. The viommu should allocate the GSCID directly
> and keep it for the lifetime of the VM.

Thanks for the confirmation. The new version will use this scheme.

> 
>>   3. Share the GSCID and maintain a per-vIOMMU mapping from each guest
>>      PSCID to a host-allocated PSCID.
> 
> AMD is doing this because they don't have something like a GSCID.

Understood. This approach makes sense.

Thanks,
Shuai

> 
> Jason

