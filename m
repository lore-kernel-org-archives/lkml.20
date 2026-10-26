Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028014;
	b=IWKf4dK4KVpUlX0UShCEPjXLEoO6XBhPIUL2kdtkmTftLiAKGOski1db3ci8KeskTYhJ
	 tZ90eMXGrc2VtePF9i3d2RKHG9fKTCC6FEXFOsTp+T247Fig26gBKns6s0f7O3tUctSFg
	 PFHMZ0sG457XJoZAJFT/kraBdPvY/tyGjtfm8Brkz5n1/AOgREHbGjRMQ5VAo9EYiZm7r
	 wYjkByJabf06aydNZukIEGcb9JOKYPXC+HvBx7uVmQ/L32dUDr9xMXxRO/lH29m5Dy711
	 3EBRpWA1zuqrs+VhC8yie341uJiorBiTGSoCVfcEIRwoh8eV/sS5FQfrt7QYen8Mmvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GDoT1f97HMSzIl27AFxsGzgU14gBpQzsSaLQbUyRuPE=;
	b=t9xMDE/cAcp1eyRjtFIuzWxwB62YJBvEZjHzH6WFXgonCjx9snEqrXn7SxcuSlE3INMf
	 IwZK8gBjYDCqOI/0dwNDz2Z7pwUgX118Fui9wR1VASbSMquyzzS/HtvPD4gjMzioG/B6v
	 V7JFaGdgNjsVKesE3ypyywBIgEXkv+LbA6arQo2+ZEY3ZI6ynA+0EMAboj+s1yH63l2jt
	 reTGsr2/hxeM1rGRANT7QD6evRuvFODDcSgeB+CtAYF45B0h2bcH00WZc595sjB/F8oVU
	 aY3zoiUBUF8nsM5/CiobcQ0sL9qG/K8IyfPCmHC29PF8BctQe1SCKZKqH0+RjYVhQ0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ToNzRoTL;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB60606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ToNzRoTL
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so1259608a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793028013; x=1793632813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDoT1f97HMSzIl27AFxsGzgU14gBpQzsSaLQbUyRuPE=;
        b=ToNzRoTLP4HJzM6XNq6Q3Qj8LuNiIenfeWp0aOxyA/K5ytxu5ZsC3I2YihUkowTmBo
         6xPeIK7d7VwVycUAy+tvEa3GZwfo803+5TJb1itvtPBr/NEiZIYAbLpKdE0YTXA9ANNf
         2AeuzW1okTGm/goAuj8aI465AEMoDrCdRKDM6fDi9xoG4MpsrbMkmUH6hYutlRz7zi8t
         1nnsRv4+ERNzZuHxkeZxVX/GWP6HEClUCjqp5Hbd+JQYze4gglesifdNgYVts8EtPLwQ
         RLDBiFme4GMN/7InZpF7Bxl88jdxwOKnuIjMOHNMuHQUOkAwL6lGJ8jOPGFOuVmORTL3
         R9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028013; x=1793632813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDoT1f97HMSzIl27AFxsGzgU14gBpQzsSaLQbUyRuPE=;
        b=r0Xz6MLLhw29+zMYlxw3GfXC8TzMbVV0sPhIH1sHPdRJ8wWRx0YdxGWZ3ZbSdDS2KE
         pvOxZJ6rvkD76zVPYafPXKYNH3/lTtOUyDxvPnB378Gra7Kc5rgPn8U4qAlDWO0MQtlG
         LPHlxcgAnU2b7tLZkKPRJqUi9RjUy357F+pMAX0201RxZNgQDHro3utDUUBWarKsbw/D
         1/8LHwDfI0bsm7OReb7r8v6K/SGBFzHouWSwmyuJoNfmBr0/6dP0WZfoPk4fa+OGBHGi
         GgnsDnsa3P5H01HYHOPeU85pdch0Xf/T2ajJ8iRk9qVO8hoAD8rD/sZw6VmjaaayXsjC
         eoew==
