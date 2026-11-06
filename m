Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956139;
	b=OY5MdOF9qfpfYmexI3HmOt61ovsckNWKxLiyvuHw/OFzCTdNqAVp0ix04Cg6XO/6xuRV
	 BNIhsb7hHtgejPpTi/I6CAczZgsKYuWtCudwfcOZW9c99Ml0+P8eiIeF+P8kmYjMiowU/
	 oV7n1eK9E6EUWeHS9rb2F3KcLz5VIon8y0YOw9INM+xiI+EJJXVyS0GBL/fM7V2oDMrVL
	 066fZAsBL8Q7Yr2zcQOIyWVDVCjkOWKrlV25ztUzMcTlPatOugfAmOv9LRu4bz6cigWzI
	 5iUEWCHCIFTVxtOwRHSqSLjocforUv2yInFzMKbazAsD6XCWEW/ZLbVk5nk+E44mjwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=D/sV6OmTM/8MD3UVgw1krG89gB2PaHbVX7B4+P/Q8zY=;
	b=1cqsskMM/49RCfqMUKhINNPPeM5H9w4WBKxBZZYs2HJW/rvcn9WQe4zxe+6r0BEs5OOc
	 klhyLOttUyTBDXWpR8lTJMdlLRJaxgMlnjIxNdcu11nwnwyZ0IQykWDe1vfmPErG2Ni43
	 AyPyGXpOJCRxuVK1ctwgpXKFD5TM1YYcx0Do3gJTlRmBMbWQAsdKupU0o8ogoZN/jtmQh
	 yDxrX9om/II7Erhw/zW/uRKW8rSWsBSBzyZL4aGnVRmCWgXl46RQKdjQu+3dWfJq+ycdI
	 hKANzMxUAVvLVfTHUDjs0fwyV+KtJTO1N1p26DbvfSZCBEPdyQDBjYw8gsDqyHacx3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Z4HVncQ;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7E0606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE7E0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Z4HVncQ
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1357458eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956138; x=1794560938; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D/sV6OmTM/8MD3UVgw1krG89gB2PaHbVX7B4+P/Q8zY=;
        b=0Z4HVncQklKxUYoIvgh2R6AI/hPsiVsLA37zLgWkQpuH/mClbcZLTHcapl9EF8ZZD1
         lk7wk2JOdA2OM5eMaYttdWpOrfBRdknBqAdXoybdGiRALDFyglFKEBbn6mpQJBeFUjEh
         rYP3b73o8VHRwdxmm0rOyuxvBJFgc5OO6LVY7TH6B+9i/09+BvNhTxSSXrW3sAyquPxU
         UiSRbcM42BkZIMLp58bVw1wJ1AfZFuZoBhkR9xvrMGqlJI2lp5kHlUiikXRp07zbGrdj
         6pJkKiMbf0rIWK2PVpXqZ7tkIsIH6F9pAZYj/N+OjiPdgaAQZYn8khqpjal5ytgZxloP
         CnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956138; x=1794560938;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/sV6OmTM/8MD3UVgw1krG89gB2PaHbVX7B4+P/Q8zY=;
        b=KdAL04p9OsQYfBX91hCPXGg1NQQJcswiKFS1Cc45+Fry/VyFpiVUNC/7DtT0dSJVV7
         8IKs2KFC7fO0eRr2RDRY13CIl7be3NZausctT5L0DH0hdSdoSBkB3j+kNfUcfQuk2QPe
         Lvgjpwt2pBG9ucib520l5UQS6cZBs3LoMQWykzjv4+WkriOF7LUs6+alncC+IfJ9/F/d
         T2phhRAulHEjgbfKMZ95duUKP77Qvg+AWYYdvBDcn7YGETg9cToZ5kx/S6oP7OC/0XcA
         xdW32Hry6B8VMSOW7pAQlKtO2/aWFzpxkV/NcYg2Ccq85RCCR5VqNlTVIl3VzP50j9V1
         mRMA==
X-Forwarded-Encrypted: i=1; AKwUvBwVzGN6Z5t5QLilcFQSlcaienvlmAiDBdKGjJXyR3dLnSZnjYHHgvTHYsQpnMHTp+KzgprBoB55I1P8PMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vYj7L9PJdyo7dadgQKpgJ+9XsLetzFupaAMb53twgUaSTct8M
	YN3oHkBh9cGT7bF8ulAkAHkuRjtLY7+hg7d9D1IqKvAsWaGwsoUJkAToV8ba5Q==
