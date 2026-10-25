Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792969994;
	b=qsGSsnfu4OWZxhbLjL3vpp3Iphr3nfR9ou9xQa5wTsF03AX/Q3Pi6L882jm626DILXwu
	 taobsnK9d7gf38Lc1tEu+/G2FrJ527htnaDKkW09IOxwLTitciZPEzel8eQLDxhDO6Ljr
	 /BC9dY+pTy3++8IgW1kocFuj/CfZFhJCV0Op0tjcZL8OIj1Fbdh1mUvHg1Y2zMv1Zn0oW
	 nSCDcsOr8YZvkXhhTWszf4ixD0WskLWerPBJhOphFEYTGTgRDjtzXBaXuJbcLE7zxFwK4
	 cpRA8GQrKbm7KnAprSdsjL+yLWt6mHX/tpJDfJqB4d1bUXXcukHltst1ZFS62RBB4Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792969994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=mR+Son9tYd2EdXF7tinsIzW0uhxqVUc0z3Q/mgmDfNw=;
	b=JYc/QEXdOS9USZtpsz87WIhbOgs7aWsTrywd6clRjdD83gHBkNlDgBzFHNdtVvsBPrs3
	 tgDMf0B/eqIFgEb7J6ctifUqLCCMqrAmhAbdpsDf7R6qTcXJy6eetvwVWchTutjTwyYlu
	 rUMMVatGwUq5kkKvem+vo23c1qkOgoym/hr4rrasBr9+8LCvGPD8EtuqRF1hODOSl0rqt
	 Sc1E/BXRoXQdhHGCOR956WyeLCE4l9GkmOp21oRbWqEMKw+AHhP5m66BUwFJDYCe249qX
	 6FqW0TufZ48Dx6AwT9AV7gV0il+NNXNLmTFvekRjb4fjKea4/VvETRrq7scSo1nUKWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=SyVKvHEs;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F7F606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F7F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=SyVKvHEs
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-157fe9d771bso2876468c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792969993; x=1793574793; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mR+Son9tYd2EdXF7tinsIzW0uhxqVUc0z3Q/mgmDfNw=;
        b=SyVKvHEslJ/Z9K8YJ22TGO9uybiX03BNspUhbcdvAnGMGT3+QRPFAnZqIihcY+kCAH
         InhNLrwJmZyuJAoIDWsbk5Q0AxkpQJdrD+7LU/P4SZcQftBiHoxcLdFPsz7E2Fyxaoqf
         NUOHVCrjLyDSjN0iKLJJO4dLzwzVv7HRIxXRe9UWO2GoUlwvjgaVzFApn0zw2S5hizKe
         iwoHJgRuRRP2j/IGWpGBDMj0cYNVyTNdeqIttxAmUwh9VbJCiIqB//0Jn1fCCd4btdZS
         RdGG7lJgUJ8zSXJoWqLRSK7q3EXOQfO6oqzCDzaZ3KAJjL6O0NaFbZL92RNRsflze7Bs
         irPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792969993; x=1793574793;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mR+Son9tYd2EdXF7tinsIzW0uhxqVUc0z3Q/mgmDfNw=;
        b=qnqNH0miH83w6x3tk0ARFFdOVp3kFAOIE16jKNh48K7amJXuqeyrGdYSYbJ8siDle9
         akmxEZxMGhn+PCYRkTvIk9lJIPbTKhs/2tVyCAgac/ZzD6gYxfcyxBgPfkUFTH4dkwlJ
         3S9sen1hFLEIsu/QZDUEm0/cg+UuxBhpo6frFWN9B6kxHZ/ERapqtyrIVH56jdcyiVkq
         uKuKl2R7SZuVswxsFsHqUvTW0ya1xQ63M0oRr1T/6eDQASJ73i040X06rMP/oi/X1Qdk
         6/lZUDz0WXFMLgChqGoRxhO/lsOfXgKa0ABPPlPHZn/S9vkLEDmrv0vX152bI2QQoCvV
         cmnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhxGcqm+Fx2IVnxbKxwFBYyOYMJnHJYbrVcTxED0Loh4Y4WZ05JpVEqrWnh56wkCf35DUXlyntmtIbjCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDgkoH2slTw8v/jHzgXS6w/Kj56SvGNP3+DV5f2AuPZ7nwIl+h
	ADckFbEizoboGFW9RjjY/0hw86MLJUwDNTMKjiRDjCfT70KKLUmTl51o/zWMQa/ef4o=
