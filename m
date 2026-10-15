Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A207633A71A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096874; cv=none; b=YFZC1c9DanxkRJX8zvWky4ktmsNX9djoRUFdQJrUNGFKS+NkRGSm6YdMXZVx3jIIu+7JPMxQsJ+WCJ7WM0a5nPkqXgAoJQJLKSGgn9ICp9zVhWmSgefn7hUNr5s5sDzcW6h5ecxkBDNPsjL/y8AS8FIusZcjAvVvVOonmZW9tBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096874; c=relaxed/simple;
	bh=XBa7XjRKeJ3NbqHnarNo98CmUhjOgDxizD3P7JuqFN4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=slUYg4Vc+VcAbCPApQRdqmtUWhEZr1JwfDjsK5THMcUjDu1Y+Z8D2kT94xTU9izQ1E4FN8DwLePeQVaxd49BlSU3075BKEpkKS/3+sBPxmeZbgTMhxse73Mj05bcF/C+r+mC9WykQEo9Wjx11HiTzjKPP0O+3D0WxkDiKoCQyzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KT7ErP8S; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KT7ErP8S"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4be28b82so830943f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792096870; x=1792701670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2W/kXlm5ND7ClrDzBFtvNJDZO1bLmd3mgAbbGVfKnFM=;
        b=KT7ErP8SrE69QPgiqBh+lusvVt+J6U1wnon0AitSEzMy6xF8ZXNmZ9EmAbqU1YNGTv
         7Mo1Il8YkGIkPjxmImyeZ/g+gvnYJrxhTB3izP/ofQFkdn74qg+nY2+m2La8Ttp1L9jo
         q81tBZUgpg7ZCIKcZtmhR0SjHKD/FbuO76SvCGHo28L6Sd8HkxTpq5YgvddCQXvKd95s
         fmBioHlN0p5D9VXWGzxyeeIkXfcEeHvFzWramlpe8b9Dmg89t5kvYK4zwrcHHUiV/eMN
         nD9jow8Fr/qtZ87CLF+jd9WuB8BUiDx2DUTyX9a0MYINAt8IDJvILxjVs1LOAul0Muuz
         045A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096870; x=1792701670;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2W/kXlm5ND7ClrDzBFtvNJDZO1bLmd3mgAbbGVfKnFM=;
        b=fhjWQbxdbehGKge6WoRSmUYLTfx4JbjZpDrMlitrmjz8PVH3kMHQ2MsIQbbQ9AZFhC
         fT8AedOUX8UWQyCzxEcHszYUcIBmoDCFEFSx+IB1wvpnoKr4h/FhzqLKIY6gwSrFblob
         ZjKFM8MsQBRxTYg+CRR3n6nbMVtQWZP08iREAh6FzQHJpPymNRtnuenXHJWACeVpozmX
         SXgAKXbEiLH8vRZcv4H6msjwHnnu/kK04mZqE/iJrwLeRcHdG8N4ikoXUPA44oPtgQJ0
         N6Tolhnyhyyb+crKRsuzKJ9LJgilq2Lp7UfirGslq+DdSqKiH+wwJj5Zbi+aHuFNgGPx
         /2nQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaIVv/htiFF/hmt/3mI7C7QCX6JzUr9fIxxvLPDodeVf6a1c/63im9FBj7ndMiaKCgJm6XzGiB1BaDx7k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeujQXkpfME+FuAVsXScK+CfUe5wYrnZdk+5Zui8AEGyc99Qgd
	JDeA/1ouJz7HnnVCLFRs/Tydpi2+X82tuP6V5fx1hZxgliklnV+qnHcX
X-Gm-Gg: AYBFou0Ruz5GpQ6k+ABAoqVov1K+Sg/opq6T3LBrxLqi+kVufElDhmCXznBEoGcP1qz
	OO9+/XuTn59fjgG/BDduSbNSAqfPF1ZXtTavMzEvG6d/2IGBp9InUF9y/qGADZ515onx9jhrXos
	qh6QTfsw3Ax9S6lLei1AMsOVvi7r4/ZDXHLEuPYs0n5w+ltf4YriOb6r6vC5+gVC5rA99dV5bHU
	4PdcLc/xqXH+KnQv6rCXBvxDWRQyEiSxm7l2zl9MjiF3OjA+FIA1X4uTUbhpM4OenNf0pMVLNgl
	dxfsauNKrSLkSgJTUFkNQa38brb8qGxX/YeZL1hrBgJ/h1LodN/s9JciilrWfmocNHArG68oTZm
	3Mp0tNgT3CtHp82N2gvKFlutW44eN9nSDQH6KhpFbGPgLAskXJColbPtw3VUzKGnz/jeuGK2RJY
	zYpIFrBikQtad4k5KbhYanoRld1gr3vj0sRTCxVUHh1EiyuLaZ8r/Jk+rjdRDWbLPEhmrFFT3NW
	eH4a1hLTEH7c+P1hKSscQN6R/DE7oq56EAIpVb1nHlAUMjex0vHp9a8g43/vWH7Bc7+wG/3T1DN
	2jCn8tTWRArgTJHpi1JfVwY8ITbdh4N1e2uskwLTHBohPyjAzGj4jBzpck628pz0fG305eFpXZ1
	btFyZdma5oPvzjBSeviiXmaR3oA9nyHoW+F09om4Eew==
X-Received: by 2002:a05:600c:19cf:b0:4a1:7b56:1151 with SMTP id 5b1f17b1804b1-4a18e48f00dmr402724835e9.18.1792096869665;
        Thu, 15 Oct 2026 13:41:09 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b35a6sm91136205e9.6.2026.10.15.13.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:41:09 -0700 (PDT)
Date: Thu, 15 Oct 2026 22:41:05 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Dingisoul <dingiso.kernel@gmail.com>
Cc: andy@kernel.org, dlechner@baylibre.com, jic23@kernel.org,
 linusw@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 nuno.sa@analog.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] iio: gyro: mpu3050: add missing trigger cleanup on
 remove
Message-ID: <20261015224105.7b27d7f4@systembl0wer>
In-Reply-To: <20261015203559.2125485-1-dingiso.kernel@gmail.com>
References: <20261015221818.09527ff6@systembl0wer>
	<20261015203559.2125485-1-dingiso.kernel@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 16:35:59 -0400
Dingisoul <dingiso.kernel@gmail.com> wrote:

> Applied it, rebuilt, and reran my reproducer: the trigger now gets
> properly unregistered on unbind, so the attack just gets -EINVAL
> instead of a UAF. No KASAN report, no warnings.

Good to hear, thanks for testing!

-- 
Kind regards,
Joshua Crofts
