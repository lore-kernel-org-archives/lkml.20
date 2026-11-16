Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837653;
	b=N0FYVPpC2cgOLTkk7R//F9kpGUqNPCKN6IFYerqWv+5NvyBki2pveKACdYfMqtQF/v4K
	 5fIpPmMTW6PuoF0VWwHbjC+QTkSVWfXjw+yjtXP4rYlytVGeNT7eUAfp02yIKEJ1MTBSx
	 vcEdDXPTM9vpw2dUhRQu6goDuA2Mf6RQqEVtFLjd/5VtYWewiuiKXrhD+OfFDwRxGodze
	 FS52u5HsFIu0bcTTSKOMoCbyl6gmSG6kG9ha3dgHPxt4hdwD5T9qFMuJ+KN3PP3MA8FCc
	 ayptjNqqntuVv21qoACjAbKlksFgdRllWWmPyofEDgYm6RDmhZdlgDfXgvImaFyqiGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=ZAOR+lk2/pJf/5IndYAATIOaw8Twq3Pu2XdQCK1sqcixrc2OXGW94Df1Lmf/4ZW3LIml
	 U78NGvNU+boPuwuEiznOE5ZJ+7xV29ZquaMyZNrGlLVGP5y7doO1SmMqn//E/Y19EfQ2t
	 rdubZT/sgxgRSAtlOkAGdP7Yxhvoa0zvcGWiK9c9QuSOWoB8ACsEgwiHeqqXNOjVoCskW
	 SsNv4StSrGskgddcRmGlbeOzquVPX0YMUs/HBLkPdSt8E0wRyHVWbpXR4h4AapEuaYSpO
	 FRqhHEMqfTKJ9fF5fY4sJODSZuGm7mPyHAGa1hSWL7sL1U+ZjzufS50OQFlPRgX9+rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SbKntM6h;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE7C606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE7C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SbKntM6h
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so6540047eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794837652; x=1795442452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=SbKntM6hmkycOhY3ZwGCYI02rg8UoN+cEm5PdhdrRa74JUmTMI64qv+bbBrnpe95FW
         mVIewRlkJ20frSiSkuaSi9tUEGKk4xxuc0pQp2MZQmmmHtJaYqzA3On2cvR0+FqtRXIz
         shcyKvEmk+PhBl3HmJfDy7qoenfKhzsEJtSbcPuDNDsZPlrgjhYhyLy6wAPvkbCf3Fr9
         xE8RjCAtxjDN6wMHUI+r0SteVLwiK184El8EqPHf69iv+7+B/R+HaZy7O/ZHkDiTKJI/
         lbFCngQB9e/SvL98CY1T7ftkUauaZ33zchHOPH8X1xNJaEBGgCU8V/97Rm6B6T05dhJG
         46wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837652; x=1795442452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=Zi6yBJf/SrHbWPe21aQsbe2gzVEwYMum5d0qr8IOstPbLaj9DI8Ptv0p2V4IyqdTDY
         GXVfzwzFdzh/wUToCapIbuuEk1Aa7hMX2t7GRVduoITXiKY+nrpHiEecnfM8GzmhSVkO
         SY/5pA8gKrwRXWtt+2kdOCGTUUQgspfy63VUw9SdCe6UsE9x3zI2UxvsdoKuo+z6fifM
         m9MJtOyDUCdjTnrcFBXSwOtHCQfBixQWirDqnULuTZBuDl3UDfaRFbKEcO0OjYYeGiow
         F3997tFvwkxvPbK4yB8risLRog3P+m2OqjfAg6TVrDoptj9AeN8oDjADVCNahGwjQzuH
         C/Pg==
X-Gm-Message-State: APuU4Z8PucVp8Lu3lZ6GaV5jyC+Djl9Gngd5Eha5MMUOaLaYUz9R95mt
	irEpmg01Czmdv0PVBPC39Te3iTJJalfH+AegEL7C/tEYtI+qV5N9vE+D
X-Gm-Gg: AZFdTZf/kuaaMTWioCmkfuLVDz6QdMx6AEw/6yr3Vf7rPenxFBgvVuYhYGwIvZ+8qOd
	oEsRJu+ran+XUaw4T3jYywYPhkW3GBkdmXPy6Sx0PdCo9qB8uoH6QBhEYAkiaAq55/hpg5r+My4
	v/P7kFHvUItvkb0UrdxkUE5dCUUXu74c4pKSExzAvq1SMJK5RhFugaS6ZHa3GXiwu8mN2woAQWj
	s38YgOddB1vi+zLFg0V2QG768cWXZpXZpYy+ByZO+m8oc1bz6DnKiVSu6wjl9D3jU9pyjkK9GXA
	ccXKMzcS/DfQMcPP0c00cJx+Te4GCXhu94s/+OO5IKHbmM5a3pvwonJKLE4rxwm/Clsw9NQR2vh
	QtNDLvQMQkRqIOFXodM0/Po5auyfOkU8OQVCCtRX/XTKVrNou4fGzktWOAaBoS3/V3OkaQkOmqP
	til3m4YMt/LYVevfYOpx/tUd7VpkwKiy+IgIQiqcvdQLAfJZb6sbTHuUolq9whxUVNaBqjgGn0j
	/t/woX66SbXI/ig8MyW1HIkh+c8c9c1IWEjd/UVbNO0CvVgIEGbRjWDgImCMpy7+kPcTqvxjai4
	8Zt3ofP6Cb3jt98/gAbGq+/MXuSHI41ChacPb0As4hA8BDdHtE0=
X-Received: by 2002:a05:7301:1a0b:b0:36c:9e26:88b6 with SMTP id 5a478bee46e88-37965ca86fcmr10517097eec.9.1794837651569;
        Mon, 16 Nov 2026 06:00:51 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm35118495eec.5.2026.11.16.06.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:00:50 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: compress: Set metadata_set only after successful callback
Date: Mon, 16 Nov 2026 13:59:51 +0000
Message-ID: <20261116135951.2607-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87ecclypxy.wl-tiwai@suse.de>
References: <87ecclypxy.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
