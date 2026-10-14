Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B6E3B71D0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958192; cv=none; b=lZBRNR+cPgAJh2nmz2TwnCQIaZSCnqL/TaNYzV7VRnQQ/9fH2zYmyjtFZRdBoa02Dn+EpxBwtcQVvSf5DQOa1VDzKnXxIPJfDxg4p12eMKUSjkCF6la3o9GB7z1F5q9QA92qepNXbbrONfjkYKAyV3+qj9u7/8cVeeKQ9+OKtz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958192; c=relaxed/simple;
	bh=411sQBXKujRADBe2C+466wylgfdBXbr/zBL19k6zImA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPPwWpQuYQ0Htff+DTICcGv8xXzlXKbgq7KD+JU3+tE/O+EvbSjPcMHvQAEiwBtCAtI9A8jzb0TgFix4MIAED4jujLTscW59i4R1JvEDh6YYIRgSx4hgQFTmJ1rBwtCUC5YszulQ8Tk5rZMyRbV+sh4RERUkE3dirPP/ltf9hLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hl1oLh9H; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hl1oLh9H"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso1391696a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791958190; x=1792562990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cV5UIHuCfCh13j6hF17yh8heO2eNgiNWSkwIHm4m0pY=;
        b=Hl1oLh9HoNGXQt75Shspv+O1/MfZx8HSjTIYV1X+o1HI1rT9x6n8HzC7Lndf6KWElv
         X6xgHWGCVKpU2hPNpQHUd5QRqz1FbJYxA+AsCBHCNOmkQ0Nyjyewa4/vDDMdzfqOg1Cv
         NOhCg/8ZJcYkuTKdxy6cl+ZFedcUU0XYu9ulLx2iYBTfUar1QpQlsrWQgbxiuWDzcme9
         ZCbZhy2cbwgQCsiMLkSKzuaWvnta9lJugCnz0508EMC9uSF9MzAMDRpDsrdLWYN5EYw5
         PBp62nIHJX/3oxHrfAvgAXBgYsxhDGnwQeCYw0BHfJ/g3DH2TLCgoFTth4/XbFwACTEN
         oHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791958190; x=1792562990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cV5UIHuCfCh13j6hF17yh8heO2eNgiNWSkwIHm4m0pY=;
        b=OPuH6nCgOuOudNrRDHgOKMwcKenn3lsg+LvkmRtlegh2V/WdsS2oVmXwe6ThamCt/W
         RsR0bXRGdoI0CHSfYChiIrLvrQa5+2bM+WdtM3SvQa3d+nkfRdbueF1jswtGqyDeRn1g
         hUv0YhfonKRv+ognydVAFKFkjSfsIvgFWINBAMpfO9Dj3iXDzx0XoZvrFzkulfiscYeq
         7QHVWy6k9HtcUT6ym2sFrApdrTXP3Em7uQKqjpBIHZGXCRsbIJO6g2O1rlKwd1m1Wv0a
         K6IESL7UyttycANqMiLEEjQjLi4BkmPfZn+rFe141UUwUp+YppYqzLfQHIFrQRlxWxpz
         +FLA==
X-Forwarded-Encrypted: i=1; AKwUvBwMKYXBjCn3wcIgoVICriWnsn1m2FGix2qojELXhpLyWbsp5J7zZUHCxB/8s8JVg0IkjAi5QuPzG91V9xA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5bqe4FVx+FvCXTYzg2XGcngwWGw1s0+ouRov6UMelYbywWVb8
	KA/FxCvANWUW/IJ/3nGq3y7Hwb7pN65pv712p9jfAkPier5pkYQPQxc3
X-Gm-Gg: AYBFou2FFX6wAO+KGg4jcVE7lWoUCH3rDmxRgWGgLpubf6/VlhoqKFfw76DjeFZhQ/N
	EJvbfxPK8K2b77ZrbsivPHtKF60vWhLJW9r03EXilKPxM6lajj3yMrM+s03rniF+eXTQy+D8x7e
	PeYCTo/AgwmOFw0WOYfZHkBNi8FgZoLibrX40rVCyItd9qHyYeafYXzrjD5Xi1mlDucVtht4uun
	DSliYPKG4hJIGQzpDlMFTdpTvKPiTSvkBTjbiVnykwoMKOfvAjyVMBRqjSE1ZvbOsbZTGXgHJom
	LG6VW2mvQoxLsHS6oaVz76MO40RH0LYyd2O8UsYNaUeVOF5C8khROA9m7cTD74fmiMt2TN4njqR
	r0tgHwmRSh+4gpW91TuCq/L45V9W+vXvC1yvLzXYL2CTwcnwGL+s47N6xtDESG1+DeexDsSUo32
	TsiBihnZGjrfqoIwjjkBKZ5sr/O297b4UIn7Mr32K56jD7cLHtxOZOVHL5DELwvSwFATcTHpmVe
	cCXja0Utg0tyhJ/l5IRDog=
X-Received: by 2002:a17:90b:5486:b0:39e:6a7f:1dcd with SMTP id 98e67ed59e1d1-3ab3ab1d56cmr13363689a91.41.1791958190360;
        Tue, 13 Oct 2026 23:09:50 -0700 (PDT)
Received: from [127.0.0.1] ([2602:feda:30:ae86:295:dff:fe84:68f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24a538sm2984964a91.9.2026.10.13.23.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 23:09:49 -0700 (PDT)
Message-ID: <b8c40900-c5f3-453f-a440-6ea540c684ff@gmail.com>
Date: Wed, 14 Oct 2026 14:09:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] usb-storage: 14cd:1212 returns incorrect data after large
 READ(10)
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <34f2ac0a-04d0-41cf-a2a4-11a93c7c9b91@gmail.com>
 <1ff84ebd-f805-4f16-91cb-ccc805c8e946@rowland.harvard.edu>
Content-Language: en-US
From: Xuntao Chi <chotaotao1qaz2wsx@gmail.com>
In-Reply-To: <1ff84ebd-f805-4f16-91cb-ccc805c8e946@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 10:18 PM, Alan Stern wrote:
> 	echo 14cd:1212:m >/sys/module/usb_storage/parameters/quirks

Can confirm that fixes the problem.

Regards,
Xuntao Chi
