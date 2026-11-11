Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386208;
	b=nsSsMdNVlQkJlK1iJk7n/k+AtPUy0lI/FlQU5n/oIlDqZ1MauFSDvh2sYKzxFRBHfM50
	 DHsMSkjWFXkzPXCMw4sveVCWpgTiQfFoioylGVngyUl3T2Hqm7FZ51OJULNVcRyWrMq/I
	 vC+xbmwk48ZtoZmQ/9zASnsoM3j5BjmiWe2M2J6GsMJNK5S/ydgfY2U7XfqJO4gakmRrn
	 Er/UizSRRKRL2h2EH9jtdEctg66oqvRTLXC2JiBKTDNJSuQHNOJ/CyVt/N27wdmRuo6xz
	 w4URxPAQXQReOaJhrtuCmQy0R+iZm+yeGOxbB3iT3pkb7DU4//rnWwDdohn5Byy+7Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386208;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=TnhV3DbKZWbMAtT9a/e9FOskuGL611yq4OzHpAPLFCs=;
	b=bMnwPlEqfbInlyAyWcRlLHVMNcWhsMnePJy/ar3oi13GiBrAYf3T7uL7PMKVZIqpWXeG
	 Pxcv4c9WWFWoZTJgti1KFzGwHdJFgOfr5UD4rbyJal59gNnJrIFcNGKJdx79AnyTnxXLZ
	 D+4xTvaOPrW5vmIek0DOrw06MqOtYjnmtf3stK3qMpmdRMlI1VneXKTF2WzW3JPZ3fVJl
	 WR/F+CF5Gxp332AdEPI6vomxYaTrXpat+npdvxE94lAC1gO7BllktduyjGcIa1X1yko9Y
	 H/Ba7jLkCINHYy7G6svh/pvL/VP/t6owYey1oSdnzLwcvP5ef59JDaqJkfsnBFujJAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81119606A32D;
	Wed, 11 Nov 2026 08:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81119606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.102])
	by gateway (Coremail) with SMTP id _____8AxHNIcKfRqOnseAA--.22648S3;
	Wed, 11 Nov 2026 16:36:44 +0800 (CST)
Received: from [127.0.0.1] (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJDxg8wZKfRqdK8zAA--.11977S2;
	Wed, 11 Nov 2026 16:36:43 +0800 (CST)
Message-ID: <7eefcba3-42dc-4229-863f-e6d440e49e4c@loongson.cn>
Date: Wed, 11 Nov 2026 16:33:54 +0800
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
Subject: Re: [PATCH v6 2/4] EDAC/loongson: Encode node and MC info into mc_idx
To: Borislav Petkov <bp@alien8.de>
Cc: Qunqin Zhao <zhaoqunqin@163.com>, tony.luck@intel.com,
 linux-edac@vger.kernel.org, chenhuacai@kernel.org,
 linux-kernel@vger.kernel.org, Wang Jinwei <wangjinwei@loongson.cn>,
 Yulong Wang <wangyulong@loongson.cn>, Dongyan Qian
 <qiandongyan@loongson.cn>, Chao Li <lichao@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
References: <20261105025532.2055-1-zhaoqunqin@163.com>
 <20261105025532.2055-3-zhaoqunqin@163.com>
 <20261110064106.GAavK8ghva7DgZ35DK@fat_crate.local>
 <809041a2-ebdd-409d-a1f4-3ac7884513d2@loongson.cn>
 <20261110080338.GJavLP2h448voZSQRE@fat_crate.local>
 <61dc34e7-e872-42cb-a0b1-be100a78053a@loongson.cn>
 <20261110183101.GEavNi5Qrv3eLe80VL@fat_crate.local>
 <f34b681b-1499-43c8-b8a7-1437409bd709@loongson.cn>
 <88040256-91E2-4EAD-9571-4B460E69A93F@alien8.de>
Content-Language: en-US
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
In-Reply-To: <88040256-91E2-4EAD-9571-4B460E69A93F@alien8.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxg8wZKfRqdK8zAA--.11977S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Wr1kZw43AF43ury3Zry8Xrc_yoWxAFc_Ka
	9xZ397G3ykJr1kG3sFvFyxurn7W3yvyry0qanxtF1I93ZIqFyFgFyDGrySg3sIqrWUXw1a
	q395XryfCrnaqosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbVAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWU
	AwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
	0xZFpf9x07jepB-UUUUU=


在 2026/11/11 16:08, Borislav Petkov 写道:
> On November 11, 2026 6:37:39 AM UTC, Qunqin Zhao <zhaoqunqin@loongson.cn> wrote:
>> If we encode the presence of the _DSD property into mc_idx, 
>>
>> the sysfs representation will become confusing. For example:
>>
>> loongson@loongson:~$ ls /sys/devices/system/edac/mc/
>> mc65536  power  subsystem  uevent
>> ^^^^^^
> Does it really matter which wrong numbers you have there? They are wrong no matter which ones you choose. 

You’re right, it doesn’t matter which wrong numbers we choose. 

I’ll rework this in the next version following your suggestion.

Qunqin,

Thanks.

>

