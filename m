Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7504B47CA8B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282283; cv=pass; b=m90p24u9rzQbc/8BfztYjDD4qf5bc3lneIKl4WlA5/GNRnVRndjw6zhOl2s1q6wrsjIt0XXKm5Uvqw5bKwSOghIFiqEry3BcpZdql7g4Rpric6IinIbGabXSEar4btlaPqqK1UTlP4EhK8rkGwICzaO5PGtq6RGvRl7Inwf6WI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282283; c=relaxed/simple;
	bh=d0cdEJI9/RswzkjbxjykcepGXr1VSGWZgZWnK4lfHUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKgoGPV4X/G6RCKXOFP8wlXh0Kfh16WeAEd5C9Fke9Ka66ogKNhYGQo+8VqZEdVzRxFDtGWMslv6ios5BXAjf5elXy0KkkFL4Aaep9ci3o7VfrOpMNZGI8P1WNHKNDZYe7tXB+1jvq1lmGHXGI7Dakmlh2qKwYZmQ4pcuUk2KuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwvv/oiq; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwvv/oiq"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b1ba286f6bso891303b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788282280; cv=none;
        d=google.com; s=arc-20260327;
        b=l+zNK7vaiYOY+3vwlb7jjdJCw6AXALJ977cwRtrbcYn/w6qT5UmZPZwGaGlN5fqWFt
         Xe/Pgyo+8nvx6fML3xqQGIWhgV5CHqQKNdChIOZzJCrvkCvDCMLJVExZc+mAeVbjARDC
         5IftfzYLaIojSItO5ssYoZ/Ikiop6NE9q8aeSw4OtCLYv7Jgvzzg3+VRUdSGo5/UCGmq
         8qvNwpnLcXlFYbU1mAhv5svismmdM02J7thSo/cgD0zQj6PGD8ZY/Ua8j8IC5dN9Dckh
         OJqG4KxU3kLoMlPItzpFChtHGPx1ntSRa/Wk6/Pswr/xpKKVTpaJZDhf6HhU5YKJIom6
         67WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u0pyQF2KkMAZd1qn6FHRAPnrJYWT7vVvWkqtFaYE7kI=;
        fh=k1JGuh6CoOKYoH1JKXHzWq4dqfR7y/EnEnRH2O707VE=;
        b=PMXXjHi8badmEA5R90azrmk1LxX9+9z/+fpR8CX2YsRFEQ2HrWcj3WK4pzBWcYD4ZY
         vRNQyJBO1ES2i74gQ6oxgIPvVulPb5CAYazC7SUulPIzvM6oRLQeKE9HQvvXS9X1Bi31
         UAa+xOxqITNejhedGhFIBMgx2bOAhpgTUd2CfcdSdk7j4yfFB49lxLSLhrIEcxL0bFNk
         7xdO1IecrEIJCrPtXom9Vyw8CH+9keFD1fdpVsV616MM6QAhDQJe1bCI9oDT00M57iWU
         npca+NJk+8C8OYnj9HGWDx3d/uOkIPElgn8ROfSuFv4WAadFHTqQEDPPx3oa1YSnbSXZ
         YwYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788282280; x=1788887080; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0pyQF2KkMAZd1qn6FHRAPnrJYWT7vVvWkqtFaYE7kI=;
        b=rwvv/oiqIjRz/IrkMYP+qzY/NjYS3kl/D9JfYWAkCE1dkt5ZlrdU9bRCP/vdOQWF9D
         sYbzaUuccnh9PYLKRF1JPp5qWKrWkmN6AccAZ83Q1z6nZJVoXp4lBov6GSiiuf8XkZX1
         n6kl6WFxNQDFd8/vB10l8y3pMk3UMeTdKSbhT2zZK9yOSxGsbfi061r7fZGEBe3cSsbr
         z/r/GyXokbhlcKXS7UdSQ7gdJiJr11b2mxF5jxW36gm7kpUIfB9NTcSlOLT+UKr3qXmS
         ROcwaMnOPRn/TuYEzk7GakKLLUuoCSCOnEoP+XKwre+gSoKbHekXT1kqLPgvEqo/QjvV
         +ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788282280; x=1788887080;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u0pyQF2KkMAZd1qn6FHRAPnrJYWT7vVvWkqtFaYE7kI=;
        b=qMVZT1uVBzBD+nOA/8VkycDjetgP2FIw+3TdAZs2LQTBDjPkd39ADDWRAkikOVTPmX
         7eaet6gVhyMMZAIgP96vgDam/YbCpIX+DMV8VjKLzJuREzgj4Sx4/SytRq3eUYKgsKGV
         EgqcE743dpljbTW3zFKc4u6Pz0WJANq52zoTvINyoEKLs3fDsElx8il4Brxu1w9+1uS+
         n9mXgZN4iCX2PHaORPlx5PYZcg/MCLma1ms++STAh32RIEgY0Fu/ifu6HSy09ojWt2fG
         H9D9S36SkAHOtcaKJDAD6scQVPjvoC1irlZgeW62Upklf+vetVBa92A5JFwRgJ7g1lxB
         YxeA==
