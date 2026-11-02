Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793591121;
	b=gZeS1tixjdJFSqPwM2QfxrTJnC96azMNbrI5uq3iBPR/VvjRVrYm/gepWSEpndF5oWR5
	 iNcYe1zGA/SmIc3DPspH0/ih6Hx9s0iMkf3zdXosY5eobfmxQrXJW5Q2Y4Hq1f47RnIN0
	 ZFUnPNqTtdiFoSzxrgYgzySI1lKPz8MjgeI3w+4p6uCeCJbqZqBK1a3erJ8FFcQ3PMs9C
	 02odFiUceygItUurAjsYVRnOQ0RMiXocFqJ5rKXb70a8nz2QPwSLUVvG5uj+cHdob8Vxm
	 QgSozpcYmiY8eNY1PuiZNpnpkK4aT4iTWNg2L9qI/j2dVOyLiI4pfvr2hrkMXt25QwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=thK/GTnCI6aU4GgyCtkZc/ZGtFI5CEa1YKDFDXhlzew=;
	b=mBo5L5Qk+agAG41l7wHdru2Q7ATTFqWI0jLsjk1X7MdrEXwQPqkWNGLQScelw9IemSnS
	 wYMuPcT5TA357TLC/MmzNSU5GIjNK2WgpKYJ+X+zCZtRUEHc17h2JUoLvP9IszMkWXdxX
	 3mkzvXVGdWJHHHkm73qfqPVZqSXEhfRKd9YfFDo6MQRbemPq1yOX+6sPD6ZrWlx4WBKoP
	 5yUdUS6DWOqgwt+A/IX0Gem72b5ROeLK2ep2YvxN68SF+aYUM95+efQU4AxP82wfv6xNo
	 uOJCqffLXW2KVnFDi5JXjF/QrmYR+9DrBlvqdsFhKo1ioV0ccbUSb63/7ybqPsFITAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BVFjeZZS;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143A8606A337
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 143A8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BVFjeZZS
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-84abe8ecec8so1130208a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793591120; x=1794195920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thK/GTnCI6aU4GgyCtkZc/ZGtFI5CEa1YKDFDXhlzew=;
        b=BVFjeZZSYXqx7Gs3BH3l+OE6VwNuHJ0YhCrxJdjSUlj8DcMarADLR8MP9CtIuyIzH7
         y9hszyzulP98siDw46ft1EZNA0bq4oZa5vTGo6p76D30qf4CCTiloc+1kJnj4QL2EF0j
         LdAE2xvy3v3ucp7WMqisviL8qW6qiOyPGBDCzxHOSfPoDbWZXIxnPmG+6x9ZNIKnLisJ
         QCovW6OAzXrG9PTbsHnBUmhD6GQqAmUarvPmPCXJuyZms8fFFLkRm3YalKuATXAZ3mAX
         nj2GF0xHsytE7hriAqtHZenbORvrF9rXOTXDWkc+vdfH0BS9na0TElO4OI54ID7C0b5Y
         bZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591120; x=1794195920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thK/GTnCI6aU4GgyCtkZc/ZGtFI5CEa1YKDFDXhlzew=;
        b=YtrrJnFAZp4Z4RDIfUJaq4yurUHigaUNRrzl1s8PCKQP7+pXVXOj0j3R9tXsORUBd7
         KOPppLYbgOsLqHXoQxI1LuaUclorzxYVS+kXWk/yHR7nVtzXCRcYzdidhVJ2w+w0Xmlg
         j8yPf2d7sR3Bc75xaut7D7l6m75yqzXEIT23mx9VbhlG0jwwW7vs5q5S6xUBsIBIF9wX
         P3BYUw8Cs/PQF5nhEEQd3ZLn6izy7XeYRkUmsTC8dxa9GTVODiCTLiFBbDsWnGQpvp33
         LFXhET7b8Uz3Sbwtay91o87lWV6s0jYOkU/ZhtKgGli7Dng3mZIcm51keLZavs+Na0FU
         jjaw==
X-Forwarded-Encrypted: i=1; AKwUvBwLKIvK62FHcN0lL2tasHKhVnU7VTvQUN7vU2aKQsW9KVthZfuetPZLQM3SP21DArNBFN1cHp6PLOd+VF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6W9YzkunYhpf/M58zJxrIoOjrjdWYogezgbh8qlJ+H1nY2jH5
	NbIYTbM+okU39J41PWWk11Nhnk3D5wu+h2M4R3hN0hVUEewqb5Q6YYVp
X-Gm-Gg: AYBFou1g7tn6U/RsirefHRlIoW7JUckebZt2suH+7im6Pv6RQ4YlP6SGCK5MUpf4pCy
	9DNiQhNSbTjGPvkhFEitIjZFl9XsmLjzi/FpXOE2Ax8nTq0X/u2jJ3E3gE5L2uORLdxW+P1PSWN
	q9k8Yf6f0uxASy0eeDDeP++/KW1nRa6sSbKhdZ75LN0etq8VIWBJscd3Onf6xQBPCjN0WNWa4md
	/FgSLFkMmbU1N1jR92JndmVM+iW7MzFvFZjTbWWJ7i9ttF6D55BdO0x9lWJjyhawUq6YAnQbFv8
	trjqHlk1ivAlNBAprdx88eY55TBkIEqrmPMQyt3uZoBASEwxGnfB/HBplQ21eGoky8pQC5qiFtp
	AMHWglDObMoeDC2AT0fLli7y0k8MswuNzth1mXsocO66ZvYCowWgXhg9pIAbawssQxMlQztOs4m
	TrDaV6Qg1cxRjAaAGO70ECT4XtHGk7iG2YTHjrW2MarSEqdQkovdq8zZKJQ7Dht5egaQH/u1w97
	JXVerN8LlOywI1+0HzWntW5l1v3Ozpl8plbr8CjsxDakvJ09XVB8fQijSZrVbHfmQqhEgQDIJkA
	ehvlrqNKsZjJvnTOFlclR+FuuQ12odu9/Mipwj+HZsRe
X-Received: by 2002:a05:6830:4116:b0:81a:9522:f007 with SMTP id 46e09a7af769-85d3649508amr6210396a34.5.1793591119902;
        Sun, 01 Nov 2026 19:45:19 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354d2059sm8172551a34.18.2026.11.01.19.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:45:18 -0800 (PST)
Message-ID: <b0c42b21-6b28-49fd-ac07-7af1456de4b9@gmail.com>
Date: Sun, 1 Nov 2026 21:45:16 -0600
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
Subject: Re: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260929-usb-mtu3-gadget-completion-callback-fix-v1-1-8b75b48fab96@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260929-usb-mtu3-gadget-completion-callback-fix-v1-1-8b75b48fab96@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

Gentle ping on this one too. Similarly has had no comments since the 
resend on the 29th of September.

It fixes the softirq WARN in the commit message, which any gadget 
function that reaches netif_rx() (u_ether in this case) hits on mtu3.

Thanks,
Ryan Brue
