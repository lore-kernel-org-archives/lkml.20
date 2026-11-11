Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424835;
	b=Ul3NXCTdbv5lz9QDxkOR9/ReTkRO1EPz8GXHEIUb83cLlsoOc2aRulbLkF0mz9FoWBV8
	 tWWz2gB8uENjbGANezh9vT9wmw6IXOpJQK93VVJUpQuXejUG1zJoStUIeWuws0oanXzid
	 bMFwQEPFi/AUa7fqggKuq6i/FieYGw72nLbZMJxVGQ7agy2DtGPjRqdaZAL0PGk0BJzVX
	 ClhWJM5bUJmOyfIAECmWdn2AAqI5/WnjU5UfWc3XUR4rD9NMlkHJnjsrmmKogZP+34ria
	 TzaBGKV8Amwzdh74vpEOtnHtjlX3y08Fl54dN1m+QIK6BZqlttr+y9EzPHMz7vUdotw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4AU6yrqWvCc/nyHqN3PU3r1GIThqckGTo09wAzMWOLA=;
	b=N1HeNmMAxpURxOs2NhrMx7K/I35elNrMiFHrt7PmjWhzCa4R8H8QPErsy6U0VUX4GJJ9
	 cir7tF7N6kWm7g09FQa5JLLeIxe3yxpIliVCIQ20JOMKQ3PSWqFSL9E19l8/oW98UWFTm
	 QIaaZDRyGtFmOXOxq8U2z1Q9eEqIK1qPgnu11CrOEPLXZsuCem+acixaJF60ERuz5Njh5
	 iMQ3/K5AX/vEBdaXeIl1PXUdufBAEUJJ3VvSpYShx1iqgxt+yrguj56XGJsVpYY0xiI1g
	 V5RupdIMmmxGH31zg8HGVZxIHrCtOU4qXb1fJvC8uy54wE0JoxxD30cRXOof4s+3sYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=GYKn+hd9;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E5B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E5B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=GYKn+hd9
