Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794289540;
	b=uSNaF3g0zJf3Yow6itCiObnXA3UwEBc1PYMCB4zyvnbPVrK4nk8FjeX0SldArKENmBYO
	 TG+ClqzimOercLU4G+LZEEMd2E+FEIe/h87pzLO527XiYg6UUH/FSb5HLQKUeDYK1dR4f
	 +Df9cqlWYiHfGQ6JiV4okIVTqUye/FdVbrRomQzmDzg2RnUxRAg2F3g+gfMbaZkE8qX0Z
	 F67Yf9H5Fns3duubEUseQXrKVYMCLUv31b37UkpLLfhw7wX6/xPNTkP86mViKSDxt3B2p
	 fErCC0PC3MKYiMixXHhKvw070dYACTNV2h4ymCbkHc9cdCMDTGFCbylXR/0Tm8egY3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+E82dUvkv8bQC8oFlCDIESMAlSG6FiZTUr4W0LfqWTA=;
	b=mNBFgs9qjEMJ3kuOiXe1bqyiX4CnX+emetZLTmxz7zOi891szkcGtBZZyhn7i+3Z2ZLv
	 AS98PqvcIVgH8RLZJcYOLH6+RW0cm8QteB6xzVWu7QNx5M8HJ3nexN+EwS8lG3S1Lowte
	 k9sAptHX9B59ur/v244HwzeiV4F6V/6hcKJwHAW52PJgg9fasCte29gmJZ4Z08/EuI+9B
	 fq6DYNEQesZIZDZdDPcd9n2czGrXdEA8hjaZ4aM4Za/ruQRjlLSDXiLjYsmgGsr0vPnJ9
	 jEuoC8frxpn7v3evnKwSJEr+UzpVDL76pO2xwZq0cTx42GawpFcjYFHIlkkvhnXFJKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PRfeQd3i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4443606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4443606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PRfeQd3i
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018493d57so20215e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:45:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794289538; cv=none;
        d=google.com; s=arc-20260327;
        b=TVnClwF6mbdPkCHNkz4vlShcoAZm3TdF/ic8/6w3SfKL6l4eTQhB9QGcdbQcNL2hWv
         r+rsrEMoE9HvNR2r0uXKpTdZO2sET86wlFoAWqGjtgSanCycLbUZEUEwKb0ujVVoPTFX
         MDdycdv8mmEsP5YXidNgCM0qsXYhLj4MI0b7GNK/L+DgyNsQp+Ybm2BBWlJ3Vt5BB+j+
         V0uh2w80FxmjJr310PtkkRWWL/Fy5UJ9/RZT7uIU/3mJy/JfD2rsWUbLpWOw9NM98pcm
         oJZsoGFyfhZ4L3j9XmRxnDGmln8C4jZYNNMl2FwBqyBncNNIJc5lcSwPRBl8AE8qZdxS
         E/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+E82dUvkv8bQC8oFlCDIESMAlSG6FiZTUr4W0LfqWTA=;
        fh=C+xpNVPvcPTA/s+daSKy7NWg4SUH9RplCDpiQVtj9nc=;
        b=IE7WvG9cYq9n5Mbyf4ehg6RDXcSzJoPSuDBs5nJopjEPeBT+rEY3LX6VaCnKeJ4197
         oCZUhcE6I1qPkklMD67cfsD097mIt+jLKIeDWrgn/bDAABANZxv4K9r9fO4k+RkuUHrv
         SnxbXF1A9FPc9fu/BxujFj1UZOXo6ATR83dU36LY7kSDRyZubJy00dCR2yLJcxC0EXbH
         Gfhzjrehs2XSyMDIgk48+GUOPgv2v1pRetyFGY8PxrjB7SkQttWMM3qDwm7kBgJD8CB2
         6mOk26vWakQ1Zgjx4x6FytJ9bG9Z/J/clYcf4hWsHgXfbYS8kSx1sPUYsOdjmBOF6J4C
         XbVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794289538; x=1794894338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+E82dUvkv8bQC8oFlCDIESMAlSG6FiZTUr4W0LfqWTA=;
        b=PRfeQd3iXtdmzeWbjOJ9ChIu1Y/iGxsUPqBBX5k7SVxZPHBUxnbYwozbMVfy9JaXAO
         ZQkt+1FdPeWGFSb32c2awO6Gj60FbFFCPQ7Iy8uCmB1XQhRjLs/G1+7euqy54NJyt1NJ
         qK733MXDL3JuFDcvFGRvcAqxJvcRmXhzHWFDYyXdDbRCazhQxwMdx4C9FuxY9YPjPNRW
         S8tbiJZ3Y08g0+iFRaw6rnWmylHfBUikd5ELN9dkOkZh+ynVC15seyrZLt1ihw7uGGcc
         sL8Ow8z5gZ8jyJpKXg9YGe83CdZ4IuByvo/VIAim4rrJWryLRw8f5cfRctxc9oV4Jj2N
         DfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289538; x=1794894338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+E82dUvkv8bQC8oFlCDIESMAlSG6FiZTUr4W0LfqWTA=;
        b=xY7t+nHHI8GtawLb6E5OJIjfPtn2hWqS6L+j4S9LPqYQr+QuVFVMXYWGvF1jbFObm9
         fy2nPJxvrwTXnO8lwKtysbeJq/l6TWDxa2rJJvzdXNiQI80mesnSKy01dgT97va7AQ1O
         oS+jHRpynwF25VQVf+MPCjopP5eB87D+p7aNE7JOy+xloTOlIFYmeKozru8p6cgt4IQ0
         KqIn2nZCg99J4maKgItT/TP3FbIud6rwpH7Wh6oK4zbAxz3XId+/8S+q9Mlq1RDLYoGz
         AmXJsE17akNqJc/Sszqauf4CmpFo/zsXuzzxMZnodsycN4AMneGgYN8odLsUnRbMzVAN
         K24A==
