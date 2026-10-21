Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544950;
	b=1SXPW52UJTtHmQkZK1vuNByw0g2zIGyegkPY3aPeprP6+VnsaGg87TYwMqpQ9NKUDD0h
	 7TIDlVVCV5CKIdtrnAb/8gPliVi7RoUk8vubUFbybFM+9ed/INWGGltgXh6rQGs2+f8wY
	 gRaMbB6GcYJaETN03kVkJCQCExlNKtZk8LujsRddfUlIe+D5ugGLXYwiujDXOEImClWs0
	 yGgGEQvDz7fI8pI5Uxvd6PZLEIQaMOBD4scKyDBo2fuV9n9gMYk/VQC5So9ToJbqzK0s+
	 HEk7baVu1HYBBLhZdaovbd7f4V2TNIKtQ/BQKZm6DG4mi6BoHyk6xS3yDTgAgkvF4bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7iEPiz9yOIV+y72qaA8W2UPQbrqSP5r2/Sa3LQF4egM=;
	b=DSh1uiigCfgiaed/wt+NfXe0snVQJZesNUlN+pwx2PNSJ/E/Ab6qRJHUG58gMx/XIraO
	 xQvGkJszrfPY4r1aiBGKbeNivybVZwZbVe/Kn3HBvOanfXb6QHxDMUiq3b+/TlNNNAsQa
	 NHpr0DB4CSeN8vvoR7SvXDjm+acGNiFKVMx8ITgrZJ45jlrBUXBzVSMdCrpnKOd2sMD5u
	 rTKeu8IrHGlc6yGpwnvh2jkBuKWT5qrPj5L3BE4YuzeQgc3yqihfkQSTfmSgVlJy+TCGH
	 f+F4UvYO8+grOj8KXfi3dBPyHro+CXBUrjVjv/MBEnfSz2cvwom5hr9DmAjSSgK3ayA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hv09cj6J;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E3D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71E3D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hv09cj6J
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eaa1b5b84aso228460e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792544949; x=1793149749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7iEPiz9yOIV+y72qaA8W2UPQbrqSP5r2/Sa3LQF4egM=;
        b=Hv09cj6J8eoXcUtgZ4L9LJvQ5fMzvH+PM1JKFCE11ERCdj48sOiWUOJJDvxRbG2qZQ
         +V9Ld7wl18TlaSg4o80tjB9O5ww+gY6IbcY4EecGhLRcVwv9gkNHfLUEOPmRdlZ7KkBN
         pu6FOFLBgNFtbNbY29k1lqlORPlQe1GTOrEg6WIou1pos0nLyR5DSLb+yQbXAQxyCXWX
         Ol6jiasluvnjnBfQRLM9I/rOYpb8BoKDEIiU9c6cTYPk8gcZ9fSQYxUzoxyXCpVRUI6k
         CwBGaRU0PGmQaRyw4HWYAJDSnn0TKf9O+xBDHJgIllueVX7SKQUqOZfc3HutbNGEVCj7
         06lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544949; x=1793149749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iEPiz9yOIV+y72qaA8W2UPQbrqSP5r2/Sa3LQF4egM=;
        b=edUcjMnDYzk1lI/nfReTL+TBeXGM1drhNN1HsfsgjDizmQuzd4efj2egcRPn9VZxrT
         7rXHlVDjWsA5UW6cbksO+WB+cizqQvuICmOyyMmCD2YRIBeAny+jhlVj8in0ThJEPTn/
         P1S+yjuA6XSe9y5DtNWHtVJU+u1YYXETd7x4XGaWhxVsz7/R0jA0Poefm3C6hSNImI99
         K+noEMdjbtyducvcPLQJOBe7hEgeU7mvZCUfDRuL96WMDo+jm/TSims20s1YvjKOEDwI
         4DDrgUcTYeuByYIDDK1jIlF+JTYj6QvfqPpTAtIssMQ1b8YJngz1XI4VCzxho83fcxKF
         ZVhA==
