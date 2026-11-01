Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551640;
	b=SYSKvRVUkxkih1SWWeqQ/KvQRZreP0B7K75A0INxfbhJihoAfQtPGrpVI2/rgc1XmK+2
	 yDIG7oy+JxGZCznv6/Q3iAaJPfMwgJX31oWumBoMNljD2th7OSdWZOH3yF8Ru7o8gLjYU
	 QyhA5XSAGXR79pVgE1jhKFPTBYkxiFsT2UOYssrjpakRu/c9jFWKYtfwyjm0yzUlsPEcJ
	 tbNIwoE/vv1cCUDqdlW9ntdmYrkzOTG5Zj8dWeUmKNTZyZ+cQTcxyawZM8+eqnjEwF7bO
	 wUAeMBmrRK5OX89W8XHsaFJ2wjo8g48l067/GgaSgYUacs+wLSU91rfJx498WoXl5xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+QmBRgJFhtFLO88pUA9+jvHOb9ztG8eZY/mf5WUdXt4=;
	b=fhygw84Df2u+FZ0F53/oW7o6Guo1XCdScZVjakY1BwTB5rCrb+52dIslmK1U+qtBqc65
	 PDaH/wkL6C/O1cZDcOXKlNw+BHcwRpNqDlcowqKjxQEEf6VljKI+BLpbp1g1ijTyIOd2n
	 pr4zyyg5hwAgehcv19BFeW3GFoCTVQl6GT9IRwZI3eBaidFYUvXPIG90vdUozIZNYBuZB
	 fPJaBHWimF7//aOJYYJ42SUOmhqD4sp4/5RoPpIANbWiLAk7tvAURZZlMCeeIPSHM5WEJ
	 NhXknrww/yBbXtKpzEHLefnCt9xfm+E7j5LoOJ1NWPMxYJl/4zQEoCM+MaO/Rn9h99A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="n/F12gFP";
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F71A606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F71A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=n/F12gFP
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso2951427a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551638; x=1794156438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QmBRgJFhtFLO88pUA9+jvHOb9ztG8eZY/mf5WUdXt4=;
        b=n/F12gFPVpxFWUK+fqF6mtxqvv8ZkCQuy1esRW7YgZCTYmcKkXX4Gx2WalHux3tzjS
         4XnRIFo6Z+LMohQ2yzQWmLnIEdvnSRYVkP+y+ls/h4l28/Cs27L6MX0X5CnTJs/QyrBv
         N3wq7+kPMvLcdIse37nOggR8G6dYvcprDknykO6zxzCAlNclKhzAhjcnsxFd+gh7E1JB
         4WXNG2Er/es1rZB9/9EYBuzXKxcnDKAwXp1JELXoDQvnZDIj9fcKWUoIAOM8q+6MQlDS
         pvb3loY5rqWQdxgnwbgI2LC6yD992IwG8viBoQ7dy309bjnOzZR+pKOVXmSIDCM936KZ
         nRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551638; x=1794156438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QmBRgJFhtFLO88pUA9+jvHOb9ztG8eZY/mf5WUdXt4=;
        b=DQQ87ekVGKAhs0nTzvQhpj0gfHEdm/YpyTxtAA8lqxx0F0uzQ1GvqSM8d+A4zBh5cs
         J2qE7b2n5ANeF2cHbnchgSj8f+/ZjbTic8k8VBCSk9gc/AThrlpbvyZ+l0OebYAKVp+Z
         hALwXVXHBDsKl3J9o1+7WNjj9+wRSmB/WIRIWALf8ooMyTLqsU94g8/XDvymL7OkF9hQ
         z5G9AwYjqZU+6TBUKG4gXjQYktzMjs+zsRnyr3GIFUPj8Kn1iVNeBcJI1dqP6+CIY9RJ
         o/8FNDQsJDdDXk3U7KF8GyJrzFdWNwoIjAq2Y9cNLAFCWd5J2Cs3rDLmaoCLXvsmFosd
         jsWQ==
X-Forwarded-Encrypted: i=1; AKwUvByhZzCT+FSdwYX0eXlK3KAkoiszc17AYjUaQRyjErl4tnfB2ypbawMChy8KQUURAsmG5C0VyHwDzUjG8Oc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xyvyjLE0NiW+0iKHufFCPrq+ol1Hgs8zrxGvO3ajs2RvGS3ad
	+Tl9JmnkDWG26J0Oz9zJ8+YFkm7XKwpwkG41L8DhIMerRetsUYp75W/UyNPJ3Ly7Ig==
