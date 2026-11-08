Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794107285;
	b=xjwNC8vOZXZpZnfG7taWA2LBQBuRW/1TKggEAVMvU/x/voROz5EY80Mc1VO9DepcgIZ4
	 XOnjs/lraRxkM4h998PKrpmv+i62fnAudIqhH/AAFy1SD6vR7C4c/RVtg/l2XFoLanhBP
	 delP+v4xJqfR+hAWWPFw45JlYetecKd/Bt9KN+Ry+X1bVCPmBd8iiNEPMNSXz22ulzXHI
	 6Ap4rtMxWK5T7BrIHip8mvdtj0xuDAF9/xPe6xNAfdhkP6cr3LuQ+WhQOxCMaamWcAWIw
	 ihsks3xMM2e74K+9+w98TVuwJEvlQZBukN/qc35yPpEW/5XOc1N1Bp+6Y9ZXGZLNlOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rR8VPeK3FB85MnmDJy6ge5uqblGvqjmVoHJKO5NZYkU=;
	b=cuwa+iHjw3YWzIqAcaMMh541jR6syAHw7jq99q7PQQZhpacwzHGponJENa8M/DKyZhIX
	 R9kYet4agJnEyaqpvpOyClDbtz828dqINpoTmyjiurUUVacT/LJjMQi8x0UcshO/fCKW+
	 21FdJwLAMNAk0k7FjoJi3KR62YBJTA+A8Msas+CEd4d/2R0gD+5YT3hKaEnNDRu7u/D7P
	 +7hRrnu7tlbYsnGupPZ789RXuXcN02dI8AD/poTwnQ/iI2L1ZFerj9sMg3b4x8Bq8Dfsb
	 ZEILSZupaulBz5kN7xF9Qke/CE3d7E3D9XBBBk9mxMknROIy4iRdxtBtPT3/r8UmWIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGEoJmlI;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F17606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 03:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F17606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGEoJmlI
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1adbf62dd31so116335c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 19:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794107284; x=1794712084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rR8VPeK3FB85MnmDJy6ge5uqblGvqjmVoHJKO5NZYkU=;
        b=FGEoJmlIO0xzPP+c/0L9tejAQgDUNr8uiziInXt7PGanVucQRjhkJeQ2PCVbui5tcM
         f23gwZrdQNequibnnxHZVo3vFLA9i3h7ng7HE8hKBKsBI7Z+hH58x0pB7WQSisMAzNgn
         zp2e1ED1T9tWTe6rCRxTOH0eyC8QG21c7VZTBYDLFYOSlXjoZRhIGa5gfd5uKWwgtoHi
         +MFCQOv4gjVLinuthJgGIC62B4zI4pDlMSqf88IMgLQdNQTAI9u3STTmP/8SEQl8gIwj
         1JRGJjnFh2g/JB6dFERwadFc7NspOxJixWt2P8Qk6l55gA04qOqLGhIXTwYF5fw1T74Q
         9u6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794107284; x=1794712084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rR8VPeK3FB85MnmDJy6ge5uqblGvqjmVoHJKO5NZYkU=;
        b=THum/RGnRBBomoZHJxehH8HZaw8Y7fwxkICH6GxAMnR+NNkSutln4YpzEsEeFaTokr
         m/HBmGM2zXEAljnNf48dN2fd3hujYmRLG9H/TZDVide0dRxmWr85/SkPodHqF6dEUpj0
         LYMtKZPZOgtorVkHyZHybGtM2om4ayf2N2MxLwNk2Sdvqxy//mNlvzrj2GPIGkdHEmb0
         F6AvhLbEQvdF5Qd/QaK4OL8TpFQMZ418+kyfjfZ1TflbD5uxForZiyWrFtEfh7Q26E6l
         kcMwoLy6tGfqp9X0S4sdSNlrS2juUZObJGE1VYE63ivYIZqRsF61ELrm/Ic0bh49y/GO
         5UPQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0pOV9LHOWoxfJDtk13zarO0KMwkNazpGjkKC6LxxInXz8m2f7xQ8tPGtKuLLNjfcXbri1ODASUd+92gE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hncIuNrE9bxsEHZHXyqkyHbw4BqYQ2KTELfIoe/SPgGe4LoKF
	WMMyqWpkroGX04zwcq0kEzlD1fHQqTpHQ8Lp3B2qDfGejkC5fQjLM0ji
