Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C393367F36
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739006; cv=none; b=Vk976jPguncatKReWWwLOn//rro5Lc0G7e25fmaPyK2BFgUKFckBwurCBsSGRfXRC5Q2PeBlcORjzw5nvog0e3G3mQKz/4hikdNS5wS2eEXqNm8n0+Fgn5y0bMZoWY5rXTeCVxotK0j7M45pvkH5gkXiZDwVQbzNtWE1DHA2pG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739006; c=relaxed/simple;
	bh=GutEjz1C9EWnoIl6DZVss5kOvzanuED5c0ZSkttT+r0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i9ThLnqC2Ncy4wUWiW6aC6PzAI+nndQ1d46im5qYTYrbdDZ0tgxS8nKWX1p6IVa32JBh5GZoIOl1ahIus0EpKlAR2+mQJzk+JdcuLip8SbVuD2BoK3v3E/vmBDXto9o0SNJb+qbcp/Yjy41hK0K8O4VmjYXJ2jSfIjWm++K2py0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSY3E4gU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSY3E4gU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so4104985e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791739003; x=1792343803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SeRVsGAgfFwaEGdER3bktn7qvFdW9fiMwJGb7FgMong=;
        b=kSY3E4gU/gxpRqA+f+IoFN2oWIRcL11ZcDaVzVz2PmOJSZEqKaTb2YOU3Cfnuz64LB
         LmYjINi4WWCcJoeGCVBLYir6OMXGTWUzmaOXTfcv40YAwTghrdTxnUj2aNxlUOXhikdf
         E0xUwk8nrl/CN4RwS5sLkVwPS6sWSiBYWHL4uQ18pWY3WccVR8W1oPIUWjJrqIkCXiN/
         PJMA8h7SieDAF9Ww7vGEuNv528A2PXQFVsLog/xWcw3FsCdGgOxvLEDsSZVr5Is+NNtl
         JOGvwzBr8qutQjl3R/on4K9uvWM18qwBm4oXZKTKiFi4ghwBy/W7G1OltstyHRy4cptA
         XXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791739003; x=1792343803;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeRVsGAgfFwaEGdER3bktn7qvFdW9fiMwJGb7FgMong=;
        b=twjOwXDuSk5qohu1EIaRyfvkGieJCNfszyvL0dg/uJ+mGWfXFVRnNCGSYYnacGqmg7
         CWj8s5JJWHwXp4DRpWdFqkWsoMoU/EZq1F735j9wIBgQCBwP8vnT9m697RKR4eg9f1+F
         2pMIRAzk1qmCMvHoAJJyu0Kb0N8fy5zWV2OmXHUKTsGB/WUOXmz9Ibk9vDBr2Fr9t26J
         dzxRhgZCYwm+wJGrAYo74s13UStFUmj1Wfoex+Duy4ZM6BeULnzn7kIvk44QqyQD+ZaQ
         fG+FdOhT5Pd8RHiBdtZ580S1AWz0Kt0SFEAna99r1OcUjEMGgPEEaGooHcFZ5KMHPEY1
         Ldpg==
X-Forwarded-Encrypted: i=1; AKwUvBwJPE1zVAKKxA2uh1VG+85YyT9IDXq4qeNzfwSqkW4++IwgiBQ4vjpmbrk/+TdG4pI/96C9GnLCKKXClf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeHkpDTBv5pE2f4yPP8Zd7hWVFcwHlFdoWku3r1leFiLaJ/tgP
	nzrjvA0Vna1cVMHODXjt+ppp1ezDWIKkIKTp6rYhHc8RaRfvU1cZFOoF
X-Gm-Gg: AYBFou2P+8Xl+mB/NGKfqtTa8GVD0tU4vDLVCJWsMtIlpqw8dxMdC0H74tqh+6kCQxH
	Flr369P7H5Vf6Jp8slTOzm5OEZmPePqBahjQ/tZsAkO99FPH19cS9Jr7ts16dfGYesGIY4tT8jM
	nY8RfmBIQJJlfZt4lsQtRdOjmMi8KIiYqbQJkXgJaDALqQxtMAOHZsfXHqwKI6zWC/RnrURcgNq
	BakrFXmZui5RJeG9lHpISLdLb3rGhYlMZOpmYuRuZyQ1pbBTW4Op5nO66TOEt69Zjuf8JW93e3W
	hU2c8Nirj/RlH1j6LT1h9tYVWsFmQDaUMWHvjtWp+xjkraziS0XdG0wswHxcSbYsxbGeZcCMX9M
	Kg+M3IF1nyQGGpd0pl6Jf11N8IM8ejxhI2Mal/sPQTL+WgXQtvixo5JF0CdRewVrydmkEpEPL6B
	gifLPiig9V6eDVRM02xmJKiIiUYjRNas3xvbSyTC+Gsvwq4TsPhgCOJD9WclE9lCvv/fwAtKtQL
	zMPrAST7o33+BVu9P1gumk3iY0Qlz+1OJSwS8S/TMUkcYvLygRHgRhW57dwOmq1cwgdvcpkj2qr
	ThhH1EMd4CNDj2u5WHOnlg2X35mVhWlc/DoQaZfZ3JttSHkzHquTji9PQ/1Nn9nrQYZpDRJLfmW
	LwrbRT+8sy+taZua+kM+00BO7lEkqLHuk
X-Received: by 2002:a05:600c:8b04:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a18e4d67edmr132564595e9.24.1791739003092;
        Sun, 11 Oct 2026 10:16:43 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1972eaed8sm115349595e9.1.2026.10.11.10.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 10:16:42 -0700 (PDT)
Date: Sun, 11 Oct 2026 19:16:41 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, chrome-platform@lists.linux.dev,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: common: cros_ec_sensors: use sensor_scale union
 member for CALIBSCALE
Message-ID: <20261011191641.4e9e2ac4@systembl0wer>
In-Reply-To: <20261011045410.356156-1-kapoorarnav43@gmail.com>
References: <20261011045410.356156-1-kapoorarnav43@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 11 Oct 2026 10:24:08 +0530
Arnav Kapoor <kapoorarnav43@gmail.com> wrote:

> The IIO_CHAN_INFO_CALIBSCALE read and write paths send
> MOTIONSENSE_CMD_SENSOR_SCALE, but set the flags through the
> sensor_offset member of the request union, while the scale values in
> the write path are filled through sensor_scale.
> 
> This only works because the sensor_offset and sensor_scale structs of
> struct ec_params_motion_sense happen to place flags at the same offset.
> Use the sensor_scale member that matches the command, so all fields of
> the request are set through the same struct.
> 
> No functional change.
> 
> Assisted-by: LLM
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
> ---

Please add a Fixes tag. Otherwise looks good to me!

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
