Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252AA37C108
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791324862; cv=pass; b=ktAn8cmnRPOqG3wq5kWjZFXlEmkLrtDtX8zTs2oUPt16rQcLLHUOy+ogaHxTH/SD3Fygpg04z+rLOod/FP8ZFI8PoguZwO/wQfQ7VM1k9lkrn7mNggkj2e2+WFseVY4ATqAuMX1Ddx1SNxO8ncftLofZ5/QLZevlP3YT1geQsRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791324862; c=relaxed/simple;
	bh=15LJZtOorGFDC0T9o118Z9LBqCQ9DwdnV9oqHmbiXbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExzpniQS2pE3nf2JYn3MfZbgTQLZrQYfO2gDv+LmzPN/CX/IP+P1uDD6RcjlqUch4cVNdJV64CpfYuvIL6KV6rlJ1MAe9wlN8cSQGG5N7w275UHQqQ85KKENjMqlMPXTQ2ic8rjj74sJ+rj6v71pA10pGJrTkex5bGP1cOlFVF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwIZ2fby; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwIZ2fby"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a9761758adso9441171fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791324859; cv=none;
        d=google.com; s=arc-20260327;
        b=qm1eaA4eVIdz5nuX6idH+7KcByY0Kcv20HdXUbPkji2uc/If153GoyhPrkkrhAY9i7
         q9ETQdSA7iW1YoF5FSS5BuvcWFCRXLWRWwa2t/5ZJ5Whevp4HOnfhdvmYQGhRpcAS3R3
         EaTkaOvSBzAStbqZx89K8MxPNZK+hDBehflz5oPXUvN7Nwbu+VtMHawwZS0KKxcCM7/p
         yeQZiS9NOVDiXot7HBx9NnGC/5RSk5W/zjFO3KIl5gcjH1QGTjBexFFJXWjHE5dVjmxI
         jWuat3V6kYIrEHHof4s94NNA3KR3M3Jfog43x6+BGCASd27FC8NP5hXv5eX/kI/yO12m
         Q3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=15LJZtOorGFDC0T9o118Z9LBqCQ9DwdnV9oqHmbiXbw=;
        fh=tV+V+T7/yi6sBW9Gr7c76DSjZEj6OoFUv1UXPv6rLlM=;
        b=TjuxrWd+QDlJXUY/OW3m2xQF+Ztp8EeY05+Ot+q11r2EiQYwk7clF8oG7vR2VQYRSU
         hN5AZsvahxquRhBIecmM1toOtyAD9btnG+an+l5O5482R4hXf5qwmTIUexkTOuI5YoMg
         I+vT48trSzVLUWB1xNea2UFehXXJScEihBp5TAHgCJoqIquOTYSZOABjl2H26oqFOb25
         2nDtFR8UULQxPDBNXq5054TtOTB1t0LqOeFCsBsIQ0hpyJf+RPtTfgjg86VkKqId8dqu
         pygaWt42Dhdl671yOQPDMWSfKZhby0SNKAdoizRLAPPCW7MjktKa5c6OFLNef2490PWO
         Azog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791324859; x=1791929659; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15LJZtOorGFDC0T9o118Z9LBqCQ9DwdnV9oqHmbiXbw=;
        b=RwIZ2fbyF/Xt3q4GdX0D0ddAtr1bK0cWBG1ID+tRp3P9YuapoAh2QVmp4PKmEnwXqn
         HIAqd3EKSR8QCixTld0Vl9XdjmgeLxZrmJL61rneCt0NM16UaXr33vq19sJXcUIJ/qXD
         Uzgzk3MmsDEoU5Fn0kvOfREV/PrHVe9c01BJ4XNVvssm7Rwo+MT0ojYmjAh/nXE8+WEe
         OGFIFqFJylYhf0+Hg3anG2r1VqAKtxqjiqUuGEKH9HWOUZ8KveWVnLABvmAqUGzm9i6n
         9hRqHmjeDBcJjRGv73PbWpvTEDtwtijcZoKjiRmEIj1ObUK2afqUgEz2DlL12TKBPrui
         B+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791324859; x=1791929659;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=15LJZtOorGFDC0T9o118Z9LBqCQ9DwdnV9oqHmbiXbw=;
        b=NkfTlSgEmX7YraX4ZoKOMfkANsM4VBGBUHFit6ViF576IxIVBbyZuPVyajVLm80+jd
         FiuwDH8V6FOq6xkKN4Y/caZNjX/8jHMXeFDYgtYeqe6mFOZZkNQ1duiLxYyM8I9sji0d
         qpcnIk0WWUzanQB1twM2tMjdSFuiK9TSBqFUOXXYaGRTd4lhRIvi5IfcTb3GyHDrnGfb
         B9dWRc3msX3YDtCRSjdg3bBtlNl+GgyYH6QGyrgNYbSS2rzWt2XzwTAAc0nWbf288g7B
         VSG+r9x3/n9uKdk1c7A8Sb8oHln6t6YyesxmOQ2TZwtHg0Mx6M9ivPJd4oEp4JSIopcw
         akgw==
