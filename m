Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793844565;
	b=UecZ88zJzKqVnwaQj5pDUQcgi2GnI7H2MRbZk1/spAoILsHHJeWpUJLcUrj6JryBh3y6
	 zAIQxZBznzbYB/UPpusGkQwpAnR0oELcllwpjaBPizoCReTxwugBXVSKHqaGNRZnZYZFi
	 hE/sgZkezETKD8kk6f/6MsdvkJGLkxbuiJPKnscCLA2azkNMjG+5z/y6eLacMUbbS30rO
	 uGRvx9Z83SF0L9wL94LI4F5N+ZmRJYYdepzc7Bj6iwtTxQrSrU9jqZAKYn2iSfLmP/gFT
	 ch3IvgwsmuOnUv5xgIny7mmOBKLJyJmv1xvJgnrNDaXfKQBGWWxW7e1MjhuzZgDtZHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jDAfiOlVrfcIrnBYrikcNDpkrwfsc7W/pzfCEuEFbJk=;
	b=YeCe3nhPrirRFozeq5icMAHPKWG+dU8ldweXTMJj+UTRfCLJbGTIzQ3QRo818Z3Ddc2M
	 occoDi6MWT/Ytop10s8zpCilw0LLTRHFbxwmtrWhzNQ1cSfhBj4KHpD7j+konHTOKkrTw
	 +poNdgKEl/V52kfLeKtyS4vcjdpK3Y+xIwyoGe30pFYY0US1y0k32IfajJWNHp2goOPCO
	 wHx9dfP2jRKB+exbHo1dyToSar5EFI9sia4EJiCnMKguMKG0GGc1VcXCdBhZ8m998Klxf
	 Z9QcNXlCw/DvBcc/Bjw8GzlKuX8GlDrqEX6e5xIT97DtvXoq8VUp0mi9QCYPDNVMP2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05926606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05926606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4f66bb2ab57so530937b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793844564; x=1794449364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDAfiOlVrfcIrnBYrikcNDpkrwfsc7W/pzfCEuEFbJk=;
        b=bQKdoPaYIBZlncDH+3xR78NU4SZUy1UNzYe4/3iE/eTtE3fc1boBVnfn1qAh43yNoS
         Yv5rHw9B+zMsENMqNuSO21592z1vYg7F1Vb1HUPUBdPXtD9BbCv+q2xYF/6n43abhPLo
         P28bN+i/ukbP2L97wRtjJUFA2G0hg8hcmztmrqIfwwPIm1DkyKgR834K4zCUMjXKhssv
         TFNluPBDfBn1byhqxr1I546yDOtxyARPVZcWaXqv3T7oHOf591/5YXxH8guy8TAXg0pt
         z3lGong9nI1CVZqT9ZnY7VtfMLaXAJeWRqjP0GKbqsphQ7oy+C6eiupBdbyjtT9Qatro
         W/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793844564; x=1794449364;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDAfiOlVrfcIrnBYrikcNDpkrwfsc7W/pzfCEuEFbJk=;
        b=G3dn5bMSHQW8vCGIR1zkszSVMB/+it8kMiT1awGFGqWrHMA5X/RZHrz2+Qs2Wl/Ngt
         Qn2qnbyjXsXbblaUXbbiet/w6D930v9Ct0hyHeq4vzxpwHs27zwOLwhzIvFJc4AP6W8K
         U13GSrpTEOSd+OiQ6yMwWXUP3AYCoM3y+6NZnSPrhDjXkm90Ca4qy3VOesWo+J3VV/kM
         BlMNBGcdhEYP4kiNJ1QIngATZIRf6Vomyos0NNCH8WQJGcroqxu2SpKZZhKI8YgU4CBC
         6fipVb7YNx0iiJHhX2YKr9LYDJMmkWWyhxId2vBT/67J7VozeFbw22e11uXmVVF4y19b
         U7IQ==
X-Forwarded-Encrypted: i=1; AKwUvByeT88S1wmy/uFTymHqq3/KwzCVu5qPYRTSrOsJeal59gMhn2JtIWv4oP4i7+lLzY9Q548gr7ZgyJV46Mg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vt32gOhZjgcr7uO54UIvRMGbliMCJrEfOry8zwGXjHl7VcTZ9
	RcCNIP2TWOCwT6rvsOfySsqzeoYNsD5OL1tJPZsQip1ogiO+cBzwZ97R4Z9AjAqAWYI=
X-Gm-Gg: AYBFou0Co4LrAhE8Kv1fRchCN+jC8/rBEbieo3D37rgS1XSmSvqW7r4e66PRG6PH6Bt
	UQLA7GEtiJhOSYIb0N/PQjox/wJDf59JCdOUfg5oXVx6JNQJm7UltTBYoOTccaSDN5rh/8l7Xss
	fxTS0GY/okD6R+7FjIZQrIUlr2F6k8KGArqabwYbJ0PL7jh+dhvlFAKUekBHRyPiBKZIhsqSOV0
	kmKHJLR3a2Cw/3iU+uiaiPCoo9BgDo/NLWlf2TWo2aLvKSkh4H2VizRauNp58b688m74frpIUyz
	LUtD2nu27PSszk3dahaPgqXJTV5z4tR4FIQIgrRQ5H+Qwc++oA7x1sO//JLex0lOcUjbZC+8Qny
	ygPbQ6+G/oyq1dNJtgHmgLa1Irccq06IujN7/jfQOU1VhxTSK/VoVnjX3KKvvIIHJGZFOyDXp33
	/tJr8ELQrPf4btsdAGKdkzyG//IqN28ir56xHSK1YaD02g7oQyAEhF7uYUqUeVEnBu957qw1sHA
	BVnyf8L0NYSJO90gMPtXSV/M7TyiCgGmaB2HVkAgTGwOb1ltbwk9qeECUQffqfaBKO4UEIgMbUx
	FER/ErvG12l5cA9vloBfixJa1nJPvw==
X-Received: by 2002:a05:6808:11cb:b0:55b:f88d:6ebb with SMTP id 5614622812f47-5640df0a2eemr12633362b6e.54.1793844563998;
        Wed, 04 Nov 2026 18:09:23 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm3235689b6e.11.2026.11.04.18.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 18:09:23 -0800 (PST)
Message-ID: <8feef6c7-df8a-468f-863a-fb2f83c5e478@riscstar.com>
Date: Wed, 4 Nov 2026 20:09:21 -0600
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
Subject: Re: [PATCH 1/4] dt-bindings: soc: introduce
 toshiba,tc9564-config-syscon.yaml
To: Conor Dooley <conor@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-2-elder@riscstar.com>
 <20261105-irregular-awaken-b329b9c37e70@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261105-irregular-awaken-b329b9c37e70@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 6:28 PM, Conor Dooley wrote:
> Actually, can you mention the other features that this provides - the
> service it provides to the mac, for example.

Yes I will add that in the next version of the series.
Thank you.

					-Alex
