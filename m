Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.76.78.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792728982;
	b=sF2ykzwnfgkbX0n73OqtB76/+vdQbmnHYfRymuE6qMCA9YXdv5rznrQcxL9bLQt4mxJV
	 bYcdU6f6YYLsnOnn61+p1D2tN2iS/DLVAdc1c/2Ny3A2CUbg1J3jPFnbe9gtee94L+pRg
	 K03nALf97aNwmiJH90QHAdY8KadDoTKPMb7oKNUcq++JHLFgZuC8bA2/Dmyf+hEy+FwL6
	 CrzIlXBf18hzZ1YuWvldMKxojhw/lsH3ekrQvgumYiZcBz/UHbggYMgvdtg5OKeDg51o+
	 Rfc2N69RvPkQt+CY0KX8SzJ5sWEKVDzrH0F2mtb0nVKmRo6jJD0cThJgDc9EzewFSFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792728982;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=REW8cSqOrGTueJ45/KR0c6ERYyEVm++bRRjGP5k8CHI=;
	b=QU96PX8iCaroDKsd5bBSYmvximJENZWYSAVIjGe+0XQi7OirBnv6PCvstnNF83HdW7vU
	 Z0ELmyHD39qWHXdqvq1XNIVqDnFZDfGfHXJrE8DiZ0Stl1bSk4elHy7Q/0QWMn255563p
	 40I7lmZW1AG8q6+zCJDLmKG/CKEpFvf8B9b0kSIOkFWmCTvBmRZaz31sFS8gILXh0A7xr
	 Ms2YsOtea6u4kpHxWbm0M3UqojUiOmDnTWMrU1FAnFFT9OgLx76n/z+9HOl9GEc6bD8e/
	 8C5/43y/WEJkhLp8XzqFFMF1VP978t4OJ3yr0i/O/0cI5aQ4RuOSipwCT++Bl+0zAzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.76.78.106
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B3A606A319;
	Fri, 23 Oct 2026 04:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B3A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMAWW6GR39pqwjIdAQ--.51358S2;
	Fri, 23 Oct 2026 12:16:17 +0800 (CST)
Received: from [100.81.40.43] (unknown [222.20.126.216])
	by gateway (Coremail) with SMTP id _____wAXAeeP39pq4HmzAA--.57740S2;
	Fri, 23 Oct 2026 12:16:16 +0800 (CST)
Message-ID: <b22a7b9f-c80c-485c-8691-ef25fa7546ca@hust.edu.cn>
Date: Fri, 23 Oct 2026 12:16:14 +0800
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
Subject: Re: [PATCH v2 2/2] docs/zh_CN: remove Translator field in header
 template
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1792569583.git.wy@wyuan.org>
 <89d676d79f25e12c1dcf19529f695117c7983263.1792569583.git.wy@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <89d676d79f25e12c1dcf19529f695117c7983263.1792569583.git.wy@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMAWW6GR39pqwjIdAQ--.51358S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrtw1Dtw4kur13GrykAFW5Jrb_yoWktrb_Za
	1kAF4vy3W7Jry8AFs5GF1qyF45ZF40kF1kJ34Dt3yUJ3sFv39rWFyDXrZY9ay3Xrs3ury3
	CFZxu340gasIgjkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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
	MIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/21/26 4:15 PM, Weijie Yuan wrote:
> The credits of the contributors are saved in the commit logs, thus we
> don't need to repeat these names in the main text.
>
> Remove the Translator template so that we will not sprinkle our names
> throughout the source for every change we make later.
>
> Suggested-by: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Weijie Yuan <wy@wyuan.org>
> Link: https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/


Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>


> ---
>   Documentation/translations/zh_CN/how-to.rst | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
> index 9ec2384e1e76..d448ae69e48c 100644
> --- a/Documentation/translations/zh_CN/how-to.rst
> +++ b/Documentation/translations/zh_CN/how-to.rst
> @@ -203,10 +203,6 @@ Git 和邮箱配置
>   
>   	:Original: Documentation/xxx/xxx.rst  #替换为您翻译的英文文档路径
>   
> -	:翻译:
> -
> -	 司延腾 Yanteng Si <si.yanteng@linux.dev> #替换为您自己的联系方式
> -
>   翻译技巧
>   --------
>   

