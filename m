Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304642;
	b=ocQD7LLEBwzD5DjCTV+1gNta2bpMlBTcuAfN82WyEa/Zb/7uefb1L/lREF0HEAs2IMkH
	 Aa+z5VRi46NbjJsAuo7PAH1RYivUVwRdxB0x17dsqej4tdHuxqGQ/CCGtOdsJsVvijs1K
	 EFuaLGYRU+mz5cjcF4kIDs3jYtwxiYsxWAAYNTAT/y8Ck6UFFL5pdIniWTyQLAiAtu1ze
	 i/krYRuFhpwUouwkAxVPciETbwxPA+GNNpWHte33GaWglsD9Ui717V/8NH8eYK1atPEhP
	 jIAKu9og705xtPRJXEo0UqYSzGIaqNIDrsv3YGtFrctW7M5ErxGRKqnP91SKbe2LsNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tTHR38mY11B/5icwsExskzuyoZfY2wPwkj1B1V6Dev0=;
	b=pN7c9ReY8u227HBIb3RZbHGSBIewVHz/ntCgVSGotSF9bhn93Y1XaE0OsIX+Ad0p0GXE
	 3gcAjzfJy1EpbvyqOwozlFKrRSF1L6NF3mNuyv7Z1UVQpe6go6jr6bMmEpOcKeQVHIu25
	 GoUHSQWN2JXjwscLTm04ceVLQbXcJQKgiID+hFOJOClrJdRI+nskyEa84ylk2LeNcpDRu
	 kfb0e3HN9iROzKXBTqnJxBTlaOrBt8ivgFgUaPAGy/bT0PCaJALlRD10O92zHpwEWbh3U
	 wFUOFYBUCVdLJ/6cNSENEPCSMcS5rkLI1dbrbv8i5VDwNUkoJ65z5/aeEcMRMfUY3iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFgJWNQR;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A782D606A91F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A782D606A91F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFgJWNQR
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso765674f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304640; x=1794909440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTHR38mY11B/5icwsExskzuyoZfY2wPwkj1B1V6Dev0=;
        b=vFgJWNQRpY00BTiiT2wohK496Dl7MoSkYIsP3zKGk4yjycuur59e6oLavf43ykes8u
         ToLxr0/upin1AoCisw5nZTRQ1xutanrTyJyY2sBbJvYCaBmf46He36lIDdz5sE8xmWxp
         Mi8KqptNWHLf82kxBk/xG75ofy8BvA+ZjjxUrpV4DGSPMKTyjVtJv6UI8ASO2Jag54Ok
         HEmjUIG25liwvNWd1/zC3wDgK5ViE2myFVFvkvHKg12U0wa+I2aCaQQboH1V8sXhlOUP
         eyVNvn8lqgsTM/4xmk+Alx3Xbhp3FdkDMaU9kixCSSCwLuGqyJ/wYcEFRNEo3i+tqvZb
         iEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304640; x=1794909440;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tTHR38mY11B/5icwsExskzuyoZfY2wPwkj1B1V6Dev0=;
        b=nS7emr6OnRG4f3lmAlzP1AycrZBkADzlZMdekc77MUTALO2KW4aKvFrLVYJg449oqj
         BBSbetU8IYfxmGfUHxVO5KtWypcPR4+9/43LZSOPnfFS82cZmtj6oTU2UX5OF/mOGJcu
         PFSEwvRl5YtfjXubjtiRtEQLeivWc7yR7APGXvmzgxSRvIinDOb6kY6oI6BTZ/gdZPY/
         sy5t7thPAMePE+v+R9gsufFppKY0L0Z/Ec3+2Y3DYYFvWPVThoroEGoJ9x3yLg2kz2Uy
         omSatvBYFk8vcsQt7YItmLJVu/g0AHhPUY1uHgYnkuMcp4H6+oyKbfN5CNDtaM2jaz7j
         KA3A==
