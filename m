Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390480;
	b=NNPCxCCdMPWNtCvfjm6Vm0XPuQi60hnjq0sxjLx2tVEUTkHzd8T85pAQLkY58Rg4BaMG
	 ioKC/G6GE9Y/84SC4p+5lvUskWJaDuDG6IL+M4ZEecjmzrDc0OJOaqR3F9hl/byolPnBY
	 W0pGU804dAs+BaAkzRoM2qvPWBPGgC/1NmjwlC8y7mskI1Q7vDrkV6yBILRLwMas7OQaF
	 jfQf9YWYpXHNbRUKixzmC8bUZcg0ieIZ4UNicmdkYsay39JsHyhvbO0N94uZiqMft2wKr
	 lP8pOMqRxAh6mZTikjEosBbqOT3x62KzWCKcxjoC9FfEfMCONnrXHybqquZIXAUQlXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xr+9Ecbsm+vbaizQH7M3bFs5ABTxIw+BtfIU+UNFjy4=;
	b=SysRiFuuMfj+9hJHMEEnKyoSFXype4CwgI81fsFbNH0VQ/nDZyjlc0BENt9rxAy/J7pT
	 tC8klaA5Jv1ijTNhzd9JlwlPopPetFeWRK/5/osduHh3fqrcp6Eez2tyTD4dgsrjvCNUh
	 kAX98rCtkcxnLtLojrP8heDBru3YJLHf8Xr6ub7bTLYvoE/akNQiKCILUku3XEeLGVk4H
	 tqCK3/ir2soSaMXI1Jz5pHWu64HAKn6QZGsq5F7HKmlZW5IyOa+FFqoJKM56LEjXkATKK
	 yl7Gpu1HTlVvnj9Vt7kHpOjrlZPI6SJMCpvA/uKP14VvSTUkTb2Z/XJQI4utCLnLKOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DFCo1pjU;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7AA606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C7AA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DFCo1pjU
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so23143725e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794390478; x=1794995278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xr+9Ecbsm+vbaizQH7M3bFs5ABTxIw+BtfIU+UNFjy4=;
        b=DFCo1pjUShcB8dERsebFrOr2ieoQTZr9MnbAgH9H0BL2tq5YyCSSU02xrx3rfPmgEg
         kPBcAt/pwcMd0rej2x0MA3SeJBXM3UuuPTGSN3BuuraMzkCGEzz6d7kMrxBxIm25aYGW
         LlhK6mVtLmN22k1US4rteSJm4UCa67qHAMGm0BMJGqh1us5p9eqOnnbv8+fBa2kG4TM2
         ESueB9pj838LCByfQu2Wsgk0/nngl/AZi3kOuEShNj7WTerMOWk6Rb3XfV4Jv4bSnEKO
         ch+tb00lm2sFu18tUsGMozRFveUd3pobuN78oXpj+Lh76SJQ/CiO39/ob8+Y+c6pLLUS
         oOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390478; x=1794995278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xr+9Ecbsm+vbaizQH7M3bFs5ABTxIw+BtfIU+UNFjy4=;
        b=z/Q193Go+OiD9BKatnGVkvAJI9+Col2HDgXucBtyCgYKZ3LNnI1tYMnr9GYa25oydS
         T6s0n1BIdFBpFtH3fG2wycl0zdLYQ2N2Qwam8euulPpsqPlM34aimvnW/xYwmolZqWo/
         e3j+OKHWqf0/E93A5weNja9DDConwdDApZ5rEFKayD5BCKBS3UfmyPtINUT0K2SfYXD2
         +ofEXQ3qUNl37O5k19orTC5eFu7Ut5rfQ6bKAK6jllkhhNnVpNZuWAi54AFUUMDvxqNA
         bWv1+cm4q70uYYcimnYzQ659ZDsiAqlmQaPEAWuMZE/6O0KjVD21Ajo6Gh+6qAepnxIb
         hoyw==
X-Forwarded-Encrypted: i=1; AL+hErFyFW2SKlIyAyVLH7GWAXiDLLFtrc5JpFVqaTj/I4UtOReF4D3eBSbDCnU7sUdGLj07M9DGgfsM/66VoD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xykbGai43EIUOUA9jNW+beRY5O0RYDkZnHysm5rTa1miKtok0
	FOpHkSuN7J9tV47WwbnCweMZslIyGiKj38aGy7ZNagHGT4TnRJJjKaKb
