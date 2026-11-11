Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389046;
	b=BALjoPgXFsT65c9G5KSAth/gUWbDWy/lMC0UH02oLQqGN+rJ28lP/AqUki1sLtRfUi4e
	 nAduMBCzj+THOgV1YQUuGjsPS+OzPGjSJ9AnqjZWatWtWQ4QbyoPq6VjoeBfrGL3PsQg+
	 cYiCemF6YDYyx2j2TSdLecoJ8wYeR2UACHoKd8pPHA1T+Mx2fkGmnBP5JtvAL7b8DtlT2
	 +Ga9I3eRarzHDXpLMTEyzRw0aGFksiGXsqS0rM07FILdeLSnbh0HcfMn8xznsT76pcczk
	 yjv9l05ichdruhKqk+LQRPuTDXW9XXorgBwaA9J1PebGlxk0viJjorjddvqIvQ7OhDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389046;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=QOSdSglx4cYZzRZ4bFEyEb3urAnm38JHFMwpeRnni2Y=;
	b=YsNFuc3tRXvwnqgZ6xlD0jUArM3iwsGsJmeMp77pNSe9iyypAAA1rSZi4xUlegfnI+rZ
	 PREbMJ8xT+CDQfFXl3CEp4djBq2rihsac6cM1/4Sl+pEYv8kqSABzWJeHI+Cwm/pTGAu4
	 wLcORqbk5IwJgD54ipJdhpSVv/GKHVKThkT2tCyFDpy2nmj9A0nUFiH32tQVYS+6UJQ9I
	 /WJc9q9E2Ix2umphCrlAitE6lPXwqp/E4qy5eAEj5/S4bQYshbePGSPIiK9nb60D5aBnP
	 MB4FZiKmbgdSZFo102Ul0TiZIUefV2MIwr6ayAYKwiW+p1HQFbYLRCGLroLJv83+JGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j2ySOr6V;
	arc=none smtp.remote-ip=91.218.175.7
Received: from mta0.migadu.com (out-7.mta0.migadu.com [91.218.175.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B388C606A339
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B388C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j2ySOr6V
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QOSdSglx4cYZzRZ4bFEyEb3urAnm38JHFMwpeRnni2Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794389043; v=1; x=1794993843;
 b=j2ySOr6VZ/dEBnFMNoulACH1oUgerV6jQcMqAt7NLk6jMYKifEUnaa95RXE6qPygTXkf/DjQ
 GUHvBwLPIahThY6e5wMuCY5t081n5svkK6+DK9uKKhy8B1TnrFTZLui3PxoJbUzGnB/s9muOXCs
 rCAhjHrT2hxH6jvetVln0DqM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e671048b2ccf7238;
	Wed, 11 Nov 2026 09:24:03 +0000
X-Mizu-Trace-ID: e671048b2ccf7238
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so3288e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:23:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE8zVq+UubU9jHtFez1F+ReDfwqVA1YJekK5jDKM3HbGcobqk8LE8kwJBcXokE2lf92pWmalOPh5xIyQYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KQy0wjBvlrofGvXFDHFItSdfJGgv8HxoEIye1ABjijHV0MTl4
	YpTqBTbXhy+O0IqtgUo+O04BgA5qawobZnKlo/HO6YKeMh1FpPaXiOIMCXuh5o/TV0msg5XFqL/
	k2KmeZO2QNGA2zZt/kSrB8iLdY7Q25B36TBi4Bp/r
X-Received: by 2002:a05:6512:1391:b0:5bf:a911:7ee3 with SMTP id
 2adb3069b0e04-5c15d3dbae9mr114690e87.3.1794389037704; Wed, 11 Nov 2026
 01:23:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106092625.3977163-1-fuad.tabba@linux.dev> <86se1720q9.wl-maz@kernel.org>
In-Reply-To: <86se1720q9.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 11 Nov 2026 09:23:21 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwGV8FD7vyfxBa-e4EiOML_K7ROzUhf8VXabDZX8BPQRg@mail.gmail.com>
X-Gm-Features: AclHuK8YpE-etUaFU4_mpDfSZ-JZDBrhj85FH0V2Eyh_IMXGfrpvKSpXE5qT9p4
Message-ID: <CA+EHjTwGV8FD7vyfxBa-e4EiOML_K7ROzUhf8VXabDZX8BPQRg@mail.gmail.com>
Subject: Re: [PATCH 0/3] irqchip/gic-v3-its: Fix the ITT pool's alignment,
 zeroing and growth
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Steven Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Wed, 11 Nov 2026 09:09:34 +0000, Marc Zyngier <maz@kernel.org> wrote:
[...]
> How does it relate to the series you posted right after
> (20261106120221.347309-1-fuad.tabba@linux.dev)? They both deal with
> all sort of zeroing and allocation requirements. So why isn't this one
> single consistent series?

When I split them, the other one was a single barrier patch, a
different fix from the ITT pool ones. It became three patches later,
and those overlap with this series.

I'll send a v2 with both series in it, and reply to the other thread
to point to it.

> The scatter-gun approach you keep using is really becoming
> counter-productive. I really appreciate the effort you are putting in
> fixing the code, but please realise that humans are reviewing this,
> not an AI. So please make it at least easy to track and keep related
> things together.

Yes, and sorry for the noise.

Cheers,
/fuad
