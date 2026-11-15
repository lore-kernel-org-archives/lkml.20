Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794714478;
	b=qDqk+hrtMYivJtlgHZE6iS73MfyF9V1944Qsi7SzlHZ3xLhYsrFJ5aRf8OpxylNwn5Fg
	 5HivIeEyuQ+ZQ0UG0B44xRwoXpOUYwS6r9OlQgzuKOHh4MVKjwjfOCUumEluDSati+dAD
	 u0uhmIvzL2h+6vVnox0SwoopKSb4THC0CP1ZaObsbab4zyXzaMO8hvnsqy461IXJESaDf
	 hRCm3ERE11dlL4ScRFZcf1ZFXvDy75TTIwHIn78kWKHHE8IvBvjXxm5/XlOvWMu75TQ2l
	 q98t8H5TI3Tq1O6I7poTvJLSG0KhIsu2ShtR4LFljAyzzqkVfnY/vFBDU0hcIQFjnOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794714478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=LjmFqyVwuBvTU6cvsaTkZ3oz9EU+ZEVRCv7g4CuSLzE=;
	b=DKct/cQa3zOD3ltoOSkqoVOzFIdOFuKJvFx61Znl5wQdTzzqdLJBDKV5JU73uofvRxYW
	 ygm6boWiNdtD8qUjg2/72zKRb00DNAI+dSSxUDghgOnt1v2EhJemxV/XpTXY6xaEQ+pxG
	 UeVlGZW+jZOZDIQVlsMX0KHXghEbUQU0vC1LudVP4538zGQTRZOmi4bKWRGtxtw5uXk7+
	 oDx7j7RyNayPwVste+++ft1hu5F8tpMeVawyWdZF0kVQEOrHd57REcPW91SFaL7WmNCF2
	 35F8Ql75B8VW/KZNquR5gYRPKoeR6O64AyO56MNiG8d9nfza6hSvvbTfrnnv9rBDrUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bgVNgG1C;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17463606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17463606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bgVNgG1C
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37198ed3727so3828070eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794714477; x=1795319277; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LjmFqyVwuBvTU6cvsaTkZ3oz9EU+ZEVRCv7g4CuSLzE=;
        b=bgVNgG1C6rEiA2UQNHoL5Gj/SiX2TxSTbtiLXx/Q/+sOZONE2Zp5iwCs8HXLIpZ0Ih
         W0AagTMkdB91z5RaXhz+yDrPd7XPmtx3xE1QUsl0KVZNBHb1DmRdxzqinXPvDSpGHVe/
         kR4gHm+jS8YEnw7iRWsouWh2te9N4b3sefH7wA2cRuapkltSCgKlgOTQoomLTGMKa9og
         Y51wCnWPFFapRpzwQAh5yPIUUfEyw4VRAFFIJ+QZP+WljqLWHMgt1Sske+OQfzcVHvj5
         6vdBcd/B/vIFyFakB6dfbAcbWXM1VpLck7NjLqTk1rxuCMjsvDOi2KkxXNWWeaU53EBJ
         XnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794714477; x=1795319277;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjmFqyVwuBvTU6cvsaTkZ3oz9EU+ZEVRCv7g4CuSLzE=;
        b=zWif6zh8ByY/isfJ2OVXhMyMd6nBOs4C+iFoZGl9OiZ8QfJnIfyMh0z74cAQX67vD8
         7shHVAFkFUAGkY0oNAvA2BNOx6CvAeJQ0sT7rxLxTd2OMQAFmHYGa1By1kfshc/3T6X9
         M5PQrR30YWjA0FIVvrV0iQJW33M77yR9KWxHfg8MDs3X2QKFEiVAA2mdEQL1XsT/RF5J
         i4nLYb8gKkNiMZDjuoI98TKi3Hlq3Q8eO+Dc+I8CGBNx9czZ/hwW49FytCPMIbLu0GTr
         288rFsx6ERuoykXLprkxNakPlvtQJrRZG+KTGxGXc35kMKw/gaAgxSA58t0wqEclbMs6
         puNw==
X-Forwarded-Encrypted: i=1; AL+hErHGdmF7dmf5+g8By92TM/qHhfOSzGvWG3i+yMy6FvMGIyx2bSM69JFe8aAF+YPHUsDY9/XnZ8ImVzKNujQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/1LtAVnsWApTUoAiaOmWHUYQisDz3zQmdwGFrFSJs+k1AWznA
	2GTr5qF982CgY/TPgbFVi8sZtTv7SJOPZbgWSOQMcTU91gFIikuGV2kE
X-Gm-Gg: AYBFou0yqFR32k+iDwKbIejWxglth2z9Rp1ruyWOSuSLMM7u/qjLNdAQPVTOsDYTzyo
	4wEYOTWauRBoNvYQHPQWKQ2LkDSg8Lgz1qxRFj9rHzRdOyrmk1KfwAi7ts7RmyJOy/r7oo4iBta
	eF8rsWrJpqeIXljKgZmf3NPm5esUUZp9n+7DEqJbYnyMF7dtrHCgeVq3BK5XxrIVJULO23YXxoG
	umJ8yEEaHJRiSJH7srduSGVJN3IhsTPm1Zg6Aib8vt6KHRz33bxWEym/hNRZpw5iANKyFD3TjOi
	fz3/V+wzOqsivQEY8L0fXQ7XV4tcn646ZKRFnVCpr22ju/dx6v3TNqcczZCAZ2WCVmAwkslVnl8
	Vt0AuqMQXITRUxGDZIjRAzBSZ0G4a+hS7P5BgdCHpWbkSn+jU/ytC/RQCaUenRcK6zzQNdfCoAI
	4/6yl3y0UVrQbv1wuv7XSZNFMH3W+/UTMDyGCYFaxvQzfuIQ99DUmFTbVzBaNxAxFbMuXQe40G0
	PF11CzyrAL7maeqlfRV0ZqQ8smVcLtOr7sbRzuP79hEpHJ5MmbF9+AoACZruYJkAfkueQsp3y0s
	1BGD24QZLZzwBwpJeLJvN85Krxo=
X-Received: by 2002:a05:7022:1407:b0:1a7:4c5f:57e9 with SMTP id a92af1059eb24-1b4f5f92e6bmr9170170c88.27.1794714477032;
        Sat, 14 Nov 2026 19:47:57 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm19896393c88.12.2026.11.14.19.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 19:47:56 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Gaurav Yadav <yadavgaurav386@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Gaurav Yadav <yadavgaurav386@gmail.com>
Subject: Re: [PATCH] KVM: PPC: BookE: Use vcpu_err() instead of printk() in kvmppc_dump_vcpu()
In-Reply-To: <20260807084050.25216-1-yadavgaurav386@gmail.com>
Date: Sun, 15 Nov 2026 09:12:47 +0530
Message-ID: <a4na92vc.ritesh.list@gmail.com>
References: <20260807084050.25216-1-yadavgaurav386@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Gaurav Yadav <yadavgaurav386@gmail.com> writes:

> Replace generic printk() calls in kvmppc_dump_vcpu() with vcpu_err()
> and remove the corresponding TODO comment.
>
> Using vcpu_err() provides vCPU-aware logging context, making it easier
> to associate register dumps with specific vCPU instances in logs.
>
> Signed-off-by: Gaurav Yadav <yadavgaurav386@gmail.com>
> ---
>  arch/powerpc/kvm/booke.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)

Fair enough, this will print vcpu_id as an additional info here.
Looks good to me. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