X-Gm-Gg: AYBFou2KZaNjv/nsZOVnisfILlkA+nXTTbyr/dQU4g9zXoEvcsQb+xs0LXTvGBy6z5N
	bgsdypfWRgQ0tdsxezDjbxAn20jU8s1QMBcFeu836GGX0/C6Tt8w1uwJGGg4gbVq0aPKfNvdLbJ
	eOxrS1qGuFZNLSlXg5tgURgW7yxB9NYyioBVsL76MdI1FAqN6cWDVG5Rn6Zk8G2bUTPgHZHAXN9
	d3KoW/Lwkqp0fGjLeSSwbfCdtJf7kW1daVmiyNfbOOzAeM0P5ucTeXdNHUZmV5ihA+KnNnEdpyo
	gHSQd5dgDAOoVbMMH+SWHjTVumcgSLS6h04KYktZ+/sxnLZo+Wbwb1696N0hIM1089UFeD3jiFZ
	vYO7lhzuIYwIEp8FNAIaEP/hW3WdPcLC+OmTIbmh8zeMKKAyxYCfqFoTg9DILnNdHtVr7BZcSx9
	vdRWC/eE0C2p6ojM681aLzlM8b+Le3IMnye+NCccznChIGllLKUMqeG7u9uwFfdZ8PhiBmY/3ri
	IRs9Qm8eH7dt/Lgl9B4DNKMjejS5OwP5fFm64tRgh0n4PMMYLFXDNk1fLYnQJSL+Epv1gkElUNu
	C7ufZY1grysXLSotEyedh+7qdseF0OJOI8hPwA==
X-Received: by 2002:a05:7301:19c:b0:36a:1427:3933 with SMTP id 5a478bee46e88-36f76118d3cmr2368614eec.16.1793956137747;
        Fri, 06 Nov 2026 01:08:57 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:f1f1:1284:b05b:3b9a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm9966646eec.3.2026.11.06.01.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:08:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] NFS: idmap: fix race between key revocation and
 payload access
From: mdshahid03@gmail.com
To: Trond Myklebust <trondmy@kernel.org>
Cc: mdshahid03@gmail.com, anna@kernel.org, linux-nfs@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <457aa50d7c217019552b103912a1309f7330c617.camel@kernel.org>
References: <20261105173251.30389-1-mdshahid03@gmail.com>
 <457aa50d7c217019552b103912a1309f7330c617.camel@kernel.org>
Date: Fri, 06 Nov 2026 14:38:12 +0530
Message-Id: <179395609204.21365.4245889481354759103.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi Trond,

Thanks for reviewing the patch and pointing out issue.

if i understand it correctly ,you are suggesting me to drop all
(semaphore and payload-access) changes and fixing the zero length 
return handling , since it currently treats a zero-length result 
as success.

is this intended approach ?

Thanks
Shahid.

On 2026-11-05 13:58 -0500, Trond Myklebust wrote:
> On Thu, 2026-11-05 at 23:02 +0530, mdshahid03@gmail.com wrote:
> > From: Mohammad Shahid <mdshahid03@gmail.com>
> > 
> > NFS idmapping retrieves the user key payload after validating the
> > key, but does not hold key semaphore while accessing the
> > payload.
> > 
> > The key revocation path acquires the key semaphore for writing
> > and clears the payload pointer through user_revoke().
> > 
> > Without holding the semaphore ,revocation can race with payload
> > access.In this case,user_key_payload_rcu can return NULL.
> > 
> > The existing IS_ERR_OR_NULL() check passes this NULL pointer to
> > PTR_ERR(),which returns zero and incoorectly reports scuccess.
> > 
> 
> Let's just fix the real problem, which is that the callers expect
> nfs_idmap_get_key() to return either a non-zero length or an error
> value.
> Right now, it can return a zero length, which is interpreted correctly
> by nfs_idmap_lookup_id(), but incorrectly by nfs_idmap_lookup_name().
> 
> The semaphore is unnecessary.
> 
> -- 
> Trond Myklebust
> Linux NFS client maintainer, Hammerspace
> trondmy@kernel.org, trond.myklebust@hammerspace.com
> 
> 


