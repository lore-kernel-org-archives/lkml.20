Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831713;
	b=48gdTMKIWL8krpehGsYIRQqF/mFIf4JFK8d9RCbwbauXA3k8gF5BqVGXnVuU8u4G9cVd
	 ZGj/YCeauvfwlbO7rjXJpIwsQ30V+d9srk7Xj68BEhoF3laoccjSDeVZMq3iB0oCPyTcF
	 t/jLXKnfiHpjpgAzTu6yMPbeMD4EgUNCeZ7uVHbArpoc3LOGKCG67XNyWF7IiROOzBLQD
	 m5UJm9DXZqkZKnZArQBk/KTn6hkbSHAK5Tq8OSVekxgHjSpw1rkveyGPx0PGE67/Mwkig
	 /oEF16NBx+4dcETVbXfTTw2XnuuAyMkg2RwXt0c/kZqAssvjMWaScCw/6/C/UAjTV3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pnukD5Gp8r3cGqp/DzD0BlhAA3pMyd935F8TwUbU19M=;
	b=HlGokEfu3G2lqfRn226IiPwhfLk7NhQLudbNaAJr9r8hRFDsrMy0gHp/e68H0c6lE6Hy
	 D8acmPKjea4jtFp/wvUmktALqegO0NFcVyiUmBkTUNE2E/+3YEBlQFlMfyJOTocvEMKp8
	 ma2zv8etqQDVOoZwMey6G/hnLgbaihKETuIc73DMTv9NVqxFdF19Rkl//8MQOR57P+xRm
	 kV9f0pjPgQWBR7XnEpazwHO+1qPYgjP+09jvnux2Q/f6JlffnJtJFTOphhbTQTfNq6vhl
	 DHqYIkHzdBIv7m44zoTRki/XLHsY/pKgWDZ/MZuCEShIJcPZm8MkTUHnpMK+zKnFfgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vBqiG7j5;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00821606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00821606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vBqiG7j5
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b37951a397so1301538a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831712; x=1795436512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pnukD5Gp8r3cGqp/DzD0BlhAA3pMyd935F8TwUbU19M=;
        b=vBqiG7j5LYtvzKTQ29SWn+EWvvPQcm9CJ4WsIRgxoBw2BYfaZO+Egfb3S5ES0puBek
         8ELzRtxFZNxjrtkaXMFU/s2xjvFvioT5evGGkWZOMMZbERdHOE96AIM3u/HWHlzi5t1p
         OBvhSsvWR2kVtxTARcRdTTViNKuE+9LQ/2ASl8Vv3jgy9gZd1BBTE2v6zwY82iJjRejp
         iDXURb4XPdRWBf/3iIA85z5fPOmUfuokOYIaDs1tNenh0hu+4VSfuGz9sUfnnXZ9TuuZ
         Je92lyOXih+Dhyld395YoHjVHGgNJS7obUeVuFlUm/BR8Y1GMB52bcROxS3KpffV0564
         +XOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831712; x=1795436512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnukD5Gp8r3cGqp/DzD0BlhAA3pMyd935F8TwUbU19M=;
        b=ev3SM0EsAVBhLBsKgWodTymoMzn0YYVHaLfG1T1J9grwLkHQRpNX1hxMBNsPV/c8wr
         zRn9ihyyNm58NpTXTpLY31Jy5Gls3iWiBQVrfrSPMo66BNoK+2xgadWl7M8/+IeDTzd2
         41spbqO54/7GuXezFTjFi+9r7zgQeEU2zL5rY4nM9r8AMKXVNHifrJA+Qr9eLWBpWsz1
         /2eS0yV+dIOreM2a4/z9H7wx/KxnizDL1HKSY524FFnW+6I451JZvkDiSGgCkjUTd5Q+
         vSbl7Sa8Lk8L2ZgPSuwWYPaF6nEN3SZ28rkaPditoZXm56IjfyPH7yyUDeshgoc1d6tI
         gP3A==
X-Forwarded-Encrypted: i=1; AL+hErGPnLFEbFMibHcV7yfJU3npTVCxiC7JKePNG0Kwn8/4QOt729/AmyQyVeyJIAr9sZjXqJRZ07KTL7R4nmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k+INUCRAFpZTobFbStUQC9/Hxxcc4l1kWKOaZogZVfqYBr/Vf
	Srqxsjcv2BlNVkF/ct+h02D6HrIn7fEiYqhHrQOZVghdk7OjOeGX72Ju
X-Gm-Gg: AZFdTZeEzDCBDDceb4mxMLV9h4pCvdBHjzhQqhnONXos8XilfD0FeS9YsIRxC55QJ4m
	t5EDWDy3QlQokXc5mTsnlV4rEreIB4eop+m/tPCXDnG+3tbrktUYQjOZQtGEKHxrk5wCkEExE54
	bGOHMN0RumSnxSam2kP6ZQ9Yr2grTMxz/SBP1Zb4pt24Hx0DPKsOOGFTQbZnY/ev+q+SaE9Z2In
	XPQ0uABMhq64aOALVG+N2jxM8sdSCndqnSHwkFdBMVP5csyWIKrRrsgXTWeGzXcJ3UktEVUuiHK
	+Q8NmDNqmjc8x53cahq7Pd2naC59dXg88lS3Jt9QJ9j8riDZOLJlAQjQb98gcVlSeE2m67YBtW0
	D5dmwTF7qtAL/NP9jcY3RlAdDr/kdxXCR2Ob6Py4GcGqZO5lfAgPM2/ycny7amcuwJglj98ZyY+
	anUS0EP5sX01svaekUUdsYP/oLD4D1exkk6h71UE8W932Fxf+bIZ0UC0rdP6i3JOb6n2slmLP5o
	USa6Eu1jve2RWJ354XIUxpFGLg7uQE8zUorgvhcq33r5dJ7Kzxsv7yx7RaylEHG1g58pWjo7zlq
	MRi/J21Bn1qppKwaLQPklbCMo+LlyR+qq+aJ2btb5mMHQNrS8lBB0IvBKfmhES4VWF8=
X-Received: by 2002:a17:90b:5105:b0:3b0:d0c5:c10e with SMTP id 98e67ed59e1d1-3b1b0b546f7mr10545284a91.17.1794831712180;
        Mon, 16 Nov 2026 04:21:52 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76745sm17820907a91.16.2026.11.16.04.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:21:51 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: ebiggers@kernel.org,
	andrealmeid@igalia.com,
	qkrwngud825@gmail.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [RFC PATCH] f2fs: fold casefolded names of F2FS_NAME_LEN bytes
Date: Mon, 16 Nov 2026 20:21:46 +0800
Message-ID: <20261116122146.2616475-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103030712.1514800-1-zhanxusheng1024@gmail.com>
References: <20261103030712.1514800-1-zhanxusheng1024@gmail.com>
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

Hi Jaegeuk, Chao,

Gentle ping.  The open question is the hash change: a new entry for
such a name is hashed by its folded form, so a kernel without this
patch cannot find it ("back on the current kernel" above).  Is that
acceptable?

Thanks,
Zhan Xusheng
