Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAB54D794C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790368597; cv=none; b=IGtTsDn+l6hVaFG2BHDZnUKGDAHrQ/av6FxJZAT5G5uMYKHNBhzG1rqLjqCcy505Z4QsMCp2KT7+OFpuEF5N2mqtJf6oxYrdkr89FJCquDQ0wXrdG2YgrtxhZdRvwAeQieF/8+1AMJbCPJNhgZ7kDN5wgU174TDZao0CRWeZ7k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790368597; c=relaxed/simple;
	bh=JA1MmlvysdwOS02CEm2fbSKD0SzlpVAbqKq6s8T/mfk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=mRiRdAeXoTb5hVW5/n0MV3IGfqQC10JTGSVHB4oXOQP5D8TXgd+tSF2dz5frH+ATRN0T2dufBayo83LfLNQRruo+cbXvrS1HdJHkBaeaNy5NrjauKUIMF/qoyG90X/jmrykdUiXRe5MQFTRrKEIGRLH+yzB3408RTkkvQEmzp6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUQoARdI; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUQoARdI"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04f7f2so1098644c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790368585; x=1790973385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4RNJ5nQR9k5gmyuH0UoJLYl6j03ODsgZ0SnhdOWBbVs=;
        b=rUQoARdIqa7zC5jv8hEpX+gubV1tNKAP/VULSdvg4ONtky2R9Bk6rSfbWJEPfamK4A
         b1fzg38bIjCaXnVivkD0QGNNl4gijLyUIFIJZTIvg0Id8dZsDgyTC16/DzWoULc3O87P
         JcaBhIjwsvcs0wIj01D7sC/OGWUupO5DYVcL8c6h/twInBtbabpygzLoaDHO9MWhALPL
         pJ7Gyk1J6VcfzdVxWae2SrFiRpewXdTndy1GJ8I7J5Qbj0qJkqlKvI94DGjK8532d34I
         ES1v1CzJoglwra7xBNsyijJ4skcl2qwaJSnmMSlOwGRWtsFUx1Futcv1p+UQRkhZ0fzZ
         GGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790368585; x=1790973385;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4RNJ5nQR9k5gmyuH0UoJLYl6j03ODsgZ0SnhdOWBbVs=;
        b=vmW9pR4SmrWyx6PEJShSri8B53qlAdKyudo2snQKW33L+qX2U+skc/E2i1r6T8CKS1
         qIgNKdwhhWu22fy4ffLciOglng1U+CRKAL4+wfMixwfbbNWMx9KwkEnBpt8DjwmiJDd/
         xK4F7LAUo7U7ooqUFwa8aO56omZu6ypI9OL1wFZaME2KkW4X7Xk03gJwy7tszTQw/Sde
         gBsS6of7sdvlaCB0527WKg5yNZ0gkoInCBnI8QD+bNPo20rmojqOEkfMthln/9vVA8ke
         Gtgzb63qSsLCvqzQDpqg1rI7/tHCHrS3npetWKxOhhoH0nNOHCAgEjPcjGxtQzh5y/rP
         +WVw==
X-Forwarded-Encrypted: i=1; AKwUvBz+2smJ+zKKJA7l/ZrnQ/rY9ndLmxFklDPEPaTQvMAyRa5Ea920Wa6ckNgkIaCprsvsdRVXvE00dH6u1r8=@vger.kernel.org
X-Gm-Message-State: AFuF++lAhN8qFs9CumYxGp/a8Y2F/bV2rwySYaqlJDOHlITMn4rE0ruz
	Xo/WkNPPc7OkY1y3qLaZkhXL4xlbo1dtgoneHij1fwEcs8cl9IRqIRao
X-Gm-Gg: AYBFou2cb9l7JHTPjGL+j43bgErMUOR8WZq5WEw5IgtQT17TAcE3HT9rME/69EzVHe9
	ss+Tm8q0Lv/L061Q0MPjifS7kqDGRtdEQxl0R+tHZeo2I1/Ne6+ZEy9b1CDqyGgZ+dzbakdaupQ
	wobazM+mKt2CVKTozsRdYHTXfySjvnodkcrFj/C0qFpqlhyTv0cBYji4SDyI67aH4gJeOgBKz83
	zwFsKfuriR95tv4J+DJAtfbT5PPJ0pk1Gfox/FS5TN66Dw/+XdEx+d2LAMdrYSSA0SSHFXyGifG
	EkIfpile63SzaWUXq2ynnlZkWCgH9QuklB0xRO0vEfPx5A03NVQTboujUpukQae+anWVmMvZ2I1
	iDMnXyzqWadmSxtAcKg0ylprIBBiI/gtDsZnAcebCNZ39BdBCvqTyrud+GFSWfMb8Fh6wNjfaVy
	yxr3R3Ogjay8A5M6y3Kk0+wqfnlqtQJ8M3sDEdhyzI8idSNIHvvio+mRiPQDaS8MtW4khLq21lt
	2czax5sIgjW5qbYPsT/HQOz7y3FNkp6uV9UT4xSt96e6vl0eOyyXmzFRznyY6j5uc2JDw==
X-Received: by 2002:a05:701b:4346:b0:13e:aa58:89f8 with SMTP id a92af1059eb24-146ce86dbddmr949798c88.15.1790368585236;
        Fri, 25 Sep 2026 13:36:25 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2a00:79e1:2e00:6c01:e929:591c:a76d:ca9c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad9e097fsm8107732c88.13.2026.09.25.13.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 13:36:24 -0700 (PDT)
Date: Fri, 25 Sep 2026 13:36:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v7_1/4=5D_Input=3A_stmfts_-_w?=
 =?US-ASCII?Q?ait_for_controller_ready_after_reset?=
