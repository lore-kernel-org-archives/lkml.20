Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199854;
	b=CtoMsExwqJV1vDwv/KTzuNzNpVKEOLPJTKe8biToh6zFYaOYiwvRmJEwQkgpSx7CIhHm
	 dmjHDFGwTCXbSok3xBah71wY4s95OQ6AQJlpW4x7AsUuL8xfZgpSH3C9vBw0Su55nC4D+
	 lV2TkYFb/32mhBXKnDTYBURWgp9CCpKpzbbM4Hx+Im59TaOyobdArUi4yKGg4scnPJLWt
	 JpqnwHgB4HPGFRITOV9OFFNnlNwM82Sb3OUKpM0WpF9iUXzlGDrUxfPVH83Oe+276VmXV
	 xsRc5P5GkiW1W7LCEdI3dRCnqa5wPdgpKddLLP7PscGh+aI8Xrk498kF9LPAsSFSIWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NCXqgS3tOYFFVjwacZ7xyDyYJmCnOTH5vXf1QqB6sJE=;
	b=D0gFB3773132Ph0dk4/8QX5S8xeohJ96p34ERPkNYPUKCKVpVXXE/H7m/kQ/kFHKXYGb
	 cmbKyfXE6qdp5RtZVV2RM+92SYMzFwD/olrcywpA3IhDDg49r/fIYyaoUjPVoWYbyNyrm
	 EYIwG8pnFcaYqkSJC4JAjfJGwsoWWlx3Rl4o7XJebocfA461r2nC6QYoCOhLzT8bmenRw
	 aKggTji/xK2o7eJZpdqek8hnqsSvNRkZoV62wUU6COl+HLgwLi52kareOYMCGDHt7I/ax
	 se1QZunVxW+blS+T+YRa0Yd3tGPcSDHA4B2EKHayONDm9oSiofKho+73RI/D+/78E5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLZ39PZV;
	arc=none smtp.remote-ip=74.125.224.132
Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95030606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95030606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLZ39PZV
Received: by mail-yx2-f4.google.com with SMTP id 00721157ae682-8aeed29cae7so2467677b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793199852; x=1793804652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCXqgS3tOYFFVjwacZ7xyDyYJmCnOTH5vXf1QqB6sJE=;
        b=nLZ39PZVwL1PoPlygMJlIvcfGuuOPrNBWgv24ZKvoP+4t/gn+t6AfCvFVEtw91cRYs
         G4R3bB6IjLiZ0bZyeOk2XHgNpDFSKfgZw0xwVTbvXIr59b0KfqJz7wgoh+o7Gpkawwut
         o8H3JNQdNVwJy1w6v+dG6BEwXaFdn3InBqT6PYH0cLV9KYYFJ8Z0WWgckKSvYTmdo+xO
         m/7O88442GstrD64mZzKw1j2Zov6MKaQkjvZXJJbc6ZUEr9YsszkYk0FJ5/uKBk1x+0N
         bBTSrMzVKLUC/Oa3bY2vbixte9U3e1qfIh6Kac8HXnQz/MaycDPtIjd8rHvOcVBFVOd1
         m8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199852; x=1793804652;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCXqgS3tOYFFVjwacZ7xyDyYJmCnOTH5vXf1QqB6sJE=;
        b=me5oF+XJOz3GX1aqas7EOeeRj6TkntgpDjCZHLQAc7qzc9p0cM5/BUgrROv8FdHE99
         X/Zh9+byqKpZ/vyiOmlpJdw7n1J5tkxYyz6/uD8v9lxRCtC0X1jZeanc+WH7L+jjNkMe
         w+l0C46b7jfbaKJx6KHZLl1Rj7b3TaS18RkFdTZurF//1LSmFdtagLtUcPU9qxdWY/1r
         yJ3qJRVj6lFo7j3QILr3FS4HwsoDHstbTV5pcWyiLpzKnI0qbL8ZjLiUOi5V/6DYfHed
         M/cMFdXD+xnyOUlOBJwxmhHDmRYJqdi77I0gGItSkQwbzNl4b0z+CMtBML1r+fN7qGFl
         q0qA==
