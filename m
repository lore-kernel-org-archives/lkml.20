Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8DA4E06EA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062917; cv=pass; b=Q8i5orBsqHQd/yhJr1mRFUT1x7XwTG2aVf5rsUyjdHHBuHLfaneSV8q5Vqpsj0Ak/4CUblypufwoQokLMi3kRQCGVJJz1EVm6nao85URdUJyV25vrlM8pfVgz7rKDhMWHotvHs1REEB81k4xhkfEThmgDOJz5xSWhaU7SKvzJcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062917; c=relaxed/simple;
	bh=I9oPJ3YGlwxlNX6cpMBiC5ATHr477eWduZeRhnHEaoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tuYpBNor4JacAHGnqFjovOno3isvuwY4GWObIP0Uzf1DLpPg4GqIRLoZv3inrUvFUFNVPkReTe6ZjQbavpAQGRxLRzxV2DxmxGBEJXPmBn2XE2v6O2lqERRQ9lvYkyVNbgYqhkPogPlS3rACF5XwPPKDV8fWMUqKj0Ga2GguaiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=tFsok8Gu; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="tFsok8Gu"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0cf2c0785so11703607b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792062915; cv=none;
        d=google.com; s=arc-20260327;
        b=aG6sfFKE2AdIATvl0faBvplTpqUeJ4waqU46rSEBWMftm4oTpJLetFctsdzZLuiHpm
         kzK2Ge1AVmwsaCgbjRi623ww7aF9KJjjFpHqML95ZjlOKOM5K+z16CM1cUHJVLrA/r7A
         wasyCr7IjPMQX9nrNaeh+0qoRYNtNqbBVFLTYRg3bjW5ROdpHoMdNG3re1oAh7cc6pAk
         SceCo9FiIG6hklTW0eo/ZcDqsWeFm48qaPyZE6idvPi+ywilWLebgfLude9j8cb/CIIY
         zE/7mVicbpKwNQxuhyuJzLHtBM74kQxeUHzH8cgXdKnYz7BvlfSdIZBo4PZYOcushnmp
         vkkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I9oPJ3YGlwxlNX6cpMBiC5ATHr477eWduZeRhnHEaoM=;
        fh=QfQq9mE7nY53kgmFj166msT/qIEeilJPMKJfQCl4i9o=;
        b=BnsPZ08A6SFvrmXlvME1hdozknlrEsPGkx6wj59VQJ5F8qI1AvYXpULkIuywQ4sdHr
         LU5egKezOlqIHIhXybkkkgCrGvBkkqDV13uf/tfiltca8bVn5aD79qessz6iEG358oEp
         TxlK0I1IBIxYkx79wT8WOOJPulvctNRXTt4aTF9IWzc91epke4Sm6G5YsvAmuJhxbIF5
         7kg35As4847+SAXJYgWoH9ZeKbZ4DbNDp7J9PSD7R+i+/vqKhW7mmMpAsMdgovg250S4
         0pqKQKvn0+gBuPUb3s4nSxMiomwqwesJYDBGW9T177pqbQoZ38gni2/thXclW8sVL6Rx
         banQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792062915; x=1792667715; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9oPJ3YGlwxlNX6cpMBiC5ATHr477eWduZeRhnHEaoM=;
        b=tFsok8Gu7pL10k+toUtA9U1xyWr1fKGTQGuD6siZNufYDmTlx5iGEacoYxtaO/9xuZ
         royzZQvQ6BThJfyJOQm1cjOvW32PR3hZrFJznN27ptUm1mghkbkPzgXvj2a6XHJP47TB
         bbih8OPOOMxnSjvYa3885JLpMvx+GgzIpy01s33Pr+h1OnjbITbetlHEid5It9BuxJdj
         +jtrJxAEb7mGxUwzI9gbGyCk7bauz2wHkzrmnfBsZ71s8dxlipqI21+C75FkHWcs/1y6
         QR+IKe4BLpXExBmfQlhIMoF33/KjpN4sl9hVB1ojQGf4RCv8Q7kgUbMcMuO8dLhZMhMI
         Fxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062915; x=1792667715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I9oPJ3YGlwxlNX6cpMBiC5ATHr477eWduZeRhnHEaoM=;
        b=PHqqgOx/98YzhX/bhAYK+xUGQ9JdNWl+GQYvGZKlHbY3+TQSTPLysD4RNc6X/jN/C4
         sQ3i42PJFk36MSlc8eMmWPUDIA3RAP09d0y07ykMHHDXBzBFgPoR/OmI78cOROSRmRha
         /vxeHKMpBlVsZz/RB4Hygi6TgnNQLKE36QvDRehwTWKARoKb+VmaWX7lv2m0zIEMktxO
         Hko7RpSZUxF2HHMhslDESa+KlmlcBCAj7a2WDHPzdsUqzo6lnBX7ZM3azt6WIfNQ4x97
         pDCoYv80STFGzkMYy94ARfIAdCO/J1yq8SFUR50CmBtNltj4i9rMi38dxlfc0BMLHgDH
         OlyA==
