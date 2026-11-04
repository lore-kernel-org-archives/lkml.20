Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802785;
	b=t09hult4dcVVbr3OYb3N/ikS3GHuOrR3kvahGe3TxCluyKFuVh9OUNIc6FPGttO9UH+l
	 s5FZ/5x98c9G4FME/OwT5cIpmn7/92BSVCV+RajgU8Pf2Jxh7R5P33FTfnWS6Zy68DfbF
	 7cqL+FYx1Pmhp+uIvDejFLjdpOziI2yH0WNjptGmlNydzE/GyCxn1/unEM2NquNiyYfTD
	 xsNKdss6s8w8fMx0JCcx+1gKH60kLfvhrvzGLIVGmSUKVcsXxqzaWmyUsvSgwDFvWUqhQ
	 GTGeSLbh51ZvntaOfciTfe9IwDF5fl8b0ywgDdO+iSVsaquOc6IXwZ18Aa6L4J/XCeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802785;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=uC48wbYZzsJzBENDo+5c6rw2nfd9EDxqoIJuOc7Fyik=;
	b=n4hSkIgT5FTyg+qK9qEULujkNVf9zBZ9dITNTTFxiyZd/WDFcuHIk+4YCspCIEZI13Nv
	 NZP59S++9zUy+R2EgYX2b7sKo+Mh4hXNHcs5PnGZYMn28iOD2aae4UqE/LUYjwgaz8YOf
	 xDoqeBNjyYjplDkdEUt4vgxz/Wu5D7Oyw9GJtMrqWFkTdrKouZJJr/80m8B+PPbByVTNd
	 bLc8iRxahrrbivNbX/fuqr7znXswMtYFvl3Zo0QoKvhvK1uD/ecsHI5ZyUx35a36soBAX
	 B1yMzME2sKeUKFEwutbcspnrcl7ADo5/lvhVR2KjVXADPLpuzGQFH7t53rTEU2jES5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B29606A31B;
	Wed,  4 Nov 2026 14:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B29606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMBmL2sUQutq3FEAAA--.2360S2;
	Wed, 04 Nov 2026 22:32:52 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wC3sN8MQutqlBMbAA--.36795S2;
	Wed, 04 Nov 2026 22:32:46 +0800 (CST)
Message-ID: <78d0a4ea-d621-4408-8efd-d8c9bb1f6841@hust.edu.cn>
Date: Wed, 4 Nov 2026 22:32:43 +0800
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
Subject: Re: [PATCH] docs/zh_CN: fix stale :Original: reference in
 xfrm_proc.rst
To: =?UTF-8?B?UsOpbmljaCBCb24gxIZpcmnEhw==?= <renich@evalinux.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Steffen Klassert <steffen.klassert@secunet.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260920073144.546566-1-renich@evalinux.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260920073144.546566-1-renich@evalinux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMBmL2sUQutq3FEAAA--.2360S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWUKFy5Ww4fJFWkGw1Utrb_yoW8AF1Dp3
	WFkF1xJa13C3WYkws7Wr4xGFWUG3W8Wa9rKF17Jw10vrn5JFsYkF4ag3s09F97JryrAFy5
	X3WfKryYqFyjy37anT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQCb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUsqjgDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 9/20/26 3:31 PM, Rénich Bon Ćirić wrote:
> Commit 03e23b18c720 ("net: Move XFRM documentation into its own
> subdirectory") relocated Documentation/networking/xfrm_proc.rst to
> Documentation/networking/xfrm/xfrm_proc.rst.
>
> The Simplified Chinese translation was not updated accordingly,
> leaving its :Original: tag pointing to a nonexistent file and causing
> tools/docs/documentation-file-ref-check to report an invalid reference.
>
> Update the :Original: path to point to the new location.
>
> Fixes: 03e23b18c720 ("net: Move XFRM documentation into its own subdirectory")
> Signed-off-by: Rénich Bon Ćirić <renich@evalinux.com>

Hi Rénich Bon Ćiri,

I have proposed a patchset to revise all the inconsistency between the 
path of Chinese translation and English documentation and these invalid 
original fields.

Please refer to this patch - [PATCH v3 8/9] docs/zh_CN: update 
networking/xfrm/xfrm_proc.rst translation

https://lore.kernel.org/all/c641a11c-39c8-40c4-b162-10f3a3db57ff@linux.dev/

> ---
>   Documentation/translations/zh_CN/networking/xfrm_proc.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/networking/xfrm_proc.rst b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
> index a2ae86c44707..6990f8e2fdb4 100644
> --- a/Documentation/translations/zh_CN/networking/xfrm_proc.rst
> +++ b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
> @@ -2,7 +2,7 @@
>   
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: Documentation/networking/xfrm_proc.rst
> +:Original: Documentation/networking/xfrm/xfrm_proc.rst
>   
>   :翻译:
>   