X-Forwarded-Encrypted: i=1; AKwUvBwIV/tNM1D/it6Ks1OcaBhe5Jb4Y88FJWBaeA5vt81v+k2qMELQ9+ZxQ4yvu8iFySFgh5I051rvihz6bV4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrNG67HqDmegSPHtyEV3wToVYFVARizLbyf1+spZKBtELy7e4V
	pmt5rwkpHh0ndbbbY9ccy8QmHBPOyGyJPGOj4IJ11lcf80ZWCxI1x9aO
X-Gm-Gg: AYBFou1PBFoQlGPN9asd0RK+vltKv/aQSRgTMolXEJUme19o1xH+2LExPDWkei2Q2rj
	/mOrRm84li6Hn/8BfvMg8s3Shfwpms93WYOiA89j59//FdCBHfzMk6kyQjScfqFN9KaQj7b2JPn
	iAIbeGoz0t/JNKsow/K01NV458q361UmHHUmAL0tvvYOEbF9efxrXvaW2F93LfJ22zZTzVcTYyy
	TAnSVfcQ7IifnV6wOY+hLI/oY9Imy8TCHZT7t4gw3Z+ORW3arLjYRwzOUbZUR9p35I8zOgJXSLc
	g5/dv+pNt+cupnZSIyOl976xlMeL7l4zePbQPJuvQIiB8545/0IzwrxhUrP8v89LbyJd8wmbySi
	DGBwGDNchsU2sF3+MaPGt316VPXTpJFxa+fa/H1CT4AuCaJNK4IQf5yd9x9HCoF6KnNXRI6F9ZI
	C+xE5KJceaZYVhJoYVU72TStL1xIJSC1HbVvpNdTCg8mg98yoemiX3RXGfCqdOCINl35OXtTjXb
	yQ1JTxlnjwD
X-Received: by 2002:a05:6122:e203:b0:5ea:c77f:2f2f with SMTP id 71dfb90a1353d-5eaebd72abemr166243e0c.4.1792544949299;
        Tue, 20 Oct 2026 18:09:09 -0700 (PDT)
Received: from localhost ([2804:14c:5bc6:abb9:bc2d:a62c:e289:6aca])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97df494sm1413817e0c.10.2026.10.20.18.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:09:08 -0700 (PDT)
Date: Tue, 20 Oct 2026 22:09:05 -0300
From: =?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
To: git@turtledev.nz
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] platform/x86: asus-wmi: fix camera key LED on Zenbook
 S14
Message-ID: <atgQsQrbCvCGKKld@djouze-zen>
References: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>
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
In-Reply-To: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>

Hi, Zane.

Thanks for the updated patch!
I've applied the patch locally and it works just fine on my Zenbook S 14

On Mon, Oct 19, 2026 at 07:35:18PM +1300, Zane Hunt via B4 Relay wrote:
> From: Zane Hunt <git@turtledev.nz>
> 
> When CAMERA_LED is missing but CAMERA_LED_NEG is there, register
> asus::camera as a read-only LED backed by CAMERA_LED_NEG, and read it
> after every camera key event, sending a brightness_hw_changed event.
> Registering the LED reads it as well, which fixes the LED being dark after
> a cold boot with the camera disabled.

With this patch applied, a write to /sys/class/leds/asus::camera/brightness
returns no error, even though the led is "read-only". I'm wondering
whether we should care about this?

> +
> +/* The firmware owns this LED; a write just resyncs it with the camera state. */
> +static int camera_neg_led_set(struct led_classdev *led_cdev,
> +			      enum led_brightness brightness)
> +{
> +	struct asus_wmi *asus = container_of(led_cdev, struct asus_wmi, camera_led);
> +
> +	if (!(led_cdev->flags & LED_UNREGISTERING))
> +		camera_neg_led_sync(asus);
> +	return 0;
> +}
> +

Is this function necessary? We can't perform what the caller has asked
us to perform, since there is no way to set the LED. If this "resync"
functionality affects the behavior, please ignore this comment.

Apart from the comments, I'm fine with the patch as it is. I just
wondered these two things out loud.