X-Forwarded-Encrypted: i=1; AL+hErG7lUi7emR+jp5zvZHQCTCRyxD9a9FWCIsdT0GgQXu9jQ2N4TLxNNWCO/ffJxyueLkAwoB9uH45rEQadzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/56bJXPi7CemsUV2gSpJuwGBUTLmR67WBnoYkHgA7s1Fq4ItnT
	yDr/+82Gcw3t074F3nits6DXKE4KgORNWiP00qa1NY1juemGMslx9W3oRXqmBN9yzXhl94gRpfR
	ikRIsdSaJs1mv2jMU6N8qTPqQdhu41gCcjtouucb6
X-Gm-Gg: AYBFou2xe5OW9WJwcm9NMgMaa16JAPfdyBzaRtaZY4e0CWkN7owP7FBzt8HGw8gU42k
	qY5xfRETYf5IfXykGx7isOBopghFM0zvLndbOY/jhoTPAklap5/Piu1c5ZgNirbJc4aGHgUGcGq
	eDJbxUWltACVd1//DwERKXf1EW6/g7oQYrJQ1IUZKQQdtinM7miRNhtgQkY3v/GZ7927qF+WAzs
	mPX5c3QVBtOVl160XbM+4S5AFxVUQ9DdurmQuJIm3O3l3wm3ttmdLKQhvjxLXC9kl64WnoGzzx9
	2TxfZE6iOZ5V3o094VJnYSLR14BnGcii/wSDMNMQKYb2D+hU/DvnHLM4YEFJV/lPcmTUd0GZLPg
	wnLNDUHjmBiAXtAfFMOh2yzbhYkLZ4+iZAu2Y269wj+kx105vFEhF1CtP72SHkKUsRyZx
X-Received: by 2002:a05:600d:6445:10b0:4ae:4442:ac17 with SMTP id
 5b1f17b1804b1-4ba0236623amr435715e9.6.1794289537823; Mon, 09 Nov 2026
 21:45:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260203192352.2674184-1-jiaqiyan@google.com> <ahXI0cK9fsOByvKy@lucifer>
In-Reply-To: <ahXI0cK9fsOByvKy@lucifer>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Mon, 9 Nov 2026 21:45:24 -0800
X-Gm-Features: AclHuK8JoFravzJWRGELAyfLQvRrdOszwg_B9l1wvjwh5zE1CbS-L9cnu-hn2ZA
Message-ID: <CACw3F51Q9TkMWr4WbnN07q60L6vj72-hFWwpqf0n6rf+drfb0A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] memfd-based Userspace MFR Policy for HugeTLB
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: linmiaohe@huawei.com, william.roche@oracle.com, harry.yoo@oracle.com, 
	jane.chu@oracle.com, nao.horiguchi@gmail.com, tony.luck@intel.com, 
	wangkefeng.wang@huawei.com, willy@infradead.org, akpm@linux-foundation.org, 
	osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	jthoughton@google.com, jgg@nvidia.com, ankita@nvidia.com, peterx@redhat.com, 
	sidhartha.kumar@oracle.com, ziy@nvidia.com, david@redhat.com, 
	dave.hansen@linux.intel.com, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 9:23=E2=80=AFAM Lorenzo Stoakes <ljs@kernel.org> wr=
ote:
>
> Hi Jiaqi,
>
> It seems this series got stalled on review, wondered if you planned to
> respin it at all?

Hi Lorenzo,

Sorry for the late reply.

Yeah, I was stuck on the issue Miaohe pointed out for quite a long time...

In offline chat with William <william.roche@oracle.com> he expressed
interests in taking over this patch series. However, he seemed busy
with something else and couldn't get to it.

Fortunately we have more powerful AI now than we did six months ago.
While I worked on [1] with an AI assistant since 2 weeks ago, I worked
out a solution to the issue Miaohe raised [2] with the help from AI,
and now a working draft patch series. I think by the end of this
weekend, I can send out a v4 built on [1], the patch series I just
posted for freeing high-order folio that has HWPoison subpages.

[1] https://lore.kernel.org/linux-mm/20261110053331.2708996-1-jiaqiyan@goog=
le.com
[2] https://lore.kernel.org/linux-mm/5e0fc743-eb44-b69f-01a2-da7b6f2eca8d@h=
uawei.com/#t

>
> Thanks, Lorenzo
