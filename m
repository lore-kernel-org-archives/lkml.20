Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.189.79.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664985;
	b=qYuNG/f0FTCa2vCR9u5Is503Leg5xOlQQ25gimnhvVjUHw9ZB2zu/PmjTIMgLktBo+fK
	 cvTaNH2TWgt1O5ys6JOUJcCnjTATyUt/ZyIYiyywa9oKoMyqR3OxbqzkR0S97lxIcuDdA
	 cN6D3pZMuXkggOLTfcvktow5FHKew+WIPFhuOVQCKdOM0ayT/P6nNy2tLM2/ZaC9EbUQ4
	 //1lRS1o22J55NINHjMFdCBpNJrZH5lgwCMKBP5ubwYQVJ7CpZvIxvdzqnqzb8YbUqjXQ
	 pu+bLIGzR5227ZL4Xl5Rj2VZeD0lUkdMIKOP2MEEElym/YN+is0ArVDTD8qqXsK5XOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664985;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=QiqjkBCOMtE2jhYiPZJ8T+B3Yye5QUJH8d9wksbGitw=;
	b=bOgB7QXS19fRrAnLNfjjetakQXMHXz4sE606/FezONJitJDxG3PBbKFqmaXLeZYxlbuN
	 UqARfVDHXTxlm5nJe8qNPSAmhmaXJr/3O5dIOUmJ3tHpunTf74F0yZaEGuWmCkHwSodId
	 JFYx189xbw5IGVCY/CjFD682wtXTYqBlOJmdOjmJCO5eNeYp2zE04grAsnjvgHijymSa4
	 9m2pe015Uk2NEkrf90D6i16fdf2qarAM1lG5DqMCKw1YkDhposp5/qY9f6zCU9AcJJOaO
	 sTZNAq48pIbhqZeJoHMxQG4tZbTJLweUW7Rd6D1hiwbV77E+xeqTAgvggMIAPXLCdxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=206.189.79.184
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECCC606A326;
	Tue,  3 Nov 2026 00:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EECCC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMB2nnfTJ+lqELVtAA--.23090S2;
	Tue, 03 Nov 2026 08:16:19 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wA3wz3NJ+lqOfQUAA--.29381S2;
	Tue, 03 Nov 2026 08:16:16 +0800 (CST)
Message-ID: <deea3016-1322-4bd2-9c03-05e9e32b486d@hust.edu.cn>
Date: Tue, 3 Nov 2026 08:16:13 +0800
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
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, users@kernel.org,
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Chen-Yu Yeh <chenyou910331@gmail.com>,
 Weijie Yuan <wy@wyuan.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IQEQrMB2nnfTJ+lqELVtAA--.23090S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxCFWrWrWfWw1kXF1xCw1xKrg_yoW5XF4kpF
	Z0gFnxGa1DtF1fCwn7W3WUCF1Yqa1fCay5GF17Ka1YyFZ0qwnIgrZ2yr43ua4UXF45Cry2
	qF42qa4UGayUCFJanT9S1TB71UUUUbDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQKb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1q6r43M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCY02
	Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUYHnQ5UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/20/26 11:35 PM, Konstantin Ryabitsev wrote:
> LKML has become mostly a firehose of patches that are already going to a
> subsystem list. The reason is THE REST: it matches every file in the
> tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
> single patch. During the week of Oct 1-7, 2026:
>
>    - LKML carried 13,641 messages (~1,950/day), 90% of which were also
>      sent to at least one other list;
>    - with ~2,100 subscribers, that is about 29 million deliveries per
>      week for LKML alone.
>
> This issue came up during the 2026 Maintainer Summit and the consensus
> was that "always include linux-kernel for every patch" was never the
> intent.
>
> This series makes THE REST a fallback as initially intended: it is only
> added for a file when no other matching MAINTAINERS section provides a
> mailing list that get_maintainer.pl would actually output for it.
> Patch 2 updates submitting-patches.rst, which currently tells submitters
> to send every patch to LKML.
>
> Several v1 reviewers asked for a catch-all list that would keep carrying
> every patch for those who want to follow all kernel development. That
> is a worthwhile discussion, but it is separate from this series, which
> only restores THE REST to its original role.
>
> Translation maintainers are Cc'd because the it_IT, ja_JP, sp_SP, zh_CN
> and zh_TW versions of submitting-patches.rst carry the same "send every
> patch to LKML" advice and will need a follow-up update once the English
> text is settled.

Will update the zh_CN translation once the patchset is accepted.

Dongliang Mu

>
> ---
> Changes in v2:
> - Don't count subscribers-only lists (or moderated lists with
>    --no-moderated) as a destination, since get_maintainer.pl doesn't
>    output them; v1 sent patches to e.g. fs/squashfs/ to no list at all
> - Add submitting-patches.rst update describing LKML as the list of last
>    resort (Petr Pavlu)
> - Rebase on v7.3
> - Link to v1: https://patch.msgid.link/20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org
>
> ---
> Konstantin Ryabitsev (2):
>        get_maintainer: only use THE REST as a fallback
>        docs: submitting-patches: make LKML a list of last resort again
>
>   Documentation/process/submitting-patches.rst |  9 ++++--
>   scripts/get_maintainer.pl                    | 43 ++++++++++++++++++++++++++++
>   2 files changed, 49 insertions(+), 3 deletions(-)
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> change-id: 20261008-get-maintainer-the-rest-fallback-6655e8a648d4
>
> Best regards,
> --
> Konstantin Ryabitsev <konstantin@linuxfoundation.org>