X-Gm-Gg: AYBFou16E4ah4jKLdHBgyt3LIK0FzlL3Vr59t2zLcPgRV9sUo/hECXkppRf3z4M+u6K
	MHYhjSFJQ5J6AYpCCeej/WLQEiXxAiC6LjsnDRIalbOo/ELa4nXn1INoN+qYWcnd1MP2a+ZjjkA
	ZZM2w/CCOqCfDaipX/7cMih4K3zvvPjqUx0oKHalLT6u58hTrSvr6t1Pr7xOsMznBE5iDYF5APP
	qK7IVb3PTmYxjDSMUIBY746c9xOjRbVWotFsYWlXYdjNuXsQCI9EX5ORkhuKhw2i7uOGDE09nka
	FT9J2mDZh0NemozKNwKsUYWbIYO+P5uMe/yB6qnDWJFunGoKn5qT/pi39Om55wYpgzOm15GByxp
	+CZ53KQRUpyY3uy/N0XRSb5oycnmJXTzUd0H+Lmn6WYzEJjlvS9JGZqC4bMCmWmkBn+1OnwWSf6
	19ZiN5MiKkfhvd9XCBU2+M2ZFhd2MQ983NIfZD3J5XnYtG54ohxlTe8avVX3JM3BLa38r3fmBJ1
	+KAT6uVCZwvn3H75iHqkzYQpci+fqI4oc0cfVm9bmFB0n4kkbg9FxJuYoJMtVmD3x2HAknEUo5a
	f5SNqnJmsO3SIN6YYpKY1VL10wsyXMY281AwvIYW3umkr/JF0UQMOLTDVoBQI0Iln8aecRZ7m/i
	8lvCtwsLS5qiw+4e6c00cJv7V12E0WHixc+MP+wRZZZoABfpKOQsnBkrv79SuABVGw2ztFAFfga
	x9xkhOzNIeA2Ii5lqITfi2idthnpyDE0hB8I50xHRBgbB3suRJddoEmQ==
X-Received: by 2002:a05:600c:6308:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4ba09381867mr34638075e9.22.1794390478233;
        Wed, 11 Nov 2026 01:47:58 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-a1a4-8dbf-7ab8-e5ac.ipv6.o2.cz. [2a00:1028:8388:a84e:a1a4:8dbf:7ab8:e5ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm203884135e9.11.2026.11.11.01.47.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 01:47:57 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Ignat Korchagin <ignat@linux.win>,
	Mikulas Patocka <mpatocka@redhat.com>
Cc: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>,
	Milan Broz <gmazyland@gmail.com>
Subject: Re: [PATCH] dm-crypt: defer async write submission to write thread
Date: Wed, 11 Nov 2026 10:47:56 +0100
Message-ID: <20261111094756.20997-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAOs+rJWmmUbYqU34Yb4qJvJsZ92=AztNwNsqX+xD8WaH8tVz-w@mail.gmail.com>
References: <20261105072708.30722-1-pepe.schlehofer@gmail.com> <CAOs+rJWmmUbYqU34Yb4qJvJsZ92=AztNwNsqX+xD8WaH8tVz-w@mail.gmail.com>
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

On Mon, Nov 9, 2026 at 8:51 PM Ignat Korchagin <ignat@linux.win> wrote:
> At the very least I think it may be an unexpected/undesirable setup
> for the user: they enable "no_write_workqueue" expecting a fully
> inline setup, but still get io offloaded. Perhaps in such cases we can
> do a pr_warn_once() to let the user know their setup is impossible?

Now that Damien has confirmed async is fine for zoned devices, I would
like to add this warning as a follow-up patch on top of dm-7.4.

Would a pr_warn_once() in kcryptd_crypt_write_io_submit() be acceptable,
printed when an async completion is sent to the write thread despite
no_write_workqueue? The other option is a warning at table load when
no_write_workqueue is set and the cipher is async. Zoned devices would
not get the warning in either case.

Mikulas, which one would you prefer?

Thanks,
Josef
