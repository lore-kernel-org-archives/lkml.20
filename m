Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837397;
	b=Gk5ulgrGjy/XbPAVHgWGZPucRCujBBOXnzNhjrLru9XSzIVpqx24xuhwYHgHLhiz7dZb
	 8wPbO8zOO+b88M9bPp7GHCmJbrGnPeZo7mNqWf3+FzR/1pFV2MpXWT6+tp30bfyw0kUuQ
	 iRuHhqJ1GBV8w+gPjFXf57tZGx6IEmpYdrA/HyvDrIclHQXbj/Z97jZf89T5tVosb//yF
	 +4vXYqYYxnjFLKUd/jcFzmcePnq0Cg8vM+QH0F40MrBovVJ3bHYQS0kj09jKu7GnuYPSw
	 DLGjkffY1V1fdZXsMq2B3GZvAvnl10j3T29EvjHS4qWNOIq+fwhsQdmjMRBJnl//XRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=CG1nDocD+KP5xvfByl5vKPTVph1TcMgf2h/jQpKPe+Y=;
	b=Xu138Biu2jtjee89uRmLceMkOUe7CNZTxJKfG/tnGJ9LRsx0JUnBuEbv0AH6/dt9YJp3
	 pme+A477H/8b4DcdAJwGOU4vyJwfbVq97F4XcCIfdPb9sO10NpiRy6yrCX8XmihZKhKrn
	 mcGl4Bcuznhof1UDZs1DjVw8cUuAHCsOn0aWYtxIth1P2WF73l/e9oAF0cUFkKVQU80B3
	 kONZfx41P2dIi/dsaloH2W8dQya5u8jduDYrrG2ucGxpRMRO6j5KNsJIIKooUP5cdh2oX
	 nK5IsKh3fwosuQoJPZpmCt2pAa2cPljmIw4spahPfGO67ATs5yGRijO2T7ADPJNjtgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=g0mBkitd;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455BE6082BE1
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 455BE6082BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=g0mBkitd
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1272453c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793837396; x=1794442196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CG1nDocD+KP5xvfByl5vKPTVph1TcMgf2h/jQpKPe+Y=;
        b=g0mBkitdsJzkTXPdM8fkDVAfx5lRB4rqsTNxJdOHG6symjTGHc+AbN7Pg2AiTrhtDR
         WFshYEnwEJOp9KrR+ElNUpca9hcvBvgf8VhJ7BFa3vMZOBis6B6X6jrmtz4ykPaHtb91
         5Qx739rTER9V75MpZp07AeSfziWJQL9ZwfzQvuDS+bAfJskJkYl7V59BlhRsep/h+62s
         ZOsofMCMzt7Jnl0NNpTdu+IR/DbCtAJBZ8JHpp9a1sfCezbllGofq4llQ+QUqzFCx+o9
         BAN84GxTCOjKLdcRnGIU2S7WnKO3iqfwunYMkDpo4Ob5zTQ5EtAkfIVpzFAZH7wbw8RW
         yAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837396; x=1794442196;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CG1nDocD+KP5xvfByl5vKPTVph1TcMgf2h/jQpKPe+Y=;
        b=V5xYa68EFCJgE6XE7CnRjPdyFu3KQ/4Y6hol7BsekKRkZP3jYeHqsXkokF4dasuumn
         uKiegdcthqESSAuLYlsw0V78gdPoHdoe41LavZ/VQ+BOmlCBHMxwu9BUsfcZrGCIyzbL
         CA/ay2PsZHWCTg7qXBb9yZmVZdQMXfl+2IsbcqBcpwewLWJJsP35LHMTXTFD8YfURnC+
         q6tSE730KewYfOG7HwFtK7+ncjPvspszqTLE/0bNWGbrj1DgDd3Mp5bPpkrCRAzjINfr
         KwPFmr+m2TQNYmOJclPB4u2AeMsvN50Ibh3uKx1SOmkdahdSe6m/PjsRoLrrHbtfRo/x
         FBHA==
X-Forwarded-Encrypted: i=1; AKwUvBwuXvwLllAp262y123RvXYYWKrGUttFkBFBMK2hjMPKe1shBAhpbfR1JhjPuLZFQkq/HJI10sY7PCGVZYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DHNsFMHDn9yeG1IDeoBKYkbJC8hSxlEJimNcph912LcQ4wcNY
	SCTgfEOs5Zli1ga2tbPi7cVMWqjRiNKnUctuT6+GgE2W8/79Epl93RlzOP5lMzvRO8M=
X-Gm-Gg: AYBFou1rAn4eN/Zu9XwALajetG9Ku+zyPnGWwq1n2LqeYlvxOBnIgxXnI5VLp39HKY3
	KuWctmlf5O17n8F/fIIMTT6fYstrS/SJuelYpxexVXqU8Kc5pVl2Z8P5kmKCI1KK2v8+9HrIWCw
	1dIXFJuXR/xAWB0GRK8X5u8YNgTAhlHUbakGcUQv/vlCX7unjHOwVKCKNWOzjjA1jHjcljv040R
	fXJsCy2UU75ujVrwe/3i+iWEtxDfv55Y5nmwMrPx0JO8yJi44kVa0ltV5tf1ZJiF4cAYkPT4x8y
	l7mLDhWko8H9C5CxFb8nb8iW20uG7auta5QZO3qwae5zyM36QFuDMiljfSskldSxUxCXveFf2ZL
	rnugUc0D09h2PLfGvBh953AhcxPUIn0XovQiQ/RJwOXBp8BnemD+I/M0Zfwq2KYsgRSAlSXkQJi
	zvAiSax2l18DgwlUKyXpgNXQMRJBsDYdJhU644W7ptEzzk9BPkdZJAQ1R5b29pl9XniaSUNToT7
	M5JU9GQzE3nilsLFMlzLs24y33uDxarWbY2YFJEEBoI7spXo55tVQ5CZuNqw8k/aZtuxaToZYR/
	9DQgH0LFoqWEEmzx+R4WVJ45JIIa80E=
X-Received: by 2002:a05:701b:42cb:10b0:15b:afce:62c2 with SMTP id a92af1059eb24-1ac5fa237f9mr26911661c88.41.1793837396282;
        Wed, 04 Nov 2026 16:09:56 -0800 (PST)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c748eesm11075781c88.23.2026.11.04.16.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:09:55 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 16:09:55 -0800
Message-Id: <DMMUAAR38EEA.3CXX3YB386C6C@nexthop.ai>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 0/6] of: teach overlay code to keep /aliases in sync
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>
In-Reply-To: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
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

Hi Rob, Saravana,

Gentle ping on v8 now that 7.4-rc1 is out. Patchwork has the six
patches as "Needs ACK", so I'm guessing the open item is the one
design question from v7: what happens when an overlay alias names an
id that a subsystem already handed out dynamically.

The cover letter has the full analysis. In short, i2c and spi fail
registration with -EBUSY and serial with -EINVAL, so the device never
silently ends up on a shared number. v8 keeps that loud failure and
documents it in overlay-notes.rst (patch 4) instead of adding a
mechanism.

Can you tell me whether that contract is acceptable? If you'd rather
the OF core reject such an alias up front, I'll do that in v9. Either
way, a yes or no on this would unblock the series.

Thanks,
Abdurrahman
