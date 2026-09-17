Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D226488DAF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642212; cv=none; b=gd3/+RAEoXznQ9zWFQr2EayTvINACSr/Jp8PzAT3ldezBjZu8VCbCoD2/Etvq9WzXYxZIJqDsYhDBXuaBwi0QIjwMYPxDh9nABEyKk6X4pbuDATZAf/LWqdE3OSjz+5vfeacebIW2bXuU2QlOqffuDdmt87WkcDcgw5UdDcoOI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642212; c=relaxed/simple;
	bh=UHOcNkPGfB8EAR0NhglB6gRUnw1qA1vWRCJ3LBgC4PI=;
	h=MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:From:
	 To:Cc:Content-Type; b=pC2aMJtIUldTWSs8+VEVoCUghtSdodh4bgCONIxkuyiliytKM3FGr11hpYNN7G0PqHOqh2ksq+zjyWJBtn+1H23YNJP92owL1HLtt7R+ubJoWMcApCwJ7iwr+k6Q6x50+Upd2qG3anpOC/MuejS4dNb/sgsaMne6VIpl/G1kkq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GCn+rk9n; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GCn+rk9n"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a74698972so998350b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789642205; x=1790247005; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UHOcNkPGfB8EAR0NhglB6gRUnw1qA1vWRCJ3LBgC4PI=;
        b=GCn+rk9nypvxX0kkdJz9PC5hWG0wsBDInAZb/WQNnI/qaVIarpQNKEKx4+KcTVchvu
         xYDjaOafS6ATGnAx1ToTR7I0Cnje2G5gLIkiS8Bgh0SgPP5ojBc6W18+7i9NTwFveycU
         V/uTez7QD2zvDTQVysz4J5SVyVDLecxknYTx+YA2dQPqVjHhUnrYkpQWlz8ATfKXhzvk
         E34Pp7bu0YnBTmlXHrgI/fTVVVsWv9vfsbQVvxdYeRz2tYuSov3H99wZgdUe+1CfvQSR
         cmHczhqYufx6E1AZdLB9R7gLCSMegmfY6tC8k6GVkewYX2RlShJ3aW9jsXb1CH7cgG8h
         unsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642205; x=1790247005;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHOcNkPGfB8EAR0NhglB6gRUnw1qA1vWRCJ3LBgC4PI=;
        b=ax1SNsYJ3tucUV2XPW6G09p19YeBoKLsv30t2hjpRgj6qqlu2nUaKGL8fTnMA9Fu0m
         fKYIY1SnpM9E4hOW8amcq7knPG9K8psoSwfHBagT++Ma3lVxXaF0ZngWON8stqo3qZgH
         865G3UkIpOMFaptA86VsyjuQ1w7tpvaC8jJ71ZwnGVDFcaCw1A/Dce7e6Rs8H3jtLktV
         kFl5Hk/nqowXpznWOF1qOACqq4PFjLwoNyQCE0NJ3CnCfcfFzbTlZ0xP9nlTfkvp/4nj
         cDoio/d0XXQAHxKj2qG5yyjwjQq5Mnz55WmorXgA+9Zd6czlbcYDM/uq6j678Wz7/EJq
         8djg==
X-Forwarded-Encrypted: i=1; AKwUvBzHT92qylJDVqKB/R5xMcDAiBV2Q+uoDcFig1ZBC7wgNa3T6Crw235ZKbReqsguxW/1GWSYnunosbA2Aaw=@vger.kernel.org
X-Gm-Message-State: AFuF++lm2O+xu4aRJgPK7iBrIQYGTjRMFrBq/UnsAIArMB6MR+2xcJP0
	21DPObdMDDq23RSs5zPUhrTUVh50HhAjZBTuEyRc7UmkpjJ+Vs25wQXun7tm/i1QpnEPTvL1SGT
	es41SnFqUyweon7kkoPw1OQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: from pfwy15.prod.google.com ([2002:a05:6a00:1c8f:b0:84a:2e0d:e14f])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a112:b0:84c:5b65:ef86 with SMTP id d2e1a72fcca58-87238f87793mr11300575b3a.17.1789642204572;
 Thu, 17 Sep 2026 03:50:04 -0700 (PDT)
In-Reply-To: <B6ED6CADE807138B+422dda6a-301a-4bd1-befd-b932ea9f46e0@radxa.com>
References: <20260910-kioxia-ufs4-fix-v1-1-ac796423057a@radxa.com>
 <CAE14pddvwycWnGNd_VNTzphsDTk+XbYwf6BDFkBnQFaw9hm7+w@mail.gmail.com> <B6ED6CADE807138B+422dda6a-301a-4bd1-befd-b932ea9f46e0@radxa.com>
Message-ID: <18d6161a62d5c156.3137322e31362e3131332e313435.3fb066.0000sendgmr@google.com>
Date: Thu, 17 Sep 2026 10:50:04 +0000
Subject: Re: [PATCH] scsi: ufs: core: Disable timestamp for Kioxia THGJFJT2T85BAT0A
From: Stanley Jhu <stanleyjhu@google.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

On 9/15/26 10:58 PM, Xilin Wu wrote:
> Thanks for the series. It does make the error disappear.

Thank you very much for taking the time to verify the runtime detection
series on actual Kioxia hardware!

With your confirmation that generic QUERY_RESULT_INVALID_IDN (0xFD)
handling resolves the error without a quirk entry, may I include your
tag:

Tested-by: Xilin Wu <sophon@radxa.com>

when posting v2 of the generic series?

I will leave it to you and Martin whether to still take this Kioxia
quirk (for instance, if a one-line quirk is preferred for stable
backports) or go directly with the generic runtime detection.

Thanks again,
Stanley
