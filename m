Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794617132;
	b=QGbMJlyJT/Y84QtOLbimgcRIUx09YMk49QLfG1+Dwu68HHq9L6W39jIHxqUrXowUkNiI
	 rwLJ9LM+5Z17XWzvosPPmDPDS9Cysl7d443fKsCVX9lD0RQgLlwrvdcXnXVNu80CU0RlM
	 +lTn9OUFGXdsmguclHbER/9Me19gOTx3xfnj5pL0nvLvSmdLxfRRNI2s6XA9BKGbS+qP1
	 PITuKlDzzfyMoYfXJ7hPfrBrcqCuKi2hjTpepM295Mtsrul6ozwWQ8Y3AzfKRrQ8kDdTd
	 wuqyOuyClSZxtc1Dg72YleDj6jdn1SuS+/rnrCihXO7c7yNxSeERK7AlObhwb+xK48A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i5jYtLz5EBj5XfHsrNl0LrZsplW7Xpq9cdHzn4aoCIQ=;
	b=qU8PZFYxw/ECwfCDz/KkpUqscsh/Qg5FDYw5wxnSDInl+GCqPsnEdnLa9oXvTv7T4mDn
	 52qEPj7WC5C0NtHR65WQNGTHgX1toHXQYDy6dooACSSyKJukjNlYGUlLCND6m6nvY9gWb
	 1i25+1WlJeKC5a7YP0jmxesMegMd+njfZFFSd1QCtysVMpgfiRXW2nCAzXK7zGuNqo3rS
	 n8+kEuiWS29HP97jGI1DU3qWQUUiWbL5wC0Ndo3Xpwxxd+Vc1t9ZmuYnZve+qvgQvJpjn
	 km2tdsVHh/6edbfDXoPK2YdQf+/T4yA7f8MLui2km1Mg+Bp5VBdwmIiAUTABlrs1E+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GOA/WNj7";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD530606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD530606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOA/WNj7
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b309147589so15047847b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:45:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794617131; cv=none;
        d=google.com; s=arc-20260327;
        b=Zdj/egW7yJGA/5r+Eqtz9rbbvEWAAeYgMG54eRIDW4YZEzMSB4QZLxcMySuHQTntl/
         9Db9ngTNScmxsnENSBhjYgzYsjYSqVY37EW5dv1Uu9MInMRAuX4tzmvgfaUn9TyPgc6Z
         ectiEpb7uq/+XH2nInPXXencgjfYruuaLS+a5yvRt/EnlpMGwPqZfm3UC3O+qOWgD2kw
         fEF0gEBUJOU3JGPNj8bX4nr3hd5tfTdsb511SngGFWHBJ2YTg8PkafxgX0SZdAoOFClC
         OKTfY/JJL6ol45DvgPC35FwcI/0PQIEJXY4ejj5zbf/TT6h77blZXYqMRqTN9r2dKP+2
         PtmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i5jYtLz5EBj5XfHsrNl0LrZsplW7Xpq9cdHzn4aoCIQ=;
        fh=1/PLOfuJZzG4RV1e82TdqBlUC3KFICErbLjSWOk2EQI=;
        b=f974SU2aCi14zZP/S40LuDKSTW+WCwL1L6OUUPPFyfCl9C/N0V/V3ZaYcm+Qmtv2Co
         DcPy1bO4V8cWogsWKZCaUo4g7lQHCgZFblRwyWt7fkQUknmk83z7BoCWplwKaCwrxkPY
         P7FTFXq/B+C6puC+mSsGORYCBcirVgu6DuzIS6tF95nT/0CEP7OvvA6rSoVA86uNvxCW
         eiGh+I7KdpwH5Mjr5D3plpoXjEH6LcwlD2H/hQHAzBHFGg+Axf4vOrQk8lu6paY8iA4u
         8O4dHYkWQG76OS0b9uWw3Xc/OFK33vUYYgG7IK0KBWwLKyDvUVameOQ2/VaUBqTBfQZx
         Bu6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794617131; x=1795221931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i5jYtLz5EBj5XfHsrNl0LrZsplW7Xpq9cdHzn4aoCIQ=;
        b=GOA/WNj7w/JT45QzYtoARc89RrvP5ZCI/wwvBqtGf2fu/rxWRJ7X5x/sHTvZbi25WT
         avhh4eYeVoPbPNDp3Qq8EySeFQb3gDzMUtsS1VUYcIp88SRxtd7uqftoKo4hUgWEcU2s
         HFkXVS4UpOILhxd6nfsi+MV74S1CocKYhxu7/DVuFONisMwe7zAaeCWns32TTSDX4HLg
         QC4Y91LbudDlZ/KcHCsoKOH54PGT2rOR1sYzujNhoz7C+yEoHsHMK6rF0ZjqYS9qXX03
         NWS7txN0mId9xKm3e5dFeFlE7XbNNDA7nn7IeBTTFCdC4SxR1N3ZTrmRrSL+hYqckeua
         jILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794617131; x=1795221931;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i5jYtLz5EBj5XfHsrNl0LrZsplW7Xpq9cdHzn4aoCIQ=;
        b=WY/m+eXBWX03yC0GZ/tVmeZPqHMLxh3pbAJHMXq7oEgXokBWZq2py8Fuh6kXuKzpL5
         i6so2OSa1eTaey5ZAMg9lXiLjTpE7uIGdZejbWI2GiXC9FZr2OJfSxlHaxAZpQ0URSx4
         /OOi9RX0RHEDfuFYuwwxpn/LLW40zXG0T4lIwiMVG+0XqzK4olW9hqPSD7KfCUwSEfvp
         bZffGb+hTOL62/qhNKoZgS5OJfTS/8RWc+6X23nZrc2gnHyxTtbppsPak3Lhl2/sqjzZ
         RVy1L+gugYLLFB/rPb+hYTQfiHF0cWnbWxuERIcapchjRBzKmLQq3Whk0YDidikUoRAv
         jGaQ==