X-Forwarded-Encrypted: i=1; AKwUvBxHD7UOr8XQ3KK45jprVOt4oxDnoUEJZJQ+bn2QA92IMXXRaYP9RARnRs8LdrNVLMxHiFmbYUdn56xH7OU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfC/bdn4OfkyLp8JwlNdUb0WzoF3mIBnsFqZ/KA+0r2UOA8xVx
	iZsSrqV1lcYYtoPfM1FEA3UI2hj84048h6cQhYZY6QULgcaR6D0Cijvi
X-Gm-Gg: AYBFou0wXEfQ534Zy20VH9Vj7LvU4Ru6c2Q5ghBaqxMrdDQIWPiacNJamHTicqzh+1h
	HRxM1o8rc8yXPjYXpYB8xDheHQ63nDDu1j4kWRWhaC9WP3DcxZrNBLB7UO7gboZLwhaWW7pCEfs
	gcawHDrEobs76uG1o6hO3gXj034ptBcs4PmLde01wHzks4NOtXkSvgfOZXmY6PaOBJfcL4/+4Lp
	IffOFxOpuOaq95rkDZYIX03UcMc6r/O5V2pIoRVXsHsGtuuaXPf35tl6HQ3C52YUai2Nos1Yspy
	X1aTTb0IuOX5BA57lRI6OD38orE15xKDdTOb1DkUAlZgYMxkyGRrZ1YxVtrs+gopJyoRU5BpDeC
	55kJWoPG5NxsB5holbjM6jeDDucrq7aEblY3knt+/Dq244HB+He+SQiKKuT81vtWqVv6hiMtuic
	PY5PGLZw1zJZEPWvLT1ysG9Ay/cdPsbIVWCebxHiE3Svy+QUtS2GlQQvrvoAijTAjy+KesW2+xh
	8kA8VyojJ/SnCXNd2TMROvmLSwE2NITxdTsfiEcOGr/FT4=
X-Received: by 2002:a17:90b:4a81:b0:3a8:a98c:ea07 with SMTP id 98e67ed59e1d1-3adea8966e7mr5384743a91.13.1793028011866;
        Mon, 26 Oct 2026 08:20:11 -0700 (PDT)
