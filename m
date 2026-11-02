Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793642741;
	b=hWm7lmTa1Da2pkN5EBhtVty3hFYzHyV5g101tIvjX1fwWvOh5NEsYZl1QQgrkBCRlKGn
	 7f1w2sdG4Nmqw7Z06gpmzY9z2wH2SqmmMsvQcNztENlmJmf4oI7l9STtBcCfiFAeAdyzn
	 p9x5IlXkgngZofyTM5/ygVyayDDqofGiLFHC+D65sY/HZ2UmnOjCiSrLW8FL6x6P599Bz
	 U3WU3lhIh8t/Owqwjn1sxIwEAfumkXLsUFew6Rp5mbwXtBVTk/8ZB6Dg7etWjWppTfsB6
	 HrEnG8biEjkcFmAyTMg5mOD0duzZlZ7fWDr43z0OYyCpSMXGepD7B1j6/twQEDtL95w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+GllYd+7C84J1wvCKUhTS+5FI7nZxQxUhK7SGVJUPs8=;
	b=MYsf4IRmgjLkjsx/rrVieAvxIaRanpuMf8eAnuwnsFyX4Lnb2OBlpmT1yLs/xJ+gXOMH
	 QwJmDW74lgYR2wbYzgnRj0fWND2Zz4s6Jn0i/tLq5y6F4rolGCaBTGSU1mHwCFn01643e
	 RGGKRmoBQUZKLka9NBoyaM25r9E4u/ckA87I1XpIOpPMVt8Mcbs5zXS2IfqqX/G0UqnAr
	 BQL0lDlWpr5tr/edKC5T95zCYFLjyu6unOFnow4+2Fq6BdfXu/RscbYu2dEWo0cVtxbW9
	 +Qp8Oevkn+NlNsVsblvQvO+grImNEPl0kuxeb8zWPyJrAu1mtS3kuIIbB522JOR84yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=SlXLL06H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D0B606A5B8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D0B606A5B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=SlXLL06H
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4ceb15dfd7so44097666b.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:05:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793642734; cv=none;
        d=google.com; s=arc-20260327;
        b=i5s3CyCab7/7j/v0ZzXSHDek96SlLtiU+DZilXbSWa3uzGvA30gOk9ld22Y64mnxUU
         keUkxCeTddYnJee1nMILV4L9y/xsFJ9YfXj7knnkNz06iliCmwt+s64rLhUBrhA7pCue
         EjNW3ZEB+9Op9uBe9VyEBvjf+BcMhJ4y+Zq0HZn5fXMm1xw748FwqbT5uR90v9nOTssU
         7Tv/yboqKZJevRMN4eCYFbr+7m1t+nvB9au4NKTPtfsQFoxw3nwwnix+u59q72+GkyRW
         qPa20eE2ZUktwX3kAg72OZMJzECLVcuxGY8kcxgEEqlT6NTlHw1oPSb3sSEdZXiXbWYm
         4qRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+GllYd+7C84J1wvCKUhTS+5FI7nZxQxUhK7SGVJUPs8=;
        fh=TXyTaK71Y0Kyl01F4m8zlzcfEmCuTHjr4vYdrqEBD2Q=;
        b=cEon5qDWiZpF5ZTCfM2NO/IKiqsMdHIfWto+THmwUrIYUHO7V8/28/w/xozmS6WzZM
         MHD1PL4iZFIUj30cJFA2ILEYRUK3a9eoNOd5458OUM7MFrzT2itSTxqeTuc8SGSm2Dsc
         BPscEwuT/Oxj8pZuFhJ805ehf7giXXd+7xgspn2iJextmZjJZGI+MIswFf52dmnIVhPL
         DWmS/vEM8My98VWdXHrnfuNMJz/G4BbXSI59TbyYS4YlLXEN8pkuf18xvtfRXiM2dgQQ
         yYGd1XJ1Jn6K6ViDlH6NNnOW3zY24GIURlP22MQiz0ep3LFYrTZ7SHw1/I+DkrrEBaPm
         nSYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793642734; x=1794247534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GllYd+7C84J1wvCKUhTS+5FI7nZxQxUhK7SGVJUPs8=;
        b=SlXLL06HMdi8BGyw666hcl5KRHcJivsV9lCQixaZLuTBQmaUykjBYcoxx/6uBP8tBA
         mDeKQDvIGREZWFJSAxYNFyHU3uBskL3mhSA7R6oUdbCwtfdsxrB8govh/RaEnWeOif/8
         lKVidAv6antuKycIfCWRpRr3qpPLvRMGDFKwxIuqnCXybJfQuTHLQMN7OXtevGlpACgg
         EUvbaxYfDuF6iCQOsi0kJnbGG0d3OzV+mzIaxeK7qgFAgo+aRqMN0jMyKWV8vKl2Hk63
         kY8Q9CPujTEou9Fhr5Hj5KWym22LrcdhJi26SgZ64982ge9dvZrfH2dIkO9NZVubacuh
         J0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642734; x=1794247534;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GllYd+7C84J1wvCKUhTS+5FI7nZxQxUhK7SGVJUPs8=;
        b=ieVQGpuOCO//PGiN7Lg/nWbEPbfBjx3xckBGjoXFhzTN/YbZA03q4QJQIvYjlJ+teD
         GC7U7RtGqUFAzu0RjgggdCZEhol32aFXe+iCRhH2qAXuSxSSdGFJ/782tfzDOzgQBF2p
         gE6l/v4jwGmtpR8SG8WhQ5KLw2wIN/BIEGQZfTAM0/rHHR2e9W4W4wG6oKV+xLWngNeG
         DcsxCafnJN1yD0KDxq2J/tnd9rWSmE7rn0Q7KMfWvpgYorLpX/bBdUGeaxLzroPU3w6P
         nDqIOE4UVuOf0E6okIoE0urGkxzkzAhooxAuK3wmnULcDJsylHYDPXXAm9hH2csy8SC+
         egqA==
