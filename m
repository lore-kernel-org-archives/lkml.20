Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870C4BD10C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865023; cv=pass; b=tnODRlTYxiXMyJu65CeM0Ion68Mf8N8hiDbiFgcyWf6MmajzXiyoOkBw0HgyqrOO9lZtgedSVRNZu/fSop8mIpG9oczaVQc9mNabkt5Ze6dezi31QuNit13fgmt8wo1etifeUDZeVY6EWpwSimgGs2R8mU1JMlkVrJW1V6QSwws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865023; c=relaxed/simple;
	bh=V8PNUIhnuSxMXu7bv/hFvQS8+NwLBC1vm1+K70T9sIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYRTZ9wO112aWQkveqMGSsy8ilujN8Jx+4yGG14C+gOShgg6DqRMLupeBxvgGAcKCH2YNbt34sgo5M7H231UNVPVDJ2NAerzLgqiDfDta+UvVhR2H3enU9KX1lGYu/jd7N0Lge8SicgILRdZqN/PkhcCPCH9LEBNGxEh9tj+/fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJrfD3ZR; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJrfD3ZR"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d8f265cbe6so34537665ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788865018; cv=none;
        d=google.com; s=arc-20260327;
        b=pnrLzXFiExuENbGM6xFhRi3kym3y/TF2WKZeB2HRg+soVIJB62Bqp+hUQeR2/e7hti
         gdZvccgtuaIn9XptJUe//5m8gCBr8+aU2lis+hx63EEre2TY5E28Yddl0IoTZ4m53g6o
         gRJOCrJc+yPK+dzBQx4MzBJUPTUY7Ous8P7wljxSLN2yKnzXFnKrkh7fTwKWCRBmoHof
         ppv7O+RLXbgUDTwsjHPDMKVtRrwfLdAgySkRG4vRVzbYKIy+U40GK6ghiIyPd5k9o/tY
         ER+cG1ajQtjJk1HAsRdAWi3329suPtHRwypD9bjJAvENrRpuxX8TKQIDxz8TIfBk5w+A
         Z+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j4pKWv8axLBCBa+7S9xcrFVMWNZcwuk2DrI/wzHOezE=;
        fh=JL+rCxKGqCxosdvCczQvneVE0STfyPKYyn/DVFdSc6g=;
        b=oKEjeBPyxMx02lvZOmSh+c0XOMj5M8OOnRp+a9zrDLxRS5Q4lDJOktE4YxDSMnK4nL
         irvqNsCW5wQRcZXG2JsLq+7gV+MJLzlQfQEPEoHxfExrYflvelEfHbHqrnTxJ810AG1/
         UKg4yk0p24aXlwaj5HkvH+6lUUYP9WcC6vvDR02H+LYlrMOmMBbuxaK0UGdKBUodJR+L
         QCQg7H14PyajdjS3xsT4zAI7t7vU0S5gd2TtDMJ3KNgTfksQpe6M7pRQ/bLGaon+8EKi
         eYpu1ELQwS9K2PXMpjRllzGCiXZmknPcO1ibzPdsA8kNA0ZowiEZUGBRwgeDFY44QwcD
         CPKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788865018; x=1789469818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j4pKWv8axLBCBa+7S9xcrFVMWNZcwuk2DrI/wzHOezE=;
        b=qJrfD3ZRYCitY6Rv54OkP5s8eOZ0Mya4DkRlrfXzr1FqMXG68PrnI2kpFOSfpTdgpH
         jHBVVPCtyfwz2nc+pAyakjca5sZH1bxNsn0fej5//XzH059w0Ra1BC4rMlhPnL7v66LL
         bEosRR3AZ2ueKBSxub9uNp+dvZIrUPJLmr2Ok1JnFkocp5XugHYkaNRVqw+7sD2TJWj0
         IT4sFK/PWVp4sakvccgVYAQnxCyYaHt6bK0rXmO+dq2GfspQWR1jEYZ4PdJ6ZPehKECg
         w9jU2FZnu7xFnjSgMv79aEgPEcaLIGSjYZ1GDpmiF5eFxwUL2u5c+DPikYNZC3rwMPKJ
         9epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865018; x=1789469818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4pKWv8axLBCBa+7S9xcrFVMWNZcwuk2DrI/wzHOezE=;
        b=rqKcH8v1Pc3CWlpJcvqD8BSys2PNlsfXjaKo5amY4oChrnZhxyAWDiWdQOK+x5YIM4
         MhqDcNPd9nlHXQ2065uRoUw5kFXrIJ/ekGBNn/V9JwP33RbJTz5niXQnRGK3TMsNRoSM
         CJJGvOVtxL6GrVYAqx18g5VeR4ailRUmqrd4etLyOCtrECb4fuHapPOJ3OIPhEvQ1xqF
         K6zP1Zs/9eUjLfskgOmf/vPFaJxCHSq2G8DeOEsV872bS1K6VhF0FP0kPpFGtpCGH1QP
         jkOici1iQqG6ZYRElzgDA6Ho7dZLyihJV/cjacDgmLqTBiKokRuM58e3XQ9HNc0dWnc+
         HzYA==
