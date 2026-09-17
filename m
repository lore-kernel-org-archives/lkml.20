Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058034ED198
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664524; cv=none; b=aneVBl6zM0rSy8bxk/wYt6R3YStTmDo9t43JxIhEAesayGOHrFZbQZuN4Yp+zni7yIgTYl6YOWPncS+ab50UNhcklRuBSRZa+HT+SRcOtCkuEzqRTgn81xSKSbLcHZfeedJYgMG+vseTXWuy87hZbtwSzQfNW5D3akwgfKpFfGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664524; c=relaxed/simple;
	bh=jadr+WJrF70vnETwo0UNbvC7Se1rv6abIs/WIdU0USk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pIETFHG4asaSCUsq489IO3Z9pwTfBnXjQ5vysaqna3XIKPWS6zfVfbIOkeg+R9MxW65zQ9cO1GuO8OmDGcC2ad2huN+5YnJxz22Njsl82+1jETLaA4Hq2Ix0cYjAnj58YDDQcJvE3HKfDl15QGAGlkey/B1JhUB7c4kMVujNEBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=I3W47zhU; arc=none smtp.client-ip=209.85.210.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="I3W47zhU"
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-7f69672e369so275959a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664522; x=1790269322;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gxPZVE1iSWk/YnSJluT38WV/TFUzwOd3jUqgVOgD/J4=;
        b=UlZukmZnoWXtDbrTKYo7t15/PLTiLpwIpbQYCv3QumFSt1eAgqpTmBXZWlnrjy+9f4
         dkCVofnWZN5vjP4Z13gC6rY+ArLxeu8mvyQPHQuQ0FYOmjgK6Cgsel8V/4hOj5kPr4fW
         +yfRg0DZCR5Ks63hZRBOMG+NxCVDi2A22rHEtxL+latfG2QvZFzUlE8CXyUHOCYomoPB
         46XtE2zWxtb/lWwzhyRWxPDV4m5VAsv1g2Un5jce1jHLwU7KXTmpfHE9F7fyu7qIuHyo
         IosnApTGfZTO9YBfBbDt2Sm6AW+D0oKla+bgnt9loGn4yuKBgV60CQ57gCG/2qY8tXlC
         MU9g==
X-Forwarded-Encrypted: i=1; AKwUvByZVMn7F2gJyuKQgqeLpN8FYu2HVr+Moy85eCQfRWZlqtEiRMHZbJcKSn3mgJvjAdW/UDZVYwMsPGyodWk=@vger.kernel.org
X-Gm-Message-State: AFuF++m2HcaDUuhcTGDdc8DptqaWIZgUthj+8dr6iPWXJMmm8m6HGjjU
	SEPPrBFlJRibvpa55OERrVLUcVx0GePLDeFet5OQnnChftllc5GiyNCkv1mPY0FOpvAcGWFtQ4o
	qmM/07aabw2PH9534vASUhVBItOXiLKvWcRZBWsvVrexm/FH3PL86rjkirDNG92b7gK8ij1tSeF
	EyZ4bcSsPOXBO1UBl3VizgaBfDVlf+PG8Ixw0ZGVq+xAoaHz4dn7hfYqUw3fzzUK/dl7UqHXtYV
	W8vWz61W09iHDxJ7QvAsegd
X-Gm-Gg: AYBFou1i88lhYDCSj2uOM8pqtTkLVf2U4hSKb5iWIM1L2jacJeYzU40TFQ0dgI925Bs
	EfGL/vObPTkDX1VLU13tBJ8EuPTMTzwFOOqxuI4N3uITlB8/nAjKmrWKXv/DAZv4jJhDhFucCNW
	AXWIkSFuDWEpd+YcTvY2wOi28io1CTgDLMhsmb79JQjRD3MEvuIh3Y/0cSneNsp4hYW4KTi2Rq/
	TqYYc1A/ILAaz+LM7frztqPKHwz4RWgzM8i9RiJFUjQwYP7n32DDuk3vVnIUaavOdgzEkwzDPKb
	RiE0yRfVld9UtV9CXxYvpMYcqeS5tdCTbyJyL68C4do6v69b38rvTrx3aLzec29vdEoDt0tQNtf
	1XXUBYN2zqnFOD+2v9+/57RDPGtwF1b9LkFNv6iQ9yRLzN5ZAfdKZdRwoRxYr2sdgBnJGcwHHEt
	GAo1G7i5/i6NKo6tm6+kzCANqhuxV5f6uJ6oPbSM2e6sI=
X-Received: by 2002:a05:6830:348e:b0:80c:d34f:5f64 with SMTP id 46e09a7af769-80cd34f62abmr2605535a34.29.1789664521571;
        Thu, 17 Sep 2026 10:02:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-80c43e5d690sm1809012a34.2.2026.09.17.10.02.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:02:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a74698972so1376266b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789664519; x=1790269319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxPZVE1iSWk/YnSJluT38WV/TFUzwOd3jUqgVOgD/J4=;
        b=I3W47zhU3ovjsLYptH78oo/XCNySKU8mp9Tq5hucFccwILN3PJbxaHhh3Ti97YeXp8
         06t9kQ6X54mcSGUTjoAamR6eZ2n9DzO/O1JjrjBvHIzUmf46eiVbvuPo4U7DoFsKfp67
         9Ar5X30Xq+5M1oGgMThRmNKdUnFzXgFtZ5tRs=
X-Forwarded-Encrypted: i=1; AKwUvBy2unGcvGinvHcpvMf7aFIyJBplM/8eLJa7iHlFFd/10S0z9bem8/g9LD4R9SNflbEznPojz6oxmQJouZo=@vger.kernel.org
X-Received: by 2002:a05:6a00:bd0e:b0:868:e6d3:fc18 with SMTP id d2e1a72fcca58-8723878af11mr14585794b3a.15.1789664519366;
        Thu, 17 Sep 2026 10:01:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd0e:b0:868:e6d3:fc18 with SMTP id d2e1a72fcca58-8723878af11mr14585750b3a.15.1789664518960;
        Thu, 17 Sep 2026 10:01:58 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201735415sm3213840b3a.42.2026.09.17.10.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:01:58 -0700 (PDT)
Message-ID: <e8ea945c-97a9-40ce-be06-896a701d8ac9@broadcom.com>
Date: Thu, 17 Sep 2026 10:01:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] PCI: brcmstb: Declare and assign quirk
 EARLY_PERST_ASSERT
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <20260911233541.1650895-10-james.quinlan@broadcom.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260911233541.1650895-10-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/11/26 16:35, Jim Quinlan wrote:
> Declare and assign a quirk where PERST# must be asserted prior to an
> internal bus being turned on.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
