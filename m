Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308443;
	b=TFFqwVFC85UjEkkWgsgzfw4zFBMlb3XOJhHo9Q6RBqo8LBOiXwhMSpqFZtEMy3n8YrrJ
	 KtIcTkeFOU58sChytaFW39VZLoDiHHx80aHm0HMskXrq0p/AEjsaLQJlGaprfVWDv5kEW
	 MMRa+CZJ1x5lRRXq7dgv/a0nHeQbtlI/u54mG20pjaKZnZLAGfQg5YRKGs2y5bEizNi30
	 WyCw0Mc0v4QiaR652cxfRvuQwfJh7vd0eGu5R3LymkbSx2WyssJMLNLUcwyVXH2U4/bm5
	 GEHZilVWoSA1rsdXSNOwdVKeSC7lvBKgex6nUE9pCtmg5SsJQ5RoURB0RtDUANDoXIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Wv2p26gpeUqh9YHe7IUFpRTwcMzkjGJ1jZc1lffjWFU=;
	b=WkvZw4LjA/F1R+74nodYFYZwqDvLXPDFH2EEqzFl1TLc3SXYV+3fVQw0NBDLs7p5AM+0
	 0kzJJ40uFjLD+a25QwZCS1AsZz1O9lEyRFpt2bKDeeLKRhZ4ABSoXDe7kmok2PARaFzNb
	 znjc6z+GEaxS3ApsWvxCCg0DNrjSKlQiv0dxoFjlktAJ7he+55hG5CTNIDZtBJD/6kZgR
	 mAWG9zRxEvRFqGwwS18QJnkvNgNsDP6zlez6JZGLYiD01nXg553EJX+rpJBC5j3KWF4I2
	 I2bFUr1hosdq7tYT8Dmzp+5KMZDwTvMjseECS8Vs3OrN9Fkzk4a7EtBsi6CywPStogg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UR+oRQEN;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92D460A383D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C92D460A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UR+oRQEN
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so15805325e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308441; x=1794913241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wv2p26gpeUqh9YHe7IUFpRTwcMzkjGJ1jZc1lffjWFU=;
        b=UR+oRQENsNTyw3m8WPRxHakPMD/6M89G2GAH08z8luOgAuTYMwATMm40YkQjUmifrM
         0I0lYgItJ8iRTCd2Zi7HSPoiCb9Jfm897ztEJX6ly4PAjZK66S7FQpnPTnp4WfOgil71
         sS6EAeBEnAQXtYBXug/wf3vqUhZlNR/waxaiX4Vbpj2853UP0Pj/t+2kEPD3uzJ4Z75N
         Vj9xgTWOoMaDcdSmCpYtZWf8y5aFClQ9S7OCYqvtOzp0DKEA6vOIZHfTzdUKMwoECdwy
         qdoejJJ5aBD9AYCkstvgOzgJOwMHKNFwgSF/h1BLTJc5BS5UWlvnbo/XPoCHV9iRnUUh
         itTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308441; x=1794913241;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wv2p26gpeUqh9YHe7IUFpRTwcMzkjGJ1jZc1lffjWFU=;
        b=tdmGGiBsczQw+D5LcRUzykGxMKPuhSExoCFkSkC7OSEaVC6r8TRHMk/83hQDhLok7e
         4iI49T5W3ZA7eeyhmDR+dspvAQx7HtEo2+1LR1zXrpWdFCFuTtkuipVyXU3vFK3ck1uS
         uQP+HHkCbXw/fA5k6kdrN2ypmbfldBB/hGJxgeTEUlH/E9qOkNMCDPzWMsfEjpWerf8B
         WshxqO0AabVZiHFMjT4CLuQtb+1jY25S4uubzTxGaWhU/hPFwcgT/bYoUJ231aLH/pQg
         LKsc97GuyZieBpfU0U2/5nKIMz1mvaNXufeW/JE7jaEeuRVkWzbzFJeRV2d78PNZy1SN
         8frg==
