Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329380;
	b=mUCTEdDeJlfIwr2jMoU0FBvCdOkzJzw0VbkTiTTZSs03gsKTej9iip8MI72VXyFLC1Al
	 Krn3fpJVpcR+7JHpdVBnkTg5S2fT/xbcgWvwtMPcRzpYxJYjNPqio8bzojixMBFXlkFZ1
	 YVddgq5PCfG7JgmMr3MRZ531HV3jgOC/mpA8nuTcYWmNyncGQEs3AXGS99VK6imlcQYjo
	 SXxqy7wAKQbWLa+VCPsOlvuCQCK9WZ7SLLBLbQ3KRtjS5HoqwLCmOuarLE8/cx0o8Sg45
	 Tw063cAHanZjW5OfnxxJoXWZuCXmAoJkhbEKpOdGCBHYUwcFpqFyOoItTTud60TBtlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tP18IBGb4RAX2VQoul/BsJwOYmY36Sb1G+z0aM3/z1I=;
	b=1p8ZtSbng1Hk0UFnjOy3047mdZ/wPLrOszrv5hnZaFqYRiD5WgNB3GkRZWYfAbPo79O3
	 +1tTbSTLgOZUmMkdH6njRC69XtOWcU9giqilDpuzh2mwWg3ErcJblWqAV0akWrIXf1XNo
	 E2DY5C/toLl43As/iyoyBQ/5M0jjYhV/73Z6YAAGeCECrZuQONILotrxk9BFEzevN6l3x
	 prkSTPm9kuCWUGb3XQLTAzqATgPVqAHDIMWqPTTJgnnFRUj413NglDsEYF9LyEfJBgi0W
	 ALPUkvY2hCwfmjOgRCLzH30ESEVBcFE3+RrsXsPwSSUXaEN7kXqUK3RD2lOYiTEAVww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sd9gmcUC;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5C5606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B5C5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sd9gmcUC
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67a19a2621dso1548814d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329379; x=1794934179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tP18IBGb4RAX2VQoul/BsJwOYmY36Sb1G+z0aM3/z1I=;
        b=sd9gmcUC5EjvUfKx68rTBxuM9bdbaznz/tEwxEWenOWnU4qLBJS8XdmeO9Tqxwj+lw
         oW3msGNKD6Cc/5Hqirx1MWT8/n2v8Qjm9PUcuicql2WYq+rF8q44tafK9hFR2FUQ9pYp
         OvMf+F5cXA6oZ3QGRiy68Xwm+LHm3/qhIh+r4ya2txJhybsQZsYqO293qHl5BNjQg7xu
         kRJyWMJJrSkEmzH+uxkug5xGmR3DD1NLa4QS4lTBW9dhmtICsLwf/0BnRL47ootGLSEC
         AF1ORHoqamMIBedGpXGvtYQ5Rp3f+VaA19VjR2KGUb+z3qUm3l7PYU9mWCi/qlXOPrJL
         wMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329379; x=1794934179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tP18IBGb4RAX2VQoul/BsJwOYmY36Sb1G+z0aM3/z1I=;
        b=wt9NzWbgjQ0VZr0eVBpAJu3jLdjdmp1xxvzlnzv1eOTPf9b0OBNNY8GCH09LaX00jW
         YPB8eIQU36IWH/vzNFdHEnwzcAFBvNPrSMQlurSvzjajic+VuZny2BhfZ1voUL3P3OHN
         SowiVEdMm1xYnTtftDbYEYqYgWiUE9JHUcwKIG5Gs0V3ir9i0aVByFWo00iM3KRl3X+1
         r6gBQyZDZZTadMxk8NNMDDHyIU+UzAGjKTWXK0q1fNe3exVoVbnD1coWy8x+mtxrnme/
         EjolPGxXbySZ9QGql+E+tyb7ksziPgISlccFKLUElKnPS6pG41o7qsKkQGRNZWEMiFUa
         cnBg==
