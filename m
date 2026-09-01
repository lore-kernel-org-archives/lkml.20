Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEB437FF75
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232372; cv=none; b=DlXR48zg5cKdIikhn4q3XToG4mJAS4sttnpxbJT6Wv3kdwSlVJZ35IV0f8mShjKqMvG/IyznUohXNgtj8PO/UD6R5pnowZO4DPxxEJ0j9TTaedHwHxtGeb56L0oUZE8LOLu7ezgs1SUAiMmQedabRS55iNN6o2vqIgHk5M0uU9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232372; c=relaxed/simple;
	bh=epqjbe2DpecLvTnw4zm95PN+TCsZQmZKjv18DROlvtk=;
	h=Message-ID:Date:MIME-Version:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hcjlzLUWHUJoqc9XNI7bLfiuNZVJpiyZK2QQ5KYyj3S7BoijOWMCbH5eGyI8aqHkHaAn7CiiKbqlfqzqskwIZFu9DtEKZM1jbMqvT8PEgPEsT2q/WRq1KUBtE9pm09fsHmu7x9TtWe93rMFA9VBFQUfmo96fnkhDW650QDk/bSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=2FuUIMv8; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="2FuUIMv8"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=868doxc2TiEPS+iWdp2u7jWKN/mr8YzZMB03OTDKqEc=;
	b=2FuUIMv8A45fN1Fg256xHW+FbTGN6KYBmeNOwXkCzXVvCN7SoCz8scEwm7lHDLIsvFM2jyQjX
	W+/0iVF57vRtyyFEUup9ar5K6RDt7U7qtaJd8vzSOpzNCGp5uQ+M0vLntMN5wsSRE8a3tr48RZ1
	n4cfmHC1EburblLfu6xnlwU=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hYrHN3fGZzRhS4;
	Tue,  1 Sep 2026 11:01:52 +0800 (CST)
Received: from whupemk200018.china.huawei.com (unknown [7.152.184.119])
	by mail.maildlp.com (Postfix) with ESMTPS id 9EFD34057F;
	Tue,  1 Sep 2026 11:12:39 +0800 (CST)
Received: from [10.174.177.15] (10.174.177.15) by
 whupemk200018.china.huawei.com (7.152.184.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 1 Sep 2026 11:12:37 +0800
Message-ID: <ecb5978d-977e-46a6-96bf-fb993a7804ef@huawei.com>
Date: Tue, 1 Sep 2026 11:12:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <mawupeng1@huawei.com>, <liuye@kylinos.cn>, <hannes@cmpxchg.org>,
	<mhocko@kernel.org>, <david@kernel.org>, <ljs@kernel.org>,
	<hughd@google.com>, <mgorman@techsingularity.net>,
	<yang@os.amperecomputing.com>, <zhangqiuhao@huawei.com>,
	<wangkefeng.wang@huawei.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] mm: vmscan: fix scan overshoot and ineligible folio
 scanning
To: <akpm@linux-foundation.org>
References: <20260811070849.1332165-1-mawupeng1@huawei.com>
 <20260811184241.e423b81c8a50d5f212af1c3b@linux-foundation.org>
 <ef7a72dc-fc5f-4b08-833c-05c4ab416605@huawei.com>
 <f53b5d3a-9f16-460c-a7d7-a0f518c2f21d@huawei.com>
 <20260829201809.99fe79c4725413bf80510fed@linux-foundation.org>
From: mawupeng <mawupeng1@huawei.com>
In-Reply-To: <20260829201809.99fe79c4725413bf80510fed@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemk200018.china.huawei.com (7.152.184.119)



On 周日 2026-8-30 11:18, Andrew Morton wrote:
> On Tue, 25 Aug 2026 08:59:54 +0800 mawupeng <mawupeng1@huawei.com> wrote:
> 
>> Hi, maintainers
>>   Kindly ping.
> 
> It's been quite a while.  It would be helpful to refresh/retest/resend,
> please.

Thanks, Andrew. I’ll retest it with the background (situation, end-user impact,
reproduction, A/B) folded into the cover letter and re-tested on the current -rc.

> 
> While doing this, please update the changelogging to help reviewers
> understand the end-user impact of the issue.
> 
> Please also give some though to whether we should backport these fixes
> into earlier kernels, with a cc:stable.  Given the unusual
> circumstances which are required to hit this, I'm thinking "no", but
> feel free to disagree!

On cc:stable — I agree it doesn’t seem warranted. The conditions needed
to trigger this are unusual enough that I don’t think a backport is
justified, so I’d lean toward not adding Cc:stable. Happy to revisit if
I’m missing something.

> 

