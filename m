Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260251;
	b=fCQ2wKosM2hwjedT5xCY5ujZMUqrz74zQQQsl58jXrbcSBlUntWkQQWTVfEkEcyL7pFT
	 c8SV2VicgvvmIOMiAzf3PU9TkZG3p2nc/GMYQRG4WuzEzLTUvlENJXj1FpRyZQndbxupo
	 s5iwqu+QOsfCmD8rfNc0itc0jPT20b2sx6GbSYM+cH7SJC85mqRS7LRcv1BOEamJBnQcO
	 qfcYLH3BsgIZhupdF2v05FJ0kY4fNJvqNoW06T1SphYpz8V8Mj7U/3XBRUz4YP2krWKJj
	 YhIOlyaWQjtfFg06sga+c7M/BF8JoCI0D4LWZcQmP0VzhagZW/S0H8dYvFao6jH33HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ERMGESRcIyhoAvXqD+A8PrCmBWVP8ShSPszoF1KcdwQ=;
	b=3mqtH/jVuEfpmRtyJ6lP3By0nrxjNjXQrP5LppvwDdXhvJq5SdsRrTwiHlPpGCn74Nx2
	 d4ELCL60ZivlS+uig3zvfUWvCY+KFbctfwHwIu9pNtpbUZfLL8XSN2MPQLUzLmv4Sap7M
	 sPsJyH/cBVfdibspMfcPxb8w3JxsouTlnDUqBOd4cvkhYdMfpRBjQbBbs35FIgfGGHAHN
	 ba6E0l1jgYmouQp6e+hUFARA3sKJ0SFNI4jx/wWwUq0An196RGYHXfrZNGpc/UTHGxprZ
	 cb5aUgXieXHW0S+hRge2yqpgr4OdmR5OhC2vgAJwa8/hr/MameAJsr8TRgCJwEBYKLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PGRB6QAX;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595CC606A331
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 595CC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PGRB6QAX
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2490055c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260250; x=1793865050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERMGESRcIyhoAvXqD+A8PrCmBWVP8ShSPszoF1KcdwQ=;
        b=PGRB6QAXa9QTVjCXCC+zUUn4DPxOiAXUatekvoY4AJQyAVegjbXQhZHLNJ75KbZ4od
         8RNUWby6a4b/OYRRo12uPlpaS3hyOKEVu7ijo/uiwzL7NeQ6JLvKaJkZwHD2MYylYJK+
         xv2/Obl9gMIxYcr6RK1MVE1eiAo8+JzCQDRneP4wUQ2rml3BB0ocJiyN/7umlfu1GT2V
         +QtKwkVRg+/oiHXvX3m6A5gNsyHAreTCE7pk5N4yr07bDxPvDjOrxylXNh4ADFWIzSWr
         UO2AO4ydny9KFiw81xfJTPfUVMx5xbDWG0WMC9WSDQdK508ZZ3gXAa7jawa3Drla1YYL
         0Hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260250; x=1793865050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ERMGESRcIyhoAvXqD+A8PrCmBWVP8ShSPszoF1KcdwQ=;
        b=ci5D9W2KF8JjjhuR5Qws+dg2JzUSgupHGeIjWKadQYb17QiYhGFewoPneHXYZTuHja
         kJsOUJODR1zYQQUAf+pGLG5CM9pDP6YUEgkAfhDX6eGDnpVms0G3fDcNWEh5Hbr6t3jJ
         9GJoX36hCgO7gmwU/NdYL6JOErokEwm+KXK5z97JTRdYu94CSoRxCLxE0F84qDUXPoNY
         Ph392YjgzSrRB+CVlBY52Oq4/B1eWxEZRVKtMS8p1UXzzCsB+Ric6H1vGZ/kYPkMc+y4
         O2Wcjf+hIZpPu0ZBQsSJ3mTKp3W83GxX1DVUpNLDfzflCqLxql9yx2jXA4OyTokCrJKu
         mo0A==
