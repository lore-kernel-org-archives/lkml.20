Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339433;
	b=OQnRIDNavCxVj+QcDorkjp2v1DHQQ53SwAaZjTYfRf/Of6OwgPRTP0bxahF0MZKNKQzN
	 h/SX4T0yUb3VI8+1OaOV5J+ynahJnppI2GZ9z/3pHZRaolz6cJUVV3CqHvKDhJRMe6Tej
	 PB6YQ/qlBrjCtLnofnud9TUSlI9hkVZCQsPVMMjxaZbl21mBwcS+XKek4RN7tT8dgCLBS
	 bWlLJEmHacfsqQSFUIlR0C7mDgq/iDpQEHYAXlAaCVzNpusDa+03R0jhCD9p4VRzF7sZ9
	 3SNeQC0dEArjBltETdXCl/51RTlTXH/i3NOlow7ZJQhYkVnEvKanuIeNyv5quVcqqlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339433;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=nRLWCqYk1y7vVdpT5+4Ia/48/2K4M5vE4bN2ZGaSYiI=;
	b=c1P8HmgEYZ/dfb+pi+bw9rprmfliGQeb1o7v9U+ZXy1R4+DPdREw4iT8pcTKz0pV2avP
	 9yuWIZYvfl520qLk8LbiW8lAcnvwoKZw/jyqXWSi0VsOx/YAObDHD+KhKYlRySAePKumR
	 dYBSt8iqx9X0eOAtaX0SGxOLfe2xUVIoaJpnulgBKhG+/dMe8Cu/lukcfxx34gw3MAcDn
	 l65AB1F+CnoCBRpK4QN3Xef0Foh5bZ4JUP/8A6byuS7WPba0IQQvsV4J80xQvj7DVAZTx
	 uf6Jq5zZpxLs8+YR2/t7geMdbQ6dbrOQtSBZBi2blU23N2SmDUylPHJ8QzefmistZBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036D5606A31A;
	Fri, 30 Oct 2026 05:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 036D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMDW_XYdMORqad9lAA--.2791S2;
	Fri, 30 Oct 2026 13:50:21 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDXsToaMORq2acKAA--.1267S2;
	Fri, 30 Oct 2026 13:50:21 +0800 (CST)
Message-ID: <b95c5ea9-cb4b-4535-8eb0-0318357aa11a@hust.edu.cn>
Date: Fri, 30 Oct 2026 13:49:11 +0800
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
Subject: Re: [PATCH v2 0/9] docs/zh_CN: align translation paths and update
 guides
To: Weijie Yuan <wy@wyuan.org>
Cc: Weijie Yuan <kernel@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261028034134.4144660-1-dzm91@hust.edu.cn>
 <auGucr4smrSp9g5l@wyuan.org>
 <0ecb719c-5e0a-400c-b1b3-da2923c40bb4@hust.edu.cn>
 <auQPB6S1VAFOLuhs@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <auQPB6S1VAFOLuhs@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMDW_XYdMORqad9lAA--.2791S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxJr18tFWfWry7uFy3Gw1fCrg_yoW8Wr4xpF
	93WFyI9a1fJr1fArn7K3y7JF1fKF47Gay7GF17t3sayFnav3s5tFWrtrZ8uF9rXrn5ua47
	XF45tF95Xay5uaDanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQlb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUAV
	WUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4
	AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/30/26 11:29 AM, Weijie Yuan wrote:
> Dongliang Mu <dzm91@hust.edu.cn> writes:
>
>> On 10/28/26 4:12 PM, Weijie Yuan wrote:
>>> On Wed, Oct 28, 2026 at 11:41:25AM +0800, Dongliang Mu wrote:
>>>> Several Chinese translations are no longer at the same relative paths as
>>>> their English originals, and some Original fields are stale. This series
>>>> moves the translations to matching paths, adjusts their indexes, and
>>>> removes stale Original fields. It also updates selected translations to
>>>> newer English commits.
>>>>
>>>> v1->v2:
>>>> - Drop the unused top-level readme_zh label from the translated
>>>>     admin-guide README.
>>> Hmm, so why still keeping these labels here?
>>>
>>> [2/9] .. _zh_applying_patches:
>> This is necessary and used by another location.
> $ git grep -n -F -- 'zh_applying_patches' Documentation/
> Documentation/translations/zh_CN/admin-guide/README.rst:82:   :ref:`Documentation/translations/zh_CN/process/applying-patches.rst <zh_applying_patches>`。
> Documentation/translations/zh_CN/process/applying-patches.rst:11:.. _zh_applying_patches:
>
> Seems that it is only used in your patchset? Because I didn't create
> this label when I made this translation.


Yes. It originates from the English documentation. To make the 
translation have the same style, I create a similar top level label in 
our translation.

Dongliang Mu


>
>>> [4/9] .. _process_index_zh:
>>> [5/9] .. _magicnumbers_zh:
>> The above labels needs removed. I forget to clean the same issues in other
>> patches.
> Thanks!

