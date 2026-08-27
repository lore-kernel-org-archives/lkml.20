Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9B02DF717
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818972; cv=none; b=FSlmA7GOFceEurPu90CvXsOVnUVeDfhm/OlSzcov0ouei1k6wtz/DCRMXrhspHdNFoT5WNIS8Wxu0oQZiP4FUMS2V60Bj9NYW6RY40It2+C/Gx7yzu8loglxVsLOEcfFP6F8q1VPZ1h2ihZoLRQ3SHD/5YrxImKFw89KeLxfWwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818972; c=relaxed/simple;
	bh=6M+q8plwytqVuLkezGJ715SOoKUxxSuuUZbsWnkW0R4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oWecosIuBycKWTa1KM9JXrYiLrrjGSDeg7BldqRjIKH7w9v27Mx5ftVdB2WKQFfyp9cuhbYtlPKhFMlD/kkmNu6q+5NiADf71R381kf4uDNgEh0z6fTfo+as+DOi12i8IUGGQvNGFZshsd0yD3SaJiMJXDvLKHnfmobqws5ff0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RCx+tQVZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=grt/mEcV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RCx+tQVZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="grt/mEcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787818970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SNJwJg0S3fs0+kduUqx/6yRTxLzuM/Ks1tVa5hY73r4=;
	b=RCx+tQVZt9UnO3EvWH3V0/5yEMAj7qP4FGT7AgPA6pj+qToQ8bfsbW+WoXSdAqswq1TvMv
	DIYBhn+F5nUYZuwolXL70UJci2L+tPzNHTK2197eEpgM2+lENIF2vEeou6IySjnCw1FtUb
	9S4zVq5s3/eNChSXuwgBObzpVgIuX8Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-ztSJgHiSMpqV5bfq37BeBQ-1; Thu, 27 Aug 2026 04:22:46 -0400
X-MC-Unique: ztSJgHiSMpqV5bfq37BeBQ-1
X-Mimecast-MFC-AGG-ID: ztSJgHiSMpqV5bfq37BeBQ_1787818965
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c16711b9473so142102066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787818965; x=1788423765; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNJwJg0S3fs0+kduUqx/6yRTxLzuM/Ks1tVa5hY73r4=;
        b=grt/mEcV6q/9puswVEgKmmxGGrGbYlz6Q+pRPMnFMKbMvdx+oUkGcE8iwIZr2KDBVF
         99bOvV5rix8e+TlXZZPu8UWln3ZuSqyKKS9Y7b7f44lXRCMCHSKgX62BTamo741tz75z
         i5AC1VNsuCx862XdxsF6ddpP7GYu7SCfdkzEoXJJkk4wUMRyYVXm68c9kNy3gj5b/if3
         ydY6oADDda0Tiyo4LxWWje8aeiV4bCHP+EwWg0wQXv+y05MRZlBx+/a/0O/gPVDijXJX
         RsToXTOBjNBLFROjcHViWY9Yz6O3SfR0nhmkijAgQjFgu/SudUYEVkDwPrpZq/1mR6Ql
         eqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818965; x=1788423765;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SNJwJg0S3fs0+kduUqx/6yRTxLzuM/Ks1tVa5hY73r4=;
        b=IPqquJE7FAPjbvm5GaTgjQBByg4WGPSzIlKhTUYYQcyOHcmum439DmQGFXknoAaSlb
         +0FoJFSphPcIsLUkUKcMIxxhdspOer+TVlWZG2xMxuKlBHAwf5Obj9T4GIBLeCdbCCPP
         f7UZMjKmUTYvF+TT9ylmoxcMSjvbm1Ms5S/GgBr65QrHwm0fP0I7m2Mn3VOSbAEY1etp
         tR6NCc5zlEh6gsn4V5KxDhhGw3rPXrkDk1vDl0aSUf8/WA0pQPZR1d/2ugZ4BKbtTUIm
         AJ1HZWZAZ0++Gck/DZlZz1lz/gKWGbOdwDdxPAcWuNOc1Ys00z8GidfXcLZmx95Pty9T
         3lfw==
