Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DB338B12F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124966; cv=none; b=p73qdl4mdtJ2Z/IsmPW/r8DI2gd85inmfXsHCfl0bLtj3PKMHQCGNg26mPFpnCqSuXpi3j6FwSFKA+GIm6l5cWqvKDJAaJAPpndVU9o2Gti2uTAg8yQ8uLCBMg60bI8SDV1e4bSAue+Q9PTS1xIlesW6MkZthm1vyLvVQhomVJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124966; c=relaxed/simple;
	bh=FkveoDd4h8xZlCyR30ZgA4Ehce+KUcHPRVHzRy0W3u0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=nJwUTzaa2N5iCLmdZbEFigu14CNC6TtNRD26rlXqB1xvTtc9PjO+LNsQOdZRlgRMi9uSb8vTaLW7YnAHem+ITAesDaEvND+qTT1xsts+uAkmmNuUmlrUUoSyTD8ilhSoyZoPJQOFWvRl1kWCFhwXvGEIRCw7ldqvTwAu8UjRoPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ocQzzZfp; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ocQzzZfp"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30b6dad2382so14393334eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124954; x=1792729754; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DiDooSTm8OioMl2T/zFhD+a3mabSdEoM10ACbYCfIxo=;
        b=ocQzzZfp3OPA7Vlqn+lctegPfm6GNEw4fuZZKNxxNceHRnZTmXYawotfvjaORjy8LH
         4guT9m7i2YMPI1m1T9uUCGuefNc6//j7uA4x4GFZJgh136/yvxrzc1fsNUwL+E4UCCWv
         BdTUmleV+ihskcscLQE5t095MDb8WHcUIhVxPT7R7rBAAE6ZjCPnQuE4ObZLC+1ggwW4
         3t7P23aFLpi8vwSJT1YsOIz/CC4dFgMyLQDXlGSJgz1YbjDjk45FjCRpafjbACVHQDvE
         Ac+4vuG4LYUzd9GH2xFgM4G/VksP57QjROLTQEyE77WfYW8ABIIhreW2j0oqeQ0oFwUC
         HVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124954; x=1792729754;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DiDooSTm8OioMl2T/zFhD+a3mabSdEoM10ACbYCfIxo=;
        b=SsMu2pVZ5vu09iN1D+EfZ4Tbiv+kYLvoQvdh3D/+Y32B4tQ7YSLDtdGTQlmWn5dGB7
         vkOV3/ct6f+q7k2bAO2jV8+fkWIU+bXSfVWfUkIUTRsp4FreGDtdFnlbmfGYkGLDIhNk
         Rldq8qIunjKgsqh2mBbZk+b4uijHbg2IX+ORbg5rI62gqpxeYD51haitnJVgmj8HKwU9
         7d3ldtX8NZYQ/RKITk+wFkRzIKSEiBvOkMYXcAd0zn3dwlKofaKN+kjXwJ4GV2yXWH7N
         N9Aby39kC0T5BtJRESJG+fWK1YnsgYVv3KCFYQwIZ0lZ6E4bGughupuJR40zjRn4NTvl
         2aqg==
X-Forwarded-Encrypted: i=1; AKwUvBxU0p3SAJhEddq9RIJ53yFJp4k0NCbWhH3/d+1/kIZIXpDB2dVpVbzR0OKyhn/9OWW3F24/ctaWiVCeUys=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6gMt7qBi2nE/sNf1dYCMCFalzNrmBUK4oFWLLJ4PCDGvEz3om
	WNQIRUHxKP/YS6s1jEgQIwp9m+3kZCidlfNxmFqnr7o2zo3BjomZiYhG
X-Gm-Gg: AYBFou0lk9aP0HEAbNG44uNoAeyxC54GvbmExBIBvkZ5bjkYW/TsP3VWxQYK0zPNUZP
	sNZjgI1cWROT0pvUrlzkTuJGJd2tuWZs7mCYQjyhtCtzHHEmwJK8by5pBA0c2sAb+r4N5prkK6m
	9wEFozIBaLM9J7Bpir7cg6Z5O/M0Eu2h8J2i9DIy5RTE/S082mIhBpQWZl/Kyy1+1AA5Yet0UBX
	YbKa7pWXZE3I6lPc81qnqMzVjUBjwbtlqjfQOGwRDJrxwAaIdleWuGmsf0qdVgg5+y3CIDN1/Hf
	JFS+TAMW/O5iZOz2GmRmShimS6ewuQ9p06es3zMdwRBGF6K3rIB2u9D2INJqsvbLUesUhKO01yZ
	4H6TUz99JuwhUg6TV8odx8sOi+CCybuaAbp6C6nqw2ErA3FZdPK/aJZvp/zfFMMFlFPayxfAnpe
	+miA5+xNIZpbGB2LAaJw1/ySwxnjGX5DDPJYaE6r5fXNnaEaTMS6RQlEKJS+0CBetLnSCgSrfq4
	7rmrVt4lDMZDQR99VDkbdze6uUi8qgmwNdydinYMTW76SY=
X-Received: by 2002:a05:7300:4628:b0:34d:2c1a:9892 with SMTP id 5a478bee46e88-3537e2773e4mr27572756eec.40.1792124953668;
        Thu, 15 Oct 2026 21:29:13 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2712719eec.13.2026.10.15.21.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:29:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 4/6] riscv: hwprobe: Report Supm only when available
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>, 
 Zong Li <zong.li@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>
In-Reply-To: <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 21:28:41 -0700
Message-Id: <179212492177.1746949.5548277129502528505.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792124948; l=611;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=FkveoDd4h8xZlCyR30ZgA4Ehce+KUcHPRVHzRy0W3u0=;
 b=A7ktdki57MVv5NvdhO0O1ZwjArT94ExhfZVHn6CckgZsbchgD0PM3g7c68sJKIV7aSE9Msj7o
 JvA6zr8bSyyACJFbAza2Gep5KftbSRTbu3O87n8iPaWU6MCCOysJXwu
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Tue, 06 Oct 2026 09:53:01 +0200, Radim Krčmář <radim.krcmar@oss.qualcomm.com> wrote:
> The RISC-V ISA defines Supm as
> 
>   "An extension that indicates that there is pointer-masking support
>   available in user mode, with some facility provided in the application
>   execution environment to control pointer masking."
> 
> Our facility always returns -EINVAL unless Supm support is configured,
> the pointer masking ISA extension is globally present, and the user-mode
> is running in 64-bit mode.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie

