Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4EE38DD3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023779; cv=none; b=Y2KwP5JRDoQEK5WE+PRT7CC0XXMG3n86KP4a3bKLCUdnEzZPpS5WQ3PTcdLj/vhf5p335Rfxo/xKv+OAnGb5hhEHcScG9QiWTqvsQcQxcovZAogTnLauuuhg9rEK/xZdsHfDasHzmraeADtzzvl8cckCSnV2ifRcCVlfncosaGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023779; c=relaxed/simple;
	bh=h4wRsX25ceVN5wBSWT2Q/1GU750aNS0TrYEHFDgduhw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ttylI6FhHtO8L+gIi+YwKkp+/CjFtskoNqSmnCUbzh+SJ+ap1lV2n2bbRnBSsZszuFwGhiTKH3CeATV3BhF60fqHBGsE00oc1RPo/MAXvXtjtCcDRwUgAXXOFySbZqYVOZYxuSgUo6WdT627YMX+q2rMJPQNC+YwZaCuuyHYFAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EDvuDtYs; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EDvuDtYs"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-887faaedb46so1459623b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792023777; x=1792628577; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4wRsX25ceVN5wBSWT2Q/1GU750aNS0TrYEHFDgduhw=;
        b=EDvuDtYsQKAVFBrsvlfcNveaO7ZLeDvh0o90Kr9ns7dKBt2Y9a9xa1/t3zH0+nnwuX
         p/XPxLHfYmqRTC2kr5Z+9Ofb/ajv89ETGVc2wobY8Q4XvRRcg33Wcb+rjzRN78eJjTA8
         ubvioEime8ffSLeS47HBPULb6K4g+WSQd1qB+jxXHB2gE0irAIMScTFqBk9YIASPV+ip
         q/z1jZkFDkTDCoR/g6EpDyXlYeSF98Aa82tzvYpKMsrXo2Zj+WLgtINkTNOg/9i2LDzd
         E8Lg3EUofB9IDpvbs3Q604jA9iqkDsPDvS/FXuttjKUWUXAILEItoSh6pQk5KBHGFQ9R
         sC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792023777; x=1792628577;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4wRsX25ceVN5wBSWT2Q/1GU750aNS0TrYEHFDgduhw=;
        b=j8FYpR1fVXPba342hajGGCbnGw1buYuMTKxIaLPJnulYuYF5Rw0/cIE+lqdpcFkdYJ
         xIfXYs1KFYtPULKv/DLDCundNU1z8qfelpVXat3OQ/LhClxam+7eq3Ed9nrDIGxOjfDq
         lWC+10RXZLf/YcMolYgRx4EpROr8DrigV1oSYR97HQrF1s/5DCydqpOz9ikOioN9yHkk
         BB2uZHnAcDj8UtcCC2ZZOCULgGN00ylnE7et+uXOsm8qBuE+D6eKAeiBeXq0OWmK+7+z
         GOG5Pl5wujGhfqvhUmKW72icWx+X7V/CJqIBOPLNv8kWSyBNPtMz99R3MxcrDBTWt7/y
         AoZA==
X-Forwarded-Encrypted: i=1; AKwUvBzT08Q99Hrzzplds3qUhoRSNj/ggnZ4GtuqpyjSAA4+aXtTKdPIEoESE50HwzvqO0jxT3cKPHp+PJcP7+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY3KDTZOqd6qUgzc//+z3RN4qExPkC1+Rw57ZxHEHJLwjGhOIp
	n4txDF2POga0SO0vr2fzaE8Vej0Yp+7v6GGKLmenG5kRi1FgJuS/t/2VruzNn0UXjThllSedqgA
	azWyN7QaYHK2qUxOPM2V9Rg==
X-Received: from pfbic14.prod.google.com ([2002:a05:6a00:8a0e:b0:899:1f5b:5265])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4652:b0:888:2b10:e26b with SMTP id d2e1a72fcca58-897c6e1cefcmr14526635b3a.18.1792023777107;
 Wed, 14 Oct 2026 17:22:57 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:22:55 +0800
In-Reply-To: <e3706904-3b53-41bf-b8c0-48ac4d2e2cf5@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <e3706904-3b53-41bf-b8c0-48ac4d2e2cf5@acm.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261015002255.3458767-1-stanleyjhu@google.com>
Subject: Re: [PATCH 2/3] scsi: ufs: bsg: Clear the UIC result byte before
 sending UIC commands
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>, "Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Brian Kao <powenkao@google.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/14/26 6:30 AM, Bart Van Assche wrote:
> Shouldn't invalid inputs be rejected rather than trying to correct these?

Agreed. v2 rejects a non-zero result byte with -EINVAL:
https://lore.kernel.org/all/20261015001855.3450573-5-stanleyjhu@google.com/
