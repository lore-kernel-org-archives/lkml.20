Received: from mta1.migadu.com (out-159.mta1.migadu.com [95.215.58.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134C135F61A
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791037473; cv=none; b=DpGhURmBTq/98z84NY70lDZG3JjfWLISHKtvSaHUbUVx6/D1LizyLH+sfixNTD66YWH5fY4PdIZZyh0kOidtLHIceMMKSURdn9R/0yMx3KmyTiVQmGWRXbvwn8UHhHYa/L2S7au1lnfSdKFbCtJA8AOnTLai3vSPQdZaBv0WrM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791037473; c=relaxed/simple;
	bh=1pQTwGTEOYrVLPSMg1T+ZlkoNQLfO8VBMQicrt8OIYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcC465eOpxys53xirSxXt0sYzoeEEy4UKOIeQFKt20cKtsIcrI96l9TWabZkGaU491LNiICHxR6Ch4owaDtNKH3FTMk991wlNvTZu4ARnZMPOBNww0ZN98xLX+dkmUEvxepaP5c8/DfuHLILbYjCXDRaiIW3Btl5x77oTY+Lhwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=aHGCwkEn; arc=none smtp.client-ip=95.215.58.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="aHGCwkEn"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1pQTwGTEOYrVLPSMg1T+ZlkoNQLfO8VBMQicrt8OIYM=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791037467; v=1; x=1791642267;
 b=aHGCwkEnjp2i0cyjUEtlLdsuQxe9hwd53wC7U2XIZjkwKOWdxk1/lIH7BPniOe+i/6WbSEYK
 jr8mTC780z+5yXpZp0egwcumtiWijPceqaJZgLDp6bBaPVg1z0cVXexuXrJCug5t336eCeRRj3K
 B9IT6yHMf+RYYji+0kN5MK+HaiVbxLX+K0+bdj0XNF2G7pWKMFLMcJhpzBa2lDvOeYWDRejKcNi
 KyLd1Acf2wmKaHnawmbRSS3MwnFeM6crSTWDWpTTfO4WFBzwHzzMiclc+Tf2bpizro8xHGsyUVa
 0Xwfshxo5mGaqqILmqS+ARV/PC9OferOnZcoiPxS8hU4g==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 58b5df2f8a1b9a13;
	Sat, 03 Oct 2026 14:24:27 +0000
X-Mizu-Trace-ID: 58b5df2f8a1b9a13
X-Migadu-Flow: FLOW_OUT
Date: Sat, 3 Oct 2026 22:24:20 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	alexs@kernel.org, corbet@lwn.net, Dongliang Mu <dzm91@hust.edu.cn>,
	si.yanteng@linux.dev, skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org, rdunlap@infradead.org
Subject: Re: [PATCH v3] docs/zh_CN: add Chinese translation for usb/ohci.rst
Message-ID: <asEQFPeGY46qogz1@wyuan.org>
References: <CAMnqnYy5Jt-DWtYrjdekr=M=NBvdW+tu340BLf=GXQv-qi2gQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMnqnYy5Jt-DWtYrjdekr=M=NBvdW+tu340BLf=GXQv-qi2gQw@mail.gmail.com>

On 2026-10-03 15:59:30 +0200, Jiaming Ouyang <jiamingouyang13@gmail.com> wrote:

> Translate Documentation/usb/ohci.rst into Chinese Simplified.
> 
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.
> 
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
> ---
> 
> Changes in v3:
> - Correct the docs list in index.rst
> ---

If you merely want to resend the patch to achieve the effect of a ping,
then please change the title to [PATCH RESEND v3] or similar. And this
is documented in our docs. But generally speaking, this is too early.

And I cannot apply this on the tip of Alex's docs-next now as well:

$ b4 shazam https://lore.kernel.org/linux-doc/CAMnqnYy5Jt-DWtYrjdekr=M=NBvdW+tu340BLf=GXQv-qi2gQw@mail.gmail.com/
Looking up CAMnqnYy5Jt-DWtYrjdekr=M=NBvdW+tu340BLf=GXQv-qi2gQw@mail.gmail.com
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 1 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 23 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v3] docs/zh_CN: add Chinese translation for usb/ohci.rst
  ---
  ✓ Signed: DKIM/gmail.com
---
Total patches: 1
---
Applying: docs/zh_CN: add Chinese translation for usb/ohci.rst
Patch failed at 0001 docs/zh_CN: add Chinese translation for usb/ohci.rst
error: git diff header lacks filename information when removing 1 leading pathname component at /Volumes/Linux/linux/.git/rebase-apply/patch:11
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"

If it's not on me, you might try git-send-email(1) or b4.

Thanks.
