Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC0245FFA4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776937; cv=none; b=SqCQ8MtBVhidRHbSTZEkpLBWRguOXbrSnQUoEvW6y6ZR2b8Emn4EitZwc6QTZgSp1mDDgyqPNH8i52p9dW1j0qRQO22I9bhE1kwBkDKTLPXzLURf70LutoGS1gwuzV0thJQcJelpK+k2ep7E8MpUiQ0LCbOndVMA0QZkhT3Brpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776937; c=relaxed/simple;
	bh=+FZueAE6B4Sk2JqzwzZJLHwZxREGGVuIYUHkydVmL+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxItK86B0vZeusA8AN4953MfMMuqPqpXTeMAvkb/uh/88WvYKlyJIoNwTvntRAExgzTw+C1tTiFaSKIY0mN6u63X+PFtniUqhEa8uk/xENgVrO+TCnKG2BQYcnoU8Re7YZVMJ1Xa+egQHD/mOpPl3+NNIPSU/X1IOtV5P2DKeeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s1WZ5aos; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s1WZ5aos"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b55da9so350403f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776933; x=1789381733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L64O8c68uHWszTYOMdgMxgtHCFDKEdZxdX31illwNnc=;
        b=s1WZ5aosQ76claYf3OozEriQSjxImJmybO7OP4b7vSiUiKdA7HSgKWWzdLddSekyX7
         ungyRrVXRRbJau6bFO75j8gp0wqiOKDJm33l54XSpWXHC2I+GdSLEcy1jMx8sGx2r3zI
         fBOoMAxbmzk1ftgYJ/hz42GwOLDJhoteN+98xOLmbMJtBUUhAeVMsN0C2vrBrrokeedD
         /uTSViMkCU5VnBf8DAukzUzE7QIgnH0YhpG9OvfRyM1gpxwH1k32kkL5JFw5pZVcDvhn
         YPg+KxTZIvVq3dLBDJV15o0qWTW0u1VzLvgTMWk4OAl0wCR54UU2q4kBldlzQR+CQ9t7
         HF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776933; x=1789381733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L64O8c68uHWszTYOMdgMxgtHCFDKEdZxdX31illwNnc=;
        b=rA8g5EngaxCBOG+JzEJQ3axPDRpYaDv/d0sqs733T/mhDkQOCk/TtFXW7ZKs3vUU4H
         fy1iG+z4UiDUtgjyb2MjWAiP/q474RE+vl3DWejD1brzgNljfeHiIVLy3lwaf2BG3jyt
         RX+fZ/fuW9qhUn3TjZ41hvygnIpUpDnz6XumB3jccAoZgneFk2XynlFcivhazgfRQ+1c
         s2DIq58Udi8jwLX4O+6EQKtIsMUk+vuSMwjQNao7ihsqTrZWirus8wPIfzCr4rQB0T+B
         GQvhYgf3CguPgmw6oG7uASo4onTnU3WG1Vhi89dNlHyMqKecWURtp8eEd7TbZIykgSal
         +N9A==
X-Forwarded-Encrypted: i=1; AKwUvBxogvTz8fm/kPFyviQhTjWWmuSD/gTIGNnIumelnp8k4D7/vBylmC8C8EX0WODca1xj3rq9Z+Rh0KtWk9o=@vger.kernel.org
X-Gm-Message-State: AFuF++nXIQFh0FDEHeVchQ1I5PubIBXebCYdGvD0DcHCc/eE8KU4UrEc
	9//ix3jpqP1VTc6WvZhtAJBxwhmtPDdW0IZOs7qxNQGV2Hzj+Lf8AqxP
X-Gm-Gg: AYBFou3LBS4S8WoOFxX838EBqccQJsYBj08uKD1kKgFAjHlI4PjedrfhWDqORnVLm3i
	axDtTnzG1ZeHuDMxUrpNCCfqEV4Po0vyKJQOFVsMvvtO77IoffUUrmA2yMTF+MPol+pkqxQ74qV
	Hl7WzKKibm6qqZvCVztbF8cUDdU+qVUuCWuilEAjFOkMhy557hyDw68ufEhJm9Nr2n1AtoLMJgZ
	ENSHe9bNsfU/YUxGlG/kIg7ZIXgpuwq0w9jd8DZLixvU7PK3jpaLqVi2U6DjeCD7Lp0MltxyYTp
	czJNPvQu90pjkgfvm6Pe3HwVZ3RUAhzud0TnuO0ok5KDHVIa/Cb976G1km+UbwFf0BQMpEJ0GWD
	FSV7OpoL2KlFmMvPxDTPy3sN3uW7sUnWMhftMfP/vqW2Of3T+SkRbnGv17L45L3vFRu+9/1htOD
	Xj3DRkC1NnM0Yk7SJ4dkvcfqsOVQrb7GKTFuRtnX8xZrpl9qEyuQ==
X-Received: by 2002:a05:600c:34c5:b0:499:cef6:104c with SMTP id 5b1f17b1804b1-49cf823c012mr180608075e9.1.1788776933213;
        Mon, 07 Sep 2026 03:28:53 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d006:ef01:8e86:58dc:206e:83a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm422034945e9.1.2026.09.07.03.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:28:52 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:28:49 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/4] phy: core: Add phy bulk helpers support
Message-ID: <20260907102849.w7yn43x6m3f2rnuj@skbuf>
References: <20260904083709.425893-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083709.425893-1-inochiama@gmail.com>

Hi Inochi,

On Fri, Sep 04, 2026 at 04:37:04PM +0800, Inochi Amaoto wrote:
> As discussed in [1], some drivers may do not care the difference between
> phys. Instead, they only need to treat them as a group and operate them
> together. This means a bulk operation is needed.
> 
> Add some bulk helper functions for phy core by referencing the design of
> clock/reset subsystem. This can relieve the driver owners' life who needs
> to handle many phys, as well as each phy error reporting.
> 
> [1] https://lore.kernel.org/linux-pci/ak9KzNFF26B0Kttz@ashevche-desk.local/
> 
> Changed from v1:
> - https://lore.kernel.org/linux-phy/20260831025319.94886-1-inochiama@gmail.com/
> patch 1:
> 1. Update document.
> patch 2:
> 1. Fix document format.
> 2. Fix several document description.
> patch 3:
> 1. Split into two patches: one for non devm helpers, one for devm helpers.
> 2. All the bulk helper now use unsigned int for counts.
> 3. Fix multiple the while loop statement.
> 4. Rename of_phy_get_parent_count() to of_phy_get_count().
> 5. Fix some 80 line function problems.
> 6. Use PTR_ERR_OR_ZERO() to simplify the error handle.
> 7. Fix zero value in the document
> 8. Use two separate release function for devm helpers.
> 
> Inochi Amaoto (4):
>   phy: core: Add common helper to add phy phandle device link
>   phy: core: Add common helper for get phy phandle by index
>   phy: core: Add phy bulk data helper functions
>   phy: core: Add managed phy bulk data helper functions
> 
>  drivers/phy/phy-core.c  | 700 +++++++++++++++++++++++++++++++++++++---
>  include/linux/phy/phy.h | 186 +++++++++++
>  2 files changed, 850 insertions(+), 36 deletions(-)
> 
> --
> 2.55.0

Please include a user of this API in the next patch submission.
We should avoid, as much as possible, to introduce unused code.

Also, please address Sashiko's feedback (excluding the pre-existing
issues).
