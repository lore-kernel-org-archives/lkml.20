Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB243033E3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789096031; cv=pass; b=o6jLPf+H/5HWXeBErFerPcFZ2zde0rXdiehQ0rbrZ6qAgj5AM592AtgYbIkkw2/0co1QQTTinleLyDjWbCD/qXABvtKvk4xvF8P9OiPOLJ4ajae4dLiitdeN0nNiei+WWNoJAegSX/rYCiUkpOk9j9fXkrSyX9I5ACrU88bFPts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789096031; c=relaxed/simple;
	bh=7YpjTMZ2QI0IbVGmdUp2u8RAmsfuAu6AIfCkQhbsxOI=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSljXN+LsdOndUsQeOWGjF8do6m/fZ7yUWBSQvElFzmvxEY/muLB8S32s7/qt5ToDnxrfYK4pECjOkq9CiIfqUp2uIU/iF3K+VAmY/kO8XDNFKdJexg5Lp9M+JCmSWUaP3c1GVXw6O1OCsMRvx8zJRQ63s4BnFbkflfr6IpCFPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i9/4D5Ln; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i9/4D5Ln"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so87631cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789096029; cv=none;
        d=google.com; s=arc-20260327;
        b=OXe+XKpuAHv6OjXO1PEDwbW8zziqCPH1GioMWCUyfizjt35lM4+KYegjRrx0dtcCrZ
         M530km5DjZw702y7UyyAVeL0z6Po2UP02IYKoN6ICZRzDYRT0srMdnPokYywzOm5CSB6
         4Bm43Qn9GNoH5zTiTI2DIYYYKbuKjfUeB1knu3iQrLyUrFUtXgOb41rHD80L0pzeIz3B
         OKUfElIM52yhS5UZcv1YsVlajLPpqa+Uc7DhTqDxB/fxjLPTdhI6paTiC9lIKl6M0Yfn
         tEK6Wqy1CwuZZHU+gruCrd9UrXKQNLSRmJ5PDqvmJuIPdpquP9wZvYaoQWoCX8rFjz4X
         0lOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=bDh5ONxXoLGgcC48Bw6+gTgGOoDGbpRlA0yd2r0cnZ8=;
        fh=QTZOxexUtvKqi2eFOtUKce+Gs0hYy0nQqIEMWXvU/ME=;
        b=p5DvewIV2uorYjj02oYWBy5N8ihxG5nnZlXMozkyWr6eJ90vRfUtHuAmYvnOIbWbTK
         V4dRIxTQJfbMl6jPzYU9cMlkbdZwPe+GuXhwofaZzPdNwmVlJ/FbKmveVv6iSbs7dqZ6
         BU9JbUHcNL/Nx/hvN5uT4tIAHbqdTtWN28bYsGU0Xlp+Q63+vmdzDn+6Yn5W/6+bMQLK
         KApKcqAG0/G79NHT8M3wzciuCy2/fMUcivyjJhEPVfGgpX6JMbiqviWauN+WKyM0uVCd
         wLd3hiSEA6jSL5Kp37l34a+uQVBr+qz0eh5bgYA1WJqAEGcHk4m3JSrvII7xacVkdtu6
         xNJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789096029; x=1789700829; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bDh5ONxXoLGgcC48Bw6+gTgGOoDGbpRlA0yd2r0cnZ8=;
        b=i9/4D5LncpBs+ZpZkWeItUido0GTOXffyYgn3MfN/BvwS5TAfAmwmiYbejUcJaUG/u
         /o2ZuB+8AbEBDu/PeBqPewx9O5U6sR0cdERT0R4NcJD86QpbKuYLRQfrOW0w4dxHevgU
         0YJqVriUN4PuJNXsukueKEjvKDyJs6rctKdIti/ayFQfqVyyszMKLLuFpaIWlRJK4ywY
         nYB1W9MBS19vmb+aXsaBPjvzV58YZZD506IuvDrMQ/9cJJnXBj8gvwRqxMl1S+1e1ZpY
         tFUzJ47WgnWtCknw7TGJFhMweT7NltajipLbxIxIaRoZM98GWwpBBYhh4ATlinuOfjAr
         NbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789096029; x=1789700829;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bDh5ONxXoLGgcC48Bw6+gTgGOoDGbpRlA0yd2r0cnZ8=;
        b=lLbC6Wv2MkdkzXvjj25j5ayzHf5UbP8nMpnSh2aHllAHDW6T9EcPcrHsATzMFPP8w2
         rwKBXhOM1Q8ZnVwLd037BqpeBeulNqqIjJvp7oqQMiZ3CZ9uZddl2RRxLtEsBe+dY0dV
         fJMy48MooZ7HwToiJ6u/ouwWQhJjISklBx4VrPILT85UgKByLeok83ZY9a0bVDMTG35D
         5t8THL3FMtCChY/jLZOvgm0/kohOMSFA10zimILNYkca77jAWgsvslKFEiQLKh6JmKqf
         td6+gi3y6J0FK/fqWGHbdBT2HCvHErkVqhk2igQNefWk7lZP2LM+E76nuAHyGFe0ZyQR
         zqMg==