User-Agent: K-9 Mail for Android
In-Reply-To: <b684b88b-55a6-41a9-a4da-3bca33550164@ixit.cz>
References: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz> <20260907-stmfts5-v7-1-4a53381cd038@ixit.cz> <arbJrK9zfoO1dGzy@google.com> <b684b88b-55a6-41a9-a4da-3bca33550164@ixit.cz>
Message-ID: <B0EA1BC5-3B3E-4D31-9A37-974E38309C74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 25, 2026 1:20:56 PM PDT, David Heidelberg <david@ixit=2Ecz> wr=
ote:
>On 25/09/2026 21:27, Dmitry Torokhov wrote:
>> Hi David,
>>=20
>> On Mon, Sep 07, 2026 at 12:50:19PM +0200, David Heidelberg via B4 Relay=
 wrote:
>>>   -static void stmfts_reset(struct stmfts_data *sdata)
>>> +static int stmfts_reset(struct stmfts_data *sdata)
>>>   {
>>>   	gpiod_set_value_cansleep(sdata->reset_gpio, 1);
>>>   	msleep(20);
>>>   +	reinit_completion(&sdata->cmd_done);
>>>   	gpiod_set_value_cansleep(sdata->reset_gpio, 0);
>>> -	msleep(50);
>>> +	enable_irq(sdata->client->irq);
>>> +
>>> +	if (!wait_for_completion_timeout(&sdata->cmd_done,
>>> +					 msecs_to_jiffies(STMFTS_RESET_TIMEOUT_MS)))
>>> +		return -ETIMEDOUT;
>>> +
>>> +	return 0;
>>>   }
>>>     static int stmfts_configure(struct stmfts_data *sdata)
>>>   {
>>>   	int err;
>>>     	err =3D stmfts_command(sdata, STMFTS_SYSTEM_RESET);
>>>   	if (err)
>>> @@ -593,42 +602,47 @@ static int stmfts_power_on(struct stmfts_data *s=
data)
>>>   		return err;
>>>     	/*
>>>   	 * The datasheet does not specify the power on time, but considerin=
g
>>>   	 * that the reset time is < 10ms, I sleep 20ms to be sure
>>>   	 */
>>>   	msleep(20);
>>>   -	if (sdata->reset_gpio)
>>> -		stmfts_reset(sdata);
>>> +	if (sdata->reset_gpio) {
>>> +		err =3D stmfts_reset(sdata);
>>> +		if (err) {
>>> +			dev_err(&sdata->client->dev,
>>> +				"controller not ready after reset: %d\n", err);
>>> +			goto err_disable_irq;
>>> +		}
>>> +	} else {
>>> +		enable_irq(sdata->client->irq);
>>> +		msleep(50);
>>> +	}
>>>     	err =3D stmfts_read_system_info(sdata);
>>>   	if (err)
>>> -		goto err_disable_regulators;
>>> -
>>> -	enable_irq(sdata->client->irq);
>>> -
>>> -	msleep(50);
>>> +		goto err_disable_irq;
>>=20
>>=20
>> I think the logic is becoming quite convoluted here, and factored out
>> stmfts_reset() does not help=2E How about we make it look like this:
>>=20
>> static int stmfts_power_on(struct stmfts_data *sdata)
>> {
>> 	int err;
>>=20
>> 	if (sdata->reset_gpio) {
>> 		gpiod_set_value_cansleep(sdata->reset_gpio, 1);
>> 		/* a short delay before powering up */
>> 		usleep_range(1000, 1500);
>> 	}
>>=20
>> 	err =3D regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
>> 				    sdata->supplies);
>> 	if (err)
>> 		return err;
>>=20
>> 	if (sdata->reset_gpio) {
>> 		reinit_completion(&sdata->cmd_done);
>>=20
>> 		/*
>> 		 * The datasheet does not specify the power on time, but
>> 		 * considering that the reset time is < 10ms, sleep for 20ms
>> 		 * to be sure before releasing reset line=2E
>> 		 */
>> 		msleep(20);
>> 		gpiod_set_value_cansleep(sdata->reset_gpio, 0);
>>=20
>> 		enable_irq(sdata->client->irq);
>>=20
>> 		if (!wait_for_completion_timeout(&sdata->cmd_done,
>> 						 msecs_to_jiffies(STMFTS_RESET_TIMEOUT_MS))) {
>> 			dev_err(&sdata->client->dev, "controller not ready after reset");
>> 			err =3D -ETIMEDOUT;
>> 			goto err_disable_irq;
>> 		}
>> 	} else {
>> 		/*
>> 		 * We do not know the real controller state (was it powered
>> 		 * off or reset)=2E Let's hope that this is enough time to
>> 		 * initialize=2E
>> 		 */
>> 		msleep(70);
>>=20
>> 		enable_irq(sdata->client->irq);
>> 	}
>>=20
>> 	err =3D sdata->ops->configure(sdata);
>> 	if (err)
>> 		goto err_disable_irq;
>>=20
>> 	/*
>> 	 * At this point no one is using the touchscreen
>> 	 * and I don't really care about the return value
>> 	 */
>> 	(void)i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);
>>=20
>> 	return 0;
>>=20
>> err_disable_irq:
>> 	disable_irq(sdata->client->irq);
>>=20
>> 	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies), sdata->supplies);
>> 	return err;
>> }
>
>Thanks, it seems to be better (thou would be nicer if we didn't have two =
branches, but=2E=2E=2E what we can do)=2E

That's that enable_irq() in the middle=2E=2E=2E We could have more "ifs" b=
ut that also looks ugly=2E=20

>
>I added you as Co-developed-by :)

Thanks but I don't think the change was large enough to warrant it=2E


--=20
Dmitry
