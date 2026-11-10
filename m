Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354847;
	b=QYzeYc3JVYeLJsOUK3wtgRKdOnKwiqdvNsgg7qwYaiIdM4SFvObDnfbCNcOpI9GXssTf
	 eGSGKw+ZNeBSuS/rOG/Tsdj+ydVzJXAoMVsU7Jj2Nkd0//3EIrbpyLqxEuNcT76NBKYSV
	 IubQDrV4KnQR8dNT354vg0RiWWxIGjXG956CyLdt9cy7Uo59mHyIeoSrrH4fyLMr/5qqE
	 ToPi0pIpNFD/vjVJnV0T7fNKMCIJQSS1/3MfSKF30ENhzESQgI4DC+jmGqqlDjXU3+/FZ
	 2e8w1NSm+obwCHkcLTDsNDmboWyZOiYz6M2F6zMccQ0jHmN907HTYUc+L5MsveL8xyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2d8xjP5r+JVIA4NnCjXwCKt2E+WzV1EK+VugnrMgol8=;
	b=a+CcJBKHLjhVBhaC0PFqAFqsjhDUm9uS7AdPCshCo+vL/PC/N1g5b+KRVrSt+7zTIxtM
	 G+ct2AKyIbFqBU81StYTdkh19rLfjzpR0Bj4F2wZrHbGXZ/mST4QFIWuzm1B7OOs6SiI+
	 6RU9UcDM52ZuhD4ShciByGtGMyyqF4IgYhkByY0/Cr+uoh0qrN65nAUz59CbpFeNaW1rs
	 x9zgzNdLDTKlah3MCJQhC5gHI5ZLAtsaOLAzNV94yHd+/EIFD+yO9gWrDzN4/kzBGvLxu
	 H943jfqd/pr94RCUn0CS0nCn5wpipDzo37OHJ7exoOu3g/VaBxtTrOHzfEgAwuGuRvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OumB8stl;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961A6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 961A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OumB8stl
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5365d26ccbdso30384241cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794354845; x=1794959645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d8xjP5r+JVIA4NnCjXwCKt2E+WzV1EK+VugnrMgol8=;
        b=OumB8stlEQNw4k20Fil1mn05/tVHvxxuppK3HENY7thCNHl6LAWHoUj3TY1XYyZAe9
         BZHu9FqZnlI+T6aqrRBWYW3frS0xR7sizTzPqhXxiu2Va3DLcafdsNpt/BtoFnpi9hDW
         Es3DFqCsu2mP3X1g7XO8heqN8SIfuMm5z2Cs2H3zkLJVOegG5Y1U5Py3ncnjHyD/2/Bn
         jicevD8wGB774xbJECFAZPb072daAOkq42lGoIQmSs7kH/V59GCOpr78pvXjsyfD/PuS
         8KW9BpHg04R6q84LIYYf1jJpcDv+oA6V6deMIlI2+Hrjfm6O9TdvxIBX67TXr5YzhOCf
         kfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354845; x=1794959645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2d8xjP5r+JVIA4NnCjXwCKt2E+WzV1EK+VugnrMgol8=;
        b=nWmkEuI078cFguIkRtWcWamPazmJRdS8eCOvZlZuhSwBwqud8BqRRKWaOJz5V36KXF
         ROwZqnYcubCwEcWGLJoWIvadj6tVYx36z/nPfECRmm+ZV/+wQ9dYM74z3MAZu2AMwdX1
         7AuR4N6wAW3Zl1gvhSBS2Z6CB50GPo6guOwONyHQFizTRQ3nybRZ9EovgSfGOGntNGx6
         snfQ/k3b99aH+br3kf3KY8kJA4P5PD0wz05mnnZSQICO/d6KDrpx1t+yj47nWnbh729C
         GldcL0TOh/lj0rUG1qg+KhCKBMyQMJRiDLOzx31bES8i4qzkM2NSnxM5FV+i4P9DHLOJ
         YJ7A==
X-Forwarded-Encrypted: i=1; AL+hErHbyoJn3AFIjNCTPNRlazUGEYDblPnvi3fV9p8iW/s38/T5K86HRcbWeiyEfHK4KoTdIMBVcnMiU0FDvv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JeYQKj3n2nADZVPWe4LF8iVE3mdlVjxQStFlysEdYM4HcM/V0
	FoVJcz7ryLrVuHfxsX+qgI9K8tTrqo2rXpS6WC4DgIRE41z9wSFbhTQcKEIBpQ==
X-Gm-Gg: AYBFou3aFjWlPDDw/WJY/b4u7cLOL1Kk+Ldz2i5KHulJVvQONwb8hh/3vZ5n4UBi3+z
	XFdkSk/VEW0TvNf2hyBmtEOc/xgkrnF8rJTcJeFy7bHhYG8CWXMXbfNsUskJUtDA33EsbmRME4V
	q22+4Je+6XjXsrVybKXZ23Z//RrDWABTy8eOrrdkeE1UqeP7HwcyNSblEqbCc8CQZ2BGIXf5wfp
	Zz+gNFW2hDMVZ6fPRIUkwKUVs3yMhwytIF2NADaGErXNCKBLjPCSvcLlpivZB9zd9/2FS8Z45mR
	5DxPL7lZqhqAAopRlUwZVm66XumqjH6o6smUepfgFeEO9mDOBPLMlxXqWa2G2Niwve86x8Suek3
	Dco70bBQA9iCjKONt92Q6p6CuSafr2iCrAcDbr1Kb0SFVYau9BFayxTAJe+hhScHMRB1AJwIvNo
	PzqTCf+2B6NZ9vE+l2U8lt9rgkcwjC/d0jfWUzNNee/vlUeS7/UHuPc6fR6x3FdTljVk07xtsGb
	e1bRQiFkd6/7ypb5SocG4ldIeLtCca0eSbrM0NhgqZh0NaQhq14F64cqnKa3PnZ9y5mfEQoxvuR
	9qT2JAVBISGg5wpGOZFQpdcqE5GRPJxv0U71L1oNAXUCOD9hY0cpZMuY
X-Received: by 2002:a05:622a:17ce:b0:536:7220:1d37 with SMTP id d75a77b69052e-556c1774465mr8212881cf.55.1794354845627;
        Tue, 10 Nov 2026 15:54:05 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-555065e4ad7sm36418931cf.0.2026.11.10.15.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:54:03 -0800 (PST)
Message-ID: <2e4cd839-47d0-495f-90fe-c5f4a9344bb2@gmail.com>
Date: Tue, 10 Nov 2026 15:54:00 -0800
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
Subject: Re: [PATCH net v2 0/4] net: sb1250-mac: ethtool link updates
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Daniel Machon <daniel.machon@microchip.com>, linux-kernel@vger.kernel.org
References: <20261110230300.2769327-1-f.fainelli@gmail.com>
 <179435473107.2168702.11847862148663488665@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179435473107.2168702.11847862148663488665@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/26 15:52, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by LLM and not proven at runtime). If it was triggered
>     please include the symptoms, like the stack trace or kernel messages.

These issues were all triggered by running ethool and not obtaining what 
was expected: link information, checksum offload indication, auto 
negotiation restart.

> 
>   - What hardware the change was tested on. For driver fixes please
>     mention the device (and if relevant firmware version) used for
>     testing, or say that the change was not tested on real hardware.

This was tested on a BCM91250E (Sentosa) reference board.
-- 
Florian
