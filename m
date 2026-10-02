Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F6437A498
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948526; cv=none; b=A9Ylh5ebygETQ4CGN+sxayVsGqKnQJE7YB279Z662AULmoZ19DtDNA+JoC88VV9cyVrdZ8W4/ZwAkgtFzTrY0oCDTmkjcB8N9uDBEF1BS0KyIrHwe55i/g0r5arZYJV/y4q4E4OX9KORoooPd5DMlaZaVg7M8H0KCzj/m9cXUYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948526; c=relaxed/simple;
	bh=nCj7k+RlGhMynfTUTNniwAkJyVgH4rVRVdW0dtjySgk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PMcLYRWPM4wy9Tb+IaK45XvPEAoUYEF8cwmlyq0ZNG6ymS4EhsrREsCeN4lYHnL8GR5+caEagjXm/zS9E7QOmQYjeeBoFehqkdTY69AuLQVgr2w/oqpktkoygB2N3Ilv7EJvbN2+AOj5lwrWgcxz5oUGWaASdWky60AJCwMRVwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i9uICV/0; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i9uICV/0"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-886129276ccso3692861b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790948522; x=1791553322; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCj7k+RlGhMynfTUTNniwAkJyVgH4rVRVdW0dtjySgk=;
        b=i9uICV/0FpTBIDWTMy4JJkADRMRamblmUK5c7wh2GQb9wFglmx1RI+49ZdVTcKLwqj
         SrTihhw/dRdJ1AzyHjMBZXHMW97VeKufFMNEydHwV9uVO09WvZqmKokHgpLvlgllk6DO
         lFMqhGOGWQM1pOCXA+ZbEfaLjCuxXjtqOU3Fk2SuzjNDuvLNLO1q7waA/doCDiuns38J
         putoOYrF3+drABQvEgP/rkkDnZxJqtAyeEV2d7DTz19I+sByPfbqy/oNFyWh/fS2uh71
         pWUkxqzp9xuA3o4tv5iXfO4ik0vbGXJJbz1LJsSrvsRBF8W08AnqUqeGo4t58VqKGxhr
         OCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790948522; x=1791553322;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCj7k+RlGhMynfTUTNniwAkJyVgH4rVRVdW0dtjySgk=;
        b=VZfSA35wkdB1a2uNCHbr1qtfY6ZRk+JESpxMIjqNxN3QkSB+BKoXBAEh8bZmphg7I6
         2+O44xHMt6QQhltHSkpYBKGQ6wvH0E0nWhRhyO6djmOncbOSN9FY+KzDmKGB9LUNzB0a
         r+Tl/MNTwUuuNInL5ztiFotaR8uFmhVU3O/zQn8amnZoy5l0xDqxwJArxxFZuj84NnTT
         cLKP2XPsNVszBdkrmciik67C/q8cVBwskr3wRcwIr0G/w/dr1DfMHcA0zqyYmJYnmZZX
         lvOCUnMQHIq9s5wbYX11hJTUwy4+0lRgLfM8CvpGYusM/2g2BOdvEhG07fE8ODfMfeoB
         Pg8w==
X-Forwarded-Encrypted: i=1; AKwUvBxfB1eNyCcgCo2VOzwCC16GHcOfXSy9e4j/gNR+F0WpHBAGoV2IOgNnJf0H+b2ZEZR0zB0Y65w1i8UgRXE=@vger.kernel.org
X-Gm-Message-State: AFuF++kqQz4KHboc8PE8Pb61pumTVwOnhWgrWifKSgkfj/otSEKW1hI/
	xTrk0wA1btSciLaPSKdHmgd2sTZWNa6PIgIJVVlpoVQCCEfdm3vhBmK23mJSiviXiDfDzK3I2sv
	6Z+QYkH+C6VfU0ExUR8XJrg==
X-Received: from pflr16.prod.google.com ([2002:aa7:9890:0:b0:87c:d84f:5ff5])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:148a:b0:886:53aa:f5e6 with SMTP id d2e1a72fcca58-88af476b162mr3069585b3a.12.1790948521260;
 Fri, 02 Oct 2026 06:42:01 -0700 (PDT)
Date: Fri,  2 Oct 2026 21:41:58 +0800
In-Reply-To: <2fbff86c-f276-4e46-b7d3-549461706d37@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930135947.2339918-1-stanleyjhu@google.com> <2fbff86c-f276-4e46-b7d3-549461706d37@acm.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261002134158.2844652-1-stanleyjhu@google.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Avri Altman as UFS reviewer
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>, Avri Altman <avri.altman@sandisk.com>
Cc: Stanley Jhu <stanleyjhu@google.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Bean Huo <beanhuo@iokpp.de>, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/2/26 6:31 AM, Bart Van Assche wrote:
> On 9/30/26 6:59 AM, Stanley Jhu wrote:
>> At Avri's request, remove him as a reviewer of the UFS host
>> controller driver. The listed wdc.com address also bounces.
> Did Avri request this? I haven't seen his request. Did I perhaps
> miss something?

It was off-list. I asked Avri on Sep 29 about updating the bouncing
wdc.com address, and he asked to be removed as a reviewer instead.

Avri, could you reply with your Acked-by?

Thanks,
Stanley