X-Gm-Message-State: AFq9FYJcWDVhtHPz6BmIPiJDcda/AiLKwaEgaIqBFPrfrgSqWeaFlqNk
	7MfaezIAp10FSLpLEGxbvNGUoexmQQBaLJTLZUaMGqgUF/tpWW0P/bmf
X-Gm-Gg: AYBFou0racyiYq3L8olio9TglSlkYCFyUaPYff5KJSmUVzt8ZXEj02iC8yTDxBkNlaW
	zAOuLrlQxss3c+a+EYZk/VS4YBvrZTJDwdDRlfwy+at4ZnldyGp+1UGeUa6vJfrrL9i2tCwRdMC
	hEMXrxFYeiSf1hwC4lP9UhmMRN6b8rqLCn1yqWNKu2ldHxROzqppk1FyDZ7hUIQg5P4z/2Kx6N9
	1kbjlc74L5J1Uy0G2XAxMZwqzJIV0dLeNwRMVQyuORI5LWVLGXTlXucpQ8FEeSjO/236gicIoMt
	gx4gfluSl1OHAfBVjfJkbcEoJLfB2ky7tizhv0CR0KLbzfvZl2zWFshB22BnAHfepdYJJAngAL6
	LpiZbAvx5cvyVgL5vlP8egTR1+zUFedskfTj1SL3QcKvR79gzQuNCZ1b761HhALBZWOE5+7l7j/
	GEf7YN3Uv3/vBD1wHISjcDw3AMGi01X7WTrSgabTYuJtQRAhnZEi1QVc3wIQRfJflJMRMimSzDz
	hawIFNVxG4mAxKBDtS8ianY33mjb9EAaobqy+NLtyFGMoIBMwcH9aEDEt/P6ddfaWX/FKekoVfV
	r6tEKbbvAUFUZ7nFqn07+tbOICdTn9k3LFOh
X-Received: by 2002:a05:690e:441c:b0:677:d9d8:d927 with SMTP id 956f58d0204a3-67a7bebab48mr1814453d50.74.1793199852326;
        Wed, 28 Oct 2026 08:04:12 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a1887c9sm1801270d50.20.2026.10.28.08.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:04:11 -0700 (PDT)
Message-ID: <69b373c4-4a1f-4863-a1e5-dd8aeea7b02e@gmail.com>
Date: Wed, 28 Oct 2026 11:04:09 -0400
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
Subject: Re: [PATCH RFC net-next v2 0/5] tls: perform TLS 1.3 KeyUpdate in the
 kernel
To: Hannes Reinecke <hare@suse.de>, Chuck Lever <cel@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, kernel-tls-handshake@lists.linux.dev,
 linux-nvme@lists.infradead.org, Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>
References: <20261028-keyupdate-rfc-v2-0-eb5143b4c487@gmail.com>
 <76ccd502-f1d1-4135-b92e-d783f259a687@app.fastmail.com>
 <3544cb56-e43b-49ec-aa94-beafe061879b@suse.de>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <3544cb56-e43b-49ec-aa94-beafe061879b@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/28/26 10:42, Hannes Reinecke wrote:
> On 10/28/26 3:21 PM, Chuck Lever wrote:
>>
>>
>> On Wed, Oct 28, 2026, at 9:52 AM, Martin Belanger via B4 Relay wrote:
>>> kTLS does not currently handle TLS 1.3 KeyUpdate. It never sends a
>>> KeyUpdate. And when it receives one, it blocks the socket until the
>>> application installs the next key. kTLS also does not enforce the key
>>> usage limit on transmit.
>>
>> No argument here.
>>
>>
>>> This applies to TLS libraries in user space as well as kernel users such
>>> as NVMe/TCP or sunrpc:
>>>
>>> - GnuTLS sends a KeyUpdate after 2^24 records when it runs its own
>>>    record layer. With kTLS, the record layer is handled in the kernel 
>>> and
>>>    GnuTLS therefore never runs the check. OpenSSL never sends a 
>>> KeyUpdate
>>>    on its own.
>>> - NVMe/TCP and sunrpc don't have a mechanism to install a new key. A
>>>    conforming peer that sends a KeyUpdate stalls their connection.
>>
>> The design intention of these consumers is that they are supposed to 
>> break
>> the connection and create a new session, rather than stall. If that is 
>> not
>> happening, that's a bug. KeyUpdate is complicated enough that backporting
>> to LTS is not really an option, so that bug needs to be addressed first,
>> IMHO.
>>
> Yes. But Martin send already a patchset for that (well, for NVMe, at 
> least).

Thanks, Hannes. Two points to add.

A reconnect is also a valid answer to the record limit: RFC 9846
section 5.5 allows closing the connection. The cost is the problem.
Depending on the load and link speed, the 2^24 limit can be reached in
less than 10 minutes in many cases. Each reconnect stops the I/O of the
queue and needs a new handshake upcall, for every queue of every
controller. A peer that sends KeyUpdate on its own causes the same
reconnects. With this series, the connection stays up.

> 
>> The argument that was made that put tlshd in user space is that we do
>> not want the kernel to handle something that the libraries are already
>> good at (IOW, mechanisms that have been soaked in commodity usage by many
>> consumers).
>>
>> Is that rationale different for handling TLS KeyUpdate? I see that the
>> series adds back the HKDF functionality to the kernel. That seems like
>> an indication that KeyUpdate should be handled via an upcall.
>>

The series does not add back the HKDF library. It computes the HMACs
inline with the HMAC library, as the NVMe PSK derivation in
drivers/nvme/common/auth.c does. That is why commit 6d888db2cfd9
removed the library. The QUIC series also derives its key updates in
the kernel.

GnuTLS does handle a received KeyUpdate with kTLS since kernel 6.14,
but only when user space keeps the GnuTLS session. tlshd does not: it
hands the socket to the kernel after the handshake. So the library
cannot help nvme-tcp or sunrpc here.

Martin.

> Yes. TLS KeyUpdate requires that all records _after_ the KeyUpdate 
> message are encrypted with the next key; idea is here that one can
> (and should) do this in-line without stopping/resetting the connection.
> _And_ TLS KeyUpdate is done independently on the RX and the TX side.
> 
> This makes it extremely hard to implement via tlshd; we would need
> to pass the KeyUpdate message to tlshd (which is easy), but then
> we would need to stop processing incoming packets until we get
> a response from tlshd indicating that it has installed the new
> secret.
> 
> Which makes the whole idea of KeyUpdate (namely that you can
> do it _without_ stopping packet processing) a bit pointless.
> 
> And I haven't even mentioned that you would need to be able to
> stop RX and TX _independently_, which I'm not sure the various
> ULPs can do.
> 
> Plus there is the question why ULPs need to be burdened with
> protocol specific knowledge; why would I need to code hooks/
> handling for an extremely protocol-specific know?
> It's far better be handled by the protocol itself.
> 
>> Are there policy decisions that need to be made during KeyUpdate (like,
>> has the peer's certificate expired, or has it been put on a revocation
>> list in the meantime) ?
>>
> No. This is not about the certificate, it's about traffic secrets.
> If a certificate is expired you need to reset the connection
> to install a new certificate; TLS 1.3 does not allow you to do
> that while the connection is established.
> And handling of expired certificates is an admin choice, not
> something one should do automatically.
> 
> (The last thing you want is your root fs becoming inaccessible
> just because a lazy admin forgot to renew the certificate ...)
> 
> Cheers,
> 
> Hannes

