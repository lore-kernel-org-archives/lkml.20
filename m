Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B5F3BB689
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283825; cv=none; b=KcJfefhBD/rSOlkSZYbma2kbee7z71peaTBXSkxRzX1v360AgawRig71QRdqoAC37srRuH/QAghRlfYi3MGrc69mGQn9OZafl3qm7dUPn1Gp/I8errVrx6kZd7e8k3ouY0dX6s1SbtejBl+VrJr4J9dUkTkQTPKddEjjjQjEoio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283825; c=relaxed/simple;
	bh=hI+auaRs3t50EVJ+SHwOpyZ0IJtfedZjZV2QT/Pq1qg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y9wqPe+uCWru0qWCcoKSlokCJSjD5+sdQrFDUlwhr5QnAC2oN+vLjmRRftHCari2IJrm/Wb9IdF9XbtBLbs9g9O3HCQzZH1GWjxtJKhkLm/V219KKrs6JsLYsmZcEAYUSZxKKSdf7oih4RxBdfR+4EpSxkgkohjgV67YU8XrSJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HPKteXTT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qUVF+4/J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HPKteXTT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qUVF+4/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791283822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cI+eN04D4UF6oewDttmWO49cckyZBfFuHDa/I/2vopQ=;
	b=HPKteXTTHCDKQpdosqZgIyIVsY9RExxfGxuFfJIGRi00CmuruQqbeMdWoBAt8Uc+OCQtnM
	sSNUgUGUGpZxGfrx7zWSfAFd6u38eNJPiG+6LHfLtALPxv/d7iBMaiUoGZI5VUx7QsRpe0
	ZXTwcmrOLCI+Isg4TAZfhDGECzFtpFA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-CHUE23gxO1qrsaSAfQBVDA-1; Tue, 06 Oct 2026 06:50:21 -0400
X-MC-Unique: CHUE23gxO1qrsaSAfQBVDA-1
X-Mimecast-MFC-AGG-ID: CHUE23gxO1qrsaSAfQBVDA_1791283820
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c437ae81eso1942462f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791283820; x=1791888620; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cI+eN04D4UF6oewDttmWO49cckyZBfFuHDa/I/2vopQ=;
        b=qUVF+4/JbcdIvCw6EFXKbRHkL0f/i36hIVBJVaqCLJhNOLZzUzoFBmrmIeGrGPBNyJ
         2tJY0Ck8zjY98951/Pfdi8kFgDbUnTQyWvrLDqBZb3BETObXkyGgCYhPLRoqay7WYxWJ
         asMhoerURhnxTNPDLbKfDTTAWy/VQDiUkjY+zvqM4aufa57kQ5wW7xdAkZjKu9ymfgrY
         a7N10TcIZqki64e8ppHVLIgZ38gHthvt/b0HN94ExBCRqOHLRZ+LqOpOATJnNMxL3j3z
         /PIkIPnprcSvjx+ejbZcYyESXXJBz+Mq1U5A41er7WArNxgZ57aftm0wyyl8XT4dl6M3
         6p0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283820; x=1791888620;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cI+eN04D4UF6oewDttmWO49cckyZBfFuHDa/I/2vopQ=;
        b=pIhS3UqiZuVzHINY7hGjDTj5eh8HmqTu+UqEe6bBOYcLDBVK5qm+/kSdqN19kWmrdI
         vK/lP6W57bzrGCLeAUpw/gqY3eKwMqyDDcfTm/XPmJf0KwYSk0uJ4SLj/MInqf7Bxb/v
         7PBhYbv2VyXFkiPWwYq8fRW5uQbIqAEdfIBfHUgvMHw/1rkVGh7tQq5pnIJCik89DYtJ
         HgNaaYWcCaix9Nf8AtnOjI2qyCkuKMFJx/qUVYiqT+zkrcBnOnJLyQsXGsOCUMSCsQGx
         eS/Td0ia0Y5BIsPRc8j1JDzDgo3GE7LjFa6B/CklEZyJWy/oBqDiBlaxvk+mASBCa9iV
         NcKw==
