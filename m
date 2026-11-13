Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560152;
	b=syUbNI0G5/F0v4zeojvei7Gi/hcTfh1k4s9IXDmzG5ZGOCZU+eAVzVrUDdXml2ZY+xvA
	 CVb+2KtJBej2liE6t4XI0W+Tfb+QN0RmN8ED1FiMfBfvIGENN2YnbqjNyrFcmvhNMU+g8
	 /2uyh5WUXZQzrhVmEq92xvNOloteMjXTjaIEycJgEoH7bhymkZeIRVSQm7WDXB1lL+Out
	 gfcMTu9xIEly2EZjI9FI3JJysBV0Q9fJcYGDSNjomT5L11rs2vIGcHGPfk+/oV4gZkd7N
	 E/4mlgWV78rF/b7+OoFz0JhT1IgRkGwRpv7ni1Uzso3e9fxxr6wMPjyCJHa73wowDpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560152;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xbWpqpVEiuE3z83GiQA0YLlwDhjEJ8fHQ7f78aTTUNM=;
	b=sBP6US4MozaBDukxXAzM5CtKWPCdCx0ZoGkCzwoTS/WZQV35hM1HnssDWOEpXDgjeXkM
	 6ztAMScvZRpRx7Sca8JH5UXiisPIuFH5+ToVPtEURsYUwWfZGLHzRsuxbnu5b5d+RiT7v
	 5BCeQwTCLHH2Riq27qnvs3NvLcWEVwmVBt+n1Jl7AAfOmdbO3qVsBG0I2Ukb6gT1tcs6F
	 +snMvricraVvdkSdgyG9gwSpg/79sc00vWGkcLKkNp44zlkoi4U0+mId5VRL302C6E3am
	 t0vyKoAf95AF1hGIGYopcoJLV6x3Kj9bX4mvCtj84RM/qaJ5ZqSfbGqbAbt4n3j6zuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=fFXXsTut;
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7626E606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7626E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=fFXXsTut
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794560142; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=xbWpqpVEiuE3z83GiQA0YLlwDhjEJ8fHQ7f78aTTUNM=;
	b=fFXXsTut4QijhUWgRBPgE4k4sELZIkJ+h2qiWztIOms7r5LNojCkCMAwyk/0517mCll1+vPq2NLGGiKWvJD1+06gG7RR434XgNYZKbBruVfGduNZMt2QG9UP1TNKCO2Yi5MhIySuhEcQmQs4A+G+K0dDC7v5pU1CzZNOnQP+NVQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XEeeDi2_1794560138;
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEeeDi2_1794560138 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 16:55:40 +0800
Message-ID: <79229fba-8019-46d6-9cd4-a24a463474be@linux.alibaba.com>
Date: Fri, 13 Nov 2026 16:55:38 +0800
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
Subject: Re: [PATCH v7 01/16] mm/mglru: report evictable sizes per type
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org
Cc: axelrasmussen@google.com, baoquan.he@linux.dev, hannes@cmpxchg.org,
 hui.zhu@linux.dev, kasong@tencent.com, kunwu.chan@gmail.com,
 liam@infradead.org, lianux.mm@gmail.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, liuxiang.277@bytedance.com, lyugaofei@xiaomi.com,
 mhocko@kernel.org, mhocko@suse.com, qi.zheng@linux.dev,
 ridong.chen@linux.dev, rppt@kernel.org, ryncsn@gmail.com,
 shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com,
 weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com,
 zhuhui@kylinos.cn, sidchintamaneni@gmail.com
References: <20261111232603.9934-1-baohua@kernel.org>
 <20261111232603.9934-2-baohua@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261111232603.9934-2-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/26 7:25 AM, Barry Song (Xiaomi) wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Change lruvec_evictable_size() to return the number of evictable
> anonymous and file pages separately instead of a single total, so
> that callers can weigh the two types independently.
> 
> Update lruvec_is_sizable() and get_nr_to_scan() accordingly; the
> summed totals are unchanged, so there is no functional change.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
