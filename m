Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793967094;
	b=Mv0r+DHLx7yPrBH2MNMljClJG7Afp+BG3XM7bdWqteHHhoPL9KWOa+4Gupah356ifVDs
	 3RS5F6AViFPjOfI88+1Wj3rxbTeRFQIYp++PaXv9Gi+9vvtYQBV2a6gfgA52FfxrJeWfg
	 4vCDaiFTU9IyuOZjTVxfraufzEEy/5olFTV+G8yOCEw+fmY59a46TjbKxtqZklUP6PerO
	 Lf0qWpgaH9ymt4TD8O9SDe4N0UwHVf3/xgoNtaGKSrbAhdWEAUaI7yEOyftShR0prkaJJ
	 UatLkysedTPhybCIHcvHFJRMopDT3wu0Se0hjEaR4gavUeIstYSrLx3hb9fK4j6sJUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HaMBJ9VdOEiBAxflufFgbsIfyCEF7W4YXAUVe1OEFHs=;
	b=CeGfs+ISk/Aqm0Xb+zn2h07hVMuuFUjgshomz5PuLCXgZ0UMaTB46V9nzUa6AKZDuo9G
	 m+6ox24iLtHvuHQ4I6jPcvSDxZKQlLFiPwIqB7WIs+YCIta31ZxkMWiPapt/QG4wSgWOZ
	 q6FMXESNRbIjNOuihJbrCPOIUtOCXvOf2g5mULgLV1ceAU6+DY+hWfjjccrIzDhdY+7B7
	 UGrSwtOniF4zoQ53dMqmc12IA4YyfUa0mConPXBAqUasEOyxqSUtALz+mGqjABQwHGS9K
	 h9fjK2CXydPl7G2P8RsfN2q8hFU9in4zkBrED/aYOrgaJhWrX6R4bpBcBU9Lx1ocsdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IZF/Bzzd";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A43606EEB4
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64A43606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZF/Bzzd
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ac65e845a8so6359731fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:11:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793967092; cv=none;
        d=google.com; s=arc-20260327;
        b=WHbghcesSxf0dBjn23EX7GyfijgxlbrawQF8gp2z1+1c1BQtPAnjhVNljHT8FX+Jzu
         mRX7WTvSaJUgdTyTdSaV4aq70dD5sVm1LhBvLQc9hYIc72DyZDk8QTYNHx0Yv3nGTHvs
         v3XovZ16k8uMuqH8Lak23WLWnOmlSaEA1wTqfzKsgBDlfE+FOG/EBtf+mlU+FcfVv3xz
         g4by5MggQojcMG3wzsfK7yCLjRMEpxBEmpj6Ns0mjLYa4gmMssvDTStV8IYQzaMsB0lQ
         5IGRtXD9OI2wX4W8XnjrJHVoHQi44XeLaO4ELTbJwdjHoky7q+lWjXYAUk4wRCWS2sxq
         t4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HaMBJ9VdOEiBAxflufFgbsIfyCEF7W4YXAUVe1OEFHs=;
        fh=dhCZjE5eN/Wp8uSwCp38R1NQGpS1JMN+3VjvDPm4sDE=;
        b=nD3nUnxqwFhFZTLJnqT1MXaVUbolni2Qk+NOvTv0NmI+V9/hf+ZF6ghh98RRfmCneS
         GRzW10+wZVCLGFoAAvT8XBrLbLFBfFZ0VanvCiJWdbyeAHDbgLa7Qojj520kGgXhF2Ih
         PvKX2MhvPYrLYXWgwbgk8F+WtAvq3vE2kxFE/uCgUnkGjdO2JZEE/FV/msiBbG7jDrLz
         VgnHuXGxHkJeW1h0GTDbKQNEDLccDBc/qupWjGbSQ5a0Tlz2g8keYuXluO4IfqH6dZr8
         ZJ7u07A6kKSwiHWgTfN0spmETQckpKF1jWXv/q9n+pOQvuyJH/QDJqxhMQB++BaXEXce
         DBZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793967092; x=1794571892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HaMBJ9VdOEiBAxflufFgbsIfyCEF7W4YXAUVe1OEFHs=;
        b=IZF/BzzdlFWylnYqA91PN1wF2Eg55i9A05RS9i/ErJ4lUQBhNYZjvV7H4H6QA9lOYu
         k8IXKOgM5s0qvmdUJpxrH+FLbeQXhxW/HUtKyMCpfuYe5UF9DKy+RCYLEt26Hww0zRZV
         qiBJxTwxm68aFeckSF4ZN/flpBBXa3AJ9N2RnUsn3v3eWpbDEmZH641WzQce421aQJuZ
         KKcRSBTr2dfQMsVNqgsW2ibfXxlfov24+CPdNiVOogwZgFxJ2LQpak0F/xJE6af8Wc84
         vf7x9f3rMk0FdrMlV29NwYL5IEWmoz2sNq5fo+5uIe5t7+mqnRG1AHe9Km6Nyy5qk8nW
         AAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793967092; x=1794571892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HaMBJ9VdOEiBAxflufFgbsIfyCEF7W4YXAUVe1OEFHs=;
        b=v3jcMZ6ufg/3iB/mOD4iwOYNfmQde/joKPt8HtRyW6frJ3AwxKgG4jR74NrnsEzGv9
         E7tWzm+xF9ft31657tSjCRUF0qMoTexPqj6KOlovbAebWdAQunwcPHsfnStCFFkXfyRo
         ry8jGcZjVrWWnNvia2qpLlRgX7jd3M0KkKeanUEZx7xVPCilWsAvy+crY9XH/jsEVcX6
         NE4Jgnv8W35n6FY/ZGPgc1YpTGjSh/PiQu46SxizzGauQszZxCbid3Ne3mFCT0fLF4VS
         9nCZFj6FMnuuPJ7jH+zz/kP4WEaZ56rSO8xDDbABZqSozo8+dCh9Guc1q8v+tT5FEzf3
         SbBg==
