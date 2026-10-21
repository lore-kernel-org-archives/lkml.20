Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553596;
	b=Ebsnblpv2F6qnQaUElvV9tYZWLPf+tgrBVXVVNQo4mQ0eM8PoM79TP28sBQi1/LyHfPo
	 C8KuJlD69wFMsY/zmoJ760wZ3cGGF33jNWu/veURwdlpw6NRWSLiri/KHlyAXcgcNBr4q
	 4FiOoMilc1/nGW6kJzrl5zw+4BlPDWDPyyDXmkXBdODOioAHVdIErdK026DwmTiO3fOJ/
	 53f756cm2m+r345dw3zHvBLdgn65Sn/uMZ+qCFJdBleZ2NrrogtH0D+IjOi6JmqT1SGpw
	 PialpJawcFuRwZsCrZ6lbrh5igBWyun11SN5Now8IQOKllKWE46hcoVqfIK4VfPip7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jrdPTTT8LeuGKw/UCJIAORDOHiF4eOET7WBKgWyq0CA=;
	b=2VcBOY2hBVNCFq+dOx6qSMsvKH36/U8CvrpWv689Ld2XlOfCQ13+AwThIDDR1epBf71M
	 EwGE3XVLo696sRuVK0G6m8U6THu7cJkgI3WBE3IdiDky7ZFS4NCCgX8RHSyLqZ+rzOl/2
	 v5n4XVMvDVJZSia77QgrbRmlCNLBUX9m5JI45CAVSB5kFteZmKcX6E1DciILjBCKGOpuf
	 tJ9EKRuWnjxnt4f++iGZ8OCZ0NxjAw0f/5rmFwbpfWGybDZi79MQ6dV48Pj5DKbmx/0gx
	 tjrTh52wZEuvqTa8aybqFxV9oyUhPNaclSRwiQpMvx9nBXlldY+9TDYoDh1CXxNh0vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=X5XibFYs;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC95606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC95606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=X5XibFYs
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6fe4372c5f3so125551eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1792553595; x=1793158395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jrdPTTT8LeuGKw/UCJIAORDOHiF4eOET7WBKgWyq0CA=;
        b=X5XibFYsv5I92LrAxuIAIELYc8JWFexebLAbJJ7l0SbZdhwQyds90r9XxKbIeJT38y
         lUtjXHEJpFtgxndozNIty+KNblvj2GWDRpr/pyW3WmPZNz3mLXHMc4OTIuxjngA7D8Ne
         xNgeawx0Ro0KhLEL5tI7Wn5vSucJbfY/gR1Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553595; x=1793158395;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrdPTTT8LeuGKw/UCJIAORDOHiF4eOET7WBKgWyq0CA=;
        b=TtJCL5o6Bx5WDh+9+rVksOKn5zOdqx90pTVHiLVvZ4fq6eoHcjrtxvF4YqPdfKznGt
         arfHvHmCA4/2rHSZjDcOtmkBQwp96/T/Pm1OLOmk5Zlct1EPDKpZqWud90PjubdkARFd
         emaHDV/v/R1McRtURlpM7iAKR7uxVBy0FivUXQma+DEFLUFBkfxzY4DI3Qze8iErE+Bn
         oh4Em6lWubMdhZG7W0LZZX8hJdgvi0nCBZ+bSBcUfPGdM3UwUG6xD6v8XC0qrNQq5dGf
         dUAt88vYsHMPFQVPbuOOaFbW4IoRPdnfx9etM/0qqf/+F2nNvui51+oBfyPV4760dzGV
         SOQw==
X-Forwarded-Encrypted: i=1; AKwUvBwnODPtbNJR1zeW/hS3O/1p6gxJxuKbT3ANrstLSvEsh+yXL1oyAxEN4BWREnwYDeFbip+byFsq9MSQaBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5DKIWzLeC+XxRlfw7JbeP+M88pF7593eaUFoS16/qXEPyvkS/
	lFu2DJ23xXr2JHiI1RGvWxwBNNEjXPVyn3W+XfNuA7nXrRtQQfpAMIal2mbaBbQv92c=
X-Gm-Gg: AYBFou3R0X05/bf4rj6U4ybU6E1gAEa5uO6MiUMRJtRVoEKXkf/e2xh4f8USrE38oJP
	cgEdhoKC1K0v0Cr7jP8S0sTeqkbX60t+d6pLrC+rkQmj89AQIu+Y2I1qV+0tNSaOURGspz12cWX
	QC4opbIvlLrp8v6huJjnYmc7mxggfCYZLTyGGey+aASZ2xoe/sCPk2dPEGEef9OQTicgjSMCoLt
	jS5CO61AeZNwARAb9dJSQns9oUhjAwtb/dV5SPpVKLcnJ07fknIyoob9puHBJ7xnlfFELXybPKu
	Wul/svCV9YNQk7sC/0roDGE1yjQxuSWJkZOuq1WpLRhmO3Ut9pITFLNp41Xsy8suuyVlZLrk5ah
	EwXskXkMKBGfWZW6yX8naHgejk1kGuE4ayT2IKJWmU/hj4HuueqEMn/kp+wVQJFuk+sdJ+zPfcO
	j2mhOblDvJyQ977eo6bnCsN8jodATpiJOxPKh2gYjH4hey3u9fZsgj1Qs1yNoEJ3zIItu+DPXVe
	sH4DQas+vVBQjc858BEDSlnfjUVKAKRF/U4VDZDqD6RgCbZkT+oW63lDnYQfzbjbvauzhMSjX8A
	cVFELsZjcpLXLxAyBKJMhTokSUpqrZTR1DoVm6lA0oRvPt68zz8Y4O9HE7bycVu9u6yVyykZIgS
	vJKq+iQ==
X-Received: by 2002:a05:6820:1f07:b0:6e0:edfa:9b48 with SMTP id 006d021491bc7-70941830650mr500639eaf.77.1792553595173;
        Tue, 20 Oct 2026 20:33:15 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd2d2a76sm1333653a34.18.2026.10.20.20.33.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 20:33:14 -0700 (PDT)
From: nramaswamy@openai.com
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell.sw@gmail.com>
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	davem@davemloft.net,
	horms@kernel.org,
	jiayuan.chen@linux.dev,
	kuba@kernel.org,
	kuniyu@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ncardwell@google.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	ycheng@google.com
Subject: Re: [PATCH net v3 3/3] selftests: net: packetdrill: test RTO fallback after partial undo
Date: Tue, 20 Oct 2026 20:32:19 -0700
Message-ID: <20261021033310.46029-2-nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012012601.27658-1-nramaswamy@openai.com>
References: <CAL4Wiip9RyA-2=p0SVwBcn-oe0864FqqF3QMTCX_7=+ErcJp6Q@mail.gmail.com> <20261009171447.291802-1-ncardwell.sw@gmail.com> <20261012012601.27658-1-nramaswamy@openai.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Hi Eric and Neal,

What would be the best next steps here? Happy to give you more time to
review if needed, but I can also 1) send another patch with Neal's
approach or 2) send a patch with my proposal to move lost segments that
meet RACK's criteria to the lost list to make the merge simpler.

I'm still unsure how best to handle the -ENOBUFS case I mentioned. If you
have a preferred approach, I can implement and test it.

Thanks.
