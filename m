Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794704197;
	b=2ETGuAX6+xoB9bhCk48Js8GhZcp4wm356rmB17kAhYMBsdl5f1zrdlpS+sIdKUcIYWiJ
	 gshZfaRtwlVm+S0bUtih6ua/C9zJgt3Oev0dyF0j8yaacVh8+Y8UsO1oLQbbS4stPpgxV
	 ymwZXAUd3nyqvHUzv076oNIjKJCgnZ66mgtPEFBcmBxYAGaITXZUYF/T/lqTqreZTeEWR
	 2d02W6HjRmeZzpgQW4qLg3XE0GTIg+tqKAYdgPx5yPcJbwdPdpHQw2Ej2F7L7UUiAdEiZ
	 jJP2oKh+ombKAZfEy7bmAAQpMOtG8jcmgc9coDoLu5TeTJM/dzIstFM9URMxIUUm4DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794704197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=629gBa24uYFM1oVxvCXDTyLH0hlRq9NoqVbfdidJ5wE=;
	b=39RNVk4zX4Tw/hqRy2W98emfqXAvgUb9aZvlqm8dWK8wd0OmItSHnSWttXR4K3eJss9N
	 +9xGTub59VnovRALvkyztT2Dz8rZneznviD5nr5swndMyY6ff6GZ3BAAloEx+qmnouv+d
	 +6hnXZOvuHnVilYQkHoENe2XJ48EAvDwYqGoxnk9do+hU0eQM7+c21qPUmr7kLtLvn40f
	 1J47Q3E+VGbmCK/aDsRtdApIKvwei1AzpdaWx5gMDIYruS8APqwzSgP+3QKzOajL/VbwQ
	 YTs0nzGCF+95zAaszAsMExtldjTFoMnY6pCowfptioOP1AbYd7Pi9N28Hhrhc55NRQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=PzZJc4zK;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C982606A330
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C982606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=PzZJc4zK
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so3523951a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794704194; x=1795308994; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=629gBa24uYFM1oVxvCXDTyLH0hlRq9NoqVbfdidJ5wE=;
        b=PzZJc4zK9PakSreCo2Y4fAH99TH+FXKyjxEWsF8WkVqHhM4qh9HC8RS9/lOwdzYq0X
         T1TuqE+QYVqkjUaA2Txw05JaPVfv0XNsCz1pMOABGEjXV0TmJiGdFN27BKPuNe8Bcsuh
         i8ip0GY8Z7Ts9rvjbW358xlmXexxjTLUtlroI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704194; x=1795308994;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=629gBa24uYFM1oVxvCXDTyLH0hlRq9NoqVbfdidJ5wE=;
        b=esTvucqLTPt1E3M7/oBNqyqkue8dLBmOpgya1kc3GsnFflQ9U4s3IYbxSYJ9DCNv3t
         XNBlNRzBjWkSSnFNefSdtZ1GzSfZ65zOKUV7Xw7S+SJ5lUCCzZ4r5gr7lNGxin5grkZE
         SN5+MSZ/pMdbTWUF+LbF+7IbboxZ0ls3sXKocKoSTqbeyhSbNMzsTaxajGl6/C8u4LXs
         oCYTAPL8Hf8nzUzFsPw8TFoHbXUiohe7vgL1luONQxLW0XKedo3aXkiyYOdfYxbY8oRx
         1g+PGzOGUCvmsEM0/DsE16gDohIc3G83OSCo7qfan7nwpINaKG/XplB+BQsHTgGZivbb
         Zmvw==
X-Forwarded-Encrypted: i=1; AL+hErEU0PU3ljhFQaCL1YjrrC5gKaMAO1Xiv0mBRw7ebIzDAK9YykVMAowt5cZeiiBQmHzvyI1s0h+KhuaLIkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+88/MmsThOueMhumBeS2rDnahNLp5kucnozozVQGly0WO0Vq1
	C1Y4vWIFSW1JeuSc6pkZdGc35Bz0c0vlSePSq+cjrI9HUq9ynSJTbFNWuD1M9cPcXVgLC8CJ6Lh
	vZg7Vs8qftg==
