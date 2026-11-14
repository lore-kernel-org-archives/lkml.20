Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677110;
	b=3YR6Ltev/FaSNX32AldS3AcjIdQVDHLO4Ncuy5PHMO+AwrwT6vNc17X15ewRv7oZoKNq
	 3VquKLzVauFsNfzdCJmA8fMMSBJTI0x49Se2MqrOryCIMMwJuA4HmE9N0tQZt9nSfYjOL
	 hcpiVA5i9JgEU+E5lek3PccBbpS44kvwB3vDyoWp6UczRSp6HRRjijWbAodCYD06ILvAI
	 KvZQfzTzpy9CSnNfI1jKFy+/x2m+6JNihLIhvfVB8ihiwmSV4Bc4sM2GDMx8/xYNh/0Ab
	 hmhgAIBrehT8hrje75F4MApKjaxPfQSxof2fRkHjKCa3ZZrI54cEuoyBhfctlGMbr0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=h0xEqPZPyZSvEk4q4GfAAXI1OYobmiwWWcxbzy243zw=;
	b=AHkqV73hHj1u1fTAYtDHnKfxBKDJ+Nd9daIceLU/pFNhfL62sMNF44Z+6DRN73CU0Zp7
	 BXcEFoIX8T5OFV6fipWfXqnpOgAQoXxhaX/GeeHDzuStjAE7PWJ4z9Lrd/wds/VbjRxvi
	 zbKQcHybbSgZl/aM33+J2xDP37GNLfaC1de5JaqUknLww0IWXtFqP7xk1TMuLQvKRAo9b
	 ZfGuMbEmPX8clr7JOSbHOWQv3XFoH+k80Nln6huCD2YzWk3lezVz4dHsL+MBtZmzgkPZ6
	 vNsKYFneV9iBeHlFb+aGeX70110xjRhS9BCBzlu+WEQ4XCaryxSo0Uh7/QpdQJNO8Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TEm/dmZH";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3034F606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3034F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEm/dmZH
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1021763a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677109; x=1795281909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0xEqPZPyZSvEk4q4GfAAXI1OYobmiwWWcxbzy243zw=;
        b=TEm/dmZHhBs0Ple8gwcpThb6q4glfvu0ea46PbbTPWpZa3Qh+gyuWm4CpM5B5ZJ2IH
         p25p+zNz1m4drXpInICQlnfmXDtIPakmU2qbY5whTtRlSMtH44PIIfNsexDaE+GvOWVN
         EttuqLOaoZOGeRu5ji8sqs0zsP/DHqM7MqY2N1UB4O+wcK9MYXI2M8K7MGkBARDDK9P8
         palj9CUuGQxpCvaKn+q243Cw0qvMgzjJyhXeHtPxxvZuMbKIWDMkboGsMGtzA8kGijuF
         MrMaOOmml6cxeEIw//cIaqJ9Df18+DvB5r+5fSPBu+DEy61mOshL7euL4e80wMyT14OV
         cIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677109; x=1795281909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0xEqPZPyZSvEk4q4GfAAXI1OYobmiwWWcxbzy243zw=;
        b=WImLtkw6r9XWMGHsPyerybq66V3/Xe1zTLBjrHIfQy8sXyqGdGYAFU3BR+HbDlh+cY
         humE7I52FL+0BFsv++56zD2a3gd7SPbplZgl+iZHYWKx93BtExVDUQdZH7JWtAf1qdQ4
         Z/Y1sCOm1j0SHRS5IVOCWF1gNa5qzP18zGxFL9mf5/x6Df1UoJkHTpO8BHhNwRKAFtx2
         T2Vv7s16ZUrp5Yj9aSX79/0RlpZwgLPFc31Vep3gqR8KjpA74kJSphlP+VX4Hmas0ZDq
         QAD9N0ANfqnYF1DwwJ237iLChhlBsAghTx9EyC0Ahum7COANMHgKf3pfawnqGW1shqen
         JNDQ==
