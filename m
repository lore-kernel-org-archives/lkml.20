Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945129;
	b=GkUuI3wxBYdBZ8SIUeY0FRFoJxsGZEtXXggU17nxXuFZQzs4XkVjKzE/dg35kYIxUnfy
	 ikt9OhQYqVqWI1VJ5l0s0yUhbdgkslM/eD7pOhBd1D+gdJa3hzKX7J0XRUnnhN9xgE1eg
	 x3qBM2TIdF+URvRjty1ZPdlK3I62DSOvXu8e/ufkaOrDS5wx/KNKEGKEFZJpY6fN8ie8N
	 92KvvKOzPOwi3ffkwjITIFrwgJ1UoFxU2mjMGQEHi2YQvIpqnrLlS1mbpb8OQQmPhyjVZ
	 4De3Lt/6UDM6IMcTsNvw2xQCfHs/pg9H8SC2kJldjgBdXHJdT9gKg3TkkAEVQEoxz6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5KBUz5itfW2H0npvZHDcjaGSjYLfy+DCPcwOiE7R4cY=;
	b=E0GcUS7sQ2Vxjtdc3Vw3El7ArGnEKNDPpC8zIDlfKdRCDFgn4LAgkNcoeyZEpBIIZSoo
	 1Krne4cuFWnj4SHdeeUjGeQQm6mYvKcVKP1fMzFfOget1FMOuVsc/Rw4FqAU8Ar8w02R9
	 kjf6mv0inVjqwQBo6YVthFcSkDQOPsXzMNeYUgcEXdOciyDafTewsF/j9aEm5i5JTIhUb
	 9zUmU+ae03+mhSN0a16ku0HvDzrKAZakB9FnBMr5HWnPwJ5+bIXV/8zwDXj5zgXYNck6z
	 Yt8EbnSnrtQC8fdGELBXSAWXUx/+XbzLoQaxMirUbu7xVi604AyykkhTM7IMWmzpelg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5xMsX5Q;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8D1606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD8D1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5xMsX5Q
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-89f639ba307so85302b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945128; x=1794549928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5KBUz5itfW2H0npvZHDcjaGSjYLfy+DCPcwOiE7R4cY=;
        b=D5xMsX5Q5Y+ELb1XuZwb7AiDoSadX6UgEPUlS5WvNXHL33zjCUzQr0hbNSBgVmOF02
         98n9gc4/ACh89x4RlkfqkaT0D2rZhfnyFm0Y1roVjJxqiOyTB4aMKuQgn4ShRIB5qaiV
         ewksZawLdzpD+lSJvqtrRRmHByuk1RoJiHwmE0v4QmHHCxyZJwqbxkAZzSd5Qt/AZpP/
         XdPXYfVvaZwqmNMlNokEyFPVqEpUBHMqtcw2K6U3khlFwe1Ro01kR1nXeCiQHRbp2Abv
         s3UUNgbMO6YcxszmjLWASodBHsdSjrFx9K8qHetjhAwIn+DHdN4tfk8Dt99rUCzUPWAS
         Gemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945128; x=1794549928;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KBUz5itfW2H0npvZHDcjaGSjYLfy+DCPcwOiE7R4cY=;
        b=1Myo1l6lWMtdkYnLXCZ9JPtXGjiIxSm0quuUsRUeZsbtfcLPkbmBIN2YTaAJE6VPbh
         hVaLDbt1dfQ5NS7r3/117EZABGDmmphjGLBVv41U/sdpf5GOKRHdHW3phSyEorRTf33k
         7nWo/SrQvpAFgCvO7o0sRHiVb6jOn9fmebSe2A3yAaqa5K31/ZeTR8wiUKdaF2hYgfq5
         KU/y3/w1X4XNy8ixr/14F8nqNpcCN1ReqkabCztKCB4uIJZDnX0VDcB9luyEd+03PCXj
         syEgZ32aRoOlnFuhmJiwmsQEocsV3RguUnkWESSdLnAwXVtsPXPgJ9DBHUnTsWud03PP
         qCGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFJiiaTFns5SC7+xe0tXwOsfVPY7y14ufm9aOjYe7he3SESYrrjkOKfvv9Tb4JNaS49JGp3qyJVR+QtIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uYOqt/ADp2JFELUmQBt1ubGRklL5wfPwcrFwxtuf+j9fnRhMt
	pzBEtPhiws4jveooXh7XA42SEhwvhq18lGqLL6zkujmoToVQ/pZERZOMmzr2wwiL1g8=