X-Gm-Gg: AYBFou0zVHZppPezkLymn2t5akGazSty9/+wW9UVQGMV25UBXft23AqGxCVT68xW672
	cRe9cLLNTmNgLWFG1W0ubmqSis9TAVNFAGJN/Jz7KZGIVf8ios/be97H29lHZ6zgW97h3wt3+/J
	fT8W2oVyD6oc6MC9IcWLJ+SnVk83pG1/2bzqCBKEExB219qkzlSLfN1hWJSuC9TCcIpOCKYducx
	xIjvNDX60ArXllcsP9DSKDjtfioaa7/8VuUboLD2vfZkQm3N52a2ejT39NL2tQwWQI7ll18w4jn
	3u/RVxKrwb6WvtAU/HyeyFjvpnsYx5Y6JgWs69VL8A97cnX3/qR4L+CBuV8wshEfp7ODKV4TBu5
	tL5DeZwDLmH+8a+KEAO6vcUWFvvSxelryzRoXzfKgIf6dcyq9usIZOn2THCR3GNcZnxlamiLC+2
	cBb1ionSfmVvezp1pIrdGcjOC+T6Gmy1EIG6odes5MKSyS5MKXmOL1yUzsgXKiNybP6eHf+g1B6
	Jbj7GfiKFhIj7G7B9xvJYmPVmGXQOfBCKQef77Ps+qUBAn7LM6KRUdor9NtjODFHj7WbNsmqD4P
	Ww==
X-Received: by 2002:a05:7022:7f12:b0:195:1a77:85cb with SMTP id a92af1059eb24-199290fe446mr7025882c88.1.1792969992473;
        Sun, 25 Oct 2026 16:13:12 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d8a690sm19545470eec.12.2026.10.25.16.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 16:13:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Oct 2026 16:13:10 -0700
Message-Id: <DMEATES0KH0K.3C7G7F2FELPOS@nexthop.ai>
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/31] hwmon: (pmbus/d1u74t) use 4-argument
 i2c_smbus_read_block_data()
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Guenter Roeck"
 <linux@roeck-us.net>, "Cosmo Chou" <cosmo.chou@quantatw.com>, "Andy Chung"
 <andy.chung@amd.com>, "Ninad Palsule" <ninad@linux.ibm.com>, "Abdurrahman
 Hussain" <abdurrahman@nexthop.ai>, "Robert Marko"
 <robert.marko@sartura.hr>, "Delphine CC Chiu"
 <Delphine_CC_Chiu@Wiwynn.com>, "Daniel Nilsson" <daniel.nilsson@flex.com>
X-Mailer: aerc 0.22.0
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com> <20261024-hwmon-i2c-smbus-read-block-data-v1-10-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-10-e81941ad0cd3@gmail.com>

On Sat Oct 24, 2026 at 8:06 PM PDT, Dmitry Torokhov wrote:
> Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() and shrink the
> temporary buffer to I2C_SMBUS_BLOCK_MAX + 1 since only a single NUL
> terminator byte is needed.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/hwmon/pmbus/d1u74t.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/d1u74t.c b/drivers/hwmon/pmbus/d1u74t.c
> index 752df3af9c1a..758464a6362d 100644
> --- a/drivers/hwmon/pmbus/d1u74t.c
> +++ b/drivers/hwmon/pmbus/d1u74t.c
> @@ -30,11 +30,12 @@ static struct pmbus_driver_info d1u74t_info =3D {
>
>  static int d1u74t_probe(struct i2c_client *client)
>  {
> -	char buf[I2C_SMBUS_BLOCK_MAX + 2] =3D { 0 };
> +	char buf[I2C_SMBUS_BLOCK_MAX + 1] =3D { 0 };
>  	struct device *dev =3D &client->dev;
>  	int rc;
>
> -	rc =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> +	rc =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
> +				       sizeof(buf) - 1, buf);
>  	if (rc < 0)
>  		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_ID\n");
>
> @@ -45,7 +46,8 @@ static int d1u74t_probe(struct i2c_client *client)
>  				     buf);
>  	}
>
> -	rc =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
> +	rc =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
> +				       sizeof(buf) - 1, buf);
>  	if (rc < 0)
>  		return dev_err_probe(dev, rc,
>  				     "Failed to read PMBUS_MFR_MODEL\n");

Reviewed-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
