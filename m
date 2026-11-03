Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706635;
	b=QFIGR/qVpM86De3SQwYULxCu0NDOxg/YFf0ZescqTi1K+Jy4+HmGM1OoCD1PZn98jc0J
	 IxXhzItLRupZvhmHHfdFwSmMI752xtsyjkp9vHvaBUHII4BWN6u/3OoZzIapo0wxFQWCp
	 /ltvgB1rLbmQFsbqa7c5sroHKvGUaKvDn+tVoSff3pG7YzU5Xpv5RL53akIbvx20U3WGq
	 M1Ia00vLCpBnyxee84RJfqqxQnnXN1B9ihFrGuSL1ij32HFPIY3+MHbXybqNwtyl/NU6t
	 knwfcG1CAhmaA1/Nc4d2b/uawP+0ka3X6atww+TwVlCgyIJCuIDYPDz+k8NWyyDdlJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706635;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EHw38eN6k0S5PS2GsJCCIBq6WinXXG92Pz27LCOAbJ4=;
	b=Tp3Rcm3oSF8GSqrLIWJlcv72sOPYQg2DjiL/n/m987rrg1YUVH8cEemFrQib3+/lS81f
	 bymo2eM2YMiZgU9DpplscPM2A+xPjECQnBBmo73infLbsu84recBxqYZMTviMqhWIEO+M
	 Fxo8zlQGgXVoWIz6uHEyjd/+LJoY/ko4i4cEF/kYFx/ZjxBmbGEfq5K8aFXQZK3Zp5Fma
	 DuNsr2M86cok/fWoLHgW/tL+xJGNQEKiJCqo2aF9m4R5lvzlZa28ZAyWcI8tj3DPdJHVF
	 60OVqpoeOIqFRSmPibBXnpTaX7TCzGLIpWRuiZPSNVcmV9eyWoEazOGVt9Zxi9izT+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hU3C0FQ6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AC2606D839
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2AC2606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hU3C0FQ6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18C8E1691;
	Tue,  3 Nov 2026 03:50:31 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2185F3F632;
	Tue,  3 Nov 2026 03:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793706634; bh=RNsb2c+IWPbtzdn1kpsrH4bVFNQRQRVMo/MtYmG/t8A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hU3C0FQ6kf3yBRUnF5y2GzAQ8LrgdiyU5Gx73gUkAsW4hZ6XKIZHsa/EXx9rUQU4L
	 Ds/Gwhdd+2RDxfB3SmEM7faltIBC2vAN930vp2/7miQcAIZbwmbfPqVIBClJ67QUZa
	 RsGhsAIRcgZP/IP6utP3Ae01c+NKsOOC7NTHG+zI=
Message-ID: <9fac528e-d7b4-4052-8e50-4f4fae27b95b@arm.com>
Date: Tue, 3 Nov 2026 11:50:24 +0000
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
 <20261103023742.2624994-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261103023742.2624994-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 03/11/2026 02:37, Ping Li wrote:
> Hi Ben,
> 
> Sorry to bother you again. I was looking at how the driver derives
> mpam_pmg_max, and I think there is a similar blind spot:
> 
> mpam_msc_hw_probe() folds every MSC's MPAMF_IDR.PMG_MAX into the
> global mpam_pmg_max, regardless of whether the MSC has any monitors.
> 
> Concretely, on our platform the DSU has no monitors and reports
> PMG_MAX=1. Our memory controller MSC has monitors and currently
> reports PMG_MAX=0, but if we later add PMG support and report
> PMG_MAX=31, the global value would still be clamped to 1 by the DSU,
> and resctrl would only expose 2 RMIDs per CLOSID instead of 32.
> 
> Should the convergence only consider MSCs that have monitors?

No, the PMG_MAX can also indicate the largest propagated and so still
needs to be taken into account. Rules I_GSHTX and I_BTFZC are relevant here.

Thanks,

Ben

> The PE-side value from MPAMIDR_EL1.PMG_MAX would still apply, as
> that is the maximum PMG the cores can tag traffic with.
> 
> Thanks,
> Ping