Received: from [198.18.0.1] ([38.182.104.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc682d8sm1799598a12.18.2026.10.26.08.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:20:11 -0700 (PDT)
Message-ID: <af546d6b-d1c0-45df-8f81-ad839e7e4d6d@gmail.com>
Date: Mon, 26 Oct 2026 23:19:58 +0800
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
Subject: Re: [PATCH v3 2/2] ksmbd: fix named-pipe reply loss with small output
 buffers
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey
 <tom@talpey.com>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
 linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <SEYPR02MB69642EAEE79F3CF02F782597E6612@SEYPR02MB6964.apcprd02.prod.outlook.com>
 <SEYPR02MB69641633E70AC3FBF14BB14FE6612@SEYPR02MB6964.apcprd02.prod.outlook.com>
 <CAKYAXd9vAUH6J_Mbx3ZTzGT9U+unoOsdDL4j_Q8UsDypW3a82g@mail.gmail.com>
Content-Language: en-US
From: Wang Zhaolong <wangzhaolong633@gmail.com>
In-Reply-To: <CAKYAXd9vAUH6J_Mbx3ZTzGT9U+unoOsdDL4j_Q8UsDypW3a82g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Namjae,

>
> if (rpc->pending)
>     rsp->hdr.Status = STATUS_BUFFER_OVERFLOW;
> Should we add this check ?
>
>> +       goto done;
>>
>> +empty:
>> +       err = ksmbd_iov_pin_rsp(work, rsp,
>> +                               offsetof(struct smb2_read_rsp, Buffer));
>> +       if (err)
>> +               goto out_put;
>> +done:
>>         rsp->StructureSize = cpu_to_le16(17);
>>         rsp->DataOffset = 80;
>>         rsp->Reserved = 0;
>> @@ -9349,7 +9375,6 @@ static noinline int smb2_read_pipe(struct ksmbd_work *work)
>>         rsp->hdr.Status = smb2_pipe_error_status(err,
>>                                                 STATUS_UNEXPECTED_IO_ERROR);
>>         smb2_set_err_rsp(work);
>> -       kvfree(rpc_resp);
>>         return err;
>>  }
>>
>> @@ -9947,7 +9972,7 @@ static noinline int smb2_write_pipe(struct ksmbd_work *work)
>>         if (IS_ERR(rpc)) {
>>                 err = PTR_ERR(rpc);
>>                 rsp->hdr.Status = smb2_pipe_error_status(err,
>> -                                                       STATUS_INVALID_HANDLE);
>> +                                                        STATUS_INVALID_HANDLE);
>>                 smb2_set_err_rsp(work);
>>                 return err;
>>         }
>> @@ -11440,20 +11465,25 @@ static int fsctl_pipe_transceive(struct ksmbd_work *work, u64 id,
>>         struct ksmbd_rpc_command *rpc_resp;
>>         struct ksmbd_session_rpc *rpc;
>>         char *data_buf = (char *)req + le32_to_cpu(req->InputOffset);
>> -       unsigned int nbytes;
>> -       int err;
>> +       unsigned int nbytes = 0;
>> +       int ret;
>>
>>         rpc = ksmbd_session_rpc_get(work, id);
>>         if (IS_ERR(rpc)) {
>> -               err = PTR_ERR(rpc);
>> -               rsp->hdr.Status = smb2_pipe_error_status(err,
>> -                                                       STATUS_INVALID_PARAMETER);
>> +               ret = PTR_ERR(rpc);
>> +               rsp->hdr.Status = smb2_pipe_error_status(ret,
>> +                                                STATUS_INVALID_PARAMETER);
>>                 smb2_set_err_rsp(work);
>>                 return 0;
>>         }
>>
>> -       rpc_resp = ksmbd_rpc_ioctl(work->sess, rpc, data_buf,
>> -                                  le32_to_cpu(req->InputCount));
>> +       /* Write new input without reading past an already buffered reply. */
>> +       if (rpc->pending)
>> +               rpc_resp = ksmbd_rpc_write(work->sess, rpc, data_buf,
>> +                                          le32_to_cpu(req->InputCount));
>> +       else
>> +               rpc_resp = ksmbd_rpc_ioctl(work->sess, rpc, data_buf,
>> +                                          le32_to_cpu(req->InputCount));
> This WRITE leaves KSMBD_DCERPC_RETURN_READY set in mountd. After the
> cached reply is drained, the next TRANSCEIVE can return the previous
> reply without processing its own input.
>
> Thanks.


Thanks for catching this.

I reproduced the sequence you described and confirmed the problem.

For the READ path, your suggested STATUS_BUFFER_OVERFLOW check looks
appropriate when a positive-length read leaves unread bytes from
the same reply.

For TRANSCEIVE, I think the correct fix needs some discussion.
One possibility is to return STATUS_PIPE_BUSY when cached reply
data remains, without issuing another IPC request or consuming the
cached data. The client would need to drain that reply through READ
before submitting another transaction. MS-FSCC §2.3.48[1] lists
PIPE_BUSY for a pipe containing unread data.

However, I would like to confirm that this is the intended behavior
for this SMB2 path before preparing v4. Simply omitting the WRITE
and returning cached data would still silently discard the input.

Would rejecting the transaction with STATUS_PIPE_BUSY be appropriate
here, or would you prefer a different approach?

[1] https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/f48cecf1-98d8-48dc-926f-2f3a48f07cf6

Thanks,
Wang Zhaolong

