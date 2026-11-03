Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707035;
	b=1UhSQ/ovrtQOJ237J/n6iOnF4FkGoCX5Rb9aJbbD+thw76QxX23Scc/4Yx/06uHyR2mq
	 JZCEyBonWEp7lqcVYE3AZQH/PqgKyu/5tpz3aspLX120+O2gXWRTcc3Gd8Hc8XceDRoSB
	 TTSCV1dUJr2vW6ma8NMIWuHYAXBTlBdS3wDnJiBXsTn/ZNkn+g0xPGhmLqo5QHB6zBmvN
	 +9YwrbWaaXBgVYbOe0rIB4YURN7Kpf6+kOn34PKLMLqm6daFsxvnDIOp+5rclAlnZlJ94
	 R3gB12Pr2tCwDlHOdkenSkZczgQETvWImTts1P2auqdVfJtfjpiJo9KqV91dzsNALyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707035;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9sHZp3fDT8MdLdnD1VHW6kDwokQ+jpK3v6Y8Al7fDoQ=;
	b=Gzj7WPJnRQTJTeyle6FBpCU0NzDYje3o797yC6P43EvPHVXShoV9PVADo0p6YuNb2nxO
	 +SJ8GGKyC6uEUYgtROJbXmPtlg5hqS4VjEl8C3V54TBtx+r99jihmqQOqSDPNza7GJVEe
	 wmmXCZQiNwTbuVY3cndN1x8N5DyDie6gJ2Qjpj8rdf2tqsA5To53zMDd0ZZZVNI5Bd+oT
	 8kcm313oBSOv2VuTnYC3IV/99syQvEjpweG9WnsPrZbnjeh9LajDlEw7Cr8y6HZfbWHXc
	 inRYFGe2u5Mw3avhEC6A5kbi+jl4w1LlZaKhzF2eO35xSKH1btEposgZ7edPXy1cbqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=B4H5r8BQ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF75C606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF75C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=B4H5r8BQ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83B601576;
	Tue,  3 Nov 2026 03:57:10 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 941063F632;
	Tue,  3 Nov 2026 03:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793707033; bh=us62N1Qh+XhSeUo46jRNGcqbJBHkV+YCfxCCeXzVRMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B4H5r8BQqwIt2/HR5mOlOrXioVnMbhotHQ68IoF6WbYl1/rD5FVK9o4uwhF+OoEbz
	 gJuOzMQ9Mzd9th9Aa1Aq1cNc24iXmecXv09Bk7VS4O65x+rSCSZ6IWdUW/ZZlRTlh0
	 WJgsSTenzcD6HCwLfQ5rMccoRdRcuWVppmVZuqjc=
Message-ID: <c6213995-fa80-40ab-a5ea-5d1072e70ad2@arm.com>
Date: Tue, 3 Nov 2026 11:57:10 +0000
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
Subject: Re: [PATCH] arm_mpam: Only program MATCH_PMG when the monitor
 supports it
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
 <20261103095526.238470-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261103095526.238470-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 03/11/2026 09:55, Ping Li wrote:
> Hi Ben,
> 
> Sharing the outcome of our discussions with the hardware team and Arm
> support, to close this thread:
> 
> Although the MPAM specification allows up to 8 bits of PMG, our
> hardware team found that the DSU120AE and the Cortex-A520 only
> propagate 1 bit of PMG. Assuming 1 bit was as good as none, and
> without consulting the software team, they considered the 2 monitor
> groups it would allow dispensable. So the MSC they designed
> implements MSMON but no PMG support, and the bus carries PARTID only,
> without the PMG bit.

Thanks for sharing this information. 1 bit of PMG is common because
until recently CHI didn't allow more.

Ben

> 
> Sorry for the noise again on this one, and thanks for the pointers.
> 
> Ping

