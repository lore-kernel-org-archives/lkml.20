Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948980;
	b=T0knEM4lCO3f82hXriENlagAc46lICff8N3CpYFSJsZ3S43cDvXKTpHPDzagEWyUe7Xv
	 gpLjT+IwaR+HJFgD8XCUd3O2vvPGn8MHrp2U7XBroZyRZCvwsisbBC7aq7bnQgNa7pqpt
	 ONgppASL5G6fOIVmiXBS5b4MMuQIU+inKtHTmSw3casFVjJGkBGjI4uHi1BIVgtCjAzQA
	 RQAhUAgQnute60UjwJCv+x3Oxls8bBgCQEzEVZCqVGFPQniYXVUKNXltGGrtWcDGBoaZB
	 ku4jHLVQtzRGeBO4NWn6t8haTST9JgzBhmqhzMJsjrm+ezHgb3UQmQXjanXH83sdivg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lN1N4KZ8AZXe4NT1Y3Gc7RwuWfpfondMmc4ML4yUGYQ=;
	b=vPeQx0bn/SQPADu8p99LB0U47maQ/RXzRekEe2WvOt4pMtuvtryEl6GW25eemPEYUd2h
	 jEqetdIn3N/Rl16l1g9+j+cmsEm79PkvEzs9RhLyblrztXrnoHbk4QUQArsqBjdpweVD5
	 glvRP0LjCMUXmJVtK/NRUF8R4aNl5Rgj6UKORQu89n2zboMVLKintaL0PdAQOmuiKVS8E
	 6CcgLcKevYIDTcSq0T4ZIaOriIjvuv8jzVNjUW8gUnA2hHpy2VRnDfXrw2tvy06/mVIhO
	 Na9d7m7c0tfoc0jCfdwQhOSqEC10m/wic/k7b7H8X1iprPhu1nAx6zmLTtVvFQW7+Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PY7BJYbu;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93CE606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C93CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PY7BJYbu
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad41b6b2ebso43079a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793948979; x=1794553779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lN1N4KZ8AZXe4NT1Y3Gc7RwuWfpfondMmc4ML4yUGYQ=;
        b=PY7BJYbutqfiy6LaW+IaPa+QKyMjcDIbiBI7igHuQaYSt5aLy1r0kmj6EhNdzU4W5i
         rEUAfmzzk7Wi1mNInOSlW1oS/c64YaPmZQ2hheG0HZFy2Y0jCtDHKf6KfLW3pkFE9hwk
         6dAoEdHSbdwJK9matLz7Q+YUr5yoA9nHnmNAFeXeYQapTEBX+nS+ba5nmL5FOclQXfdF
         g3HT8esOrpl0nIN3fXNr6geOY++OcQgtUKoyMnRd7wtsOP8/A2XgwCu5z9ADqthZfRov
         618cotgQJliOx8Co/zV6igSmVDEfKE56+BXBaRXHG2NpAU9dQ41vlrEiAwax1WRTF2p7
         rfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948979; x=1794553779;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lN1N4KZ8AZXe4NT1Y3Gc7RwuWfpfondMmc4ML4yUGYQ=;
        b=iRYEp6MP+mMztVmQJOJYg/bmBtmbSnQ7bSSLIS8zOTsMBGxjoyuE9Bu3ISJOIAo9ik
         s3hFBjxrr+cdwX2R5PXo24QOSyOhLSzpKmN07HT9lfwnqeW08TlCjpE5k9CZkW97LqzR
         uV51KbZo4I+eHwkCLJuhBX0uk9Hf9zTANUG/+tvKW051gwxVd+sd4s95Lp+5vvrdIBWt
         ZIVoLsoFEJ/9rnGdZb+l+U4TFbEC0r1t5Yw7dJ6SyOs+3hvvQQbp1h0/u3UF89CbS6uz
         gC3tpO0t6X4FeDSKaq/7rzayYBVvCKxWTO981RpHMZvgi3HvCTtZCkRIBmrinh6zzBCl
         sA9A==
X-Forwarded-Encrypted: i=1; AL+hErEnNuXgLk6l/4q7hsZtFRsdbP3oOxxnTohK2nxtjKFxDxCHPrmdpYBMoq0iB0mgHbpatWvuBt3eIy88KxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f7OhWnusjtMIse7D1M4e5g/ans2GokuUqnqitLpdG7g2p4QTF
	Q8wyakxpogulxdO+MPYvAoXzlgvUwkHC4J7LlV8CsTCMF7wyu/KmbfnRL32gq3FrGmf9nw==
X-Gm-Gg: AYBFou3TjXfCGcFlXASYgF3GJPChwnmbfz8//qhLIWjwUZ1bAkEWyj8SkpE8lxmzDq6
	LZTLfjME7lhG9dP3/xT92Mj18SvX8CUvqcdBWzzg39QxTWusd4Q0lmdxiCay3rFoEUiI4eSqLYa
	1Hyg7tHKZZjEvU+tWyK3Q1fz/4XAIwp6MEpjrPog6FEASgjGcfT+6CqRDupCPBEe2g+q8DMv1xW
	f7aHwpIUsVOdTFzcYyDEdHvl/AVtIxxKzAHPE3MvimArdAYGTIY2Rhq5dplLzhDKl0XaI5oJM5M
	aD41GDdPLUof7vUUe+LZBqz/LjqhlufpihRZ0AlRLA5Tn0XWBxkMQrb33XYAtzPfamqOHlho2qv
	km5a5vOQgy3ABec9ef4JGgnJgq6eQxFd2w+A1cx6rHbE4ihLImofIANb5hGhYs6bndKHkCmodsg
	l19NFGzxnVG6bIbMfej+tjzQR3KZdM9Nht+PpfDH4GUBYQq6jZqEBeWhvh+hTAHJiMNh8H1T+nb
	BTHTEQcB2Z/yffPm7nE31NOcIquBlV9lQmaxSTJzcWD7cFiHqfts7gXdTNO6xSEHDG75N2eE5W3
	BiS1Y8gvGWMn0bv6YBTu3xqcBXdkm2ey960TXjxU58uLUyDFqBo=
X-Received: by 2002:a17:90a:fc46:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b0db6d61b8mr1079443a91.21.1793948978988;
        Thu, 05 Nov 2026 23:09:38 -0800 (PST)
Received: from LAPTOP-QJLDGQ2L.localdomain ([112.224.143.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7cb26f5sm2064903a91.16.2026.11.05.23.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:09:38 -0800 (PST)
From: Boyan Liu <yymhvert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+02480a85e1a0d4f5@bugs.sh
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix use-after-free in ncm_wrap_ntb()
Date: Fri,  6 Nov 2026 15:09:14 +0800
Message-ID: <20261106070914.3637-1-yymhvert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015024508.3179-1-yymhvert@gmail.com>
References: <20261015024508.3179-1-yymhvert@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg,

I wanted to follow up on this fix. The use-after-free addressed by v1
is independent of the two pre-existing issues raised by Sashiko.

For the skb2 leak in the same err: path, would you prefer that I fold

	if (skb2)
		dev_kfree_skb_any(skb2);

into a v2 of this patch, or keep it as a separate follow-up? My plan
for the independent ncm->netdev NULL-dereference race is to handle it
separately.

Is the use-after-free fix otherwise acceptable, or are any other
changes needed?

Thanks,
Boyan