X-Forwarded-Encrypted: i=1; AKwUvByZO2Jdnr8dhIByYOBgBiOe+GfpORNpJM4FwHsi8CfINhnnlJunT7gEdPIfIgQhh29CyuUKY8pSG4PlPzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3XSgHNHIBLoRl2AYMg4zWKgwUdsBzfwfhNlzPvFtJshyzsZXr
	hY0hBfRzJ6fYRrKg0hNWNN9DkdSZYg2QTkqZE39ccp1Gew6gKO6W7ddYZbVBiS4oB2X3qT3mmjT
	gYmjIZDL7wt8O/mPqfpixINUfKOf6B4io9TcOtC1aBg==
X-Gm-Gg: AYBFou1oftwr7Qxfeg0+//nxaQzUK7Wg942zw2CqW8RYyRO1vB3cbgpSjJLocl5reAs
	jAeG5jTp/IQdvrxmowU/fqfv+f+ZOWFCJkocnbg9reeXlOgiwvIjLO9XHLiSgJakAxUKGR1uu7I
	Y49Hbh5idygixlIa/uivXlplrXSkbLxaboLG7KognhgPxvYAXF49H99fzZdMydQJVZKsI1OUd4w
	aIkcA58Y4vhfAUjqdwHTHVrUlke+/5/sYtTxTM+XeLJOl03s0m0XCTiiRT+3kijmZIJqRiXkFuO
	Ap/pc/0j9rWqJgmgQJ7OmQ2fEJ9RhML9QEeX/gV84jjPn6vhEPekj0P/Bxm8sSkam19IWKE/d6E
	dICBiuCFg06sZmn1q5J1EL03i4wpPaAaBk2MJx9upTMbcflK5p0ra3te5+3jY8RJgAoo=
X-Received: by 2002:a17:907:97c7:b0:c2b:f3d5:2090 with SMTP id
 a640c23a62f3a-c4ca7a672e6mr908823366b.27.1793642733627; Mon, 02 Nov 2026
 10:05:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260824184159.240821-1-max.kellermann@ionos.com>
 <20260824184159.240821-8-max.kellermann@ionos.com> <CAOi1vP9nBoxBD9VTmMm5KnWj4zp0mdeXxTkzLR5tdBrmKrQ73w@mail.gmail.com>
In-Reply-To: <CAOi1vP9nBoxBD9VTmMm5KnWj4zp0mdeXxTkzLR5tdBrmKrQ73w@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 2 Nov 2026 19:05:22 +0100
X-Gm-Features: AclHuK_5nzajoV3_feYrYc2C6tm7ff2fX0xCsItzaAOSpfM1GHNpLYSclkLwZHo
Message-ID: <CAKPOu+9C5rWF4mn6t660C5YxrcGHWvTFFEMkHeXWba0L4Ca=Rg@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] fs/ceph: remove i_truncate_mutex, use
 i_fragtree_mutex for both
To: Ilya Dryomov <idryomov@gmail.com>
Cc: amarkuze@redhat.com, xiubo.li@clyso.com, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 6:35=E2=80=AFPM Ilya Dryomov <idryomov@gmail.com> wr=
ote:
> Only 8 bytes?  struct mutex has got to be at least two if not three
> times larger than that.

You're right, it's 32 bytes indeed.

This simple patch set saves ~ 3 GB RAM on each of our servers. Much
more memory savings would be possible with some effort.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