X-Forwarded-Encrypted: i=1; AHgh+Rpone0HG+kCvKblpAZgMv2nwmRmhQmpAJNkxESDvKPThbjrMyNvuXDhTa/KAQkGRNpMHXfTWOjVaV0OKlk=@vger.kernel.org
X-Gm-Message-State: AFuF++mk/tx52xqbM6E0gpuLZtpB4DswEnWCkL/6+9Q3PmfUtLD4D90o
	tjn56rxCoSr7OgUlZlqi2vwmTYAYaAY62oXiAoVcCUtWEEDv27rVJ9Kl1KF0Ww0hCKjWhw3EfRA
	tmofUAKwL8han0xPJTQN6K5Zeq0PmnD9gt1xl9wQ/paOB7mQ50y/K/dCy8ErUeajj9A==
X-Gm-Gg: AR+sD11sbHZW4U65+6mDoam/6c7B8/KTcSGkxuyS+QyEDYZESEA9ySGaPpPeDn+Yv2y
	IYHLuHjXh09X068/Lx+JVhzMgc7fHZ5ab1dU2EHfcexktfrfsFk6i3MJgGUsUe/ZCDWO62Dnsiu
	EYKVFDj8e4miQoTL7Si8oF0H/9zuXccznJ0xa0R0TgBYxyJDVomcuhBGDy/UwAQdXhNFswBQEvC
	OkI9GAG1skXbjLj5fmdC/DRp+oCmBdsGmsSQftg6ss9F7KPqzp/NkYkU/9oGuu+fJLpUqU2PLpf
	czTERzr0QRg5xbnjdWPSSsxQ6MVwR5eoifaz4XqzuydxSFcW0GlrBYaWs4J+n3C8kYq/Fn9kLL4
	UJ/8BUKHRrjTRl13w1ktwWX0n+MnISY60G2MY8n9FWTsaKnhLqsvqHA9QyMqoVtr1zj7JQg==
X-Received: by 2002:a17:907:6091:b0:c1c:2007:298e with SMTP id a640c23a62f3a-c250c408972mr1556837366b.24.1787818965154;
        Thu, 27 Aug 2026 01:22:45 -0700 (PDT)
X-Received: by 2002:a17:907:6091:b0:c1c:2007:298e with SMTP id a640c23a62f3a-c250c408972mr1556832966b.24.1787818964786;
        Thu, 27 Aug 2026 01:22:44 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25127b66e5sm711301566b.45.2026.08.27.01.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:22:44 -0700 (PDT)
Message-ID: <ba9a55fa6aeae4ef17873afc7373302a3fadc82d.camel@redhat.com>
Subject: Re: [RFC 1/3] rv: add per-edge dwell-time statistics primitive
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jan Kiszka	
 <jan.kiszka@siemens.com>, Philippe Gerum <rpm@xenomai.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 27 Aug 2026 10:22:42 +0200
In-Reply-To: <20260827072400.45734-2-tobias.schaffner@siemens.com>
References: <20260827072400.45734-1-tobias.schaffner@siemens.com>
	 <20260827072400.45734-2-tobias.schaffner@siemens.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-08-27 at 09:23 +0200, Tobias Schaffner wrote:
> Add a small primitive that records, per automaton edge, how long the
> monitor dwelled before taking it with a count, a sum and a maximum.
>=20
> The counters are per-CPU and lock-free, so a monitor's hot path can updat=
e
> them without disabling interrupts and without perturbing the very latency
> being measured.
>=20
> Signed-off-by: Tobias Schaffner <tobias.schaffner@siemens.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/linux/rv_edge_stat.h | 45 +++++++++++++++++++++++++++++++++=
+++
> =C2=A02 files changed, 46 insertions(+)
> =C2=A0create mode 100644 include/linux/rv_edge_stat.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8014b9f8253e..04589dda0873 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23654,6 +23654,7 @@ L:	linux-trace-kernel@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	Documentation/trace/rv/
> =C2=A0F:	include/linux/rv.h
> +F:	include/linux/rv_edge_stat.h
> =C2=A0F:	include/rv/

Any reason why you don't use include/rv/edge_stat.h ?

You wouldn't need to touch the maintainers file and could just

  #include <rv/edge_stat.h>

Thanks,
Gabriele

