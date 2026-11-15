Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702453;
	b=M9KvQkc8Q01+ROp53z7R+59l2G7TlQnauMxR/yIOH2uTtb+566Mv7NTNEMdlyPrEsuMq
	 dqWYRjZR9czLsS3IbTW0yluzYI8SlMDEGGAiOOIpqfpMsjUJAO8SVouAWRH/8Stpm7FX8
	 tw8XAz6+btTyLdxopORUgrTSwHvDuiHBDwSwL7Da2apviOTKZvNEwcdWlwEM9pTG/Cmtl
	 b3CtuhuMZpCWDlN+G5LpEzFvdmXP6YDeRoNtsU/RwLIfIQFAPTQ/KyD6b/C3KvLKmm9FB
	 P3zkmVMNt3Ph2/9fzlBm6Nw1FMGYRmaCO/KvSx5BFVFIzKq7sWcsjnAsZew0IR838+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=u9+e/eGHjR73QRvGijIdIOH0R/G/DJBbLevQ8HFggAw=;
	b=3oFAzwb2K/DFqlzgU2dKaXBoDinWDiNy/zbpDy4O2yIY4anFjx3wsFLkdz2cib+KRkhB
	 jMM1Nd8rRdS49gzr0GE5w2vGKkZtCCcJ+bLrJ/gjnA6Z4H7zS3KhdjX+wWA3Ca8HPJjLH
	 V6XG7BZ+qZp9N3BMw4aOwM42RcBW7r8HWqIggy6UhYkqLSgYKSUR7U5jdef0Y9sIqlUsS
	 +IOk4Jjjk4wgy/XsnuRjZOOLYoqJSAPDJn7o4VJzlrpjoXz3ZKTtqM8l/3Y4nkvdMmsGS
	 ZxBNw2H4WZO1xO7OfaPppU7cZitOuBGooMusFoK/jHAbIzM1S9JBescsbMqPXQzVMKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnISHfT1;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F91606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F91606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnISHfT1
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15dd124bbe7so2098530c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702452; x=1795307252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9+e/eGHjR73QRvGijIdIOH0R/G/DJBbLevQ8HFggAw=;
        b=mnISHfT1ZwT0S7pwLXfYK1XT8B5W1NMnt3+b8uJOvqsR3PYKLTCSH9RRGvexEqN1lW
         nbT/vGpIItUzSDwYG9pODU/ijNVun87sN2/1zYWxWPAQR0dOFnbm9C00imDKHW4ZtKHG
         bv/JRjQ71fdigYHckXAvtGV/BMvLaKO3g2V8uwu1On8416qhMLS6szR2NYAnUHmT39ec
         +d/MOVCbzYoH9+yslnPNfgKNYHlady3TvmJn4VQ0D4hRRs4lUlBEunWSWJyzKMJKAt/t
         k6lufnxWNXtDyiC/LTVudEaspBO7HW+slPZ5ROwqH5+wIzx2sZF4Wtgr0A64iLWj2avV
         XVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702452; x=1795307252;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9+e/eGHjR73QRvGijIdIOH0R/G/DJBbLevQ8HFggAw=;
        b=UGhwuH5UMZ3EiKmV49Wa/LkZQIrZFCojBMKC0HG4/Z2aLgdNvyN2LaFUlu67ujYgFi
         JX+PbgzO/SnrQkCVwleonuozD4CjZx3UlFOEEq1NqjVEmzIKvSs4fjysLvfchWqgHMEz
         1BHjEZmY+lQOFIEm6XuajNOlCj+wbzscumF5vmt16RzaawWlD5ESzCt1DHgHrQiU82Gx
         FJ6LDYMMEiVZdcNlYbngOPnx+YwHjdhEJeSfj9PhTXmpgeTUTh6cuZGcN7Y9AvcwK7Jn
         o0Uz/MQD1C+YTTt15ViD1BiJCqYAkbz1qazTIISIZPZaCE3JGRbFTVvC6RDs65wznvGQ
         Lmaw==
X-Gm-Message-State: APuU4Z/in/2Ki/j+u2Kxtm/3CaU0m4xAzRjQhkjXMZRh29pbQlnpbi0Y
	ptZy2BO4pMKy3WH43UE1QCNSAbKMp7oSzZEpWsFCn2bto6+Z6ndM+KaW
