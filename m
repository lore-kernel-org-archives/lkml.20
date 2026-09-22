Received: from mta0.migadu.com (out-29.mta0.migadu.com [91.218.175.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C090A3E51FF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064782; cv=none; b=M8pcRAJKghte59K63ICY1kPt2Vn6Cs+OK8DLHlNF4U80CkRiR25T8OTFVceW63BbAFzevMdjwl/VFlDSoVY1Ju7S7P5ojUAlfVJbw8S8Fp4oH82alLOUQzPaMirasUCg5mLCNr7WLbQSZjop8Yxzvmuh9JiA/rryxI/GovGJTjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064782; c=relaxed/simple;
	bh=u0QxjtjmQE5VvsgjRmYJRV+MOX2c7kGivVyl2p9yp0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJLNTSDyoANxgeTDUaigdNXwl0dqPjY4dQjbLOwWK5Xh0olUYERiHPlQZ81SVhMxHAGo+EPJ9CmXuRhMaAMp42ZxI76l9htltbCa+OYvh952Hf9w7u+XHwIiFMmiYmMyMKPxGlgWXrzliJHhsnbQsd796W2veO26tSG26B8EgxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dHviHVJ9; arc=none smtp.client-ip=91.218.175.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dHviHVJ9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=u0QxjtjmQE5VvsgjRmYJRV+MOX2c7kGivVyl2p9yp0g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790064778; v=1; x=1790669578;
 b=dHviHVJ9ydbDTEnVN2wn+D+mLbnXtT6cg67RjAAyW/cXorCbCPX2xacHpXRwdJzckoSsdp8s
 2pfi+msGR70nlVMIGcHPhNG/1oTXS0SoW8U6gB4OEO/WeZMwcbqcCHCTJNrJYW0s8igSIbSZMi2
 fOG1V3Tq5n0QvejcsGVivV/U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 048c39df30f9f240;
	Tue, 22 Sep 2026 08:12:58 +0000
X-Mizu-Trace-ID: 048c39df30f9f240
X-Migadu-Flow: FLOW_OUT
Message-ID: <96981a8b-0a93-4ed1-8d71-f01db02035d1@linux.dev>
Date: Tue, 22 Sep 2026 16:12:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mm/sparse-vmemmap: remove the unused ptpfn argument
To: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev
References: <20260913083734.86802-1-songmuchun@bytedance.com>
 <20260913083734.86802-5-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260913083734.86802-5-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/13/26 4:37 PM, Muchun Song wrote:
> vmemmap_pte_populate() no longer uses ptpfn as an input. Drop the
> argument to simplify the code.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/sparse-vmemmap.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