X-Forwarded-Encrypted: i=1; AL+hErFkM+7VLzsdbMZezW+UDs7D9L1YsdtT0DgZBp8WDlDAiIyiGY+KgzT453kz5TVP5qWXV3Nhy0lEBuTphxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yXwSk+o7jfSMx3vEPjJpVkg8MmKEG/kkXKYxKuM5hdBZ9Apmn
	ddhT4osSYVOQ1jhlBiiXmUBt3ugiTnra6cfGyg2jWeT2sPZ6tCjdg5Bit7fmbAJ63XDomuLZG+6
	4fevD8mJOamhixW9M0hgp4ieQBlgeLNo=
X-Gm-Gg: AYBFou0fGOxBmENOyY4zPu02/vP5e8yfdnD9E9jDWU3ZQufOmE2cqBBUiFEZoSqm3PI
	uFS9AFkphu+szggQ9w0HSeuYo8K0rrw7tohHLX35v3WIgRyJpXV4aZRUKxIMCXARjG7MunkV5ED
	BZNqPf/GpTcwdDBtILTrNnqGbeR864EIgkGXkGFIG9l8XG6PA5qn4JInkQdSLAghShodlFf51RS
	N9elGg1pPUTJwN44+bVSmWzPC0KXhoiRFECEwVE56DhbSAPTZ6o9xaBz/v2M2IW3yNopP7Foc59
	23L86aDegayXe30BhfkZcEr8pLo8Pdtv4ZOF2QZfT1ekdknSlaeX+CV+5zvDHUbKwSwwNJt2L2j
	EtmBttA5oAwH2BiejS4cPCswkHn55kz1QqwvIjOp+5ltJKYkNLApk73WDwZ9TbzaIoCKMJrfOMk
	o8uoRI5KxdSEro0W2UzS8HzXLLI3zvJdLrfR7TMohrwjuhtgrZgMOn7z7en4RwGXELbFwcH5Z3r
	/+9doXygrHNQTcXfleqX4WHEN2zdc4hjuw6wHO9vYbk2apMH5cIgC3Ci9xbHTa7PkiuiwIDa4X8
	yq2PixM=
X-Received: by 2002:a05:690c:d8f:b0:8b3:28c4:c82e with SMTP id
 00721157ae682-8b4aa2ff46amr26715857b3.55.1794617130642; Fri, 13 Nov 2026
 16:45:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114000220.1280581-1-dmitry.torokhov@gmail.com> <20261114000220.1280581-3-dmitry.torokhov@gmail.com>
In-Reply-To: <20261114000220.1280581-3-dmitry.torokhov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 14 Nov 2026 02:44:54 +0200
X-Gm-Features: Aa3M54rWFVWDht0ocpch524jevHvN8U4TTKxRlmMBhgMm5WOyOBcGYqyIC0dFbM
Message-ID: <CAHp75Vej3sbeT5dJ2ZWnu7mzZLJHmRwW++shCdMAiK9Szh3PFA@mail.gmail.com>
Subject: Re: [PATCH 3/3] Input: tsc2007 - drop redundant error message on IRQ
 request failure
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	"H . Nikolaus Schaller" <hns@goldelico.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Yuki Horii <yuuki198708@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:02=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> devm_request_threaded_irq() already logs an error message when
> requesting the interrupt fails, so the additional dev_err() call in
> tsc2007_input_configure() is redundant. Remove it.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
