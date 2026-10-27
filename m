Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793143327;
	b=3tAf7VlcXuYTp/QakN6fx4GEmC1ztfgnjwminqZOoz5ZuzPo1oMMrUUtitqwiyK893us
	 UXfN5c1+7Ju1MSpRkbrMfFe2C4XebKYAX5pjoFey8gU+n/MnZJJnCfPYDOJ2NcO58j5+i
	 2Yn4P5IbqnBBc/Wa1t/U/bzhULZwOQG4mAPDVTsEqX4BXeQB3TJ+lsTTt5HZY8z9dXmq+
	 hhMvMKfHnsdyaxzETsB+MToje8N4undRv4yuH7qziEd+tuYYI0kLz0AY6McWJTcY9/UTl
	 mL+AL4/Lihimb50zzWyesvO1iPtuB5/Yop7lqlEDUrW+OOqu3bdtu9sLwmsDVtQnx9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793143327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YtzWIw2tmWzRFpwiGfEGzs4PBBxO5+sgv4xgYivcggQ=;
	b=kENTxvmAvapurH9dPqi10zZcSwFnufoUaL8BCT2EOIbnHceTGojxVDLnSB1fjunmjo1v
	 19Zyhr98YNfe1q0EMGO0IzRYsc8HmhpOzpmOZTRsTunwIF3o3K7FkACXQfR6yYnpMm7aU
	 lkm50uH1QASdRBw+p8CFVh1uO5d0e4u0/dIiOBWgIN15w9Nykmakhw4yu3i5KcRRpctcU
	 EgSxJcT63WAHM1csQWwIuQs7UPnoOQveWMG5Rbrr5CizwiNx5IJ3drgj8Szx7ExOaF6qF
	 fc3iUhX5KGNOXq43fRE0j26GgtTOSDOwWLzYwiaEbSX54stc2CCHxjTi6db5/3azgeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=cnpHGUZb;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C348606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C348606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=cnpHGUZb
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so761676eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793143326; x=1793748126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtzWIw2tmWzRFpwiGfEGzs4PBBxO5+sgv4xgYivcggQ=;
        b=cnpHGUZbIKXsy7Jf8Ah8l/Y9ojHH0W/E2odwf9XisvJjDJI63dzMH3uQl4gs4gJ3zY
         xhYKKpqUSuwcBBIh7xhZMANRcfsp+FfY4S38Hc4kh4FtJ2GLgyHF28dPPi44q1COF8sA
         zcMhITryXJ0kjjf3S5BAUvlvehHxdXi0Y/2ipK8ASxMw5IqYCcNugp9iKd2sJMGxs6kE
         lMVFRaQdI25EEajy5Ab/zvquzVQL264Nq6TdiuavjD/KbJkv/cXQrfhW1ZWEloSXP0SX
         efAbTyBrke7ELIcdyFBRh+pzX7DvyVPJ+NdqDSc6RzNVirCSxg5pfATeR2I40+ii9OCA
         yWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793143326; x=1793748126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtzWIw2tmWzRFpwiGfEGzs4PBBxO5+sgv4xgYivcggQ=;
        b=QAnpWvuyMr/fTUjrZSQ2tlHZIhzWjYNj0Ohalvk0O+u4YEVtFGN9+A0wfmiIHxzg7w
         hXWfwpEh6DlLr7k5UMPUCisRvzz48NO3woqKmFFNxhcXt6BpePBBwWbBNX/0ZJMMEnls
         XMDhav6rJo6ymCJcuSQvraZFa59utR2fvWbCxFBmmv8XR0Gfqu2QTzZAF+byHYgR0q+2
         FJtXFN3E1xyzsyuyGdkEhlvzilaNeyfq4eooCSchmTnYKIE7uak0k6umW1ERVETmGKL5
         qXhWPV8gS0oGlHfB9AvSpkr1EaQcLN9HR2552Zq4cbMcExM5S+kSp72GX1iMNZnea7KB
         FY7g==
X-Forwarded-Encrypted: i=1; AKwUvBwxVQ3uoYnJYv8xWArJMuZ+AqoUGY4DXIA+6hG5Q9B679zBQ/UqJzg82PHWeTs7Xq7FCgrpZ+c2FzpphWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLob38IYXHNMAAMH0NHFUcmY9PXqwCwJmqBSd0UIwZ2TqEoz/EU
	1dcZlgQHd2M+uxpqVjqRYpvI+R5I550IWVSJuSh2Jm4SIpJZifCKbYpAW5KxVwmBvT8=