X-Forwarded-Encrypted: i=1; AKwUvBzPhb6jllaOP6omAmduLFwf6oA40x3RPyfBA5ioCJ2wtbqNyllY6b03/jqOB3eFN2OcDvpmeM3BQmDAvUU=@vger.kernel.org
X-Gm-Message-State: AFuF++kfuCxsFz8j00cG/k39d0w0JfGBaoO4yoyOusyXO/ZpINd3dosK
	i5XpMTGcRaTBeji00YKQVG7vJFjRuJRKBRu+oDoyIOEYVxzxUbpmzyRVl9gVjfFNbkb7oFaOOrh
	ywVi7lRvco+w/dtB35zs5wsS0/WJbiWE=
X-Gm-Gg: AYBFou3xw7BaoSDKn49G1lh4Qwe/xzxXBhgaC8VQMUNLtUDzayxzAZuroqPjrQlQtfU
	2I2qAZbGrQR/LoluanmCNkQMRCWgeO65hbz4WZLoauhl6ougvhNDez3Kfx/kX5JkRSKF1Ghdql1
	PLv6WRmmme89vzgpOiiVsaaNR/KHYnPN+kQ/i/uJYI7sYDM+at+RqEMHpTUy3IlO6neKvxutUg9
	IqlBTOwtfZlZMNJ+vuG07QZSp5Yt9QDqlEwtGtzB3dHi4iutBy4MKEXzb88eVureB8xJbIJEru8
	UHHNGBhStEgfLrjPQD/tDWcq3OuWrlWHRhiYhyTP6s3WNe5zXkOhtVo6vXT9EHnIXp35ZbXbr1F
	WxFuBTCfDJfT1C6x9saWErIQ3mStx5n85yYW6zRwosKmn5dKBsQ3tHVvW
X-Received: by 2002:a17:902:cf08:b0:2da:f8a5:afd8 with SMTP id
 d9443c01a7336-2db1220e898mr402860255ad.0.1788865017806; Tue, 08 Sep 2026
 03:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903102656.370039-1-phucduc.bui@gmail.com> <178882012336.219967.15894359577050376625@kernel.org>
In-Reply-To: <178882012336.219967.15894359577050376625@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 17:56:46 +0700
X-Gm-Features: AcwNN1Xbg2lp4fbc4ezWtbMEH7uw5gip40oD0YN2_nVZLMuXLhJFxllUnLeYZN0
Message-ID: <CAABR9nFG2Mk__ptdWrhkPTTmSpnL8keaHPGx-wz+kgck4EDFhQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: davicom: Propagate wakeup IRQ errors
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, paul@crapouillou.net, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> - [High] dm9000_probe() now aborts the whole probe when the *optional*
>   wakeup-IRQ setup fails.

I agree with the issues raised in the review.
Since request_irq() uses IRQF_SHARED and can fail, for example with -EBUSY,
I will address this in the next version by only propagating the
possible errors from
platform_get_irq_optional().

There will be no changes to the existing handling of request_irq() or
irq_set_irq_wake() failures.

> - [High] The newly added 'goto out' after a failing
>   irq_set_irq_wake(db->irq_wake, 1) is taken while=E2=80=A6
>

This issue will no longer occur if we keep the existing handling for
`irq_set_irq_wake()` failures.

> Pre-existing issues:
> - [High] The wakeup IRQ requested in dm9000_probe() is never released on
>   any path other than the newly added one either: the pre-existing later=
=E2=80=A6
> - [High] In dm9000_probe() the shared wakeup IRQ is requested (line 1521,
>   IRQF_SHARED, handler dm9000_wol_interrupt, dev_id =3D ndev) before=E2=
=80=A6
> - [Low] Documentation/devicetree/bindings/net/davicom,dm9000.yaml
>   restricts 'interrupts' to 'maxItems: 1' (and defines no interrupt-=E2=
=80=A6
>

These are pre-existing issues and are outside the scope of this patch.
I will leave them unchanged.
