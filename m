Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483440;
	b=gY9k7Aa0eNtBO28O3FqYuuaDsL4FeTw1WGbzetUJphttaPtTVNirL+kzoi1tYg7smPlT
	 9JT6oI9+jKKI69MQpIyN8BWeQBugFyDPh7zuP0u0W4dqbuyJFmJJ9y4KeB0NlzvIs0a5n
	 vrtYHV6Bqnbsh3GTlykge6mXg2ZWrrhR6E7tL48xxOVTVb2sLgecbU1CzjSSc9z54LllF
	 l//CHq1dxvVyGgI+r1C8ENX7k+JCMgMEQxM+dslhVjuB3R6JEpdfN0IlteYE5Mgg6i3nT
	 UUedgp07lQVBIv2eJO3vjgeDhUB6JmFnKBuPRkIbODwKOSnPKPHN5Ap21oQUJI3QZug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483440;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Pw4XPMCNw94/e6qgBxyGiO7Si6B6BDxB+dFAw5oBK48=;
	b=reHBo9PeMVLJYp7bOs4h9WS55QjCxdyakTy4l1zp0ukw/kZd5XmOW/o2fdyY3rNBmyTV
	 3jSjNPcS95r8zLaoibzXgCQIcvnJAJSxA7tUwS0HI2a4LR7upcJx1l9VDunP3RdK5tNg9
	 ptttIheQ1YkSNOQAGAkQfWqlcBSGJ1y2vgeh/yYatPo0U/w5R4rAZEfpYV2Byj9OH41F2
	 2jXiTFd2e2773yhtXZKF/TxF5HahiJRriyMXJWnf8V2j8VyOV09AFqpXW+1HjC4WCuQ7d
	 oVvHMm/JPwcC2UqEiZ9nxDGFEeX8y7Oro+PtYwHtu2r53e5I+ocwgrw+kSUY83TVZJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NO6Nmu+Z;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D233F606A323;
	Thu, 12 Nov 2026 11:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D233F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NO6Nmu+Z
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D8BF153B;
	Thu, 12 Nov 2026 03:37:16 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.14.230])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B919F3F632;
	Thu, 12 Nov 2026 03:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794483439; bh=vTwt6H25z0763sueGZiIZeSWDqKIPD9kv2oCMsZXnIs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=NO6Nmu+Z7bKfxKpT++lUuenb1Jioyu/gghNRzlSC4VKoJZMPI0kqYWrr6GH2vE5I9
	 mypbhw5P3w9MIGIDbhERl4o9J0m9U/bMeXpiKsWWjpA89BTaWgTB6cBuu6wonNArCT
	 4dKXPmKNc0lixXzI0+f9sgbBUickWqMiMno8XXgI=
Message-ID: <9e4852e4-0bcd-4cc2-8f80-367340fb4923@arm.com>
Date: Thu, 12 Nov 2026 11:37:12 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 RESEND 2/7] fs/resctrl: Do not allocate a monitor
 context when releasing limbo RMIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, gshan@redhat.com,
 zengheng4@huawei.com, jic23@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261110133938.3768632-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 10/11/2026 13:39, Jinjie Ruan wrote:
> Busy RMIDs of a monitor domain are normally released by the limbo
> handler once their cache occupancy drops below the threshold. When a
> domain goes offline, its busy RMIDs are released without checking
> occupancy, since the domain is going away and the RMIDs would otherwise
> never return to the free list.
> 
> On the monitor domain offline path, __check_limbo() allocates the
> monitor context that an occupancy check needs before it scans the busy
> RMIDs, but without using it, and returns early when that allocation
> fails. Then the caller destroys the domain's monitoring state, including
> the bitmap that records which RMIDs are busy, so nothing can clear those
> bits afterwards and the busy counts never reach zero. Those RMIDs never
> return to the free list and, where the RMID depends on the CLOSID, the
> dirty count of their CLOSID never decreases. The allocation can also
> wait for a monitor to become free, which stalls the CPU offline path on
> a context that is not going to be used.
> 
> Only MPAM systems are affected. An architecture that can always read an
> RMID allocates nothing for the monitor context, so the allocation can
> neither fail nor wait there.
> 
> Move the release of busy RMIDs into a separate function that does not
> take a monitor context and leave the occupancy check to __check_limbo().
> 
> Fixes: e557999f80a5 ("x86/resctrl: Allow arch to allocate memory needed in resctrl_arch_rmid_read()")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: <stable@vger.kernel.org> # 7.1.x


Looks good to me.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

