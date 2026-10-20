Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517956;
	b=CQjPfnxVP/vydDflX7tApBm4k2j6qgLit5gsf62S1ete+yYaLfX6JzszliHme0RlzwYR
	 MyUt+9gtvy96yyrZOuDSAF02OJWlRrUqidPM312TTr10B0ZURYZdXZuT/QHXSpwr8ex5l
	 UoSLHxFuKat8NQhR96gifEE66jXGQzRaRittnWBd/PWqqtghjbR/fzRg7GgWGeOYwB6qj
	 uLqw6eXMlX7JwfD+YOa3u5v8ayidCPT6/MZ7kxY05tNTHDUm2EfarCLlExho1nI/xWGs1
	 WW8xopb4P35OVuEs3f2LqLpOGOH3K/U7a7A0Jzm7/2DbrUrjbmSE6yCKgVQeuJJuIQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517956;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ejnXPpAefmwKQuaZISzEiXIEf4jvZdKKJ6wwjfA1jmE=;
	b=5XQHP+8mUC0CP/vCNX/kY13ZOvFyi9+rjwcmDlxsVd98MTDpIRq81001c5YeOEmiB3xI
	 XxpF6e+6CELmsbqfQi91yIcDP41vN9x+r2dl1aRwRgz/LcBqDoZ0ENX8WMKgWyTVwhu/T
	 MmlsKLdsiZI7/DqnsecYLbPnV9td2PtJPLSoeQsvzbF/SYDk5YWvsmOkYtA72qRktr/j9
	 N1AbH4IYv4l1O3j4UDB9N4fV0bxJ+35jQxx2lNWwH+0Q0XgyRu9QPms6nFyNA+JcFmX7w
	 DjwIg6mQs//3zgL1kY2CyIRce9Z1pKixsm41E4MTDN+Wk1EHgcTCK7Pu4UD36YkxgaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GIIL0DGP;
	arc=none smtp.remote-ip=91.218.175.49
Received: from mta0.migadu.com (out-49.mta0.migadu.com [91.218.175.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBF4606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBF4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GIIL0DGP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=J93Fn08gXYX73zzQt4Psiim3AWUrAfxgKY2VikdZQGc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792517953; v=1; x=1793122753;
 b=GIIL0DGPIlC4PaY7ZV9s0PHMeAzJelUYoMjcKVMqAiIhjziedNZW1ML9b/7sN2c/2o0TpHTx
 cGbF7PvjV647ncvSo9XPntZBwIpem8RQ0AyEhFb2z6P4RU/l4EVGqlr+U7MKs2I5ks/tuJ5wqp4
 QQoDAllijQ0bOp/4doRCKUnU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4ed11797560c934b;
	Tue, 20 Oct 2026 17:39:13 +0000
X-Mizu-Trace-ID: 4ed11797560c934b
X-Migadu-Flow: FLOW_OUT
Message-ID: <fa5487dc-571d-42f1-8cc6-b838cc4040ed@linux.dev>
Date: Tue, 20 Oct 2026 19:39:11 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] HID: asus: Force hid-input to bind to the Zenbook
 Duo hotkey interface
To: Paolo Pisati <p.pisati@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Joshua Leivenzon <hacker1024@users.sourceforge.net>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Rebecca_Mara_M=C3=BCller?= <rebecca.mara@posteo.de>,
 Luke Jones <luke@ljones.dev>, Ivan Levchenko <me@livan.pro>,
 Nathan Chancellor <nathan@kernel.org>
References: <20261020092423.36380-1-p.pisati@gmail.com>
 <20261020092423.36380-4-p.pisati@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261020092423.36380-4-p.pisati@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/20/26 11:24, Paolo Pisati wrote:
> From: Joshua Leivenzon <hacker1024@users.sourceforge.net>
>
> The Zenbook Duo USB keyboard reports its hotkeys on a dedicated
> interface, separate from the keyboard and consumer control ones, that
> only contains ASUS vendor usage collections. hid-input does not
> consider those an input application and never binds to the interface,
> so the hotkeys are never mapped.
>
> Pass HID_CONNECT_HIDINPUT_FORCE for the interface of Zenbook Duo
> keyboards that carries the ASUS vendor collection, which skips that
> check, so the vendor usages go through asus_input_mapping() like on
> any other ASUS keyboard. The other interfaces either have a proper
> input application or nothing worth an input device.

Reviewed-by: Denis Benato <denis.benato@linux.dev>

> Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
> [pisati: use HID_CONNECT_HIDINPUT_FORCE on the vendor interface instead
>  of injecting a fake keyboard collection into its report descriptor]
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
> Tested-by: Rebecca Mara Müller <rebecca.mara@posteo.de> # UX8407AA
> Reviewed-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/hid/hid-asus.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 54f4d68eecc7..68211ebe1290 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1514,6 +1514,7 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	struct asus_drvdata *drvdata;
>  	struct hid_report *rep;
>  	bool is_vendor = false;
> +	unsigned int connect_mask;
>  	int ret;
>  
>  	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -1609,7 +1610,15 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		return ret;
>  	}
>  
> -	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> +	/*
> +	 * The Zenbook Duo hotkey interface only has vendor collections, which
> +	 * hid-input does not bind to on its own.
> +	 */
> +	connect_mask = HID_CONNECT_DEFAULT;
> +	if ((drvdata->quirks & QUIRK_ZENBOOK_DUO_KEYBOARD) && is_vendor)
> +		connect_mask |= HID_CONNECT_HIDINPUT_FORCE;
> +
> +	ret = hid_hw_start(hdev, connect_mask);
>  	if (ret) {
>  		asus_worker_stop(drvdata->worker);
>  		hid_err(hdev, "Asus hw start failed: %d\n", ret);