X-Gm-Gg: AYBFou1vKGx1FOzr2MV+d9L8zL0RArxjw7dp3b7Vw7jIwu7OG1PyROCD0Lf24+hjGXo
	mcTuGz81huOv3CgxJxPT1zz5HkWrcTtaBbv/QHJy/0YebZyrzaWDRszm1NW08Tfp7P4dL9TeRBz
	MSFQV1SsLkt3iLLq8yIu/4EJVZBR9saCeIGYObZSxDq7p+WxfrSdPQaDAxhe0fTvB89cW0ceckE
	x7CfS8xpW0/4cHiyUfgufEADa+RzBbwjUMJzIz8V+GwP2Hw6Djx6LBs9ZnX1Caf3ihUtU3y9Bzt
	2G6eayKNX6ZGJJ5M4BHbyCD2mWABaPXpq6r7+b9cOfA1AN9RDFGKvOfpOzisDs7QCdV56y/BQG0
	sgdS4tSJ+0Xjhpgve5+/bP24/Dc29hTKduU05bb7XogYCBFr2wMn6mEpJtE36iyIoK3uXV2XwHc
	h768g6OnXSsVccBJGcAt1Y4ov25tU0EN4T1AigvdO6D55hnUv5aOhYudv21CxOzWO8KmhH0ViCC
	wmHBGZafdkZR/FPHVQVKBZexbJJcH3lh6ds0+3b65QDCvPvXc3FPsL8VQ0o2mWDnv1WBQrndlBJ
	Z/WJtCcX2ghP8N0QSHB9rUihJdmAJ7rfFqozCk7Z97I+sPpJH/5Ps1Ym6E4FBRSYXDSl4nQbZfH
	/4MQ=
X-Received: by 2002:a17:907:9612:b0:c29:f5d8:9c75 with SMTP id a640c23a62f3a-c50963fe3dcmr574509566b.36.1794704194608;
        Sat, 14 Nov 2026 16:56:34 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b72868sm257324166b.65.2026.11.14.16.56.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:56:33 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so385694766b.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:56:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGTswcJOwhXgkXXbkt1aMlllzMoB9/AtPhw8NyD8eoZxTlyP5NqGPNECmCJz0tgXEtY2E39WjfjwvzehJg=@vger.kernel.org
X-Received: by 2002:a17:907:86a6:b0:c4d:4be1:4197 with SMTP id
 a640c23a62f3a-c5096410ca0mr587213566b.41.1794704193440; Sat, 14 Nov 2026
 16:56:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local>
 <20261113141137.1113517-1-usama.arif@linux.dev> <20261113160300.3f0d0a37@pumpkin>
 <CAHk-=wjmnpCmhyOta1EBR6D8_JFgLNz7Jb2s_PgbPq6cBiQ0wg@mail.gmail.com>
 <E9C129F6-61F5-49CE-8948-064DAE86EF4F@zytor.com> <20261113233703.GCavefHwxVZX8mGFCm@fat_crate.local>
 <628BDCC5-B599-4B70-B512-E13DEE926DFA@zytor.com> <20261114224504.7574f7f0@pumpkin>
In-Reply-To: <20261114224504.7574f7f0@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Nov 2026 16:56:16 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj0MtJpBbwNr=NGh4kFPM__Wf9Hq+LZ1Qv1Yv1SCpjaLQ@mail.gmail.com>
X-Gm-Features: AclHuK_S7A9qxuV0nIVBvLAohnCki6K7LZKgxEK1nLHiWCvuDpnnQxUN9Rwr6s0
Message-ID: <CAHk-=wj0MtJpBbwNr=NGh4kFPM__Wf9Hq+LZ1Qv1Yv1SCpjaLQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on ERMS
 CPUs without FSRM
To: David Laight <david.laight.linux@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Usama Arif <usama.arif@linux.dev>, 
	dave.hansen@linux.intel.com, dsterba@suse.com, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org, 
	kas@kernel.org, hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Nov 2026 at 14:45, David Laight <david.laight.linux@gmail.com> wrote:
>
> Otherwise you'll need to spill to stack for even a simple byte copy loop.

I think the optimization should be for the inline case.

Once you do a call, having a couple of push/pop instructions in the
target is a complete no-op.

But having extra registers free could help at the call-site, and if
the 'rep movs' is inlined you only modify rcx/rsi/rdi. I think the
calling convention should mirror that.

             Linus
