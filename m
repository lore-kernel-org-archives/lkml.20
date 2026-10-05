Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F7848125E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205796; cv=none; b=nCb9Mn2zNcwshrMTqGJOvBGKW4PpIDfmzjpZ8xs4ofY6gQSBIcHCD3B6X/sXMAhrSQogqMFUbqszukCEtk22hklB3KdSaXYJTJMfZp6p+aOPgW0ljtqYVXLtaQ2TYaWYoR/rsthVik/pvk8gvMz+ErXlf7WBm4cwSXItIAIYWkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205796; c=relaxed/simple;
	bh=eoF04e7AXzXrtoHA5vbEeVEWVJAtxGhk82/yPBy1wzY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mhxi5dHDj8Zg3KoFgS5snULvDxPzoa7TPzKlGct51AbkqpsrEV0mjXI4s+VqpDHKDHbmzerWBumBjPKvogqd2cWxIFmw1fkIrvNv7YkUlL3F3bl4OjCMWvqoOz8DTFnDy/9gkLdvUPwSMMRhxwTxQcO3TbPgchrOBJPAfMffhtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOqe364O; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOqe364O"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b9d8056d2so971735f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791205793; x=1791810593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ck/YSmwX+BAU8aauMUDi1gthqNGVLuO2QlzjEMLfeNg=;
        b=KOqe364OWGyyi3FmB4T4oenpfXYZ5MiOUa61Jz3tXAJpUuKYOodV7PJIPKIptSMpXR
         oTc1AsvNXGqdbe9VHi5yXb8Wa3hbuu/A+C18h60zbjO8PZEYtOdEEuLdFq6KyCe3A0sM
         ACSArm0h305Ubopm4KEHI2azuzliyVqnMmr5Df0gJWNxVH7IzxGnXNYahxBDrlThPnLE
         jqcjMXRJZ8Qm2DoN7HpqDQeo9h6js6fcLBOXhFV0VsWVBGFKXk1KUGGw3/evdPxGd/gZ
         oi0MzLb5dQSd9mf4fUNpeV+0jeY7PxNLNwx81tcjz0JV0OyzixXk5VXDROz1lEDionGo
         qEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205793; x=1791810593;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ck/YSmwX+BAU8aauMUDi1gthqNGVLuO2QlzjEMLfeNg=;
        b=Y8NcIrG8Z9rhuXs6vCAjBL1nBTZEv1E07M/vIf2/M3hXEcYho8YSCNi4pc8OHFp632
         988bAwRgu3XhDNOW8GyHxUuEXXlYQRGEXpZOhoMOtdgG0xVEv2oim6Dvl0OnvLe8aiKX
         ZT2A8YXo0sNAKkrWdFhNXDdjaZcag7jFa1g4liVnUoIvkS+reDtWz8PwMBIDBq6Vx3SN
         P1CCzezuO8sgkZOwo7+J5+w5Ei7KhbTNs5BCwjmn/9DPZa5GVNFmshAr4izR5uZFW+gg
         SMZy+WwKkyuQSmLUcbsJkC9biY7Vz/wYi3+V/WAgasQtOR/tuloDiz5vs0gBq0ZeXefd
         PjdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/xHfzAQyV9wwKn7L7l3Ywux/4Z2Sd97cNOQLkL6q4iAr3rfebOwZQFF5E4RK03WDfFowZZCHnoODshwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJNAdu+QVUgZ0kvfCIpLgKhCa4m0at2z1t8JSMIlS5gQwitKD2
	DpSw5kkz/+fvXsWMtKhVWynfrKuA6EOLPKC7lJ04ZvEqCmgEC1EX7mEU
X-Gm-Gg: AYBFou0wqjj3nJri2aM7FQEXvet0hXKgJaRwwMvrwBEvscxqTXqyOVgbi23Vdhf51yS
	lk3jWtKAtN4tsaGTIRPo7s8HiXCaOfSb5c1HF+RHav91YApExstjsY1l4UzXaA7vBn4tOaSx+wY
	pIGlSUcYYDitoU7VNJVwqc5oAQOkEoqiL5QemnkCElVZb96LrDuESJdPDf5eB6Dodxo1BlMh6xk
	tlmVwPrrhyAtaCMafBQ8H/krmC94gtTWicFqLiwnVUVd1lbeQZeWr6UUeC0ep8T/pKNH0vLJ6Qt
	G4x0Y1oWLX4WPbTbxeTjwSLu9hCUJ2wP53mDGgUgtqj303Q5izb7o3ab1OeI+friqe15Imud4AA
	CibxjKT1hyhUGq71++fN/O2JNnV41+/lmjdkaDbMGkzh9PcDAlgpcKLersY4OFRVDkY8NyrmLrk
	gAOqKdbOF0j3GEWKwLuhVJQxdxarI7CByRkJaS+MNWRGiYLUvoVXJ5qLqsG8g0JIhf9eq3fzEaV
	fzFHfeQjmxPxvlQ1btT9OJvPqTiLSYizdQp9zPpeK7zUSsLZrZ2ufmqyzAmH4Prbu4v3q4N+TO3
	IQLRqp9T725/dL3ughFUnt6q9q9FtKaDSsLh+FBxzTgbI1LQrhNK7+BTRDWZIg+jaUMKLSjENA6
	2oDXfzZSH+S9psWM3mwx5j4PNz8XaqaOMinsSlAqQ/H94vjxIK1yRN3YPM2AMVTh4eXtTWVkXsV
	Tc07CR7ErgoayDHyI=
X-Received: by 2002:a5d:64ca:0:b0:488:83f7:6352 with SMTP id ffacd0b85a97d-48b126f542emr19074352f8f.4.1791205793268;
        Mon, 05 Oct 2026 06:09:53 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6228d716sm3851685f8f.24.2026.10.05.06.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:09:53 -0700 (PDT)
Date: Mon, 5 Oct 2026 15:09:37 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v4 10/15] iio: adc: xilinx-xadc: Add clarifying comments
Message-ID: <20261005150937.000044b6@gmail.com>
In-Reply-To: <20261005094205.1045874-11-dileepkumar.nagavarapu@amd.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
	<20261005094205.1045874-11-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Oct 2026 15:12:00 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> Add missing comments on struct mutex and spinlock_t in struct xadc
> (per checkpatch.pl), and explain the non-obvious FIFO-drain loop and
> Zynq alarm-bit reordering logic.
> 
> No functional change intended.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
> ---

LGTM.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
