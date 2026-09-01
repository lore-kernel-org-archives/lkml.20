Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C948821C;
	Tue,  1 Sep 2026 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282957; cv=none; b=fCAIDaG4h5XcQphvIdUpH7qQUDxcxLuUw4PUeA5PcNg0vrsjTxDhPAiE8AKjH44iSI3JgqqZLDTFde+dARhCV/34onqzXK2fAsMwgW47SWtDcmkxeDhTjav6D2a1aPUBJAU72ud1sJC6xJmRc/AseR2ejmDV88y1veZE6JAEbDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282957; c=relaxed/simple;
	bh=9+kfo+8Fm/mHjS4Tb797BOINEEvkCBFm0f2Yhh6lOqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cu0AVlaMZPU09N3kPul1mG4u/a0XIfHroi+GcgPnF9l2EUtEJmuUk6iNltPI3ORRkpVtrOLJwTU/JEmAy4SaBQqK7zCHp3nxVHcQmkVWn62snJ+ZW3GHrvsbHG/9N44hcwRk8obKHryAgyqzVZwWpPRzWqqaqA/1xJQWN7feaO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCJokjjn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCJokjjn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B1C1F000E9;
	Tue,  1 Sep 2026 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282956;
	bh=+gyB3bhvFJERinQSK8RWjM6EdWxwsBr6q6hqEJNIxlA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iCJokjjnRIOVS2gWqRBQ89sCSYXp3BP+4zY8bNnMXvOeFgu36013UkgJyvtx+fRBW
	 NkHG6ZoPb3G5dShDWQ2tSY0p+4qkdMdIyyvqpr8Sauy8gXwmVei+AXTs5l+ydBs6qT
	 vMcNtZp5pBYYzhXuR/yezfLwgw5PY92Em3yL1SFBeLbQ0ADPMYFkzjCCMC+7ZF5A/Z
	 5NqyGOkNP0YreE+VsysOjux5poAMmawCkxkVNjvnSa5iAR26QS9kw3nvvRaELVu/nI
	 0m7vu0XFlAuNK8lLWNPBHCOx71INpKYDcZH0ZCUAQWxr9R1VrkT2uCCYa8YT9VV4En
	 n6SRmnyqHUDTA==
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260831112939.126708-1-rf@opensource.cirrus.com>
References: <20260831112939.126708-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: bus_type: Use devres to free slave IDA
Message-Id: <178828295460.1399388.14262984550161700184.b4-ty@kernel.org>
Date: Tue, 01 Sep 2026 22:45:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 31 Aug 2026 12:29:39 +0100, Richard Fitzgerald wrote:
> Create a devres cleanup action to call ida_free(). This ensures that it
> is freed after anything that is cleaned up by devres and might have been
> using the allocated ID. It also avoids mixing devres and manual cleanup
> during sdw_bus_probe().
> 
> 

Applied, thanks!

[1/1] soundwire: bus_type: Use devres to free slave IDA
      commit: bb22b81339cb97d2eb7ec666bf03f985fe64d6cb

Best regards,
-- 
~Vinod


