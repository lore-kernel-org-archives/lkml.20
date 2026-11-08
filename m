Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794119605;
	b=TBu1nPDSmSBc5QatISPAPSbs+nomVTTMLZTZeh2we2+jnZAPpE3/cQesqaASZjYdhH5W
	 iJavRQLyHT5F0N6Jiwbs+3V49ZYQzBhqrz+2Bn+Qx2xWyMMz84g6GLUyaDxIseEc2G4t3
	 +DzDIKri5ANgX8aWOG47jI5hhTL3x9zZyA2r0l5YCl1S6Pr9Roj5Mm3bld2m9k2AE+02m
	 pS4hxpmJq4G6g5HCs+BxdQhPk8CzCh+jG+fpZviU7rOZPRDSbsXyy3zYCZXsxxJnxyA1i
	 +eqdTPZ1sPxCTidx+dIgK3TnhlJT9+jlqToGwWwtQQlqf8OB037cv4D4In0DvXI31gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794119605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7tw1+OakpoH9nv5oeIcEeSnu2yq2xP4kxsGUVLSS30s=;
	b=ywConL9kt0e0rGY5/wDJaW+0h8Xu2tieFTLPEBMtBja29U+3VRWI4P0urMy/uU7TF3TS
	 uDq6Kv/CfDAQFQatBrdtGtBqUT1SH23XKHa1IdS31oxw9jTSHw9Qhpsqs7J9V+uz4SrCJ
	 lRhOQ/KEjVF/Kz0TKZpnWZSKHZBk83lH74b4wDuqSrCIfwI2PSvVJlZJCT3Jh6yL8ZAwb
	 CBunut0Pw1rIHMeGIiKMLHua3h+nretJIaAiJsqz4wh+PKGiGozy4uFFXKgrhOpVV2Ymt
	 ZtBdKZRYtmxlkFaGDYqEtNCjf+DoPl0k1SwuR/7Mv4ow7POUBhkjg5F2SHAUXZwnIhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfwogyhf;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDFC606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 06:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEDFC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfwogyhf
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a315ed211so262287eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 22:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794119604; x=1794724404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7tw1+OakpoH9nv5oeIcEeSnu2yq2xP4kxsGUVLSS30s=;
        b=nfwogyhfxYMzhIdJgftuvaUAywO8YTaWI09/Ngr2qPexgB7X+oQSG3Ywnz0S5EWJi5
         1Bf9GzLJCv6IT1CGsgD8I/g4xIL1lugugzD7saWOuoClP8ph2YFbkj01RYPLRp8N+jqB
         2zT6xBsRTaozjYHnHiBTT7fm3LkWhmPfod8+qbKopXgQ2AzO/yTLEkXLURSY+NhWlPvt
         WLFwPe53VMq3M6IC9Jva9v9MEWcWtJ5NXtGDEinm9AIHGc9V+rGV834iG++48miOZTdz
         AhEO149FxBxBEA/HX+jbUNxKvbrol6YeefpkKXYqxSQ6Cj/02ez4IG/8O/THIEix6n45
         XW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794119604; x=1794724404;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tw1+OakpoH9nv5oeIcEeSnu2yq2xP4kxsGUVLSS30s=;
        b=YU9Zzcbj1CTXopBEDj7781Ca9p6mq4XFYDSPzzMxVAdYvl2sT7d5UG+Q0rV1l+CLXT
         pONZZPOmF0uZHEmZ2us+uiZnO95l34Qn1cIO103kAu9mH2jrHP+iLsDdkFjdfrTbEGCn
         csUzlkhiYyhjwES+p4AmIG5R2J96eWWhk/IZ1VGwn7yr/LRToIPFB2ZIdT9HPubB4BMp
         aDJiNX8GTQs1ISdoKeyUBDFZecfe7/Dj1n7z6vkZc5kybMYdKOw9lRvwGO63n+G21BW/
         CTIvMJpMOZ9Mt2dikh5y/kzwyq5TIv4HlOHKu54nT3HN6Fy/ZKNtL+rw6+8OYI8UPGYe
         oByg==
X-Forwarded-Encrypted: i=1; AL+hErHnE8jJvLK6wd3vM35RSBem/sUmJrfTdTgBwBLMLxLGiYXvGZa2ng/zJNu/tmQDEVpu86yXa9tZLvXqi7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hCsGrldtYYa0QD9WmWJgwXUzvhKLxdl81WeavMGS8qssM7CUB
	oGwaDjSh/P1aHSF0zirSHZQk75INFaCVL/G/P48GGl3H/dgzNJ44reCo
