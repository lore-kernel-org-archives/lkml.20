Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.76.78.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278272;
	b=cm3fZXEGLbcYBcty98XLC3ge0tPZVOeH1kmVCmSsZ6GZDb5Dowy6MWZo4A6PtaLgwrKk
	 WAgJsr0VKvnkUfagy/Q0o3trWcY+/c0Pfwzv86TdVq9pTGKWZKFj8LTGPnbJmSDjkakmd
	 0bTJdntUooJDCREMpEma4jXoSj5nQ2N8ScrGFg0cNaEchKR1rlUkfoiOuz6gLz670eyYb
	 4uRXIaujDOa779Z+k1GyndDVmlblrQ0krbEQ2HI6QsNxxIGGYThux4+vV5z6QaOnE++Hj
	 QndjEm6G4hR2SdCj+9BN5UDMpBxvyV5NylKZD407fLUn6RZP1kzUXlYwSmvGf31iofA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278272;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=d177HhnhkyrSAiR4W6cQ5QvKO3o+xnt4/sv0mwNmrPs=;
	b=2rXJlMvA8eVfFVfc4mg2EIro7TXd8jb5pjXogH1aI2FtoWwjSfDEJQOCkHDLRLl6/uZ4
	 Cwj5uymixeIIvFDl0V2NXjixh8XAtiKTLVrn6rP5DnL2pzeJrzRLcyyKjNe1b8YjBXxg3
	 PdoV9ZncoUzFqEYub3pBcusYF1xjnHnaoR3MXhfuJg6AIHOzz8+cGVK+dZq2hBL8LOUhI
	 1s/GtZZeoCJi2o+zsO5MkKJLNM96rDOWP9nr5or9oyjTkAcaRK7UlG7ii+eXlozrY9xAI
	 2VghrTmhZnT86x7RJbzpbWna9rwef1g2vz8/L98+cm85q8zqMHB4vQuGhMkVHyCL8JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.76.78.106
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D174B606A31A;
	Thu, 29 Oct 2026 12:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D174B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMB2u6E7QeNqoCdKAQ--.59501S2;
	Thu, 29 Oct 2026 20:51:07 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wBXUDc5QeNqgWgEAA--.3901S2;
	Thu, 29 Oct 2026 20:51:05 +0800 (CST)
Message-ID: <e0415ef0-205b-442d-8e4c-46b72da9fc83@hust.edu.cn>
Date: Thu, 29 Oct 2026 20:51:05 +0800
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
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1793119566.git.dzm91@hust.edu.cn>
 <13b42c47a375e2ccc9f84412c10e7868f7ea7c4a.1793119566.git.dzm91@hust.edu.cn>
 <5a257e68-f1b9-4c50-919a-a85d0df8686c@infradead.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <5a257e68-f1b9-4c50-919a-a85d0df8686c@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IAEQrMB2u6E7QeNqoCdKAQ--.59501S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrZFW3JFWxtrWrWrWxJry7ZFb_yoW3Awb_Gr
	93XFnrGr4UZFZxG3Z8tF15KwnxGr4Sg3WDX3y8Xa17J347XF1DJFWqkws8u3WUGw4DtFy5
	Kr10q34fur1a9jkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbdkYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_tr0E3s1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/28/26 8:07 AM, Randy Dunlap wrote:
> Hi,
>
> On 10/27/26 10:07 AM, Dongliang Mu wrote:
>> @@ -784,10 +782,10 @@ class SphinxDependencyChecker(MissingCheckers):
>>               if not self.distro_msg:
>>                   self.distro_msg = \
>>                       "Note: RHEL-based distros typically require extra repositories.\n" \
>> -                    "For most, enabling epel and crb are enough:\n" \
>> +                    "For most, enabling EPEL and CRB is enough:\n" \
> I think that "are" is correct here since the subject is plural.


 From my understanding, enabling XXX is the subject, so I change it to 
"is". However, this is not very clear.

How about "For most, the EPEL and CRB repositories are enough:\n"? This 
seems more clear.

Dongliang Mu


>
> Otherwise this is a nice improvement. Thanks.
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
>