X-Forwarded-Encrypted: i=1; AL+hErF0wbc7UF64SmjK7QAw3yNJfohl17zvKZDBdipKI1osQq/Rspn5UKUTMe/Wh3Xxa1trR5csqYtnxbYeoJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h3nkNyctJWVNNTepIhmjJVGYA3XGY1u5XByfcvyZHA7j24Vg9
	iSiMcHpH8YwH3HW1RVkDfgXR4sw32OZ/Zw7JwzICEvBT1SIpwW+xKPnQ
X-Gm-Gg: AYBFou0mWKy+W5gpH5Kd1CSIB1K4jAdgCcdUblRQqI4JRBY1ryphGfufQhPVjqLRPQf
	u5gDgML6TwdODAXH9P1lnx89z+Tc4Jh3TSTt3/UqdJLfR8wJKVZGXlh7SHXnt/6r/oFFxfS//RF
	DEvROg/9h6xFaITwXR5A8lM6izZSTJIsKxl5cliVA+rKoI1D8BPfJU8uA3b+o4RwaJplqeHR77J
	fuolUm4cgycQZYvy3+uyDucvQMKAn2FOAGl8oblPZWXVtMD1gr48NHTtWtTfCgq0MSm4i3j9MDj
	U0TkAXvIFVYiKtpnceqY1h9nqWgnRx4+PEgI81tLkMdjhA1buZ59L5FyhWBkvGhIKwmpNFzgd/3
	7fnsrfkgM69qigG3PJfOCxHpuZaWkdti9B4n4MMAS7gjDaH98bMjckI1Xpp9riVyzekAQ46b3ij
	ktrwux9MpO5XCR56M544WVI3vv/yj79LG9OAV0sr1uR9aZyH+aQTHvL+8dAI5LTcbY6KbPTguS6
	MIfiQvLoHxEKhCnwMpGdc2rBb5oxUoB7XSk5m+4felmyeHj3lEAAIcc/JCMZ9AUV6db8ulp7GzS
	JwPFUVH3E6C+eo0xeY/BmHwcz7jBPjT68iVcUuV5VF0tljMjq407lRHFVQ==
X-Received: by 2002:a05:690e:12c3:b0:67c:fa4:2b9f with SMTP id 956f58d0204a3-67c566077bbmr2140240d50.15.1794329379380;
        Tue, 10 Nov 2026 08:49:39 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm2244105d50.6.2026.11.10.08.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:49:38 -0800 (PST)
Message-ID: <83246c2b-6663-4c52-95f0-50dac116570b@gmail.com>
Date: Tue, 10 Nov 2026 11:49:33 -0500
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
Subject: Re: [PATCH net-next v6 4/6] tls: update the RX key when a KeyUpdate
 is received
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, hare@kernel.org, cel@kernel.org,
 kernel-tls-handshake@lists.linux.dev, alistair.francis@wdc.com,
 martin.belanger@dell.com
References: <20261105-keyupdate-rfc-v6-4-99b695f9eb4f@gmail.com>
 <179424471155.994134.17986033334400694237@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <179424471155.994134.17986033334400694237@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 12:18, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> What happens when the KeyUpdate is not the first handshake message in the
> record?

Valid. A record with [NewSessionTicket][KeyUpdate] is legal (RFC 9846
section 5.1), and the check reads only the type of the first message.
Mainline has the same gap: tls_check_pending_rekey() does not set
key_update_pending for such a record either. With a registered RX
secret the result is worse, because the kernel owns the rekey and the
connection ends on the next record.

v7 will check every handshake message in the record. A KeyUpdate that
is the last message will be handled. A KeyUpdate followed by another
message will end the connection.

> The RFC does not forbid a KeyUpdate that ends a record with several
> messages, and the rule the code enforces is in section 5.1, not 4.7.3.

Agreed. The commit message in v7 will cite section 5.1 and describe
what the code does.

> Could the comment be reworded so that a future caller doesn't assume the
> old key still works after a failed rekey?

Yes. In v7, the kernel-doc will say that the key may be unusable after
an error, and that the caller must end the connection.

> Should Documentation/networking/tls.rst be updated to match this
> behaviour?

Yes. v7 will update the "TLS 1.3 Key Updates" section and the
statistics. TlsRxRekeyError will count every received KeyUpdate that
ends the connection, not only the rate limit.

pw-bot: cr
