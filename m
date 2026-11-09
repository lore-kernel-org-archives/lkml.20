Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190833;
	b=E2nFa5Awh65k/YA2wsXWIEnc7gwDYXnEgv28aNEYydl31OWXbD8LwqjgFSaX+oeiJK0z
	 yKR9uRWk8aqJVuuMIH5pzSETXFA4zlDL7eVR93xYa8b6YkD7e6dC7UKjzKJJrheKjZdlc
	 eYcsirSNwqmH6OlYlJH81WTAP0FFZvCup6V3QOXChXVdtn/83+/oS7SFBbEqOndgvTpIZ
	 F/FXH3PgskUFb4uzgFAdojxcd6iLNTUUElx00xpL3jUiSd8WyMyL8afXWdVUCJGpkzl3h
	 CzFYSjrTReftkiv0Crsa2BQULz1oioKX+ljCPWJ0+YNzkso8fTvq5NG9bhO1taQ0F6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190833;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=AueXqQ8NBu6uNNOfAm0QjH7ukRVpDkrJsxDH2iaMDa4=;
	b=Q7g123pdKTwAv0fi4q71mr3+kRcRBshMfXVvktgziy/BK+VVac6BrrGDmXVeFFgthLZK
	 WB9y6DbVWDEpbk+yDc4doYModRUosSmNvkxiI3SDk+iJ1EDGQ2eDrNT2yPFU08TSWM94P
	 W6c7nXCVnd2s7eSqvIn++ccdC9AfnTi667rqcZopl+7wVOfFqdBatEnv/kmoQKTuJKm5Y
	 zPBol0wF5MGPxnOyElo16D94u9mNCgK40D8mDFeAv2V3GloW1dur17SDwLht1+50HPYpg
	 x5SU8fhrLFL7T196gZPrddbh9F1eV3X86h9yO1jn6c6Fp2L3qSWdIpi9Wj1At51Orcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5524606A31C;
	Mon,  9 Nov 2026 02:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5524606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMCWvsbqLfFqhdMJAA--.30828S2;
	Mon, 09 Nov 2026 10:20:26 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wBXQR_nLfFqSwwQAA--.21192S2;
	Mon, 09 Nov 2026 10:20:26 +0800 (CST)
Message-ID: <e9de49d3-c989-4539-8a1b-073d6866b7ec@hust.edu.cn>
Date: Mon, 9 Nov 2026 10:20:22 +0800
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
Subject: Re: [PATCH 0/4] docs/zh_CN: translate AI-related process guides
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <cover.1794153793.git.dzm91@hust.edu.cn>
 <avEXWkPrGugQSQX-@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <avEXWkPrGugQSQX-@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IQEQrMCWvsbqLfFqhdMJAA--.30828S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoW7XrWkGF1xCF1ftr1xWw4rKrg_yoW3XFb_CF
	109FZ2krWDJFW7Ga109r47urn7Aa4Uury2yFyvya97Ga98XFW5Ar1DWr9a9w15GFWFyFy3
	Gr1kCw1fCF17ujkaLaAFLSUrUUUUeb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbHkYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/9/26 8:44 AM, Weijie Yuan wrote:
> Dongliang Mu <dzm91@hust.edu.cn> writes:
>
>> Add Chinese translations of the process guides for coding assistants,
>> generated content, and the kernel threat model. The final patch updates
>> the coding-assistants guide to link to the new translations.
>>
>> Dongliang Mu (4):
>>    docs/zh_CN: translate coding-assistants.rst
>>    docs/zh_CN: translate generated-content.rst
>>    docs/zh_CN: translate threat-model.rst
>>    docs/zh_CN: link AI guide to translated documents
> The last three patches seem to be missing.
Sorry about that. After midnight, the campus network seems to impose 
traffic control on outbound SMTP traffic.

Now you can use b4 to retrieve the patchset.

Dongliang Mu

>
> Thanks.

