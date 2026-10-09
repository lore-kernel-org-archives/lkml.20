Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EFA1A268
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514539; cv=none; b=WwdgVB096qmWASThalUaQy8c0b7UexNdEZ0TSl6GA0t7AqrIdRWf+68sN+wud+MMpLg81qCfEEs0fKg63EjMKeUZPtXVTzFnUwUFald64qf1T1Jt0H6knqbwgEEyslvuNS4jimnUqj420igQQ2v7RnIeFj5YZtVafot5ThB2yHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514539; c=relaxed/simple;
	bh=Ct8yNkooaldGN11vhPtna2+mcNLdqWrOnXE5QBdIt5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VY2YP3q4gpS1jB8ASv/K9izMOT5ES5xpYJN0AsE+7tm13IbpxgTNPJlafMO0eOn9/MyBHOWzhGdGIj5LU77H+Ax8c4z6Lpt1v2mGodpuRxj4iYlDajtk8WZtWolWkYXYYStAtvLSOEDOtbXGyj6xfWGt17sSgykJxdFX5OTxsec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: de843150c38c11f19a56ed5b684f684d-20261009
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:df38e0fa-42d6-4b4e-b220-42dbd4841ba5,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:df38e0fa-42d6-4b4e-b220-42dbd4841ba5,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:7fa12509e2d68185632cecef8499b55a,BulkI
	D:261009105525E3EMKDQM,BulkQuantity:0,SF:17|19|38|64|66|78|80|81|82|83|102
	|127|841|865|898,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:99|1,File:nil,
	RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,D
	KP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: de843150c38c11f19a56ed5b684f684d-20261009
X-User: lienze@kylinos.cn
Received: from [192.168.111.179] [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 138785289; Fri, 09 Oct 2026 10:55:22 +0800
Message-ID: <da938bc5-b0fc-443a-bad4-1a6e7e1cf41d@kylinos.cn>
Date: Fri, 9 Oct 2026 10:54:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/damon: fix typo and grammar
To: Manuel Ebner <manuelebnerli@mailbox.org>, SJ Park <sj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261008162010.4010682-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Enze Li <lienze@kylinos.cn>
In-Reply-To: <20261008162010.4010682-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Manuel,

On 10/9/26 12:20 AM, Manuel Ebner wrote:
> DAMON_RCLAIM -> DAMON_RECLAIM
> set as -> set to
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> CC: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
> ---
> I hope I got the right git-tree. somehow there's 'damon/next'
> and 'damon/next/damon/next'
> The other patches will take a couple more days.

Thanks for fixing these, Manuel!

Your patch applies cleanly on top of the mm-new branch, so the git-tree
is fine for this one.  For future DAMON patches, please base them on
Andrew Morton's mm-new branch:

  git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git (mm-new)

For more details, see here [1].

[1]
https://www.kernel.org/doc/html/latest/mm/damon/maintainer-profile.html#damon-maintainer-entry-profile

Reviewed-by: Enze Li <lienze@kylinos.cn>

Thanks,
Enze

<..>
