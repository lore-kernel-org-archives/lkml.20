Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7E23B6C15
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275254; cv=none; b=RXO6LR4Du3stLj44a7Y3AMEJzLgzh97GFUEfihp3Eo6Rdj+DLLhI7fgs0mp648WUwbW194jBcW7P2cuS6GU5gsxcAwsUvEHm7zSXlNcYxzp0/e66QtM4QZiLo2GcqhjsZMYaGkM+ht08S7fz8+Y80LUXuBI6ewmWHKhjsbt8aSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275254; c=relaxed/simple;
	bh=AhTSB+hX8DW5/UqPj/kPlDv4TilOhsZezix19Q9Y0hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBum2dushufF/GsoS8FmTTI4aqToSKMJBqUmmqzcAIVGmC1tj3QsM2NVNdASxkTLVNNWDUN0RtPLxG2H1oQV78P47yucOl+CY0gUCyrQ86wp95HYl2w2A6oBaZ4BXJS0Ni51b2esmZrOW5hpfAPILoSHU/OqVkUnk8Q1OsJSKeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YWnPD1cK; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YWnPD1cK"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc1c9879395so139403a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275252; x=1791880052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aO7ZMNOXH20rZFoB1a96CWPC5jLhbhIpE9Whu53E080=;
        b=LsdFrcjb0prcC3p7K8HKNnmY4ebeJykeyMoj4zO+PlpYdM5b0/gY43urD0RIRL5So2
         eekuVRb3djZnUl2fukXMS6xnQSSfGmDJRaPbJhHaO9Y6kYau2qXVPhWb5pQsdN1zdDMI
         E4jrrklXs+77pwHZol2gYLzLB7vpJa+raw60s7YOTxZKv0W2hoXKuf97sJQG/s+K84eh
         na8UTeOWeLJjL3wHxBNnxSMYLyTRMvgWswPoWMT9d7IH/96uDC3+8Z57L7U4uGxsFwYh
         YQx5OS2jPg8LLbN9qdEe4sIxKVqn9bgPFo2N8qZH8U2MJVLGsTfrv8qDJ++5UH/qOK1W
         7bTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXWMNasedBLqfOIOfhoMqpvxsJLv2FxGnrRHe5YfHOaVumJ86nyfX/iUy2Gij3Vbp3YYFPLGeoPQFcp60=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaLnYv0PDNcXfnilA9mWbnX2zJ0HXBWgXyeScTnMQWgzJZ+yjl
	WpzTLc6NDJopceX8fy9b2Bj8HrAB8RkCF6jrwT+Yx5SsgNFNTRkhihLPeJVa81PJthHyC5umgY3
	p8yKbjSsClZqa0923Y1Tfu7lHIn2wMFkfyDK8a9dDWiiOEWbXOwZDcU13Q55cRXkNhFw7kuPSRg
	ibBMVoHOYcjbwXwnqZZLZzu3yqtbdyPf8MPg0WeCNbcWWvxLzrgswoTdAMSQYjtQJNvWhw5qIte
	d+3og6jNeszHGU3nI8KQNI=
X-Gm-Gg: AYBFou3mFDZ1kIDAAJDDePE9XDD9xN09Gr30QzsC+kY8qC/nVxjL2+us7mpnZ7Lm98u
	kzCXZDGs77NT1idFgVZqrPXHyydvTCN+03XhUlCFKxPQJpqUjGzm60LOkKN7TKQnlPr5MmPFyEF
	Xw3/I1grOvvzNLAXcoh3kSroVr4GJeRdanzFKLMDVj6YZXTIH7PoCy1lejw/zIKetCZ57c9NrHk
	M4cIPV4DSqyM+hYhqzdJY9/c2NWAYAURakb4z8E+YV8im88DZpLr9UiwAiQWf0SqgLf6MOwUxv7
	aN3wwzUMZecUGFFg8KuZtBj6dGIcUHi5UB/qA3mw0cp54YWu4ujYrP+lmDhUcGXrOWZSTICnLdw
	9HJrDMtY0N7c6U3ZHavJ947zn4Gkqo9jvCisvetlcahcH/ndYZ5zwAUQuXftJiyQfEzNVgHkAN5
	tzq/CWkeNKxKJfXWGrwUbKt61G3PTe+eZcynfNH8M9sA==
X-Received: by 2002:a17:90b:4b8b:b0:3a4:bbb9:e912 with SMTP id 98e67ed59e1d1-3a873554092mr538367a91.23.1791275252313;
        Tue, 06 Oct 2026 01:27:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a8543792c8sm912446a91.8.2026.10.06.01.27.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2026 01:27:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1416f32fe11so4979689c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791275250; x=1791880050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aO7ZMNOXH20rZFoB1a96CWPC5jLhbhIpE9Whu53E080=;
        b=YWnPD1cKKv+BA9qxVUDRvhJ12vc39zoc3nN2jC2KGqTtbX3crNdvFDVFXuJuHyaZ+O
         CQtpD0ZDauOFIfP/CwEKHoxGLdMEgvN7n7qi6SZ3n+lMTIkHjF0vgiREXyPi320/R+OH
         xiuqZ/rh8pyH1DGqoQapZvMzn2kBEix92aqlE=
X-Forwarded-Encrypted: i=1; AKwUvBwFAB9sKDJoVsfLxa7ezM7OnJ9+hX9i5bhWeNLuFkMp44PMCR7NFlQHEWMezEwDJ1yorN+MdpYKij5pp6E=@vger.kernel.org
X-Received: by 2002:a05:7022:288:b0:143:4d12:396d with SMTP id a92af1059eb24-15ec7b02b1dmr978954c88.26.1791275250411;
        Tue, 06 Oct 2026 01:27:30 -0700 (PDT)
X-Received: by 2002:a05:7022:288:b0:143:4d12:396d with SMTP id a92af1059eb24-15ec7b02b1dmr978913c88.26.1791275249521;
        Tue, 06 Oct 2026 01:27:29 -0700 (PDT)
Received: from [10.176.3.41] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d83d6af11sm5335442c88.10.2026.10.06.01.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 01:27:28 -0700 (PDT)
Message-ID: <802a092a-314a-4f77-aa1d-134b3d020069@broadcom.com>
Date: Tue, 6 Oct 2026 10:27:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: avoid sleeping tx locks in netpoll
 context
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-wireless@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, stable@vger.kernel.org
References: <20260930185417.61865-1-kmehltretter@gmail.com>
 <20261004122910.1392318-1-arend.vanspriel@broadcom.com>
 <asR1TaKQJlPFqEvR@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <asR1TaKQJlPFqEvR@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 06/10/2026 06:18, Karl Mehltretter wrote:
> On Sun, Oct 04, 2026 at 05:29:10AM +0100, Arend van Spriel wrote:
>> Is there an opportunity to reuse/refactor brcmf_sdio_prec_enq() rather than
>> adding a separate brcmf_sdio_prec_enq_irqoff() helper? For example, passing
>> a can_evict parameter:
>>
> 
> Thanks for the review!
> 
> Sharing the helper with a can_evict argument is cleaner.
> 
> One queue user does not hold txq_lock: brcmf_fws_bus_txq_cleanup()
> dequeues through brcmu_pktq_pdeq_match().
> 
> Lockdep instrumentation in fcmode=1 and 2 confirmed that cleanup enters
> without txq_lock.

This is an observation unrelated to the patch, right? You mentioned in 
the patch it only covers fcmode=0, right?

> I combined the helpers, but kept brcmu_pktq_penq() for normal calls.
Sure.

Regards,
Arend
