Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820233F0AA0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357366; cv=none; b=GeiHMLK4n3B7xhWR/impCqcvGHOwwLUnTfPHfOnBnhLEkxBdFDhnJnrFW8JYA7bMYYJJU3ZcA7zF++QBuZ7Sm1IyJzojYhaP1HY/pEU1TDfyE9/js4NUsBM0D1JOO4O0j7Ob6SSiIdi2sb00fWLcKoOYZXZl7+8QsXViKdkZGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357366; c=relaxed/simple;
	bh=JJtoqyrzv3vVme5FRcwcPV+aYYAUXbJeYioI2XdW1Zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCTeBdsJ8MZGjz+Yx/EbSJqqyICrOJ8sBXxKoQooMLbWJt9kzNXS7TVMeVTWX2mQTgB5qVwnF9h+9xELc9TGEI3pmMUNHarjVINhYlqo6jmEZhC/2c01CUJjOE0PLWLIfzumvlEVIiNMJ0SI86ytNp2wLLzPXzgFf8/2h9cXjvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PIh4PpHw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PIh4PpHw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11C7C165C;
	Wed,  2 Sep 2026 06:56:01 -0700 (PDT)
Received: from [10.57.71.140] (unknown [10.57.71.140])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D98FC3F673;
	Wed,  2 Sep 2026 06:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788357364; bh=JJtoqyrzv3vVme5FRcwcPV+aYYAUXbJeYioI2XdW1Zg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PIh4PpHwvTZVRloQhboOi1l+m6GNuF9JkUZw/a7zlUrXt7yizqH6pXSS0IkYMe2tY
	 oG9GeYVSfvl1+QrLa7vxxSSynoboQzNxN0NmsS7QbsZjTa6nZ2UST7+RtupoMlbJ7y
	 /gvF7bTTarGY4DUGbFzOk2cjxwy+EiQ0+1lnbTs8=
Message-ID: <384cd3b7-f379-4cf0-bdb3-50c071749ab2@arm.com>
Date: Wed, 2 Sep 2026 14:56:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vdso/gettimeofday: Clean up read of tz_minuteswest and
 tz_dsttime
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org
References: <20260902-vdso-tz-v1-1-4d37a6b85ff9@linutronix.de>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260902-vdso-tz-v1-1-4d37a6b85ff9@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 02/09/2026 13:06, Thomas Weißschuh wrote:
> When these fields got moved from 'struct vdso_time_data' to the new
> 'struct vdso_clock', this access was forgotten.
> 
> 'vd' is not an array, but a pointer to a single structure. The code
> works by accident in its current form as CS_HRES_COARSE is 0.
> 
> Replace the incorrect array access with a regular pointer dereference.
> 
> Fixes: 886653e36639 ("vdso: Rework struct vdso_time_data and introduce struct vdso_clock")
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  lib/vdso/gettimeofday.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> index f7a591aba59f..6e9b03051bee 100644
> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -374,8 +374,8 @@ __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
>  		if (vdso_is_timens_clock(vc))
>  			vd = vdso_timens_data(vd);
>  
> -		tz->tz_minuteswest = vd[CS_HRES_COARSE].tz_minuteswest;
> -		tz->tz_dsttime = vd[CS_HRES_COARSE].tz_dsttime;
> +		tz->tz_minuteswest = vd->tz_minuteswest;
> +		tz->tz_dsttime = vd->tz_dsttime;
>  	}
>  
>  	return 0;
> 
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260902-vdso-tz-b999f43c24bb
> 
> Best regards,
> --  
> Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 

-- 
Regards,
Vincenzo

