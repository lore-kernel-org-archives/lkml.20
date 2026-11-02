Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793654771;
	b=pkW+JSex69OSe6zUwrK9xYVohjpL1NbE/0TJAGjTJxT7dgJYSqK/qSwutWzJRgcK4T2g
	 p4SaOarz+aUQB1d0v/pK7EQ85FPdIQkoKPjmDq04OC68+IrnsUnOnz69nqGczJpsmn4Db
	 ohbZAcrDQhNnUYvpbQQVXmA1i8rUn4S5Jo3vJ+5VUt8M/wxHty9QsfxhRz4c7PWXZs5qt
	 ueJj6mYamwBau+VR+jWunUVNMWE6VjBxiTxwyNIqF8GvyP5Ki9u0jTyWYThJ8PuHA2rx5
	 dfLEnPd1Ph06L+gCaY4OYHCiQ7SFr9hd4hgMJJDlafGWIXeNfOHHlfb2e+g11DRjA8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
	b=xijWVgeY7+cP8189B3qO9CQlgrBay+U3mZbI9T998b6atFgiORKW4kiuqf2Z1mvAM03g
	 aXrOhxhLcbl+HMgoSYqD9MhjZSmvKsnqsGHqmYSEEGfqqrAPwL/7slIFuVHJJcpYHOB2I
	 YKPqMr3KhquTqH2U9rFW0gkEf80+LV8Ug/1xgGIqCkrDXLZ4hnnT1Bt0Xc7sdGQURLhn4
	 jLlJlkG5uMKMbfKfbVRU3YDpPY5+ZqRF6jGVeZGAxYZ4p46bexdGlakBWNgWj6mZ9XaVM
	 iuWMpd59WyqVdRbphyS2UiZgTg55H+xwEns1GEf/JN0I/mvmPJrS+OR50gwITwrbu/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="EkLVcAW/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED6606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DED6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=EkLVcAW/
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67989a98f8bso2361347d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793654770; cv=none;
        d=google.com; s=arc-20260327;
        b=kB9HepfEwteq2n+372+Ris0Vje09KPLNdwxd/62THjSegFRCmGTTZUTEK7HB2fNNaT
         2kwIcGteqxKGVE/GW9NHD58+jWtvHBfCJrLmkkxC0ktYBpQuZwUNqVgnHrUQ4zzO3Luq
         aF6wlbGCdg7ZtQmCrHDU+Y+hODaXoKyctf8RyvrtnMJhtrUHQC2F84t31q8FNN9NVa/s
         sQf8jlwKyO+ZAG83InesMJ9Mtm0hRN/s5TkQ78hFYygVPffsL8clJGqjqlHYhefbf2m0
         3h3bVGWbDgjckZDyFWGn/tz+Sd8YaDYQmg8uhXWeCfSjlqTJmCFhxH7qM9d++EisSdtF
         JQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
        fh=MffJo1gPN66quk1e1akWjhettaZaxsSLDcJndhQQBHU=;
        b=fNgN5rcKhBsprxz6VIIv2S7ltgcbOej0lmkGZNcKbPCohhQvl1xdrIoIwz45NsSsuv
         LzTgab+NHsIi0dsk2Up/Vj2A/G2WRlhTCsC/o0MMilDwp9lSGlKyyAN3h5aTVOOqLaGS
         sDZdOxyuU1VyB+E2tfKRAo+Wv126H9h+Nli48tXJKhBdN5CVuyrSTJB+BgQGiyBEQTC9
         nFk34BvXF2HvJeczjycVNeS0hnQbbYzF7FPV3tmIrkXpPZNX+/aLdBWW4KpOoSlFAZwO
         /gK6O3+uPLjW05CncZz8ZVXwH4kCrpZXeESresEQxgvu31giUCg33vjJDzN6Wug+XKi6
         33Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793654770; x=1794259570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
        b=EkLVcAW/XpvqanW9zxrrB5iSWb22+SlLfvpUHT9FfL+pgsufClU3qSiqvOQVZNYepR
         jpa8BAWzVeNCeYW5jaIkem3eDRMWMvnPpt75liGv7tofCUmodFBR0eeOeFX3gWOwDdTC
         QWsh0QyH7OBmX3p0WzYq4bBbnByFdIjaDWcEzhZctWnqf8+ctAVNt8W+tLWYRUqgg84Q
         c6WCTiafAaBb8sr+58Lhr9saMsrPGiaBm4y4xM1fydrZFOsW8Z7wjwOa2S7sAsLE8JJr
         aVmAtC8DPuKhe8jSjHD5rYwj23dT6Hfvbln3WGMnQeO4dgvVSPvvKfoSw9JdvtgXnyF/
         B3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654770; x=1794259570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
        b=HZsaaQ9BNXrHPLKfLlTDB59O/BGBFfAizzEjvkD5M4NONBNVoVG9RYdishb5GzNuoB
         bF2vmDnToIaazBjQPzp/1OJzaH7DSudRAs3abI7xeIxP2PWnvXbwBO58hMESlO/Khm8R
         RSPc1JOumf3NeMWrhBAt45mJxaZaaGZtTRy8V2qbrXj7lUOZFPG7AEnhYMVEWS3eGXTv
         4cfxraytFQDfH59aIZofXKQfU8yDSuuHJBcW3L1HP+vIH8omyVsZxL4HZWCOw9lrzggO
         VvUDCsG/Q6mBztzceTndiNW7vvVmTETo/xW7gJUm2Oj9pBUyO6rUie9MhF95u94skMTg
         1rLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwb89qtLFlEDAozc1m6izRJwltbi5rtmj8AQxJasdrdjTz5Z387XXlhqNzRVFZFEZ1yHb+J6xqQkDx2Iw8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k0XuZMEBwpGQxxpU9qqV19/sRrhC+I3bECpfJoxBA0WyJPF4+
	gg4XP1axafq52MVqTmyTHKxFQOVJEpbUdKIFrG5nywTK9ogwJaSDxMxh3nuuim8ipfjgs7K85lk
	jCZMcR8sQ7lsGiesI0R0DNamD0lszEdU=
