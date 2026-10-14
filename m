Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CC030B517
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966547; cv=none; b=l0WpuQGfpo+SZ9zhIJVZ1oMNigoSbDzDZsf0dFiAK8u/t1jOw2Dt9V/nFtXP3A/pvQmOiRZpxtdpEfBVDY3Q1LUcsborVxDhSf7mT4bCwjX2R3IxkdlEIMztQHOoHFmOtQQRKAeGrqNP9b8nmr22T7yLClm+nIUrFmmdAHtIY98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966547; c=relaxed/simple;
	bh=K1xTFF0dZvielDw7CPdKjT3Dos7Fsn3aW1yWLZaKQb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3yVbz62v1BUXywJnBKbZORWzk1wSTfEut7/Lmz2KGzKYxLhNcDEiMHaRFGxWL7s2zpnerOlmE8VERr02eNqVl9cYy8XW6+YnQUkkh4K/NvZl0p6SB9vpf4pmO2CL+2u6dSLgL2hizngAhrV1A+i78/qb4OvYpx04R3DIINllD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgFed68e; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgFed68e"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4be28b82so247892f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791966544; x=1792571344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ONOYFUsExbiTAqauGcHDMWUDVRV1mSLiP5XphPmFoUU=;
        b=EgFed68eXGL3coPtaEb352qXlKG2T+5+8wH2QxfE0ZOieJEb46OYWjWxsO/ulYoO+n
         JsOKRntrefw1bBTbd67DdSJuGQQAxEs8ZwMhsEOdh2+0kSWvcAGd+3GHGunWJ3FQbQEl
         oXmLskyPmoGg75x2/8Rl93C+kuv8xDSGvVv3tddKMtDByA20m608mw5fRYanSYfLmEeV
         KX/s/0d3m77q69uOAx10yClZvPgh8lTKmkqJT9y68ncxw2aRm987J6e2w5k9v7SZDjtP
         f0gyO3WyIfFW3nrYbc71jxZL3sf5ltlr+JgmRoHMXRGiX0cn937IPMQrRGkciLorn3Pa
         o9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966544; x=1792571344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ONOYFUsExbiTAqauGcHDMWUDVRV1mSLiP5XphPmFoUU=;
        b=DLKPdOvIV3QSAZGqJyR7H8h8+XB6a3YmnlIEpILLMyTknFEkoemhSGp9qGmVIA1Lfy
         2VjSkK5ZmgKsiixN/iOnhP8NtIdkPKft6nijDbLWDofsCZ3dY5YO0DMKHsrT30YnNuw5
         a8oR32dJqIktp48NluFFx3Co2w9EZFnVy4yXFdgmqFs+/t6s6s0hJ63A4VBKAmheSy3+
         xubwsqo0xCFQubm1hov2T4IQpEipzA/EZOT3OHzD2EKcjWej10uwsTRpiSqlysqQqZ1M
         VVPqw1j++cflvvDnCfLgbO9mWxkTBVl1niELw5SFqbQAj7yPWVzBoO+gIa5oz7UsCObc
         PsqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFrTHWOuXPBdv6IuH0qs1dQ9rdY4HOQmSEptNa203jSya+hu7J3IJMQ6gQGEi4mriaw+tS0FcxZeRV/lQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7RDcXYczpWLErk2j98H8Vh53tCobaQ8qmg//Pg1W8UocZ+5xG
	YKwnNG1YrdMIff4Sr4kQt24cXon2OyNb/RwQOFUoYg2nA9O8r55EsF+i
X-Gm-Gg: AYBFou3zDjPIIiJY5ugOCorlzD9P2I7crKky/kvZ/J+Fq2KdBGtWASAgLKiQPVTlVpl
	+/HRVHV1z6d6zY16ZBaPlyDAIvmTbfGsW4697KTm9IucRMKf5o811LxtSTHz8dH25EKiM8KgnXi
	vXzVnItajFzMj/DK912XLX09RKDsQheonqJN0RMzhQu9V4PTYf2n9Da/0K+DhmDIbmEHMbE5IT8
	oTZh1AdbjK2dJUuJsAeU7l1ljOK4EB5YliIuB2COXAPq/i8wbKCP4ADAO3W27rpfZriM0HlSIZw
	1P5KVIQOn1JDu81q3ZKCi2BLD3Gcyo72h5QTfxornOIM8DsI5IDUDy359QcITp3AhLsuFDorJqk
	iqN1fPy4JVh5WpABP6e606xPskk5byg8CbzPnrDDifr95xtPG945UwnMSTxtutJvvzynuNUfMAu
	HXMjCt215GRua4YIJ7VA5fSrKzHLztXnDVjbzl3Vxq1yZIBB6DQfxGo5boyJXyZRAbLE0=
X-Received: by 2002:a5d:6443:0:b0:48b:536:c93 with SMTP id ffacd0b85a97d-48dbaae36f4mr21674351f8f.30.1791966544421;
        Wed, 14 Oct 2026 01:29:04 -0700 (PDT)
Received: from localhost ([2a02:8308:b092:fd00:20a4:7be9:4762:f55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded185de7sm1899715f8f.31.2026.10.14.01.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:29:04 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:29:03 +0200
From: Jan Remes <ciakval@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joe Sandom <joe.g.sandom@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jan Remes <jan.remes@mycroftmind.com>,
	stable@vger.kernel.org,
	Martin Triska <martin.triska@mycroftmind.com>
Subject: Re: [PATCH 1/4] iio: light: tsl2591: don't divide by zero
Message-ID: <as89TxIwfpw7x40g@mm-ntb-00805>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joe Sandom <joe.g.sandom@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jan Remes <jan.remes@mycroftmind.com>,
	stable@vger.kernel.org,
	Martin Triska <martin.triska@mycroftmind.com>
References: <20261013143943.436816-1-ciakval@gmail.com>
 <20261013143943.436816-2-ciakval@gmail.com>
 <as5zy1LRyE5hr6vn@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as5zy1LRyE5hr6vn@ashevche-desk.local>

On Tue, 13 Oct 2026 21:09:15 +0300, Andy Shevchenko wrote:
> On Tue, Oct 13, 2026 at 04:39:40PM +0200, Jan Remes wrote:
> >
> > Fixes: 2335f0d7c790 ("iio: light: Added AMS tsl2591 driver implementation")
> > Cc: stable@vger.kernel.org
> > Reported-by: Martin Triska <martin.triska@mycroftmind.com>
>
> How was it reported? Offline? Off the list?
> Otherwise we have Closes tag to point to the report

Yes, this was reported off-the-list in an internal report at $DAYJOB.

--
Kind regards,
  Jan Remes
