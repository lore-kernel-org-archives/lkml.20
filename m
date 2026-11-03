Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793677995;
	b=nm7/3riWO7vsz9CqvpOHxIT4zPKXBHomYZSvYlMJQFsBltJd+hxWL8hIyPT2XLyYmkOH
	 JRBqPTDP0ukY3ZJp2edMf6/H0CSs8fysMpuCCm2PR0u8DFszzaIvbeVYnQqjP69/RXIah
	 jMw4Rqs1goM4+zCMmBnZKKN8o/TtxGDoXjD1Jh4aZjBQh7QtatvvZGiPezrFR78NfnoXP
	 XrnAFs1YhZp+3BZnMYg90vTlnLe3cwIpduDD/TW5nHZNwZbQ1K+UYU5S7BfOoSbFn8rZ4
	 i9m1KGZBWtSjbfDvIxz6xHxN7zIZIPqJqPAIbGHTdQLRZsEo9UFf+S0o1+KcoMhnACQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793677995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=76gGkTqtaYNNNNFBCSrtmRbRqlON+bEYckw0E/pLtHM=;
	b=zpe8FJka2DtPPUPq0vX9zY0jK1cKEFHvTAKnVi4cmtx8yxBCXi5OnQC9v6gt6JDB2MRF
	 nSncG2hBMFTjEN5S0A31sXsBT5yMGY7VpJ4STxII+PtinYIodsGQkgMTVIImdplgZd8kV
	 YW7kVT28r92vVpOUb7fdVGKfcouTNY5J/l6ahV6Lwk0zoT+n6VVzxpspfddfY549VJ4FN
	 pLCPE7QgpYiE2tlKJB9bbkYWRzkhVeofmwPCyMN9EpChMVqY3IdqbRsMP+wO+sQidwinj
	 S8wB692NfM3Rez/YRzjsx5R+oyQoZ/ePAIqMz0+iQwTifVaQPysd5U4HoTtlPd1ahnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8M14MOc;
	arc=fail smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB05606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB05606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8M14MOc
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-85c1135c286so2408577a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:53:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793677993; cv=none;
        d=google.com; s=arc-20260327;
        b=PjLQIoaXzpLcF+wzYsstYpvxYKBbBD2legJI2zhAHDQxlYVQQ9tDGOXZsOrcsvXMOE
         XZ6d5D9SP5DeSfg3JNaRfY1BiZ6RR3hE3DMiYckrwEPtr4DWSFPX+TCL4QTmg6JTRn+8
         VPDYz9EvredFELqK2Zmfa6MHi83+M+ZYrEaJjrcyTW1rv1ItJTSpCPSA1bmfTp8g6NAN
         IwLhiJ+7itD0uijLAbjTmS5/+oBsoBikd5yDBUWcURSLOUYrjlgX551YWn7snb++nDXN
         wgN2KIIAhcgc1ERydvnK3ntZcvAndmkT01Mk2/HC77Zo8i6bCCuOGOfnWOHnFPQG6eMm
         aKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=76gGkTqtaYNNNNFBCSrtmRbRqlON+bEYckw0E/pLtHM=;
        fh=qR/V36o9Jy1dbo4I1ClBsdWTglH0zI9TJSJzycDJ7U4=;
        b=FAjTt/v2OBhoiCRxYpEldu+1Bsz+POD59WDkhdvvfWr9bfwuapAVCc0JbAQPZZIGiP
         faRfEGdLHC/epSBOe7khgxldCt5Ul/G3qibedjDomenisWXSqjIcyoG+wWSBexf6i+Jp
         aCcZoZzSXrS30dKJmeIzXdW7zk4KjbYG6LZAiHSDjhN5F7XK9etWW7MOX0lkAUtYjqCx
         QLfpVi0Zmj5dP8bOGpGSn7XWD8VefybzZlpaDyNj/rzmBtJy0y4NWzArrGmtX24p1mP5
         GkOHIYrevCRHa4za1TjV++8rvpzi5qsx7E+o6kSY3tkzREzMUyyA2yBXsP7WjJZP4V52
         Emvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793677993; x=1794282793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=76gGkTqtaYNNNNFBCSrtmRbRqlON+bEYckw0E/pLtHM=;
        b=L8M14MOcaJpc76OWDxueRVeV9C76b9r6Uyd4M4brK6+onw8iS562oijlRkYcOcg9+A
         bRbNUSU5ECIR+C1nk0mTlcuGzqkl4Stv/cQETFnptUt/0THXr20WveLjDpKlo4GyhJru
         aAzNt33KHggSYCDrq89yRI/UR0DyJYa1eEbkn+ykL9jI4VJv3csyJIx55u+e8nfi+74T
         Jvx+tWN7mC7W9F97bsFCNKioR9S/QYN7FwHbRNPHCUd9Z4hDU9FEkRSryD3zC4rIA1/4
         b9di7HEURgISJRWIur1UffdAdvYhrVJOreZJ8EQIDMNTNZa+9b+3/sjButhG7ZLwr8bJ
         VtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793677993; x=1794282793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76gGkTqtaYNNNNFBCSrtmRbRqlON+bEYckw0E/pLtHM=;
        b=RWjbwF1Vp5FwA5Fj1G+tZZwi+NH3jQMZr91EYUDpTFaqOJTie2BYuxaJu1CK9ztuqo
         xjOwwMJYI3f6+MfHm1jfGpOjZfaSKEmrUBhtBDAASIIdM8BcuqLg38kHetP0/sXEQyVf
         Xnqyvsrnp2sH88Z9475va87dR3TEcLw8rd5Li3gvoHFDaqv3sV2LoEZwLyoKoNtkZX/Z
         6tIq37W9tqxujfFIsRxaXofFZ112/f+glA+2XPhWU5t1BQ0K2djiwDfZMvOexDE94MEP
         pWrxzfN4VyiUQvgC9Q12E4J8aUyMosV+8FWxmdzVbkaYZOXguNxdXuNIWVZ6d6UgaeFc
         Adug==
