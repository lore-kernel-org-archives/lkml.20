Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3002151CF65
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909932; cv=none; b=QTZo05DOrsHUEpTw5buBB0Drjtpec6K8FdCxGUX1fcHCASni4adKc3S/KfMNfPY4acL/Dkfx3QNN5G6WUwxSAjbocB32KUcgYzmT3flwcY7DP89/iwYnTI2TcA9LCqZgtSPU6eqYdTxvAqUQVN4DNWBZ6UmJotBua/VSmjW9mL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909932; c=relaxed/simple;
	bh=2jPCHhQYXRl27PTSjxxKiq+mBhD4g/zPuIPHha3DcoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VfvNTLXb5wUrdIAJDctccMNuCKLvDXFmMrqDBrWipHM6bK4Ex7Bw1nariAfexsbx6cxT9KLm/Iqwcio5nD5ot0mm9zMZwWe3tr9EqWMn3ejRskGV7skmT5iuzCNiyeDlLlgDuTkZfxcIXXUqfBBCF6do7tq9Wm3A2h6DAJZ9d/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lx2bpbEc; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lx2bpbEc"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd623dfe420so48791a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791909930; x=1792514730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtZ5PzT+iVNvU2u5JnqRMNxH/iEEZQesxZqimXqa8Xs=;
        b=lx2bpbEckBxUwJceLTvCH5fPGnUIecKhaKFsbNIoGRcSxQ/3hY2Wd5NhQr7KVYrs3x
         9oRS9ImHOQDgAWlWoQ5rBh3zJbpGxuaKYrh7GKnQolVAryOrW7ouikVRKF//qWepMmTU
         9zEMv1g3ra0c6bVUUGzMd20cBOkrlpbtnMwWkXoAO9+jqEfQbgFrkhhTjKtTgSIOmt2g
         cA0txFwWliyQ62jyZByAvRFwREAGzCKIaMr/I0DoiJZcMpLVV0hI0nxG046jwuL02Zpt
         cQ0YHkubuPqfZc6aVWrxnoGBD0jiq6sFmEnCCi2qqu16Y3moNqh+tMAIZLGpGdOgTRC+
         mZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791909930; x=1792514730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtZ5PzT+iVNvU2u5JnqRMNxH/iEEZQesxZqimXqa8Xs=;
        b=QaEKFQmr6yw4jCLmk5QFiasapCRzdEqhXOdcum8vV5VXLHIU3L28wxoUgjJP0dm2Jb
         2Jkg3fpeA5tdavm1eAcwQXboVZ4kA4x/EnqHArcovktTK1HfvKqN+ybUXKTljmhThaoR
         leSYvH1cmeFFSNWUAl14uddTyqzi82EtKP5j5WXFaAY0n6VH1LtIUfYP/bF6J6Ir5RMC
         +M6oXyyBHpulBFot0cYF6gijAwHUjmo9cVXmwnYKfdYDYm3J2qQbyyE5kdcXVGCSAS64
         cBVHTCQoMgEmBrlhaxchIonCwYWzEmnE1YLRJMA0suZW4FIojZ+Q67n5vCcY+jmHiqf7
         JACw==
X-Forwarded-Encrypted: i=1; AKwUvBxtuIjRotPj2GNGBGCk5KUej1zu9dNKASS++DFb4Qs/r12gLm+Og6znaZCNA8D3AppAFbxRV/7Q1EbloMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWN/8Q0FlW21EAUXddKixyaLFHt7Vkly5+WK96cFj3hLcQxCFD
	akveBVQYXbKLF1RT69GtmTIWLJbA5aGGvtzZaaHN3Bgbjq6toxf+Afw=
X-Gm-Gg: AYBFou1G3KLFQRRKWqPaxE6iKGZp2od/1pOplXyn+4IiWIl0o8IWiORa/fwgSdDF1pY
	eAYcB8KC0jvSYofZbWqj9ndjGQIpD9WCH8KcxoKWLZyb2orKxvV/b8ROgo4HyHFE3xK9DPireBU
	K4jkxX1X8gPBj9w7mpt6GdEoKNCCcdcdcp+qntUY41bf3OsCTIk1PehsMo7tMsV5oZMyqzl9m2W
	Yn6Wpw7Y1vNIfhRqaxqmqzzQInH6o/+Bep92ZAYjSmE3frb8zmFNt8ZN9pdF7GIh3a/tN/rrkO3
	Kp+yDswfIUC+e4qY/OmXrMKtAlFrxzIuD4hgBXmvLSX/8evsbIqithQId+9N090ebOa3go6Ni0g
	vLrv2oYjkOUAQIkpWBHaJOUW2m8cPn+Ju7MYgIljDPSBTqIiOboLb6mZcZBb07dHqH8wJfIeU7+
	OIIHFYt1XKCPwyMHUGGA11L4aagcr+Rce4ac9khcQhRU5iuf/Fk5jyaQFTQRhknMxf77vQdzIyI
	gtMQto6L0Yto4n1gVkfHwZ80YvI3hYYHA3//FuLma8=
X-Received: by 2002:a05:6a20:d492:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3e16bade0eamr11806760637.1.1791909930228;
        Tue, 13 Oct 2026 09:45:30 -0700 (PDT)
Received: from [192.168.1.45] ([101.0.62.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e26ddfsm5695150a12.17.2026.10.13.09.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 09:45:28 -0700 (PDT)
Message-ID: <ab328578-08a6-455d-a9bf-411aeb561c8c@gmail.com>
Date: Tue, 13 Oct 2026 22:15:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] iio: atlas-ezo: Fix humidity channel read support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org
References: <20261012114553.3327-1-nikhilgtr@gmail.com>
 <20261012114553.3327-2-nikhilgtr@gmail.com>
 <as1G0yGQ5wKhd-dh@ashevche-desk.local>
Content-Language: en-US
From: Nikhil Gautam <nikhilgtr@gmail.com>
In-Reply-To: <as1G0yGQ5wKhd-dh@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joshua, Andy,

Thanks for the review and feedback.

I checked the Git history and found that the channel type check was 
already present
in commit dc3ebfc ("iio: chemical: atlas-ezo-sensor: add humidity sensor 
support").
It was not removed when humidity sensor support was introduced, and
I couldn't find any commit message explaining the original intent of the 
check.

Regarding the potential I2C read issue reported by Sashiko,
I'll investigate it and address it in a separate patch series.

I'll also omit the cover letter for future single-patch submissions.

Thanks,
Nikhil

On 13-10-2026 02:15 am, Andy Shevchenko wrote:
> On Mon, Oct 12, 2026 at 05:15:53PM +0530, Nikhil Gautam wrote:
>> The atlas_ezo_read_raw() function rejects channels that are not of
>> type IIO_CONCENTRATION, preventing the relative humidity channel
>> from reading raw and scale values.
>>
>> Remove the early channel type check to allow both concentration
>> and relative humidity channels to reach the mask-specific handling.
> Have you checked the Git history on this change? Anything interesting there?
>