X-Forwarded-Encrypted: i=1; AKwUvBxJ3SUf45ftlFXQODUQFfSlX3Xk8YdAu15SvYk5nUSYO7uQ3kttKXNNNPwaRuoeqQQNRBwQa/oBbY+4Zsc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/8ayBfueFzzATAroEQXukl+Blh9tpxeQzRB/FZ/sFWadjbgWY
	XV3+HMKX6UuqY7nR7n65T86B6l6jb53uoCOQXXO4WIagBT/ENDTzULbeeAuYa2lO
X-Gm-Gg: AYBFou1rvMWN+ugRdjXO3Cn7DZcXMPAXlDsFemFq7D5Ae/MUpxd3pFC/ez7RTLJtqQf
	sgy+ftgKYKNsvGyYezhQFCBhfxA7R8YUZ1eWKeNNDJTVMjLyYTToIkPGxPDEUyC/EdpObIlLHMd
	TCGz4Ifmnzx1uYl53g/y8OmNTFig7cFtsWE5/xxcU67wZ6aRJcpyO1Atw85kuGpOqn1Jqui1JYt
	3x7XViR353Q5AVoOE+zJKXN65kCHCO50IOo6swlO5grTNKiv7ccg9RyDosKqCrWUmP6oI8ljhoZ
	e6TBeXVmACsQLOM5f/EEHDI/+zAlxeE/A8JsCXugpuJjMESk4ZmHHZRtrkWeQgmN9IYYPfKemX7
	d6HRbK9jUqKVmfiJNlrPjF16YbwkrLloW1Dle38U/Errj+wyTZhB9kjHajkEuvc44lMwCfrJA4j
	RFIQvZaIW9rdPLjkVTB72HOCGUsz9lHwIG2RZd6xt1keo1kme1st4rVLWWY30CZlXa14fq6WPlM
	BQJCgdVEV3GzYBVd/GgwrjB1LsoMEHFsi5nXQdR9FmxqbBJoMJrEGfxM6L/qkxQLPrzjzGLmPvz
	5Ueqgl0+AvUe42ykeK5xptcCp7k1klvsHkBgObQPnbafvg==
X-Received: by 2002:a05:701b:4586:20b0:1a1:8bac:c1c1 with SMTP id a92af1059eb24-1a6cc069414mr5870859c88.15.1793260250401;
        Thu, 29 Oct 2026 00:50:50 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e1f2de2sm12139073c88.13.2026.10.29.00.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:50:50 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: kayracizmeci@gmail.com
Cc: peterz@infradead.org,
	mingo@redhat.com,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com,
	kprateek.nayak@amd.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] sched/cache: Check reduced capacity before alb_break_llc()
Date: Thu, 29 Oct 2026 15:50:43 +0800
Message-ID: <20261029075043.4013667-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <auLs7xeL9FsHcf-h@scheduler.schedules>
References: <auLs7xeL9FsHcf-h@scheduler.schedules>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kayra,

On Thu, Oct 29, 2026 at 10:13:10AM +0300, Kayra Cizmeci wrote:
> Well yeah. alb_break_llc() just returns true in the nr_running <= 1
> case. FWIW, on my tip tree this just creates a conflict. On me
> alb_break_llc() is first, then asym_active_balance() and then
> imbalanced_active_balance(). I think in that case moving all three
> functions would be better? (below this other block that's for this case)

That's sched/core, which doesn't have ee92b7ef4c1e ("sched/cache: Honor
asym packing over cache aware scheduling on hybrid systems") yet.  The
patch is on top of it and applies to tip/master.

Only alb_break_llc() needs to go below the capacity check, as it is the
only one that returns 0.  The other two only return 1, so where they
sit relative to the capacity check doesn't matter.
imbalanced_active_balance() moves only to stay behind alb_break_llc().

Thanks,
Zhan Xusheng