X-Forwarded-Encrypted: i=1; AKwUvBxxz9wgBuUm1j161fkDHPA54dCX+tN/GnJzPInfTjJCqnN5tZiEoTcL2inIlCcunNj8Qf2pQBlyf6AZ/Ew=@vger.kernel.org
X-Gm-Message-State: AFuF++l5pHPJY5hSZdP11BvdzoI6Zs9FcxjX5PNoz16htTvLxcFxa/EB
	aDMa1iEJqwu774SkjyOAb/nvaHSuffWi62KAqz851i7ACpneiOqwHvDIWAXW5MJ9K7Xi6a2M5Hx
	uPAbC8i911wR0Z+Kx4smluPDn1KDXDErFYSJiqogo
X-Gm-Gg: AYBFou2FwkF30CFzmgHkoG+4u1opu+ODxnh8fX4Oyvy01M/MYWgZ0qGLFeLnSuQVi97
	H9Drxi11qZosoTmmBtUflSnKf/g1G55hVrQQbKHSyXEiQ80G4gdOGnMqVlae2Bkp1HeEPE+cwmw
	x77bnW6YNy51MTXrHon6SPedBzmFxb4Sv3N0gKfB8t2T99abrIcUtGqcMj/BICGXgSxhjyYBCNZ
	iH8fQsGkOPGvru+XHAR9DaOIHt6Y1ZzHfclPlK3joO4g7ge1baEHEY70+QGlJaWFszwXOB1SuAQ
	DuHp9Bd+qFpc9Z2EINGx4DsDCm6YUo1qNAjacRXZSVHwOFxJ0eukJIBxOJLrgS/+geyDhlqyaQo
	LOCVMq6E=
X-Received: by 2002:a05:622a:418f:b0:530:4cc8:b0b8 with SMTP id
 d75a77b69052e-530c90b0c54mr13121281cf.0.1789096028923; Thu, 10 Sep 2026
 20:07:08 -0700 (PDT)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 22:07:08 -0500
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 22:05:27 -0500
In-Reply-To: <20260910-kioxia-ufs4-fix-v1-1-ac796423057a@radxa.com>
References: <20260910-kioxia-ufs4-fix-v1-1-ac796423057a@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stanley Jhu <stanleyjhu@google.com>
Date: Thu, 10 Sep 2026 22:07:08 -0500
X-Gm-Features: AcwNN1XbLyOMi557vjzoWiN2OPWNa_S2KFjozFqou_AOT6NoGdyvMlpGzBQWBTE
Message-ID: <CAE14pddvwycWnGNd_VNTzphsDTk+XbYwf6BDFkBnQFaw9hm7+w@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: core: Disable timestamp for Kioxia THGJFJT2T85BAT0A
To: Xilin Wu <sophon@radxa.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Stanley Jhu <stanleyjhu@google.com>

> ufshcd_dev_cmd_completion: unexpected response in Query RSP: fd

0xFD is QUERY_RESULT_INVALID_IDN. JESD220F has a device answer that
when an optional IDN is not implemented, so the device is declining
qTimestamp rather than failing on it, and the condition can be
recognised at runtime instead of by model. This is the third model
needing an entry for the quirk.

I have sent a series that decodes 0xFD as -EOPNOTSUPP and disables the
timestamp write on that basis:

  https://lore.kernel.org/linux-scsi/20260911024319.1346706-1-stanleyjhu@google.com/

It does not conflict with this patch; the quirk still skips the first
query. If the part is handy, could you try the series without your
quirk entry and check whether the errors stop? I have no such device
here.

Thanks,
Stanley
