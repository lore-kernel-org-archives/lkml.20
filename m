Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03123ED3BB;
	Fri, 16 Oct 2026 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145560; cv=none; b=g+B1gjoExk/HrinG70pUKas945i/9taz6Ijdd3G3gvcjHY/jWRpQPrxfoxto4ylKkxdG6yNnBKMBNTpeXHPW5EN8U2WH7GqnxKZSaPqPOsggTdAD7RrH12QI4At3vaRGCUym1+zFa16dwQyxe+HzHC4KRCLAtngbAJN3R1MqGjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145560; c=relaxed/simple;
	bh=idmo1GeyJuJ6N3QJmqPhnGkr7HwQLwgKJovNjaEznRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cKQi8N0sbby/7hM4+k7a/7QfY1f/vn28FVdkiOwzLgYKA92EDQxMedBatA2Dk1X3DFXTLQd5oaRvnb2bQSGhVMeEqZRVtFpf+msnSAcIXkbUroKgBGs284Z+ob1LxkFbwLksd9G1L4JBrCron83gaA1GU0fFH9zTyqCju4lWENQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEMCrwxu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEMCrwxu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12491F000C4;
	Fri, 16 Oct 2026 10:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792145557;
	bh=75PhmblfKKNm9YT5QCltoh5unVEmTBo+VfQEF4Aeyac=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NEMCrwxurtStnVI51zk85h1Xn062G8gNb20uB+gBmg8erJwnEIPCRibaJfYQ0uh5P
	 hkhkWflReftxiBozwZj+Y63Zu6vCQ1abwftzct7a+lVsaYUzJ0AjtLKVAykDH0tR5Y
	 +m5qN3zPDCn1VUXfOajnGP7SbK3hvH5eJ9q5B2R3fr+30dGlTLZircWZ8ESnEnXvV3
	 0jbeRWlUHN3cqShxRrGvt1bPaID6CWZLSvvMRv73DGb9En+XzFSJugT4pbKEkja/d4
	 avjwG3fj2suXE8n7+zQGDGje6t26bOh6LQaELV3Uy2KIaR7BDqnXpuYHIupnlSELGB
	 QuBx6Ru2dfXwQ==
Message-ID: <30989671-7159-4b4f-bbf7-29303a9e13ea@kernel.org>
Date: Fri, 16 Oct 2026 11:12:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] phy: qcom-mipi-csi2: Add C-PHY support for
 X1E80100
To: George Neacsu <geocausa@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, David Heidelberg <david@ixit.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com>
 <20261015-x1e-cphy-rfc-v1-2-1f3fa9af940a@gmail.com>
 <7aed254e-18c5-481b-a77f-576944fff1d4@kernel.org>
 <O2OGvixLI-H1FleIR5UiLkxLAN4pfWDm8F8qMBuX6LT1klt688s0GbH-iHKW80Uqs-6zSNWE7ExAXsNHxIwYjQ==@protonmail.internalid>
 <20261016100621.427612-1-geocausa@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261016100621.427612-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/10/2026 11:06, George Neacsu wrote:
> Hi Bryan,
> 
> Thanks for the reviews, and thanks to Loic as well.
> 
> The series is on next-20261015. There, phy-qcom-mipi-csi2-3ph-dphy.c is
> blob 966d79c98, the same as on the media-committers next branch
Series doesn't apply to linux-next or phy-next - given we are at -rc7 
linux-next is probably better, after -rc7 phy-next is best.

Either -next:

[~/Development/worktree/bod-media-committers]$ git fetch linux-next 
  
                              *[bod-qcom-media-committers]
[~/Development/worktree/bod-media-committers]$ git reset --hard 
linux-next/master 
                                      *[bod-qcom-media-committers]
HEAD is now at b810335a0699d Add linux-next specific files for 20261015
[~/Development/worktree/bod-media-committers]$ b4 shazam 
20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com 
                                             *[bod-qcom-media-committers]
Looking up 
https://lore.kernel.org/all/20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com/
Grabbing thread from 
lore.kernel.org/all/20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 15 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✗ [PATCH RFC 1/4] phy: Add MIPI C-PHY mode and configuration options
     + Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> (✓ 
DKIM/linaro.org)
   ✗ [PATCH RFC 2/4] phy: qcom-mipi-csi2: Add C-PHY support for X1E80100
   ✗ [PATCH RFC 3/4] media: qcom: camss: csid-680: Select C-PHY in the 
receiver
     + Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com> (✓ 
DKIM/oss.qualcomm.com)
   ✗ [PATCH RFC 4/4] media: qcom: camss: Configure C-PHY through the PHY API
   ---
   ✗ No key: ed25519/geocausa@gmail.com
---
Total patches: 4
---
Applying: phy: Add MIPI C-PHY mode and configuration options
Applying: phy: qcom-mipi-csi2: Add C-PHY support for X1E80100
Applying: media: qcom: camss: csid-680: Select C-PHY in the receiver
Applying: media: qcom: camss: Configure C-PHY through the PHY API
Patch failed at 0004 media: qcom: camss: Configure C-PHY through the PHY API
error: patch failed: drivers/media/platform/qcom/camss/camss-csiphy.c:329
error: drivers/media/platform/qcom/camss/camss-csiphy.c: patch does not 
apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"

Or -phy:

[~/Development/worktree/bod-media-committers]$ git fetch phy 
  
                              *[bod-qcom-media-committers]
 From git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy
    c7f2322431cb6..8f56fdf3d8cb9  next       -> phy/next
[~/Development/worktree/bod-media-committers]$ git reset --hard phy/next 
  
                              *[bod-qcom-media-committers]
Updating files: 100% (16814/16814), done.
HEAD is now at 8f56fdf3d8cb9 phy: tegra: Add support for Tegra238 XUSB 
pad controller
[~/Development/worktree/bod-media-committers]$ git am --abort 
  
                              *[bod-qcom-media-committers]
warning: You seem to have moved HEAD since the last 'am' failure.
Not rewinding to ORIG_HEAD
[~/Development/worktree/bod-media-committers]$ b4 shazam 
20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com 
                                             *[bod-qcom-media-committers]
Looking up 
https://lore.kernel.org/all/20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com/
Grabbing thread from 
lore.kernel.org/all/20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 15 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✗ [PATCH RFC 1/4] phy: Add MIPI C-PHY mode and configuration options
     + Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> (✓ 
DKIM/linaro.org)
   ✗ [PATCH RFC 2/4] phy: qcom-mipi-csi2: Add C-PHY support for X1E80100
   ✗ [PATCH RFC 3/4] media: qcom: camss: csid-680: Select C-PHY in the 
receiver
     + Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com> (✓ 
DKIM/oss.qualcomm.com)
   ✗ [PATCH RFC 4/4] media: qcom: camss: Configure C-PHY through the PHY API
   ---
   ✗ No key: ed25519/geocausa@gmail.com
---
Total patches: 4
---
Applying: phy: Add MIPI C-PHY mode and configuration options
Applying: phy: qcom-mipi-csi2: Add C-PHY support for X1E80100
Applying: media: qcom: camss: csid-680: Select C-PHY in the receiver
Applying: media: qcom: camss: Configure C-PHY through the PHY API
Patch failed at 0004 media: qcom: camss: Configure C-PHY through the PHY API
error: patch failed: drivers/media/platform/qcom/camss/camss-csiphy.c:329
error: drivers/media/platform/qcom/camss/camss-csiphy.c: patch does not 
apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"
