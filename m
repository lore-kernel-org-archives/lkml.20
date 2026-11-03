Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729688;
	b=ww+RV1bKdJj6KG+YrBd559D2DJG0RyFFbhtWyHbupZwRocR5TeSkw/XFCAVOqkRGjO52
	 gXImAb3aAlkK/9SChnTcjKHE3piMtTt8etCGhVmNT7a6Zlom+YWGz2FzZv01aL1edwxwG
	 zHatRwH/92yvBNkc0YDwcLsaWf8BTSjDyx6RZVXuVlz2fm/RW8Bus8nvT10JaPj7A0zXb
	 zusTQME8PMoJifh82jAE7+nLjG3rjMwkgRKZFlEvy5bzLwBIP+D90dKOZDYSoaOb/Y0s2
	 g3a+tMo73KmRfm6HKwbl5sYlwqhQMAC3xJRDKKRn8wXYx9NtXjnbRn5Pb2ADpaZVnBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=UhwuzspS0Yyijji1M7E/UqphlI1Fhl8GUBAG8CiVACA=;
	b=NlaZBNdTaPMSRx7c77C7K4yliIJbCyJNJDoCYGbDKgQwaj3ErLsC4q/nBzyuP5WgOSrf
	 ICHnUEm0IuL2fTS3n85DMIOA3VfRXgKBJWmyXn5KRFgaKYZ5LmRWqRSMwZcQqq+b4n3bb
	 F9DrNNuUsL2Z76w5UO9V2ygm6QyttxybOsYo3kVVzDQaVRMV4xEMKpqC6UkgFprr2VbMB
	 fGijzJaFDfn1tDqA0o8j+Q64y6HJ6amPPiC48XLr1fcHizD6YSIgZDRgZO4KTyBjSMGbu
	 keHymAWrG+47+DlnYe+r984pmK8eOTlplu/ZIAzYeSzyk/KoV0xMXWEEpkLwF6Fa/ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+pqAzLG;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9083606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9083606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+pqAzLG
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9f6a16aedso27465135ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729687; x=1794334487; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UhwuzspS0Yyijji1M7E/UqphlI1Fhl8GUBAG8CiVACA=;
        b=T+pqAzLGRhfho17ISJiPBzo9Vm0WZ0VOpbCIz9fTLNtU22DlVClTI0m1qSFgsFBaKZ
         J4ntsKG8WJlXizSAk6CCiW8IcIb92j3Mf2fvkqcYsvgAbqZ8U9KrLd2i27w69Y7txFaz
         KZIqpxClXaHhL2CbaRX+LgfJKj7NitexpFfUoZX0qw0k8o8DRN5Rbx08fxkEMTVaQH8y
         ymz8US3QILzm0heLLvQFx8h6oNhQS5UHmg72pYDxJKGHpqE1PoSS3MFmWLHJRTk7bhQY
         V2NfnfeGSBAMDSFfPwviDqkxVFV5nieJftargTrRoH5Jfa9Jb30hnZokwDWqv0fnqwGU
         i5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729687; x=1794334487;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhwuzspS0Yyijji1M7E/UqphlI1Fhl8GUBAG8CiVACA=;
        b=ZbxdZ68HxwfmBVqxxF7aENmv0vFxP9eYkGPOdniR7UQu+fBZNpKrQLbqwDZ48PHAdj
         +BtQg1yspUTLA+tOI1PYsDPl3D9SUNQFeEVjJHUP8pdnL5miCTfa1t1ZCQ2dPLdo3aSl
         wPFhw3XRyiCgbAK5qCQ9PTmX3r7TCtjtA0SJosHe35SFzsQdbiVSnVqnAbEUwaJj6UHc
         NESo8SXly4ppi3DOUbnq80mRVDZ/0CaOhR91t0SUNmaIg4T0mrDDNZ3jex06IuK+NOFf
         /QOwxv/ujYLffQyMTaA4syiK62YwSFV3JigXQpmok0wYFo0fvSiO8uI/YxHfZUK5u7lb
         nbDw==