X-Forwarded-Encrypted: i=1; AL+hErEgXMi/TvO0UC1TEofyGIIvI4XeTqD4Hh2UII/D7jXQomWpImWbjrlEK2kSJ/+vb6GeiEabMrzG3t1M6KA=@vger.kernel.org
X-Gm-Message-State: APuU4Z82OMehW+PfK3tNFGrtX5BxBY+8m8e356YlSo1q2UqzkyjnD3nQ
	T47q6marsMfGZm5yMG6m9wyolfyda18S/NjKbLTqx49RO+xKL0MRuUyg
X-Gm-Gg: AYBFou3xEllvd0Pg1d1CXO27jVCu1m//aFsNYSb7zy5xF7sguI9T2gu9uFmWOlHjmVw
	LFF6SeH7bWtqZPVtEMnw9M7jgBbbANEboxgIZC2kLCOD/8Gisd3BkcObf+AHHgQG8oxFcV10f2L
	43i3dJr2tIaAVSeQNF+jBejXLIcWlNg8mbNr2l6PPnfllmFTut2KnnESiN+DpuXp21kjjcm0w9I
	D1JsJCenyyuhmtnQgeMTegIvjMto5R/mBNm/efY0DXdrOoaFFj3f99MSBlm/pxNwP6hyjPA0gU3
	xcxi904QBmqka+nBUMB7xd9umixBmyUJHx/IYvWwKfS/74VCWzTS3TeyD65RkaPsWgbOFbvA0Bz
	XDVSb2/kldRVGJXb8sAs50lFMFnz5uggaLAbMc9OOMV4aXy6u1FHRECFca7fGxudJBsHHxX8Ptp
	n8VKUkMHUs1HDyditBn4IyELyP7ctq/TdU7QEmQ7oB3/c9hD1V6s9SFzBb7wsJDJRioIQn41H2g
	J+OAaXbmiVzwmXLX882cf/NIp28uBYq7L6Po06JdDCfOgJ8kbHlxtqeXrhNi9f5mkjiL6a2NDjh
	EE/6Y2S6/WcWHPa71kIYVvwoq5iT8fhJ+17/oFbGkGIjgZS64FY4bkb1OLNpmOCAVA==
X-Received: by 2002:a05:600c:6387:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ba02349a18mr35485105e9.20.1794308440720;
        Tue, 10 Nov 2026 03:00:40 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02381916sm25962625e9.3.2026.11.10.03.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:00:40 -0800 (PST)
Date: Tue, 10 Nov 2026 11:00:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Jarkko Sakkinen
 <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, David Howells
 <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, James Morris
 <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] keys/trusted/tpm2: rename "bool" to "boolean"
Message-ID: <20261110110034.0a46b9f7@pumpkin>
In-Reply-To: <avFcjHwnh9mrOEnz@stanley.mountain>
References: <avFcjHwnh9mrOEnz@stanley.mountain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Nov 2026 08:39:24 +0300
Dan Carpenter <error27@gmail.com> wrote:

> In C23, "bool" is a keyword so rename this array from bool[] to boolean[]
> to avoid a conflict.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  security/keys/trusted-keys/trusted_tpm2.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
> index 30188a0ec676..2d6cc53539c8 100644
> --- a/security/keys/trusted-keys/trusted_tpm2.c
> +++ b/security/keys/trusted-keys/trusted_tpm2.c
> @@ -59,13 +59,13 @@ static int tpm2_key_encode(struct trusted_key_payload *payload,
>  			       asn1_oid_len(tpm2key_oid));
>  
>  	if (private->blobauth_len == 0) {
> -		unsigned char bool[3], *w = bool;
> +		unsigned char boolean[3], *w = boolean;
>  		/* tag 0 is emptyAuth */
> -		w = asn1_encode_boolean(w, w + sizeof(bool), true);
> +		w = asn1_encode_boolean(w, w + sizeof(boolean), true);
>  		if (WARN(IS_ERR(w), "BUG: Boolean failed to encode"))
>  			return PTR_ERR(w);

Hmmm... how can that fail?
bool[] is just "\1\1\1".
I bet asn1_encode_bool() isn't inlined - where the compiler would optimise
most of it away.

It is a horrid variable name, asn1_bool_true[] would be better.

David 

>  
> -		work = asn1_encode_tag(work, end_work, 0, bool, w - bool);
> +		work = asn1_encode_tag(work, end_work, 0, boolean, w - boolean);
>  	}
>  
>  	/*