X-Gm-Gg: AYBFou2zWNx47IoOA8dvJlEwouoKj2ACl/QGP/Lo/5PtyEyQxVDs8hGZqPq6jVZAqWQ
	GrJ1GotEUaEFKqCt73mEpxRMFCl8rusj5EM3+RhI2LQeXxRI41JhSwtV+XUWCAI+FzRG44ghQIw
	zMbqsAwLshdYIDOJl5OvQALEHBXsqtgdlaZwInXHjbidEY0H1Es86wba2EY6l2Z2RDjKf+4PXio
	Pivo0vDN7FbLXIj4TYfF1hSFrH7ilQncSqNa/+USuSfnEwO5R5e9WQh6rLYFQPKzUSVw5h+yLMN
	vQC9yxfjk/E8ylfA9N7j1eP6Ptz1looJPOaqPa3gD+MTqSGQ6avFIK59gizOpiNpgdIm0/pYPbn
	WQqu3t+N5NJaFOrCREIldJWjYkMpXwo6bFtw70uioKpXsy2KlHCrSXsCmkUEaMa34fCLKns3jRP
	1YpSufpagTR9fjBapwVfRmp2dYy+hek1CkUyIfCYHM7KR4bZZYZKvPCD2gfg4738vg/AmlStwRi
	F/IVODeNv5oYZEbxFfUV4nT2+fS0rXMjWgT4JQAvBFHgUEFjynwv1Sfo1sLN1Q/ACcvcJNSV676
	0mut5UJ1xIETePBGSO7aM9JxJ4+0WoH7ROyC7m4LtYDlb24+FXuXeZ3mYrqJ3Lfixnacf6B9ZOQ
	OLSQITj0vpWTgJb8ZyEIk2H7ii9E=
X-Received: by 2002:a05:701b:2311:b0:15a:4155:3d9d with SMTP id a92af1059eb24-1b39feb42fbmr606928c88.31.1794107283863;
        Sat, 07 Nov 2026 19:08:03 -0800 (PST)
Received: from ?IPV6:2600:8800:1aa1:b100:c803:e868:a462:afb5? ([2600:8800:1aa1:b100:c803:e868:a462:afb5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8838sm2123586c88.8.2026.11.07.19.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 19:08:03 -0800 (PST)
Message-ID: <13083638-9316-4d5b-8590-f104de3def3a@gmail.com>
Date: Sat, 7 Nov 2026 20:08:02 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/vkms: support more formats and fix RGB565
 regression
To: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
Content-Language: en-US
From: Sidharth Saha <ssaha2000@gmail.com>
In-Reply-To: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Matheus,

I tested this series on top of drm-misc-next (7.3.0-rc4) with vkms in
a VirtualBox VM, running IGT with and without the series applied.

kms_writeback: writeback-pixel-formats, writeback-invalid-parameters,
writeback-fb-id and writeback-check-output pass both with and without
the series (writeback-check-output passed 4/4 runs on each), so I see
no regression in the existing writeback path.

kms_plane: pixel-format-linear-modifier fails both with and without
the series, on the assertion in capture_crc() (crc->frame != vblank),
before it reaches the new formats. This looks like the existing
kms_plane CRC issue listed in the vkms TODO rather than anything in
this series.

I wasn't able to exercise the RGB332/BGR233 read paths or BGR565
writeback with these tests, so no Tested-by for the series as a whole.
I did test the RGB565 rounding fix with a KUnit test, and I'll reply
to patch 1/5 with the details.

Thanks,
Sidharth

On 9/27/2026 5:52 PM, Matheus Alves de Almeida wrote:
> Hi,
> 
> This series adds support for RGB332, BGR233 and BGR565 writeback. This
> is done with new helpers added to make conversion easier. It also fixes
> a regression in the RGB565 write conversion. 

