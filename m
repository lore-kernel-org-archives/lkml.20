Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793063210;
	b=idHadcrT/wy0z9K3fto5INVWNX90CXSCPrhh1FeeUg2T/qGyQLMgO4VTirvmY1UY3H/5
	 wZFhoByTtgs96kIQB1b93eECcRYDriiv1nNHAaJ0KJyY/1MEInFWCTyPaPgdUUn6WdHzR
	 /0WbPPuIR0gUBG1U0jSD303oYulFiQ8N6o/YB3+IQM4S2zPInJOg/PZ1aODut6lZ/jZP+
	 eKizVuMfmI9cNURfXawvOSxhza3lETxEXHbeQZ5n22BEFukY0xCKdPjR32Bda09g4cYFS
	 P+fDD/sRPZdDS0BoejdRHyC4qFWY2bS4BHhskob1+Zz0Pf3ImJvPFrTr5k9Pd+FMczg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793063210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aJI0hb4/E//vLxc2EVc1E27ZXseuwybs0SN1EQUknec=;
	b=UPC3kkNJfL9dvhOg0SfbxYVKFwdy43gDkdOgQOreF7uhPqWxyYXfQQGcQb16ZZ/RfvG9
	 F/VYbuqKVCl/uzsUg8N9QWQi2Eeb8IsCOQa9sfCKKs+Uz7ZE1txJrrmScUHJCyyj5hMM0
	 pKqNX+Dnjx9GKen0vXCUQ68R3wxbDRjmZboOO06mLbQfrIh69Y7xCY1WGY3oGOO3Rp0Vk
	 C+KFrwUZ73lHsWS7pel1hAWyluoM7j3wYJdRY3U/svSBCVWhkGhWrY1ptV7PnoRLjTbZ0
	 NvRzAZ7QVBIyPA0wAuN/HR2z+GqiStewVTaO0uX9kzNReeL0WJlJBDCO5D7ynbSWniA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LTXvgnV0;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F34C606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F34C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LTXvgnV0
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c46822eefb6so471224666b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793063209; x=1793668009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJI0hb4/E//vLxc2EVc1E27ZXseuwybs0SN1EQUknec=;
        b=LTXvgnV0kKaKCac/NWTDNj/xLVRA12SXR8oBYGVw7hB46ZT57gB4fZwYtR5nCCblkS
         peP+RjAszOk0dm1T6N+uNlAtD5zw0eE2lahff023hj5G//C919I++TvXOZ3DarXuZCiY
         CdA2bEl2sIvMMKXBmf+rpvs6JbfEPu5km1R+tIVnkFUnKRVdcKmH+9TFh7Z3Gp5SZGks
         0xu37F04qrnh8fsQxonydlDd+TPd3e3MYXPMIg4lN2SvnxV9ntsb1E0EcMW00ZocSO6d
         tuaikwD10/VduwJNndzh735UGS98Jmu+qk9VwbMuzMXhmtJEuPN81j0LyK1pZmjCEjSj
         z4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793063209; x=1793668009;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJI0hb4/E//vLxc2EVc1E27ZXseuwybs0SN1EQUknec=;
        b=0azqHXiXMoAhJwW7085LToneHWHTuaFPXp5RFDWSbZluCSiAxKsjrB4AT0wApL37Ak
         1zpYaSvpb9W5H/g410AxVwI7feel2gNAAA+3H/zz3TI3ujZHqj8y34MiN41ieMfC3/E4
         bplM49bSxRpteq2Dh/UeMplLcOVcSJVZcUY2h1ot5SeAAN4Qp82M+hZ58ZqwFmLX/oom
         jgtYCb9R1yUmSBPK3da0aLMpPsuovNcsteu4h+0lJdKpH8oKgOPEmNAWCEjQX6aoyc5S
         ZxeiLemW8jSWtxRRE+zT5IjYLS+syW7a3MCX8ezI+OBgkAi5+x6kxyVTN9OJsNCC5ivd
         vwvg==