X-Gm-Gg: AYBFou0POKXP0wdC7/wk6Z6bFEHh28lxdDr1mn5XSxGDulol2tiGcbcXo501HAw6UlK
	s372FHYwrT9pm/8eMTorJxnO8sz44n1KkgSGbrq/RTsrzy/JmuZUOAxTfgEu1/Qud73G5iUJXA9
	WAj11YKJ/lerwCzVrrlBgLovYYWqVjFETpduzn82A5aCMxcemI7Ca4wP4mOaYRnYQhZ208msQVt
	JR4kBlX6ROzPX+pjKSusem4bKmZL+c2k1tQ/n3HSbyCJxK054yOjOfdyi34mQ6IIjavZvLqOgP7
	MRx9g+K3+9Qc9eH036NXOGiw9jbT3Zz6LQsB6aoVgocVBAh73L2yZVr4S12/1pzjZL9U0kvGboq
	HPmqH5oMboV9DgsMP1cpUyO7aC8VJ0WAJTy7etGmv4JVs2bSmt5gXCG1n
X-Received: by 2002:a05:690e:4548:20b0:679:8af3:af24 with SMTP id
 956f58d0204a3-67ba4f07cdamr5305703d50.52.1793654770101; Mon, 02 Nov 2026
 13:26:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv> <20261102-ping-fan-1@iav.lv>
In-Reply-To: <20261102-ping-fan-1@iav.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Nov 2026 22:25:58 +0100
X-Gm-Features: AclHuK8ZaSBmGhthz5zT-hTxTfEuu2AtIUbTr5TxRdgub1ai_FkOm5Oe-6lP88c
Message-ID: <CAFBinCB=oJO06YrBGxYBPTTA2HP-xoOCKCivfRSGGryGRf-DZg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan tachometer
To: Igor Velkov <iav@iav.lv>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Igor,

On Mon, Nov 2, 2026 at 7:47=E2=80=AFPM Igor Velkov <iav@iav.lv> wrote:
>
> Hi Neil,
>
> Gentle ping: this has your Reviewed-by from Oct 7, but I don't see
> it in for-next. Could you pick it up for v7.5?
I'm sure it's still on Neil's list. Your patch came in around ~7.3-rc6
which is when the batch of Amlogic .dts changes has to be sent to the
soc maintainers.
Please give him a few more days as 7.4-rc1 has just been released. The
normal approach is to go through the list of not-yet-merged topics
chronologically.


Best regards,
Martin
