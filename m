Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA793E315C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797759; cv=none; b=ow6YjouLXJAF8jTKNWVbjJfMBONVGpYmb65IGL3BPzcmZs/5hFUtX88tqSLU0zYz7tqppStBvWChEH+/0sDVSej3DpVt+yxZiq4iJHdLo/o47vNs+SF5FNuAZEQfWDeUmtep5p+5v7pmBAX2H1FBNPnoWE3seIU3K9zycZCqnAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797759; c=relaxed/simple;
	bh=LBR+LlpmEqahXhiGb0ifgITJl7ZHa318ZVfy9+5bktQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=L8SlsZqlGxnPDkgiZf+qHGLgogx7rsE20Rh/1Q+xbaSgmC9decZLGwLbKZv2pGLxXaSi4TP5864X/CVRnQUfSQ3qT7/rE1b3KKJlIiZQfdJdTo2SDded0lxS3j+702QIqIb+yd4LDS5M9daD8sFRUh/sTAFjTLS+dfGMLp7lIg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (91.78.23.234) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 30 Sep
 2026 22:49:09 +0300
Message-ID: <5ccf82cb-d23b-49ab-89d2-609dc931c286@auroraos.dev>
Date: Wed, 30 Sep 2026 22:49:09 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tick/sched: check skew_tick kernel parameter's validity
To: Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen
	<anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260829202535.46470-1-s.shtylyov@auroraos.dev>
 <87ecebj080.ffs@fw13> <d95d424c-77a7-4c59-a7cb-9e547af7461c@auroraos.dev>
 <87tsn6h6p2.ffs@fw13>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <87tsn6h6p2.ffs@fw13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

On 9/30/26 10:36 PM, Thomas Gleixner wrote:

[...]

>>> And to make it complete, sched_skew_tick should be annotated with
>>> ro_after_init.
>>
>>    I guess you meant __ro_after_init? Would it then be OK adding it
>> in the same patch?
> 
> As you change the data type of the variable anyway that's fine. Just
> mention it in the changelog.

   Oh, I know the drill! :-) 
> Thanks,
> 
>         tglx

MBR, Sergey