X-Forwarded-Encrypted: i=1; AKwUvBzMy073ZLGh+q0rNxOKq8MsLJ5QirMosJ3DKa7usDS+XgdmCrL7PU8rtbJS7alFizlT9cB6ee01lWnR9Z8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfokqoHWTxvyd+9edaJvEAFu94Hd9trb7lA64NBxICYyOYRG50
	b6uV9iK9T+ibCs2JN9WvqWj8Ns/tt32EGLowVmm842+X2+gZd9QVNvfIMGUkVS3XU1VNU6Cb8iG
	v8/dIUq3r2ShL0zitqww+WnwiPYZkcRs=
X-Gm-Gg: AYBFou1axSqIdCvBjhuPveq/HGGHKmSfTAOlRz7deQXcfWv5DhuX4qkaF73yQv9gkyb
	Br3pcmrS/WZwg4+UoPRoI7TYfqUq5LfEUSBKWzdoTpLWhDGGbmcHBSnRlO0Wt2DWk+BTcga6AWP
	y92eIki0vTr1h2RDs7o5mHsi9y2cewXIILWrMIS32Rvus1g2hpDhJYh0cGV8mxdU2P4omxW+rp6
	caRQsqJv0qOrYGyLI6Q4FDhXC92le+jNxuzlEamsDqbCDYINmSXw09pzGBpmQG+9xAwYlDKry5D
	mcW6DNgUfyi6fLLlj8rkgitrD2qLYEB8LCX0WzAO9eOi7qi5/SuciXc=
X-Received: by 2002:a2e:be84:0:b0:3a9:7160:e83e with SMTP id
 38308e7fff4ca-3a9a2cc1e75mr696691fa.8.1791324858938; Tue, 06 Oct 2026
 15:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004212403.208681-1-oss.patchbox@gmail.com> <5e03928e7817104f062e27f0b14d180549f209c2@intel.com>
In-Reply-To: <5e03928e7817104f062e27f0b14d180549f209c2@intel.com>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Tue, 6 Oct 2026 18:14:07 -0400
X-Gm-Features: AclHuK-H1P6XAfW5WOEyeLge3myteWvfLBr0lYFKR2exJpjCcMV3nLYXUK8SvaY
Message-ID: <CAGG=RgCoBZwks5CR9GK0+xk8kexj_wWZf23WwmSTLZBu1hW=eg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/i915/gvt: Don't replace a DMA mapping that is
 still in use
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Xiaolin Zhang <xiaolin.zhang@intel.com>, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you for reviewing.

On Tue, 6 Oct 2026 at 03:41, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> IOW, you're not hitting the issue yourself? How did you find the issue?
> Did you use LLM to write the patch?

As part of security research, I am reviewing how virtualization code manages
the lifetime of resources it shares with guests and devices.

> Did you use LLM to write the patch?

While preparing this patch, I asked an AI assistant questions to confirm my
understanding of how the driver works. So technically yes, an LLM was used
in making this patch. I should have disclosed this in the submission; v2 will
carry it.
