Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04F22116F4
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788618703; cv=none; b=lsAtAdbWTMpzVUw6pZoWsbC3rwxK5VR8YHe260PVARbNuQmrL1TOjWVE2PjV8BXgu7Qzewn859C7Y+PIaCGoMQAklyhUnS53E9ZJrsEAdRfQInvMpAxSYDvPjdbKk/CWtPAB+IuNZFLNS4jxV9NImDuuv7rUFG8fhTHfbnSsbgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788618703; c=relaxed/simple;
	bh=Zjiaf8v7jZM8St1tRXgIsA3WKPejW4ONFNeXAqJ2/Iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0aMl/WpLFZTJx66/8a1Nfb4ea8wbxl9biGc5b/d8VBhP8zs4FMnU/Ei+jBefclPPupFGQsLsKoPKX7P51eqikrGQv6GlAXO01z28h4wuF6jPDBDKHNjD8kwb0lEvNTM1Kcl+17kCWYFFY7L+o9aTv6DIAZX6wtaG9Xs8q3jUf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.51] (p54848e1f.dip0.t-ipconnect.de [84.132.142.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id E5F694C2C37F34;
	Sat, 05 Sep 2026 16:31:22 +0200 (CEST)
Message-ID: <e476b66d-c027-4d31-8da0-5f1088055452@molgen.mpg.de>
Date: Sat, 5 Sep 2026 16:31:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i40e: fix integer overflow in i40e_dbg_command_write()
To: Rivaldi Hormat <rivaldihormat@gmail.com>
Cc: intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org
References: <20260904062554.18628-1-rivaldihormat@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260904062554.18628-1-rivaldihormat@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Rivaldi,


Thank you for your patch.

Could you please write a commit message for this addition of 1855 lines?

Am 04.09.26 um 08:25 schrieb rivaldihormat-debug:
> Signed-off-by: rivaldihormat-debug <rivaldihormat@gmail.com>

Please configure your full name:

     git config --global user.name "Rivaldi Hormat"

> ---
>   .../net/ethernet/intel/i40e/i40e_debugfs.c    | 1855 +++++++++++++++++
>   1 file changed, 1855 insertions(+)
>   create mode 100644 linux-6.6/drivers/net/ethernet/intel/i40e/i40e_debugfs.c

[…]


Kind regards,

Paul
