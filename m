Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493200;
	b=DRkXUU1oeDvfqKrTRhv6Wa1Mn+WHQnSKN9XTVPdzWZLd3ysoJ9ensWc3whuHGSWd2dhI
	 nNFh+/3RAWubVbY5MG3+u1KTf+aCKBzdSctBSNGpRtIi9fN6vW7agntPwIZbeettaW771
	 rtlkg4my5z4t+htpIORLs5sB78ELLGTbv+nalCxeIElIXREteRNrTsfO+VyoN6D+Idw4E
	 GssRTHiuTVjEsCbYQxLPmnYI10ECpUWOtf6vZIgbIgeqSzT+M7PHZbMKSoWc+1gG7yziA
	 80HpL/cYZeWbrQNxYvv3+TIU6uGeAoOLp4h43gLu0AcQjb5UMcXkirqHutkTyw5D82w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ycPyXlQxqPcynh4hgD5HOBjhMwhv2JiLkDDxXjwNZ6g=;
	b=pupty3Ja8qknQ/oh5qnesoFrgQfJwVCFiqD4GF2NGK5UTO+BAb6uGjEH+BbCTDGaHqnj
	 ZxISVXC1G/qR9NkL6Hx0xFqU8ft/AT79WOPF7qOsoXLM87ANywYwetnpA1seR+Nvp3SCZ
	 MMtH3FJKezussOmq+itXl5iw9PkPzgNq8Wi3XfTNoUSbcCx8CPtmsZhWquc2gaW4/oIX2
	 EuQiGwcKFRH+Yib+Q4ogLSFzS188/ZsbtOOqqrYbYYFtpoYJeSO24VVFK0KJlKJARSlgH
	 yXdn6f3IPtAlPagzT/8bx+CLjGj61ZdicoOji/pWI2MzZ83WUZUcr1cVQRsUUxdV7bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kZgNCjDz;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0766072A22
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE0766072A22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kZgNCjDz
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso42409425e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794493198; x=1795097998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycPyXlQxqPcynh4hgD5HOBjhMwhv2JiLkDDxXjwNZ6g=;
        b=kZgNCjDzv07bETMIK11cdb/uvBRZbV73giXfxQwMZzyTHK4wPxme+erks4m19S/IhN
         cUmGDySLN9pAi/hNBAG4/zkhGD15KaIcLH83YK69msdqB+KjIz+jo+dqRGEwxCIDN3pS
         wv+lj7+q2dNnDNKSmpIAEPa8JJXdj4rT3H++MAjNm7vHmNAJSolee2JBYg6uje1fgh3/
         gC0rFC1SA9Z/j8jTB7Hng0PNzah8keLDOdxWsDRKSNQKbs/2W57p8dv85B9/1IQYcPTO
         teZI/frS3AXhHwAbjhHeomPDiPCMxzOF/KhFhMSrSPzGC5hRSIM5DtL//P3tp4MCh9fF
         eU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493198; x=1795097998;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycPyXlQxqPcynh4hgD5HOBjhMwhv2JiLkDDxXjwNZ6g=;
        b=QusxCDntuDWpyojSBpFXuchwNRGRheQWF33Mmd/PcQaxzqFt1DUzTQorhnhk5WmGTJ
         HHHZnDyf4EqYoLrB5wVajmQvnGlS1EtUgHaHYy0SqpcK73D2oLrs4qsFJDUcl4xbbbQ3
         FYLxsGqabrIKggFpLO+NDxeMHhF38HH4c033HS4sI/tFhNnCjBnxOaxCptDJi7jdDhPW
         EAZaSf2RRwqS8dj4sJwmUt9lq7MhKmgoPDD+8LqtfFHqKlpBuF73E8JRshsBdnjinN+A
         k4/uhjHkjhrPB+Dyyr4UFm2uFmICV/A1wKsUurqXXD3tTgLSyrgxodqAvdZ12bplk2i3
         d0Iw==
X-Forwarded-Encrypted: i=1; AL+hErGW+Gx7wHgOgbWCwc53LELcH1nZom5arjpwDGH/pboPwpjZRk0c7uyStWjyolKBgmH0V1c1Hp4FO6GFJYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UduhhiOoitVrZVYcTOa/4URGrbXozV+oiQn29kkO6/gqO3NFV
	blSuPHIc944Y1Vw0ECa3kNLEX14WR/6mtsCyyv6An9nwP8ii+dc23qlyMLk41cSdv8k=
