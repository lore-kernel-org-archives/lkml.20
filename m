Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4603754EEA5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083819; cv=none; b=K7nFQpO4dYc3fotsZneWr993DgHpFZecvR/x4ygr+7fWyGzexgoMiwKCChyKiP8R4MjFZ3DSQq4papjvAwsADyTW68OV8LwaGMUL8nTZlTX3lBouda4XqfjWI9sKyf5S+Tm/Ai/UqDFlsxNYbzqOFj6bN60bg7zHkNOkJHo5ENc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083819; c=relaxed/simple;
	bh=Ovh+3NCfWArkDpk02CBsC6ZVrby6mZuDUCj0rpEsB8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3etDGPXMcb9oVSrprh2bv/5r4Vq6R8sTm77PWLsUWlA/06lpgfwu/umSj6kSQUnzDsNGsB7ip+u8jtRcv5zrM2l+u+3x9APFuUzH5lg+OIuRKWQCpepPrreUFRxOTE2xRMCXDSGXGkGXOT3snVddPKT82U4N1wHWOkYlqh6CpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FHgSkyYs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e79cjbxE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FHgSkyYs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e79cjbxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790083815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f9g6BjyVGZFd66XuNlSGdvaV1BKMkquG3R7mnAoguds=;
	b=FHgSkyYsYbn/x7QX/5qEFFuCIY1CmwApvTa6dgqvypvowPXYYRCr4IK3ZbxfRN1eq6dUns
	lexYB/nJgKvcmOLggOEbq9oLEQY0UTesx7EmALk01kZNLX+Wvg+KTSk333dE0OSttsJ+Wo
	QksD8bGzmOZMj9S/O+nYwzJliDBEkRI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-2Tmr4KxVMqijy2ODRH6PEQ-1; Tue, 22 Sep 2026 09:30:14 -0400
X-MC-Unique: 2Tmr4KxVMqijy2ODRH6PEQ-1
X-Mimecast-MFC-AGG-ID: 2Tmr4KxVMqijy2ODRH6PEQ_1790083813
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c293bac1764so546878366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790083813; x=1790688613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9g6BjyVGZFd66XuNlSGdvaV1BKMkquG3R7mnAoguds=;
        b=e79cjbxEs8tDta9SrCtambNJ/Cs0O/RffSJJMSmNBnyjI2oAe7u1CHdwC1+ajPAhuY
         ++80wiAp9u9TsVGgmiiHTrCtvZU+YbV4wr4ol+cBiJztie+rVsqEe4x+fb/DeurqLspO
         jrjlClw6fNBZB1ZKgSzXFALfoBj3GbEaWiY6I9DmaX7Th2OGk8ewZcOGGtK+cIrYi4is
         GrQwiE+CrC47JO4Z8sLbFW56Q8xPlwKa4IMmcnSSw3mZaqnvDmAZS+ZNknF8ff+6EC/y
         nVXWWumRA8cz2NkW98bY0NBysW8JEDZj5BeEAge7gHdF3Lm1IznxbnIpTUeP+6M2f/8i
         75Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083813; x=1790688613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9g6BjyVGZFd66XuNlSGdvaV1BKMkquG3R7mnAoguds=;
        b=1P2lc4xxD8HAEoBT4JSGfxKLOljMN6SiXbeOlPRq2ggCfQYw/DhncrP+WiXB0yPdGo
         MikIlbOMBq7JYiq85L0riIqol08vqZikbr1a8U4Iuo+zLclWIx20kCFCnZCSAop5QEmZ
         Q6g4e2CjClDsbHeNbocOF6GdPvg/VOWStxah2Q0fKW3o6kWrdxisb8LO4Qi4DxsboFDi
         vUhv8ncBlgBeP8BkjxEwocG675uNtVlYMbmGnMSixd63YvCF2I9qN6TIttm5/nSzHB6x
         st1vF2FYG3h5Iy3JS2TKtldXn3RfUpm9ScAVQRzd4El1JOK4a7HoFyxuUhZp2EwqYzKW
         bEHw==
