Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA17D3E51CC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109105; cv=pass; b=Ke6SJaHuBoT+a6bWDv0DMG3EfoW1ybzycYeXLiCz41IFvui5HhoakX+OzUpX51XMtM5IVMWSD/lexa0P+E8t2rbSoQLkzHzgInTfp+hitsxpQ1a3X0p3QJ1pdUhAepOmf8SYFUEzp9FQRNtZi54+Ed0qzrRWREG6x8X6OO1Up/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109105; c=relaxed/simple;
	bh=pyQVQX6jKLamp0uCXxk31zCcsl4nBlJoDrluWIu4huc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4/8/yB436HkZzBNcBPWuJCCgLfzbNtaOQFf29Wp+6AxVvIRaDERfIHGRGcxaCiv/SPCu45delWmzpaU+iXwXv/LvVwIKGhpvC8gTHlpt4jBOVJabcSe2aY+oGW1ZA0UNyqENqlxUgZwozDE6ryJKAfEdLG59EZT59M3ztoFEmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0gY6i1Z; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0gY6i1Z"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0cfb33cso322784a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790109088; cv=none;
        d=google.com; s=arc-20260327;
        b=PjhFRfQ5RSObMtAByNzxknUHPtHfWU7x9/cMz1a+S9Sgh7Gm1iIQ0L2l7Ro+PoORE9
         ikPFGvtOBcETj7b7ftCceVm1oD4cN51Y09FDE2MS60jUHCH9t9AiNveCDPKAt75Ehzmf
         4EWro7SG+YtoKditL0prRvEgj1Vf5T4OblCZPSYv7D/ivjS6AouuIKwsdVm2HtF58Gl8
         Cn96OMmp1MhjYOBiRedt/UIYgjMdDzyAdXQpif9OYeG32Db7Z/9hMGX26S8ZvOhfZCBm
         p02sW8OdWFHR3c10A8/Z7pc802+BE+I0+ThVDw3YB1N/AIlFfAqoZE8TCvJQNF7KvoM6
         4KZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pyQVQX6jKLamp0uCXxk31zCcsl4nBlJoDrluWIu4huc=;
        fh=Wx7uIB9x+iJPYWTNPMIpsmmN80ojxcdhqao3JKXNJAY=;
        b=Fvrw8Wbt2vyRclsRSFrwpLavT7oBfrZAm1inCYt7djYKE49yCjAFZC3dcZh6DxQLW6
         RO066iuRlxx9XbcEnJj5kfx+nqMueaZCjRcYAHJjda0XzojxAdVu+S/+/d+A+CCbb58U
         hIWzIDsaKeopUN69sa16XsZS+lRE4ei0SMvBolQpQbgsfGZXr1LrJRiAtk/OEHRTkQQ5
         wY8CKRLZYCB2P5vdrBRoUIP13QdFX1hVIN0dEHMNh+emFKk3XuCCUWGMFhU6KgxnuzR5
         jczXvAa62IvLo857yjg6Ja66RWFsEChstzCfi54Hqfjxr2CZMTJ96S/nbTI294uJ8WJM
         BGmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790109088; x=1790713888; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pyQVQX6jKLamp0uCXxk31zCcsl4nBlJoDrluWIu4huc=;
        b=W0gY6i1ZQGKY1GhTGAYJT1Zysmc6u4VOq4inZtEwpVPrSt3tcJJGzZpmHOE4DdRM0Z
         OeoGLxhhHimmDgtdjmOjT6J2nrLUUZawwRD1XveaYcNuEL1YzGAaqRrDFPX6f+6b5eI2
         x0nia3j+mwbHL0cNzDNb4wcQ5RWdI3z/QHotHzlWZRuL5g69V54X78cGb8iT0/YnTh3G
         QzgqUAT3ZrzvRJsyUOtajzC8SnCZGq/TLNDLoN6HfzGGHvxngUUNW7gzEHqvELMIa3wC
         7X0CJYACHIHDjFZ59YVV60l0P8gsG+qMhu3AdCo7iijJtIkJSQV0cl8FVIelnLONwblg
         iF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109088; x=1790713888;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pyQVQX6jKLamp0uCXxk31zCcsl4nBlJoDrluWIu4huc=;
        b=mSbCBRCYUpGNb3+DceteUZcSKXuB0omaIAEyWHCXz1e3b7WjxpRV3+Cs7AroCgqo6Y
         Y8ylNMq0Ckbmpf3PVPc1orKMY13ieq8etjx5LIg/x9Ufeye2BCQAuoWimu6MCwk2AiH2
         MhHEgad72uk0OcMaX3TaufNQ0CKxHx8M5902WQB/wIyAwpspF9z/IcdxJSiI9xgvNzmz
         M5S/l1X7teGW0IsoLA5/AHaqpOZmFEqJXIpact4d52LPqExpDDHaqAUBly3pZKZOPQf+
         o2eg28Nw7W1nl3ly5iWFIfLRqQIOUOY4Zi6RSUkfPJCfBqBnC+fciodfKNzsRPMnYra3
         F0aA==
