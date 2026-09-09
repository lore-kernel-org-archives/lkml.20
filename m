Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05663B8BB9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981515; cv=none; b=YbpHpzxW8mxqZdX/VKD4YRPyYFvIQUEv1OUP1aaC1DHNge1lWX70JLFLtJozjqPalkGr1oV8aE9WKJmjgxSf5PrIs5047Jtrl54I5X32ftOa7guAotEmX3kNUj4uxRyoe4p8R084qIRTaMVirCBQX9s/H00kWACuAlFIpE3AX4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981515; c=relaxed/simple;
	bh=ZBF06lf9l3jjaPsie+l2gDKg30y0nMjdFIJaDuIFA3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DGSrftaBOfD1xCHZLtN1xacIJnk/igzPXR0DoYeJFOhQzxtIpPUnrFF5NhpWYZ2eQNuvVZJp0hIT8fF4NLc9oYwNa5plMh5OAIJfDRRMexO6P7wgADuTwINB13lnd230d9dIus+iJJDBvy77gtyOB20DxzT5o7xmZXCONkvuSig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etu+CXdX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etu+CXdX"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso59486305e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981512; x=1789586312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cQp1h+Nea1dCnGwxCQ5G9ZglVlG59gCPu/u14By/urM=;
        b=etu+CXdXiqG7CMxMVMZ0Ib1Uts6d+uEBVjXSAIeyebuRFFsfxM0kdpymrvRHCIddqo
         9LGAupoOy+rieiQghyfIu/IBd1wvHySJLSVdAl8RIwVgF/QcD5x6AdHkNZU3NmienuRd
         lbN3GQu+trQcLeOGnvAjV6oRRK32l53/tWRHhgaJp+aoRnRRECc6QEEijH9DzxgwIVOT
         MQa00FPsEuOyTnLLYpm1LcRfRGe8Fh1HnbhdIrR3bXNPunzbJ4jLRN2U/qdBQvYsUEUd
         M7DLUdsHNq139a10aVAj+QqxuT95oVYUwqr/cKU8uAwqf32QhfYkrbRYLBAwUGrBwRxW
         pJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981512; x=1789586312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQp1h+Nea1dCnGwxCQ5G9ZglVlG59gCPu/u14By/urM=;
        b=i0natjldcdY6Uako7IV3uamm7hyjVsvSUbD3smcm+nmOaLw3EgowFu4wIWfrRygO8i
         ZIPZCs5wC8bD+nczk8Ym9Q3YNBLPyb7htYDU7q3tzVCaIkkgBKwPlEIAZmwcLfOj0S46
         /VVWkOkG4RQcotLL65M9mp87+mCLTQTGTNn26CgcMLjwx2NLI0TdWbHHibUChqzrh9K+
         5bYSldtlHiIfkfb/KqGLq3EisDQutWvDEWS5zZDPZsclyvyQHjI669fS4CDzDKf4WykN
         BAbi79dLcm9Z2ZKqJkSX00ta3J4nrjFhhWllr2xxnCFXv5zSxAK0pSpvCxQRMgb0V7sl
         aowA==
X-Forwarded-Encrypted: i=1; AKwUvBwbAvhrHAPTP5YP11fDoTVClvCLFQaJteJy7VOxJH1JLZsstdxkX4aoLi0Hxdi1JdwsvR8XY98yQ32uOO8=@vger.kernel.org
X-Gm-Message-State: AFuF++maif4hXY8QVQZ6AAF7n85EkEuGEVtjRn7p2L1CMdBHxg0Dth0S
	gTi2tPG8NC0rpEJO8Q4prFYMs5uBzrGo1mwWblD+lLfaoRkzS+YhhFWJ
X-Gm-Gg: AYBFou1wCoYufjF7QAhOAriUvTVbX3UIM48wM8CaHkR080T4iufA8DQ90rbdajS2YLi
	Klm+Dy0QUj4KPCMSv5ZchghsPsxS3zIEEuKdnuKsWbFBiMI9NuoqwQEvvTvP70w1d6LGiNpSdCK
	ePtPFr2+cHfTkAqLNCqhbqPZbvNHiJ6/tNX4aIiacel1xAyrWlPUBGLE/UIFt2eOwU8J4JvqIEe
	gDVgGUIo62qMDUucQxNLfb4+wOaZ7PbmMeusUllNWJ8cA2SeBA3VauLC0TUTX28lisY80EGUbz7
	HFV/4LBWzt4ZhSQonB7Xjm5FYLDnRbZJj/crBFBWvFSd+kmWTWskBcx+OEzYytEvq4y++yy7awp
	eB/VahG5T9hnDr01UBlJ24N94nzn0l01lbiMSk/CQMtIoAcJPgyYueEkHaHXb7ZoaKJAxgPtx/C
	kkC326imSLFH8K23oKXNC2S4sMsbsJsvCcyVr9NwBpqk+N3me+RRuckW4wnXGi/gCq9X9UA3wnf
	Pa1ni7UjXuhZyG4XQ461MHUl4UkVpjjdmKiXvAyZLk=
X-Received: by 2002:a05:600c:628c:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49d17a8745bmr144560705e9.12.1788981511672;
        Wed, 09 Sep 2026 12:18:31 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm164538455e9.4.2026.09.09.12.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:18:29 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed,  9 Sep 2026 21:18:16 +0200
Message-ID: <178898149654.33757.7826789084252321894@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909113625.000063be@oss.qualcomm.com>
References: <20260909113625.000063be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Good point - that reads much better than reusing scale as scratch.  Taken
for v2:

	scale = arch_scale_freq_capacity(cpu);
	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;

Same semantics, and it makes it obvious that both the multiply and the
shift stay in 64 bits and only the final value is narrowed - which is the
whole point of the fix.

Agreed on leaving arch_scale_freq_capacity() out of the expression too.
This file is arm64 only, so unsigned long is 64 bits and it would be safe
here, but it stops being self-evident to the reader and the cast that
would make it evident is worse than keeping the temporary.

Thanks for the review.
