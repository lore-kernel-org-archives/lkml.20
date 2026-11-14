Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794659643;
	b=XRJREMX9bM4qvjCyvnpFQmucg3TS/7v4RbpESEYPio+rvcoNN546pOqrhzkGc1nYgzhR
	 4acHukhHdqI2KjZSPh/btEvB1RvV24Ms2EwCjLnh5wmpJa1M/NLHHKHL1TBkLjI6KdWyb
	 5XRp5Z2d477xs8c9sFHcNb0b57uxmvp+zalV+7BewjvRqRohzcHtPv9o2/nQ1KMI1pFLm
	 5xTwp3XCOE8Jvlf4rKBF2Z2FD2RWt+Q071tNr0dzSSQHg6RkvOVHu2DQW1nT9ZGRn6sNd
	 FyuH/CuI6iPrj8xBEVhVn9Go+ieNUFEghum4DyZOAB7gJS33EVBQEr+e24UTwSRi0xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794659643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=YluE8J+/JrXXpXAxA9V3z+4IjC8O0zarKz/bVofFq0M=;
	b=J7mczQF/wpVWiXaCXmGoyrO5bOR8lXZKdPiZC32PzIcKbts5mYUeqPIyZ1FVhCIrE+Ug
	 KiYT/E5tHxiYs274Vkug9b32mkuisba0345YoT/U3hJ7cEmaXlwSMWHCc6dAiqRO0lVyR
	 1GOQ8LtZrYyZWBo3CV7Qti+XTsxCPQnOtaxkYi4jg+do82sdcOwZ4Wqqe7/hJByAB54DH
	 JCXZV5DbS05z1qWD7JH1eUn0Ipr65MzMQMf1V+6sQ81ivjPThrAz84dZHiBLDN0p9JHSv
	 xSbLbclTg1gYnK/SC7Qtk/Etbc+8mzYiV+fpceBbYFIjVERX/t9hJ0Vme/7TnXClr4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HKi/6Cnk";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AA3606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1AA3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKi/6Cnk
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-372bdb942dbso2023912eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794659642; x=1795264442; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YluE8J+/JrXXpXAxA9V3z+4IjC8O0zarKz/bVofFq0M=;
        b=HKi/6Cnk4vOnXhipIQos+4jqIQX+xtvCaysFfTCeS/xcTSypTpfQQDxoVRbTz8Wwns
         WtNARQnr2WigJLEES07G1HvA7q1VnMvVw5urhdiZDHqN2+rklojO8vy/hqiidfxN+PKe
         3SZRztfA9eAHHguu0AvhroVmtEN7DDqtufrfeKEpCohTTNHUvcq4qFgq6Kgd4biXnMkM
         NZ4nvhW02QKXJELxRWSgdlQfqs8JjbMncxKolGv8bTwK/X1b3n9bqdX+BkMBT5lmAzmF
         +yneyqStHJlzQgN1DbYMkyqzEQDJv7XSrQ10BKRucY1hcNltZ+hFn88XfmR1HqlNCTg2
         p4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794659642; x=1795264442;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YluE8J+/JrXXpXAxA9V3z+4IjC8O0zarKz/bVofFq0M=;
        b=VW4p7ERmhCEYQ5zkTeo7ogDdHmy+0lIy0HT8xBmljvE1mDcqO9NgY+N181vgGl4fXd
         bCQrpsPX2LQ2KJttWLddhCk7iIRF+zhRC5EFaYe31OgDcifTQ1q+Ot/27FetGW/io+b9
         QA9j0ym16MUHJsT4llNLi8tiXu5VQ+/uoLEV8zj2SJ99BTWH5jVSU+9GctBbIjo2+qwa
         ucH1P8XfF4gMU433f7obi6TcaCDDr2//pzspCpQ6LND/VQoYHD1m9XIfFN2pa/6VRLuG
         4InkytwSpKjx7y049PQHDNQdRBB4R0pcsw6gALG8Zp1xR94rdqSItUZ2BsgU2ooBELNc
         Ni1w==
X-Forwarded-Encrypted: i=1; AL+hErFZJ7CDxDZQOZn3nNt3FGjeus9z53fUuHnskaaGPmAgp7aURtLILExkyH/+B95bnM3iC419dyNJWO8ok/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mXYIl2xF2Qh89vKpbB/p0yWhsfrlvvX+kNljXPEwcu7tV7B85
	kgXGkapburSemjDOUlKtNpNdr3tG6Hk1WoopWONvSOiobRdEw4mzk54PfkoREw==
X-Gm-Gg: AYBFou1FzG9VVBNfI0o/oMj5JJtuT2EmWNh7OAySmDk45BFWPkw+09AwrV4felIyUTm
	nFWwIexTVv/JUKEdTmjSlFfUBIMFbrGlEmGSMGIEX0940Ib/0VCHv7uCK6G/N2618Rkwg5hNIxa
	FEctJzqMmC7FsPC2jUdgd4vcuXPWKE8056cVlXvFMSa6Yba1AWzPdbVdpP6hM4W9wEVyKT24eZe
	gV2Cb2DjFBc7W3gjwTZ5rTLUXUt7ZuXTxbQZMoEkt+P7qMsXoiM3H0yp9llpmAgtZ8Bf/bFmkfj
	Pj74DgLB57+6oG3+GuN73pfTc0P3XhXS7i/XkRhACTOADVr596hpaAIL/K6wKVcubHwrVNukXkc
	Midv5cst8dwLplR1uika9zs4NUsMK1EgJ/AtZj69CGsY2jMicb+G8PUS6kO3wqI5As8dYtlxS5A
	P4c45YEBtSscmJRddngyYDXgSmNkPFpqDBy0jrhbocU0o77XNm5gyaG+Zmf2xCQ1A0Vl3odbsiU
	klNyix7Y+XMy/4i58QHngHw6SBsNHZeAvgcEGG7gNUJgasIv4NlRIY83X+wxOgROsl0kqhkIBiS
	p69klkD4RkWCkJObfwKdKv3loxE=
X-Received: by 2002:a05:693c:831c:b0:376:c352:2fcb with SMTP id 5a478bee46e88-37966e3ad42mr4866293eec.9.1794659641790;
        Sat, 14 Nov 2026 04:34:01 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm26708201eec.8.2026.11.14.04.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:34:01 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: John Ogness <john.ogness@linutronix.de>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/smp: parse_thread_groups() return error on missing property
In-Reply-To: <87mrrbrhf2.fsf@jogness.linutronix.de>
Date: Sat, 14 Nov 2026 18:01:51 +0530
Message-ID: <eccn8uh4.ritesh.list@gmail.com>
References: <87mrrbrhf2.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

John Ogness <john.ogness@linutronix.de> writes:

> parse_thread_groups() is supposed to return -EINVAL if the property
> does not exist and -ENODATA if property does not have a value.
> However, it is currently assuming it exists and blindly calling
> kzalloc_objs() with whatever of_property_count_u32_elems() returns.
>
> Since of_property_count_u32_elems() returns exactly these same error
> values in those cases, simply return with the returned error value.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  arch/powerpc/kernel/smp.c | 2 ++
>  1 file changed, 2 insertions(+)

Thanks! However, the fix for this is already queued to powerpc's fixes branch.

https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=fixes&id=126b47221b7b98d83c118781ce724c0515d86d9c


-ritesh
