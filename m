Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794464451;
	b=pB17rvHZeUK3h5OS+uiEBgN7fP4fJNwypTpYIYSoi7sfhtGJZebUot5PreTWrf4JMfpB
	 1sVeiGzr6KRTvsCgGm2abtApHm8QgiEq36ZP3KdLCo29UT14iPjE53ab/uvDsqDyAG2HR
	 19VLYFsKvSaumrk5LbtTR3NHprcVnqzApNh4Uog6EgjY08jXlhXxU6aB2VS51plEQSswB
	 bOGOdA7iOX3h6BW7832MroL6QzZWK5UHtktmRbQUMeJ6qkMsVB+CX4ki6TppodDZ4cWQT
	 ZMHnzm4A6ZfLAZ1MlNP/eHbUikwvBb/87B4d59SvTVltSwiZpTpSK6vpbvX6IBW9jsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
	b=tEhKxMGJZuQetqMUXgyrfHLjJw82uEBryE9a28WpAXFN2h0R+FDmyjuE4mqYPuINp6OX
	 OJaIMjhwld8GxJ3nzdR6IEjvORPHtsTxisxIpKHXYJH7BpEqdjldRl9slhwfWilRSHEmy
	 fCCf/oME4dimYRU+veo7EOUUwwoYAY7DstiUbtD3n6UxyDxZPUq/w31XC/dcm2SG6bbwo
	 6yIjOOOC7vNhEC28phtrBNxS3KfbHAJ2aqk7hT/fhCaIzKP3dp02MzcJP+wV7ByCEoxH3
	 myWg5QsUJSBqIr9AxnUGVrtyeA+qZkRg5W3PPb5JE3yVvDAjdlNYu8Uqzb+7n5LB/dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mfB5hIVN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D985606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D985606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mfB5hIVN
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so2918014a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794464449; cv=none;
        d=google.com; s=arc-20260327;
        b=mussA57Dq3b/7qDN4a1dKe3Ct4JnfyFv/8zVMpu2zkmyPYWBjZ5d85cPiHNRtEu0ZY
         av5QypB0rMPBVsET0yCOd8kziOPuPKjaQ4pgBU1TiraUkTJcO8Ab5cIhWbzHOX4dpyyt
         4HFo7zhgOJRLyiWZu6nAynMMiYVRrK8VyQLAgowDf42FVEOAMNU1aFXuOS7lk9IiBci5
         oVAxNmQjYcJRtTIdRSLGE18qBMOpPIrFe2LHL0X6omdFv+ovDisUldoYdCeKjG34q6pH
         jFg909v4srrMidtsnWZdXjVo6DXHbMq/kw6E9Oop3UhEU7vQHO67V46O1dvxGPeUO1rX
         se6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
        fh=yWjP5Zr8B7BCbKLuCH8TwXeTlEjS3hEMDDJ06TCFIRY=;
        b=d3uhwA3+qv3YymCT2hyjXqy5sv/C9kuIBbjxc+IRA9t5HmD7Z+ck9I87mBOF0sFznV
         sQlbBP0S4absw1FWdruLv00YysQXAHojFhSGeC+LZamJqIfk7PYglg1QXGQDG5ocNj/W
         afPFXyYz3Wnhh/YGUJLtNIyR9LlW+EuC4O8G2IMtRDpluUKJ9Mdd3l8br2MgSRg6eX+l
         4ZNu7dAtLYSIrVJsZslKEWWM5Bx0WJpXUB3ZjbtyzFCoVgLUihcNdzUJRNT4mTLjJ0DM
         m0YvH6FrHqTOtX6uWSZMt7n6l3qH6XDynsGpVBatXIBVTZaZ1YMgeHHLAr0W7ywOIHjl
         zXRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464449; x=1795069249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
        b=mfB5hIVNWoDc0eoZue/HOZ4HTeEVeg6PgM4Kxapc7zgauJNbm3Z2s3yfmse/uf1jA6
         7EyIjfUUrCS8j/ErOGcMpU56GwoPk5T7GaOMB/PSDa5zmu2k+JMb9l+DwJOCt3AlNMHY
         8w2iIjN56mQqDaUzU8JoDk6axWRaPSvo35mZ7KOhNQ/6TRMA5VpXTuj+g05XrdHGvYHT
         uAdDIk+FNr893kh2DXjOEz8s4ldN0KCQXku1Cfrjhvg0HSDq4ZvB9PWVbRv9e2MqijRR
         Y5RhpXs75aPeGNFaI69337V80axoszmUBNJiLINmkCgBqwfl6OqQyHv8+IlKxeoOJk+H
         fSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464449; x=1795069249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
        b=2MZ65K4ZyUpwQjJhBvF58WowwBlic27JJ37ypU6Q6OZ5h1xQD+jRVFBi/MVN8AS2Qi
         9s3DdBaSNnnzry92aSGpL79JR24PiS1kSjiV8OPCM+ZZYcu4pbSyxyYRidwyOJZFq3+i
         vXcXCQp1kZJHFtvLxKy7C/FRGty7Q/awV4VGACS0Y6D/32MjW0bxT+4GqvSDXYxmMykx
         6cAWaDKUjU51va7C0FmfDa8dhD7KkLEG83b0lWw//mOkO+2fxZNVHicTJPGj3+8ievhX
         KAp12o/WfAcl5/uui4zNZjPjZOl2PbazNFfoMCgKfp/uYyktCYPZ8Wgpn2lg9nL0coVq
         n9xw==
