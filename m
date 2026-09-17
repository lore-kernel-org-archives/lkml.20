Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E6049EC7E;
	Thu, 17 Sep 2026 22:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684733; cv=none; b=PgjZq0VZx+QypdEwUgtPZwFjqXAj6MRBHW1/yrYuVeFZpwzk+tqqdc7UrIXLQ3aOSWlRSQlL9kXjZy6MzI/mFe0cYC+Z8YsrmuJ2eDbLWTmgUx/v1Lax9w9E1PfNEWUZ/7QV2Bbw7ak2uZ2MBLSMgEmZNljvKERn2jOb6X+vDVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684733; c=relaxed/simple;
	bh=kGpjr7L2noFaOZBGChLS3O7u95ZEJmmIfO+SiQQON2A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VJazFd3ByUnU2ABgWvwHw3mJas60x/k8org7Zk0HuAv+6PHXePpFTF+j+7uCvytAGErjOzLj2Z9cxPjxSU7V0Rqm2ApA4+vEGVJsowyO2Jh88Bp/zZU/S7y3GhAW7GBCMfcgwu/dcCCqABG7nMbQgw7I1wuPF5nBkml0fLsiBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8QvR9t2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8QvR9t2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7711C1F000FF;
	Thu, 17 Sep 2026 22:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684731;
	bh=MEea2IqBWLK++gGSWsChJB0UrnN7X7Wc26XG6CF/Yoc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=E8QvR9t2awkfPlUG/fFjb4QnnCIWbaCIRtUk+TJBTfDb9liCtv0lNCtl/TkdcUaAH
	 /Xa6EVl/6+xz0iiIGFw28QLY4/z6+PtSG9/YhbknV5AbKxtGqYAP0+KIMWQmoHrwMF
	 0dZLer/Y5yvWmv19GRjL2oMWi5GNL7phD06mm3LdKnluVIK9lqZOHKfpmx/hDbL1nH
	 2MwUZVCy9PNNNh+i1Aw91cpGMp3Z4QP55cvPetICYS2iz2/Gokgtt4RLn2BSe6pjXW
	 2zTC/oliPbg6si1yC3CBRe7pobY+QkadN4X+YzdzSs4os36brGDCBcL9NYRDu2eLVn
	 rrzhEB6KUplsA==
From: Srinivas Kandagatla <srini@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20260904124245.5448-1-hemanth.selam@gmail.com>
References: <20260904124245.5448-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] slimbus: fix typos in comments
Message-Id: <178968473025.466806.11314498054887339797.b4-ty@kernel.org>
Date: Thu, 17 Sep 2026 23:38:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 04 Sep 2026 18:12:44 +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> 

Applied, thanks!

[1/1] slimbus: fix typos in comments
      commit: ce663949e886887f7f546167fb3b4688e0a0d073

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

