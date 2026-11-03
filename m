Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701849;
	b=WUIkxO196hkrEUmoUM4iHZCKTj1gtfiCzHLnejz4C704CQCM9TVu2LxpakAl0cJAL2C9
	 FOulxGKfTx6rNOUKvjfI4/xntg9fHnTQ2/JT6+MMVF4AWBsBexECoN3rGSpoOydw4Anej
	 FicfDaCY5Ut7vQV7arPxrwRN1LEmyr/KrpXJQrGQKav4Bafs2K1jd/McuABeCOi9jB66n
	 VGAwIT/S2nL4BuFAQHJGAExvQqPW6qG39bsgs980Vm/RuSaDwwNoTg5ChSv33n2nE4ykK
	 E08LoufhMntJkXMxqzQRqE//73aYX3PodnTMVyW4Bi+FYghCYN+kV1vN+HndRTy2A8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rUKedcpVkiNEfx49bKB2qoAIuRwcwKKFeuE1z3r00s0=;
	b=IOIum9nBJ9Aq/F7nC8TPmxBS+UnxklqqInxcxKP+OWI5cdKNugRO/GuF9cm5ohS0/svD
	 0HANPL6p7AzNvHVXXJE/p3tCAWWbVpwON/+rgOOw16AmQxxUq53sgU/xwV6vDqP/QKndM
	 wO7ewpQqWrCmteJFx+Yei6QuQkJexT09CxXkug18svIqj1YzJ0mlElP7ITM5o2d0nnWr2
	 gk7CdFVvixuGXUT3eablFAuWkS58tz02fHk4ZGSOufoYrAzWoZaqBrHOmfq0gwulgYgk0
	 tDZ8qDuYKt6/Gb9QfJ99kMJ6ZRmctexB4TfNXtHDdZDYCkHwBGQFtsJ571zNVbKrkyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b="lGHJ2/7A";
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C8B606A33A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C8B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=lGHJ2/7A
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so5200784e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793701846; x=1794306646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUKedcpVkiNEfx49bKB2qoAIuRwcwKKFeuE1z3r00s0=;
        b=lGHJ2/7A+c8PAoafyItHPUKePCeXbliM9fGrD5xJcz3JpBqpvmtWUxQjud4v3HS62O
         o56E7Kb9SRzktK6NhMfa+6ZtWZSbmJt5LWEKR7WrQ7rUzzjWF1A7JanQ/LBl9m+BcH5b
         Hzj2p5p+gNiDVEYaUnNESbOXtEC6L+gDN07LWsuh2VkoM20HAjPss5X+ikBTBh7+8MSb
         fRowcjM7MMC/xob+HTP4ofXA99I7jUj/tlGctRB3e4cl8CR6CwYX4+wvJ9ZFiDNJ6clq
         hOUOuJC6Bn7TKlqDLYFX4IfP9cuODLqnkxgxEbNnyzV5lAWIst7n/Yu3jEY4/fh8qwN6
         4tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701846; x=1794306646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUKedcpVkiNEfx49bKB2qoAIuRwcwKKFeuE1z3r00s0=;
        b=ChHfeQpl6YuA3foDO1LE/mQSyYpxlRg1yRc2EGYYlV+Ct1iAolCxmxFhWaEe5oo57z
         B5x0+Jn6LA0LISqhcX+mSyvbfDVg65iwGPpU3rqtNqjl0EA2mIHWjxYuhH4/vdSvR40L
         5HBr1CAiDg1fqZxw8LF3mulWY2vpbIC6mGM78Jhq7UD6aB8JUoTEGqGUR+ynLkiwb+Wy
         UdnbkiTt2xFVyMP8BGxtcdVTeNBOQLhNw0GPvEUrlS4JMLNf8uzynbM2UUjOfdoS6ZPZ
         2ZBUr42vJQTjk4zRIjl5unasE1ZaNAhzxgORH8gakxEtOpTiRjiWwyUlw65nN5TnQF/y
         G3mA==
X-Forwarded-Encrypted: i=1; AKwUvByscMTslEZNnSE7Q3yEpE3ANDaeT4RKV8nvGuaBPK1kqD2rw888U/5P9GaZqiZe2KNtdua+BE9E0Y1TECU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/idgMbfkd3Gm2yN1D/eikMzNyOHII09+LlrWDBwp1pHtKUH1KC
	KgtbsTFq6tVc39NxoTwgcsV5eHG7nnsAgwYMq9U+LXNshUH+gWfmrRnHa3iaM/4+MwY=
X-Gm-Gg: AYBFou2Gted+EUX7k+0VBZ4cZq6FEHIEqgbqeKKP1LASq5JAPMD7RTTxbdcUgefvBkG
	gJ+VN8VEC70tjGcb3RA76hzPhjxiCIIzaPGKUFbLxMGLHGYU+OkVcjeAon2CtjyH46DZwR88PAJ
	Uc2F+b4sO0FnF173xdKcOrw/LANF8JLnpOXApMZ3ATRPAMxPhF2BYHqIH5F2wCVgxok0pZ5icnL
	Lc3ESfksmdOH8t/lDdcZ4mJLt7ElptAzqowLFgsL/PYJThTvrbRIBLQR9dLJZeSQGZsmnN+LDnw
	0hXOytXMTek+ghOF/LkL4LrC+AHTQEJTYi608sV+EgvsSzWZjD6UUqJehoGYawS0x1YM+vsVmN0
	JCkKswikT9KyvR/pV7mt96lN24dxn2SusRi1Xbx3vZeoR5T2oQavk92QAp2Zk3g1viK2Qk/NDWe
	YXN7+UTcuO2BczBB0rmgS4SnVrV0szj4P5ImvAxi25rCss/T7/lJxc1U6yig+VVbpJ2I+OscFPE
	m+m8Z1D6ozkmBdio8yI9UjyhVYJgoGbLp380FAp0ItC8FXu2tqRqd7FrLUJaykD9ll0uta7iQGI
	cVPtyuplsJGZG4LAV1SvAZb6GO+AEJvGea1a
X-Received: by 2002:a05:6512:3da9:b0:5be:41a1:d2c3 with SMTP id 2adb3069b0e04-5bfd958d569mr4093510e87.49.1793701845873;
        Tue, 03 Nov 2026 02:30:45 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm2132213e87.75.2026.11.03.02.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:30:45 -0800 (PST)
Date: Tue, 3 Nov 2026 11:30:39 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 04/20] Documentation: ctlv: Add userspace ABI
Message-ID: <aum3xbO4lbiBWUtL@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-5-jiri@resnulli.us>
 <auOWFzX5N7HBbcH3@MjU3Nj>
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
In-Reply-To: <auOWFzX5N7HBbcH3@MjU3Nj>

Thu, Oct 29, 2026 at 07:53:11PM +0100, sergii.dmytruk@3mdeb.com wrote:
>On Thu, Oct 15, 2026 at 04:50:37PM +0200, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> Describe the CTLV transport, discovery, wire format and userspace
>> compatibility rules.
>>
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>>  Documentation/userspace-api/ctlv.rst  | 507 ++++++++++++++++++++++++++
>>  Documentation/userspace-api/index.rst |   1 +
>>  MAINTAINERS                           |   1 +
>>  3 files changed, 509 insertions(+)
>>  create mode 100644 Documentation/userspace-api/ctlv.rst
>>
>> diff --git a/Documentation/userspace-api/ctlv.rst b/Documentation/userspace-api/ctlv.rst
>> new file mode 100644
>> index 000000000000..5ebca3d4d94a
>> --- /dev/null
>> +++ b/Documentation/userspace-api/ctlv.rst
>
>[...]
>
>> +Errors
>> +------
>> +
>> +A failed operation returns a negative errno. Where the failure is a rule the
>> +message broke and the caller offered a reply buffer, CTLV also writes
>> +error information there in TLV form: a ``validation-reason`` value, a
>> +human-readable message, the offset of the offending attribute, the offset of
>> +the nest it was in, the ID of a missing attribute, and for a stale query the
>> +expected and the current generation. A buffer too small leaves it unwritten;
>> +the errno is authoritative either way.
>> +
>> +What the transport answers with, as against a family's own callback:
>
>It seems like this mixes results of several syscalls (e.g., `open()` and
>`ioctl()`).  Does it?

Right, will split.


>
>> +
>> +``ENOTTY``
>> +    Not ``CTLV_IOC_OP_EXEC``; this transport has one ioctl.
>> +
>> +``EINVAL``
>> +    A reserved field was not zero, ``op_id`` was zero, ``generation`` or
>> +    ``cursor`` was set on something that is not a query, or the message broke
>> +    a rule of the format or of the schema.
>> +
>> +``EFAULT``
>> +    The structure, the request or the reply was not accessible.
>> +
>> +``EOPNOTSUPP``
>> +    The device does not publish the operation, publishes it but has it
>> +    disabled, or the operation is an event, which is read rather than executed.
>> +
>> +``EACCES``
>> +    The fd lacks the operation's declared authority, or an ``O_WRONLY`` open
>> +    was attempted.
>> +
>> +``EMSGSIZE``
>> +    ``reply_len`` is smaller than the smallest fragment the operation can
>> +    answer with. Nothing was executed.
>> +
>> +``ESTALE``
>> +    A continuation whose ``generation`` no longer matches. Start the query
>> +    again.
>> +
>> +``ENODEV``
>> +    The device was unregistered. Descriptors stay open and every operation on
>> +    them fails this way.
>> +
>> +``EBADF``, ``EIO``
>> +    A blob descriptor named something that is not a file, or the file refused
>> +    the transfer.
>> +
>> +``ENOMEM``
>> +    The kernel could not allocate what the operation needed.
>> +
>> +``read()`` answers ``EAGAIN`` when no record is queued on a non-blocking
>> +description, ``EINTR`` when a blocking read was interrupted, ``EMSGSIZE`` when
>> +the buffer cannot hold the record at the head of the queue, and ``ENODEV``
>> +once a removed device's queue has been drained.
>
>[...]