X-Gm-Gg: AYBFou1eUtJeNPG86vVsOGhuVblHmCwjRb6Ek54ry8paTEiU1fSEB1cP2IzA80LJhnk
	vrfhDHZ0eSAOqDKyKEfkRanJHXIMPRDn4xVLLpYugkFX5TW3nsZsYc+Z8gmMe910qu20BI+aEHS
	7jzuq3bH6KQOs2vLbTyMxKRg0WzOYrweSya+OSW0U9oW1XQ2jQsiwQleQ+4+HRE9dvXOSXzcedx
	5X/AXb3MktIkIlZmZKEO2em7Ijom9LRNDtii7iad+pxG6jk70BvkdWry5NwXXVZo/vZq0c65NxV
	Grm2NkqLtWyH6/UUHFPgNINZCC79VNMU0R99/9pYU4e8IBKMSamLDLkJI1R/q++fpPAkk/FZO4H
	GDC/iu77zJUmBFGE7B+oz1Ikq5fDrqgKy1hqKaO5VqQYsysUVfqaglxvQVEB04eorPlv5MCtGZ5
	NCfJ3/J0wb80dfp6EEPUTxkVd9kDsEfdCq3XQNg4D5CyMC/4s/idX0kIINisJz2oU63QyqJ7tcT
	4dftt4nn8N+ZMpXy8lS8nfjOGL97UtMze9WSGg/Ibo4RKcVXkfZbqcxSV7Ki52ovosqmucW5iPT
	iZsQ2fuDlalJWw0=
X-Received: by 2002:a05:693c:8946:10b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-36a20407ad2mr1240160eec.25.1793143326214;
        Tue, 27 Oct 2026 16:22:06 -0700 (PDT)
Received: from kevin.us-west-1.nexthop.ai ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm73101eec.8.2026.10.27.16.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:22:05 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (fs1603) Add driver for TDK FS160x and FS1006 uPOL converters
Date: Tue, 27 Oct 2026 23:21:57 +0000
Message-ID: <20261027232157.3395142-1-kjia@nexthop.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3735b504-30ba-4656-927c-d321248102e1@roeck-us.net>
References: <20261020-fs1603-v2-3-0986107a5cd2@nexthop.ai> <3735b504-30ba-4656-927c-d321248102e1@roeck-us.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 26, 2026 at 03:04:45PM -0700, Guenter Roeck wrote:
> > +static const struct of_device_id fs1603_of_match[] = {
> > +	{ .compatible = "tdk,fs1603", .data = &fs1603_models[fs1603] },
> > +	{ .compatible = "tdk,fs1604", .data = &fs1603_models[fs1604] },
> > +	{ .compatible = "tdk,fs1606", .data = &fs1603_models[fs1606] },
> > +	{ .compatible = "tdk,fs1606-0600",
> > +	  .data = &fs1603_models[fs1606_0600] },
> > +	{ .compatible = "tdk,fs1606-2500",
> > +	  .data = &fs1603_models[fs1606_2500] },
> > +	{ .compatible = "tdk,fs1006-5000",
> > +	  .data = &fs1603_models[fs1006] },
> > +	{ .compatible = "tdk,fs1006-3300",
> > +	  .data = &fs1603_models[fs1006] },
>
> Why those extra compatibles ? I can see that -0600 and -2500 are
> needed, but the others could just use tdk,fs1606.

The FS1606 reports in 10 mV steps from a 300 mV base, while the FS1603,
FS1604 and FS1006 report in 20 mV steps from a 600 mV base, so they can't
use tdk,fs1606. They do encode telemetry the same way as each other, as
does the FS1606-2500.

So for v3, I'd like to move the bindings to a dedicated tdk,fs1603.yaml,
where the FS1604, FS1006-3300, FS1006-5000 and FS1606-2500 list
tdk,fs1603 as a fallback. The driver would then only match tdk,fs1603,
tdk,fs1606 and tdk,fs1606-0600, with three sets of model data. I'd also
drop the OCSet check and patch 1/3.

How does that sound? And is there anything else you'd like me to change
before I send v3?

Thanks,
Kevin
