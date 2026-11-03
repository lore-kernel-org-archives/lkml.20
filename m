Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740271;
	b=TzCoCHMUD3gnSNInl3MqHYHI53Ai65Q7V4OBz5FHKn2jXUzQIHLmu07HE9fbI7mtgL08
	 iiitLRtlsqiLkU7ZSnjqvRANrgPSJIgdbylWjch+Rncs5HEHQ0S6+7X48J8Fj8TUuwgGh
	 coUeJApJaeayWqEs7oyZJrFp/mqaYv0LCPUnHN3OXWMtSU1C/m50nYGFo4PzfS0bGJbsD
	 IhYNzkGjFcJ9ZxuwWMy+BJJ23Ln68JkNSRr6G4S9y9w6yecKF7wXk9j1X6P0g2RXis8RM
	 twXgnV0oi5235W4ti86nz62uqZbKMMXDV4I77uV5KUxRDzVQ03LlE+GPtCeyhM7z0fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=Gwb0yhNA8ovJvghC21bfjrqEFSJ/3LvirO9QqnwCwDw=;
	b=cpkYWLQtl6DQj0lO2kdD24Ye2mQaRpchxJER9hLSxuJgurzaoM4m6AgxszeF9UTXavwu
	 zRAL3Zb3c/HtASJi8A5oS6S8Z9DfoljPXcc495VY0N9RZn8cV7iz1NBz3HYCzjD9NC0pZ
	 HKru3ojfvMszzRN7yG0XjAZZ1L9/vy/MfRhOC1VYCLzcHV6ZkIYndkL1FQ7fDKqPsb12Q
	 nZytc2pAbEbeIYHJ/34LL7VB16Zl4vK2S/F5nsuILcfSvPbRkNjV/GSBjYhf3Nu4k6IkP
	 psWxdEnnG/0UXFxP8Q6IQWYnMNV2HcSMd9gDkY7OffOcLRPZKHZbZSIAEpT+tyN0DDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhZ1BGol;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CAB606D80C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9CAB606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhZ1BGol
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso614976a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793740265; x=1794345065; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gwb0yhNA8ovJvghC21bfjrqEFSJ/3LvirO9QqnwCwDw=;
        b=UhZ1BGolaieZt0ciUt1eNUSO1jnqrZLezwPTtss4f70Tsc5fUSV8VOEhI9jMVcYZO5
         iJb/lR6lPJIQehJBdRf4dB1F9HIwHEXwOEMmB8hwjYB0Bew1QHtbGXYu1zTRI3gNE/1J
         dsRudaBjgrqKBYhHsOlTvPuF+UELoPGlrMsEq9vzHBeld+ORdxtbF/Tg8ysHXe7yakJ/
         Ks2rt8FXRQCx6gVAzFE/fUZBzmTdTbRkztGG9aejbQTx6aCWUGkj6pI+DYsdlcwGunMd
         mvN/lJ03hbePC95887nHA9wPdslFAkXrrnqBVPsibCSgVNESlLENiTbH/su5cwlaVLP0
         CA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740265; x=1794345065;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gwb0yhNA8ovJvghC21bfjrqEFSJ/3LvirO9QqnwCwDw=;
        b=q9p1z7J8EJxt08WI6v4RyygcBGl7cXhhHiOz1nr0J1pTNS/M1eKFZ2Jf9Pt6LuSfiB
         fmzkMOtZrytPIQor46vaXTOZSYKW8xirEo1qH2HSrvay8i7n7ZOAGW7VX3xwjUR1kwGC
         SsCP2zWtFIJ1nmxwtzZl3DQjPWUFHlT2qzAtnuUFc1a7s4WelbZIzA4idlij/AUVb+TO
         IdC/DIWtps8h+xVpb1BjFcvyc6A/jsamKbIxWan7C739QlmLNj9d8UVq4Ap05f4Nssl7
         f3hrdH92CvA8GgPObPoMnbP3oeD6r6UAqpqd63yD7/sQ5nzN6rFqyWojKY77CLnoEBwt
         xw5g==
X-Forwarded-Encrypted: i=1; AKwUvBz5kDXp1uxVCr8BORAJ1eiEW3ic2WTHxb5U2vbzrkEXOvkA2OqRVjfLmDQ8qY06ws2Y5u9wrym7ZspxtD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pM7QDSqQuULNsnkNuCuB+HrIymuHSUWDOFs9NJe8sbEqAGXwW
	/T/DqgDBZwr4bCwjAqlb6bBKizuDcyDopHQE5H8ucHm95FvR+Noq12wN
