Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6861445D913
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791554876; cv=none; b=gDCyien1rTjqsCQTdG0F+/e0IgrVA5flG9MduwGWvJ7e7X8HFywxitYBNEpAC9Wh383Crgy9HUylDaEeAGexLv+t66rk+uGhEthkInPORWSboRW+ldJvx82/BnwK/TgpdxdURpl5zt/QQPInNakYonBdENvsSnYXz2rxgXisD1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791554876; c=relaxed/simple;
	bh=jeqQT3ErQIqOUqUA3FctGusMYbwaLCcKXtg5hLRbWUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkO6EBjGFsuRHnWQZkC1DUSpYmuiWe3xRppSz6wzgPGpsiKErexKC9D7xgVYRbSo62J8XrgrF1jV/46JmbnLzK9EKC3GnRMkOTRBVG9y6oi4tdYUfhDNg4WVV41yG089pWk3LIJm8Mt/GiByz/PqwyU+ongzAvGTR62LVGHfeRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ejyh0Koa; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ejyh0Koa"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ab3fd8adb1so65507447b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791554871; x=1792159671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z7MLc2O7alo1H3cSCIlZHz4ofuIV762bYU89FsiyGvM=;
        b=Ejyh0KoaDT3GQDpyZ8WpL7PxfaQMAoSclGV+tjH7VKTSKi9Xlfo47Jbk5IioxWopev
         Mwm5UZhsku0GZyO9ffiZlIc65ZUjnm1cFhPkf6UvTpcwFyGafQdCaVlyZDIYjqNXt/3i
         We3FbQoKXqzo0GauUUjr0GpO32ZYkxgv8J9JdcfNbw0AA6LwE72JB89TaBn0V6j8SFMM
         hZVl/kl3xpJcdsM4vJeQ0bqO8MyAPYmedMjGREPdmGcZsEsbI8XAx6A+TSxIcUZIbMni
         oCxuiL8FPdQTgYFzG1kVuVVBHUTYdUjg4O+ep4wRSBLZtKD4zqLQ248i6fsvmgpiTeMy
         uVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791554871; x=1792159671;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7MLc2O7alo1H3cSCIlZHz4ofuIV762bYU89FsiyGvM=;
        b=vIT0Rlp4hh+ZeYq4gGnd2RphgY5Ann4125mHa4K8+EJwGXSVOzoOvgSF3GSzGk+CxW
         NxYJu5roTLlLCcn5etqDcAcHdpuJO/LFV2Sq2b72BTA63xY94A0WpCHCfbhXyyP2rRkY
         5Z9xA0wwYJvBPTof9BDAqhDe0hOXtunigmMDxkzvDfChSCHGX6xrHKSG/Y/RVIAXD7Jl
         cjcuCf9Gmq1iDJvhIXkvBLruAthV3OZuuZOcabOhyaWnK9nYANerWlEdfHj2BGd3OAFR
         z9RuXMrBila3UhV6G9kT7ykBZ/BfUjSaCW1oTojeYphVEnByvultQSOzqB7RTltnz/RX
         geog==
X-Forwarded-Encrypted: i=1; AKwUvBzlS6Dk5ofJnbddKy1+QnH11vW7+5DNpqiofNRtg1p/Bow8ilJquGm+coEcbf/qKy7WwKNcEeg8HpT+6X8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+HVwFT6KRmInkbI0AZgLukpjklRXElQavmikeQcX5ZkdM+++d
	SOZ8xDIrEDLvhXJVAERYwCNsja0phIEY+UrQo3VvgrZMp3GagBTEaKo9
X-Gm-Gg: AYBFou16gXpl3+bNp0OrpvN/RpKvGussRUwHOLOXTbIv95M+81DgeOJs3zsN+w+9DMG
	QVLLcSAtkTOM4TC760jnNzpJfoCdC86OeOlcSO11W+eRXnAi9cZbyWHnf2bkxdWNXsQ5ChOFhFx
	AhpYlysIhuNU6ftsG56obwhLoXFdHqaxmntv5Yg2I6P0M0wK5nOLSjX04pV4v9M2/PZYI626Dcp
	pKUVX8EtJ4I2oTeZpWjnlZZhrSdE4zLOFlQuEphCFiXgJPk6wHpGZbdv4aPL8/PDF1RvAAMF/0a
	GcfA7aBAjHqyF/wiEnzrS705VCS0US7IgAnuI3gFh/UPdtHPHUbFgEmmrhAA4V6Oy5V1OXnGxi5
	fcdrUMs2b3mFsAOVUBEOyYlTp9972q59VkudPtqD1Zzl0dwg9v/IHbyPfsB1KCDivQ3bSKu7ujL
	LMD3FUfyH29Fxl8OcX/BgnKHp8haMg8405R9M9f80rqj/4yJvQltFNeDOyRmvVjp8MC7ax/Fq76
	2bNSZJKzGTpkN/si4fOzfWRvDwFYfC0bcEQ5nKfoeYCE1N0S+rgL8edn0JA6D8vYAWDm8NgjU1X
	N5w=
X-Received: by 2002:a05:690c:ec4:b0:8b0:4f12:d28a with SMTP id 00721157ae682-8b07ed9e371mr4737677b3.65.1791554871247;
        Fri, 09 Oct 2026 07:07:51 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07ee83bb9sm7228667b3.2.2026.10.09.07.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:07:50 -0700 (PDT)
Date: Fri, 9 Oct 2026 09:07:43 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests: ublk: don't keep the fault_inject
 timespec on the stack
Message-ID: <asj1Lw8osFeQ65BL@fedora-laptop>
References: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
 <20261008-bug-ublk-selftest-fault-inject-delay-v1-1-a96af7ead06e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-bug-ublk-selftest-fault-inject-delay-v1-1-a96af7ead06e@gmail.com>

On Thu, Oct 08, 2026 at 10:45:39PM +0800, Qiliang Yuan wrote:
> The fault_inject target delays each I/O with an IORING_OP_TIMEOUT, and
> generic_06 relies on the delay to kill the server while an I/O is still
> outstanding.
> 
> The timespec of the timeout is a local variable of
> ublk_fault_inject_queue_io(). The SQE only records its address, and
> io_uring reads it when the SQE is submitted, after the function has
> returned. The timeout gets whatever the stack holds by then and expires
> almost at once, so --delay_us has no effect, and generic_06 fails
> because dd completes before the server is killed.
> 
> Store the timespec in the per-device fi_opts, and split the delay into
> seconds and nanoseconds so that delays of a second or more give a valid
> timespec.
> 
> fio 4k random reads for 10 s at queue depth 1 on a fault_inject device
> with --delay_us 1000000:
> 
>                   before      after   expected
>   I/Os            446927         10         10
>   mean latency   18.3 us    1.000 s        1 s
> 
> Fixes: 81586652bb1f ("selftests: ublk: add generic_06 for covering fault inject")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks, 
Ming