X-Gm-Gg: AYBFou28geqJmSGo370wT5Ffo0ZmFd/uoSAktvqVlvkjhOViZlgvCx921wID5Fos/XR
	qiL6fXFdZfwMMxuao+LN58yCXBAMn+srTgzcYyCXfWaNV8Vc7ebjBcGiSBL8cxxOgAS1NDj8VEK
	osH0dB/c3s84887ugO3+xZVtx/reRmfOd0ArhwU2v9kIvQYNvC9rEYi6/P26lwVxfZwLegGXk44
	L2Hjtmj0WQOYRCpbTu1AjmUh9hHnwlH+8l9VaC6/eLQoedddkClsrlAokWfiI470IJ++BoLq+OG
	FrdIBdB9UXDRqTo+nqImmq14mwkhTAEY5fh+U3ntuUN9p+DU+c+mcbHvY1WH1F9Gj/Jxp6M7lR9
	Ad9RvZEEABItYf1jOsYCp9Nv0hSQSRSju4wHgyFLcPILyvboEF7RKyIg4AoIyOh2CXq68AjGD+G
	0sb6mkn4S+7r9kRQ5vDa3wx2ZqD73zCzDIN8Uvb7dHR3hCPiNyrPe5pdGlNxKebl/qBsrpIe/2R
	fQ/mLZgXXepo+DnvENEc9rhoHzGUuGYzBMd9iyKfnXqYc/esrll/hkivdHAawxi9XWVsoyynmGV
	pR2kAP3tub8YM8TOH/0iX0R/F5JhzDpjvJHG+/9bd6AY+EHhvmBpKDBV3LgQDk4CATE=
X-Received: by 2002:a05:7022:2529:b0:1b4:fa58:9d8 with SMTP id a92af1059eb24-1b5031759b2mr9369895c88.20.1794702451866;
        Sat, 14 Nov 2026 16:27:31 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm16613754c88.1.2026.11.14.16.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:27:31 -0800 (PST)
Message-ID: <2771f4fa-5c55-40f2-8105-0d72a715ee3c@gmail.com>
Date: Sun, 15 Nov 2026 09:27:27 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 2/4] PM / devfreq: Add more details to the
 get_cur_freq() comment
Content-Language: ko
To: Bean Huo <beanhuo@iokpp.de>, linux-pm@vger.kernel.org,
 linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, "Martin K . Petersen"
 <mkp@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Stanley Jhu <stanleyjhu@google.com>,
 Bean Huo <beanhuo@micron.com>
References: <20260907192140.2701755-1-beanhuo@iokpp.de>
 <20260907192140.2701755-3-beanhuo@iokpp.de>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260907192140.2701755-3-beanhuo@iokpp.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/2026 4:21 AM, Bean Huo wrote:
> From: Bean Huo <beanhuo@micron.com>
> 
> The comment for ->get_cur_freq() only says that the device should
> provide the frequency at which it is operating. It does not tell the
> driver author which unit to use, what the return value means, or that
> the frequency should be one of @freq_table. These have to be found by
> reading the devfreq core.
> 
> Add these details to the comment.
> 
> Signed-off-by: Bean Huo <beanhuo@micron.com>
> Reviewed-by: Avri Altman <avri.altman@sandisk.com>
> ---
>  include/linux/devfreq.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/devfreq.h b/include/linux/devfreq.h
> index dc1075dc3446..809ef29b9af5 100644
> --- a/include/linux/devfreq.h
> +++ b/include/linux/devfreq.h
> @@ -90,8 +90,11 @@ struct devfreq_dev_status {
>   *			use this directly. Instead, governors are recommended
>   *			to use devfreq_update_stats() along with
>   *			devfreq.last_status.
> - * @get_cur_freq:	The device should provide the current frequency
> - *			at which it is operating.
> + * @get_cur_freq:	The device should provide the frequency, in Hz, at
> + *			which it is currently operating, and return 0, or a
> + *			negative errno on failure. The frequency should be one
> + *			of @freq_table, as it is used for the transition
> + *			statistics.
>   * @exit:		An optional callback that is called when devfreq
>   *			is removing the devfreq object due to error or
>   *			from devfreq_remove_device() call. If the user

Acked-by: Chanwoo Choi <cw00.choi@samsug.com>

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
