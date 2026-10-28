Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154182;
	b=DPtrAZafiK9kVvwy67Fx1xzD5zwEeMTZ4SQ0+y3jfdXkvnhFMD9ID5hHGaHYADxRw2gQ
	 ttDcGC/VNonnImlNkZ/2SEW542lgN7VZg8CDEgoa9X3JeHyTOp59+nKJ/9cU1KFnE5vj9
	 t/4P4RM0kIFZGAajibHR7zS2VtpaaRZ2+d3m1JWlzyEH5ASW0kIdBXICGZhLvPQUTmI5u
	 DzNK/qCjJ6MgwbhF9f/jAwyOcjVhnbbiyp37BujOFgJzEIc8GUJw6a5+KZMSWGv6c1Q3F
	 D2Y9Q4K1H/ID5TiRIR5UR/2wJk0vU2YIHX1tLlCkdR592w27ad1T+iOlzGAaum54+Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g0KBJHkcotWZ5pbwfJssjN2rt/eD5H7NBoxiLo804zM=;
	b=t95PWNBg/xsJH/wsmWu9NkkQXDzHbvGeF6lDnV2iEQeG1BHAcl0Q+MCDT33oqRMGJOdg
	 zZmQwbawilq4Tr1+I3wPQdsmGXVIMukJavqsYJBi30SIdM+/oVw4bjq9fZ2dcMwlvLJyw
	 epZThWXTYcOCNo22CvGrPhE5+LJzRT6UCcCZejhW8Qa0LSBhSikmbZWtv+7xvLnZAo7x7
	 d0H8corNPuMH5C9X89p22XH1kYU9RgAaH5yhkqwcpD3fL7boUirDWCZNLuYgr1cUhA+Q8
	 V+9QlffxO0OLxU0M9Q0TTlbxI0OqX6J8rN5VmZcBjPL8IpwUFNnCroeMBquEh5A0Msg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X0vXpkTn;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4232606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4232606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X0vXpkTn
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7cc013095d4so149244137.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154181; x=1793758981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0KBJHkcotWZ5pbwfJssjN2rt/eD5H7NBoxiLo804zM=;
        b=X0vXpkTncO0c24ApbUJZYem4GIl8iQWduK/bkG26GR/UO7EXmUkft+ww1Tb75uaqcg
         fRDfq3P5noIcxXovYJO0g/h3oyY2Hh64kGK5itnmtsyyJ0qv6nS1ueBTjYKFwkeSxPXH
         NLattyYQ8cfA2i8ISYabPgyNybVL2Fyq41JoW+Hy2tq5nQli3KvNNo8a8eMbEJO5B1+i
         srMKZT7AIVHCgryI9mNjOGC2FZuD+NlME1j3APWs62uLEheQ8/aB0Ex50U4uxoiSJLUX
         6HpHaRh0ZQnxw1ykxtaS7M4SEO/RKhbLxIlQhytiGFJiyuukg30bxOpRazyZg860/Vq8
         G80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154181; x=1793758981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0KBJHkcotWZ5pbwfJssjN2rt/eD5H7NBoxiLo804zM=;
        b=YdSdD3GKpmBTIOLqg/c2opqPLs8OgHOp/fY3tTyH0RgVCgWSscEE+Vqx4TyT+RVFhS
         NLcBFOqnGf4XD8BQbkoVTItttYMEcJFpy395n0xMfoOuBG3BumcNseMluDG9a5ncxzU/
         5NdLF+YPQjH4H4HJ1MRVNxdW/s35Q25aD+RWD9MOuRKa4ifaSEvchmKrMPvNGd7Gfl9A
         t+PNh+3+wL49l9NHYxfNcZ+vsM8LX0EK3IlCbM/jeKZiAFfQ4aMBH5/7E89izEyw2YOA
         f1Fy+TgwjaIPQm+WEpVYQ5JLLOpfzn5128gR2un7p5JH0dPA/rlfUXBdFtMVSgJ4lAQN
         o8Ng==
X-Forwarded-Encrypted: i=1; AKwUvBydKX2LPqJKFoIMUBitTFTc66He0YAUH01KKxKLuZIS+Kv5wVqrUvlUrp0AIexkxKiA7fDKh+Q661K165Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHOoMi+T73nNyFtX8kIq+ioU244QEn79V88Ic28tpQj4b+q6C5
	H0JVfm9dDlXp+AYNZjVLkwNSD+Xkdqtm0MSFazPEiPdZ2Aux+6Qw03/6
X-Gm-Gg: AYBFou1OuevaeJU7ncK6ue8b3CfJbOwtKHmmimyo+rI77V2V5DDZfoBl1wbCUxCDfxk
	BekSrN5FTypCNxkW2iU/2Phc+SmgdJQ6tFMX7wAaQOcbbRJ6A1q5ivqfcjl9MnqSRXCl0MeEMf0
	PDLGziHgmfL679ZxCYxnyPTpUi8PbrRBTToiNwYh0x6rmlYeGGL12CUOFnQJ4r+E/LzNkVBBrGs
	85uJLp7ksSglJOuQECgjulI/j9MxVHlVdI7mjoqA3pMkzW6NnxJhakKMDpShwR3mGcNoWIrbPw/
	BpFC4/vLIhti9tf4e8+mjxngRrZ4+tmXYYYqcHB5SntInoZ7kJOTdX5zCbnYt73Tl1klZSMISzX
	WdckJN3yEBwJInUq8hYutY3fhYZ2oFKcm3rH7Pi/mQl8fpQe8nmNKo9qPBt2dEFAh0n2GhhaB55
	agFvcAYnDl3/ljsK8oD0bW8UkZcFVG/5rrUVN6Z8qfALSqSKiJgASyzERmvfPUO5I16G48cL3wN
	MzsXgXrktZh67CRxaEKQGVtl5+vAXIJro81H8/C/zaoUHWtD4RxAsSHu3NXfdxfwVDt3sJZ9pDf
	5Z0+a4VjdpKUo7pK75OKmPAaZn8hUTunOLVYxDNwKZI5X8zO9zOw
X-Received: by 2002:a05:6102:1626:b0:7cc:2bb7:131d with SMTP id ada2fe7eead31-7d03a4eabe3mr460742137.9.1793154180806;
        Tue, 27 Oct 2026 19:23:00 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:4df:52dc:4559:394e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f8e0327sm414520e0c.4.2026.10.27.19.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:22:59 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] iio: adc: ti-ads1298: prepare for more chip families
Date: Tue, 27 Oct 2026 23:22:52 -0300
Message-ID: <20261028022252.30530-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <at5mQNfPsoQFyraj@ashevche-desk.local>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com> <20261024231335.280955-5-stephanbrrs8@gmail.com> <at5mQNfPsoQFyraj@ashevche-desk.local>
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

On Sun, Oct 25, 2026 at 10:27:44PM +0200, Andy Shevchenko wrote:
> > +		*val = regval & ADS1298_MASK_CONFIG3_VREF_4V ?
> > +		       ADS1298_VREF_4V_MV : info->vref_mv;
>
> Can't we assign the default and always use info->vref_mV here?

Yes. The ADS129x has two internal references (2.4 V, or 4 V with
VREF_4V) and the ADS1299 one (4.5 V). In v3 init chooses the reference
once and keeps it, and read_raw only uses it.

> I think this patch is overloaded. You need to split it to a series (to make
> chip_info a separate preparatory change, for example).

Agreed, Jonathan asked for it too. chip_info becomes its own
preparatory patch. The _mV names, pahole, MICRO / MILLI, -ENODATA and
the single line: will do.

Thanks,
Stephan
