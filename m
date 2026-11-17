Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883763;
	b=BANB8IH5s/Rha5VQnEJYtS+LI6LODT3w6NBfdCzfOIddG0/HaYky8oWVP/onCmnY5Ka+
	 b2LFzCEd8n+RfP7+XtKkwksan+ErgOFVyKTT184aL9Pv/GcixHHTb+kn+OWfYVU8aaP5q
	 pGYsnYTiT/suXeGy6I4ec7wsC56+Xg0yv41ns3kv2HUN4LipXdPJmOibPDZ5ITmo/x6aC
	 3QVispx+VH9dOP9MABnoGGEHjNG/mY2LsSjICFzajWf5HVi0i6iV9vwxJ7sF+u6F9NGXO
	 8fLAR7EWXf4JdwX/uDhTBYYYmjJOhH0PMf9uQ/lKbpk+FrTm3+hc3ArBmNaeP5daxsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Ey9PCEftuBoU8x0pc+FrBSPfEFBtgOJpL5SMzZRoz74=;
	b=rz5y/2GQNWMDgPiNKrnGkb5GWAulLth4U/omppWkZ+5WfKjwjMPG3kwHlURWbdT2xI+P
	 ADUhUvaIAWY1dfjzWodgZzp0Pmp/7MR6HlNcUwJqsFQK8OdD74w/UGn7hjxkNDZZvb9hf
	 kWoCZihjbayR/VPA9ekkcF8piIFPevGh25y8ITGmz2lZ+7uBxL64SrVe9QHIyPOfCPfeP
	 XB3F6Kgy91Etu1Wj5qtyu96majxbNJeJAm+l1pLTEqzzBHDgSjdSzBBeosEPXPnWGdeG1
	 XI6/JBHfpPazWkxubsf4xVujWMkBQ4qSO7O+vXM76IHPJzKO6k9Vl886Xq0gteBv/BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=s9+DVmII;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FEC606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83FEC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=s9+DVmII
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so5263361c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794883763; x=1795488563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ey9PCEftuBoU8x0pc+FrBSPfEFBtgOJpL5SMzZRoz74=;
        b=s9+DVmIIWCDG9HeHzsECghSBUVXfmm7UNmxjemVVWdirrUdGtTMMOMGBYW8flo33i8
         P6zybL2nARNkx5SFm3d9onXu6Vm+EX5SQscUJF1L8qbDCLUJaEubK9vpHWlHpSSFuRjn
         F5U0tR8FlqgPz3gqNBdgajYHUYqdpV4QGFiuguLcftD/cr7HfBMzTB+vpi0CE0yPKgzv
         WI1/2U6uoUSWP9lfm0PSov7bNp3eDK1TC33lZYisUlmPHgAANF/TC12ZfUSrHJt9GQ+a
         JQi94m15ju8NBRckN3emDUzgkiPixG2l8ZjHWS3iiHBeec6yAX4FfJed/UkE1nigf2SL
         R+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883763; x=1795488563;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ey9PCEftuBoU8x0pc+FrBSPfEFBtgOJpL5SMzZRoz74=;
        b=uIZTIFGO1/PCR522GFT+CyeEdlONvA3cAATsEgbZ4Bbq3qrIHflnvCkvl5CnOZQ+zK
         KJFddpyjZYYGhpJHhONGVcVXPMumV42LlkvDjczMdtlrMnUHHwl+eLTmLUdRu6OnZUpP
         hm1L9H4sqmv6E3T0RLdDXOK+PMUIodJGp/OIeCwhuZ8N9PlnHKrrHzgfCd5v2nZ3gTfQ
         J8T7PWW54TuJeTuNDfu7zDbEh3qk/Ne1rlsJmADPP3LueHYtPk2vQmxf97lb/NN61YW8
         Qekm3I97wx9gzdzUPgyZEL2lECzl6ZY7lP37CLeHo+CWe6lhNfF3KmW4Q1HDl979l51h
         LH3Q==
X-Forwarded-Encrypted: i=1; AL+hErEPigtaAV7BD8z+uhWO8M0T6Vlaeb060YQoOorcPBFQ5GrUS8/zX8nl1umJl265IxiEifZhfwFdC3w32BA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i7+D9q1PonyMhBy8QpT/YBEdjPe3guT8TGAfvPKpKOxaWPi/b
	ULgPclizCCXz61JMZljHbKBKgVh14MRgYMfOw9ZSkyHBOr0MfE1SZkFnppyJ4uU7w+8=
X-Gm-Gg: AYBFou0AtrvbY/xOR7M7GPysaftbXj8CDGlwhBO0ZIqs80hZ0X5c9UJba3tH69aq4av
	DRbrxN4vxibsUiJwaHZ29Cf4eHS85CC752cKfCY2Tq0YKnmyNz6LvbzkVfxyYniw1pn4DEX0MHw
	3lR+gCHF2pE9FkkpOSqf7OaJtt9JHqCP8NM0mcJpOTYDdulFdA9sQ7BJI9AfCIQDgLAWeLI9WAA
	W8t1UBMjnj/0ttEPrlXSGJHu9FQqhC0R/88ul+6fZ66Kd8MH6M29eafb0+AWmbeSBAyCJO9EVXW
	rM7DmohTRZFFIaKngxyEJOK0T0G9ZsVWsgY3G9atXStQZ7HlogMrR9eLba/QOCmoBFhDR+DH1Su
	rjIwV5Ja7WHcB3pFfiDHUu/VI9bS39YAg8rKxYbJXgEu5/H+nqfRly8t1+BUKPcnO214EzruKBs
	hYbNbDPPgn+hCIYB4XrJJh90PBtdBRPUeWCAvSj4UtQNX7mOgUu+84ghxwChl2Zk5W8a5hbCmPO
	dvGVYGiDSrbqaA6FQYd/cEiocC1BOqyirgOa8BUiMk2t/kYssNuPs/RzXxiR5DEOeLbJ54iysqG
	L34oe5fODvDXRlTggnBI10t5P15jl82MPJ9blxh9gHTxol09qjTWRtmOxdAy6uhsyJOd0XgrtYM
	3zUgFAHBsZ4Qy
X-Received: by 2002:a05:701b:4591:10b0:1b5:281e:173d with SMTP id a92af1059eb24-1b5281e1db5mr5188825c88.46.1794883762621;
        Mon, 16 Nov 2026 18:49:22 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm31493244c88.1.2026.11.16.18.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:49:22 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Jeff Moyer <jmoyer@redhat.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116044531.281978-1-teel4res@gmail.com>
References: <20261116044531.281978-1-teel4res@gmail.com>
Subject: Re: [PATCH] io_uring/rsrc: keep the old file when a file update
 fails
Message-Id: <179488376197.22588.6516413641440014375.b4-ty@b4>
Date: Mon, 16 Nov 2026 19:49:21 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 15 Nov 2026 20:45:31 -0800, Cheng Yongkang wrote:
> __io_sqe_files_update() resets the slot before it calls fget() on the
> new fd. If fget() fails, the fd is an io_uring file, or the node
> allocation fails, the update stops and reports that entry as not done,
> but the old file has already been removed. Later requests that use the
> slot fail with -EBADF, and if the old file was registered with a tag,
> its tag CQE is posted as if it had been removed on purpose.
> 
> [...]

Applied, thanks!

[1/1] io_uring/rsrc: keep the old file when a file update fails
      (no commit info)

Best regards,
-- 
Jens Axboe