X-Forwarded-Encrypted: i=1; AKwUvBxVPcV1i8THEXSvQGGr1FV3lormxTX6XsKsr8zdtjzew8MxhqNP3cu9VL+fAgac6L1D83gNSLjFgrTfops=@vger.kernel.org
X-Gm-Message-State: AFuF++nkSlldpQlclXjSE1vV0alijv0gfXqStFgCpRobQH7x2R0PTCNm
	ajHSCt/YZfi5A5NFIYMf2mD/h9qglBc6ZeW4w4t4mn3B0Kyou114P4btMFLZUU+n780H0GZ0xGG
	wqjWPjLGGlUAE9CmFku3XFjRELY5c3ko=
X-Gm-Gg: AYBFou3PBFOr+7cfEDSKS/vC1WJ5n860RJ9rPLG/NcMxSKn/g92rzLkW8Qcdd4Nd9SZ
	fW3p6tjwBTT8GXLu9bUxHOr9YKElXB7GLsbAfP771WYDfmXYHckoI1CBm5Btt6KOCyHSjsHP6o/
	FQ+MBbpUDUCT5GLbi7OTXlMQKZyXscwkd5N0v6LG22dAGzustUlOuxVhHnULEWNuYXQSHaQVt4M
	SYVs2hkbrQgzOHNE//G2v9lqIuntrfXOSWB466njXr5So7I7FALtB8bXIxOOTnM/6CbujbpyiYj
	qixVJ5o9aWb5Rn3YCQJ/3GitGBUKkJFAmF4UQdE2hlW6hRCoe1F4wBtxlGtEV82W8gbcxFuDICj
	o1Y66M6bkhA==
X-Received: by 2002:a05:6830:4109:b0:80c:d34f:5f5f with SMTP id
 46e09a7af769-815f242b7e1mr808405a34.24.1790109088330; Tue, 22 Sep 2026
 13:31:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920194710.1114748-1-devnexen@gmail.com> <20260920194710.1114748-2-devnexen@gmail.com>
 <arKF7P9gqq7ehX-k@sgarzare-redhat>
In-Reply-To: <arKF7P9gqq7ehX-k@sgarzare-redhat>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 22 Sep 2026 21:31:17 +0100
X-Gm-Features: AcwNN1XSk4_n-Pw8whwf_qkZon5EH5z4YSuf40SxLSGrNh11a3Xo3EAHx4U9uBs
Message-ID: <CA+XhMqwsoW1xyq+URGSuTrwnPo2CR5297bskaAsgHfMyyPPSPQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] vsock: report pending receive data to io_uring
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,

> Maybe this can go in util.c/h
Sure.

> nit: can you add uring or something like that in the function name
Ack.

> Should we avoid to fail if it isn't supported and just skip the test?
Yes, will skip.

> Why we need this barrier?
That one is not needed, I will drop it. The others might stay; an early peer
close makes the hint report EOF.

Cheers.
