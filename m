Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735352;
	b=bsznNDMJ4F5peN0UQkOgzW8BrRZm3oGRxoJCrggTumDnAC7oS6l9OU3HXSV4eoiBIgkt
	 e0Hs68a4sR5T8C+UQv/jkz2qTv1+gYhhqXBOX9nw4N3INeTytcY8eZBYFNOuCTdZLCOXN
	 b0lL/qaqL3PZQt01ta7gr+HU1ynyVDHYnMeum0/4aJnqR8kUCH0vY9sBPOhTC6rp3z52T
	 c/7bSZo74K+JDILPgmWnEG3iOu2PHyrJK3VuPi9JLER63eDkDiGZQ6cEKudnNQR8H7SCV
	 emgxqsNRcBgryE9OOoLUci/MuY3Is4hNL0wSemjbnc7Xo76xwbdJa/d9DIwY9sq6kMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=P0AC+ymgXYnQmZ+rTAXF3fAS8FaKmkjFTCnbuMJ/sUM=;
	b=j18h9pmr4P34NoKYCjZaNmhx7lSdTJqCmW9fmNxk3ysQokB4TmpHPgVbvOuTkw5u5vQ/
	 DC5J2sIHagWGhsOZJ25u3H7t8cl4/ftV6US84v0Ep4CEd1Ln0VhrQ2Ra3w5OXJXk/tDmq
	 B7Tmx5YfnquSE2qCJ4cTqmNEzR+zeTMUuUU/7bNfLW9HSNLBJmQpK9csflnw6fZB3XEBl
	 IhXf5X8plgOBG7S6i1M6s+tFuU5CoKosUW37S2Am/EXSnD5mcAOYwEM9bZyyaI1JHCtqZ
	 zdKSyNJJQsAXdq5+3Ki9YdEM74KaEOv12wO4j9sGXXsEinoMzXgoZC642wCi2kdY/Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aGZ2Et9X;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CC0606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7CC0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aGZ2Et9X
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5129542eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793735351; x=1794340151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P0AC+ymgXYnQmZ+rTAXF3fAS8FaKmkjFTCnbuMJ/sUM=;
        b=aGZ2Et9XRSoW7cbdfG5lGqV1+6xNkMS1R5B1w4VS3Ui4cwG+dA7ZizFdMHeq/+0/U2
         BilbKO1Fm20PtDD+HMuAm41zwNmvgYD1/eu5ZYOqs0KvvAzMehsm4uvfUZwfY7oaLBib
         FeozBa5ngKAi8pE181aL5qQbAJrKKuOySBVyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735351; x=1794340151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0AC+ymgXYnQmZ+rTAXF3fAS8FaKmkjFTCnbuMJ/sUM=;
        b=H+VpATa5Z9avDiIP9Lcni1SOHqQBf7r/7cMFhj8w4xzBBQ+EL1y591OJvCxb5euT1M
         OzWkjldSPd9wZTGgmJ3ZXbTNratG1eHaZDmMqcz8ig2uBsRakYVsP8/mLRl7iCaRFGWg
         B8vnZusLWCTzcWUgsB0J+CMzUg4jrtYHKYXXIUtUeCtHfbsiUIooU+E+N4maBW734NhI
         SjMvujQIL1tKpnly9G6dRJ2qfuBkAfr2SY9YfvBggssQZTdl5JXFoGL5jG2OlxebHMWn
         /qtLKW71bb9g0vB764ehu/sT81YrGi1wzrVpquD5+P8dNwHv/LjT/2mg0vy7g33aJQ8l
         Ynxw==
X-Forwarded-Encrypted: i=1; AKwUvBwofdmjqLcc5o1+pZ582l1PyO8pf3PshBSi9eFYy32F3hdf+aZwoWB0QTOnBOrWzqadJsXK1o/TWDw13/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mz5CFFSH9Jbu8YTXh90ezHg2tevUkv8rKMNkLnLIg+YxFf3cW
	MS2PYfwoCK0DiOosrxGbNkNdXRRRKjDYYxwGAFsWJrTwiQr089m5WhBQON6iaVmk8Zz3EV4uGPj
	SJkM=
