Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968281;
	b=unKwwyOpTmGyb+HF6kf0oo1MXVca2UrSu4VgFpWc2krFlQjL5O+UhSGX28/Xier+dwav
	 WF621XgBv1t1nj0Pwh/XbHDhO+mI+CwXx8oaTcBDFq7i/lmpzE1VFx9VTMrTmla1I/d9+
	 PqPKKDliMfQFow1+C/1f2pcbYmo/+ZjJtVFRK1TgUnWNE1G+ccQwURuDBTfihV/Xlj4rZ
	 BKlM7BMvMx8kRv5YS8y6GtWMDoSkipbBBWSM4tn84Xx1luJsrdgtdT+TCf+1Di48bn5yG
	 MpMhjYTN9H0tTc32TdhU609FObzXa8BiE+i+9KMHGGFDYpojA8xY4S0HqSjLnGHe7eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pOzKxUT7AEOYV8jkBshdYIOEQ95xhfIUx35G46BhKkg=;
	b=4jCCeKqjqHgn5OaQLH5jTABL/THnQxlFYl8oSSJCGln1pHhF5ubfXyv8G0hfesdZYm9G
	 6C0DRuCvQXK8qF/G1JjMGxv7IsES3KY/sjAE4AqdCefCttACiKqN/ZnQGYqI3eTwW5s3u
	 4tvB+EEz2RRanOQRmVtbxhEHkvH1SiYTOdiIJUTCNTSKQlk8BmavE8O+aMRR9lsEhZFQc
	 Iw6JK4bbexozkRe78RBBCNAe8dYqSruh/xkP9ZnJoVJkfiQgBFcHDy71/zkuYLvmERxxv
	 qZ58Gjf7yW7N8gMqawoqSkW0FE6Z6gCY17SosmpEh1v3DF0LmcWf8xUAN/5cHPLKMiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=hKOFEJcU;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A79606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10A79606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=hKOFEJcU
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b5669a5100so717190a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793968279; x=1794573079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pOzKxUT7AEOYV8jkBshdYIOEQ95xhfIUx35G46BhKkg=;
        b=hKOFEJcUY0Ogw7gyLyr8vZXJEQOLFJ6Qo86GvPqrB2e2DTLTRFLuBke2HTHDd95+z2
         Bel5PqqD0V2CcIBn4u+SYSXzKMtKO0Evvkqa5zkj60Mnbs5lYjGClQH53aarenQS5SCH
         Yx3vhPwF/psrXLJdoi64monkLUKvjnDigCBQLH+c8V0DH7oVvQbWxCtdTASix8WHGCMT
         P0b6uStYgHgkeRTgh3xZO7lJL1h0AzF9qn43rtzof3lTnYDAAt6UoUPmWZ/A/1ms9vVR
         IXbStCIdDVCojAJeKuOTtYsUlQVn3ZPkTYDnmAstq0GwPgDh3r+4H2jmLV4kA+69mwr0
         uNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968279; x=1794573079;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOzKxUT7AEOYV8jkBshdYIOEQ95xhfIUx35G46BhKkg=;
        b=WUxuI4eBR5k6dIqBdU03pQ8p90GyiU5aHbAgHBfC6BeJ53R8VDW3m1JzjPbWDq9jM2
         80o/w0HOsv2HInqU6zPrduYIgBPWMjeLy+BMB4lRxhddNaUc+Hhk42jDgiOH91/ZuZTj
         PITwAzAa2DJBsL5YkM0uvaVysv+fz70PjwpI2KzvL6TOpGpyd2GuUuNwiWXmLb7UXvmp
         zNByJaacq89SvOUumpgZjEaBhTkEB/Koq+uZ5cM4yi/GPua/cfMrHY96MlZQD39kEJl1
         XWL73FoMxGY8bNqUPa6lG2SBPpAgVp1C7KLpLNlFqHUGUlsmXOF2JePf7zZekcgS6o8v
         dkhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzF8jVX+8hIRL16izonVmemIhxVYvLbKIFmqvJO1cuukGPtkwAXRRwO0chu+K7aZMp+8rG6BB7HAC9eveQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uYPZ3mQKB8TT6OJ7jsQeHL+SZiaKtUaRfgvQATP5R1mCIJ5X/
	ajJcXUh7zInEmBgoZEpE2jcT+nD8kRnmM6lqIYkSrWsutesoUyPgNOlM/vrvJM/Q9+ZkHhJ9+Zh
	BbmfmK9I=
X-Gm-Gg: AYBFou3Ne/eX7k4M/cL13BgaVq3ulM+/x/jWkD5E4dHga1ubSZKrZwyOxm25Owl7H9l
	Nj8QL+a88qz9haQG1JXx1huCr8OExwnSpKjTHlxoFI4+jDXdU0HmYYcuutaq0qL8MtNoC+YeEO3
	b6v9UywnmKg/kP0X5JwB39S90ozO12AnXTW9JJMNwXvOlKX7ay1P3bIGRksTox+xYiphhWeaM97
	W//YDeB6+jAXBASG8oOkEZVe1x35+v5iX1uoRwhyJcqS9FHWCai+tr/R1NUj4ENoDZfE5acawpk
	6T5WMK+zI3L4GWKNUDWyC4i16JPXtkKHSwxH7YvdvndX12sUBjaAzjSiuXvjbxw5qRlMIo3eyDb
	BO618OlnRgK510HddeYbQKw0DE3Uoh24+v97ycyF7NJsLWD7muI7wG7qtgITNDqKno404z9yO3s
	ZMDX2ExwecGf+3ensm1OZdAOi5+kmhn70FrMUAr8VYEb7tSlfGA1Bj/Hx1gJ3vnKU6frcdR3JXF
	cT9tnni4F1LTZiLPK53vckRJtggQAsp3LVh9I2Uxm2jMeTB2Vq7Qf/Ip61hAKx8IYrWUN0aBHCQ
	2SBsxUdgglDYBIOcvFfe6TOoq+W/EZ5Rl+/V
X-Received: by 2002:a17:907:6d13:b0:c4d:2895:e492 with SMTP id a640c23a62f3a-c4d354c5b41mr215939466b.21.1793968279181;
        Fri, 06 Nov 2026 04:31:19 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356ea58esm77460866b.81.2026.11.06.04.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:31:18 -0800 (PST)
Date: Fri, 6 Nov 2026 13:31:14 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: tongzhiwei <tongzhiwei@cmss.chinamobile.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] lib: objagg: Fix stats imbalance on hinted-parent error
 path
Message-ID: <au3IjV88SKC1wKsl@FV6GYCPJ69>
References: <20261106095621.143-1-tongzhiwei@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106095621.143-1-tongzhiwei@cmss.chinamobile.com>

Fri, Nov 06, 2026 at 10:55:58AM +0100, tongzhiwei@cmss.chinamobile.com wrote:
>NOTE: this commit is worked by llm completely
>
>In objagg_obj_init_with_hints(), the parent is obtained via
>__objagg_obj_get() which increments only the refcount without
>touching stats.  The matching release for internal references is
>__objagg_obj_put() (no stats adjustment), as used in the success
>path in objagg_obj_parent_unassign().
>
>However, the error cleanup at err_parent_assign calls the public
>objagg_obj_put(), which additionally runs objagg_obj_stats_dec(),
>decrementing user_count and delta_user_count with no prior
>increment.  This corrupts the parent stats, leading to
>under-reporting and potential user_count underflow.
>
>Use __objagg_obj_put() to match the internal __objagg_obj_get().
>
>Assisted-by: LLM
>Signed-off-by: tongzhiwei <tongzhiwei@cmss.chinamobile.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
