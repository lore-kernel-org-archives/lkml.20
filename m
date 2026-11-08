Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794156591;
	b=KMu67x6/AxptYn3sLCgtAXFam0nOInYByeZM6j5JAx737/xA0Ci4YEMZ9SIge/NYhl+X
	 y+RGDYxQU/+Lu6uvbQMbdD1eOpZDasGAy5e1WgE5VqARiQUXs5YuObupqWT3PPwvmIHw3
	 jwHoIzX7DfkrdBL+tYIsPVJBvQ28JdX8SuiO5p4QBMSobBxB5Vw1ZE8aAbepPcW+VWm8t
	 QgSh2bNJamGThS2RGS1lo1nA4jWjOQZVFoRzVdNN9IfvI9np5yjRBRmphI2z3dARgb6tJ
	 ZHSx75lvKil4FAIwZwsew3c9iXh5euCLcwzmAdRMUJVK772imIvSVyPL36AfZjSCUwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=/byyvojME8WhjdnFtCA8t5mtomtXOv8PSjbcqAbQ/y0=;
	b=AA8G1Wr6F8Qk0kBcHCHDZRwGRx2e6U5JRYqBeYcjHZEisZWtdvdewk/a9k23HzmalRiE
	 C7tMQEG8McUrmsVCYCY0QJqpKjJ/qQExikSk+Gjb9p0TBKqrhr0IKw7t7c9KUUMF69+JF
	 JDyYER8llz5KiDx/q3xqdLtfsR6/2QRkcNXA3l1Ck7doNA0g4Oryka/cbIBpuYLVwrfcr
	 ZDB5joB+Vvm1Pj6kEH6wb+U5o7yS/mteAOfPhl0X9CMab+vvVLZ4f1FdnTaxEnk9tQWqX
	 oIAuFq0cq4bSqyDlVN185kPrUGp73Ixw/EH7TEmj/5fhVTUTmgzFjOnMo/xSjBeZMiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlbPpUAd;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEA8606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAEA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlbPpUAd
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b2513decc3so171713c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794156589; x=1794761389; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/byyvojME8WhjdnFtCA8t5mtomtXOv8PSjbcqAbQ/y0=;
        b=mlbPpUAdrivnQa2+qUwhCNT3Y2L4zFi64gixErfvjoBXIy4Q3L2OvC8rgk/Li0CpXJ
         3LsCKJwusaufoKn+sWivRepP0OLaSiGzw2UwMZeqjDX6jKM7CWyI0nNjJa6Q0sPRsLf8
         LHjJWcoG58w/e5z8hz/NEkeD3tq7fEWlHnMNL31NE9VJTw6ZybNfyFETpxmobH6lJwTU
         23jblaO797vh719imOHmcVyATeceAMTcLRAjytlTk4gI7CHHWTWZGr8jIsDD3vxfbg+J
         PnRNwwT44ANnSfQGlVWJE6VJEWdvy7uxJ6AxGJ4MhujWl2r0wjNRhlnKCo1U0bhwPFXe
         W5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794156589; x=1794761389;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/byyvojME8WhjdnFtCA8t5mtomtXOv8PSjbcqAbQ/y0=;
        b=IIvrUjqq1pP2/YIMRahFgdxoO800RR9PPb5FejHMOX5TJ/sdHMK381hMy/AfTIp6Ul
         vpniJ0+6y9VY7vcqGLcKcho8p7blNf4KEiRmp1R2KeeYxTAxW5LkQDqge7LpeoD4B0MV
         fsSQMe1F4OgsaMlLlVNtkeqahhYs537h038lTOpg5Q02kHScF93S5iudnnyUavW6MlyV
         6h7wqk4uKMNpVZUQLLVCaflFVZZgR9Ii1TLVqgFv4SIOkV5Lnt/A4up9qqy3Us0NsiJH
         KJL7EqjMkYxcHzESRW5yAITjMytmJJ+p580HRAySuJwBK4Qa6LuVTj32A1GbjsiTt09R
         7eUg==
X-Forwarded-Encrypted: i=1; AL+hErGO9Pbbyi8dKszrY5vteN3JY+3DsM/aAglXRx5Ken9ymm8SAirYFDbtlx9IKbsmYXsdbqvj3TKfnckpguA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e4TwhOCAdIJ5q/7IcEnTTvpiF4kd03RnMaNmQEm9VT5TCHOgt
	rqNCdLT1lLuddHB8m5Q1wQ2DzPzSoPzH5h0lz3vIjkk81ot0gcdeUE4=