X-Gm-Gg: AYBFou2vY6wKdp2HZ8EcFHFkBdNex5TQdqLVRpaexupvh+TCeBLJATU7af/adRD7/SH
	AbcakDxxL94GuWymdQ8QOj3wHf1FFuaMEYl5ZPrZ03f3jU8vmKbQdEfU+5G2PKQOrGCwYIKtKO8
	BfuEme/fzxEgd0fsu33081+8lF8FrlEsj8LCJGny4ux6DQfPviU9BJzkgFmK7vGqoX53+RpxUWC
	KsR0LPwI8aTb2U65SnIWdrOx11xXJWAzZ/l5Qb8HysfYJE1bn9LLg0Kix+9rMM3bCFV2wPfT0uR
	uTmrhh88JxqmZ30X0AkA+8J0nu2o9dI4M4Wleh4yR7kMW8Y5G2SW9U1TXW+0EcKXO5OjKIzSNdL
	Voc3wqi89plifJ7iPGkslDPlAadA9rjhsm1/Ph7cAQGcEXppD9o0TEIYjx31MsEy35zrVbPsiVo
	boZUh7bxssVCem9cKGjT/jZDgZyipDb3q6Nvs5lWd69pHS5ZJxBw+YZoL3jo4lOBd5HrO+U9F8X
	u0DtV2CD87eEgUi+yqlf+ashaQwNylo+9yS33pu8VN1GH+K/Q4MgkiG3W4HDpwKhiQpVe7HmHzq
	t7Z5W3Bk/D0TjYFerbly/YlPFK5Ut95UHqYKDNTjTJn2dbkNZFg3cBBjamFghgbCYSEU
X-Received: by 2002:a05:7301:4203:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-36a50f4ef92mr16355856eec.25.1793735350827;
        Tue, 03 Nov 2026 11:49:10 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36ca38a54ccsm382104eec.4.2026.11.03.11.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 11:49:10 -0800 (PST)
Date: Tue, 3 Nov 2026 11:49:08 -0800
From: Brian Norris <briannorris@chromium.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Stanley Jhu <stanleyjhu@google.com>, Jens Axboe <axboe@kernel.dk>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Alan Stern <stern@rowland.harvard.edu>, linux-block@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] block: Keep RPM_ACTIVE in blk_pre_runtime_resume() when
 already active
Message-ID: <auo6tLmH0R4_TRG6@google.com>
References: <20261029040001.2100001-1-stanleyjhu@google.com>
 <8125a75a-ea47-49f8-90e4-7f7c83db90e2@acm.org>
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
In-Reply-To: <8125a75a-ea47-49f8-90e4-7f7c83db90e2@acm.org>

Hi Bart,

On Thu, Oct 29, 2026 at 09:22:23AM -0700, Bart Van Assche wrote:
> On 10/29/26 12:08 AM, Stanley Jhu wrote:
> > 2. The first runtime resume fails in the driver callback, and
> >     blk_post_runtime_resume() sets q->rpm_status to RPM_ACTIVE and calls
> >     blk_clear_pm_only(), decrementing q->pm_only from 1 to 0 so recovery
> >     commands can enter the queue (intended since
> >     commit 6e1fcab00a23 ("scsi: block: pm: Always set request queue
> >     runtime active in blk_post_runtime_resume()")).
> 
> q->rpm_status should be changed back to RPM_SUSPENDED if a runtime
> resume fails. The changes made my this patch don't look right to me.

Pardon me if I'm misreading/misunderstanding, but I believe your
suggestion is essentially to unwind the quoted commit 6e1fcab00a23,
which might reintroduce a deadlock.

Brian
