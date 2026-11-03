Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793736017;
	b=Qsh+xBtnfdDq0x39v76ysqvHtlxJVcPyp/7Ml7zNEU6EvzdVOrsnNxIKAwM70NIJ8VaQ
	 Kt1wcQQ+JNBClUzogCQEc/qtnn26ykvRUOqJNQBBgMNzLgxECsslXLWRXb3do7aVYMGC/
	 I/Jg70LWNoROYSM5NvXw3AWjg+B5tKvCLTivC9wr3KIi2mkDHZ1KYaG69cnSmc/fcNtJ0
	 /aWzE9qWmr1hnRP94lUwnQ6ZWpoK7N2F7E27daYCImowptA/x/EP+4DIz9xJ1y9xYoT5c
	 C9u6YqRAJGPUl7Uu5KSEO2KbVd5iFxgR2sebo2RBCw2fFZwiFi6fjt9O3cjdgEXUQeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1RhPyP7MgK6kNq3ZvHFMegrhlLTeSt9fpqnn/iAW3AM=;
	b=5Y+XTvWJN3zMb3/jbk+8F+/+am2K5WrQsfpxV5VMbCP0DWAQq4/iDZIcEhkigFdAdGa5
	 yYhoV5EyEkfq0lDy7x80vxb3bVjvRKvM2rplRW4eCtn5XytSLvKFyCZVt7/ltP/qaJhBR
	 Zjhsh9/ieH6wHKePsJThdHdWJeArmt22eYoEhSlNvBPPEWpIt8F0CbtiXry1oKfMQQNaG
	 5cFC4XoYiFq6W+jNopi3ENJ/+2/DfVWZC/0fKKfq9ReBtt0U2e5xdQIKcV79jwKxnyR4/
	 oXx3TNxaW+iv2ThTSNUNUAiuESog5NMqZIimZuJhSHfZiLyvPhv3YGtJeOF/aJbbo4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xDCE6L3r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA07606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA07606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xDCE6L3r
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-85e1040ca0dso640138a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:00:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793736016; cv=none;
        d=google.com; s=arc-20260327;
        b=Of9U1K5na1WpEsg/L7lWrWhttt2t5nAk9OuAx+O/9HUaEt8+NNECJAeOTsHWXmlrhK
         QsjllQpvIV4LhMgrZF0RwFTlOlRYbZfmVezCQLQulrkbpR5Eg57yv42F4kAX40q7ST/n
         DuVhXBxmFeaMfWPWuVrBK9sR0XP4ffKuOCwE4s7w+DDOK5f5S6/pD96L8vfMVVIjINL8
         N5Sh3yq7ki0lh5cA1fGbuTlkwuhZsrgUsJOkYHXymJTEBxLjytFy0YbTyn4dcq3I4ylN
         xWF8TdhrFyiNkv1bzcAixKWv2NGqaiZJtfzQNc0V0zSfRGllKrhV00Nf2xBC6Gv3uAve
         mofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1RhPyP7MgK6kNq3ZvHFMegrhlLTeSt9fpqnn/iAW3AM=;
        fh=3txDCtEtUxmwqSXAfVMzHoIWbndXhUFIP5IAvCOWnHo=;
        b=CvVXHHMuJFeWfiCSjNSnSuagPnXxSGVrtHf2ov4dockgHwd3DF7Lfsw9vuU4zaLg8j
         CiH2sBiRcVZZPufmA44u5ohA3QtDzkL9qoDJ3BQvsGJb2ITRzUWobfaSjJfJbjwjKfq6
         AGkjyFkQfVSIQ3xmiP0hQsZPyqwC1Pp6sVQPDV02hnFF/UG0m+LpIz+hAJB3zsmmlova
         gZNALSNas63swUJPBU2iJQuvy66l28mOIr5i1/JeDzo5Nb02nCakh0veBvPnYS2O/Q4c
         g3xTfujS/ChgXAAgOUOeAX2tcbIFkJXWtOSQXNN0o2ybaMPzb5jY/Q+3CuIpP1CLk5DJ
         xoOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736016; x=1794340816; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1RhPyP7MgK6kNq3ZvHFMegrhlLTeSt9fpqnn/iAW3AM=;
        b=xDCE6L3rOiOR7+Urt3WzV+0oUr0Mjz52apgIF+K4YaFB19hgv2FgqeZrdxaGYN+uZ5
         sZOnSFopLbiJyTRc3h/qjFNPm1wqUpjUDD0KGbILhSQAVTHvorCwIPeOSgsapZ0fe0Cv
         Etkhjou6QUYZoSYnF4MOr/biy3Hf9uzz3p9Qg5Soo0c0ssPNsm8utl6MkZbp69NOJj4+
         iDz5a5KUPHPVcrbVE8kl75354b6wySya4Aia1k8YmN7ipbuHDF1cV1+Um5gs7QjACDOU
         nhAUbp3UZLNgpw0JWX1wUm0MkRKbNymTIrGNvS6k7tQsbju2xc0FA9qEHgcCqT0zxfgi
         DGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736016; x=1794340816;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1RhPyP7MgK6kNq3ZvHFMegrhlLTeSt9fpqnn/iAW3AM=;
        b=Nzkp8+WH7A4hsVWq4nbf81beKvl8DzjPpeD5DAAUVNSov/artJruKOcWRIH9/fqdy7
         jvzd+GSj6b5p274a94T85ug60vIWhKWctzI4Kgt1tLyYkHt8eLlrEFC2AAwV3qgJ3uqb
         3NdxTimccaOdANwV/GdrLIgGdCx9T1j4j7m/Ot/YNiSYWPCLZVq94WbJbkLx1dr0ZvZS
         6XGuSRN4FyrpN+FHvnPNMmWRwu4eMiwz6/odL2LwZAH4silVvgr9d/IC07IGuJIJO+yS
         i+ksk4otZbiWrODq9tg/GsEcJDaWqDAwQlTwNMTPrZ5b60AE9qZV4wWkROKLgCOP5pmG
         F57A==
