Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793592148;
	b=FpKg7D3RInU2/EUte+R1X2/LsJg3MubOpBTMbQfQXQDwd9tVFtTQ4f8UFwXjiJAu+ANi
	 2sAkERC3KZ663aXROdX6S80S6b/0l4f1xTtIJYlNqNIXSchfyRmxMyEfXj2MvVvkOVV0u
	 6egewV77VtyX2FahKroWv01x/12AnxaNnm/LfzJvTsBbdHcsd2weCLd4F9OVPtNTuFLsM
	 WIzA6YsX1dH1LLRMRg1ueFe5nGBJalrn99EUpxpumAu6+/FJNPMHKBMa/kqstRMETjcV4
	 3WKYhfIuU4AqKzirwXE7aAsiVMuvvZLpl92J1Pu6NpHH9eFOk7AsOgEnwGb+Dz3cXXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793592148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:X-Mailer;
	bh=VEQbEYEzye2gq9QTDKglfYWEJhST56QqzXTvReg3G5s=;
	b=tIrc+jisAnxcOqlVKF7LBWs2F7RCB8681stn1Esald/568BJaTL8MS/0S4ygjlw2Hf2F
	 gmfz9mFMXN+G3Zi6d+Mt5faC2+fjpe/OqCTfdkWQeF7GO1vwdr/lOKK2oZbF8b9WvSgWu
	 xGZEQqzgH9I3JHBJ4CM9or7NqIgZZv5p9iGE66CKV1B2b2OaY+d/4CIzOuq/8byZDBQsF
	 kLdkIFMzAHst8tk7Jukq4wYCfzHiwo5IrM+yWwZvoFWe9petyU8g+LLZpMb+tETgkI03g
	 XzYoshX2qy3pruOf8WotEmklxWfiHyrOePenwZQV5jbzOHVzjhQ4DeC6h+G0cqBSHZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2KR+E9y;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114B9606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 114B9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2KR+E9y
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2761c69fbso3663260c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793592147; x=1794196947; darn=vger.kernel.org;
        h=to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VEQbEYEzye2gq9QTDKglfYWEJhST56QqzXTvReg3G5s=;
        b=x2KR+E9ymrT8/DhZn0vRSbu3cGRc3OBIp10/AmiUxClqNYVDiw6EPoY1jF/qWmB6fb
         TEtlkHfpG2bZKMijoM7hrEn3CPGYtA+WThUffU42mF0vJa0MGIODrkTsYfTUiA8QS4jn
         MtzmEOmzLQcSxM3DGuHODUTcsDFFslWBCPchdgPr6L0eiWqQ/b7bvswcb3cqZ7MLJN7w
         eCr0AH+JqBNELaMnDwRJkDCqN9EhHJthOBRL1Pkvgg1MlwFH1nllcHeSUJaBRHUN8k6s
         pwPvecsXk9ka1aTOvwsYypMCwmJWVc3NiclpbUmO6rIqG6G+RkqnNhapciLVX5L9Zl7z
         L2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793592147; x=1794196947;
        h=to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VEQbEYEzye2gq9QTDKglfYWEJhST56QqzXTvReg3G5s=;
        b=ertM2+NdXxJd2x0C/ZD33+rtYIPr1w2FKiDkzHM9Sg/pHl1+21O3y4JS7KtH92kcKt
         hRVojESlsEo1m0MvINH3mVNhNEWyQlbfzUVMrU6saFxAL/F/0QfN1vlhvaD6xELtapwg
         L3GOnYYR56+H8I87uNfViWx99IbHUz+hBGkbocPlOiRlTq2dAQZNDZLXKAmT6wsSOSST
         28ZrO3SvV93WppJ1g93k5XkuqAkQXNDdHkvsueeMfC/8yJ5SbyENwdQQS6i34DsLofX6
         BxYSIKC11Z9Reg++FG0m22uPHHmRDGjhgb/p+/la09VMReznXd2W9bGwXWOs6Up6cdi7
         texw==
X-Forwarded-Encrypted: i=1; AKwUvByhgRpZvmbkabvKA8Uk7gwvc8Swe9Ha48LyB41agtPKYX6WxLTD6qv/Tf9HUG5oNs2vKUIHuZH7MzqdrE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqM63klnkp6r4OH+MGy43z+ZgDTe1au/XGqqS5io1hv6BSRLD8
	dKIdZlTHzKutmnkFD73R3yYhIEEuxjYKmfGvKqTPo4Xgky9dopV+K5fVcig9Gb6I
X-Gm-Gg: AYBFou1LWYMd5Bx4HhsiQddl76v4kPrQwg4wvfjYk+AxB8OlTgnxIyQQnOOl+DW+D0D
	xiEjleARK9KmI7UQ16HnMDxjxWMCjT8mpMAajuzp9AoWbK96L1mA//UWSUzIWBEm2gYyU5dJhNg
	zqYD6+/SNJYEPl2N6EMA8VXMuafGcnhthE67uSzbCebUGR7YivDOJvwpf5UkOPx0IlDE5h1CA58
	20j+BHOxIh2t5e4AQDykF+TPCmLeebIPonbsHrwZQpOGu0y1sZtFQTCQ+zDS4E7yNOoSlC6iitX
	Nu+3ks5SERvyiqV5KODGWlCHqoQRD4oY0DfWBv9dnePOV2o7crUPdvAj04DQjb3+oHD2OMI1TDv
	YpbNIO1h7qVvCba1cKmilu0Inu+vZNDRtdnZaKfJDxkbeyMQwLXOQfyWFIEFkzyuS9IoDk2bkzG
	qajYvSBApmAB0PY/0HJ+n/60Wwlznx510bcEELkD2Y5Iu69T2gkEp0VmXAccGFsfdamdcrAs/Ni
	tLd+uOSfLGs5dRSlF2mRWexZQH3DDGhOSTJXZi7KZc8Os3aqRGy6qjT800VA0jEAzKCRwHTOqdP
	NBVfST3Q7zvtRRZRQP5ZOC+wAptzaBlhbgAbtFLy/iQkU/o43re5w04r7V2FYw5Mfg==
X-Received: by 2002:a05:7022:170c:b0:145:287:ce91 with SMTP id a92af1059eb24-1ac59dd30ebmr14311461c88.14.1793592146946;
        Sun, 01 Nov 2026 20:02:26 -0800 (PST)
Received: from localhost (c-73-158-21-37.hsd1.ca.comcast.net. [73.158.21.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm50627159c88.10.2026.11.01.20.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 20:02:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 20:02:25 -0800
Message-Id: <DMKFCOLAMK3K.2N6KVW6P0RKDY@gmail.com>
Subject: [Question] Report at syzbot (ad6c1104e51702ef591b) - Intended
 Behaviour or Bug?
From: "Saad Varshani" <varshanisaad@gmail.com>
To: <kernelnewbies@kernelnewbies.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0

Hello,

I was investigating bug report ad6c1104e51702ef591b on syzbot, and came
to the conclusion that it is intended behaviour. The repro.c file was
calling ioctl with the cmd as FBIOPUT_VSCREENINFO with an invalid yres
(8) so the kernel was returning -EINVAL, from the function
fbcon_modechange_possible. I am wondering is this intended behaviour,
due to something happening on the user's end, or should it be something
be implemented as a fallback?

Thanks,
Saad Varshani
