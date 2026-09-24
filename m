Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF703E3DA4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276788; cv=none; b=G1qyuxiqAo7djLj8C/PiLJmUpOrDIipV90GzkQvuKz8MXXoA1xtOgYfc7httTd8E+cgHdU2I/++dJqpk63NdfYsFjRUheBoIKA4N1xH6ay5j8T7SaxDeuq82yMGQFFu9i67ZfMH/UUgaqB8Nr5TqioI74o6LPiZlnywuc/MQKx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276788; c=relaxed/simple;
	bh=uvo+qtIwhYMYWCM6CfE0/O/v9WkymA7AvErtceQ5t54=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HJSLXjJVOWB0wSMvxF5LOG7iA+xkaEk08GnLJpJoJSqdGtSi5NMurxxFq0AzH5MDSlwL1BCorhX4huBixs1Sc5kjP54bGsTCRLMX5hQ+L4Nz141evQqi/ugExZ4QLUCmolsbG6vquON9gxan1rY7L9meCbKTcXg7OZH1luHy0y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOmTu/nI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOmTu/nI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE72D1F000FF;
	Thu, 24 Sep 2026 19:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790276786;
	bh=2Tzzsi8uxGZxkN4ZnIdG/QUQ/SPBwU4yILY4QcDUUu0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=cOmTu/nIr+IJiasXsjNTFB6Di5O8iutO5bWyx01K93FFUIb7bhp/0vUygG1zVrKBx
	 9UhnVpEdEPkO0Wro/oDzaa+LrwAk9fy7nU5jeWrxMTLwEcHGXJpOF/6JM+ROCcDNgj
	 dijOxuYwer4x+P2kHP8lr4Y8krfsxD7FFOJiWfmt9iwmohmIzjTvDa4mB1ijF7fJJd
	 97fdrXIwuVhen0YodfkgcCu89peehEqGf9u4RVF0NWO31MJeVSnyguidjglRvjdzhA
	 gBg7CqOWvSmk+M81vL5ebUakmumaBh+HJ6fd9HcT+nUGnH7OGjpf1zTyryQiaxprxk
	 n0sLkMfEKNguw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 496591980052;
	Thu, 24 Sep 2026 15:06:24 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 24 Sep 2026 15:06:24 -0400
X-ME-Sender: <xms:r3S1apTAkCL5lySixdB9Yp5pCsFepPsqNXtyZWeR5JJc_t9DUay5Dw>
    <xme:r3S1atnKpYAGNN13jx2VsD4eqoxK_3oU4fxNyJqoQ50u-ziKPR151q0vJ5J-EAIYK
    3Ht6CJYiJIf6lVMK0du3LS-Yki91nWCtIUg7uI5YDNkDA5E17fgHAwG>
X-ME-Proxy-Cause: dmFkZTGBUX12t7Yaf7GcuLP7wcVJ2w5Ni73Ts7ry4TqaQRrwQfF6ajZBwjsFoNEzzUUJ5S
    ukU90xGvxAezl+R8hPNw11mroA0a8EGcWRLDmkzl5hPeMxiDE0oaKFVFFqy3rlQM980pdT
    zxX+vBoGaPv4LHxgv46cyU8kn8mQ+3bR2AWbBpIXtoG3V3tyClWfkcJLqIii6QYlSnz/fN
    6ifoybLKy3KXJ8JGNtJjBvR2jsaNriRRe972VZ1o8Z9XEtONgZ0hyVnU5lt96qJuJt+6Ix
    ijEv1Q7KMVayzcGDll9AzZXar1EWtQBVSUEuEQNmFZ3ReRoZYKmP4842FKJp02rvaPv1Xi
    z/cLz+UUi8XR8rBtzXvC9m8lSOZzVB2O+ujeBTXUyJjuHnM3somYK2iSTHJgx5kpVnFC9U
    i5FsllB2ljrlYt6yqMrYtzfaBdtuZ/+lcYbrfsZ1QDju9OLHp2Aiqj5YC7IPkdYiqyxfEf
    NlWCMbtCi4+TRSjVKKMxtm6qx3JBHTWmIRLOi/Nta7Om5L31r8PsGjqhEIBYgfJ2Cq5vLH
    yUa9MlMzVRXcyda7YRxtPRwmCvNBo07g+2qpFZEQH3TwVc1RQeC+OHDQNqoUbpun6lOk2/
    9oytX+qtlHsK2uU/cU5xnu7K9/batXrJRcguqKgK6tsICo2yad8F/nzQxmaQ
X-ME-Proxy: <xmx:sHS1av6uIMMPmKMkyPsFfvSKp74YfYAH2xW-NLLmTN2XSntf-NJCdA>
    <xmx:sHS1aivEauG2BgkzjvklnycoAR7cVOvnCXYaZR4epBs7n7S0HQNGjA>
    <xmx:sHS1ag5embUE1W9cQT1oKw4IQckAH3rdxuagUSmLbBhoompcDwo1eg>
    <xmx:sHS1atXtS0TpbPFqdtELSv9PtClHa58uhWrAZNMOYSeo8i1QX-7ppw>
    <xmx:sHS1ai-1SMr_6tbmyt1LMLAmKLT-5wD7JLmtUi49g9Y_3WAVCKzprSXq>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E8E9BF80080; Thu, 24 Sep 2026 15:06:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 21:06:00 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Melody Wang" <huibo.wang@amd.com>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Tom Lendacky" <thomas.lendacky@amd.com>
Message-Id: <517e154d-dbdf-47f9-849f-2ee369dc832e@app.fastmail.com>
In-Reply-To: <43674b3b-15a5-494c-b1de-041070b1e816@amd.com>
References: <cover.1789927246.git.huibo.wang@amd.com>
 <1a64a4fb-c14b-454f-a89c-43112b01d187@app.fastmail.com>
 <43674b3b-15a5-494c-b1de-041070b1e816@amd.com>
Subject: Re: [PATCH v3 0/8] Alternate Injection: Secure Interrupt Delivery for SEV-SNP
 Guests - Guest Support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, 24 Sep 2026, at 20:34, Melody Wang wrote:
> Hi Ard,
>
> On 9/23/26 1:56 PM, Ard Biesheuvel wrote:
>> This may be a bit of a 'back to the drawing board' remark, but if opting
>> in to this alternate injection scheme can only be done from the EFI firmware
>> before ExitBootServices(), couldn't we wrap all this logic into an OVMF
>> protocol instead? That way, the EFI stub can just invoke it if it exists,
>> and what happens under the hood as a result is entirely under the control of
>> the firmware.
>
...
>
> But if we leave the OVMF to decide for the guest kernel, that is 
> violating the confidential computing principles of the guest being in 
> control.
>

That is not what I am suggesting.

What I would like to see is an abstraction implemented in OVMF that encapsulates
the logic that you are adding here. All the EFI stub would have to do is call
the protocol, nothing more.

After ExitBootServices() is a different matter, and actually, I think doing
the memory acceptance at that point was a mistake, and I'd like to fix that
but that is a separate discussion.

Before ExitBootServices(), we should not be poking MSRs directly. We should
be relying on the abstractions exposed by the firmware.



