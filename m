Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418633D093F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791350361; cv=none; b=m5VRHFVC47WyY+g2WEmY0IGP9iJqsQm8ARQbm4tFUNtXuawM9N5+RKQGO0Pn1wZh557elxVImglCBWm/JVe7k2RSqeEF+nOmAolvj/xl9qPNekTrQMbzSYzNC5ui9QBwyUxpAeiOE55LH14iFn4zp9ljS1pz1mRJIhu9gBTkBX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791350361; c=relaxed/simple;
	bh=OCVM79OQ0gYHLdaqQv8qta6+bNhKB2aLceUH39dnv34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffLIvuaJq5ytEfQQFsf7KubI+xZtp4jYPfYrJqZqI+8/lJWuJ9RykmF96S3fyAZptqIVsOsUu1IDwwCk+XaHT5LtK0I988pr6W3heARLQHpO56zhXZjagDnCO/eF4qeFJM/tk6oJ3Nm2EYeN8MIAHSUA+iR8ZuoZ0a9RWpuUA+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=MJnAVkv3; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="MJnAVkv3"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-82374c2d7aeso1470960a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791350359; x=1791955159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pvmYYDXmzG7/tPrvhQnEVOtEDgOCZa7hCTXN0in/KSA=;
        b=MJnAVkv3rGDGDc49dVr0im6dT1j1btosb3E53khR4ShjFRzmUNBRLp1U6L3mfh5sZ8
         5zGXB9sxLwJu6Bxx8tyi6o1pwqdnbx4DbukvOYImXH3VQttpqYpGaPFjUQWPsNtvzQ9u
         fzAJs6WvnsK4mSfl6IAP9byQLe0ptyYSs19Ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791350359; x=1791955159;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvmYYDXmzG7/tPrvhQnEVOtEDgOCZa7hCTXN0in/KSA=;
        b=hsOszj8Dv0WYB6NcXpYbmr5aC5G30m7mZn9gPeufWfPFYdfuoPk5FTzBbX//BctesE
         9KL6EutOuwKynf3cKEHX7M/Jpzg6m+RDqIEAAygspyXsGTJiPI1yyNXbnlDwbomzWcpn
         wmGJpPBq8EBFgwIAl9RtQnKtmggUKqtJ898GkDHimmKSnRDK84fs47dF3fwj88DmTxfC
         pSxD3/hj+nQb34ukj0LJgsLXDQ+d0Vj4cwIrJqKJPQNMecj3B6oQM3uzNR3a/P7OHcAK
         K22iIzVclagrHP4lyo3xPSFKJm/XMrx4t9BfJpJGpcS1zmv0RSL2vPx14FjcXYGyLBRk
         rjUg==
X-Forwarded-Encrypted: i=1; AKwUvBxrRPjV9TXTi16SZisCD+K8vaMqCRRWtmwGIcIq38O6e6RNburYmU+V6ettH74FlZkxMU423mHAX2a6k/o=@vger.kernel.org
X-Gm-Message-State: AFuF++lzs7C/Ug0PcADDz/umbXthWjB0/QTKydXtLCaaikdO/0bBmQNS
	L5bU3dFmLMcVCWnSCpzceLSWvlnGVbjggq6xBePJfy6jy6hLzPJ/H3KzwGt7wsbwPjQ=
X-Gm-Gg: AYBFou1tgpfJqqduoBvzl7uNgg3tr1pTcKfp9yi/SIq+/ckQQ/vNkFlYdRgx+fBD8Iw
	saAQ4PlHz6G7GHP8K4LGjnCEWlic0LNUqE5jIQeRLLDTFjMthU4r7wWm3pfZL6C2tFRfR9UUIoT
	YSngsz+L2qUEZJDbMp/I9Vlgu08WTtC2tEb3wuint+3bdNPX2oQa66dLP42lHzVRsMw4Ue8v+cp
	COI2BViJXRJTk8FxeFjcRy6R3tK/CwDFzfm44xZ3jQMVkaVBRv9QWj7OOK6ez0hroYG0YZpd9bP
	Hy1oCkCQ3ZcY9OmAXqCcBxsjCaFe/k1XlU7DjWJTCCEYZ6YOQ3Ip7qezF893Ltg4wsgMIOG19Ih
	mZJmoBASu8MzGwaSWqjP9S3V01bxRkG5WRGQ5sDpECLkGRHSvgq4UR+lDQe5kX9b68Jbj15Okfd
	CpZlM48iTFcso3ExnhBYSR1R8qq1AJnVylsATFBpJfbVs+bV3cbuzMlZwhhHpfiVlOkvgey41eW
	dkRh7F05n2/YmsVxC0A0UhJQsOFD+AnbOnoKnEWISShvhlsbAiT8w==
X-Received: by 2002:a05:6820:16a6:b0:6b5:ec3f:497b with SMTP id 006d021491bc7-6e7a65d5476mr1120525eaf.22.1791350359028;
        Tue, 06 Oct 2026 22:19:19 -0700 (PDT)
Received: from com-75606 ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e7947969bfsm1375269eaf.13.2026.10.06.22.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 22:19:18 -0700 (PDT)
Date: Tue, 6 Oct 2026 22:19:15 -0700
From: Kyle Zeng <kylebot@openai.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, outbounddisclosures@openai.com
Subject: Re: [PATCH net] netlink: reset skb headers before unicast and
 multicast filtering
Message-ID: <asXWUz2NAm8bWF6D@com-75606>
References: <20261006224232.50724-1-kylebot@openai.com>
 <179132731939.2231598.7844526000530570814@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179132731939.2231598.7844526000530570814@kernel.org>

On Tue, Oct 06, 2026 at 10:55:19PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

I have a PoC for this issue and the symptom is that it can lead to
information leak.

Best,
Kyle