X-Forwarded-Encrypted: i=1; AKwUvByW6XirglRY2QtcEE3Z1uG2X/bWCmeLsObzKuTJT/X/4+seNLAvpySLdjcj0n6xVM40E4+xlUJX5hqG6A4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C7Y3F95bc/UTbBgDy+SV+gJWSYfSrhBNa5cMyLaRM75GEmEOr
	BmL43gnJSE4Ml6P3DyDzrBnsBsqLV3JFvDEupsfeHZKDZOxI+h0VRdfvaUAFb4ZzeFSik7lIBUa
	G9PRIikIUr86duRIkgwKgVk9rBt5FY/DdBdKYfq4OgfmZ
X-Gm-Gg: AYBFou1vzU5bxsswM6ta/LBS6Ew3iSyRaXpgccVV3tmUpbDBaEZHAV2vjzGnefUxE9V
	E23x76w2y2sv2iVGwoKi3wgEBlrbySyJF0iusIDtN1imjfTrXy3QLAOuSloSq3OACN3pbs+SPFq
	lRMsuiDFm14Nry+Q/0Z9ncrvyhq5QbCltNHwqJ2L1tmtwWst9QXDFqsvDMVP5/xpLVTjMzaH42+
	y+ABOV04YAtHtQLikKnIU3uOOOaQh7y0GKUvxRFx6uAkYKPsFHFtlAcAIf1e5Z1GH/ZLTmYLxJB
	PUAHwAFJWodczHEhhEyS5fpFrXWCQ/lA72DjcykQZs0geO2YUFP8sIe2UV2uTzQkcTJmm3fInrY
	kB/dFEq68QfNLFvbnRZZRF4l+KJk/zmXOIbSbxMHi3QfiNsGb1vB51sb/ERuI9oT2+cPEvnHSu3
	YkuRZP3zH6Br3LLtlqI9kIIdC0jladwjOPxQNP47eGWMU3k99Jdg==
X-Received: by 2002:a05:6808:1989:b0:4d5:2b09:a6a7 with SMTP id
 5614622812f47-5640df62911mr8844212b6e.65.1793736016272; Tue, 03 Nov 2026
 12:00:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027171753.1485-1-dennylin0707@gmail.com> <1bf7784c-49ee-4f18-b1fb-205dc064f40f@kernel.org>
 <CAGEkeHcwUEQ0tAXZ5npAhPp1OPMqkmZcNPTU1OnRuNTrwkDJMQ@mail.gmail.com> <675cfc9a-48ab-446d-9fd0-a1937dfeb0f4@kernel.org>
In-Reply-To: <675cfc9a-48ab-446d-9fd0-a1937dfeb0f4@kernel.org>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 3 Nov 2026 12:00:01 -0800
X-Gm-Features: AclHuK-BJ0yjRgrJipuFochA2hXCTEwqPffiASuKtCyUP3wwqOB-H0RMLhHi6Og
Message-ID: <CAGEkeHey0fjkgqbrxyW=9JNX1KuD+OWzzEUwi-37ehD+07SR=w@mail.gmail.com>
Subject: Re: [PATCH] shmem: skip empty unmap ranges when punching holes
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> To be clear, I was asking whether we could do
>
>         if ((u64)(unmap_end) >= (u64)unmap_start)

Sorry, I misunderstood your suggestion.

With offset = 0 and len = 1, unmap_end is -1 and unmap_start is 0.
Casting -1 to u64 makes this comparison true, so it still passes
a zero length to unmap_mapping_range(), meaning unmap to EOF.

The +1 turns -1 into 0 before the cast, so the submitted check
becomes 0 > 0 and skips the empty range.

Thanks,
Hungyu
