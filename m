Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349037;
	b=0Zykza9OBfIMkJqW+8/VuhUBpGLfz9YR9R/eJa/t0T96P6LaNb51w2PhBxQCgYwaCKBj
	 x1G0txmKgHCAbL+Ua6NCehcO3dICtVF6mTgsIUuhVX90L3HIjX7Hkezk5yCvDysVzu79s
	 yVrmeril2tGjCYldpA/+iDr7xtAkZQTnslAgzR7iWrPmW7GmM1SSAOuE80lBP0Pafea4M
	 w1ArHYZkJ1+vMeCwS0s5AdylHC+hze4ZZazTjxYgEtn7JAxmoAcjFMTBSAmnJp/iLCwaG
	 EIkYt4MSg0byJeDB+bctFv/iChLCfKCilsy1rsu6rAMGJVnSvYQ7MyJFkgGOh7X41iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0SIjOpthOzK36b8B/m6qDLN+pvYCImBG1nAZfkvgpNM=;
	b=AMy1U/IOoyz3dFgUMBV4BGzwE9TnwXRnvg91RtgaDGxxiIAuFKr6G2RxNYuPk9GYZqkp
	 MR4EBjl6/OrGRQeG5sg8FPBW+UEWXC7ipPkaUWENE7eSBtGFasi+z8PIW2tuT5gsJaEHJ
	 qE1w3A/B2rGDqmVihrUiC5di/XH1baRLZ9qJ7sqgGMY45cGe/q/g1itGIQ5Xoov0132r8
	 2TtgXuzKjzGPjzPZdSCKvpIlPRgiUEzfgtMY++1h4Ln8q4qjtuVaPXHe5tZg2In8GNKsS
	 +AjypAIObbFc5+exSMIhgLLJuxoLJeD6bO5fmqzqhrqrS3XB+p2e0S3BhKK0MuZIzvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3gpq1EU;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FCE606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9FCE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3gpq1EU
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a1947498bso1178258eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793349036; x=1793953836; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0SIjOpthOzK36b8B/m6qDLN+pvYCImBG1nAZfkvgpNM=;
        b=G3gpq1EUAeWH3WUvwiSx+WEo3Pu1ApkJdrjIxrxwZ7cy9E7vz+zpE1Qzljax0aR7d7
         tUXl+MEavMcuh1jFMnAtr/81/unCanp3mgtP2SewLkgMNwTPVJBI+wvAxm2wMRs4JK3d
         PW+efjGD9YMH5zABLTg/LiicgyjesBlSdHC0FB+HWHLouGbk/URUIRfcwWVTU0fcltYq
         E/R3zWBQFvDh+dx71sAm/vV1mLpwpSSVZHl+O3dmjZzzREik4ebL9DgIKhXwRRnAYU+j
         YjhL4d3gbgaCq9F3zYWrY20PG7OiNSPx5N5a6NW28NsDT7mN6BgUtQ22rZiPttkObde9
         5jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349036; x=1793953836;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SIjOpthOzK36b8B/m6qDLN+pvYCImBG1nAZfkvgpNM=;
        b=G2XlGqaWE2C/P0tw2tBeqhkoJBzsMgA39J/oeZaxMN7aZsP7+djuNB2x6W0PT6W8kB
         wAfi69F1o7dXzSmzaxPY8P7CLoqT8kGejLZBq8hHgMWAFtsPUYHaKOqr4B7OVBf+5ah3
         hjdXL3ZuKj1rahsbj9HGTnjIbnWDNMinWxK2unu33h8XlfVM9VdLW6D5V0OX61KuNemo
         jRWn2egVO4FZOkDRCosNmwacvDX00gNxpyr2jH6cRaPXJcRMaZCZYT8tFAAhFUr4warO
         JCUrd5sdPppomqoETwhzZhb/wXOFSlzt1zYK5bEjfil07WxpS/uEuVh0JsW9SzUW8IPb
         ZjFQ==
X-Gm-Message-State: AFq9FYIikMKVA24kBOu7t9//hoNVhluj/Zk4DjRL+hHCZEz85EGJeE1x
	lwz/zTAWefm+o/lXfKqgApBrk73mrgyhPYJ54kYjdiIpA/UpizBaDKse9ZiFfs2t
X-Gm-Gg: AYBFou0KOHY3nv9cVFBdZxQ2HuNbtEKTUdWtTr7khYmUIfL5KwaA+dsDJ2Tr6U3mCAW
	5vKeczmW0WsCxPsehZY5ApDN0Q/d83d37Y3+21tQFHJuPQJECHYBAotfp/+hcoXnsAO/w3XYYWM
	xBNm1Ef9KCPyjH6zGsU9xL2xT8dhYGAvwgtT4Ayrohv8b4D9BJay7hoPNpKB6k1SfUvXrGCuscK
	0/h2BqroGxn9hz3prGv3emiTVMJgq8jvhujAFhrugKZZ/cVsi6kH04UMWAJC/GWHlDfT9YWX4cB
	0NioTpsPO7SLMFxMOQU9vy7RR/sN0E9Fw0vS5ZLtZ6CKP4QlePQLDEqxsqox6+dxlZMP1EfmdFz
	XWW1Bt8md0UXuJW5nO6zggeLgNicjvT5qFDyjhWX/vuT4Cdnoc0RL0B6gvpJDP8el97oKgBEQg7
	AH3M146SqgEmS2ZBaJQ595LyfmWQ3K2hlhtuKSiv+L0XMKDsvjMAKhbLwGH/5fvtnDM6NDY+CT3
	zaOw/CYqwR9TBX8AqGI7wKEDHb6mxtUgxPMa3ASg0VTLcm8UOqAUiAki5zmJeJ8lSoeo8yFElde
	v1jTGk2liUJeP0XbD7MHPv3ki4AErl/4B1Ve63EgxbsOi5eyiEj1OhhXQ3LIU2/EBt3PsKHN1YQ
	=
X-Received: by 2002:a05:7300:f797:b0:36a:22df:412d with SMTP id 5a478bee46e88-36a42427cd3mr2711924eec.39.1793349035790;
        Fri, 30 Oct 2026 01:30:35 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm5493175eec.21.2026.10.30.01.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:30:35 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Manfred Spraul <manfred@colorfullife.com>
Subject:
 Re: [PATCH] ipc/msg: align compat version-0 msqid_ds with native IPC_OLD
Date: Fri, 30 Oct 2026 01:30:28 -0700
Message-ID: <179334902854.2381848.6451191384765841519@gmail.com>
In-Reply-To: <20261029115514.fd04df0fb01f070f0e960eb1@linux-foundation.org>
References: <179328314077.648427.7284615104475689945@gmail.com>
 <20261029115514.fd04df0fb01f070f0e960eb1@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Andrew,

Thanks for the review.

I'll fix the Fixes tag: 4693916846269d only moved the compat code, so I'll
drop that attribution.  Both omissions are present from the initial import
(1da177e4c3f4) and predate git history.  I'll keep the stable Cc.

For the dependency, I'll hold the v2 and rebase it on Shubhang's
unsigned-long msgctl_down() fix once that lands, so the repaired compat
fallback cannot reach the int truncation.  If you would rather queue them
together, I can send the v2 on top of his patch with an explicit
dependency note.

Shubhang, please keep the unsigned-long correction in your respin.

Thanks,
Cheng Yongkang
