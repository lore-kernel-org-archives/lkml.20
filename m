Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046840;
	b=S/LwZpjuLyMLvou5lWAs5I3Aca67Z+3tezNW2RRzhZXsblMzScWo9Dt8XtSmb4Jb3P38
	 COyy+FlEs52kS1/dTj0jt8en2sKwMJ8xQ6mo+iKWGiRHOfdqGFD5Q7faglmedbPX9OfvA
	 N6dNLDObp/tCZAbxhV4BALP1aX2WSGmf6+AEQXB6S94awh7QGb6LXjG5GW1Dw+RTfns0I
	 7OZHnR0ApP5F5D2jKHdXPPkCxH+UiTxcA6BBvR7Ap4ULnfNXiLIgnXg0nvo+7UQVyk4Fl
	 NPzriXnklnPs4gzFhWu/7hveCEvexrlFvPwGge//8CaLsSAXFayYMAPGHTykqe4Oq6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SyrOD4nxK3+1VMgtAgfF49M56P+HbkcbMWd7Pxr1oWA=;
	b=mlOKvsLpXoPKiKMBco8L04AoLHvIV2MwHlxmd8poT2DV0qIZpRJT4CAPdLSiifl5aH+5
	 LP2t96c5X59VHjuy9fkhwX0QMdtxshPkltZllI9vvR3qc/U9O0smRkSiirqD1+GWOTvOC
	 MCXWwUpz4VLjzWk8/UAy6WPahxRqBHu9K0yZebEBdMVeISgASmXrzTqEJ/nWEhE4s3obN
	 lVooWko/BDUVGUbZ6MFcgdNC5pekEX8ZRYJds8lFHbQdMJ2PlQxGcfU47V6wILJtqtqdE
	 NIL92zC2+/UkmQMEDMOWvxBeWNJkc6Di24sTzM2g9KC4ETYA/z4UCKtJhubojK0E3RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=redyjGAN;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711DC60A261A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 711DC60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=redyjGAN
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jD51z6Tzdz1XM30g;
	Mon, 26 Oct 2026 20:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1793046836; x=1795638837; bh=SyrOD4nxK3+1VMgtAgfF49M5
	6P+HbkcbMWd7Pxr1oWA=; b=redyjGANn7/hLRfLhs7aJOh09mMJ913xMSk7MTEI
	vI3Yk+s+p0yVkDCpMQBkATobFCWeKjI8MDdl0Oya5kGyVhdhQsB9tiSqma0WpJB7
	sHOYpy//JNNKr8/wHwR1F4f1zN75z9KZ4j/OBxG9BUTnaaaG7d+V/Aie0C8HOot2
	3t7Ug0ZcZlVN+N2eGMbrCfj4VEbPEPREZZQ9Ma9SCJ+ZtFr1eaLmOMcrzskC9qVx
	AF//O5TWyviTss8PWYHm/E5RHvzMsokAro2J90COLpQhWZ70awNRGOz2yh8ivxOS
	6X98WWQKVFaNO3retvSGawqTYBryI8QkJ9wRl339k6TEpw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id HsMcfnYmj2MV; Mon, 26 Oct 2026 20:33:56 +0000 (UTC)
Received: from [100.80.231.125] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jD51v6xNKz1XM4Tl;
	Mon, 26 Oct 2026 20:33:55 +0000 (UTC)
Message-ID: <54994cfa-ced0-4eb0-bc7a-43b860c6ec19@acm.org>
Date: Mon, 26 Oct 2026 13:33:55 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/iommu: Fix an RCU read lock leak in
 mm_iommu_is_devmem()
To: Markus Elfring <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <chleroy@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
References: <56f0c45723ee53149a21ceb599010e957457afd8.1793044370.git.bvanassche@acm.org>
 <ed315ff8-36fa-40ef-90f9-01ad197a9f94@web.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <ed315ff8-36fa-40ef-90f9-01ad197a9f94@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10/26/26 1:27 PM, Markus Elfring wrote:
> Under which circumstances would you become interested to apply a statem=
ent
> like =E2=80=9Cguard(rcu)();=E2=80=9D?

I will leave it to the PowerPC maintainers to share their preference.

Bart.
