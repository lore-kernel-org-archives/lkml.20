Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835363;
	b=sa1eP7wrGIxfkr6SbLPA4vyhV/3mJTQpB5f4+YiM7HjOF/GZCnHQ3vN/sgAlrdvGymYV
	 MvKOTsANW6svpyuK0KZfPd4l6PZmmNVD1sAwAcS7Nd58dBQjAIzf2ehYadtSBxiI31YKW
	 c8OFg8laMSWry8kV0v4xkbwsE3CsG67/lYD7bOQH+D4ASYrhb6T1uKQGXblWZ/T85T768
	 puMW5fz1v4w/lBM/Ov5e5bopqwdqBD1dVrz8CTsktX9MHUB7rMwII5bZeNaKQEc2gEh4p
	 /fdqWi1DTI4av4pNL89GyhTBku/UvbLuQIak2B+6YNL+BQqStjn6XBwhofm/WR+bSPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
	b=pE/of1u9t4BDox7gQhbCYvERpnN+JlgjDqWvLE9NaaFVVA/4G2W9nCfEqTzsPFb/aqfA
	 Ny8UVK/+Z8i6UgoGUuXlP0Imn5ioF7ESiQvEYxAQFxpni/uXe+DdeCE+FmrFi29TUqfrh
	 tBS4L+CbSo7Xa1+oGT4JsOSr1tNMvVaQHJFzzpNXvdia7HrrbVZvMFOE6RbqHS8nHjhm+
	 m8wjwyAJW5SuN0Izbi2d51GjK7+Zz8bdpKYOX1uwtcMSIJwJYUvpMA1CLdL/X0Qwozp6Z
	 YNdwmt+KOuc99ryK3pR4/XAh6dAJadUa/iDuHn0iJIUeXX9KF7+7lf1LBku+LyXUVEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJMJgTdc;
	arc=none smtp.remote-ip=74.125.230.193
Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8455C606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8455C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJMJgTdc
Received: by mail-qk2-f1.google.com with SMTP id d75a77b69052e-5332a0f6dbbso8351581cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835356; x=1794440156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
        b=SJMJgTdcGBlQsf4zsbrbO1j5AkB7ELH4/WVaj4Sdyja5e8Qsu41MqKvyxQgJjRsmvv
         WB2WEmuLJYf6rFz6iWK8B8a0Qq8ltXqfC3dLLnzSb/Vr1kzCqcVcDQZ3cIfBHOZ+5v5F
         BLE6BusncD13AnA+suHKkbOfoVPCAwy7EG8dZrxWIbo07psQ3pnSg+ksINDz1A9UUWrH
         6Dd8sem9Gf8LjO7S5z/9LOgyh3nnxfHBf53t/4egxxRnpdKvyogEIV7ou2TArLsJ0HCF
         m+eLHxQj4QlJJHgWrpJlhhc2fC9xqCmbyf3EoxeRtwyCaKY2DnrxE2PcuGUmjyMKs6Rf
         jPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835356; x=1794440156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
        b=DQH7CktwcrI1Ih8tUSagfD4ktqDVcdXvc58/mIBetoN4xwvK3E2dyNc/9YTveIxFtW
         ertblsxP7yoUtXxwzKJLudpEpDrlKCDgQpVtseRmeTqUPIxDWEWCMhqowtZQUspZfPXC
         TcZT/DjGf1/Q+/8SV/xzXjDH8mxilB+gUmylE5y7IgJMq+ooQDm2lhFJfGS09Nzdl8q7
         aHiGABPiwxXSlpYoOCsrOUrU3UIUaOjZefyEReJIpOyKQAMR/49LrIb4bcvx3Pm1o5RD
         NxvaxbNGKTZZZRK+AlWYKEmqDmBdhjsEZ81XTQeee5djOSVAhyPDuZVtCt0fWFcdUH+A
         m49w==
X-Forwarded-Encrypted: i=1; AKwUvBy4gdm/T6v74hA5bteCLAdHNJmyEA0qtugUbgOa+KL1QFN8bouK/YWJK1rWqQMhd21ubliKstvgJxH8VDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z96a5eSAhq+Zsnp4DVhYnwNwsmoDJpd3JfXgQN6XgrwOCfXZ3Uh
	AesH6hLbVhO1qtI8HCH4JmL/zgzLOVRtGKgPsC8YX9/PoQ7AWj7ewsjJ
