Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103511;
	b=LBzv8oX0Fi22F5V18mhLtSxyeBMv7TM8DO5/MrtrvK0Oqk3J56XW+WaWi5XXvlD8F5al
	 5P/Tbx297I4EN4WBLR7rbHeURbRyV7PTrTKtqc5BUcuyiOum9w0uuuqpYowsXt2ntEkmZ
	 rch/qMpsD1h21l5twUkkyZG3tMBbYZuO8pDQJAMVT+9KulZLwV44bKCm5294zamACPQ/b
	 7vHQVa1BBqfuqnHUo+tdNR8s1s7BtQB3AVTVNUk58He2GNRznfLtw0m7kheDf24HjXhlf
	 2KRhiR210fmyXNxLVmIRxkYwdbsHVRGmoblY6+JsnAispbPUPPPtKoQuwWqoz06tBEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103511;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qm6TGibcwphKeohobyNtjyfRQPqYuyY51baxEc3sRXE=;
	b=dW99GrPzOnp1Zu0AoeICSrPAVkeWRAGybD58lJKbdx27jvatYcU4xzPS+L2rCiUmVLuj
	 penwBnqsio+j1m2fg97JQ3RLlGY3isqyMjNKLowtIc9YeSt1X5Oh77CroI4RfFbnwX547
	 ylzP0+vwOLFy0cd3gp5tJcFsRqQq4N8GDr5YaWzAvSA+pbxO2izNX4RjafkUhfdQ4fEnP
	 oeqsceHNFBoy3bRCY+1F6dOat8CuRlOhU/T49s0l/9njNR2dJunCQeEyxHYiBpgCT20U+
	 cDbZqX+ClOWKKgqBY3MtNPbB4xL8sYMZpO8ZrCR/P6HLunWy2WRm3/GAgXgXGPUd23Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YLv1f7FJ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pN7qsvxD;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49BC606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B49BC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YLv1f7FJ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pN7qsvxD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793103509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qm6TGibcwphKeohobyNtjyfRQPqYuyY51baxEc3sRXE=;
	b=YLv1f7FJWs+KbmklJm81eSrtGXEzmnuuMcBMyviU4SOEI+Y3x2RDIVQ7llhVBz8vqT/AK2
	tLlkFGS0AOBta0OSWXT4YioZYFY2v3V1ANOwXX6kIcYud3zrprcGVs43y9fwlF/Z+wUOhn
	+aH0v/djRbHcVrQpbzPUoPeuvCvHxYY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-Su9rxnXcOrG18yiy98fP8g-1; Tue, 27 Oct 2026 08:18:23 -0400
X-MC-Unique: Su9rxnXcOrG18yiy98fP8g-1
X-Mimecast-MFC-AGG-ID: Su9rxnXcOrG18yiy98fP8g_1793103502
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a20a40d3e9so26356835e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793103502; x=1793708302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qm6TGibcwphKeohobyNtjyfRQPqYuyY51baxEc3sRXE=;
        b=pN7qsvxDwVBeWI7RSLvEazYQHeVBSrlZNTFT/dMEBhhABu8gupbhwV1vnPc/GlVulO
         GFFVsj2FVx4D+sPfYVlZbUebtXt/+sB/J3YrReoHdiVE7zpLqIYeGowg1Zk5GLnwXRRV
         TvWYA/AwUIs5yztThams6vVpIQQGNIjWml6LHcJZ2oAESoj5XpRRX87oN7ahPo1rcs4C
         VWwVmDFmyFHmyWJ69xIlZcK9dVxHP1nYASavNijzvNSks5+TOJRZMhD3VTlDA9eSsHOn
         mLR2ZqIQZRjUDovQlWApAMjoECufC9VGXeKK6IYGWQ3mhidBv1DwEGhQxh/4cea/rI/Z
         OytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103502; x=1793708302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qm6TGibcwphKeohobyNtjyfRQPqYuyY51baxEc3sRXE=;
        b=Di37CS+uwrNFnqNc9mYa69sDTnYRmznxNbM3ofxrPq1/YGVGxg1JsIoblfKv9Q3fYC
         /JOykwOM70zAHdfW+by1hcifArOMX8Zfo09kdGx22q7Uhc4K7y74clKL+IhboDKCUAbF
         e3d1wdc3WHgmQv9F5DbNxtFPQSgca/6Y4/BN1WVyrc6DoOnUHVBMrMj2k6ooPg2NM3+6
         tr7KAr79EvoE6bVgmfQ75XH1bupMEzPzMhiJr4cELGPA53dRt1cxC8dZ2D8k89rCX1In
         o+EY1773fBQk75n8xLyy4qagwjbJ1vNO0yBQ6QFBPBMr81kpGYeTYKx4F1t4Z+kTuNFn
         HxLg==
