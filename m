Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792710067;
	b=RcqeyVQnp5uPyaIYmIgox5oidFhHfbK5LRpMBz7sxDprao0bs3haIJIsnPcq2ptrJiki
	 NmgGxn0bIemu/KEb5GbDviPVdU7X2K4xTre+74JwweDHV6e9rrKaQRkSPO6wWbWgopj3Z
	 q4IcgWJvxlgM8n1hdehwfUJRA+eKFrJZe+NjdQGOIKvQ4sT6e5yfAEsiHVqqIqKZ3QIlR
	 cFjbhEuqp1S2MGxBUiwq25jbKb+WbFJQmcsAaPoKEQaGvN/ald0JuLZQb78L/RB/Sn2aZ
	 2/k1DNCS7g8O2P+GoseEMhvu2SpBTAH51QRMww14c5jWwIefJI2i3VjrILGXZVfaFgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792710067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RkCdxIIcsUSqZgK/y1VUtLxtcRLQdq+B+GtBMdyOLJE=;
	b=YRJ1ZdVsGYU/WxX3EG2ZFQsP47VV3ozLKqwjc60Z6C37GisR3GPDJEM3f8McFLFnWVRx
	 8ojXAPCa2bcqRSx0XmT2ktd+Xtkdg335ZovEFTwesC7S1tazH9l8Hi6BwyEmKWZ51d12j
	 JyDDZimekHApCJRNpXjZGfPBWOkbNEw9C9Dcl0Dg3RAf+xsiVdbZepXqDXnhBkfrmgz4D
	 9TN4iditNxbMLyoFMnFzHiSLcdPlBnK42f66KaoyKNq6Z4x83RkUTqFcD2NUDL08VQYnu
	 0yTKJBjucynKhEUDf8l/X6gu7c6mEPDoDzgdJWqZaYOvoI32QOqiYxxBfVeBFD9qDQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iNYoA419;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715DF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 715DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iNYoA419
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-98c5876f2b0so220788241.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792710066; x=1793314866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RkCdxIIcsUSqZgK/y1VUtLxtcRLQdq+B+GtBMdyOLJE=;
        b=iNYoA419HV84ypruHHVNMc71/mABHuyJ1ef9/37rrb6BqB0cW/ICWaU6fRnWkU/HKS
         XxLNSv9LSbfTusCem+B/Kvc+oTmhPRFoxZ1kym/LPPo533ej5aicxY01YVHnN1c98+P1
         OqRzNFCoKp/makT4K7AWQQyQfkVkS8xTukMUL1B95iVqJXQqpppqWeCpDVzC6d016Wvy
         YIX4I76IP7SHcwp+KkYf9dtcIg44iApJrFUFaKAduJko5FLpAzuXmFzAi0ibX87IVaxV
         L2nD6SrN46jfJZmruqAJmzSU3MzRwZGYHPRZIfb49LMcV/DfWvzE08GspRtW7ckI7zFK
         jz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792710066; x=1793314866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RkCdxIIcsUSqZgK/y1VUtLxtcRLQdq+B+GtBMdyOLJE=;
        b=UEN7oc2T17uCTX6IAWdW0YEg/rt8/pfCt2vWYiNep6qZ3OB+DparPZ4IaKR218Qiw9
         vdq2PiixLpZ4ntVksNHnEWUPAIRTbPecoMWRUVw4I7iXAEke5I+7yGqb0JkfSKbBvrq7
         MFZ1UmRZ4sTjTImVZ8pVRjFIXyciHBHrgsbo84zqhocH4nll5lcA2R6Yyb3J1sPzstZA
         T29vasZ6JxserfEXLMHnoGf7tFIYHENZbuqjCk70rYaV7CI/QXkMsTM/bYqJS5CN2INR
         QDubjt4QyqMwd8CCRjneQpe0ELMEznTMjKw1iTaHIKmf2d4w4AkqwZqnbMip2KuqoAK6
         Osfw==
X-Forwarded-Encrypted: i=1; AKwUvBzN15tMZKlGvpfahwpsFjOg7cVVlgNB/eFCcyjtJNrmrlxCVAUVx0H1bTDQe3IlHvlxLvvbkb1NU4Hqc+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJbGXoUXYJIPw6453ude+/lj+XwWeR4KQ3K+k+OL0HU5O6VeuZ
	NcQGdR6inD6cuCbf3nYMYHJ1N8D688VIBei28n2wWY8DDRXWm37jYfzC3IP3b21y
X-Gm-Gg: AYBFou37Qg0XDUvSGA6t+mak4KN20XMJCHGynBa93AWEV6Y2RtJ6fVbVDCUVyC4Qc83
	1Cvl7mOvsiILffpt4jtVfq7qxGCnp245JlYIserNZS7VwNl+BFeE3C2kLKlnyL2ykWNm670bXsx
	hqrPVo7RFiRosxRTtcrj0RZ4DZdKZHZmwQNUndp0qSEALOl1gwA5lCIGtKspiIZPtXGKx6A+waP
	TmN80wwXMVLnRppsNv/QqlsnoHjzU2faUYU/FLTtyVy04E6mW4aDjjqwUvzjs3hlXZwjZgxWod1
	J2XxUaqz0v/I8nCrGEE+js3u1Sxg3RFxqXYQs2ysxR3ZUj3W7wwpORm84Pj9Rk7+fL0p7/hlXVL
	fGkxhH0XrlFNQ/AbOygXV5G+ltW8UTYCUnA6jEfQQT2M+zOGyiC5vzIqjFTgtO8l7+yGsNfjJ+y
	KuvbRXR/X/B0sPCeUKZwLzIQS95js4ZsAYdbp4kodxTi6lzDKeLH7GI1E/U3h7wVe+tYTALsTqm
	3waI2/mtOtkl4iX4uiYGHVUlkiJlP6zW9HVk8lP4ilgr610GwzwF0p2u0a9KM213sRIPfIshnMX
	Nien49npuy3e7ovTf1D/
X-Received: by 2002:a05:6102:26d3:b0:7c3:7286:c291 with SMTP id ada2fe7eead31-7ccc329bc4emr420829137.19.1792710066358;
        Thu, 22 Oct 2026 16:01:06 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ccc1e7ce72sm1245236137.2.2026.10.22.16.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 16:01:05 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux@armlinux.org.uk,
	Bart Van Assche <bvanassche@acm.org>,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: Re: [PATCH v4] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 20:00:49 -0300
Message-ID: <20261022230049.95290-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <87o6clz749.fsf@trenco.lwn.net>
References: <20261022183658.58090-1-breno3011alves@gmail.com> <20261022185224.60700-1-breno3011alves@gmail.com> <20261022185224.60700-2-breno3011alves@gmail.com> <871p9h1kc7.fsf@trenco.lwn.net> <87wlr9z8iq.fsf@trenco.lwn.net> <87o6clz749.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jonathan,

Understood, and thanks for the clarification.  The maintenance angle is
a better justification than the one I gave - "this file has accumulated
no changes since the Git era, so there is no maintenance burden to
relieve" is a concrete argument, and I accept it.

I will leave the decision to Bart and the SCSI tree.  If they decide
the churn is not worth it, I will not resend.

Thanks again for taking the time - both the technical points and the
process correction are appreciated.

Breno
