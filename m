Received: from mail-pz2-f18.google.com (mail-pz2-f18.google.com [74.125.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661F9331EA8
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789248237; cv=pass; b=NO5d2rTnNhK6n3w3DN8tP2eRR6qbSp3gHgIMhLSYcv4Me1RMyYL4WMOebGlY4+pkxIorShxT04rdJimOtAfJI6A4KxjzjlXngsn0wCuhVCV/V5+6DzZDY079SyA7k5Zd+V2T3U8EK2NrdKkfL0DOMdgl2swtxuNfvYVcIDrlnUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789248237; c=relaxed/simple;
	bh=WgOhOFRovPEhiNXwXYyCOoiGvkZktGuhM4mSLhTmPvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VcNmOXdRuVa5a+UTs5ezv26oSjiRZNzEQbWa/gBLyAuSf63phtthxard1ePfoI+BMwYiasGagEcxB3p6qXkcBNYzRBiQOVIKJ9R8bUk18Oy3iseKRZ5XF/r35rmIJBYaU+L3eywQlNqzqBSYokBPGvor0TLETkiGB5SkEJt256w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPSwaE9t; arc=pass smtp.client-ip=74.125.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPSwaE9t"
Received: by mail-pz2-f18.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso1053864a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789248236; cv=none;
        d=google.com; s=arc-20260327;
        b=jvBVnfceMiRdWVjn5rbELdus52srVnHTfKtDmDSAlYiqUYSOLIQDKjXS/GgttKAT9k
         OXACGuLeRltezzEmtugcmfRBm2+6tqiZ0vUmHxlc3aiHW3/Ny9B+0IeZyiMukODkwtRR
         wVTAL1kknqEddXDb1dKCZtZXNy/6o8nj98EnpJSi7iDWSY/i6PFzmDZifKr2S9Fh4lm+
         Wyj52o6m/H0nefkVwNNewgdwHYlobrJ+XWQsWJ6gtT6KgMXaHuuJ+IdmQ4YxwhJAf/26
         JKZUyhDWU/A3CgX8cliDhdjUOmzCqMJPmoN1/ebcUuDvvDS0I7r1v5xccO8yYVqAgkfh
         A0yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9vB62gwH0/QPgCAfrE86myNtpwICD7qvpc93MXHR/ew=;
        fh=gajWtzW2gZtpgwWUZvpgVxGDcpWgpkuToesfbdPOti0=;
        b=TL87OqhCukavwMz6HKcJ7duzr5MAu6wJpSj1PRjwyVqJOKu5F549VG8Xe5K3FMFfyf
         PUkjDTT0ZuZBGVjoTeim5CXiGbdwuLZ/LgRHuzI7ILKWVcGeW0erXB/3XwDNGwVXSeLc
         5LHjI9P20cjPfsI3vTtoIL+iFkmFYUohdBOMShDlttZltlL4NiZ2RUX866MBAZtWwAbK
         dgslBZjUfLOc2telMnviOIpqhpqPGxDrRy9IKtcVqMD7NBd8SPzZpmRVqs0D/K6NsyRK
         v3wjVHsQeTmrlC4yM7cs56yxV7Eo2CZlMOjao2PJybJ7bfaAj2Wm9AmtCNG+J23NuTUg
         /wBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789248236; x=1789853036; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9vB62gwH0/QPgCAfrE86myNtpwICD7qvpc93MXHR/ew=;
        b=PPSwaE9tSksV0o11nqvRLjNaioccWhmgfGjY5pjaDsYkn26OQHHDjIxPBYLtQVs4SI
         IQDs+UAP6KY/ElD9A+uv1AWDYx3YNnDA+iQfJqAGqmUrcvgsT1yNmL9le7nVcA1hvdvA
         ExfxKNUy+2bIBYPswbAcAb2whvmJPbGTpN0n1CKkJAQFAa2h3KehrcYpXOyxz76a5l7r
         kd0QdXJhE2qXmbniOwNpFYw5PzAvn2TyHoXRv/ptwcz/qqeMfGWg43UZ5v5WZLIbsEoc
         l48/rs0XJs+JeVYB0ExAB8DGSkRlZ5D9hSnK7D1r0JpBh4Oc2ecsyW2ujFSwYJjxIQdQ
         ISUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789248236; x=1789853036;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9vB62gwH0/QPgCAfrE86myNtpwICD7qvpc93MXHR/ew=;
        b=YhpONUVitOMTCYwrGRb6iyGYJuGeLLZF6gQr7FYEqBy0NlNqxjR6jLp2QYJYaA1xX1
         cA15bBhY2pGBHF28HRni61Jjv3lm1bhUxBZIFTqZXdLGNZnoMCPgCMfQPlChfkKKWHo/
         C++yWJTlSHqkc6HJ6rd7VqMpXrSdLIYtFIJUGOZdiTDjX/Wc+DD2Y/xp2Rr6xou/au+j
         Qcy3OZJjY/CPZXQtALMyKN49FNs5R60wAoUJafxWoceY1t4saB7KN1eBM62tYYQ13MZM
         AnRKDr95TolZnjaCE7IquCXZqbZ2mTI9LZz4gvyy0f+O6RMm7IvMWMNGE7YEx1OfMXUb
         IOMg==
X-Forwarded-Encrypted: i=1; AKwUvBzX/Y4Q3ZwoLb9kWTfTZOt5iQHIU++u7QEf/b2shlqIT7kkYNLQmnaszmwjOZMyIHKIWv1jbrzsD0OtZlg=@vger.kernel.org
X-Gm-Message-State: AFuF++nFp5I3KQy+LEBHN3+eEqwp+P88C/ko9oJfUKCI51la8V0mC/NX
	PrC92UvHk6KBYKnNQKZhmefRLAAogg+YfxeRU1n4I/T+oZMNqxe76S/UIvULNotPs4u7ogCM0lZ
	dP6HMNobzYONZWnTFY1sza+xpZkAS7b4=
X-Gm-Gg: AYBFou0r5xPzIML9cn69M/X3QvyM2Vbv5X+AGmhPLbiISkVOca1ApkQoqDLRVl1d7qo
	FUvfy+/BB9rxoXfcMw5csc1Vs4HxoNVsuJG+pE/9O5NEY4nYy5nn59S39hFS1niZPaPV/0Jrcrk
	dqeUP75cwsvFgBhjeq1b0CQS4zQHIV5jxaeTLi+QynzqsUz5KfrpIJz5BxLRbl4Ydx7KwXhzlBQ
	U/VQkNmj3K9hRVqilDyoFvrrMEDWI7BceigvGsX4Oo4DjwNQvOQX/1plIEYX3YoJ5XHzRGOTO9G
	TDd/GbE2Zk/dGvbf8gX02BsEKAAcu2DKM5HAvirCg0od86B+FLs7HDxyREkQagIivXz1xrr8/mx
	SfxEwqdhI13FbiA==
X-Received: by 2002:a05:6a21:600c:b0:3d0:9164:98a7 with SMTP id
 adf61e73a8af0-3daed1a4911mr18953244637.11.1789248235623; Sat, 12 Sep 2026
 14:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910124403.95741-1-7israr.work@gmail.com> <aqKzBTM-CdBqQzXi@stanley.mountain>
 <CAGKr8w2e4YGF41X5mv5Mf2FDvoezpzeKmFMKaHKf43eypCKdFg@mail.gmail.com>
 <aqVSfA_Ns_plwCpK@stanley.mountain> <CAGKr8w2TSt0z2K5JDKViHVMf3fGpDtNEwqhedR10JoiXLB=MUw@mail.gmail.com>
In-Reply-To: <CAGKr8w2TSt0z2K5JDKViHVMf3fGpDtNEwqhedR10JoiXLB=MUw@mail.gmail.com>
From: Muhammad Israr <7israr.work@gmail.com>
Date: Sun, 13 Sep 2026 02:23:44 +0500
X-Gm-Features: AcwNN1XlHNmzcFazDP31zU94RhifNoUfTsEaJFMHZRfDYP5lRNqMTjTujOs1sNw
Message-ID: <CAGKr8w30ZfgS6M0UteVO9HYcRCpbkg+4PgNE7DGpUtbxjyLjhg@mail.gmail.com>
Subject: Re: [PATCH] staging: most: video: add comments to mutex and spinlock definitions
To: Dan Carpenter <error27@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 13, 2026 at 01:09:00AM +0000, Dan Carpenter wrote:
> [previous]

One thing before i go further is that the changes i am proposing i
can't test it
on a real MOST hardware as i don't have it i can only do a compile
test  and i also did used LLM assistance in understanding
code especially where the race problem happens so according to greg
LLM policy i can't submit this is formal patch.

The possible according me will be use another read->lock:

static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
     size_t count, loff_t *pos)
{
...
mutex_lock(&mdev->read_lock);
...
while (count > 0) {
spin_lock_irq(&mdev->list_lock);
if (list_empty(&mdev->pending_mbos)) {
spin_unlock_irq(&mdev->list_lock);
break;
}
mbo = get_top_mbo(mdev);
list_del(&mbo->list);
spin_unlock_irq(&mdev->list_lock);
...
}
mutex_unlock(&mdev->read_lock);

}

If either of you want to take the read_lock approach
forward yourselves, you're welcome to otherwise I'll keep
working on staging drivers I can actually test on real hardware.

thanks

regards,
Muhammad Israr