X-Gm-Gg: AYBFou08/4ZLTE6fAWk5D+bq6qGtv/20SRC+FGTSULmqgK22wAfvYL36coSusXO+Z7s
	2Qr+3xcCoux8TFcHIAARwrw2wxuUeiqSpvZzqZm8LQoLzmN222Ii+nUfwUhUtFRcD3Ks+Lz92hY
	NFIXCRUMKS2fYfW0EI34EKqBViYZbMu0v3kGqE3IlfAoi+usebBz+QPc9v17NvCtrG0G55VooVZ
	BcxcVXNHvgjgkqo+7KefrvRK7j6C9HopONqJ9dXIYaMW1xKGKLLG5x+TuybXJuJv7WHSbJUjuUf
	I93t+438s1fyADwFpa8DLD4eg7FIANeNDdWhF2pa8PourN5CCTL4JlALNmU3jqbZa8yuWCID/eA
	4nuTnvLeucDu8DTtnWy7sXv25/t5zygIzewS8IdDE5GP4HtkXwZj0KSdYiw8KLL5l3Jk5oLavKu
	/t7hJnmkVmU+P++E0CUT/yZvpOq5D1V+OrtvYltYrL0z2lprRaeUS56EKx+bwIXV6gL10asQTAl
	kp8FDiLQHpium9XECJjtfHzeylEEt4UBNvowQ7Fhpy5QBE+Zgmpb8grqEmTdE9J3wcqdV1/f14d
	8Av4bVVkRPBaNcsrUuMDF7PiC5Oryq75Qs1/M+lultFOxK+4yo0A4ICphllv
X-Received: by 2002:a05:701b:2618:b0:189:ff2b:b194 with SMTP id a92af1059eb24-1b39fec8a89mr2321841c88.16.1794156589378;
        Sun, 08 Nov 2026 08:49:49 -0800 (PST)
Received: from smtpclient.apple ([2406:3003:2002:639c:14eb:b848:c9ff:188a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37560d95dsm6037878c88.11.2026.11.08.08.49.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 08:49:49 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v2] regulator: as3722: use the platform OF node setter
From: Yige Jiang <yigejiang86@gmail.com>
In-Reply-To: <179406780591.3424803.16395424488807885604.b4-review@b4>
Date: Mon, 9 Nov 2026 00:49:35 +0800
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@kernel.org>,
 WenTao Liang <vulab@iscas.ac.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4C416D7B-2D4C-402D-9C60-97069D0DC8BB@gmail.com>
References: <rc-review-20261103-19-ee1e37733b2e@gmail.com>
 <brzyrqnyrayxdpnyginamtdewj6cp3odhndlstjp6kupnr4q3e@rt73ebxxvbms>
 <20261105100342.34730-1-yigejiang86@gmail.com>
 <179406780591.3424803.16395424488807885604.b4-review@b4>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)

Hi Mark,

You're right, sorry. I overlooked the fw_devlink implications here.
I reproduced a probe retry/rebind failure in a controlled QEMU test
with the actual driver.

Please drop v2. I have a draft of an alternative fix that I believe
would address the reference leak without changing the platform
device's node during probe. I'd be happy to post it separately as
v3 if that would be helpful.

I also noticed the same probe-time assignment in the applied CPCAP
patch and will follow up on that separately.

Thanks,
Yige
> On Nov 8, 2026, at 12:10=E2=80=AFAM, Mark Brown <broonie@kernel.org> =
wrote:
>=20
>> Use platform_device_set_of_node() to synchronize both fields and
>> give the device its own reference. Use __free(device_node) to release
>=20
>> static int as3722_get_regulator_dt_data(struct platform_device *pdev,
>> 		struct as3722_regulators *as3722_regs)
>> {
>=20
>> -	pdev->dev.of_node =3D np;
>> +	platform_device_set_of_node(pdev, np);
>=20
> Are you sure this is safe to use during probe(), which must of =
necessity
> happen after platform_device_add()?  In particular with the =
interactions
> with fw_devlink.
>=20
> --=20
> Mark Brown <broonie@kernel.org>