X-Gm-Gg: AYBFou17iL9Enl8seFjKsPl1++p+djhEfhJhsLPNevxCshUGCP757bo06UWZWrcYo7q
	tZ9W0ypAut1Bo5crUgcekKYw/H2gqHIEksStTjRiCqQ+qn1op2YER/GHCjXpdpggJaz2S9ak4iN
	kObre4fmF6tgoog7Ux4wXR8z3V1NVnfdc2urpQbbBI2MPPD8lC3sVDNTB34TOP8PlSuPnsp41tC
	iSICay8dn3Xzxll4YbcY2Br40hu612/rqvnl21emOZguLJatF/spOqxwnhIUW3+qaJ5ktTL07BH
	s/0hfFMlyIPJnX9lCmZ2H8VHIbwHGyuo0mMs5+qWvAD3wimiln/Bjb17ac5gnNswQA7GjW6T3lI
	0Q6eyha0G7JV4xpVtHcZvAGkibLYPdKJylY3cXwvWnFD7MSMvJqfpTb2ZqQUA1WuXJrRw+2BhaO
	N5OpMet6qXrVDrrF+muV4cYv3QRhSkddG3V0ilaenw/4T0IkJkya4pAxhWFIG8Qotj36muu+rYA
	7+vrL28LkIxOasfsTZ7koCDzTqrKZC8+PjJuDhRZIHImAMYNBxCGbZrhLBcE419/leMq1PEIyT+
	OACMBsRW1HApzKR0MzT1kvES8hAwtNRw8C7moVdDPjI=
X-Received: by 2002:a05:600c:4f84:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4ba0931ed6bmr104812575e9.4.1794493197930;
        Thu, 12 Nov 2026 06:19:57 -0800 (PST)
Received: from [192.168.0.167] ([109.78.26.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29d24dsm75906065e9.11.2026.11.12.06.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:19:57 -0800 (PST)
Message-ID: <a35530a0-3a4e-4975-8335-94898aa9abaa@linaro.org>
Date: Thu, 12 Nov 2026 14:19:55 +0000
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
Subject: Re: [PATCH v7 4/5] iommu/of: Require reg for iommu-addresses
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Vasant Hegde <vasant.hegde@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
 Eric Auger <eric.auger@redhat.com>, Joerg Roedel <jroedel@suse.de>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Oza Pawandeep <quic_poza@quicinc.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
 <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
 <97c4eabf-16b0-4e3f-8aab-1c56912c27d4@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <97c4eabf-16b0-4e3f-8aab-1c56912c27d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/11/2026 14:04, Vikash Garodia wrote:
> 
> On 11/11/2026 5:32 PM, Bryan O'Donoghue wrote:
>> On 06/11/2026 17:14, Vikash Garodia wrote:
>>> @@ -257,6 +252,9 @@ void of_iommu_get_resv_regions(struct device 
>>> *dev, struct list_head *list)
>>>                   }
>>>                   type = iommu_resv_region_get_type(dev, &phys, iova, 
>>> length);
>>> +                if (type != IOMMU_RESV_DIRECT)
>>> +                    continue;
>>> +
>>
>> This change is not about requiring a reg though, which is why it 
>> should be a standalone patch with its own justifications.
>>
> 
> This is about reg, which determines the direct mapping, hence the code 
> is very much applicable to this patch. Please refer this code [1]
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/ 
> tree/drivers/iommu/of_iommu.c#n223
But this change is not about requiring a reg. It's about not reserving 
when reg and IOVA don't match.

So reading a patch entitled "Require reg for iommu-addresses" doesn't 
actually transmit the information of what this second change does.

Which is why that change should have its own patch.

Require reg != don't reserve reg + non-matching IOVA.

A reasonable reviewer might ask "why is a mismatch dropped instead of 
reserved" - which is the question I ask myself as I read and IMO isn't 
answered - which is why I've asked for a patch which reasons that out.

It may be that conjoining iommu-addresses/reg and !reserving mismatch 
are in fact the same thing but I don't think that jumps out of the code 
as you read it and I doubt adding to this commit log would make it much 
clearer because it seems like two changes in one patch.

It would be something like "require a reg and don't reserve on mismatch"

The "and" part is the part I'm flagging as likely deserving its own 
patch which explains what/why but "require reg" ain't it.

---
bod