X-Forwarded-Encrypted: i=1; AL+hErGLxIqZ4BfKReCi5+AbwG/euPp9q5etKd2j/qOPTLe4EzNXBxFamJLMgvEWCjCUqF+DNQb7kyivOLk+Ptk=@vger.kernel.org
X-Gm-Message-State: APuU4Z829p1eVyt+/AZ7n1ow6/SxZbhmhIzSBYUFjtAfrUMBMnYuR7KA
	UeiV+KDPdt9SkjxzlgXZEip0HpEwLKG//oK3saAF7UuKLCIgeYbdAJaI5rneux5Ou9wNrlP1awn
	AWYaEbV+/QAiL/0UgLEXqNcGtbduX9g==
X-Gm-Gg: AYBFou3nMDb0ukAo3kv+qwqHMsV5/a6iBeSjChQAflUC0JnzyJeZsR4V9538vcRejHa
	oVUucpW3jbyuDIxGOh3vmBey9MlyxyVr21I2kqCHnkRmHASZrwfyNYi2j5iNVuciGQfLbTqGLSB
	NOGcqc2tY4acvi8TXjktM75ixBhnnTKJhD5D5dP9hyED2snXVFVGfECUWMT5SyBRmfRwMYNRUJ8
	jhvmm+CZIU+vbgsuSqrI4EdhOo8plIBpw8GVkxehvs1XNRKNKxv+MJZqPhgWE708pjo7h9Ow6Ze
	twwDwrbmJNcPrkYmHAwdU/qsQi/2yxw4eqhDXxZD2ASFchrHT4JHzzQLRA0L0N69ks0dZMx/5Ti
	JSXbGopkdYXG6d38hdDTKfwjBH0mf4CF1hu/PF51FvDgHeN98FXhM+Al5hzf+x6gYiFeHSsJk8C
	DOOw4XkhVI5POGuGXp85pYQmeZPXt1Jidzi8xr2RDp8lzPrrc=
X-Received: by 2002:a05:6402:2809:b0:6b4:21c1:21a9 with SMTP id
 4fb4d7f45d1cf-6b7778159cbmr3839503a12.31.1794464448878; Wed, 11 Nov 2026
 22:20:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011222234.2098904-1-mhun512@gmail.com> <179406798190.3424803.7064068903462702662.b4-review@b4>
In-Reply-To: <179406798190.3424803.7064068903462702662.b4-review@b4>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 12 Nov 2026 01:20:36 -0500
X-Gm-Features: AclHuK8iacxlbWVlhHrmZf4nXYKveYZX5zn-UdiKOJPEhizJAmxWAuRAURZ4Y8g
Message-ID: <CAGEsz8FAOrkf7AzjfJS+ZXnU5eZdTbSjYtVtceBimH=RyMz7YQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: fix AFE IRQ registration and removal ordering
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. I've rebased the series onto your for-next branch and resent
it as v2 in a new thread.

2026=EB=85=84 11=EC=9B=94 7=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 11:13, =
Mark Brown <broonie@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> > The AFE IRQ handlers access regmap and PCM state. Register each handler
> > after its inputs exist and release it before the final remove callback
> > or managed component teardown releases those inputs. The mt8186 patch
> > also balances IRQ wake settings on probe failure and removal.
>
> This doesn't apply against current code, please check and resend.
>
> --
> Mark Brown <broonie@kernel.org>
