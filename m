Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFCC46EC6C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038892; cv=none; b=GgXnjH93F3BOIfaC2gB1PfALBjQ2Jz+UDAv4PeGDGcJNzfJQU3dTlaAKSaKr6/FV0g7TlabNz9smXB4nP4hbrKTuWMvfepS1W5bHv2pBRhWd75P8vJdPrRywIYhKtQvhhfIXV1VB0kwyEa2UKcAWlpAGvSms+hqtr+qVKppArhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038892; c=relaxed/simple;
	bh=hM+j5vZvepjnpgp47k2nQCLQxo8iIPo4FwoLBdM9RuY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AuIzP2sWgFHhOTgrImliqgX5MMAHYK603zrx59qezKnCGf8BNsrrg+gdrMssWU6BxEif4QithhCpUTSwcT+Fs8J1B1kEANzxhE90nkjwgKgi2NqiznY1Ciy9KhjNiMy2FG0RW4gskSYXezSrMCiCqJmPQd3IMuceMw9dnvqUt8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ekcny5/p; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rOJ1Kk0v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ekcny5/p";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rOJ1Kk0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789038889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4aJeoI50tbrmnYJ3Ms6Bai05KfSCa+A5Ag4laiMRAqw=;
	b=ekcny5/pdU/lc4halXfVG5i53fOZ4OKLBo64HYK/9ccAE0NqSJWMdhqH+2nbzrcNtvHsY0
	1J7H3u1ocBfafotkL0kMt4TuBH9ifEa73VWW7qqhjK6/qrnNmfyaMMYcf7kez1ct3neqU9
	gyTJ47IifSTTZ146tXtvTpvBIVClRcU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-4n_TujFhPu-oy_aeyTLrnA-1; Thu, 10 Sep 2026 07:14:47 -0400
X-MC-Unique: 4n_TujFhPu-oy_aeyTLrnA-1
X-Mimecast-MFC-AGG-ID: 4n_TujFhPu-oy_aeyTLrnA_1789038886
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4858e4b3e92so3079502f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789038886; x=1789643686; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aJeoI50tbrmnYJ3Ms6Bai05KfSCa+A5Ag4laiMRAqw=;
        b=rOJ1Kk0vVo68HArhUJyzWgI4S0/+2pskdr2LtTP/5jSFHxNyWmNlVCJ+wmNMLlpIxq
         Tdbxu6dosOst4FWjqPd77uTSaA2zfO07wZ44p22fBNegRaPrD/J963U0c2A4aWMSTIhN
         C9ENYL4qIiXbDkDeCV0hvcvVzLZilPj+vY3irMEKubWJTjTGvJVKltRY+RhXmlGQAeip
         VZ7uYXywHUNH2bfzQdvxnyfsPCu7sfYYtx2uimDBcEOJpbUOWEMG4mj2jWTYNUnbaqeH
         LsMDKINpv9ifoVeOdw3Uqd9+/AULK4EJ9ml740vFc4Nmww6wBlQjqAV6+wsPyVBGr0Wr
         RK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038886; x=1789643686;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4aJeoI50tbrmnYJ3Ms6Bai05KfSCa+A5Ag4laiMRAqw=;
        b=qcSlsPgwq61oJ/c4SnuyMOldv5Y0b41ueCEAC0qfFuARq9de7UGrym26bUzX0wSI0f
         QcDNrmZNSBAB9/FoiYt3FXkA04VHZjtJl9EGBQstcFMe5tQ/qPPa1WIweBRmziJo8OKP
         7ko/rIRFWEgO7pu+RDaCUkIcCrw8UfV7O5bDTeQ7tH0CH3pJUVZEGn42xIkmKxFzCSW2
         bZQTBcCWp/GKvGITyUaF78Q0FYyS1kryp49OYN5KKWigT7IjNd1Nq4oLv1R6Exavqybh
         U0wYIVIzwZrBsDmupESFYtGKCLSGb6p8PtRgf2L61DK/QefZnltJQm6lc53QAAKNqCQu
         Dfuw==
X-Forwarded-Encrypted: i=1; AKwUvBxDrzYvgsNBDivujlI/jj3Q4fFWo5PhKxiJrYgQWXCFCbdDYrSHep3xnln6nfdAPsp0MhxguxQDhXo7l5U=@vger.kernel.org
X-Gm-Message-State: AFuF++l5ZptIv7mDvRjsR5KVhm4WhKw8y7VnzwEgN6vTZEm58nuVwbwF
	X40Vqc/LmU669KTyDc4IHY+iuCEmRIWRHNyTC5HX0UGZnBxu7K7W2KWe3Vp+KjJQXXVNFg9ciYR
	11d/rGiogHihZviEmrmyICxptQlBSfHTXMRIQObq3m35+wsGaShXT2MyHzxWa/S2ZUg==
X-Gm-Gg: AYBFou3ROoQSuqYxtEaA5l4cyTjpsvIhDohdGlMhw9NCt9kCCjXL4E74Q+z6VNLoRWl
	+CMGmfQ38QV2ngu6LQYnMViq73qJX+FhdbbjE4ZHvMWjkOymEZa35k0D1fX0BhOnT1oEaOtRLOH
	oRsuur1pfl5MWgxWEJGM27gTTOCu+YwiTFozRErF9hVGF0LH+e4w/nr5r+z665sT1qG+N6Qhuc6
	oclXsU1NF5xez+pYJYUxiJ8zgRlFkdGbPI+s5a5XsEPnuMUVMDaQls8pRWzQO7QMMnuNl6mJzuD
	DcH+M4u3nttLLlWPGogjQM/Evn7tVNT1Ugs5Htis6PUnwPtBTBz+2pd6lcPwKOrkosY4vXiHqsZ
	zhmNKRyDGNcemPaTqsYEvLf+AC1kmDKQn5e1t2/QJ9So=
X-Received: by 2002:a05:6000:29c3:b0:486:4fff:da40 with SMTP id ffacd0b85a97d-4864fffdc49mr4596024f8f.57.1789038886596;
        Thu, 10 Sep 2026 04:14:46 -0700 (PDT)
X-Received: by 2002:a05:6000:29c3:b0:486:4fff:da40 with SMTP id ffacd0b85a97d-4864fffdc49mr4596001f8f.57.1789038886245;
        Thu, 10 Sep 2026 04:14:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm53587265f8f.10.2026.09.10.04.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:14:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com, holofermes@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Amit Barzilai
 <amit.barzilai22@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
In-Reply-To: <20260823111959.17029-2-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-2-amit.barzilai22@gmail.com>
Date: Thu, 10 Sep 2026 13:14:44 +0200
Message-ID: <875x0dmk7v.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

Sorry for the delay. I've been on vacation for a few weeks and just catching
up on my email backlog.

> Add a device tree binding for the Solomon SSD1351, a 128x128 65k-color
> RGB OLED display controller driven over a 4-wire SPI bus. The binding
> builds on the shared solomon,ssd-common.yaml properties already used by
> the other Solomon display controllers.
>
> Assisted-by: Claude:claude-opus-4-8

There have been recent changes on how the attribution should be done and
you should just use "Assisted-by: LLM":

https://docs.kernel.org/process/coding-assistants.html#attribution

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

