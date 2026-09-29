Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5974E51AFFF;
	Tue, 29 Sep 2026 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689123; cv=none; b=awAG67Hvgg6SiwOyP08JPtK5/c/0Pj1sijQSaoD3Fe6G46+31fJH8d+bNZWf0NfFrwyD6QNpSaSfmA2CGKqTGQxUgp++8ClXVn4kIUSeNMoWetTRwNzoGf+wj0DYLBBHktKnthv8TbRPm9yiVFvsYiOiyCIXmKw2LlU118gTyuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689123; c=relaxed/simple;
	bh=zQCyGzpYwxLTDRlBhx1tKupjPECIqz+qDOBOJIZIxNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3pLV/geH+KKo3D9epbHFliOblpPCFRVt3eEyIi4RknKII4H2Mhm+fpDPstfTt0e4wItPj6W9DR4x4cfnjhNJN1ab61oOrnPx4XcilTKGY4jEs4tmMduCB3hI7PftQep6aLF65I8vqEnQm6fblpoOdHX7jFpzQvfGTxPEeViurU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RD5vCO98; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RD5vCO98"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 057561476;
	Tue, 29 Sep 2026 06:38:37 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F25CF3F85F;
	Tue, 29 Sep 2026 06:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790689120; bh=zQCyGzpYwxLTDRlBhx1tKupjPECIqz+qDOBOJIZIxNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RD5vCO98mXKItVUoURri5HZC9gg/uYFp4dN7BYSWfXxJ9qVVo5x9UhjB28MzfSr72
	 TECmZoEA2PVfEGm61kdv5UbS0fa1/n8ej7LnJ0692LSopqgt1Hyr5TH5n+9gfaK94c
	 R6ZdhW+V2B9uzMbVuC6MWcwsKdHXgk6WAjRGEj0E=
Date: Tue, 29 Sep 2026 14:38:31 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the qcom tree with the arm64 tree
Message-ID: <aru_PkpSpqgJlFBg@arm.com>
References: <arZgzLfF0qjEXPpO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arZgzLfF0qjEXPpO@sirena.org.uk>

On Fri, Sep 25, 2026 at 12:53:48PM +0100, Mark Brown wrote:
> Today's linux-next merge of the qcom tree got a conflict in:
> 
>   include/linux/mod_devicetable.h
> 
> between commit:
> 
>   fe7f2a8054433 ("firmware: smccc: Add an Arm SMCCC bus")
> 
> from the arm64 tree and commit:
> 
>   fe7f2a8054433 ("firmware: smccc: Add an Arm SMCCC bus")
> 
> from the qcom tree.

Why does the qcom tree carry these patches? I have a stable branch if
they need them.

-- 
Catalin
