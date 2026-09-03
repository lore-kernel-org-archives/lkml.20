Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5263F270EC3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467063; cv=none; b=Wy7NwwZGMPV0fbkmI1fMYZ166aZxFTh9L9h54kdr7PIi4b365pHNCC6/7/gQNq2eC5JwMYmgJiK/grRjL1eIWd/NF0AlcyAPvGlokzfBujFrxUMwjc2Bq099sFYTuEkukcBLhHx42fNge+jNmU/WDB+83HyWtGyhDMwbyAVQhkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467063; c=relaxed/simple;
	bh=lovyBWo4HbHG9IAJc1682HSdnTeu5LyLU45uKHLvmeE=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=fv4fOTbwsZouTQbkP8bgMmIpCBx+Tej1ugAJe2lJdZBpMjtNAspc/ajLSG/jlYlpM4qb+7j8bC4xDr0C4UC9fNiF9YkitPLrIONdy39rsrSuKOIiSdYTOry0xkIxEXDRSEoTRxcevxCUEf0APPlTg+Dcq8iO1aVvtZOBiEjRWCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=AdSsSsoN; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="AdSsSsoN"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5276d598b96so3580091cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788467045; x=1789071845; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8uOzk5kbNElpXD3JZXWiXWL8uLf97nPgxHodv2izOs=;
        b=AdSsSsoNkR8xZ86VkSDiP/2Hb8TXf2szTrC7SOhbCflatvm+ErE3ngJLYkfJQgmkoJ
         hHXhA14Oy796z0v4bq+KENmudoQ7O8YMHdyFx/g8NbphhGTy2h3/CNEuehe1UvSr8nL2
         ckrcxWV6zC/QS/qcQ8XrJ4uJ4JVFhyvxxocxh2uHPSll4i2jCxVEKGenz0zFp+z9Adlt
         /gp9WXivzjSo6CtxgpguO/HRBXrumfEZlMpXHvoBJR+v835Ze4FN5J2CLLSDvuU1EkoM
         WTb6UgBRnsbZiWJ6XBfrS3XPxZ7VwLlEf4n4tHR+Dbjehs9xilepDZKYJmyVzDBrPL4o
         klmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467045; x=1789071845;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B8uOzk5kbNElpXD3JZXWiXWL8uLf97nPgxHodv2izOs=;
        b=FWAPyGxtshNW2/Kx+9MeDoPwrU0zAYKTcQky9kvVOcRi50FiYJgcp7aKfAStTAutNP
         Gb3cd6kY/ixwOuFHAply+BzlcplDhiVGESxqt6wECz+1hOecHjEnw8zXH7uIWNg6Vrz1
         MaLzeE9KGBP9/nu8/jgi1ckB7Seg1iDnNtUODW66S5S4bTPxxum+1Xi9NExMduFYBWUP
         uu+sScQ1TNR9jESkzD6Dtw1PcAeFWzanFwOmq9L8bNu3oq+AccL8aOXnAa0cKuhAjMOb
         fAkQNedTv9uMYgRxvcLDGOqGOFj0b3OWCzbz47j1WWv10uesMdIHZA0WFZcKuJb+cEY/
         /qtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQNPxjQP9xMmYikUBAwIl7D5hgY95D2/a3MubcAvFcpDwtohPnFmTPFmi2zYbKDRVy9zCbwWIODAWncWM=@vger.kernel.org
X-Gm-Message-State: AFuF++mwOzpL8HXtd2Gn0c7iFrZ2frendYkfHYAFxWeSbjnR5vhdsM77
	k+mwScqb58mkHRMrrsRZoQ32MUn3JzU8gDCT7tIEEFhHgQkVYCQNSZLzO7cVPF9DEw==
X-Gm-Gg: AYBFou0hPHaQwJPtcwEsBfFTLzYDbHfRz/bz+lQwX5t98x38mw66XuxRtyP2uiXV+qf
	2l/Dwu2k5enuC18C0usT/I1nLWKSNpY/LMA4HHBDwCfUtXFDp3b9Kx7UU2yFBFRjxjePMogxbLl
	frjh7qDwPAKh65GLw6PIHr/eQIvHv7aZaMJq1zDZlLGcdsoV/+eP4ZjEeX+iaBcJZ/jU7vAX3ov
	nhEFVG9+CwTLv90CY+Wld8TZ8RHw9S9KirpTBlJHSt4QvDG3YT2uoiptOyrKCLkHTv15Sb3ApNE
	AWNrtZyvnEQVYabXDio4k4I/RbHncMS3vS4SiNFbmhIsxrQV85oM7JegVjt0AZq0gG0Q1XppNQK
	sHFt2deVp5OQ7sRwMWkHQrALeAMcTN0pJZbNIGh0zk/RvMRJHW4huyymrNelB7vEnfmsi73B+I9
	XulZFWsMAyWa+4Hp7jmUX+kY0zbEvQLnydMz6lPSDkeXZqMlfkVUeIoDi4BdKvZKrMgtqndAWET
	juROQU5dLD3VqV4rm4ygAQpm4SdXRO/rQ==
X-Received: by 2002:a05:622a:114:b0:530:42e5:f3a9 with SMTP id d75a77b69052e-53054a10750mr15915981cf.44.1788467044885;
        Thu, 03 Sep 2026 13:24:04 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406871b6sm3176156d6.32.2026.09.03.13.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:24:04 -0700 (PDT)
Date: Thu, 03 Sep 2026 16:24:03 -0400
Message-ID: <763ef0523ed8e2e25ef5b902e21b0c53@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260903_1622/pstg-lib:20260903_1620/pstg-pwork:20260903_1622
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Ondrej=20Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS, mailmap: update email address for Ondrej  Mosnáček
References: <20260903155615.516010-1-omosnacek@gmail.com>
In-Reply-To: <20260903155615.516010-1-omosnacek@gmail.com>

On Sep  3, 2026 =?UTF-8?q?Ondrej=20Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com> wrote:
> 
> I'm going to use my personal email for kernel contributions from now on.
> Update MAINTAINERS and .mailmap to reflect this.
> 
> Also switch to use proper spelling with diacritics, since I normally use
> the full Unicode name with my personal email address. I'm leaving
> in-code occurences unchanged though, as that would be just unnecessary
> churn.
> 
> Link: https://lore.kernel.org/lkml/CAFqZXNvOGbzy8-ZnJtKi94jfu2H173Tz7VYpK8KuseMQS-9tNA@mail.gmail.com/
> Signed-off-by: Ondrej Mosnáček <omosnacek@gmail.com>
> ---
> Hoping for this to get picked up via the SELinux tree, since the main
> change is in the SELinux MAINTAINERS entry.
> 
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Merged to selinux/stable-7.3 and will be sent to Linus shortly.

--
paul-moore.com
