Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222381;
	b=uZWuz9AR4RBiMpq5kTZlkiGB7Baocr5JKBhV5QPhj/jzm4Ju1BZIV0nQmhVgEvO5fT2R
	 ISYU8gzFYP8+QVqEFo5pHPixL+vfMEuQPR8bmpVXqKRvkYKyNmMMnhI50mchbnPwQeZNU
	 PFapu9941aMeLYwEF+PWPgS/qwi7Y3Yx4+Om7a9ll5RbMpZVDWA0wCFQlgo1F0FHBQDzK
	 3eVzqHzp6NhPoSPESMqK36vYmz1BsehtG8QU7EpBFBiYT6EV4cqauWCSmqqFbb34wRqX7
	 3YPrkDuvdPKV7n3J9Ssy3rPZKWi19kfRGj8+5d8cSUTTKJdOE4i/gVGr7amKh+nEhGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=NNDm3p+UngqnrcyLX5Ukiw0BOrNKOL/SmJHH/8S74cQ=;
	b=N1FbCamW3FJcG83Ps397gA7utxle1SpOFBH3Uh4ynbytQV2KMdkpRPYcz2t7lL0JTpfu
	 AkFf4FkfFToCQGXgZY+W75ajvbUSQRWJJlF3zG2CUcYMEcHTxycOAj2AV+qxwUi18IcUt
	 A9NxT4Ib9CaBVj/fOJaX3jIjcV54XOmimsDoENqLYr8DrZQyyDhz0fRA0fybz5uclkhi4
	 NxqT2OrqJquGsvK3shsVXWuapbik+V34+jHaD1q5ljMM1GetaGohRwZzQfXDeT9aOCdtC
	 N8cyZVQSsnmvlL0gojB92GN68U0MHZFBeXThFuLM6queBUFyQ958W1mNHA77bTwZvHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PWjA2Lvj;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D73606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D73606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PWjA2Lvj
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so7369975e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794222379; x=1794827179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNDm3p+UngqnrcyLX5Ukiw0BOrNKOL/SmJHH/8S74cQ=;
        b=PWjA2LvjYpWCVERyEdvhNDTO5CxcRrBdnaCjzXWupoli7WUWCMNDZaJhKhCBnuidH/
         7EyJ1AGyLVRX+J2Yz2kyGpqCjKieVkTjCpQ7aDvTiQg+ED0vXnHrIbLr0RD7eWCOLhx2
         MvjdxwpOKccAMLZjYeMVV1zUHAosWNYch7O9VUE1hiWunFGEdMTFg0oKSCznsiRQycvl
         3p9hAnogHYU4d/k/1wTjDnzN9vL6MEwoXOIr7CknmzgXJZjtKGqFJSHGJWR4vMY7GMA4
         jVCeuohzLSIQ3QzuZ/Ecz9B8I6MgtJgJcAUbsY3AULJdNvBC4O/x+Qtc3WslLbSnxGYe
         6U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222379; x=1794827179;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNDm3p+UngqnrcyLX5Ukiw0BOrNKOL/SmJHH/8S74cQ=;
        b=yz1TY/IVtIudUUhPynhgbBbxus0VPsAu3mi4Pw/dYuRrYiHJNN0/5BPAzM1IjnkvOs
         r0+aSm/IOr6HYFm4cSqulgWsc5BHl7tPD6V/r1+Ezq2c2ftC4j31v6X/sGmfDzzqr5Vf
         yETDOmldecvBWP6alQ09SQxP2uc1kQHkD9vhXL/GW+4zMiiv49FP3VU/XyiEHJbvLcVV
         mK7sXhUm5VGVHnuB3aD08zVPWausbwrrRVnFvadHOnOxnaV1k8gSR7Jw0CEBIDkw6fOD
         EclctxPNYGJoxzplHSyxGH+b2+z9eFt4hTFLq7WY/nsonXjTMyc1ztl+oLsz1C3Xkdyr
         fkZQ==
X-Forwarded-Encrypted: i=1; AL+hErEQDGfpvDBsPqvFxNRZuePWEn9YeMbh/AgutkVpApYXAjPjNfkuwChMDuueAEJfSq/gIDzLeoqCIq0k8SU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aoQl1Fzu8ZKd+E5ljjCBC7WZQMgGSS3kFxgctKe4FDLuKkZIF
	lUreRZBQouJcvJLoVvyBQI5kbDXkBUycOt/eM/n0/BtDhg8B/k9V14aJ35UO+UtmB8g=
X-Gm-Gg: AYBFou3D6lqeiSaJ3RlZ0YkVVtYUtFXTk+G4UXZM0iUbdzD9vq78Az2yMnc7kYhj3OU
	fOMaTopMIf52VZtiCFNKjOlHKXFK5Cm0IuEUfMuVk2IAytA0Cb27aFMW1UCpZ2nOxsFYljo6GsP
	i3mGk1s3FTdhM2tQOOrV0j6yEeUwQxUjR9FKey+JWrlhaGXhlwAx7VMjESUt+6+AbOJWdDUV23O
	ppyzgBpp7G9pRd6yqWzXSxluuhzljiiCpsApLv+3khuKwEwdQL4zsBl24wDl2abvrF5uBfvmU2M
	eUvfxlNHkutllw44TFzBHynL5g05J/zH1OG1lTGTceTW+7Lo68TJ8LH1ugL6k6CbvqPdk45e7tg
	ztZAqIcT4oUXKcHqyL2IfFXcGzyNo0tF9rvCgJ4TVDyh6gv2pD5zR+ol3Y0gaoQYQBntToH8wvw
	uhuBDgjuZdOV7uSS5HjGcgVTGUOfcpHcSCiIEf5hxmxSawy7j33Mo0pFyg3QZYfA8IoChnPzgyj
	Q8jHlJLY2gHMzftVsibWjZDNtY9X+ORMd2nkR+DHa7z88zo9S1N/Dhn0+/Noh9eTqlQQhUwfaiD
	kjawijpMHvL5yHIguSuo7AxqWftYE7uH0IKCoZ2XRSk=
X-Received: by 2002:a05:600c:3f1a:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4b963c87ffdmr68091205e9.19.1794222379267;
        Mon, 09 Nov 2026 03:06:19 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm239723095e9.5.2026.11.09.03.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:06:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
Subject: Re: [PATCH v3 0/2] Add initial device tree support for the Xiaomi
 Mi Box 4 (MDZ-21-AA), an Amlogic S905L based TV box.
Message-Id: <179422237792.1514386.10691096283154842282.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:06:17 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Thu, 03 Sep 2026 18:18:44 +0800, YuChia-Kan wrote:
> The series adds the board device tree and enables the main on-board hardware, including eMMC, RTL8723DS Wi-Fi, HDMI output, HDMI CEC, USB host, power LED, audio, Mali GPU and the Amlogic video decoder.
> 
> Bluetooth is currently not described in the device tree. The device firmware uses the H4 UART protocol, while the current mainline RTL8723DS Bluetooth support expects H5.
> 
> Tested:
> 
> * SMP (4 CPU cores)
> * 2 GiB RAM
> * eMMC
> * RTL8723DS Wi-Fi
> * HDMI output
> * HDMI CEC
> * USB 2.0 host
> * Power LED
> * Mali GPU
> * Amlogic VDEC
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
      https://git.kernel.org/amlogic/c/3e965cc7f86b7358a850b191605db72a09450f81
[2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
      https://git.kernel.org/amlogic/c/36f28822232ae35d36ccd2587e333db1ac961ff7

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

