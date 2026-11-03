Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690256;
	b=5FsnQOH7W/0ahiLxbU7dDf0nvyN0nxZdIf55b5q6o1piMmn3jaC8I98VMcGpdAja5QYq
	 6FXRjNqUsMDzBVgL63Qyuv88jPXjq4PRzwMIkOlN9AHYMNzplfW3JYaf+BW0uRgLiqC++
	 uDO45GSdAkDGj2bw3NjhrXvR221qysUNkk4yl1/h8HZW9+KhdDKEZi3nYXs+82A/tOADm
	 bSn8DwhiTJ4VhCY+Y+QQwVO5iRXUkHfj+RQbLiyK0mSOgBy5FWlJpyjKDCzLnY2U+dQPK
	 W/D2O0txBI/oLs4OsQon6t5RyHt3pP/XzbEvXRrjTD5ib5Vaf6Db6MhV8vkOTIECBng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q2P/x/X7F4ZTrOHgMQhH9JkrLN8QQTUe8ldsYMVJ+vA=;
	b=YNFpGQRWJvpHDBCtf8CxCNYYEr7jo8DSbClPCeBFy4Wi+QDgRdoY6D1GxsOMB7sUHpuX
	 LxcPBdwhNhQskPHtu9ICDHjW9gsjElwuM/RXiKV/FyghBcYxkg6fs5YcHCCttf9Nsq1SY
	 12tWHRpHAMBQ7Q3iwMdHEhOnWBPbxtbbEr+IgLE4g1xb8GjrZ+3UKWun/iomYJZNUvr31
	 KdBUde6r0gaagFxUzOlXLsHee8KzD0ooutpJ4VhfBUNguD48ixPdBlEo76b5JAbhGXrvh
	 qsDmaSrJ6kggDafslCP/0IbGmT5uCaqhYW21bAl5yIsvBp4oxbpe3ogYBHwPJslWBtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F/GdtMRS";
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7316606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7316606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F/GdtMRS
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso2654646a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793690255; x=1794295055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2P/x/X7F4ZTrOHgMQhH9JkrLN8QQTUe8ldsYMVJ+vA=;
        b=F/GdtMRSzoyW44GbLemuevxSbKCZ4C4N/Xnz98A2GnYtlWbrzESnrLJ8CJfXfVxl6Y
         tVA0pvMyb9NDS9y7kBJPq64Chm9TVvmduPSPUO1TTWpeQfFxbiH4DGfQiz0jh/GOGsXA
         pV6uSNF2Zs+4YURzCOpvXXp/cNGKGBiDIqw1Yv8dVlVvIHHd/hp3VfsFjl+SYn3hnfTN
         6U3pNL/fmz4wegIJkWU5T9W7yyqgyUXbgMa6Eoquk3I6+KFNVi0MAjZLraY2a09QwAHO
         LWKmUMiIu+6XUZjBCgViM6xq/dQLAn69eRd/CMRh6ppqbsd1u+7ODdMMoT3isQC4qabP
         Bq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690255; x=1794295055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q2P/x/X7F4ZTrOHgMQhH9JkrLN8QQTUe8ldsYMVJ+vA=;
        b=kaqjP8mvoQMVzwc4Qgqzh4hPMeSQFYrLZ0OD06d+OcLUIAsUExmp0Ql8uXhP12veep
         JXLUdcvaLEVa9BgkHyc+DUCfDtYp0+VTuw0KZzGUjF/XTpeXut4pdydyfVzl4MNNsnY1
         wW0n5pgweQq+ynxo5atI1aUVOjnXzimhyy1B7Mo67fJbsUYdsMB1DXi1aeLQx879oW3q
         XTtUgKjXPnwcLr6CUXxLgMofL2m1y4VlWudjV5+lEIW3w9y82qwFqc/NSDIUH+HI0ID7
         AIhOj62fabZ4ILSxiINrGawwa3XRIiSRUYuWl9lPNOEcbdqIdcqPkCxT2sw7Ips8O2nG
         A4uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLpOMqE6DpKB7USTMwunM3w99Cm0PVXAKbJizh5M6euUIjoZWfDq6h4qZsrzbaLwZubi3MtOOUtdGW/Jw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X014HQ+cuyklpfdFRmaHggacaY0yn0u4CwIkDBilax5sAdixt
	pXJhNFOIPZc7l8E5WRopWhafV7kHA2YA0nTzzeGWC+tHH1rEjT5xguZl
X-Gm-Gg: AYBFou1tXpY5qEFx3iZj5SKXERg+YFE5fFLAlQO/49eECR5/C+1RjyfAG8FNwkhLsSE
	LMAifg4C2b4pyDP91E3OkGD2wqpDRzM/lBHtBE1IYVxsI4iAmn+9RNTzCjGitatWCbXTvPrRdwG
	AoIrZyk8GpJ36pT/F3hq+suhXSea4+F/7NBy3R6J83u0ph1LNY/pTNMM5e+yetzGDONH9YWAq7u
	8F0BIUuMVin/IL8fRdPDKwp4KGjTuPqtdNDOEDnXxGRrsCXDYJbESR96UV5R/gXcWlWTA2AElC2
	4AGekscRGa18CPj0mp0SEHZ9Ix55h6iryIG2TEDvIZ8X0bd9VC9eYdLZoL+k07Eo7wInouOWpiN
	DHrmQo07rIXfqDOY0PfOmhTwFbLWK9EmYjBkEFfsDCiMsXaFUsMUzK3qDhK3pJ8NtbWyupXkFg5
	QiXw8UUKNdCT5CS12PonNEBq/ZnRt+b5KBgjPKP+2fWptIoIy5kNAVPkToWXcQi0hlgPGALuH1T
	6Eyp83o+B8H+CxCc3vkYkubQVoJKzKAtJ3Xg6BUX5sBJy7R3u1EOw2DKkGQ8VJlQ66cfUDfEZMW
	34/E0QFejR74/Sj4Rcqq/DxGNuRNOf/T/LHV1tlzNdo1ZcY=
X-Received: by 2002:a17:90b:440d:b0:3ae:2969:9031 with SMTP id 98e67ed59e1d1-3ae8983eda2mr10921492a91.54.1793690254847;
        Mon, 02 Nov 2026 23:17:34 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c2ab1cdsm3012167a91.0.2026.11.02.23.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:17:34 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: thnkslprpt@gmail.com
Cc: rafael@kernel.org,
	viresh.kumar@linaro.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] cpufreq: schedutil: Skip busy-CPU hold when NOHZ is disabled
Date: Tue,  3 Nov 2026 15:17:29 +0800
Message-ID: <20261103071729.1556217-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103061557.1235129-1-thnkslprpt@gmail.com>
References: <20261103061557.1235129-1-thnkslprpt@gmail.com>
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

Hi Avi,

On Tue, Nov 03, 2026 at 08:15:57AM +0200, Avi Weiss wrote:
> +	if (!tick_nohz_enabled)
> +		return false;

idle_calls also never moves when nohz is enabled but was never
activated, because tick_check_oneshot_change() found no oneshot clock
event device or no clocksource valid for high resolution. TS_FLAG_NOHZ
then stays clear, as with nohz=off. tick_nohz_is_active() covers both:

	if (!tick_nohz_is_active())
		return false;

Thanks,
Zhan Xusheng
