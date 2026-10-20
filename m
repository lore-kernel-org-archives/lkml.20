Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459811;
	b=kTEflf+yL/0v6pHvSr47yPAJCRGUX3zqygPzU2q/6nl0VO1shSjO7f+C6jE18oGxiK5f
	 JvARPW9+umq/zSSHJFtzWedz/VXx61M/+BcDomOojo7qfFFYxPVTtDZ+Zf0E2ctv5OIKs
	 ezscf4LVtd8CfJ1RWJA1nMahWF/HM0YOHsmzawLolVr9sPB16aWVNAIWJRiOVPyX43wwN
	 CDJ0CRskb1MFyZqjiSryWheG9SYPDIWIFStRELLANeAv6+hJkTJU5T0EVCaRDj/BZm7Bq
	 NBKpQyKQqr7KbJ7Edn57tobw4IoFv4IUjxyJyTYI3thmxUH087tynsd1XKZFyF2ELuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459811;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7Af+RPa3PQp3TIs1vVo1EcyEwOshHo6n8i17uK1CVHU=;
	b=UTe6uJNKDszfitsOtkm/X/fI+TUDi5Wm24ETZQo7sj+5aaMKsb2qiWhJtsZBmXc1l5JF
	 WlebWspa5AKwEb44gZt08cQS/9WarqOELzsf3HYdn2znXF2VqkUF2uPkEIqrDPEm7SGs7
	 qzOaCTeqTqb/c37HOAFmGQ8PFERJM8gyOZ9ZOZgtLdjCTpGqReDP6skXzW78RUgjffMjs
	 Kca/LfGMnmc5W0nZoGt1s7RCbCqFCo4MIe5DD7n+hol/beMFYn0B25H7pecF/02xRHHWM
	 MWlCYZ0FFW7U4UXq8xsmAHfsYi1pa41OoAb6C/AapFELdWRLn2/qorsN4qCLSzmSc+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bo53qR89;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34E5606A32F;
	Tue, 20 Oct 2026 01:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bo53qR89
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B6A1F000C6;
	Tue, 20 Oct 2026 01:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792459811;
	bh=7Af+RPa3PQp3TIs1vVo1EcyEwOshHo6n8i17uK1CVHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bo53qR89W67RWwieXr47Y1Q8T+lmGndFH3uyaDfysN7dPto2gdrZ0i6wcvkWkmeAT
	 ztdxrEhVVYOWUk3G6koerZ3QXR2e7vuHuWEOv8dwhgEk0b7HdgIcdFw6IdwQYmOZMR
	 e/+J6PwU42bq2ULuc5jKq2V9bbsMWr1tidSI/5HQ+KoPALFLV/FaqXXP0ZP7BG+ZDt
	 HUPH5yfLlyeTcw/eeqKWcH9spwk+0b7d90a6pxBUyJU+aSsZaAe6Co9QsF/pH5sUkG
	 e6JInHp+eMSTNf4K5XfWiI94nuZLoEbHr04Us/wp5mwr+wkDOOpX63mzPZuYpp4VuY
	 Ppcm7GtMgDDEA==
Date: Tue, 20 Oct 2026 01:30:08 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Satyam Gupta <sgsatyam@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Scott Collyer <scollyer@google.com>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/6] platform/chrome: cros_ec_sensorhub: Timestamp
 wrap and drift filter fixes
Message-ID: <atbEIOCk16-Z15Kf@google.com>
References: <20261014074306.2500909-1-sgsatyam@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014074306.2500909-1-sgsatyam@google.com>

On Wed, Oct 14, 2026 at 07:43:00AM +0000, Satyam Gupta wrote:
> Changes in v5:
> - Split the clock drift estimation changes into 5 separate patches and
>   include "platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap" in the
>   same 6-patch series as requested by Tzung-Bi Shih.
> - Squash the MAX_DRIFT_PPM = 5000LL update directly into patch 3/6.
> - Drop unrelated whitespace changes in cros_ec_sensorhub.c in patch 1/6.

It seems the issues raised on v4 haven't been addressed.  I'll stop
reviewing v5.