Received: from mail-pj1-f69.google.com (unknown [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2389840603
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794424831;
	bh=4AU6yrqWvCc/nyHqN3PU3r1GIThqckGTo09wAzMWOLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=GYKn+hd96JsWGZYKf+1O9dFdYouUZASvmL7xQgF8O7cYLFcWPdtKBXQB33DverlJm
	 mOqf89/yBYpBe3RZwqq8bZfewuGBW2TwqZtr4ZZtFQRuO5ZivNEf7E+qvBFUxbMb8J
	 r1o4Xgr3W2i7zgHOL8emwIMp+Rz1GqEPX+oqJ9xGO3L/Ewwc+ltDnhWJfj7hTYcz2p
	 YkQTB/yS71ogyhHBNy0fs6sPWOOogMCCIUACy1HIAj5wvb8ebIQahoOsEEaoXLEHlY
	 5iIifwyhQgZ1QtU6S7EcbAzWdYA8XxElwaSsTkKZwyyM0GCd/i4b8vXjK5R9y/YK6s
	 R2MEEJXSAQUWAUBlmfYTMRb8kLCEQNp51i0P1mhdAyI+q2QeDnETyYq9L+r2ov3ItP
	 CNPP6xhLAaEN7v0l4zBqhJvNQuOmepEGIVKa2zP95eXjsPRL6UDCFySobD+X+E+7sz
	 P3l7qEuBsRHl0LOfAWXZ2r91tbfs2azZURc1vLAM3mz/gN7wHoOEmgRj9443VIgYoe
	 36jvOgSp3+isXmggUDdvXKrgbh93qlsAHNelmkgLm2RBkTzGusn6SXEb7lyZHAhIY9
	 CMLzUvQakCbbp2ugUSk05tT/IJmQemt/HUwKSsibQFtK4/SbiFIfzIEBei20vWd2dL
	 QZOCUJawLt8tw6MCFt363Ggc=
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso4236395a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424810; x=1795029610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4AU6yrqWvCc/nyHqN3PU3r1GIThqckGTo09wAzMWOLA=;
        b=cVX17AG6Zq11wHjPeMTS9204VIIp+y+pa0pBTJOWJtrAeLDZx3xUv82ty2hbdQoemQ
         GgaqHPKxaJByNsJtZaRfF8aEAhpddRxPBnViKBwwFryDWB8fSz3QuDrP1F7kPnAdyopd
         9QlpHkxE5CkdObpJDkbcOhDxlC+YkRtvpNL1ZVmSMoRWvnA8RsxG9y7ysQs/vpjvsx8M
         BBqWQ4xSY481+E9sDne7s4K88tpAm22uOz+Yl7pZ1MxSIivV5E2MCRahAt42UG+aTnCc
         YgksgxJUARDqJ33DtGA3kd5njN0Y/+SLUgmG9MExPQ9HBZY8gMRIiRCrvspp/65AFnrP
         NV5w==
X-Forwarded-Encrypted: i=1; AL+hErFK3Go7PMbGJt/2SSiwoZGuU0JnzvEYMO7HEnRFHBaSs/jShyCc7B0Gu9ku+Z4/KHfnzvz1A7AUU9uABCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JxOKpSCdBArY0XEDO5V6eUEQe207BZwAh6iHSttmtmA1kp/oR
	IAZIlfcmm2kFby1zdl/CQb8meWRJvO7Z1o3kyvAW71feEWanD5RH0Ewkyxieax2tiRVEQYm42KV
	Hv1OmaHmmljPUeowVU2jYJ9X8OVlW2WqV5lQXa9RzCN/ScohUWwz2n23iIHMniaTS4yKBAznPyf
	9zY1LH0g==
X-Gm-Gg: AYBFou0GQ4Kuf0aq04Uo5SoyCATN21lctTSWdfQ0lYR6ckLee3RAq2wfC6da+pZumuA
	eYwXlAcXbFQ8gDZOSEIAfIWeV9RD+SUrZo009t+Q/4owI3HoLtdG37K5+VKWXazeI8+ikh699uS
	1RieL7C/7aEAiYoY03vqLoK5iT3oSo5o1CmNoCbPShZWz91eZhz/8WTF7Vj8m6AORMjpZs3phyP
	lKAJqS7jTDv9JSqdtsdKYfgHZT2WuwdK4Nl20bvzqscJ3bSkvwnsmxDxyhmm7hVAsdGIwbppR0/
	KLjTmB3Tmm2u+VI7x4jqm7c4Tj0OUxHWmxG6A1uiI9DXnQDzZz+5t9dvZ+Rfempm3RkUXYjfrod
	MymMqc0eYMTcSpGVyhLb+9R667GP0UffncGhfRP04nZEACvPX7rPwD5LRdAE=
X-Received: by 2002:a17:903:f83:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2edd76d1b91mr27420515ad.14.1794400871215;
        Wed, 11 Nov 2026 04:41:11 -0800 (PST)
X-Received: by 2002:a17:903:f83:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2edd76d1b91mr27420345ad.14.1794400870858;
        Wed, 11 Nov 2026 04:41:10 -0800 (PST)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4d79bsm20660295ad.16.2026.11.11.04.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:41:09 -0800 (PST)
From: Changwei Zou <changwei.zou@canonical.com>
To: herbert@gondor.apana.org.au
Cc: changwei.zou@canonical.com,
	davem@davemloft.net,
	gaurav.jain@nxp.com,
	horia.geanta@nxp.com,
	iuliana.prodan@nxp.com,
	jeffbarnes@linux.microsoft.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	martin.kepplinger-novakovic@ginzinger.com,
	pankaj.gupta@nxp.com,
	sahil.malhotra@nxp.com,
	sahil.malhotra@oss.nxp.com,
	stephane.debusne@cynove.com
Subject: Re: [PATCH v3 2/2] crypto: caam - Use bounce buffer for unaligned RSA destination buffers
Date: Wed, 11 Nov 2026 23:40:59 +1100
Message-ID: <20261111124059.789629-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avRIYjWB6AUbeLUS@gondor.apana.org.au>
References: <avRIYjWB6AUbeLUS@gondor.apana.org.au>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Herbert,

Thanks a lot.
This is a valid finding, I'll fix it in v4.

> rsa_edesc_alloc() allocates req_ctx->bounce_buf with size
> ALIGN(req->dst_len, dma_get_cache_alignment()), but initializes the
> bounce scatterlist entry via sg_init_one(&req_ctx->dst,
> req_ctx->bounce_buf, req->dst_len) with the unaligned req->dst_len.

Correct. The bounce buffer is allocated with the aligned size, but the SG
is described with the possibly-unaligned req->dst_len.

So the fix is to describe the SG with the aligned allocation size:

	unsigned int bounce_len =
		ALIGN(req->dst_len, dma_get_cache_alignment());

	req_ctx->bounce_buf = kzalloc(bounce_len, flags);
	if (!req_ctx->bounce_buf)
		return ERR_PTR(-ENOMEM);
	sg_init_one(&req_ctx->dst, req_ctx->bounce_buf, bounce_len);

My own test case (loading signed kernel modules) used req->dst_len = 512
bytes, which is already cacheline-aligned, so this unaligned-length path
was not exercised and the issue was missed.

Kind regards,
Changwei
