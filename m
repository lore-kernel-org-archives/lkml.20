Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425B256C651
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884403; cv=none; b=RDKcHJJ+1qk+17NZD6mxeGVjNTqDcupuCAL8ie3wXYHPk7iHXztSbyYnb7Rz9kjiqMNG7M8cln2pgioZRJNutBGpbMRhkiv5W0Sf7QeHs3NRK8EpmI+pFpMq0NmAE/rLEuiQjM4jwiE0vR/h+nTXhvil286E4ueKIr2dgrao078=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884403; c=relaxed/simple;
	bh=X/OoX1LRDdQm45XJJkw0SdbbigCXkL5MiOCHI3Hx2vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buaxTySkf/+73yzNNdVEm4S6fr3C2EvGOivgrzK7iKq0wDCp4dVsFkCVbnzblpyEzyaRIxPXeYjaWTM/fVS7mCgZNGlj1S9A9AF6Pb02e6IHm6gMGmVI40O8KnGCszBkXyveLU7ab2MIzI+zIauAXJFtMxPz9SAJf9g/VJQ/ZWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koq7Qrxw; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koq7Qrxw"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso41031715ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884400; x=1789489200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sVQ0vLo+31t/EjL9dyStMFp5X3Ak22HAxZtAG3z1aAs=;
        b=koq7Qrxw2sz3KopT6/poVVEGqjidokbNC2fZOnsgwrz4PlTOHXrn5Pzia9nnKZb0JU
         PUO3YxXDiLPLjUjByOq4gr0h23LWFbp2s494bW/rfwL2DjIiQFZtmmbHGwSDmoGfH3mY
         r754oJai3HFyKZ48bhQrlm9c60fx2r5ddXJfJbAzEuovM2xLp6jB/cT/qdKoVt/u2FGU
         ffLxKCB7eFv+6DSJDFg7kcsw9EYnjGsT+9S9j+d0UfpKZxFBSIzUBsfi12EuG2lbFNvD
         UmiU5cBn5O4FzNWp2F9f/0x6YuIVMu9JedllgAlQ8ixrV/tp7rgSBT4ojCVwniugf+B7
         wYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884400; x=1789489200;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVQ0vLo+31t/EjL9dyStMFp5X3Ak22HAxZtAG3z1aAs=;
        b=pCuCScUnxkyty4JOdfwNJLMy4uYlcwaknOarapg3SNrmxXINEzKMCkmESVFzhlWIn/
         2RCPGvpOQUR2Qj2tcaXnwJYlRMD/nm9VZGIBsvK7bHq1etuRxo/ZsILRYZIp8Jr67b/B
         fbFUuUIWBU41UO//nS2bXpz9HFh72gfxR9YM4VZtwTUbNiIvc37hkU2ODgjdqcFGOgU+
         tMj2DgPhTS2hK9ianPFg7U7XH0dFC/j+k74VGQ/hrVRibh59I1dpKblFuHrNWarN+xiX
         JQ+ssWaFzRjkzhnz5EpETZ3ZAi/a+h7uhJ15ebrEX/C1sMolXDC84I8WhxyxsFL4fpwo
         906w==
X-Forwarded-Encrypted: i=1; AKwUvByUt2irhhuw9Q2XRFdJRUPU0vI/oIkyu3GTnkklaOZv84A1xoynQkEC+oAEZ3F9Trsu7minHyHQeDtqCzs=@vger.kernel.org
X-Gm-Message-State: AFuF++nrgtXUJWz4fDw66zJH5Hz+K1PGxEcg7qaJM0P0+ber58irExon
	dHuv/pWQq0yu1eP72Lzt45jg1UknpTEyvb764fc8Uy0mRXq2KJ/k+lmr
X-Gm-Gg: AYBFou3hQo92VeJ/GvEhHut0oPceTv6rI4imKDVzhwx625UrAOApMoY64ryZRvqzGUd
	+iEaNFdwKYprtRdjw7y7BmTPRhHkyc8mQmzVwjbMvGU1W8sXynbNRUn1tK6I85cD4RL42/NSENT
	YvdIyUfbf4BCsWf4oquEPbUDFmXyQnBQGeJORfsJNu2gkvP8mbC8XeWV4xfBGaMUMoKsQ0/Hx4d
	PMRs/dPgZvIkBFLuQ/KOXFl7EXy22PxT9v/N8QrS5yYXXOc8fymY++cPLqdi1jAenY1MIiKGdmQ
	Ba3lErCIti5iOvKuJrTP7LFX0woFlLMbtYjy7wQxmmLTe9NWnQLd5abxaIRRjoTvo6aXKP6UHfl
	+IpqlfQ4zaYSjTT8QGjIXcuscOr1ZP4j+O/GTcMakvALWNdDHgUwi6L6hGg++eJ2muuDQtAOn4q
	esqKP5hKGuw8OUUoZBAMvZ5Fe5TnQyKeUB0P7hhO9qdl/gKKPNpLkWfUzWvk1ZVwb/Par0SuXoQ
	A==
X-Received: by 2002:a17:90b:33c1:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39b262dfa81mr41629884a91.21.1788884400221;
        Tue, 08 Sep 2026 09:20:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm32856991a91.0.2026.09.08.09.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:19:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:19:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arie Miller <renari@arimil.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus_rog_ryujin) Synchronize HID command and
 report handling
Message-ID: <5476a2a7-77f6-42d4-a276-89f60841d9bf@roeck-us.net>
References: <20260904022129.97896-1-renari@arimil.com>
 <20260904022129.97896-3-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904022129.97896-3-renari@arimil.com>

On Thu, Sep 03, 2026 at 10:21:29PM -0400, Arie Miller wrote:
> rog_ryujin_execute_cmd() holds status_report_request_lock while
> reinitializing a completion, intending to exclude raw-event handling.
> However, rog_ryujin_raw_event() does not acquire the lock when it updates
> the completion. A response can therefore race with reinit_completion() and
> be lost, leaving the command to time out.
> 
> Hold the lock while parsing reports and updating their completions. Use the
> irqsave variants in both paths because raw-event handling may run in
> interrupt context.
> 
> Fixes: ed3e03790c5c ("hwmon: Add driver for ASUS ROG RYUJIN II 360 AIO cooler")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-hwmon/20260812104617.858D01F000E9@smtp.kernel.org/
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>

Applied.

Thanks,
Guenter
