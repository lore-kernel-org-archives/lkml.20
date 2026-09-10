Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40CA3955F3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011009; cv=pass; b=gWXkWLNExHGxXCLYIB7wpmehuDe1RZN70ZL5swIdk3/MvkqW7Y2zn72M2r5AktQVsWkZQqLhdGgN0f+fNQAe1wgDKauc+gLc0ftTP5c7hp6oVa+QDgUNKAUGJ66++JMLVpvZbuyPpoxSrmSjCGLd9cjUdLaOZXR7nY7YB6w10Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011009; c=relaxed/simple;
	bh=hKMQeXyU6ts+i8KLdl+j8HVFtkABo1p2PRJLujgXu6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kskK+Xm9J6HQNVXh8sw1nMicw+cCU696FXoCz9WJDN0LV57NQP6EsVbGQBRLWOkWfGcemZTAvBPX0BxqEnkV1IN+SHykL2rdcPAtAnWyeHMXPjFQ5OOE6H87jAbyUXv2LuKE9JM/T3HccWcFVm5B9Yxm0nQnVZ+eTWeJsEig1xQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rndTuQcT; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rndTuQcT"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a4835ab78cso30139681fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789011006; cv=none;
        d=google.com; s=arc-20260327;
        b=lca485K8gz0q7pIQGenLDLDe19slawTjRXBGmJI/LX4dSwQtXzIfWOM6oCERZUF+uj
         75KsHtBkmApgHyuZMxv5Hp4kxbRvF86MOX0fpQK/b3xFuXtSj4MCukDfUPuCk6IoBxoK
         KITrgcXmehqW2o1PzOGEvOYe/zVMlXxey80ad7mIDBmOXmwgHZa6RnEh8Li2HtghCEH0
         ml1XLZdz8tyOzQ53iAOpjj4o9bRCNsOWImYQcIWuWyxjNDwBqf/epO7dGba/UHMJIWsc
         r3lwS914Oa5sIovpsqpagDbAE2pBEYeBU3lZ0f2Wrz5qQfT5YqVk+M6G61b0nKE25u73
         daSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hKMQeXyU6ts+i8KLdl+j8HVFtkABo1p2PRJLujgXu6A=;
        fh=Ldk3YTesPls4IFAOBpL4vDzcFj6Fs2PkcnhPuodZSHI=;
        b=LAZgKLM2q9U/llktpzCe6PqUGSbO5Qv5YmZ8PwBvgXoLkOoU8PK+NHUbWGVMTOvjsE
         yb6AVOORDvuCgPwqHWdZ4rrRMHirH1o6MkVaeIOgyhiy6ct99wtymTtsAqONP3HPj/OB
         tmDFr75LzatLvRsmmtkqT6x+3B6OxNgrV1SHzjoLCTodEXibHlMrIbVoY5oJPmS0mDDW
         jkGNkdhvgLoep5iTcejiCw9x/rt58Jx1beBfIvdvmOQbfFgK5zgQMvDb3zKkY0r4U6PV
         4ParbEXnQllrLdPwtLiRFm1Ptwu4apdS2DI82/07HLF+WoGo9Ex10w467boalFNopYbI
         esnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789011006; x=1789615806; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKMQeXyU6ts+i8KLdl+j8HVFtkABo1p2PRJLujgXu6A=;
        b=rndTuQcTR3/p6AQLnvqjbub4fh024UNfav+TVU8WF0N72b2LoT1bcT9udthf0DYUJP
         6fzQDj1dDCHnGjfdCNMAn7zG3SmHZW5S9hKF1rNsvQPyNAZiJTXADvCwBQm/Lrk0Gw7D
         VpayIdwDdwXvNXpQMmqbnKjyznyR1ZdU9UfYL1pWnBAjr/BoclxOgxwUYCEiauEqKgFh
         xXB5+hPQOvZBB1ZYUIudMlqOS1B7f7hv1iaKEMofr0kvwGAn2wbfXx+oscyTJSiqrSfx
         py0TPYZ2MJ9z6A7Z7U9LxhUwshwKJYP+GWNp1wJQPol9tZiPTtmyNbuy/eLWh4vtGG5x
         LkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011006; x=1789615806;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hKMQeXyU6ts+i8KLdl+j8HVFtkABo1p2PRJLujgXu6A=;
        b=LYkJJB8VwpyET/cBtv8ebqYgjrSVL0eIdKUnVyl41BrAQpVPBSqo2XkWP9s7DSm8+b
         H8LNhCbHpLtX3/x0SVhnfjX9oXEzM4uY3CiAiz963TO/vr1eVPjvlMOeOMq9laH45ZPs
         3v2DoQLvmEO6gl8/cRlvmie4SJ+8BdEt65CRyuxj0pkBq8pp3mjlknr9VpVm+CE8MzXE
         XwXmaQHFOU0YdfIGp8EB/1mBvXObXBN5f+QNAzfSyAjAhPrxqXno13HhwXnkQwhImCuE
         LSLy8jL5ywOMGX8aKQ9jAXYrSBy/EiVqCTLyovLWXGK39BDkW337JGy8TtrC5t5PGjuD
         Eizw==
