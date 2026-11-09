Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207920;
	b=40hw8/wFLrZVhbzF3P8Ji2LFFxrbcFhGfRs1WKI3Of3LZyC+3XnoW0HyKTKYv0rqn7kp
	 65t/Q2wZJMXRRNXivrgYZGE8iTqwMSaQSWd+pugOqeQ2yxBpuddBizaYKjDkBgiiD82+h
	 kJULG1o7NHW35Tp0A1A1wN1CPTCyTLfjBrC7shVPWhzZrRv/AcgXomNATbhPf/n689+Ir
	 cFRQca11hP21V0LxyOF92w4EL1DSEM/DcV3ttqrZlYPtr9DnOgn2BftJ9ryYJg6XAXUrS
	 OyzkMPbcd3RkvldSmUSFEM9HKnHhtzq6K2UrIZyNzBZCh8mTXYONK/1u+gZ1CMf+fSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=78AHM0eWQcECUUXYNy5GCd5KtV2VlLS3AoOx+2YvwDg=;
	b=Jb0MoDlnZkf4FwVVN8cQrwWYJkN92IYpoWZqS87ym96vQOIpZLEBmn9iTXHK6u5uj5XO
	 vnGrqYKlEy8bn+SnzEMnhmcML//rIHV4eJ6BW/vbVmBdFQkOZhHjaYYnh2z7t5eO6smu7
	 ZiDsK65DtWi2j+9SF9F1jGgoEpO09sjM+mXLCTP6lpEnjxt0gbQN8vTtpxDLCzDGVgSTF
	 OMjJkv90KhsFsxN/zlCWTN+GmjSMLUK65iaNCoHf+A/I17dEAa97pWSKuYwZ7A1tJbs83
	 l6vwhTGKHHrkY24xD3wZvEq51abWQU1tb3eHAWvrEIBPKDVwwuidsPOH7xbcZd0Zh6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UqoL0y6+;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760B0606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760B0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UqoL0y6+
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so611240c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207918; x=1794812718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=78AHM0eWQcECUUXYNy5GCd5KtV2VlLS3AoOx+2YvwDg=;
        b=UqoL0y6+R+/1sn9BOeneQyCLbjf1I/wFn967LHemkR5iyeU825+Ze0n2BNEg0/4x5F
         pyHu83063E37xvcMo75oCV/XWe7qCk8q9L1Jz+B0kXwvbsL3ovdpG6PbisOATW0Zl8j+
         gVHfqoJOundl9yBLbJVNMDNZop1S4J8AH1oMu9gBnxU1gaYCyCqeYTzgNYmSmeQptT3D
         fiKl/HBQNX2SIIzkjfQbXig5HcZcOak4l3on7All4M0Jll5jwRWVCPgyAXaSXDtlkHhq
         iPO8hV/Ju/BCwoAd0XBP5YntNG//imHz+yPR/eaAXtDWQUiB3iVtoqt5nsPrekXfPjmX
         ykTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207918; x=1794812718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78AHM0eWQcECUUXYNy5GCd5KtV2VlLS3AoOx+2YvwDg=;
        b=JlMGz8r9eMs4ELcdHvVRzVw6LKlrrfd6SLBEB7IEyy8JOph+1SAlM7bjMG1tRPiS6m
         XL7W/CWgxPrlUjBHrduNLa8ZYvHf1E33tiDcxnV/Opu7G/34jblyf/74+YjLOMIJUHjM
         xghrxk3exQVLOemqmPU9pT8q9KJdV+euaAsb+Nl+lD2hce8evk5MGvVYrbQP7AS2wWea
         DWlCYopdxYgNJxwjv6hPhKqWcWD3a0SLy8FB6eV8oCIYdd2mKyYELSPpu6HVCu2bmJ05
         5FnX4XdTj/2IEsOADXJ5C1w9MCNjYhLWUjgpiu4zwNWO8eLMlOCFnHpUInoXpHZ2aiGN
         JA3A==
X-Forwarded-Encrypted: i=1; AL+hErGiEppMf68qXxGf24YJTnXrZOHyXGD1mo/2O+iD88Cwa7SPoUt0hEivOBaz5WQbhO7CDrTDNFlwa+a6o2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/M5N6LtL2UiR+Dum4TguziTeC93/Irj/1S934l355jtXXZwpDI
	hkTUow/EL11D0mRJNp+ASjSusgsPbeg3pKKoC1ETUSi/L2uQ4/F7LM0D
X-Gm-Gg: AYBFou3RywWjYd2T1ssrHwqM4l+pXcpP44TwTmTwJpHoRdP6xLpn6I+uXOJ0/XriGao
	Ubz3W7S8Wn6QQ6orNYS8ABu1rH6DJRlXjA69m5h3r9hSpaiuEgifiKzMYDQ7wIrPOI6wOGOGIic
	ckbsupjpQlVdHGMcyK7d+0Ojdy7OBGAdkqepdBnvAvnxkZhrmvlpk1zSBXY6GgiZit72NRVyWEy
	iFX+T0zfVth2r4Jv5Ro4LbVNVyR6gApYKWQtfnTxNLz5iSXkcc3z2iglHG64QNZRyEsYAHMFtKx
	QjWXz3PEgWqr3idQv6dX74dPe5cMmyFMQXJOlJhjTsuACUcvFi8JLknJhJ719OnrTIBk4LEWpNZ
	xJhRhkSzRVvSgp3zRBAe+l2rv/fC5KISKWLHbEzNmMdgW6RCI5NSpUDBqHRMcVfH/hxB7I9xDoS
	EbW79OSa54uyzLwXlKjwbV5LBVkauJLi28HXz8vM3YFMIe6MlsMsJVSBWZsgMhJ92pZ3L2WU7fX
	GmVsQH7VL8ytEI/Ld/xhbc+0tX4ALvbrmdvLA7KPXJPcP/zzfyGxJYhgqldg/8pEyvZENxgXrP7
	qBdEnrKkkShiUTQmMDYVJcFA1wyjTcE6L4qSjl6AEOMVRKukDWPuNlgcOu4bY4nbQ5ND
X-Received: by 2002:a05:701b:4211:20b0:1a4:9eaa:d01d with SMTP id a92af1059eb24-1b39ff16f25mr5285894c88.45.1794207918345;
        Sun, 08 Nov 2026 23:05:18 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771fa200sm10317466c88.22.2026.11.08.23.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:05:17 -0800 (PST)
Date: Sun, 8 Nov 2026 23:05:14 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: bartosz.golaszewski@oss.qualcomm.com, arnd@arndb.de, 
	marco.crivellari@suse.com, tony@atomide.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH v2] Input: gpio-keys - do not BUG() on requested wakeirqs
Message-ID: <avFwp6UA9QN43geY@google.com>
References: <20261107104807.54410-1-andreas@kemnade.info>
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
In-Reply-To: <20261107104807.54410-1-andreas@kemnade.info>

On Sat, Nov 07, 2026 at 11:48:07AM +0100, Andreas Kemnade wrote:
> Having the IRQ handler called when enabled IRQs arrive should be considered
> as a feature not as a bug. So do not BUG() there when this happens.
> Also BUG() is too harsh here.
> 
> Fixes: 3717194f24922 ("Input: gpio-keys - add system suspend support for dedicated wakeirqs")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applied, thank you.

-- 
Dmitry
