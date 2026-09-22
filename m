Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39483B6C05
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096473; cv=none; b=jH9b4I4jjf0bAR0bjIwLrtE+zdNAz2DNCdht6DLm4Mj7ayL2mzyulhCBGGu1tq2ZGp+BZKnWCVf2lD0GK219/fayecwi3twW+/zXwzg1mB4hmjn4+u/pWH46dwC7zWkifMCXq3lKkSPXYBD+CYo81a54o7fxjmN+8YfGLE8e8bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096473; c=relaxed/simple;
	bh=qQJNstfTwv8iNMFEAMGwgqeGoCJp+DtUVQAv7X3CIJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrF1OqaaW9TwUDVWTTk8EkAeL8hDZtvmje7z8IWhfXETWGPMQuydEUO1vPBaJZFMTptD3F7sXhOAwfE1VUTDe6bW6m79+CrM3ahSTJldqWq5YDFkBCelOckXi5ayKBwAG05miLfiTOCoo2WdNlcyidD/pw18pgsseTUYG6A/2bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=K5I068TP; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="K5I068TP"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-805cc8b4231so103922a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790096471; x=1790701271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x9YLkzZ28C/6ZrOI8QJdDbKRDoNHJA/GmIfIJsBNLEU=;
        b=K5I068TPjV9liWWYwr3JJnaVOZUY+7NEnuaI5vHQI1YOo/tX9359vu+rUgb83158mX
         fiIxQnMdPanBMvVq7/ybZvzVRNNyp+t/f6e9Q+mw6oh/N+rS1VpvBqDXok/Vaqe26f8r
         5IjhwZ8FbChSAOVBb7b1FYDk62ruBclKtXIAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096471; x=1790701271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9YLkzZ28C/6ZrOI8QJdDbKRDoNHJA/GmIfIJsBNLEU=;
        b=YTAMBqncK8O8YrLIFAgYzcMk4tqDGo9qb7OWqU1DE/tgpvbRv08i6npOfcdZYJSPha
         g33nhGFnDkhFUg08m8cyBLPw3IwmH8D4ZNGIs9IMBBwBPoMksNYw8e4aDHDZhTxQW++o
         czp+e2FBrNBKbZHKSmz5FT4Z4PHElJdwKxVrTL3PlYyzd67D5c6Ob+utvYjkpgWUNNq+
         Xu75Kapdum8k0s0ytX6Rxs2d23HYgIKnSVC/XGpM7Awb5e9D7RvIgqy48v1H/pahK3Wj
         duXT8wziAvG2RLlt+N7cdhOO+swxcH35QhWExFGI0kMLZHOaa1vE9jK7k+cM+gjnexSO
         CiYg==
X-Forwarded-Encrypted: i=1; AKwUvByyv9NqQ/08sPDEWS5U5AtRSIrwXmHtCVJbjW2wpvfjso6ShuDodnbhduVcSwkReLVMC0+mcL+L6zoOYwY=@vger.kernel.org
X-Gm-Message-State: AFuF++n7pYYomz0zxEeWaVyNRxsFqExNcDCFRyjEdwhQ1iu5oVtL7/hb
	CHdyJocnvusff2586n+Zh5qwfdEZicVn1Do2CYPVGRs1WsoTXPdH8YmC4XeHhbbxlQ0=
X-Gm-Gg: AYBFou0+MnixNzZJbPqRGw00JBK+0bL6GHFBwTJUNRgBSVleE9EmZ7ry/6EF71bXAVG
	yXadqPvqU29A7QCb7i9E1sz50OlF7IlX0Tsgq5zXKKV3BPFoILhsqsBXfi7KAbK3IZ5JXJeMK7w
	kHyT/BYReMSAOqnXVPECvJb3R+zY/OTN+TuMzI6XXd435KZyLcNwvp/jm0NNXBcs35rn3eMpNtN
	2Bgc2AyI+iOvl1gtguUtGKxDLO6gDZWZ0mVfEW9neYj+WXhoaqt+mVQ8srwrwQdzYjzbIwjqQcl
	HZ/dEK8SETsBuCCSsF0ZlSy4trmMlUUNaE2LY/Ol+wQE6feNMbWFMGwMkt2H+Tt9oFD1gXh0TN1
	FebHcqAAKsn9o5CckPfToq2mYUBXcyCAycypUyuTQ1JXX7Fi9ZJ//oHUT1Cy4VEicqXBRbyA0gJ
	IjMgcx66JytKQRPz8c6fPrj87azstApvtiVdeGR7FcTZX84iPQLrLWabqI6RJv9Af9LQKGDZVlK
	iiqMCM0IXJ3iDinMpmmtR+EvJrjhEcOl+RM4X1nmnrZ07sM8fLfXGLDbMpl4xRM
X-Received: by 2002:a05:6820:619:b0:6be:b2e3:27e with SMTP id 006d021491bc7-6d2cff43388mr26252eaf.16.1790096470557;
        Tue, 22 Sep 2026 10:01:10 -0700 (PDT)
Received: from com-94485 ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2cfc4a98fsm35786eaf.15.2026.09.22.10.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:01:10 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:01:06 -0700
From: Jeff Jo <jeffjo@openai.com>
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com,
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: net: check timestamp echo after an
 old ACK
Message-ID: <arK0UmX8qJy3O-rS@com-94485>
References: <20260921222609.50824-4-jeffjo@openai.com>
 <20260921222609.50824-6-jeffjo@openai.com>
 <CANn89iK00zXGA8sdpH9Y1CkFK3n=uKG9Bci3+=69fGV0UDQ80w@mail.gmail.com>
 <arIE_i8Ysz5nOI2W@com-94485>
 <CANn89i+nY499TfuGMvMq3P=Pxw6vBxe+uYH1zioK=bhU--GXYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANn89i+nY499TfuGMvMq3P=Pxw6vBxe+uYH1zioK=bhU--GXYw@mail.gmail.com>

O Tue, Sep 22, 2026 at 10:09:42AM +0200, Eric Dumazet wrote:
> I saw you sent the packetdrill patch for formal inclusion.
> 
> Let's wait for it to be merged and our runners to be updated, as the
> kernel bug is minor.
> This will allow us to get a nicer packetdrill test that exposes the
> issue directly instead of via a workaround.
> 
> Thanks!

Sounds good, thank you!