X-Forwarded-Encrypted: i=1; AKwUvByjjAQ7iDmGt2pIb+uuTYMak6LyEFUdC2HEWqCNtNBr7DeTiZUnTT9sWagC9y+3IUBUILMQKgq0ydGauDI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvk8uUuNw/+e94UYT7ldEtgiokZRv7kNG92dTxFPU24e4vcjdH
	akvTsQsm4JeZfjDFIXDC3ASd7goh0kh/lxv0OEcZDdNTm+X3hDP+2CXNZ+s0qgS1CADOLkIKLH3
	R0yNTEiN2Y4mhfwfE2kiahMjjtB/ftHwBvV2Q3YdY
X-Gm-Gg: AYBFou3O+yVH41LpOnutsB3dgrJe+OQFbKSeKcFgtXGbTJHHV8sa/nlESim7yDtXLHZ
	cEc/q+nn8EaKNgrEwbYYschnSpjZQzEf8KtA2rF1xU0uGg97yTufLbWyobf5UjymkAcQ+bc1vP5
	cSqmXL+jZHgSzbf9TNfPtpodkvaOxPrHlBaQqCEnFAPDl1F+wpoLu/Xe8EKiZhkUMPRrO3jg0hy
	oS7WDI89sL1XpFrehK2ON0/crJUGdvKu5O09k2nT9ITdsJGsAMEEMv+yNP9DNGYkeSX2qlO01oB
	Eqel99/ow+cAeguF9GgVJ/SzpO7O6rqqPAdqXOCW5C3XSt9qkHY21p2MMjMo+U9RoISdA6vxtMt
	F2x6dFAwJv5XClYSmGvwucStEahZndGQbkpeDiV/TIY6bp2W7ZruFHNLk1mlD/B7gY5sLuSyPwY
	9+QPBYj4qy1D4qNODknBzVzOIG+TpP543hya5vnlOpr6Acq9DQECpFxHPm7NtihJt0GiBujD141
	9slgp+HtrxxDtMons35G8kwkf6piI7++df2S7dSWxUWwxvUuKbXYBOzIFWs0UBu3f720oyruN/7
	v6mW+AE0fDV6UQ==
X-Received: by 2002:a05:690c:7012:b0:8b0:cf3d:7b35 with SMTP id
 00721157ae682-8b0cf3d7ea6mr10078397b3.15.1792062915195; Thu, 15 Oct 2026
 04:15:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014235628.197976-1-julius@bairaktaris.de>
 <20261014235628.197976-2-julius@bairaktaris.de> <atCsGx2IRecQNK3r@chamomile> <atCs-U_AXIyvvpKd@chamomile>
In-Reply-To: <atCs-U_AXIyvvpKd@chamomile>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Thu, 15 Oct 2026 11:14:38 +0000
X-Gm-Features: AclHuK-GCm2OH3Jid7zEvImtoqSM3gq7UTcC3JLFEhmei75CLrzAl8zOZjCyOVw
Message-ID: <CAC1t37+g_5q2NbKmCkxhZthdHYabypyDZSoshwgAUVjbGm0NsQ@mail.gmail.com>
Subject: Re: [PATCH nf-next v7 1/2] netfilter: flowtable: tear down direct
 xmit flows when the fdb entry moves
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, fw@strlen.de, kadlec@netfilter.org, 
	phil@nwl.cc, horms@kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, razor@blackwall.org, 
	idosch@nvidia.com, ericwouds@gmail.com, dqfext@gmail.com, 
	netdev@vger.kernel.org, coreteam@netfilter.org, 
	linux-kselftest@vger.kernel.org, bridge@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Pablo,

Thanks for looking over this.

I will incorporate your feedback and send out v8 + explanations for
the questions Saturday.

Julius