X-Forwarded-Encrypted: i=1; AL+hErFyE+mVqaNlb4Ht7a4vFuDl9SKRXlmEH/jsWiruOObyA8roWRj/jLYrs8I7FXCuPKNz4knAf7aGmVyf91U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3do420RzjnN+Pa4o+/2I+iYmRodCzgbLO9qTxG9icreiWGmde
	rycLBZMdZSMEEhpQrYSz4wMWJPA8GQUEHJzhdMyYU5Ay1rKZ5aePAzqD
X-Gm-Gg: AYBFou0C3NCnnMkhanrOxJedrXxDkatIbvAWKKqO6nqpDUstqq9TaIb7tzWfAaPXnLA
	wrDJZo0z88NflXIecgaNYuWWhtp7uu1dMeRO3SP0nZ/Muj2gzVHRE2Q2+tuDW5UuLyNOgrB9ZRf
	OXr3zvpO8PGHLCnCuAuC7Pw5Q+iiOCXQq4r0EDpZ5XrQ9sw1ZG5+Xmt8xjPnWxPIvFeS84jCSSw
	HQL5LJOATqEiUhwbzF791ijDtPbxV/MO3kfYcEMEnMN/brbzQPAQipk9HqSmTwDmx6kM9PcWU16
	Xr6qh05F4LqkPbIMabs18DTgy8YdjRrXuTjI6bJ78Vd0r40LauyOJTl1njUYTJOa9RocPd0JhW7
	KvdMLsA5pag9r3l502z0S9Ub6ZTNWZpFLOKei4hjw/u567sXxXRDY8F0wC0XvRxzWKoxn4rq433
	a+srr1UnMX1N5TvjHOgz0IufmpVd6/tq6nu1tdneS50HKzaC+9YBC4PgRv1Lrd8sWqSQPHr99B5
	oMUYnmeeX9rH8kNJP1zNFgmRPBE9y+3ncWSflG1yioShllBDrsvczx0lgHCknxisg9/eR1zSC5l
	WQ4cypv87tT1Q6LvUT7N+DtX2NdXWZn/barYzFDLSxo9mnRj3fcz6uxHa53/WQ==
X-Received: by 2002:a05:6000:4b06:b0:495:5c83:51bc with SMTP id ffacd0b85a97d-4982d13022fmr3778167f8f.5.1794304639745;
        Tue, 10 Nov 2026 01:57:19 -0800 (PST)
Received: from localhost (ip-94-113-240-150.net.vodafone.cz. [94.113.240.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm3841475f8f.29.2026.11.10.01.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:57:19 -0800 (PST)
Date: Tue, 10 Nov 2026 10:57:18 +0100
From: Jan Remes <ciakval@gmail.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-core: reset rtd->num_components after
 allocation
Message-ID: <avLqfsCe0eXV1hFe@mm-ntb-00805>
Mail-Followup-To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20261109102536.357134-1-ghidoliemanuele@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109102536.357134-1-ghidoliemanuele@gmail.com>

On Mon, 09 Nov 2026 11:25:20 +0100, Emanuele Ghidoli wrote:
> Reset num_components after the allocation.

The same regression hits Intel SOF/HDA: on a ThinkPad E16 Gen3 (Arrow
Lake, Core Ultra 7 255H, Conexant SN6140) no internal card is registered
on v7.4-rc2, with

  skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route ...
  Analog Playback and Capture: fail to add hda routes, ret -19

This also looks like the regression reported for Meteor Lake here:
https://lore.kernel.org/all/mAZY9HZuXAXUf7zv8tqXquMtquf7iW2CIZB7WhU-SnwWp-Rpr0e8yixTsb3lAeQsO64PwwWlOao8aMjQ4hTKOQ6grCiNmaWZmFRXMdPICD8=@proton.me/

With this patch on top of v7.4-rc2 the card is registered again: the
topology loads, and speaker, mics and HDMI outputs are back, with no
warnings in the log.

Tested-by: Jan Remes <ciakval@gmail.com>

Best regards,
  Jan
