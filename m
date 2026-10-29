Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287765;
	b=S8Txj5zKw/i0Bffj1C/CxUcIYOf+QDj+cJbcUj8nZlf1sHOh3PEFWJ6PVocp+Q0UwRc8
	 Z6AR7CXvbAdANYIcrCaFtJILPh/9iae6LKyJSqfOuZeRO0rDhbJx3+HCKMzoybfQlyuEj
	 NDnt83cQ1uAwz8ILZT1VO2gZlTfre8pGIqhC23/5Z/cqV3EloIM1ITtpFaE2T6yHcannk
	 BoL4H9Xrrs+uEzLNZo4n/fZTsrLNCmY90leXz+zXLgdnQXujkhALViBWHVapWgpWWeUUN
	 Wx7iDuHDK833gdEkbsf7Z3KTODK3BA5q3agEoBNaOdrHNHDofjZULCLuGW+EN6p9hJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287765;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=744oJqLHibDWboUALGgnird9ud0/SsHRUCImjN81cRk=;
	b=Qf2l56QtNBLFSSv086kmkuEzrndHbxDpf06Zw4wmQ/a/H+9kJ2N6RmW3abwZM4ge4zxw
	 NDfo/aJQDi/Xg23k932M7Gfwy0QXc38oWt9dvTLG4OILSn0xLYnjBsF3VQtH4/IvPcg8J
	 tnXdikj+5qYjjIhM3neq9bXbdZNjoUKzQc7Pvqb/dolZwd3WWOUGxwAzTrVyuD6zGfW+5
	 M+Fg45vUtygMYyVOJ+O74O1217pwCylHTXgoJP4W2YrspVKiEiz6/nPwEi0LMZj2Dcs/L
	 vPSRAK/ISiPclqemWIzGXgjJ9E8eZtmkUsBAgKGYVXbDoEuSdeHuGbqN6KrcAv+rkqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GTf4aq+y;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68830606A31F;
	Thu, 29 Oct 2026 15:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68830606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GTf4aq+y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=744oJqLHibDWboUALGgnird9ud0/SsHRUCImjN81cRk=; b=GTf4aq+yFc/PVJRYup5NFr+zf2
	lGOnWUsLsK8Lspb7305sg3xuCNsN5nlxil8IXsUGBCK3OYi6nti395wj7xIAKyCMiu13jXcOOx/4A
	980sm0nP89UAN9Y5ozHoOdOw0iJ8GnH/OcFykhitxhOtqErxBXJAi1nsIVHjeKnTVXffg2WPpVNUb
	MoCtRZLu9bYvRoBNgn6ajAlz586oH+lg5iG1W3z8YvgWkZ4rgu/d+IBDWD7S3C57w5+rs/RME76qT
	zEHTgo1NkqLeztCVvZ7OJEwspGK9O69L6n9u+Cs2GqNv9ktEvH8NCxrFFK7yybuTnYIjPsGqHmir4
	VvckzlXg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMS4C-00000009dMX-0I8y;
	Thu, 29 Oct 2026 15:29:24 +0000
Message-ID: <a9417893-b7ad-4f9b-b8dc-93a41eb7ff46@infradead.org>
Date: Thu, 29 Oct 2026 08:29:22 -0700
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
Subject: Re: [PATCH 2/2] docs: Improve wording in Sphinx dependency checker
To: Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1793119566.git.dzm91@hust.edu.cn>
 <13b42c47a375e2ccc9f84412c10e7868f7ea7c4a.1793119566.git.dzm91@hust.edu.cn>
 <5a257e68-f1b9-4c50-919a-a85d0df8686c@infradead.org>
 <e0415ef0-205b-442d-8e4c-46b72da9fc83@hust.edu.cn>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <e0415ef0-205b-442d-8e4c-46b72da9fc83@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/29/26 5:51 AM, Dongliang Mu wrote:
> 
> On 10/28/26 8:07 AM, Randy Dunlap wrote:
>> Hi,
>>
>> On 10/27/26 10:07 AM, Dongliang Mu wrote:
>>> @@ -784,10 +782,10 @@ class SphinxDependencyChecker(MissingCheckers):
>>>               if not self.distro_msg:
>>>                   self.distro_msg = \
>>>                       "Note: RHEL-based distros typically require extra repositories.\n" \
>>> -                    "For most, enabling epel and crb are enough:\n" \
>>> +                    "For most, enabling EPEL and CRB is enough:\n" \
>> I think that "are" is correct here since the subject is plural.
> 
> 
> From my understanding, enabling XXX is the subject, so I change it to "is". However, this is not very clear.
> 
> How about "For most, the EPEL and CRB repositories are enough:\n"? This seems more clear.

Fine with me. Thanks.

-- 
~Randy