X-Forwarded-Encrypted: i=1; AKwUvByBVsTR63taNOsxwZzFvP+hot+ytu7JsEUbh3h9yEFPRO2xoqEw/M0Ph+ibl5vwrjKK/oKcraIA9R/gfpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLLPk8JnbxnAQYAVKciKLM2ec2hEH/+Z1TTUarkiUyIGcUdoms
	FQO5awtGURaOV1/WCVB4isi1arLeANzgHJnKYpgZJFy5nle4LOMxE72bTmYqX/UpTBj1zw11/xc
	eUhBSqCN5SmbFP2GMFIaSmCuh1x5iDGKwjOzJN2gxnsEfBmZ3bL8924ITbhfnPKh6jg==
X-Gm-Gg: AYBFou3iki5yE3xYuW3klNS5vur5dleVwJJlmX5cbUSeg/QqBSYTEg6KinpBa/T4Anw
	K3iAgQarnwLwWqnGlCzgN2+GEnUm45DTwVVhjP42KnXrKTU9UGkja+h4OqXrkqDJVSGcjVY49Io
	dDdetqLZDhrPJnow76ulynrlKsdnNsf8qHpJJ1VMgZSqmHIqZiieTNUAx+qVPTSdeQxPKeRWClt
	C3tZ4bk2t/l6m/1WUKRiq+c4kY6mq1En2dWbDlVL2dYHtsKxqJdYcmAvk7qYM45x1hTXBsRvK5E
	kdwd/iVjiKzPBPv8NpwNA5x/DQ4RUsPmydbHVPRco78uXHf8+XeiUeeopWF2KFHqgtaTakNfNSu
	AIPTC2f3u3LRWIJc8jlHwjEJH4PFrPfJFJT2yfQ4xACThdvyWwUGxSZcH6r6lRWD/ewgIzpu2pQ
	==
X-Received: by 2002:a05:600c:474a:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a35ac91f2amr198363745e9.16.1793103502225;
        Tue, 27 Oct 2026 05:18:22 -0700 (PDT)
X-Received: by 2002:a05:600c:474a:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a35ac91f2amr198363225e9.16.1793103501794;
        Tue, 27 Oct 2026 05:18:21 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm21785015f8f.43.2026.10.27.05.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:18:21 -0700 (PDT)
Message-ID: <cde7570c-50bb-4813-a461-04154d4cfa65@redhat.com>
Date: Tue, 27 Oct 2026 13:18:20 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: dsa: motorcomm: Fix function parameter types
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
 netdev-bot+sinfo@kernel.org
References: <20261026083252.12684-1-mmyangfl@gmail.com>
 <179300378438.3327.666635400432470005@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179300378438.3327.666635400432470005@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 09:36, netdev-bot+sinfo@kernel.org wrote:
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - How the issue was discovered, e.g. hit in production, hit during
>     development, syzbot report, manual code inspection, LLM or static
>     analysis tool scan.
> 
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by code inspection). If it was triggered please include
>     the symptoms, like the stack trace or error messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
You should reply to the above questions here.

/P