X-Forwarded-Encrypted: i=1; AKwUvBwfN6em2waLDPjdUFz+xA+J2GdRn4rFuOPgGvBeNIYYNYfScqomtG5GZNARYfPT2G4aE5Fs6SNrZgyz7HA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ww6SQpttFHn3t2QntG/B10nx/Pb1dJ0gapodkF0ZrElTwr8uf
	WmusSL/JuCkIAZUW/Xavl67qpb8gBdK5kx+SVxi81xQn+SFhYjABoEfy
X-Gm-Gg: AYBFou0zsQBVzQ+R1IqPfQi3Y6mmhOs4g5Rc5pUDzWdTR9DN8WmTCz/WHjhrq9SFesV
	7o26zBTaH42fCQmEICuhwMBEK1uN8+ilgvf4XCiCwbONLAe9tVkdm9tvSJPvN3duFzMEJTwordG
	42IGdaXN5b7tFsCS3XMQeRc7BREpqqohZhNtXa+PxF83IXIX4FhXbrzZKWTgCER+MonCnmNxXs0
	itYqeZvNEtOQwyCviaZjNl1ek/J3JsZGC8z4ZoU9Csic7OGCLQZJPGYToSjKU8dTSZdOxmiM3SE
	ggNu99Dqd18VvLxyCnJ1i+5pjCvwb5ZNGyqEjoSzrYbEfIqk9G5biv6v6OgF65NLnFVotmI8qF+
	YRfTZ+rREFQBCo9Lev4Z5s3IvrxAzVR5sBG/TaCYg9BD9Q3r7Urzs7mMu8C9FeSLHjVemS836ov
	5Z1Fcbi2AkKePK0W7dG8WhJovzsf6qgNjKnIOxPMp9UQYPEZ+H2I2EedbiBeIyAmUqFreXVuyX2
	7xfywWB2zapFPYtvmejFuX5lp/WBcz1g2kWtrrorOiyCWKeFysCxp0YNZjZ9B4uJcMKKYbaAO5x
	TRQwGHboUetnZerlDh4VwywRZjCZXcMfAWXJ3AFAyfQ2vRrSzmmfc6tH1drycq5WVLIe+VTySca
	v2vZ3kvcR7oaOGvlxWOH5izf3P1KG7AvPMA==
X-Received: by 2002:a17:903:1cc:b0:2e9:a166:f7fe with SMTP id d9443c01a7336-2eb364961bdmr141273635ad.62.1793729686970;
        Tue, 03 Nov 2026 10:14:46 -0800 (PST)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392a5f48sm43693435ad.64.2026.11.03.10.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 10:14:46 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 18:14:45 +0000
Message-Id: <DMLS3TW3RYF3.230ZHPCINZ0N6@gmail.com>
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next 0/2] selftests/bpf: port test_ftrace.sh into
 test_progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <DMLGLCFQW48J.334XR00MX6V0T@bootlin.com>
References: <20261030-ftrace_in_test_progs-v1-0-aa50c5dd1ccc@bootlin.com> <DMJE6776F9F0.1O5A9ZMKWYEUP@gmail.com> <DMLGLCFQW48J.334XR00MX6V0T@bootlin.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 03, 2026 at 01:13 AM Alexis Lothoré <alexis.lothore@bootlin.com> wrote:
> I initially went with a ftrace instance, but I came back to global
> ftrace because graph function filters (set_graph_function,
> set_graph_notrace) are not handled at instance level, only at global
> level. But maybe setting only set_ftrace_filter and set_ftrace_notrace
> is enough for this test ? That would indeed simplify a lot the setup.

Yes. set_ftrace_filter alone is enough.
The test needs function_graph and a trampoline on the same function.
set_ftrace_filter of the instance does that.

>>   all functions are patched       only the filtered functions
>
> Are all functions really patched with the current series ? It is still
> applying filters.

Yes. All but the ones in set_ftrace_notrace.
Only set_ftrace_filter and set_ftrace_notrace decide what is patched,
and set_ftrace_filter is empty in the series.
set_graph_function is a run time check. Every patched function calls
into fgraph. Then graph_entry() -> ftrace_graph_addr() drops the ones
that are not below bpf_prog_test*.
enabled_functions shows what is patched.
