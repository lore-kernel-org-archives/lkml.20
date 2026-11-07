Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022803;
	b=XZu6qu1v3rr1sB1ohgsSnnk1tcDXqIXR3J/V5zPUXH7/L+d7lVBy076mx9ji4a/8QTt6
	 01iC2+tjoLZOGMpwVszTcuT1aiq+B1aUw6tVSQJdsVA3DfsdCuFhnsS2jNjV2YjWHmm/q
	 mvS1O78m/XMd9a2rMgA81A1UgTH9O7wmJrFfIhqzlcL8XzFkVrQeLPSu6Mtuv5Weo9bg/
	 DeNRuHpH3E0EZa7G/+EAgXe6UKOREAoq6TYZV3auOQPhSirBfsh7aX8OHJvXF+JZemiEN
	 n5T77iHniEEC77KnXBS6XhLWwJyrdIuzOYsWo2qjwRhzUsDA7rtUVtJwTVItvBh55/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=VPnUZ7qlBEFpSnw3H5bmV/UOx3qvhdehIphPx+gyBp8=;
	b=qV5aja8/deo4C3YZdn1X0Y1T2Q8VLxKZITOmu+Nk48W0msL6Y/p8DEqjurLBl+2MQxVn
	 3xjYEPT6EZe4AfkZ6Bo/H4H/kfjLBOO/FaelzJ//mR4OYabH7CnCzQPrznrVwZxlVZVxG
	 zEmEf+46cjoHflLHAUDWUHBkQwIBcAQzTAYLUXHDUR7igcej0/slyM0T4RHIr8RRGlg7N
	 W+dpf5G49YaQ2AUiGoyLcMdnQ1YmSpAVWPJe2KxBF6qxEMrKFCfOWpiTnGcOZu/ed3JUa
	 pZ4HcFOkbHksY+MVa4fuwngVBMgifFfPly6luh+f2f5XVD/cALbhcZRtQ7KmK4HmwMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgLLY2Gw;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C77606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 03:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C77606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgLLY2Gw
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1086177a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 19:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794022802; x=1794627602; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VPnUZ7qlBEFpSnw3H5bmV/UOx3qvhdehIphPx+gyBp8=;
        b=QgLLY2GwgKWxxhwk2j8gz0t9XiYYolwI818sydy++4d+qwyu83Z0oGlHtgJ6UOR0zS
         tz2I/ty917pQhiGxEayni/M97SLRTlITEniWOTSjvv+vv8STDgAE3T4kbQBMfOWrRt3l
         brlgrKdW73wa+amm4U745l2zhlWlB+k6bKxaENBMcljOigSWYupJif2K1YCxbUd3/xx/
         RAJMRqEcighJmiPu4XcaigKAGWFbZ8j+ovYC7WlrdSze3YPVv/Yet5jF32ATfouCUNxD
         FXl0BT9cXyudm+ZMCXBcGsqVRkCa/sM9Umj6s4hP7Yo/G5rxRaH/VIqDg9KZzRtdzxRb
         QFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794022802; x=1794627602;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VPnUZ7qlBEFpSnw3H5bmV/UOx3qvhdehIphPx+gyBp8=;
        b=Zcyq1skP20lpQRVhDejZOOsP9Uc5vtDnDyfc8Ekjs+phKx4Es/S6MyE7tt45ojglKy
         tFRUk4xY29wT8NP7dWqnJ1FUjdQoFuug63YdXoyuuY9pVs5ye9lmRk/10zdb+cIY50/3
         /jqfRcHfz4map/C34tgDfUeRTeg16HuH/fVwGoybQ5qmEcKQk/sL1RQxUF0mwcvoidzg
         42cTDq9+r+u0KP7Y/sDbWR+IqFXh7O/bfB91fmlouXD51aRpEjPn6gC4x6sQkBwAba1x
         lLDgPkbydHakvl7rAfyfgBkb4XVgseIA9otPsWEOHEHZMD+1tBmeS0uxT3uYNK29GD4u
         dx+g==