X-Forwarded-Encrypted: i=1; AKwUvBzpZdvRGacXeVTCWF3ESZ+FA+z9GtQJVtXX0PcDxPPmhvcVeqKWebx7yIef+ZQyd65zurichhNsAMKCh0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nO76wn03OwZO/FCop9V/ML0fc6h/PBz4fdKoveFp1dgtLxZyU
	DdsUgQJWRpxvAbp0QX1JQI9Sgv4BpF3QHpl+x5gFav4qSSodSZv1Drg7anzdAmsqt7LPqirxwxy
	9I8b+bGIzIt1FINB/uRCuZ80voObl+D+f1Q==
X-Gm-Gg: AYBFou0pVtVZwm2mhH0m9lvQtuH4s3mpotcURj1X/RSYxj2g+P6klw79U+FbwdjewbZ
	BxaT2QqZy8lOsW6rPxpsmKON1cAXbXF8cfpi1ruCHv9hdLPKgrB2v42Nv03uFHWDYKzJKCwx+oI
	QXsKy9+87xBfJA127TiMVjClgZ5uE0J5ZijR99aS4bZhoU5dAzRQygTkeMD6OiTx+xBZdHsoYjc
	t9Rdzty5PlKbKVnYx2ZuraZ2YN1WfmS3kC48Is5oXeo8DhjpCyrpfkY3lsgztay3ew2TkRrrF3r
	p72ECtVa/rqThTySUeNYs5nQdZ/hZvWGG46mJk+XjfB6jUdoVdcALjklgWVExLvx0nPAcZhNq3a
	zuqhhL7Jes3lUCCDO+hJWQWc39n/7v3Hk3c0CXx6RziJmtgVOe6RXwZMuviuRGwUSzXgZf1129E
	wj8W2QHgYUhT9bn0pqdbIrjZ0IDg==
X-Received: by 2002:a05:651c:a168:b0:3ab:ac4c:186b with SMTP id
 38308e7fff4ca-3acf3a17b03mr4522841fa.9.1793967092260; Fri, 06 Nov 2026
 04:11:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106090342.2601665-1-hongxing.zhu@oss.nxp.com>
In-Reply-To: <20261106090342.2601665-1-hongxing.zhu@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 6 Nov 2026 09:11:19 -0300
X-Gm-Features: AclHuK9TdxwLahGEGzjbAfd8oBsJGMVuCCTSxGyqd0oZVKPE9N9p0AqrQOMBJUs
Message-ID: <CAOMZO5CQtcpb04Vp49Rg_+DHoozRpQthW3_YNAYQHqi=VOmpEg@mail.gmail.com>
Subject: Re: [PATCH v1] PCI: imx6: Enable L1SS support when supports_clkreq is true
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@oss.nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 6:00=E2=80=AFAM <hongxing.zhu@oss.nxp.com> wrote:
>
> From: Richard Zhu <hongxing.zhu@nxp.com>
>
> Add support L1SS support for the i.MX6 PCIe controller when the
> `supports_clkreq` flag is set.

Please explain why this is needed.

Also, does it need a Fixes tag?