X-Forwarded-Encrypted: i=1; AKwUvBygIlH+u2HdoEb/dC3NQ58a8tIMSUemAC4uRNqArrhJNo0o+kCmAErnCcGF0DhVwuscSRFQJcy43JlMIR0=@vger.kernel.org
X-Gm-Message-State: AFuF++k4mh6zUYQ2XEUTADyiyRy5uKvV+Hw1GVAPwYJJtgQ3uXARm+Y8
	r6Jpji+SqkzGsxRUHKz4E6mqdn0c+reVPSCINB84Y/8hMmC2kTYMCXtr7MD3SrykTi8PkmCbg0X
	hJMEOeJxJYzPqXla9TC3W4G04my9arPCcS2doVSyMaM6ExiTKeJfFpG+hi7cSnJ/w9RZ149KQTQ
	==
X-Gm-Gg: AYBFou3N0srrbUtPJOBWKM3f0mrGQMn98gw7w+NxmMQrTqQYYlchAOfIEEa4no9E6Jb
	Y3zlwwVgSOklBw1xt04QXHPSkjbjod1XSEhQCHuN+i9BXSoP7LV82YrulPwSjs+DRFBnGNXNlDv
	wwYdsu8aNrua/3qeejnd/9F0sp5V5LO1gMUOnX9YM5kY9JG7B2nHsrWeobA2GQEcSXFdG1mympl
	9jX9gQfHIEo1c0fk+o5yK0atl4pjHsSs9RXYxTNMz1c64KbQntpNBbxkpkcVs1KWoE0olqM9Ve0
	fVJkziaPEreokH7QSVXzzUT4qKU/3pvM92kDi0TqAvoOb5Le3i7CRSxU3wpllCcu4eQm6UAK7+J
	yayJxBGpKD7+7RqG/jpIcI0b2APmRlbuHpBpm36cZVG+uLjP/ZAPakt7GJOuqVHunjNYnyOg/Kw
	==
X-Received: by 2002:a17:907:72d3:b0:c29:f5d8:9c70 with SMTP id a640c23a62f3a-c2a158019c7mr1066564666b.31.1790083813125;
        Tue, 22 Sep 2026 06:30:13 -0700 (PDT)
X-Received: by 2002:a17:907:72d3:b0:c29:f5d8:9c70 with SMTP id a640c23a62f3a-c2a158019c7mr1066561866b.31.1790083812536;
        Tue, 22 Sep 2026 06:30:12 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5832fesm88079966b.30.2026.09.22.06.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:30:12 -0700 (PDT)
Message-ID: <d6cdbc83-86a6-4c2a-ad99-29cdb83566dd@redhat.com>
Date: Tue, 22 Sep 2026 15:30:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] mptcp: support MSG_ERRQUEUE on the parent
 socket
To: netdev-bot+sashiko@kernel.org, matttbe@kernel.org
Cc: martineau@kernel.org, geliang@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 netdev@vger.kernel.org, mptcp@lists.linux.dev, linux-kernel@vger.kernel.org,
 devnexen@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org
References: <20260918-net-next-mptcp-msg_errqueue-v1-1-dd77e1738248@kernel.org>
 <179001595171.2160803.3670624686905872378@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179001595171.2160803.3670624686905872378@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/21/26 20:39, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new error-queue splice is dead code for MPTCP-native data:
>    its only accepted input (SO_EE_ORIGIN_TIMESTAMPING skbs on a subflow…
> - [Medium] Forwarded TX timestamps expose per-subflow identifiers instead
>    of parent-socket byte-stream identifiers, breaking the…
Sashiko comments look relevant to me. Basically this work makes sense
if proper support for mptcp-level tx timestamping is enabled and the
and sk_tskey is resolved at the msk level.

I underlook at the above during reviews on the mptcp ML.

IDK if someone is currently working on the missing work/bits.

/P