X-Gm-Gg: AYBFou17HgQd083cIz15KkK3NSOs2uhQTXVDrUUDT6TsHJCQetuNwh7NgxjTzZOiQH4
	Q4Fz3R+CkXOae9+cjkwTP5b2z19YlI/pcNNPG3OtyMgm69nTL4PHBuZMnBx95KSaUQ3mtQ1HY/E
	WNU+ynp6MPXJn7JBr6Y1OfJb+/QvRFM13Sz4qnFRHE/8sQmcHwkoDCVTc/7q+THEpJ8I9e4O0Ee
	FXDsLDzYWu4l2Mh2S5j2yiBSmkTwW7Cw8OHtkeR/dbfzwljzfX+M6+EJRH3AYMmYIA6+P0EKhBh
	j9YsQTjBcknKJrQuHe/fLCChBg8yhAxWPAUkUxrD0bcdw2WgzAVNABeh/TlUBRj4zyzDFjy4NsF
	0SXWYYkDE8C4t6f3AFoE1cEo1y66PYwilY38/eFXVDZImu8D3mVIjN9kdXwQ95xoiSEsWrczG/I
	jCAKurx7Vx89pQl16wA7mblvqK+8qpchDU4tyxIXJ1Hgh0+bS0Wd9f4rSLPmlfh1mD7x436hVui
	B20ix9rL7/XmRIgPTYEYN9Bdupw9EOhFHmjbgmIAToB7MwiLSL0CGBayY3IMlUBc3Io+9iN9RRf
	1IzJPg/SRwJbTEsufi8gYC6rvD5xBjFajz6OTj/OYnuLlUhNiYCWU7sN5EhwlJ2RxkIDxD8gtTK
	mHha8N19ll48k4X9jY81YA2C7FpjvXSKnZkWqU6CPFg5pimbDkvJIcFq7x8aW696zQ8DRNrX4P+
	J4KAc06F+7JqAxI3dlvEjyUU8IAVgehQFv/93kxVj85ljZvTnjQE4KWTER/094TU7HQQ+ieprn9
	mjw23dzxKT1tZ1a5KKBuNIevuZVeH/SODbTAX+6ntCaqbfEIacYh6LPSnBvETSrPXo5gUR96rUz
	RUkK8vO0oVrkJBmHwas4
X-Received: by 2002:aa7:d387:0:b0:6b1:ce74:2913 with SMTP id 4fb4d7f45d1cf-6b4d467561bmr3616851a12.8.1793551637969;
        Sun, 01 Nov 2026 08:47:17 -0800 (PST)
Received: from Desktop (p54aff790.dip0.t-ipconnect.de. [84.175.247.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm2371248a12.26.2026.11.01.08.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:47:16 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Florian Maurer <fmaurer@disroot.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/5] wifi: ath11k: firmware crash recovery fixes
Date: Sun,  1 Nov 2026 17:47:16 +0100
Message-ID: <20261101164716.302826-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101131550.1890062-1-fmaurer@disroot.org>
References: <20261018210153.1925962-1-julius@bairaktaris.de> <20261101131550.1890062-1-fmaurer@disroot.org>
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

Hi Florian,

Thanks for the testing and for your three patches.

> That recovery fails after ath11k_hal_srng_clear() but before
> ath11k_ce_init_pipes(). The next recovery then tears down the CE pipes
> on the cleared rings and hits a NULL pointer with BHs disabled (under
> ce_lock):

My v3 covers this case in 3/5 and 4/5. In 3/5,
ath11k_ce_completed_send_next() returns -EIO for a ring without a tail
pointer before it takes srng->lock, since ath11k_hal_srng_clear()
zeroes the lock with the ring, and ath11k_ce_send() tests CRASH_FLUSH
before it reaps. In 4/5, ath11k_core_qmi_firmware_ready() clears
CRASH_FLUSH once the rings are rebuilt and sets it again on its error
path before ath11k_dp_free().

> I can try that if you don't plan to cover it in a v3.

I will run your crash 10-20 ms after "is now up" against v3 on my
AX3600 and post it with your three patches on top as one series, with
your From: and Signed-off-by kept and your Tested-by on my five. Is
that fine with you?

Thanks,
Julius
