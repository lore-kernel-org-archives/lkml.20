Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9581D22B8DF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787877184; cv=none; b=l5usSk/BHCiWk4/bzwIBL+oNwqnXURSXFVoPfJD/f+j238adBoUjbNCXj+8EfZJOa8J/5NY8sbDjlRS2+byDOzLeam2QkIsUGgosD3ONOuI/LDSZUFcnudf/goDUlN0rcUZb8r8Ab0Hrt1jPAGzjt7se/xzhsWw9JbOfsNIYaaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787877184; c=relaxed/simple;
	bh=iTCg9padcRp9OnHk/rLQFpk9o+D6QNHCVMMTKqCIXh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ltqHDbVljIgPMubC1B4/JKq4a/8/H4OftaZnhTvX8MvAZjRW09EFzRUu2O+VMna4vKYfWegcSW0ObLQy2oICcytWcj90Ck3dug6rOjZsdSzB+jDcIF8dXe6/dQnTyg4hqi9TiMQ2Spkzo/6RQjAJr4lB+M0se+oRzvDBwTfy7Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=TDC95cvu; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="TDC95cvu"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787877178; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+7xdGd9TqGZbrCxJ96IaSdBVpCo+88VJ8jMieceLa5Y=;
	b=TDC95cvuW1hy16opYNH9OTz6HaCNNHlkC05cUNYgxxB0BPVKzH90iM3ZZJLvkGQqaRI8RtAavjKzL0/Mvj2lpJ51zrlXG08hA2+dL1GNLZyYtjvIoXAqtNRyAfyVpjg0jVaaKyJSNJ9j3KxrrfF6Vu1+CIXxex3hUeRix0/l1os=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R991e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0X9khrQ2_1787877177;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X9khrQ2_1787877177 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 28 Aug 2026 08:32:57 +0800
Message-ID: <7891d521-5541-4461-b0b1-e8f4fedfe37c@linux.alibaba.com>
Date: Fri, 28 Aug 2026 08:32:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself as a THP reviewer
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, "Liam R . Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260827103435.1371882-1-kas@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260827103435.1371882-1-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/27/26 6:34 PM, Kiryl Shutsemau (Meta) wrote:
> I have been working on transparent hugepages since 2012, starting with
> the huge zero page and file-backed THP.  A lot of the code that causes
> pain now traces back to me.  It is only fair if I share the review load
> for THP.
> 
> Add myself to the reviewer list so get_maintainer.pl puts me on Cc: as
> well.  It is also my commitment to be more active in reviewing this
> code.
> 
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

Great.

Acked-by: Baolin Wang <baolin.wang@linux.alibaba.com>

>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1be7da9b6e2e..f5bb29ba41c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17264,6 +17264,7 @@ R:	Dev Jain <dev.jain@arm.com>
>   R:	Barry Song <baohua@kernel.org>
>   R:	Lance Yang <lance.yang@linux.dev>
>   R:	Usama Arif <usama.arif@linux.dev>
> +R:	Kiryl Shutsemau <kas@kernel.org>
>   L:	linux-mm@kvack.org
>   S:	Maintained
>   W:	http://www.linux-mm.org

