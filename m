Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DF833D6F0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529677; cv=none; b=cP8END3IlMsH17mdCA8uvJ02/VwNk5Tz/VDUqA9v3sUGTgeRPFuT41zCqAIqU1pqixjXG7W7EqsirSD/YwAjl/HE2IA3K32P+QwjuZW5eTSyAX092O/O8nGS1Dzqiv0Au8V6GhgsrbAHkC8mpsP7z5R9rTnLDRUQJmhezLn62Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529677; c=relaxed/simple;
	bh=b7GhkUkYUsyGIyJmf5PH3x4oWt2rrdnbTQzF0mmRJMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBc+wWsbjueNWbkjvMAhXmzfDoXv8FJATzZveJC3kE02XJPMgjzZYHhqgG0HaPia0989i8YDpIriTp7XBE9UyCusKs/KzvjqKh2epOw0nhQpI3Pg7EWgyWDz8yg/E7KLGJbhwyizv5njFJAiqyKFTgRbLAB59ZvFqAulmIQU6lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbuuIqa2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbuuIqa2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE42C1F00A3D;
	Fri,  4 Sep 2026 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529676;
	bh=sltY8nMQNzof/a67atkYPD0OQsN0c332evF0qHWD/HY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mbuuIqa2SSLC/iHPBwp+SiBRGhWp1KJ4w6Iy2Xw40OZzkYm1ADNhDRDwtFL4sGEDo
	 A5zO6tCKIOfvH9whjdotflds7suThtKATV09fmvccggTQ9qn+76CEz5utR9r/7uAEC
	 c6MQTQzOsDjl5BSdOPTpg5J1uRw7mt+r7rHWKfRiMWfYS6eAqFuEQTgoI4Gb3qZ22T
	 5IXGmtBts8Q+uSADgARCnouJH+6fv1EcK9VrtsvMkf4jZ1A6z9cpdsRsIDinKuIkt9
	 H3y7DuCPtTRK8TPdpT+ZOT/QP+OeN5PSQy04+5hPYuheRGGXM+Y5r/o4vke3Y+Z2G4
	 mJzQF3dto2xgQ==
Message-ID: <8354bbd2-527c-4368-8341-0405e5246e41@kernel.org>
Date: Fri, 4 Sep 2026 15:47:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] w1: fix spelling mistakes in comments across the
 subsystem
To: Ivy Lopez <skunkolee@gmail.com>
Cc: linux-kernel@vger.kernel.org
References: <20260811002704.57950-1-skunkolee@gmail.com>
 <20260812235722.10807-1-skunkolee@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260812235722.10807-1-skunkolee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/08/2026 01:57, Ivy Lopez wrote:
> Following up on a prior patch that only fixed w1_netlink.c, sweep
> the rest of the w1 subsystem for the same class of comment typos:
> "loosing" -> "losing", "deatch" -> "detach", "messagse" -> "messages",
> "continusly" -> "continuously", "attribut" -> "attribute",
> "deactive" -> "deactivate", "determing" -> "determining",
> "discrepency" -> "discrepancy", "rerurn" -> "return".
> 
> No functional change.

I don't know how to apply this - getting series it pulls power supply:
Looking up 20260812235722.10807-1-skunkolee@gmail.com
Breaking thread to remove parents of
20260812235722.10807-1-skunkolee@gmail.com
Checking for newer revisions
Grabbing search results from lore.kernel.org
  Added from v2: 1 patches
Analyzing 5 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 3 code-review messages
Will use the latest revision: v2
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
  ✗ [PATCH v2] power: supply: ds2760_battery: convert to devm-managed
workqueue and pm_notifier
    + Link:
https://patch.msgid.link/20260813004113.29943-1-skunkolee@gmail.com
    + Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
  ---
  ✗ BADSIG: DKIM/gmail.com
---
Total patches: 1
---
Applying: power: supply: ds2760_battery: convert to devm-managed
workqueue and pm_notifier
Patch failed at 0001 power: supply: ds2760_battery: convert to
devm-managed workqueue and pm_notifier
error: patch failed: drivers/power/supply/ds2760_battery.c:695
error: drivers/power/supply/ds2760_battery.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"


Getting only this with (even with -v1 argument):
Looking up 20260812235722.10807-1-skunkolee@gmail.com
Checking for newer revisions
Grabbing search results from lore.kernel.org
  Added from v2: 1 patches
Analyzing 5 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 3 code-review messages
Will use the latest revision: v2
You can pick other revisions using the -vN flag
Specified msgid is not present in the series, cannot cherrypick


Something is messed with threading or message IDs of things you post.
Also visible here:
https://lore.kernel.org/all/20260812235722.10807-1-skunkolee@gmail.com/

Please send a v3.

Best regards,
Krzysztof