X-Forwarded-Encrypted: i=1; AKwUvBxZPbhdvSqm8GMoi1yuSEu2CDrhDGeWmbNncZT7AYh8Vffki/w1m07jXOz/6y0JsZiSW+sLQzJZZ9tbtqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpWtlFXhr2XUzV+g0taF02oF4O1y1CBJm8xc/3duEXXtjiEVxW
	D9tvNrxIwHaG2Ibtroyr/DixQDcyL/ut58HTi53UpPiBRqMCc1b7doHT
X-Gm-Gg: AYBFou3iAR8sznCDpRo4UGE1wt5J7XVOFgH1ZtlG6b2EQ1pQ77jakRSSe+PLeK9tbL1
	HhEoIeqhEZj3WTUAOqJt/8rtPcfFVHNViuZyTmIiQPMwTEY+PFeCxUmxjRPANpW010/RgJwPNPM
	TRlNVGycsg0aF+7zu8JdtsyrPFSFgJpLtZn8xRSjDcG3OLlzUUudcGWhDu5yBjhMSSt5AQEdYh8
	/r0zxMBK7jxofYYUIIop55PZOgHijQnRB/zGU7j9vsl2X7WNyBNXafCmLg9CcTv3UdCCiif2ObN
	lx77O7UiCQYwVyb7IJcIycWqUe0RCbVKcqmqFJADGjkg5QoMxznwNtQUDW57A+1FaHjktVCbvSg
	y3GalkH2Sj74RJu/tsEHo5SX/hmhvt5S6DMCMgOffU2x6DhP0CMw6trSISKBQwvzuk+lBgXIOw8
	rQH2bWVK1H3pKFNb7zbvg6y9Ie5QGIJpGpS7s0xsLW3HQ5YFh39owgl7pfsummsDaSBX32Z+nK6
	fLYIJiqUapFMws5F0zs/Tiqi5CJ55Ve7YR9yYLpsMGmK1Ea6xnhXy7pse6VDw2OdrSAqsAV2R1w
	YeD9qgpS9EPdJ6WhygAL7W9/lbFQx/ex79pdZ+pC4uWgrynGnzBpA9QxQeS1HrT2QpKokKuxjwq
	h4Ij1O6ND/ddmc1/ofUxjLUNKqkgzuf6w3NNndEQ2dTL+NtiZjrT6ttuTR4HKQ+KJkHjhdnT+Hh
	04l77YCLXizWdyhK8=
X-Received: by 2002:a17:907:160b:b0:c46:6a50:40b7 with SMTP id a640c23a62f3a-c46bdd690d3mr894395066b.10.1793063208643;
        Mon, 26 Oct 2026 18:06:48 -0700 (PDT)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e7c94sm373434066b.27.2026.10.26.18.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 18:06:48 -0700 (PDT)
Message-ID: <7c8d96bf-368d-4272-8cd1-94740a2e4a84@gmail.com>
Date: Tue, 27 Oct 2026 02:06:47 +0100
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
Subject: Re: [PATCH 0/2] kernfs, autofs: fix pipe lock cycles through sysfs
 stores
To: Ian Kent <raven@themaw.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 driver-core@lists.linux.dev, autofs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
References: <6aa23178.f81106d8.2ab401.0006.GAE@google.com>
 <cover.1792577179.git.krystianmkaniewski@gmail.com>
 <dc65c28e408d6b64d4b13b7ad30e5fe70ddaa441.camel@themaw.net>
 <4f56c93a9fc5fee152364974773df0a319c84af9.camel@themaw.net>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <4f56c93a9fc5fee152364974773df0a319c84af9.camel@themaw.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

One additional detail I missed in my previous reply. I reproduced the
warning on the unmodified kernel at commit:

        93f51579e7df248780214094418f205253383cc5

Exact kernel version:

        7.3.0-rc4-g93f51579e7df #1

I ran it under QEMU TCG using the configuration supplied by syzbot.
Both the unmodified C reproducer and the original syz reproducer
reported the same lockdep cycle.

Thanks,
Krystian