X-Forwarded-Encrypted: i=1; AKwUvBz2lD7Z6WYAAAqWd4pJzqsoklKbheizC8uWr8rEHM8hb9gh5Fhhe1eoDbp/DU/V2VaOwvxqey2s2YIT+2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJss0EpduQOq0UlYjiBNc7K47RYhHu0Lzksrapt5VbpRbkLDYOx
	7Cb/ccYZqP+02enfh8ep7jDSSgog77jBVcrMADq0iS0Riq6Zz/wsdva9rYDeAtK6UU8ru1/7rBq
	INScEvpmAuNbAeFc7sYFdew9RE7mX1jqR42P2+0gMM3qroAFX6TioVFz5/IdQT0dlNfgBTh4UF5
	qvSDXarmA5TDqr+bx0ov1si5r5fRwd2Zx/c0m8Tg1V1kfXYOboxg==
X-Gm-Gg: AYBFou0FLxl0QVTHUvUuFrZP7QzM5D7uV+wX8oImmmtuwhL/oKVjnYYd/nJD+CgZFY1
	OzsdU9OmgbHzX1FVKh3c6K6afhPgd1uG4jw5BVpDT6RJBA9tmjlZqZotKOG8V4TciUBDMfO9VWr
	FPVYb5DtiwWevwfEtXL/lXVIS3PeE30o1Go5Ily4t2LimeW5rbAaa8CfBpo7rInXh37jecOrRAj
	afVsaCQRq7jsuoNLnKqty1qelMpfFDO4I16ZWzuIH5TRMSalbG3J2csi697LFSjLlrPJ6QUhUxc
	oX3z+56+VQRWfNkLlrUiBlKmoJI5fVs6fbCLpDy821lZW87Ekm6XhLh9Kt78lZF9d1Hiw8s8hYf
	h2zIPtAwBjbmmnvUxTjVEa+5WNzkRzSC74YPXrRRxvXuTu0jGsISQ
X-Received: by 2002:a05:6000:612:b0:487:da0:df5a with SMTP id ffacd0b85a97d-48c4800340amr15744146f8f.42.1791283819870;
        Tue, 06 Oct 2026 03:50:19 -0700 (PDT)
X-Received: by 2002:a05:6000:612:b0:487:da0:df5a with SMTP id ffacd0b85a97d-48c4800340amr15744093f8f.42.1791283819372;
        Tue, 06 Oct 2026 03:50:19 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622704a5sm22135235f8f.15.2026.10.06.03.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:50:19 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Hongyan Xia <hongyan.xia@transsion.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, K Prateek
 Nayak <kprateek.nayak@amd.com>
Cc: Jiazi Li <jiazi.li@transsion.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] sched: Convert last bits of deprecated static key usage
In-Reply-To: <20260903115728.11864-1-hongyan.xia@transsion.com>
References: <20260903115728.11864-1-hongyan.xia@transsion.com>
Date: Tue, 06 Oct 2026 12:50:17 +0200
Message-ID: <xhsmhh5izyufq.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 03/09/26 11:57, Hongyan Xia wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
>
> Raw static keys have no type information and do not prevent mis-matches
> (like static_key_false() on a default TRUE key). The helper names
> static_key_{true/false}() are also confusing, hence the deprecation.
>
> We have already converted other sites in previous patches. Convert the
> last sites of deprecated static key APIs. After this fix, scheduler code
> has zero deprecated static key APIs now.
>
> sk_dynamic_* uses static_key_{enable/disable}(), which aren't really
> deprecated, but take the opportunity to move to the new static_branch_*
> APIs to be consistent.
>
> No functional change.
>
> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>

Some comprehension/changelog explanation nit below, otherwise:

Reviewed-by: Valentin Schneider <vschneid@redhat.com>

> @@ -6575,21 +6575,21 @@ entity_tick(struct cfs_rq *cfs_rq, struct sched_entity *curr, int queued)
>  #ifdef CONFIG_CFS_BANDWIDTH
>
>  #ifdef CONFIG_JUMP_LABEL
> -static struct static_key __cfs_bandwidth_used;
> +static DEFINE_STATIC_KEY_FALSE(__cfs_bandwidth_used);
>
>  static inline bool cfs_bandwidth_used(void)
>  {
> -	return static_key_false(&__cfs_bandwidth_used);
> +	return static_branch_unlikely(&__cfs_bandwidth_used);
>  }

Usual likely/unlikely/true/false static key confusion for me here;

The previous definition was pretty much
 = STATIC_KEY_INIT_FALSE
due to static storage initialization.

And then for the static_key_*() naming, false == unlikely.

Because it's all #define magic I assume the compilation delta will be zero,
but I can't be bothered given I'm on a laptop running power saver mode.

