Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792607915;
	b=kcmtk8/nBOxrQ3Q6y3rDaqg8sg3BT0IPsR9EBVl/NpWI40yGIVkuaJqV7K2aJWlqt7Ly
	 4YcqSJMTGk2ac+Q7q9zxcQted4gL/GOc1KQaiDRELxX3pqPP2jfT+wrMrfKpkPcUTbLCm
	 XbenT0IDYFrockDeUJFTDZFJ1H6w7H3c33Vy8ME2VPEV5Vpj2ZsZuNfEAPD4y4Q5BKkQr
	 lw32bJWT6TsouJgiyTLJ6grjbJhAjICr+5v26yj32TMQSL1clpc8K/SCALAu3oap00i/A
	 iOV7Vtt33DIqP8usQ+krKrd79vUCZmeHyoYXdG5+CiGWmHAwYX5WpyAn7CRV64+GWRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9hox3umal0L1xptTs/0CqZ4PvaxstwP/QmjrFMXyQAk=;
	b=V5mW/X/lnWv4cJhVIHzW9braroRPfmi2Maz+tsFMp8xgWUKb7D85rxEsFrMcZWDdhhOQ
	 QvLRre7Ebipe7A4WgtgTmvdGCn5iLb68ggOVpZ5taOHgx0mUmNPeTdWA/nn1fQKgO4pHl
	 WMtKr3p0sVkLwpja7gyA1Xg3UfdKJ39xbDJscA5LtUDZqvgfe96DSbZW1cOnBFBE4q9mf
	 zNgKJb3q2ODh9q0FFIPJZBdg6+5A+gXRgijLZtg9UhCK/pvFvqAT4FMGq0kLhciPfgfT3
	 E/B0+WxaDu+ZQOzzc9VbHoBWomR3kVSU3xxFVrjDReobs3cVS7w/LeKIB0ZThsNkqsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="O1/oORPr";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490A2606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 490A2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O1/oORPr
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-157fe9d771bso1364105c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792607914; x=1793212714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hox3umal0L1xptTs/0CqZ4PvaxstwP/QmjrFMXyQAk=;
        b=O1/oORPrb3W/kl1Yod/TdFl4dMRkBr9k8bRLN6akM2zGN6KPipLh8dFeI++me2X2qR
         Ttwm6JplNEIhkk8j0vy0q/q+vrljcah0jUxNDsRoR88STRCNuXIycNDxSZYFENmXo+YV
         EhS8fDH9Gouoz+O5dCnV+0Osm411tXYcMChDh3yWKONasCTGTFBqD3aZ9yu0O1HCphz+
         QpCbMKMh8DQ0xpt2dWFtKFpIdOwpNDOhyJ95vvPhPCVlik7tGHC9coKH6rYi9BEqXTt1
         sgS8n8L+s4nkn2h1541TqrxWbu3R/XCjDVRqnSa6XpAzh48w8m/lyXT4vGQMH9QxZ5Iu
         HGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792607914; x=1793212714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9hox3umal0L1xptTs/0CqZ4PvaxstwP/QmjrFMXyQAk=;
        b=ni56W4j950E6S3R19XqJ4vTzDrXYhTm/SVFHXyu6k9Tpu1qgpBM+KBALchFaSNYkVb
         /9c+wRNRivNNZsJMChBIskqWHYALW2go7S3RHLgkV35MtHu5l/6e7lyYouxccha/t4ZQ
         e2tVHla/mvsbP1JcYA4eEoUjt2V1rIlKsknfSCBHccwALwu2OabD9IwnDMuhfq3xjYDO
         XZsHgO8fCC1ZVAoB1rFNNdquiq5NCC8HkmeRP4fzMPPHkWkxMW/Us6lpo0uzpMft4VB2
         zFyrP+F73G2KtxgxhxEXApOhWQyNJGmVI9o/PkDCj2NQxpevxmHv4kzbjgBNDlPRdsGq
         6Ccw==
X-Forwarded-Encrypted: i=1; AKwUvBxIJAyFYE6e3YO8bicJqKSyaCrD3Jt57xUCcp34t20dPCQNBEthc5Ig5qUzfS4OPVs2nNJT+F0PfTi01jc=@vger.kernel.org
X-Gm-Message-State: AFq9FYInLnlbKDi2/UXC0KxZr4+ue36tOdtxns++EquNwLQCPSxoTyyD
	iDKABdlkfjC9uB97Ph+396hJE5A4pXlUZI+XjPfD31+az3LyAlD11soAfczLu4LuD3s=
X-Gm-Gg: AYBFou22bqc0siefrYUPwvtmcH7Yyx6p4vS5AFjGPddlvumnN/6K8UVrEgmTDSe13E1
	ZN2mTDfhZ6aJmUU/Sb8Ne5/oVN2WehwOtvpEY0QO3IjVaefBAOpz+Dx257OtP1DeTcYBjfMsB9j
	+zIZBr30wkzNeG1U2elL45J6id6UNaL4GgTYVTzNG+WjXB7YS9M2do15awm8ea54nxJG7uMOX3h
	f2f2A82X9iUZERzIhjDN36ynTCYhFxtU5aqhYIMFT1RZc+Hh4B5QvKKEGewFlbd+PcKJ4EzcNCv
	Ia8muJ0g1o7W+mtezqw6HlBPM5nRje09CrDR+aCMjVC3AtnJRz2AFCmFGpwUeK5BdpA0/S7RCOW
	KdbQMHFkMF7i0T3Ool93GUCecH5Q84YrUKEuagppzsPb8eiI463ibL7U75CPEI1cIFsnCreByak
	CUi8EUpWy1Tj/GDJxjvvgGWd0CtuDPeRMCYb1LEnn9NFUODSTughLsQ/8W/RqYtOkj/O9KXL+LM
	7FFSyq0mmH04hgkdlsKLZLYolvuIZZJSny6j+YwW9AffNAFKCyULQDkWKLfeWWfnoaUob4Erwmr
	uVE7t/8BsLA/PXVSIv9l2Hyxp7aMP3zkf7IyHl2h+mmcdSXJjI5FlFfYskWykVhFbcaph1g2DwM
	kGXl70C2FbAc=
X-Received: by 2002:a05:7022:e802:b0:186:5b49:90d8 with SMTP id a92af1059eb24-190a0428f0emr4206239c88.4.1792607914183;
        Wed, 21 Oct 2026 11:38:34 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903aff3481sm8427859c88.10.2026.10.21.11.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:38:33 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: joshua.crofts1@gmail.com
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: imu: inv_mpu6050: use named initializers for temp in hw_info[]
Date: Thu, 22 Oct 2026 00:08:00 +0530
Message-ID: <20261021183823.169199-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020095936.00002ff3@gmail.com>
References: <20261018000924.758186-1-kapoorarnav43@gmail.com> <20261020095936.00002ff3@gmail.com>
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

On Tue, 20 Oct 2026 09:59:36 +0200, Joshua Crofts wrote:
> Your patch fails to apply, please check it out.

Thanks for trying it. The patch is based on iio.git fixes-togreg, on
top of commit 2b8d4cd20ac8 ("iio: imu: inv_mpu6050: fix swapped accel
and gyro startup times"), which changes the neighbouring .startup_time
lines in every hw_info[] entry. It applies cleanly there, but not on
togreg or testing, which don't have that fix yet. I should have said so
below the ---, sorry.

Jonathan, I can resend once that fix has reached togreg, or rebase it
however you prefer.

Thanks,
Arnav
