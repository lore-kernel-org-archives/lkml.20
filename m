Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E75C4A0F1D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210001; cv=none; b=VSo0qm2HH9Mw/MHPGyTwLYYWxSmOKk7PsYtBTgQFuFeWj2Gvqf2gJq6Eg2erwScioei6eEM6vckCGhtADQSOWctMGTPFaDmtsJTB7AkhgQ8nEwZ1I8fjWlQOZKlJdIcYnsYDC31M/XdLaedF/HqQQ5g5mcEKJoAjNLQtx9hYXKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210001; c=relaxed/simple;
	bh=s1VDAQ8sxE8CT6SU0AhQK5RG+Rx3zLPOD3QKNeiXaa4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rrM8KlGyUDurHwzBBde/yfN3nL0H4VdfZGSnHrozWckCxpiLfWu2DYcMwJipWv3PXssASVw2fThDuxBI5GxoRY4MVPlX7yvDYOrWk7av85haUlvZnqv1feo3XCt8q6ppeyLr7YMx9X5qbfnvMopsxjBdXHLOBGnXcLHtpkYrBdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSrbIN5Q; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSrbIN5Q"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b059eae96so1614012f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791209992; x=1791814792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWoL59DEflmCTZ2kafhmYE0bRqDflnpDVO0eL/8FVtg=;
        b=TSrbIN5QSzQeIU2/Gdn+FRXbmQGpVDjJHz7w0yi9TiJuL8bO8AbZqg4m1csw3+6l+2
         YjF13GGAiNXD8gzTxcnfq2zK1ckFgZTFy+jsHmZc5stk4LhfNUYK5HWhqLYa5zCRuktj
         gVa9ncJcUlni8cV4vFtw3s+VgAUJOkWyH0bovAn7CJd9tTfd7/PXBiVzelFA6vFAuJ5O
         cp5rfgkBdhYibmh2DTilpaJyMUZbKWsV2LA2nozd1xdkkU0Z71itPehAFywSan+OgrMN
         lfjuBJ9rOpVJUG3uFs0IY6WtxtFmifgX7bpuwmFaXS52zbAW1971bATtgZAxo67/aimE
         uekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791209992; x=1791814792;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWoL59DEflmCTZ2kafhmYE0bRqDflnpDVO0eL/8FVtg=;
        b=Pq0xCK3sJ0t/k6ewXcRXAfPF3UxtQguDIi6PVAXshlehU/+PnhVctpFDZ5pTVTgWKm
         Av787rggAISVMMy4jeZa7wLZcJBhIIhLBqUR1dhPLDE4jY5H9CEO4Ixwr60SVPd4zacj
         N2LROKFZ4E8VWezCsV1NzqfBA2tjTgmjeOLXxif6/Laskh/Tao8USxvYkv6IUSDsAadq
         tYOme9qKpR6U3oUFgbbB2Edb+S4Iueca1qlfZtuIhqLqu5wdMzM1VCLLunJDi86qMEMU
         IjnuA+wxDeWi7sG/je0uoQ4Ban1SbThKve+yn2FtpkzjiX7E8n8UAS4Qe8TiayPhUrYF
         hjHQ==
X-Forwarded-Encrypted: i=1; AKwUvByAFoL1AI5oPyCwHFuD+hkP79FjBMefK07Wv+1Ttf/gEmSjD9PoDTlZLWn7aQ9Q2oJHcue0mRWndzqwC34=@vger.kernel.org
X-Gm-Message-State: AFuF++ms1SabHc0DIehYjF0onlMmZ45WH3XtrjX+fyc00iFSLrUBu9CW
	AUGJo6054t4GOz3bh6PKUmuaG8+zwI3KgVB3c5rxbpV//31MHg5IfC60
X-Gm-Gg: AYBFou14yvD5OEpdUIiPhr3m+MuIA5fAD3LA/pmq0z3p1QU0MKCOHPgQWHOiCcCsMQg
	XD0AS6f4GVWcnepYMksf1jPdkKWksgI8LC6qqzp028fLN3huVpV5h1RfmCLkNkJma2MTfzOXlw+
	VDiqAisEDM/STB5Xx9Lr5rJoM8+3WqAPjIJdaAjxNHCwAgSr9YHQ2iv2TfNo/qtFMRHLm0GXn/j
	jlvbW+kojRHSkMNCokTWvv0N2iJT73RejcfP8TOI05nPMWf959AjsQtO1kazaxTgpeDQwPhDjvM
	s+7bKzeuPKUEwMh8dHinG4CPl4/3cjpyFWIu5+SPPxx/AGImNccqT/65VKxhKUYHBG5wxKAZHia
	Y8bdRNQx7+e2nd+OHk7WcwISceFrwMir28qCQOnWrNyMaPliVHVAzLZfBlpoSMzKLI60LyzigsU
	/6kNSCvStV9JM2zWbBsTJHrqQn8sxZKyhyQwgU+MdVWPgT8aPnAgPhcrFMprGL4n9xyu/H4SrPQ
	2iFTV2pAjhf3vfN5cgQzlutKQzIPrldiIkDJlCmGl5r8dKWLf/hyUm6yRDRZZKeQEa3cpkYCRc1
	a0355k5jEJaf6m9qdyoLY/YYorcYVbZCB5Z/MSfcfOPs1Mtd8P5nPCLUMzfVfveUXAgOLzKFOx2
	TFWplDfdNwcN2jt6Fd5l0GBgNcwpWVHuSr+m4PvvHYvTJ+1JRbjC+Hi+Z9sh1sTg8p6udhVFhhx
	bB+NAxo+CNrloLRc0=
X-Received: by 2002:a05:600c:6208:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-4a0278d021bmr185702835e9.22.1791209992157;
        Mon, 05 Oct 2026 07:19:52 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027735be1sm483681815e9.11.2026.10.05.07.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:19:52 -0700 (PDT)
Date: Mon, 5 Oct 2026 16:19:50 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Salah Triki <salah.triki@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: temperature: tsys02d: Fix state
 desynchronization on resolution write error
Message-ID: <20261005161950.000066da@gmail.com>
In-Reply-To: <20261005132004.255462-1-salah.triki@gmail.com>
References: <20261005132004.255462-1-salah.triki@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  5 Oct 2026 14:20:02 +0100
Salah Triki <salah.triki@gmail.com> wrote:

> In tsys02d_write_raw(), dev_data->res_index is updated before checking
> the return value of ms_sensors_write_resolution(). If the hardware I2C
> write operation fails, dev_data->res_index remains updated with the
> new index despite the physical sensor remaining in its previous state.
> 
> This leads to a state desynchronization where subsequent reads via
> tsys02d_read_raw() return an incorrect sampling frequency.
> 
> Fix this by handling the error path first, updating dev_data->res_index
> only on success, and using guard(mutex) to clean up locking.
> 
> This was found through manual code review.
> 
> Fixes: 53bf4d067d51 ("Add tsys02d meas-spec driver support")
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---

Makes sense.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
