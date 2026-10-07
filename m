Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AAE274B53
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791350266; cv=none; b=UKf65H4iPpow/6hpZwckB5KyvSkGmTx1PXkoVEE02p0Gxph2m4QpRirq0FyHlN1fkd7r/L+02YfoX6pfVYEQW+6TzLm2aG0hvHz+jy/+z3l7hmYpYZl0ElCpjKT7v89kbx/f4/9g75VTdYsF2Jx+7dhXojSQEac7ALIC5WuTupQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791350266; c=relaxed/simple;
	bh=d6I42OVMMAfQ1pKd/EwfaBEW/IWSBYSJE3q5maVtz00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNFBZkjuiQlHpnqQbU4VrdsOaTqXKy9HVCLG5jc0uha5BHun4nEmrFHUVnKAJM4ArCw/HvzhP35SfiInc5Eu006PV8YhVKlNY9lfanI0AxJdyIf/6MuL/0ZO9a6kiQoZOUSGJ+ZjwMVgTDYvwo0aB2WXekbPpaaxYVnbVjoMlZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=TFW6mb6z; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="TFW6mb6z"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8258ac98bc2so2870776a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791350263; x=1791955063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yNBSC4dES3rHCfyXXYrULXRmc0yVP/bprqqW9esFYE8=;
        b=TFW6mb6zxDzWGVl0bYobdjVuFehnYSJXLPRHsV151yGyVMfxYoCIrY6NsYsgcxJMmN
         DRfyFDF5hk0gSOzo0x41ziCREkSMxBe5otGEROJfQvHZ/VSdfyzgOL30+sMBcBYsYRtH
         VaZolcx9POJSZwxCB5Hm+6FKh9gJCd9l2XH3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791350263; x=1791955063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNBSC4dES3rHCfyXXYrULXRmc0yVP/bprqqW9esFYE8=;
        b=lQ7DBPCzbHBpHVruBXkJdWrM7qKQG985dewzEjejWdK+Zli4hCiVvH+757FM2BHRGs
         rAD9JFMuiFclvZb35HMM51x8lvo0mkeZcgMPJy3DP2GTjCL24sFt0kHtQRlIdyP1wZry
         zNWJdhTw5KVMdnCU1ytanBbVaAk65yb7w7TRolvu65d47uubMPFJmv+YdKOHvQ4010ND
         luq5N+0+kCZ7afUq8RYdQgYMHYCyxpKTYek8y7JfEHyTyOPQDuHvCEhPSDU/lCojDnuS
         wI3ax7r9VKg53RGqY8DGh01q/OSqK54n0Z1GpLBsvxa9CUj9JzZZ3sJnECMHUiXNJDCw
         lllA==
X-Forwarded-Encrypted: i=1; AKwUvBwVdEMe0pf+1KPiwpf4mb0Qg+PDkW81z2eEpNR7W2kHmdsf8KPYmNvK3FiThqXVH+vPa6tFfdhTBaVet6c=@vger.kernel.org
X-Gm-Message-State: AFuF++lyjGbPLhyVoBfqK6uT5ldAY46nFud7EGVSq/7ph25hITd0W99Q
	8D6sh+oCca/V3G6wt/PP7ln95T7XSFrRTKf4Y56xaUNcL+bSWdEJIW4PTFtHvUUVtJw=
X-Gm-Gg: AYBFou0oZSejbL52GvYh9AEf8ztR0HQc52tH47y/NUB7c7H+2TJse3pnIHpvFoSJOe7
	eD+7EShR8xeR801v+RdDY5CqLDLyuHA8RDJOpo6QL406A7gUWNvj4P0ioFdc986QXvx3e75NT3+
	Ly/VYlkJHVNrI/uaO6VSE8u9E9Bfp19NG2b+kP2YVygCn3GewxAdnI8AwipY6vNpDVfXIzlzZvu
	mxNL7tDLzLCDxxj1YTwD8n0ok0hnIh0ACIME+1xOOjkFMo8yP4SMCvHXMLKaX9OMLsCsZHXN+Zl
	gZxxHrsfP0XwtxK7oT+RPyikK9tWTt9IiX/9xL2rCrt9ceWsmjtItxfMD3Z3F7+w7cM+wMsv64N
	dEBb+blbJcA8vMjigZ/g9sQDWiWAIJkoIiL+9v4UNfqD061cwiUX9kEWIyQ3QwSnE+xmfy+ocKw
	vtl6Y/6stbTm7ao+xf2Ex7QEjE8mk9PUlBvrzN4CYmb3jEdPLBp+bYnbymn9Rid0+FYkVwTkqVd
	gac38bNHQB1CSvTTmR6W/SlBeK0moPQSMUKdiKgV3iVt7k36gSZTtadhQTZRulb
X-Received: by 2002:a05:6830:349e:b0:815:e63f:9b90 with SMTP id 46e09a7af769-82aca089b86mr2621790a34.0.1791350263566;
        Tue, 06 Oct 2026 22:17:43 -0700 (PDT)
Received: from com-75606 ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82adc3f1006sm1972452a34.11.2026.10.06.22.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 22:17:43 -0700 (PDT)
Date: Tue, 6 Oct 2026 22:17:39 -0700
From: Kyle Zeng <kylebot@openai.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, outbounddisclosures@openai.com
Subject: Re: [PATCH net] netlink: reset skb headers before unicast and
 multicast filtering
Message-ID: <asXV87wae2TEXSp4@com-75606>
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

I have PoC for this issue and the symptom is that it can lead to
information leak.

Best,
Kyle
