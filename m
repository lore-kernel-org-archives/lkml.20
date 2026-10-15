Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855D7352C3C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046613; cv=none; b=jkoEdmx4MAPhTAOze+aWx6flushiNeF464giu4egdHCy2CtChuIvjRiLDfVU3JwMFXQ008ngSfILitTZuvuSa99gRUyF7Te47haJoY5VGpGv/rIi2uwq7PG+CMapekM1BQ7Gfwl1CLFU4DQYr1L8ZUeIEzZCWScExzyoIjDGkdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046613; c=relaxed/simple;
	bh=qOA/xUacaZA7l0HoyLxMMeKlT+LZBqaY+qyIU4aSfHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FClMrKfzww290Uw/muwYbrFJwE3r0zLVIY+yq5Ask7z0O98UvjW+D4X5r5VgMDwWMAegovQtWKEgVUgeFGhSsHam8e9XepprIalzfE9nO/Mo1l9075lexZMWqo6OFRGzxDvU7wiru+k1fhec7cCF1f6uJbnkEIkFqo982CA1ago=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH70Fai6; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH70Fai6"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso775424a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792046612; x=1792651412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOA/xUacaZA7l0HoyLxMMeKlT+LZBqaY+qyIU4aSfHM=;
        b=SH70Fai6u1lWskNS+lieOfSGENiUkyzZQPeCipCFoRCew6RCZLsRr+KI0zLRczOF5M
         26R22XbyVpmptk39w4u/HslkAGtRy5NTg1GntOvMpWZIvfG2ABDxy5ykzE3ANmxHo20q
         RqgeOgrb1L53Q7CvWPSOOFN8zS7TXQ+2WfC8TYo8aOEb9tGh2t6kDGXe86lD7xMv+x8m
         IQPBj4vUVgK0kPZz2eu7hvTROSWG4WRqFgujlilaYmroyxFDRomiG8XOum78sVyAyZ/1
         STrdYM9MI5XeaBxQEjacY3JM5jny4/hYNUYqNlaVyhbIF7E2HnQAbucxycvfrOfaplzD
         zcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792046612; x=1792651412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qOA/xUacaZA7l0HoyLxMMeKlT+LZBqaY+qyIU4aSfHM=;
        b=cT1Gbgg7L76cO0nBzOpwfwPwM4vfHvXy5Al7m8dIx+DUAH+3b836G5c7FLxvTV3GA1
         YN4gdvi1P7Muzv0N/ivzG8xU7cxRSt0UBiB4T0C0UzWXMaoVqNAHn+ccPEMA+fXxk0BQ
         etp2WXuX4TfYh5fv7Vvt+TiLDLOG1/6LjNecDE0d6OlfdimELBEkqxJ2+TH6Evf9GzhS
         Y2q5fqAVDUOpmdzMyRNA0BGlWdmI/roF9O8+V8rpruBaiXgV1RoGLoU/bAIQxHMSqpwg
         R+2/gFJqFbZlEifZKEzSru0TMxfkPMptRHHH+WudmJKfJYSAwWgUyg/MdcV1jDZlfEJn
         ZKNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwW8YyHwiipaHvJVMAsavYjzxn1eXFL0MrEJ7O2Nkc5OO1+n1TvTXOtWvmovWeis46m49fKGwt9/tsjDAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+B8SQIMkvXrL9cfkERK9Q/4LH8/blTJHztL3fXFzTwrOEEWfH
	cB8TrR1G+ofllpRkFKzFAF500FYTKlJ78Cbo+K2wZ7bJ/wiZT5ogfYqlNQ8IzA==
X-Gm-Gg: AYBFou0uYD6vvEHz/RaqFHRfrg/36smVCD7wxAhDpDfbPiGiRyxNQqPUoEekUCg6wOo
	ZG405tR6ILrooUnrvLiKh7NCBhDMrnMG/sIohJ731hhpuP9YjiEIPRqn7mXi1WO2laowlHTQr71
	xoeza77Cve5YsI3++mLneJMGqWkOaiyGAG692Xy8yCaAo140AwSKGGWHXVu4t1sEgbS4iDXVtO8
	qp6gSMlL3HY4TNWG2pr0ZbCgVWnICn9wbXlQbMsosLXsxHwzCZXcwH+ePPCauhWnywQUE4fDh7k
	agplDj02mMRWy3lGtiBQCBwF6ds0OqGJCrA3VARdoTU2114zGPCFxYbQ7IlHsLobt5M0VVVnbvt
	vmZmf1xOGnxGPWEgLX+3DwViM7gsAjrCg/gS4zpPkWAn2lVOOFQOT9vHcEykEASx2n31tax6Qr2
	Flzz44h8rmEho7teLx7C6s5SEZxF1vocXjiwe55eLcvVaid6V1iixhKMDa2GjOVc1ZOUWv8h3K/
	JHIbA4iXx/pM9QqR2RvZTvYpgyDWvXt
X-Received: by 2002:a17:90a:748:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3ab5758493dmr9838058a91.61.1792046611747;
        Wed, 14 Oct 2026 23:43:31 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9437a82esm2966954a91.1.2026.10.14.23.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:43:31 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sahaj Chaudhari <sahaj123.sc@gmail.com>
Subject: Re: [PATCH v2] spi: omap2-mcspi: handle DMA setup failures
Date: Thu, 15 Oct 2026 12:14:11 +0530
Message-ID: <20261015064411.1101418-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <eadae021-6d1f-4b40-a100-2d04503e5c1c@sirena.org.uk>
References: <20261014045617.2894886-1-sahaj123.sc@gmail.com> <eadae021-6d1f-4b40-a100-2d04503e5c1c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2026 at 01:01:00PM +0000, Mark Brown wrote:
> This doesn't apply against current code (spi for-7.4), please check and
> resend.

Thanks. Rebased onto spi for-7.4 (d947a8049809) and resent as v3:
https://lore.kernel.org/r/20261015064341.1100422-1-sahaj123.sc@gmail.com
