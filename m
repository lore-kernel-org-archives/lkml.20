Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE852D1F44
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527009; cv=none; b=kNKEK958QMaLXw2tNXKGLn2hydSfDRPo7/4y8YHUt97ynK1IK40pH2/7/Mr7L85C/6ZMl2WKFW9rcpsR0CDYqbJ400hY+h9Z9QgRpjDEuvbY2zB6il+x6msjLq4NtmCm3b2VpAzgcJeT8DlRp7YweeJGpk65HzbbwK0gQiosBX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527009; c=relaxed/simple;
	bh=EoVmxPlvDSLv8qMbJW5aJY0ku0MjfA0utKXWMDjSjNE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KupcOjwvD0Yuc5+j6NmFkM+ywUtyiNI7YV3RWxWdD0kbRoNk5mwQIurZhrCUihIaA+/ai0W2ck0ICUMXc0TDqj2/yXU6KpKulB1USeUhcdmOS6ygSeUc+HazYoUcrWIOxk1PZnU5HpVLO/C4tNK5RPLxgKX0DYoWpz6s2NOEJwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0ue/P7m; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0ue/P7m"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4843e397f74so1194887f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527006; x=1789131806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fAzeAZ+MiP033Y7nFGVkOgPTbAdaeAlI54k0sa4zxbs=;
        b=b0ue/P7mNCajQfdBSvScFgm6TUUiLuzE4FgSPQrR+bv2p92ac0wdAbRkWjrVzUVyig
         PqlzAhKpbW5kFrtUE8vqiJzHoAEWZXuzkDDFEDCgt1aMAyysk/rFc2i119E1U53A/Mlj
         nx09tjg7l6N5H6UBjpfABzR69xuodNzIcWWKtEUe8h3IIr7eeieM2+I4se2rvJWQ/Ynb
         xKORmyr/E9OdtNmMACVLcBb1PbJUDCjswXpbv1kG42v6Mi2HG1cSAZHARmsqzgmKfsb2
         zEcMkrJV2h0hi6jssIqJtQMxlr98FZ5ScoTEUSWP6nmnwRvfNI2LyHup9DrIIU43Locc
         nwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527006; x=1789131806;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAzeAZ+MiP033Y7nFGVkOgPTbAdaeAlI54k0sa4zxbs=;
        b=QeonDRKlYzBqZ4D/3SZVlKceXzvJvJ1SJhrNfiTpmlGdpJ1mcm+E+XjAp8NykK7QaV
         EW7jEjPo7Ck7Wc/CHg0805TDde5tjqPtYUB2JrSJ35HnHoCd/cMNme2neXDjjIkwM8ch
         P5TcvIFk+O70ILRclJJh7HZKfigeGUbqGbGfxrijWkzB4p/4q3WfL+WQ+YDXvEkDxv+A
         +4mpEWMa1UL0rjgTsed/Oo8Vys5S/6s2WINEZzFRy6v5gjNuK5s+wn8IgEBB7tLtPe1H
         PfKl3OCN+WxyngCA6K22iqohv51edGkG4QH1L7ltzd4aO4FEZqEXqH4q1tVGePABrseb
         5J8g==
X-Forwarded-Encrypted: i=1; AKwUvBx3Epn1aodjneXsEdBLr5VhZkacFgFqewkHdLml7zr0nY7vCataoywZokCl89PODD1DwB76HeXxIg+M+m4=@vger.kernel.org
X-Gm-Message-State: AFuF++kaNr+gyMoW0a28lZeAl2u7MSl+XIzVMKMXfC4eQdb9UIlJKePZ
	NaFrLalMQ6f1Kmznn7+dME65Ri4PvEhoB8k6V8ppD34D2aFHstwfO9q0
X-Gm-Gg: AYBFou3wQuiq/bu9CJHG7uRUMeiz43V/IfLvwp+KcDV01APLpzZuxTFWs89v8ABS0Dj
	aYDdCpJaYQIR7yPuMRycuKSMzdFldoXI2IkQW2ZnhzNJ5+IfF/C80yqfEiIr/etucZxh+qs38A8
	4Mus4LrWq5JjYK2tRLkctlFeHdxi1suHtRFHd+4TvmxBZL0aX4tyZIb8yHJZ0Nlgo9aY/qk1y7D
	CEVeaEwBJaZU0BgIUWPItxdonS9mfIMFvKbRr0KcUfyNJ0QIKed8m64KkHlQ4veEo92tBDqsnpp
	+BDKNJ1lP7TbLm8wj/ScShOlRziMUGJZn78dygXswaACp5KoDwxgpzqvro4hc9zUSA1nMBwAM+h
	aBRTiq2gIEoqFNrkYAmeKgKAh0TtpTCii7coPWgrk9uTX5/zNegeXOSJniOSDJYdwsHSv5ZCKCd
	XzkAm1N/yfSC5LyqI93qLJC+fxEMuTsSse3/YVb9XqI1EG2r4woXhJopAO/gUY/S8MrvAEt/UE2
	zgjFSG6cHpvUpyoNrwL42BDcHCdWiAPqZ9AA9KdTPEp7g6BRwHo7DwcKQAI9jvo+eCLUTnz1et+
	JnAFTAYh8xmrlDHs4BrXpMd6lPwxx+MlByc1NfmG8wpggiTnShmZkEKtuTYXyL8jhD1Uk51tkde
	tln5ZaLcWthcXLz8acsr9QcqbS82uznUn8xdrzexu702VooI35V4kx9H94pZG41N2FZlBnw==
X-Received: by 2002:a05:6000:2487:b0:485:8639:d58e with SMTP id ffacd0b85a97d-485891e752amr5013026f8f.8.1788527005575;
        Fri, 04 Sep 2026 06:03:25 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm6679927f8f.10.2026.09.04.06.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:03:25 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:03:24 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Tuna" <tuna@tunakilic.com>
Cc: <jic23@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iio: dac: mcp47a1: Allow full-scale output
Message-ID: <20260904150324.000034f2@gmail.com>
In-Reply-To: <1788525776688344002.1788525776@tunakilic.com>
References: <20260904122513.175298-1-tuna@tunakilic.com>
	<20260904143848.00000d7d@gmail.com>
	<1788525776688344002.1788525776@tunakilic.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  4 Sep 2026 12:43:04 +0000 (UTC)
"Tuna" <tuna@tunakilic.com> wrote:

> I noticed it while reviewing the driver's range handling and then compared it with the MCP47A1 datasheet. AI was used as an aid during the analysis, but I manually verified the datasheet values, in_range() semantics, and the final patch before sending it.
> 
> I don't have MCP47A1 hardware available, so the testing was limited to build and static checks.
> 

Okay, that's fine, I have the hardware so I will test it.

Also, please don't top-post (inline comments are preferred) and please
wrap your lines to ~75 characters.

Thanks.

-- 
Kind regards,
Joshua Crofts