X-Gm-Gg: AYBFou3D/tAZrRrn0z53x44n7pmlSmb8m8wG9fpT2PZ5L27wzu6m1d34zVJj0inpcX1
	TVenBKw8muyoqiAaDeWduAIDRGhG81VaHd9W0b+P7cSI0fnxaUhuBQm8fmnN1sNhOgKUZ/vlDNG
	pUzk2GVqoNjSAov1/hAi7j9ag/N/WbtTQgk0sH+4mlUdj0iL5eno3XyVr4UNtC7mONFoOlK9c8S
	Xbfo7AZsF69Od/OYnEqGISdbOG2Zkcgz18RsVrztOE2IxwznMaSXFagbNKiMMIh3WmKj3I/jS/u
	R4NIhzZYgC73K8YA6+1/1SO0/8SvZA1XRk4sVse+9wp3b+qFVKOjrKhKtK6H8q3Gisezn5mrGdG
	P62cJOvVyNEUm5HznQfezcLclbomCi0axpHYKwNIdfNzOh1bdMecLHTFyXfJ/qfk3rAPYmOru4u
	gQHTGw2nVYrWK0DIQbsh1FbFkbWiMdtil9DZwrW+iy0QhiQFPIIPenmPbH6/Fi3uZYcjBbYaDtn
	Fn0EGRCuEpIW0HhkDHUYKCEe8lYEGJwCX3xWiJAq/Buf/voDGBtbA84kki3jdc5Y59UKMQfCRX6
	HSW+K0lI2qQR7GoXpF8qqMK4Lkxs8buRdf8WihiEv+4UvULUU7OmAG9ksR7T85fCMf6i
X-Received: by 2002:a05:7301:4712:b0:36a:15ba:43ea with SMTP id 5a478bee46e88-37255c4ce59mr1728747eec.5.1794119603737;
        Sat, 07 Nov 2026 22:33:23 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:5a4:1cb9:242d:4f00])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265d05514sm3001194eec.15.2026.11.07.22.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 22:33:22 -0800 (PST)
Date: Sat, 7 Nov 2026 22:33:20 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: xujiahao <xujiahao@cmss.chinamobile.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: sidewinder - size the name buffers to their
 formats
Message-ID: <avARPWwbjYnmuTeb@google.com>
References: <20261106033300.3439313-1-xujiahao@cmss.chinamobile.com>
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
In-Reply-To: <20261106033300.3439313-1-xujiahao@cmss.chinamobile.com>

On Fri, Nov 06, 2026 at 11:33:00AM +0800, xujiahao wrote:
> sw_connect() composes the physical path of each port as "%s/input%d"
> from gameport->phys into a 32-byte array.  gameport->phys is a 32-byte
> string and the port number is an int, so the worst case is 31 + 6 + 10
> characters plus the terminator and does not fit.
> 
> sw_3dp_id() builds " [PnP %d.%02d id %s rev %s]" into the 40-byte
> comment buffer of sw_connect().  The PnP ID is 7 characters, the
> revision string 8, and the %d arguments are a full-range int as far as
> the compiler can tell, so 44 characters plus the terminator do not fit
> either.
> 
> Size both buffers to their formats.  Truncation is theoretical with the
> values seen today, but a buffer should not be smaller than what it is
> asked to hold.  Building with W=1:
> 
>   drivers/input/joystick/sidewinder.c:538:58: warning: '%s' directive output may be truncated writing up to 8 bytes into a region of size between 5 and 21 [-Wformat-truncation=]
>   drivers/input/joystick/sidewinder.c:727:29: warning: '/input' directive output may be truncated writing 6 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
> 
> Signed-off-by: xujiahao <xujiahao@cmss.chinamobile.com>
> ---
>  drivers/input/joystick/sidewinder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
> index 7f37d18c8..2bd5cfe5c 100644
> --- a/drivers/input/joystick/sidewinder.c
> +++ b/drivers/input/joystick/sidewinder.c
> @@ -97,7 +97,7 @@ struct sw {
>  	struct gameport *gameport;
>  	struct input_dev *dev[4];
>  	char name[64];
> -	char phys[4][32];
> +	char phys[4][64];
>  	int length;
>  	int type;
>  	int bits;
> @@ -574,7 +574,7 @@ static int sw_connect(struct gameport *gameport, struct gameport_driver *drv)
>  	unsigned char *buf = NULL;	/* [SW_LENGTH] */
>  	unsigned char *idbuf = NULL;	/* [SW_LENGTH] */
>  	unsigned char m = 1;
> -	char comment[40];
> +	char comment[48];

This just wastes memory for something that never happens. We are OK even
if data is truncated.

To shut off the warnings I think we can switch to scnprintf().

Thanks.

-- 
Dmitry