X-Gm-Gg: AYBFou35ycSq5uSoBJ5Vd4/xsagzJ0tWnHZnSRHrTJIqojNIHFd3ZXHxw/RF6nMuXJ+
	plW+j6WOvvCNI6RjQGWkY+praP06qgIawfaava8/M7lDWvkt8Pj76oDn4is946KHiHLFRy6kjM0
	5E0VWqVCUEHjVWnJCobTXynclVZA+cv0w1aJYRymSymT5PtARrf+QxmIwjOB2ePxFEtJp5Mxnfa
	RPp7tHQGYE3NGliBGIDXybHZVRUhw/HzKtngA03x7gzAz8XwpcjycbSzdvSZsAoHpK9dz5EIUkr
	9P0+6IfRjM3SI6zqWWbF1ZRbrem2r4xBzTwKppOPmRN9vcvg0Gb+2tIzG8fsFPY0n+O6XbGLU4D
	T8y+dTOg5+FGkGrcHJKeweUj/kp4r4sV/SGZVUxVDIBbVJYec40IsG1C8PWEvYFn+vrrGe48sSH
	ZMHbJvvBj9Jh/v9XhjjbvLhsZFfwsxmZOMVph8RSxjOWekh+LmjJ7+JNwHHLMc73oXlYwRCIHX2
	gbmRrLazHyQLH+INCSasiRskJHO+Qc6MmKzKBfT7cNj3KORLdQybDTQOxVtWAgOuEG1x585OB8n
	/UdPXMvpv2BD2x4vVnHQWE5HV9ReCLlgxKi0WLN5uWFJmzg94HC6OnUY5FZM3n1OunETnj3slmX
	vR7tmJp8Di7UTmZMtTKgnzwcODhiAtinSzw==
X-Received: by 2002:a17:90b:5624:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3ae89758b67mr7781961a91.27.1793740264860;
        Tue, 03 Nov 2026 13:11:04 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944ee6easm336849a91.2.2026.11.03.13.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 13:11:04 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 21:11:03 +0000
Message-Id: <DMLVUTB5J1RJ.2QKOUW6UB04ZM@gmail.com>
Cc: "Johannes Weiner" <hannes@cmpxchg.org>, "Michal Hocko"
 <mhocko@kernel.org>, "Roman Gushchin" <roman.gushchin@linux.dev>, "Shakeel
 Butt" <shakeel.butt@linux.dev>, "Muchun Song" <muchun.song@linux.dev>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Hao Li" <hao.li@linux.dev>, "Christoph Lameter"
 <cl@gentwo.org>, "David Rientjes" <rientjes@google.com>, "Sebastian Andrzej
 Siewior" <bigeasy@linutronix.de>, "Clark Williams" <clrkwllms@kernel.org>,
 "Steven Rostedt" <rostedt@goodmis.org>, <kernel-team@meta.com>,
 <cgroups@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-rt-devel@lists.linux.dev>, "Sashiko"
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH for-next-fixes v2 4/5] mm/slab: fix a deadlock in
 memcg_alloc_abort_single()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Harry Yoo" <harry@kernel.org>
In-Reply-To: <auo5G__ac1qA9JRs@thinkstation>
References: <20261103-kmalloc-nolock-fixes-v2-0-19167cfe4779@kernel.org> <20261103-kmalloc-nolock-fixes-v2-4-19167cfe4779@kernel.org> <DMLSN9VHK0P3.2A97046A4YXGY@gmail.com> <auo5G__ac1qA9JRs@thinkstation>
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

On Tue, Nov 03, 2026 at 12:21 PM Harry Yoo <harry@kernel.org> wrote:
> While this is technically true, this relies too much on the current
> implementation details and makes the code hard to follow.

Fair enough. I don't insist.

> Patch 2 is an independent bugfix as-is already. We should really stop
> open-coding slab_free_hook(). That ended up missing init_on_free handing.

Right. No objection to patch 2.
With patches 2 and 3 the !allow_spin side of memcg_alloc_abort_single()
is an open coded kfree_nolock():

  kfree_nolock()                    memcg_alloc_abort_single(!allow_spin)
  --------------------------------  -------------------------------------
  memcg_slab_free_hook()            -
  alloc_tagging_slab_free_hook()    alloc_tagging_slab_free_hook()
  slab_free_hook(!allow_spin)       slab_free_hook(!allow_spin)
  free_to_pcs()                     -
  defer_free()                      defer_free()

I don't insist on kfree_nolock() there,
but can we try free_to_pcs() before defer_free() ?
Like:

	if (likely(allow_spin))
		__slab_free(s, slab, object, object, 1, _RET_IP_);
	else if (!can_free_to_pcs(slab) || !free_to_pcs(s, object, false))
		defer_free(s, object);
