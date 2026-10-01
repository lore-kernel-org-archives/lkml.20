Received: from mail-oi2-f7.google.com (mail-oi2-f7.google.com [74.125.231.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE404DAFB5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.199
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855822; cv=pass; b=j4LZC6epDXKXhJj/nSXhMF17LCqRCg3lsBwe+IPovvIqvMauFawm4S0yK+OmoqcL1Ep/OqINPPjHD2xL1w6D8cyvHY3lqtowR4PODVQhQwPLpnaZE1dv5fz3xROi+ReoKDYUza8/mAWXhjh/Xho+kd6nOQUXuZahkWBqXo8nGNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855822; c=relaxed/simple;
	bh=Y+tEtnQzS5pdOb7X/5WJzbpmudgE/kqYUx9jMaDlfOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qh+MXVY9xu866a5ccowv02EZbmrMJwBHSznuuNziBz/+Wzrf6LhnAgIZgAFfgkv4mEpny0u8akmPY26tfRqgNTo4qLeHlJB3o8SEvMU7049boZfBL6TJ/PLR9h7ByqLfUaGk2+noFmVHwkxoGEjsjL2c79e5CXtJF8kQvCwiFZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHMXbwfU; arc=pass smtp.client-ip=74.125.231.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHMXbwfU"
Received: by mail-oi2-f7.google.com with SMTP id 5614622812f47-4b39374fab5so2023421b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790855815; cv=none;
        d=google.com; s=arc-20260327;
        b=Sc1XBdt8wjyKq+ymEuyq+WTHmaMxC6Cm8+M5nVhtquTfjb/GKsW9ENmfuePtuPzBsh
         muj3vgWZDKeenkW48N5Hvr0KrzNW77vbTMUd/rjXZ5vIEju1jxBy9gF4ZImMDCbTL+tK
         As5gMXOzCK0eLgG5aHKgHAIi5sA1ouhRjnk63top+p8XZBWPsXo8rDShhqiJpSyLYcHC
         QFW2/gcnAPJfHlJHj7kszX0WkfSPrFqrpgoawejz2Dy/sfm4BKApWDUYm2Lw3h7AK09h
         QpPIZ3ondxazjtAZOuZ1sEgSWCQKF5tXKRxKzOrtUl0PGwqotIlodFwn9awcz4mCjX/1
         KZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y+tEtnQzS5pdOb7X/5WJzbpmudgE/kqYUx9jMaDlfOk=;
        fh=FAHY3X3Y3I3yodi/FjYnwAy5xP4ax+hsDIpNAi7ifV8=;
        b=OELi0I+S2LeXGXtu6ZodkPdbGjofFMzZnTpBiaNzXB4zGMGjVAY/BSfA6IlUfkIS9m
         KiFHiTFm1WgbroBjo/yahJSDTCVrNpeZmdo2ZCpPDZ5tkS1TBkQc0uRYfQDJ0KuLm2ZX
         UcIcGmn+526qxK6zrnM/jc3fy3fMxLQmc1b0agUKyINoFDJX1CCr/DxAAlBkXxP/O9pR
         oZQF6gNhAxHs0s0VxAGcmwjdDBvvPt4cc1aipFZIM3w5lN20DbB7NO0bukkg51Era+u1
         yNYTtIQRiS9Nv/aXZIka8fgBj8roPv+ITUIXgEMK+37wxxYaDXm5lf2Eiqi9Ryw6aP4t
         UBVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855815; x=1791460615; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+tEtnQzS5pdOb7X/5WJzbpmudgE/kqYUx9jMaDlfOk=;
        b=QHMXbwfUVU4aZXY/r+NsW0XImAryb/KaQ8SHPU5h4lizXJRcS2ciEGTZ1a92BfIwq9
         BlolDaek7NhjIdPQlQ+9TW3YP+0QqiDFqxpUteoQcUOls44ceXqsXtVF4qzLEOmLqTtc
         g3yrYeOZTHTnpoSgT8R0g9YVpVIa5tFl7nJP1u7XsWGpIvP6mhdtxFasChkuWwUi5d+Y
         3ahqeXKo8bKBR0iOk9YNuh9C7HsOVL6GL7omi7bdIDsnvesnKbGWX8n7GxJBzoZljOtW
         Cc6gXTReQutZHaMc2YbPWdlzdqiS4RN98txguPkLuuPamIyUg8P3GZMArYmVdG7MOOcy
         vZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855815; x=1791460615;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y+tEtnQzS5pdOb7X/5WJzbpmudgE/kqYUx9jMaDlfOk=;
        b=2Zpnrg/RCOe3YhPXRc6sxvL/cjEUAiPD1F+b0H/3yLXCTUIqbHlBRR7R2A5IIeolOK
         XHXw4w3CKByATCIPznYWjjK7VcTyD7QeM5jOJMcsB5aRWKjjjunAdJ7SXUCkEOkImqML
         3LiOg7hYVjMAKhb7JXoh2lrvAGhgCBYXMD3rZ5RPCutoHnVOeU7bfqOHTre2XJoQlfnL
         Xlss3ZAgml8LGyTv2YwHRC+KMr6pXLC7BFigYECoYL4ZtLcrB9jVq9bVhLH3KzwCjTbv
         +GhBB1Gyy+5gHeKfFKzu4H8dM7/D5ujFxz5vYbw+HJpc373bGOfrWkrAYSH4rbprQ68E
         cZMg==
X-Forwarded-Encrypted: i=1; AKwUvBxiDcBgohkg4TLW+SjXeH1XSKJ3BxugsZeurxv6KUWjEP1DJt0eTXx54eeoAt1R25KQPm027i4aQ05lTWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lsWy70sRGpwcf5tnH6NDQrH3o46ySAnjaG5yhgPpgiRh11JCZZ
	BrQhfOAgqCPU4DhFcGrxTtHNPY2UYhqPdYQ+gWixchbahs8UMJsIv2O2RPLayG49WhqtUWYpyJR
	rDAdfGJ3Sdomo+ea8uN2ky5CiMQm8qRI=
X-Gm-Gg: AYBFou14sLn8lXkeaHwfJKqYWVlUpS6J3NwOylAz3jnfRLZDcxdJEyIGHhwDbhUV69X
	RR9cke7kdC8xKBTGKbykgajqE9rFmZUGtgPPiZSOY2VumOLosim6WoXsjXrltG/1QZTe/vv5Rpf
	ZN7wPYY+iyF/L1aV8SZgQvmgd5STUH8HqyCUIgLXijKOnVa5OnybogU9ZvT8rDc7KY7NanIWEXI
	64xqAHJDt4i6vCXcQU4+DcclrLUawFAnDXEIx9uWlsWy2O+p/IPHlM3ywZFmdVVnL71sSdApRWB
	MQRvmSj2RJ2FahZ5BRnrXu0VQD0nem7FrFD8lIezMa30K9nHLAZLAYl5OQxhVMr+27tEXbJHd+9
	XcGtIqpo2iZdnAT4=
X-Received: by 2002:a05:6808:c194:b0:4d6:93c3:1aef with SMTP id
 5614622812f47-4f1b7e044efmr5667033b6e.58.1790855814672; Thu, 01 Oct 2026
 04:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001100319.6228-1-dennylin0707@gmail.com> <2026100153-barber-financial-29f4@gregkh>
In-Reply-To: <2026100153-barber-financial-29f4@gregkh>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 1 Oct 2026 04:56:43 -0700
X-Gm-Features: AclHuK8rLBMsJtiKPmc67dCARhCBIiOvVaJT7B67MBAw-F65lmlRrAuW0I1lNKo
Message-ID: <CAGEkeHcpZeHhpF2omgRx1wgLRxVoJJ90H-1t8FEJohMr_59b6Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: use errno in rtw_register_tx_alive()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Why are we returning success if there is an error?

The original _FAIL means the firmware is not ready for TX yet.
XMIT_ALIVE has already been set, and the buffers stay queued.
cpwm_int_hdl() uses that bit to wake the TX thread once the power
state reaches S2.

_SUCCESS here lets rtw_xmit_thread() go back to waiting on xmit_comp.
Returning -EAGAIN instead would stop the thread.

I should have explained this in the commit message. Would handling
-EAGAIN explicitly here, with a comment explaining the retry, be
appropriate?

Thanks,
Hungyu Lin
