Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728105;
	b=2548P83Z9r6Y+MojKpzC6pX0AKYdOqkvbKkle/kcBI0j95wWAD3WwEaL89ga/6rZ0OLD
	 3Ds6g8aBiF0JqMIvxKo6Flh10Dog5w77YRjg4sQ6qVvfy6E5lOebGWxF8hMSTEqRL3Xgy
	 whHhWAgQ7F7uE5C1EjTX4xr+FWRKZvAaUqTsRzwnHbYoMayBQv+Ccwg1eUH1hagMYQ9Ru
	 /iQEmAg1M91Yaps58o5bSi6qq6T/aLBdEcDRM0UGtDVOISvfVNt+/Mq4cjm/HbeOXBkT9
	 7azbG91ZZT+ljDG6t7oWNI2PuCccRsiGlMYoi8vZ9LuWtqUOAJ64Cq2S/Jv/tZG8eDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728105;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=mf9JVkCLwRxWPLrxaj3FzU/TGDnGM5kYKZYNlKzxksM=;
	b=WUHPgFlbQfrXEL31D2U2aOD2Vu537XJhRGNeb+Kzw1zXQNlNVRj/ni6OmcPKNgsATEnx
	 Z59pjq1HTJ89AFxwpvULtEl24waiqwyHmXpRFdBIVX13OWahSEDlspogkQxN5dG1Aj533
	 2vpKCfLSQt3Zg55az+BJW5kV6UQyGnM8iZIXVleEksT/q7lY/9de5iwUwyBko9OzyxvEc
	 YO3rYJwxhg7b0KfPtUp0B05C9u5KbYnTlKX0MBreMLzmATDDG/qyjyppCpz2eFAZaa1nX
	 Qu4Qd93GAibinA4ThUesFOkCNYHmVaXgs4dHysw2oSZQXSQ9p/gQxHUtCN8ofA1K3+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=f8acjVyi;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDFF606A337
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDDFF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=f8acjVyi
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D80D41595;
	Tue,  3 Nov 2026 09:48:19 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42D093FA32;
	Tue,  3 Nov 2026 09:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793728102; bh=vaCQ/2L0/fMVdYR2RKY5kjdcqk1pSk5EfL4D0OKx3ts=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=f8acjVyioUA89Cqjgqw3CUI9m7xifXp8trNfDFQD/7XkaJDEHPXIWlc6Di3Qr5xuL
	 cV4Jw3RQ8vmHxwME9Hh+2ySyT6ovXwHOP1iP552NJjzNA2Pe5FcPYiMK46/19L9LnI
	 tQHMNLh85P39+CMo/1z9PuKTp1ccaNbe0pCFjrQ4=
Message-ID: <9400d7a6-3d00-474d-bf1d-6db1a08c16fb@arm.com>
Date: Tue, 3 Nov 2026 17:48:19 +0000
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
Subject: Re: [RFC PATCH v2 01/10] arm_mpam: resctrl: Use find_component() when
 allocating a domain
From: Ben Horgan <ben.horgan@arm.com>
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <94ddff51b91f4a51965baf0384c2368e292c1a8c.1792443633.git.reinette.chatre@intel.com>
 <308b326e-9fc8-4d49-9c85-c3b9cb9288f3@arm.com>
Content-Language: en-US
In-Reply-To: <308b326e-9fc8-4d49-9c85-c3b9cb9288f3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 03/11/2026 15:01, Ben Horgan wrote:
> Hi Reinette,
> 
> The change seems good but I think the commit message can be cut down at bit.

It looks like this patch also has the plus of addressing this sashiko
report:
https://sashiko.dev/#/bug/linux-9a564d61-b4d8-400d-b4b9-cd5f20729468

Thanks,

Ben


