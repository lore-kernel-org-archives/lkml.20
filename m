Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8218D4EF15C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071809; cv=none; b=JW0MoVHtVMmolWEaRny/adpqTNmf28uJY9bWTv4cCcoral5/GPTNCyyYV0nCs2DbZ875U23cZ28gM2hP9uKCOJuwUGjy5/LDZqU87O2Sx8X6HJKYlmQ+sRzb87u+jQ0ALraQZ9BNNao5unZk/LNmZ1lq/zjRemX7m1CmTZ3dkkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071809; c=relaxed/simple;
	bh=Hs6n7sfJVV4p8X9J33SO4VXiQGySPI2/dKatFIwSZjs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=sAFPlPtsfv3D/H6szxNrd1La+0QwtJKaxCCzlSi/2GraNNZDzdvUX4eLBVK8c9nXFXUc+jj/eQ27aUV/k5lrBNzVIyu1xe2aZqKXCmVY3u5YjxQ1jtx/r/PJw1qQkGgpq1+Kayip6UF2Ug9FGQ83BHt6z1ZK0DZDpI1RZOuFA9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKKeBmDw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKKeBmDw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2BB1F000FF;
	Tue, 22 Sep 2026 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790071808;
	bh=Y5lSCP2aYhFZTVX/g8FjXagC3d60ACnslJLgFNH4YdQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GKKeBmDw4sea+WyvahZYCx5LEy7oU71H/Drod5lxCIzOBimXtRjtmWQ5pzYebSfGB
	 qGR66NmiLI9T2BjYmnCcv730V0B6GE+KHnIUE0p3KrCPO1FZ2YviTnBwfvp+ANSldt
	 KwO+QXj2DOcId1ZJo5s+wsrypGIm9jpr/2vqfo2vJOxqQXD6P7bTWwOpKQfjQkFaFu
	 OvxMfZE2ci3eVOwdZlyEC4H4oRhJmTEYoAthX4a7zJdR8hCRD2ACSHWaGA9kD8dBSy
	 lPf0B7VBleOK6MEfO39WtLBKH8FJYreqMCR4kLiUct3zjHKwzaYL2R2xShHmTvQcqT
	 g2iQty7fIxeoQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/2] memblock tests: fix BUILD=32 address conversions
From: Mike Rapoport <rppt@kernel.org>
To: Tianyi Chen <hi@tychen.cc>
Cc: Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916161105.2548281-1-hi@tychen.cc>
References: <20260916161105.2548281-1-hi@tychen.cc>
Date: Tue, 22 Sep 2026 13:10:02 +0300
Message-Id: <179007180279.508753.4595268983388589280.b4-review@b4>
X-Mailer: b4 0.16.1-dev

> Fix two BUILD=32 failures: truncating a physical address before freeing
> it, and sign-extending simulated memory addresses. Existing assertions
> cover both regressions.
> 
> The runner passes with GCC in both allocation directions across 32-bit
> builds, 32-bit phys_addr_t, and NUMA configurations. BUILD=32 NUMA=1 also
> passes with Clang.

Does it mean BUILD=32 without NUMA does not pass with clang?

I see a lot of warnings with gcc and BUILD=32. Do you mind fixing them
as well?

-- 
Sincerely yours,
Mike.

