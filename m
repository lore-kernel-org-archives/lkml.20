Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252BE30C60D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788478421; cv=none; b=YTjFm81RkhVKc9XQ8WXNYCa3eoioaDK4WhyyW1FPs9eSRDo34TC6lnqX7Er4dIoVSIWBQbRnFBcnlFmtg96x8GJWvoxe+Sf6Wk8Ioyq+G2dtbx0KRQSn8+63sE1WKdJwyvyITnoGMApkcC7eVGehseLZ7fC4gG8CangO7xtacrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788478421; c=relaxed/simple;
	bh=/qWtFqHBkrtLXXAD1XpvUaW1zHKMs9ArEGyHDtyLBkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cs0gZApbQwipTZWdPIViOVlYUCUbmNXriPX5dgSK/pvB3mhW4a8xG1Dnwz+XZpEgswmRtAwO8ThFw8Hn9tA40QCxLvmUVQVt4I159IjWWlvNuJgNUX7KzI94etSZ7a4c31Ier7GHzvNbpAzQBsUHdk+M6ZB5alPQp8xfIWMGtwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JMmAKuRF; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JMmAKuRF"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so456408a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788478419; x=1789083219;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=;
        b=sI53AZ7JUaxRxgJFidxjsIARPXoxwfE1UiJEbC4MAPF2N4zvbOhSZ4zPgtCW6xZb5V
         tUjROtkZDgDP8j2yM4LITR/TA3fda5u/CyYlkbaS2AoEpZ6uN0KIO8uMClmtiRXPHr77
         MgFXJimUHfVEp4kg/kgyO4z65ZSxybDjADV0uTIRzYQa8oG8Zn8oerCVDauvpgEjrxlc
         dPYyga3tZUqmGbvaQvZFTqUrsNoNsCF7raaFcTboRFnKKEj6WiwaW2k+GGjPqlNa/XrF
         xHmaDM+d+c04LYQov/nFLbi93H31tupy75EOOys5sxDQggdWeAqK1w6ba0ySeEM1PuTu
         +Zjw==
X-Forwarded-Encrypted: i=1; AKwUvBzXULmLeVK+t9xHoX42zMy4iFV0SPWqjQ1Va+LBnaYhpNkLt+DKHkyEOKvLMgXAksq+cLpt1HeyBVW4sfA=@vger.kernel.org
X-Gm-Message-State: AFuF++nwesvam38ObW5rLAvFjxSSVndreB6YNNeZj40leGwHf1YAlKhX
	sV1U5g+OYqwzPvoavMCk/6bWe9TE/1qXFsr0CLXUSjyn9X+S3kr1bc2ZUeORzkDiR+YOyutKRUt
	860cqKpkBRl/k8taotS0sZS6pKElr7JhcMdqAN3rgtLo7BdE8oLHKIL4/YfPyeyXDHWuxX9laiH
	JqGztMigyxkf2HS9N2b3fFDBZgWTurhzDXSivUzMNbk+KS5kHEx3PESdWRMzCg7fcZYP3kqwUNB
	pdg/1fZOGuD63tTzgxYGbBo
X-Gm-Gg: AYBFou1NvtxHScvvao9TTxHFToSJ3HOxkWjVSpZlW/on0Ez7STZ7wceiPG3DGWDouwc
	VKcjOAIuH5kpc6DMahNsDqZ3ZOtwfC9YGoQdXR8cdbNEbJNrS3RgT7HnSr26pWN5cBCV6uHe3De
	JNr1CZY7Kzi5HXEjNzU38dFdYqHIqDuHgn37LMMNSHYyCLo1IW/rZMDeR7oByCPj8ICiGe9VYze
	y7m6iM4w73EtC61kkeq3HCgi+OFxKZdy0DFM6PN/gFgV1B7Z8oqFvLMMntm4mOx45kMdiW31HAu
	8lB/H6gtZUMqfEHcP7Q/uShNUE4GP/4mBfS2O1W0HhBDlRxUEQzBPYIK7x2DuQLJsi6PyOxCMUM
	qUWxCTQtqE/tXpdlK5+YtLIWkZomNwwFAFzHD7uo5aktBrUD9fzmJBdFPsRAkUGCNp7u7jgsj7C
	8pDtULlzsJtxcMDWji4a2VqsDH04i9jIt5KUmIlpeuxA8=
X-Received: by 2002:a17:90b:2ecd:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39b2609f306mr3270557a91.3.1788478419383;
        Thu, 03 Sep 2026 16:33:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39ae608911dsm890080a91.0.2026.09.03.16.33.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 16:33:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso638183a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788478417; x=1789083217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=;
        b=JMmAKuRFekgUrJYITSj2Oh4pgOODAKpC6WpGKRSJ1E5Xf7xrM+C+nsJB0tkBn/FgLQ
         g3yVsAd7aJx9bVpw1TxrUg4LbCeuHbYLLdzGiXfCFA71rGoop8lOw0ltAjVApisb+uo3
         POzfwhdmz71O7++zX69EySOrLcev+SWn1/b+g=
X-Forwarded-Encrypted: i=1; AKwUvBzXHS4t+4ypVP+6MfXaJgHGiiHd6X9H0EEqXnjCGwKfUz6UQ5XONF2UyNN+3a4AnMFbgZ+JnKUEd9T9BLw=@vger.kernel.org
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr3210963a91.16.1788478417613;
        Thu, 03 Sep 2026 16:33:37 -0700 (PDT)
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr3210904a91.16.1788478417146;
        Thu, 03 Sep 2026 16:33:37 -0700 (PDT)
Received: from [10.211.247.235] ([192.19.50.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm2238141eec.2.2026.09.03.16.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 16:33:36 -0700 (PDT)
Message-ID: <b858b84b-a1ef-45b4-a7c1-35ba28490e35@broadcom.com>
Date: Thu, 3 Sep 2026 16:33:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/vmware: Fix i386 high-bandwidth hypercall
 arguments
To: Zack Rusin <zack.rusin@broadcom.com>, Borislav Petkov <bp@alien8.de>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, virtualization@lists.linux.dev,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
References: <4ab10678a8f50053934b62b56af81f881c1d3798.1788414669.git.zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <4ab10678a8f50053934b62b56af81f881c1d3798.1788414669.git.zack.rusin@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

LGTM!

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