X-Forwarded-Encrypted: i=1; AL+hErG19+4TpQGatZpW/08j4czn2Q9qpq0f8CnL+VRXFSsmW2hEpgFGl719NaqXP8ANZVJYdakiivq1UN+ufJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2fyv1E96C6dGMvw2v3+AMHSJa/YnFGGAsadV15jRoaQSpvtaS
	Pza3MtqLYUwUAAoGhvcfLPqjFGisPTkqZ1/zw3hhVZqQ0102Eh4WXfx+
X-Gm-Gg: AYBFou1SD+qJC4NfPAUksCCPY1HtaCQCPlNfqrH01ZLFxat9ACX41rqYAFdXQXpnXH9
	PEeEPLdH3lUc+86WyUEelLgeW0k4DiEDoNuzRzctmyu+qh1QGlDa6dakmBSseVkqQHO9YjnGKsg
	rs7iO67gMDMGYo0kkIHlC31lpSMyKLMl05D84Ycl4VEP2fgbY+DAaLAVm0SpE1wYRV83qDESIFe
	bQmJD6dLZV8sWRhx7VLMdm8l4U7yH3B7QlL+YioGFvQa5VDuihJJ8bORUrrUJTI2U1ySc8dpv9L
	17sU+1ox2IJY9Se/bm5cnLB37/uY2xfdqCG+BJ5ka+sSOyYAWIlmC/RlYKs2sM0dPkpNYa0vN1d
	H2SVnMiRbf7tfZdrgcfg8zBf/6fGKtd+yPsS93vI+uZ11R5VG0c70BU0YBYicd4mjHxdQTjD6uS
	EVa0X0dxBcCR+Wveio5aBsv9JjbFgI39EZdNMU9Ft2NmQ335omJ4kS5fTQHAjnpfPFbi273tAWg
	ZozOpLNZuXgxZzyPfMs46fh8crNLkuEYQuMaYiOfyE5wRZ20Hgt57y0hnc+LRPCJ731tsLVJp97
	jvZOPqnrSTNRP3zyWUHUfMWJ1c3EZx2pHELxA+B7tx9T0mm/pEv0D8tNA1kkGK/y5zGm+onK6jI
	QlXVvKDDAOdvwz7dYZUjOnz5AczF1LchxPSoE
X-Received: by 2002:a17:90b:2801:b0:3a8:5cab:1009 with SMTP id 98e67ed59e1d1-3b0db6e4fd4mr4134730a91.46.1794022802260;
        Fri, 06 Nov 2026 19:40:02 -0800 (PST)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10583f3f2sm1368968a91.13.2026.11.06.19.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 19:40:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Nov 2026 03:40:01 +0000
Message-Id: <DMOO099NDMIT.3A6PF31D90IZ2@gmail.com>
Cc: "Amery Hung" <ameryhung@gmail.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Nicholas Carlini" <npc@anthropic.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@meta.com>
Subject: Re: [PATCH bpf v1 0/4] bpf: Scope callback arguments to their frame
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261106231157.2840635-1-ihor.solodrai@linux.dev>
 <2785198b-ca41-4cee-9dba-bc0c1e6e8f25@linux.dev>
In-Reply-To: <2785198b-ca41-4cee-9dba-bc0c1e6e8f25@linux.dev>

On Fri Nov 6, 2026 at 11:32 PM UTC, Ihor Solodrai wrote:
> On 11/6/26 4:11 PM, Ihor Solodrai wrote:
>> [...]
>>=20
>> Ihor Solodrai (4):
>>   bpf: Scope the bpf_user_ringbuf_drain() dynptr to its callback frame
>>   selftests/bpf: Cover the user ringbuf callback dynptr lifetime
>>   bpf: Scope the bpf_for_each_map_elem() array key to the callback frame
>>   selftests/bpf: Cover callback-frame map key lifetime
>
> Alexei, if this lands first, your pending verifier rewrite will need a
> hunk like the one pasted below. Or the other way around.

Thanks for headsup! I'm struggling to decide whether this is bpf or bpf-nex=
t.
The fixes look good.
