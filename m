Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131464;
	b=YZcsKjFsFBNfIWXslmuX2qsBLzOSKWjhycw/YBAtjKzde5RXKwROs7XV2TEnMd1k6wI3
	 CDRjmxzhEizs8x/rtUywIFPds0tWWyrqAIALRU85uBhQo+5uaONQ6E5PYWA7HIcMihQoX
	 lmZE/0odrl5Omxg9SwDvxAAlW8OBWsZ29EHj30iqWGp2MRaVlC2IMLegBtj5n4cdg1Pv/
	 m2QUIOO6YBleZvNr0D1wwgR5pxCthYjtFnJaJEBkaA1NdaA/kqgnzOFPQLQ+zt3Shm1yt
	 V3bKeDPBZpn3qrjBLl5fCa431HnOXWSb9tFmqbkzStsAuRMRiIxb211MYWDywATaEqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UJGPA+72p7Wv7RqTYja7FID1pyjvxUvI2bULs8oG6rw=;
	b=K50AL/RyE3gFKSSW4s5zPR5JBqZSZEdsqTQj0c4iAYJrL/mbNahGqSq1wGxc59uAsjPb
	 c0BpUrlXwP0DMC5v0IA+CrCIr1A2nZVlFtz915VAa6Hld5qlqkDAL0frZ5b6evHRLI1lE
	 AgUbO/aAnGYOLRGO++POUtOp8tHhTiCayrQW4LiLeN5JHM1jjCiscLGDDPs8mV5Zsnnji
	 6QK3yt4p/95Px8k+NlIksge3bjMhBt7kcECAK0vtvl/v3q70hUcyyk2HvqQNo8tAMcoLV
	 xf5BdllI8fIdXgrrMiht1UgpGmOcN/ah/xx2bj0RwX5lyNxfI7wTj8rL+qfb4dmHEPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z9MbatcP;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE49606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE49606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z9MbatcP
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14fc585291cso8127c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131463; x=1794736263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJGPA+72p7Wv7RqTYja7FID1pyjvxUvI2bULs8oG6rw=;
        b=z9MbatcPEUcQAq0qGZ3/s/lLzdadDxz0rHSeJTJAirBCt4/efSuPpRDBKz64qjvgy6
         hg9nAhwx9kXVEaKTEyafH6oAt5VAlQg9p7+j5r702RJXagJOxR9Ond2oSnqQpBgQ/J+/
         jfoF04bCfOhY0OfLmZ2a2leXB+oRcGrwGJYAw17hP9qvysOeyGDZIa8kba4mLbDkcXzp
         XVRBXQW0DBmY01Q9lnJrYgTg/tgybZ1WWtScTQ4CUtR/3h+74tixBOZzKGca3KkZcsD5
         c9k9p8X2ZY5kR35o72CCSjH142ql/yvekLGvmNzXvvtcSvc1wjdte15utVMB05GoDo4H
         fxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131463; x=1794736263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJGPA+72p7Wv7RqTYja7FID1pyjvxUvI2bULs8oG6rw=;
        b=1udQRk76QqXRqMhVwVPNnEsNXDgQsy4/Ay19FtgFzRNrFxz8jEnyIcRVfPuah1WSVs
         luaBrNMMgnn7AMA7D1KIRE22px4+mXuq+q6+k4PuTQjOHJcZkSK3XqZapWWVgwhuCQXe
         gkG43Botw3VxdOdfGlvgbCy0GcIwg3XJh5BgkhYB2djoAkMTF1UZj+fNLJTNwuXhWtxd
         QYNZd3WPEtwCmH7spR/CWP3N914s0QdAU+J6W7fgZJfyHDZ7hnwMI5kffwQoEa3G3OF7
         IPf56aB41vL34P4Ex8v+gZ8xAO1dXVGDwBPoyxwJB7m0QFBUHnKcc+0lJE1qvqgBvOyL
         FStQ==
X-Gm-Message-State: APuU4Z/hr7hDWto6wY0j1KgqlsOTJB7tx10H6k8E9kz26x8pD/cM1gMc
	LasdrKdRl5CtauEQVfU5gT1HnZf0OFOSocL2+KjSU5cP4qzGp0v9eUIi
X-Gm-Gg: AYBFou0IX1d4Lu+R82+eO8X7h7xc07roN2yRP8lfHUxo3YxUTkfGc7oE74SkG/OjZp8
	MYyYgx7NMSHAROMfn+gdxyJb/CiH0QEcqGl56xr9y+X1ycUxduYmdZ5DuetgTrnwbSvzTy8xjtS
	uVCVZVVgw2LgA8tQhcilNNqsE4FETVZPphMijhzgOx511MJysa8UT3qmEDM72DUtzvcpNGQYjRk
	975TnaF4bMIb1vWwkb9MpJBrO21BHVbJArOvYku8lKSg39AUFi3CkYcYhfr6b3B8UIkg1rIVSqw
	81xGlm6CcRQbvK5lNq6mCt75VAr/C3t47xWyrQgALAnNWG6+J5KVQ0BKZ7lxm06V0jyzR0DUEDO
	2JnvpJhx5yIDFU7/9DQkNShafu7pbQi1vVshMmRObd2LRus1J8eC7xfDzEJd8g5NQXtvG9qmk28
	l89xDPoZcPmsy5LxNUqfppEBld/1Ypr6VhzqyoT9i4pDJyq22fVnHlXs9BI8MLy8CjLbwtpXV6Y
	Is5ZUrGS8n5tYzNhA+edAlmMRmn9+8VOW3idrQeIRqBLRP6xYOg+3hYvdSOtF4l0lkrZ8pLRetu
	74kVfLFBXh3G+3WYuXMUTnv52ZkNRNjMasM3aBWB21VpWxJ04exttJ3NbkQhbkVEddvNp81B
X-Received: by 2002:a05:701b:2092:10b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1b39fea1ad2mr1810961c88.19.1794131463482;
        Sun, 08 Nov 2026 01:51:03 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm5076842c88.5.2026.11.08.01.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:51:03 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Synchronize LED mode accesses
Date: Sun,  8 Nov 2026 09:50:36 +0000
Message-ID: <20261108095036.3241-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87mrrkyc7i.wl-tiwai@suse.de>
References: <87mrrkyc7i.wl-tiwai@suse.de>
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

Hi Takashi,

I looked into using simple_strtoul(), but noticed that it is deprecated. 
kstrtoul() does not provide an end pointer either.

Would it be reasonable to retain the delimiter-first approach with 
kstrtouint(), as in v2?

Thanks,
Sreeraj