X-Forwarded-Encrypted: i=1; AKwUvBweDftPHYn+C+kLN/mg9qKr7oyrSFvAuR7kfWZYaTliBMQtkw7F6sZb9vYh0ewwH/3YTpaMYU6F6IMGtMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuWFCN/pQoAOYUKgw77ppTl6x5B1oGFlzRgJbkkIVbUXEXOqvU
	NGc6Cvqkquqdib1m0YlZgZTBj2nOM0Oi+bZ06y4tlVkhacCqYCtD4fewJQiyZCxOBVomhuxLKli
	QHUG4VpgsYP2DN3G9mCWJUzZ6oWAtFUE=
X-Gm-Gg: AYBFou0r1yiW5ezR+myhTTnNRVahBnZUhzWa/jf2Q8AzcIw7CaMGXP3BVQwkBRFXE56
	XZUXKdKHFV17CwnAOuQpBRexGlesUm1TfHb49JYoBz1+TS5h1g+dPlgRuR/dqeNTW4skobJ/c66
	a8A6MZjHGZfVph88Vr0a3VmL8ByJPmD6oplDkIfeS0BgeGdw3fnSowf1o+lDrSKdQ+xyVifvULI
	gCbuRV+aUzjfPgVdtvjLYEce3WLM2KYA6qiRr2dr21gygO0H5mKlZXZ27YPL9/cQMIVqmw89fDV
	8Epmwz2yI7l1tx7T3Cj2ml2AcbLB6+CGKTZ2WgrexQj3h3LHK2e+pN2WH8H6dRscz2YOiST+jcQ
	vMxiLGxHn7DWyYqHm6kyPlrPh8ayaL4InczRvbCfxomyi/1xLoQqlJKgrcgUpUJVeGeSulN8=
X-Received: by 2002:a05:6808:2218:b0:55c:95a:f10f with SMTP id
 5614622812f47-5640de58220mr8255866b6e.52.1793677993492; Mon, 02 Nov 2026
 19:53:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102101125.3523835-1-mmyangfl@gmail.com> <68a1d47b-e3a1-4353-82a0-89fb2d387f2b@lunn.ch>
In-Reply-To: <68a1d47b-e3a1-4353-82a0-89fb2d387f2b@lunn.ch>
From: David Yang <mmyangfl@gmail.com>
Date: Tue, 3 Nov 2026 11:52:37 +0800
X-Gm-Features: AclHuK8IWE7V-kEZ0tfbWmZ_cNA8A7q4Hv7g79t9Ud229ArsBBITMxgYp0K1bVQ
Message-ID: <CAAXyoMOsu0kL9Y=7+BhDizgUbF+tY+i51vdNpeZ6KhQAPovvcg@mail.gmail.com>
Subject: Re: [PATCH net] net: dsa: motorcomm: Clear the MIB buffer on chip reset
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:44=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Nov 02, 2026 at 06:11:21PM +0800, David Yang wrote:
> > .setup() can run again within one registration: removing another switch
> > from the tree tears the whole tree down
>
> Is D in DSA supported by the Motorcomm devices? Or is this tree always
> a single node?
>
> > Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921=
x")
>
> What i'm trying to understand is, is this theoretical, but never
> happens? If so, it should be based on net-next. Or is this an issue
> which actually bothers somebody and so is justified having a Fixes:
> tag and posted to net?
>
> This is also what that automated email is about. We need information
> to decided if the correct tree has been picked. It frequently is wrong
> in the LLM age.
>
>    Andrew

Motorcomm does support cascading, but not in our driver. So yes, this
is largely theoretical and I just follow what sashiko said.