X-Forwarded-Encrypted: i=1; AL+hErGvBumnuxWZMILlrs/M87ZHjNe2QoT/Lbuvtk7G9XN1ZdIns62fwRItJrgTpiw3VdpEfnDA/1F9zmhrPi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Zy/wPCQ4blT/F3qwhQptScPucn/mvKwF6ng79OVS/uzKjXICs
	gTgkVPMhP0uPcA3YONgoa42zMGRPER6gkAwxnuepLqHepog4C5VkMlKX
X-Gm-Gg: AYBFou1Hm/HBN9dVh9Bo00qrcV58Nj39IjSF0FH9BmCT0b6yV0lIeck3/QWay3dBAxY
	3GTQdUtiXM+vwKLQ8+2nEF8PvqPnHrQHqj0otDyljFdUxrgfHX5hICl24xUbo2KS5nZURX31ggh
	FtzW2GHtax94TkI50hgQWGB0vQ/LHfw1RjbIlSiy8Bdkj4b1HkAf2CNJSoptsrQtQOmZGSmr+Mk
	kfbnPrrU2CrRtPuNAwYu4IyExHESIBEv8roqXbAA+ekfibEMnb5GltG3H5FHZ5Ed6hzs7gOG6JA
	lDbZoYTrWauHyP1cTO7ZYebklBcRhxEepVR+DSzHq8HbL+zb4Xwi8pLMNZS8K1g1EgP6a+3mqX+
	Lm1HzywDEw+V556PGm5wVC1XMfsClyOKueE/EFrA+T/gaA8UXnoMPdXeHPuQKyN+hUC+4sCNwrj
	ihVTA70EWrMTeJ7iw98J6hDQOol19gpOeEmi6j6CokgdVPVNIvwrJzNmgNRwK/qiGejntUR2Jvt
	CAe+BdVyWKPiykVP8/Z1MBtzVO7J73iTH4gHefmUm0YPO+renDMhZrgcNCiRnD4VakQyDh0Eaqg
	1MxP+nn+KI4+KBRQMEfEwqzbWVn5m5SVQwOpOP/rDKJowQ==
X-Received: by 2002:a17:90b:1dc8:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b1b0b5becemr3918051a91.8.1794677109388;
        Sat, 14 Nov 2026 09:25:09 -0800 (PST)
Received: from [172.20.11.208] ([64.141.80.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce49d6sm14999864a91.4.2026.11.14.09.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 09:25:08 -0800 (PST)
Message-ID: <dcaab84e-cd40-43d7-b747-51f490d4e8ff@gmail.com>
Date: Sat, 14 Nov 2026 09:25:07 -0800
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
Subject: Re: [PATCH] kernel-docs: Update book info
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261114124813.1056807-3-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20261114124813.1056807-3-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 11/14/26 04:48, Manuel Ebner wrote:
> Update info about Lorenzo's 'The Linux Memory Manager'. The source is:
> https://nostarch.com/linux-memory-manager
>
> CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>   Documentation/process/kernel-docs.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/process/kernel-docs.rst b/Documentation/process/kernel-docs.rst
> index c67ac12cf7..dd5bef154d 100644
> --- a/Documentation/process/kernel-docs.rst
> +++ b/Documentation/process/kernel-docs.rst
> @@ -79,11 +79,11 @@ Published books
>   
>         :Author: Lorenzo Stoakes
>         :Publisher: No Starch Press
> -      :Date: February 2025
> -      :Pages: 1300
> +      :Date: Spring 2027
> +      :Pages: 1350
>         :ISBN: 978-1718504462
>         :Notes: Memory management. Full draft available as early access for
> -              pre-order, full release scheduled for Fall 2025. See
> +              pre-order, full release scheduled for Spring 2027. See
>                 https://nostarch.com/linux-memory-manager for further info.
>   
>       * Title: **Practical Linux System Administration: A Guide to Installation, Configuration, and Management, 1st Edition**


Reviewed-by: Carlos Bilbao <carlos.bilbao@kernel.org>