X-Forwarded-Encrypted: i=1; AHgh+RrkcQmVdoN48tfScoaTQECBHmAcK1rxQMiF0S6hMWY0/BN60TrPfoxi0wFhZR1sLVb5rYQVD2N5jCWL6F8=@vger.kernel.org
X-Gm-Message-State: AFuF++kS/oMt3k9OKkKZ7sr5Hxkk+v109tQTgGQXkGjFr/mRKIT9SZ2Y
	sIMNDCq/wSkfJ2GRMOFOILJZFQqQWzPACJ3wu/GZizOIPx8qUVpKKp2F+Hd/cxN4gJ2kbQh8Rg+
	h4N7AL4OjLs3xCmitTiQxj58dDjcK/bM=
X-Gm-Gg: AR+sD119KIVvQ/k20PZ972gFjmYfes2wNy6bPHObJPl419pkJYLFL5vgpfoSvylZ/eK
	GB+DQqZAk+l0ypNeLjOEcoPsaCF1MILAzCMjlBQSjpPPXzKeEFKqc1u9tqeed/KSBFCx4ea5mV0
	tzx1DkK3nhoUSLxFtU+8eFDdidyVhjsO1l91XsXCivPfOBzV1bMGZxpGDUfMhTEujzFnNTZaL1f
	8QoV7RSgMkBgBLcNaR//yqVT+waVfSH+DHs8kc2QUoLzKK44rE7MRDHzRHmx9yu8YTxIwS9RLLH
	aYJ+m4NBSKpNJ+AcUVbERQ3y9UjkTLcQj+FL/iEpPfQB/HOBEGEyWVr7JxVrk38X5UuuxQJbeYO
	ClgPRpRqjAjtSQUc/vKXMNSd7+zZ4OdNi0Q==
X-Received: by 2002:a05:6808:4f08:b0:4a3:cea7:4ab6 with SMTP id
 5614622812f47-4b5befda1b3mr4924582b6e.10.1788282279853; Tue, 01 Sep 2026
 10:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901145156.3177187-1-mauriziocasciano7@gmail.com> <c9cf1a69-9136-4f64-b223-aa038520a0a9@kernel.org>
In-Reply-To: <c9cf1a69-9136-4f64-b223-aa038520a0a9@kernel.org>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Tue, 1 Sep 2026 19:04:28 +0200
X-Gm-Features: AcwNN1UE6ze19kP9LilT_aCzQNaCwiaSO9Pp-1Fdq20zkQWrRN7Eq-cc3-82AVo
Message-ID: <CAO7O_xi-BYfGb428q1TO4ERp059-BOq78PZR5Ad-bs1ikVkmZQ@mail.gmail.com>
Subject: Re: [PATCH] power: supply: core: Honor supplied-from with CONFIG_OF=y
To: Hans de Goede <hansg@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans,

Thank you for the review.

I agree that firmware-node references should retain priority over the
legacy name-based mechanism. The "supplied-from" property should only be
used as a fallback when no "power-supplies" references are present,
including the case where the consumer has no firmware node.

For v2 I will preserve the existing order as follows:

1. honor an explicitly pre-populated supplied_from list;
2. resolve "power-supplies" firmware-node references when present;
3. fall back to the name-based "supplied-from" property only when no
   references were specified.

Errors while resolving specified references, including -EPROBE_DEFER,
will still be propagated rather than triggering the fallback.

I will wait for Sebastian's opinion before posting v2.

Regards,
Maurizio
