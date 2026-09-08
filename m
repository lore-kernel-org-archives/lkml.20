Received: from mta1.migadu.com (out-139.mta1.migadu.com [95.215.58.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BD3332615
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788834821; cv=none; b=RvRHfcQmLZutKxN/+fHuxElWGtV+OFhv77o+3hJwPGGAUQbJW6fU5dsKSpsnBA8qre2FgVzy9Yu/RtdicJaw/XpwGyfvQLFibhkeVjtkGbOztXAFmQr9mhidQuoer4iK3bc0J/aF3CpXRjvICWykb6KWyWXZTJ8hl9VdGwrtgsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788834821; c=relaxed/simple;
	bh=R8+z3o1kgaYxeVPoiKPiKfc3vwuJg9i4MPUEOvW9gvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIIgeYkJCI7nRz7KepwtJ7hA4spXwFd4nJ8RjlJAPw87Hk3SIboTaU9fNr2mhL5ngwUDSGftv4IStsQpFAoQXBziWWokr5IQGBvmcmE64Py9T4wCwEdiFhycP/CUEzfzPlB2ZBDZVfgUpyrtdHAUeNr3aAGbUWxz7AbKrilj51w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DRU7Hq3r; arc=none smtp.client-ip=95.215.58.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DRU7Hq3r"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R8+z3o1kgaYxeVPoiKPiKfc3vwuJg9i4MPUEOvW9gvk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788834816; v=1; x=1789439616;
 b=DRU7Hq3rZjbEY1gkf193siiKBkkmZcVtmDp3nMOgpDc0qTC81pyYwJFM9NirjtMHhVtI8ryC
 cNuSvti+2GZ0HziNc93ezpVsn/fPuTDt3UENVj4qNhgJws8HNxl+7HZAGAwAzgt0VtwR3wrsz/2
 MzpyhZXfQ+EK+S5ltua/MI8Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 41c10c52aea90560;
	Tue, 08 Sep 2026 02:33:25 +0000
X-Mizu-Trace-ID: 41c10c52aea90560
X-Migadu-Flow: FLOW_OUT
Message-ID: <d97dcdb4-d060-4e1a-9af5-6b768339fdf6@linux.dev>
Date: Tue, 8 Sep 2026 10:33:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add Baoquan and me as MGLRU reviewers
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
Cc: kasong@tencent.com, shakeel.butt@linux.dev, baohua@kernel.org,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 baoquan.he@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <06e20ef4f603a4ffeafcdbf623ce2936281457bf.1788831480.git.baolin.wang@linux.alibaba.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <06e20ef4f603a4ffeafcdbf623ce2936281457bf.1788831480.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 9:42 AM, Baolin Wang wrote:
> Baoquan and I have been contributing MGLRU patches and helping review MGLRU
> related patches for some time. We will continue to follow MGLRU changes, so
> we'd like to be CC'd on MGLRU related patches.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4d1ff4c76496..c558d5370dd0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17242,6 +17242,8 @@ R:	Barry Song <baohua@kernel.org>
>   R:	Axel Rasmussen <axelrasmussen@google.com>
>   R:	Yuanchu Xie <yuanchu@google.com>
>   R:	Wei Xu <weixugc@google.com>
> +R:	Baoquan He <baoquan.he@linux.dev>
> +R:	Baolin Wang <baolin.wang@linux.alibaba.com>
>   L:	linux-mm@kvack.org
>   S:	Maintained
>   W:	http://www.linux-mm.org

