Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600140;
	b=33yr+ADYD6Vpfs4+XRRxS6vrGS8pmp3RDh2q6E6ry7iXVfhR2N5UpXPwerubuFvOnpXn
	 jdOL+KvKwh1xZOm4JnPxxrupIRqYJkJhnGgdQgAWr2k0RzILQNsCefDkAiPumRtbyQ2wv
	 XA8WkCskdbTI8/D5bdfeOltRRW3HA7UlnlpHtX5tLr4xw+wS6SmvU3vcYviFkhKVFrD/n
	 Q3UfZ14Z5R6DaUWfwZBdjLpeLk8uwFjgjUOwGxGVcVwovmnQHTxtGIZY8qAgyDb+akhoc
	 IJwbNFih8deZxaiF1Oep2QWIZh9t1IrU3kTpsyZIXVlT+YIpx+qxBzsoofpRjx/UsNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600140;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ftLGNIEMed5JUTDYLuZhEChOGJfoU58LD9PZZL0hGOE=;
	b=m3mDgNv1rEsXc5cJ0Opc8q6QvdoSWD/ZfWxXBXJBUXiv5hPIofUBbTAeRxMo3UQLN96F
	 UyViyszS3tNdTzfJF9GAwnRl1xOPtJipa6pHnniJR2FYo5NIhOK2YFjz7HOldHcqlXtKe
	 3LOE9vvrUy7GbHofulj+FmSrZBTrNgAwaqX0gwWLQ6big0ldrT09NlW3jhrQZpsVfgoG1
	 OJipgsIhGOlvVuL1CVQ3JXq8oNFAoY06iKhlrgjtYldzc8Q/UUU1XRVKV7IeoYwrY1Zzg
	 GKrcizj7QW0K6Cvjny7m6QlcyMFW7VHGOoboKzWRvPh6K7j8IkHh0E+igJvK1km19VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC26606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC26606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b3b57a31f7so12851297b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600139; x=1795204939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ftLGNIEMed5JUTDYLuZhEChOGJfoU58LD9PZZL0hGOE=;
        b=V+bXiST8WFiJauDah2ZvihpokmYGBGgHbFwE4Pcd8VDQm22wuD2oszYXYIzkRlybo0
         INB3sFkI88FJWQF/LcyIkRHJHPDY6D6sKkIkjUCGWvPhfqZ5kLD70VR+j/v5VEmsUipZ
         MEQzJOeJK25SMdvVqyS211ZRXRJWNSo+TR0CkneAR1MXstCYYLc8osMPElbrp3deTA18
         mxubnnGY+Ya7mHkQfLjtBqbvrQjzw/EO9XhWkCDuWWoFy4Rz7CQw3XXcdyODE8GnaHLA
         66hT+xz/tj+Grkr63j7IzocL22dtPrEoiJ7V98TmYq14vFmW8nelAMAqHVmMdAnf5vnO
         +5gw==
X-Forwarded-Encrypted: i=1; AL+hErEYKIX7TVHVywDWUWT4MPQ1aeQNNslCpl//wkqHn5Et4cSGg4WWeu0sPiB/msvOKoMP71I3vxFWAiksETI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+bbVQI7yL6y+abcx10wuwozK5fIkbtnKAibS+XEVTvZE2H5S1
	yZb1zJM7HZc9xGina8vSP8wKoMlkLtQoPzAZtZBRNYToqsEeFZ4MXwMy
X-Gm-Gg: AYBFou0ENcjki5wTkdxQpApc9Avi9P2xqvXsyZZK4UiZX7jkr9v2y6Y16VzRF5JhEF0
	cfc5Q5r4prMaZ0xwzN+R7n9zvhq5FEfrQAElPMZ9t+zTqdHtjQNBfnUUdKy8TLAKwkzVcfx9RFd
	prosjXip7lkrmPFMYhkoHwQ0BteroePomO9nU7KQEXIQAozOqO4NHN1LKlKtVBfcYk9bWUxGkm8
	DcQw52/PT026Nwrosdogd8HvHEMRRvgeit92Jc9c1DMI80QVlZkwhzYMQm1YYCFdBWWVrAZkTZ6
	585OIW3KG3Vn/DQh0XnWzdIyafuT4NFmmIn7tso1r5EAuQSlFfB56CzBPViULbl/RrPXPZpDJaQ
	JezwTy0LStpfjD3bWSFZACSOilAiOyzd6pd91lab6AHpwohD+07ISTCcIni/gF8Javo9OoLy/KQ
	i+2qkTShb+7Xte8f8tA3V8RdGzLhf2zFxBCufSN2GVpoeBWXgjc/ZXsWhu46n57Yq7/yCgwDgri
	U0tDYMKUeTgRRFT1FhMGdlCtR58STvuw+d8Ysn/vGWZTtNicl/xCm1YWc4vvGyyTdjT06D5Vnhc
	kRTR8gTUv7hz4KZIqvsdOXvkDmrgVwXPDGpb2HXuc1FARS3oECZp2WHghkqNXU3riqqO1fpmWIb
	q+HRgJvH2hsvzSWq72fnoNmjUU+b6Yy0=
X-Received: by 2002:a05:690c:a:b0:8b1:70be:d4d0 with SMTP id 00721157ae682-8b4aa25cd42mr23621487b3.48.1794600138833;
        Fri, 13 Nov 2026 12:02:18 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9da90bsm28205227b3.37.2026.11.13.12.02.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Nov 2026 12:02:18 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: dri-devel@lists.freedesktop.org
Cc: patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com,
	frank.binns@imgtec.com,
	imagination@lists.freedesktop.org,
	operatingsystemsdepression@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 00/13] drm/powervr_sgx: Add a DRM driver for PowerVR SGX5xx GPUs
Date: Fri, 13 Nov 2026 15:02:16 -0500
Message-ID: <20261113200216.82392-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
References: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
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

The Mesa side is now up as a draft merge request, for review alongside
this series:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/46286

Joseph
