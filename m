Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3F74D1797
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603568; cv=none; b=hM8XLekCnOuQZ9CsA/sOBognPJ3WPDVgqEeRZ6K91MQNq94fUuRxKQqzqTx+G+wRduxro++CFnvN+KY2YcfUgtMysg1B2faWAjrFxoNE8oFX3Nc/atcDgy60koe0tHIQA9kreuAeFVBHERxDgEC5aj+hY8q3Eeqef32GypZc9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603568; c=relaxed/simple;
	bh=xDWN1yu0fuk+0avinIpkMwbDoJFHqL0/a2WlbWba9EI=;
	h=MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:From:
	 To:Cc:Content-Type; b=THJ0iMNJzAlSLz1gXmXQ4enFnRBTgDtDgWKjzfw1YdPX6CZ37fkvQCxtdtZLarrKUWnpkcMi0jEbKrQMqBgnf/4XYQ8hbxE0hs4VfPQnhzZbygFglUYVMiyhSSTp0+9pIGivPNA9gPB/oCi+seN7iJ2v/bKZ4Fpq2o9iRa+fx2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FCo3NaTK; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FCo3NaTK"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d55d8cd938so51140845ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790603566; x=1791208366; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xDWN1yu0fuk+0avinIpkMwbDoJFHqL0/a2WlbWba9EI=;
        b=FCo3NaTK7ZrXgWEXnZ7RIhhWhHvN308KwrexgTLvaWR/4QdUtxpjd/SUMdid89Wk64
         HwxtaHfBVAWr8aAonZzgfLBlxUqBqbg25RPkbE4Zb9lX7QE5e3miYPHzayBEVQ4qjgq3
         pKFvdKZnGJa17sN8+sbr0NjaLlbCBAj8kkyZezC+EolA9nz73j2CFuJBG7aiog6Vjk2T
         AlurFpdp0YsKR1+eFGoQoFGUqxFwpgDDGUhwxLDVPZ3RcVrBVjpTiqtQlh1VlDybcDev
         tjOKAzgXVl+EkOA1M8EzOTeOtJEV95NJ+42H2lqsWDHAfee4va5OwZ1gPsqcqvbM/0tl
         EEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603566; x=1791208366;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDWN1yu0fuk+0avinIpkMwbDoJFHqL0/a2WlbWba9EI=;
        b=JFloGzDaU4TDAD0nHCgBNMmwtN06wc2jFvpPayggN6kkk4vhBenlck+iyFqb6ve32L
         IOrKLAK3GcfjM5O90X9zpguIQUIi5QG2RyVE8wmdU+jP+y1vYMIhD0eDs0lQoYsCVWQz
         WLQf9HBozXk/3lEVimtxVE9uF2m+IBFs1PYkkUmhp1hpd08zKk+DdtKYN/j1jJnwZ3UA
         BDK6+RJwGQRgHt4bilS+G2STVIh3KPcl0zQ0jYUJxW48e3bPLh5Mtriedl0YXYaTnS77
         yp3l+lRa69RTpQeyUeY2cAng7y7hG3uv/4RQ7QMzKs3ZqAeUB5V0AaFOMFJk5HlgYiU5
         tb7g==
X-Forwarded-Encrypted: i=1; AKwUvBweZDVXIAooTrNnyrza3AI8nk6Xit0Nx3b4Nb+adJt4AL6KdM6gW8IkH6B9x5ox7mfmMypqbcyVn/KWq1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb/4DnOYZX9oTWmsuZIaIIrjUfEzeRSf8SvhFMMOondUiqDBRy
	zgbkMzAawGWr1J+OujJhl3Ulfnhjf9ME9EAsGa215/gK8/4fkFozfrk4YPUcoeMDkGQd8EjFTyN
	G0v/Eb7SBi6kX6yHAgBZaVQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: from plcx17.prod.google.com ([2002:a17:903:d1:b0:2db:60a3:afae])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f2ce:b0:2df:8d19:4fda with SMTP id d9443c01a7336-2df94b92c9fmr54878645ad.36.1790603565973;
 Mon, 28 Sep 2026 06:52:45 -0700 (PDT)
In-Reply-To: <20260914144910.931518-1-stanleyjhu@google.com>
References: <20260914144910.931518-1-stanleyjhu@google.com>
Message-ID: <18d98074c73f90db.3137322e31362e3131332e313435.266ebc.0000sendgmr@google.com>
Date: Mon, 28 Sep 2026 13:52:46 +0000
Subject: Re: [PATCH v5 0/3] rpmb: Fix request serialisation and teardown races
From: Stanley Jhu <stanleyjhu@google.com>
To: jenswi@kernel.org, Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: mkp@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de, 
	bvanassche@acm.org, avri.altman@sandisk.com, alim.akhtar@samsung.com, 
	beanhuo@micron.com, can.guo@oss.qualcomm.com, ulfh@kernel.org, 
	linusw@kernel.org, shyamsaini@linux.microsoft.com, alex.bennee@linaro.org, 
	James.Bottomley@hansenpartnership.com, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Hi Jens,

Gentle ping on this series. All three patches carry Bean's
Reviewed-by.

1/3 touches drivers/misc/rpmb-core.c and 2/3-3/3 depend on it. Are
you OK with Martin taking the whole series through the SCSI tree, or
would you prefer to pick up 1/3 yourself?

Thanks,
Stanley