X-Gm-Gg: AYBFou1K8gKr6euJ8CpUBgeacqTtIKP+AZNOH94Y9zY+mLhPiCjN6PkWsBBTaI/Zqka
	Thr5TryWpdqA0XXe2yoOkL8wcWe5P+yTQY3qVDgS2XcDcDBiQz4iKRxIEVsUucPImFFAnDKigYr
	DbDQ9Z/dXoouNd496+DzL5VS1mlVghSpzFc8s4oooNPwgC/+bBH8SfcsteoncxSGj+e0xfTlBMN
	cmzZAkEJUkl7EgYk3ZPz41UbjlyI9WlBKgsTjnGe1DL7DflSHnO5Zc+paI7Hv3iA6pvNTbkKZWL
	456tj2k1Aq8gqAtJ1vllXVqDaMgrl6XxlOblWnaKjwtuWtErF/FZmvEHdYVmAuFN9MzgxvMAGGT
	rE4mhQ0LuL8w4Ptngnq3N7LpNve3tqRhXzUyXPrJuhrMrTdykNXMnaQP6jtwzU8QJeB9FXgo+Z+
	GcbQq267eA6NV/J5fuB8w+K0cPHRJ4kij9wJpzTt3DOIOUw4RNuc21GwVFljJPBppVpXcbPunZ/
	EfTmP7PnGeZSzDe41QjTcdrASIb+AS/2NiPn78HQr80YZiVpZuAH+hF6bPmwW0LO9E9oLqGGTg5
	OKm6xg/1VLGOE66TiTsdeLw65lLB
X-Received: by 2002:a05:6a00:4211:b0:87c:e44e:5694 with SMTP id d2e1a72fcca58-8b37ae9cca3mr1380301b3a.21.1793945127925;
        Thu, 05 Nov 2026 22:05:27 -0800 (PST)
Received: from macbookair ([150.203.68.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0161sm306194b3a.26.2026.11.05.22.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:05:26 -0800 (PST)
Date: Fri, 6 Nov 2026 17:05:19 +1100
From: Myria Sarvay <myrialsarvay@gmail.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	sven@kernel.org, j@jannau.net, neal@gompa.dev,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
Message-ID: <au1uH6uxtsw2vHfP@macbookair>
References: <20261105085750.120392-1-dev@deq.rocks>
 <20261105085750.120392-2-dev@deq.rocks>
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
In-Reply-To: <20261105085750.120392-2-dev@deq.rocks>

On Thu, Nov 05, 2026 at 09:57:49AM +0100, Andre Eikmeyer wrote:
> On the MacBookPro15,1 (BCM4364B0 over UART) A2DP audio drops out as
> soon as WLAN runs on 2.4 GHz with traffic. The host keeps the eight ACL
> buffers of the controller filled, but the controller holds single ACL
> packets for 160-200 ms, so the sink runs dry.
> 
> Sending the Broadcom vendor command 0xfc57 (HCI_BRCM_SET_ACL_PRIORITY,
> handle and priority, as used by the Android Broadcom vendor library) with
> priority high for the audio link stops the dropouts. Setting it back to
> normal brings them back right away. The BCM4377 of the MacBookAir9,1
> accepts the command as well.
> 
> Raise the priority for every BR/EDR ACL link once its Connection Complete
> event arrives. This covers audio as well as HID links. hci_bcm does this
> on Apple machines only, hci_bcm4377 always, since it only runs on Apple
> machines. The PCIe driver receives events in hard interrupt context, so
> the command is queued from a work item.
Hi Andre,

Just wanted to point it out, if you hadn't seen it before, that Sasha
has in the past sent a different patch [1] to run these priority
commands. They seem to take a different approach to when to enable/run
them. Wasn't sure if one was better or worse though.

Thanks,
Myria

[1]: https://lore.kernel.org/asahi/20260525-brcm-prio-v3-1-6259e10233f8@chaosmail.tech/