X-Forwarded-Encrypted: i=1; AKwUvBwYuzKSzaCkhLFNxbifvphOGMtuyQIQw2PzZAnSWGlwJCZchvHPZ7mqvhJSdfxs9eHKt5ICXCF4j/3iDpw=@vger.kernel.org
X-Gm-Message-State: AFuF++nAZ7KFvqHWuhlIEjF4m2RCiU4AGJUD5G1zm4lgmKBSc7sKIAKz
	CupT6CcL9tvHBlkqqAe58VGfh0ksINOZyb1QlNmm0j0QawJ/0Fym5c1iz+MDmndty1J+iYkOYJV
	/zhwxkdm5jvvt66RCuYauLWII2+RWVMHuCaeEdT4=
X-Gm-Gg: AYBFou34bjiLVeQ52VGGYqJf/OQa7GrDDxYuWF/CkDa97MS4CP8dIzSzZycE6Jh1Bhc
	/1AZQs1zV+/89+TYIS76PbhI1YKxzKq8zLlrVW6XLbZhHaR4YD0FaphQCXmd/2CPbg3oXLTizJJ
	7zB1A2GqvbP7nWtyEILm6MNHRQN+Z5XSwXcGBaBJbnmEPLZVLJ1bxdBnn3kuP/h59Mr8uU4jXMZ
	mcj8C6ktUCjWc3O+FEdQynkXJ/oZiiXsh7uD4I8IHI7vbB3aEAjd0hPG5w1M4j2qiT4UN1gfaD8
	YcUg5xPWgzB9/uNUimDDs9XYgFkM/urPCoUyCYvysz8kCIVQVSAv3LlFu+UdmILP1ne2Cs93Xp4
	4Do3d0+Y1Mj2XSOhpK5m2quVIG/dkONg7MGVuDd/6yQ==
X-Received: by 2002:a05:6512:ba3:b0:5b0:137f:9476 with SMTP id
 2adb3069b0e04-5b616f324cfmr8459587e87.16.1789011005505; Wed, 09 Sep 2026
 20:30:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909013401.14408-3-sigefriedhyy@gmail.com> <178900489382.219967.10423938088246016510@kernel.org>
In-Reply-To: <178900489382.219967.10423938088246016510@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Thu, 10 Sep 2026 12:29:52 +0900
X-Gm-Features: AcwNN1W3iAVVXhnzuL3KuPFsuIhRBn-XyXWkWtewcmOJpG0IlXnw0mTZipXuuMo
Message-ID: <CA+7S2vKWh=ERReF73qhw3Tzz4uxJyjxded6MEvjSzkq6yP33Hw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/3] netlink: specs: rt-addr: document
 AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> should it also mention that an AF_UNSPEC dump does not include the
> AF_PACKET entries?

AF_UNSPEC dump returns -EOPNOTSUPP now, there is no PF_UNSPEC handler
for RTM_GETMULTICAST, so nothing is silently left out. I'll say that
ifa-family must be set in v4.