X-Gm-Gg: AYBFou2zLkXg5AH2A/Et+4wKyV33a5mSYe/Kka7XAvz/yvQikHKRZdpeVrYf4KaTl75
	ONqnCgXLDYjZnhMH/9GXUg4BuvBLXaIgzWWsJEJeXtu82/zEqxaORbwFjMlXWK72vGSlJmFDVig
	4P9WPIDQ6DFzU/srtjFfFTv1HTLdpxKYwilIqJ5QzOzQ5t0vsBbt8rX0CeRHj68zbPnAbUP1CHR
	cgZbJm87gFxm4c7WjQtYLQmskQNHb+iLjZoQwmw877Sl/rQpVs04cXhLO50h1cyPeiB12PnLiRf
	AhUQ2kuYGZpVsGuE0i1XCKZwxu6231UXz5y6NhBN4VeaePCaIJe3XBuhA41Cq8UNK+D14zBzow/
	bJXo9skIkXvuoM45jjvXBTl5v6Qy1cI8J52cKPmkHTQR4RZ6S2FV+OQsXyxoyq9tQDgk4mgentp
	wNJ7OqRwKlWYJp0FVokemXdQjOlT+ogUx8E1TX1WqjY2zhmNReAaBVfH9fw4at12OPooRUK/9mL
	lnV7gWuXOUSV9G2F13joEBaJPvwFblPiupwitxNRPgoLFegiD24RB3ykvzfrJvhnqIA0ZEHOdTh
	fBfj+ZLokcs9qzUAKpOFlUAezQ1jokX5Yw==
X-Received: by 2002:a05:622a:1aa9:b0:536:766f:271d with SMTP id d75a77b69052e-542b781f632mr306774901cf.51.1793835356393;
        Wed, 04 Nov 2026 15:35:56 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10a63462sm36858141cf.15.2026.11.04.15.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:35:56 -0800 (PST)
Message-ID: <2a1728c5-2856-41bb-9ffd-c80df4ffda6e@gmail.com>
Date: Wed, 4 Nov 2026 18:35:54 -0500
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
Subject: Re: [PATCH net-next v5 5/6] tls: send a KeyUpdate at the record limit
 and on request
To: sashiko-reviews@lists.linux.dev
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com>
 <20261103-keyupdate-rfc-v5-5-de1ab90a88d5@gmail.com>
 <sashiko-outbox-198141@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-198141@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 16:43, sashiko-bot@kernel.org wrote:
 > > +   ret = tls_encrypt_async_wait(ctx);
 > > +   if (!ret)
 > > +           ret = tls_keyupdate_rekey(sk, 1);
 >
 > [Severity: Medium]
 > As reported by Sashiko on v4 [1], can tls_tx_key_update() ignore fatal
 > transmission errors and rotate the TX key anyway when 
tls_tx_records() fails
 > with -EPIPE or -ECONNRESET?

Yes, but this is not specific to KeyUpdate. After shutdown(SHUT_WR),
send() on a kTLS socket with no KeyUpdate also returns the full
length. I tested this with TLS 1.3 AES-GCM. As I read the code, the
KeyUpdate record then stays queued and TCP does not send it, so the
peer never sees a record with the next key.

This corrects my note in the v2 changes, "The next call reports the
error". In the same test, the next send() also returned success.

 > [Severity: High]
 > As reported by Sashiko on v4 [2], how is the KeyUpdate state in struct
 > tls_context synchronized when sk_stream_wait_memory() drops lock_sock(sk)
 > during a send or TLS_TX_KEY_UPDATE?

No change, for the reasons in the v4 changes. I checked these points
by reading the code.

Points 1 and 2 need a TLS_TX or TLS_RX setsockopt() during a blocked
sendmsg(), which is an application error.

Point 3: tx_key_update_reply stays set after the update_requested
KeyUpdate, so the reply still goes out before the next Application
Data record.

Point 4: a record that was already being written can go out before
the reply. RFC 9846 section 4.7.3 allows this for records in flight.

Martin
