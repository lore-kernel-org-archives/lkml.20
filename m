Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5895042FCBE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183432; cv=none; b=am4h7+Zx5trY4RXms19z87DjdjJl91UQsOTPHpKoh+201v5AFT95gLRpLyv+SprHJ8MzOXe6KcahttIRFqpRRhGFNze/aJucCK9s5kK6WHjDpXQ8s3jKhFVxOP7Ea9G6iEVdqT/gllvVQlgFzeR6tIb35MzcrMtYxtfq9G7hRK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183432; c=relaxed/simple;
	bh=+crV5aMzmvsMqDok6yibOvFk6mwHBFaHijEaoyXxk2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGRsm1AgrIhL8iWYGgdKhuypqlhmMtIIvaba1HY82QZKmpe/Xkbols5K0ou/BBAzzhMx88K/JmAR9/tV2+SX/PwiG0cpiJZ4qaJUJv8xg3FdxQrLq+LnOkQu2WZeyNeTB6OsHTcGrA5ACsL27tHbPA+mmUxD1W1NRHR+yktyYUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srHLz8wZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srHLz8wZ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so40796215e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183428; x=1788788228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5UmvoqbZ8X/pbBv6+Ee4BUY62pNZyn3Ji5DwA5JfziI=;
        b=srHLz8wZqiEnmOu8qfFBZT8/WcNk+i87gzecbpbcYxuV5Gd1ZRJA6bY2ySkr5EcZFZ
         xM/KSgnI4ucHco6VsjntxRYH26Ql1pN8njKjkUWP0wyr+OFjsJB4TP09K0U4vYFQ7t8T
         anyGWSZeGkL8x6Eioqre+vAHHcYefs4u6//Zh8pWcBhJxao0/YjGuuA6QXgfhLUYzMGr
         TqpiGFY76Axa9FcGZfvkwWrkiBIx7DpGZHZ4xauswrfu7RqLZvdwDEBmRg6izA8Vx/nF
         OP8fbCnSOUwbaIYMdVJi1pTFWJrqNU0NTcyIyGW1/YEJ+6gNhQMHQCt7wAdSVgl5l2zF
         6TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183428; x=1788788228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5UmvoqbZ8X/pbBv6+Ee4BUY62pNZyn3Ji5DwA5JfziI=;
        b=RAyAGHn4sX/pOle6aCcAbjl2DqyjMGTKdYwJkk/7NXmJIyOkL3NljkVsN4EHAKElDr
         h+Qo6Cr/00XVzEmMSuuZeLCeKXerwiz5wMs9iwh2gzOX/pu4waliTSqoZd7cMxws+l7d
         WCvGOVFtW8aucJaPgl1KT5CKw4VUqiy879ENI9nPZ0QvsP0qnsm+tJfj4xSRk8cauHS6
         Ax2omKWZUpDQlERqBobTMIdWC0sbgWIeV/aBa1k3jMR5J+pzQHoEWAdTIgi+Y4vNvwyy
         Fp9fHWWvxq2pCx6BfKkEP1JM0Pn+8cWm9vksE+3PMWt6Sm7RP9JPyfrMgFfXF+xMmXPq
         E7Eg==
X-Forwarded-Encrypted: i=1; AHgh+RoD/AJCFKXMqN6pS0hcbZ2VpDszsW5uYJLZTv8mZJ1OvaCxsE2HKGDeXv0VRbFdEdHF7ydYtAaUk3xA9to=@vger.kernel.org
X-Gm-Message-State: AFuF++kDndjBnK+nId5aLdhl4IM8a78tP8b4mas7bfIA2nORHlnRqrow
	DEAN+a5YGEeEpGah01p702jsyivIyWX8qj2fkyXj/TOfcbTP9EhaR+3I
X-Gm-Gg: AR+sD120TlqQSocbNoP6Sy8bj2b2+v2RpTB8KEyqbF+bsVqJd4/uR4SunJ+sY9NYU9Y
	13guS0u5z/QSGzZz0oB/zbSs2q9lu6gRkVgHWSVSDcReXk1YBNOgN2XXMwhsNQjzfnZ37FUB/kr
	pGoGJM0vdo68GD3EnlpAIYzZLUzUPjyXT4Z/R1o7XjBAU3z8IUJnfzpRyS82le4Hg0pygHStObt
	gdrqpePLUXR53KElcuhOqHDFICJ+idRbozo72Mh88q63bE2aLheCTXZGxO4qsi1rP8NVSU9jXMy
	sEXwcpCnySUq/rYJ19GJ19qRwW04oWP9Qap3TJwAV8e/lvkfre27WE5QvuZ9fy+7D9DVdZlMBf7
	kD+aCQG5queuLKw8BTImrqLXjs+MfJclZII/lsUKKgls2X1TV5Z1xkNHxb7lSXl6dloLXKUBRpx
	lernAgSCLCpkQ0g5onlwtJXRoRIUgzHwugc+ijCGvLoBfO+ZFWnpclnEAsMmb2iv0=
X-Received: by 2002:a05:600c:a03:b0:499:a8bd:1930 with SMTP id 5b1f17b1804b1-49b91c20ba0mr375282175e9.5.1788183428335;
        Mon, 31 Aug 2026 06:37:08 -0700 (PDT)
Received: from [172.31.2.29] ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm346376465e9.4.2026.08.31.06.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:37:07 -0700 (PDT)
Message-ID: <f48c0b59-0d6d-4b99-8990-2473919245be@gmail.com>
Date: Mon, 31 Aug 2026 16:37:05 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dumitru.ceclan@analog.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu
 <Adrian.Suciu@analog.com>, Cosmin Tanislav <demonsingur@gmail.com>,
 Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <d0537d7f-6e74-4cca-93ae-398530c5cd51@ideasonboard.com>
 <ao_5LDgGjzvPZVXU@kekkonen.localdomain>
Content-Language: en-US
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <ao_5LDgGjzvPZVXU@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/27/26 11:45 AM, Sakari Ailus wrote:
> Hei Tomi,
> 
> On Wed, Aug 26, 2026 at 01:15:03PM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 07/08/2026 16:02, Dumitru Ceclan via B4 Relay wrote:

[...]

>> The deserializer TPG gives me no frames at all. I recall the clocking for
>> the TPG was quite a challenge on at least some max96 serializers, so maybe
>> it's related to that.
>>
>> The serializer TPG worked, although I think there's something funny with it:
>> the initial frames (maybe just the first one) seem to be truncated a bit,
>> there's black at the bottom. Another, a bit more unclear, is that sometimes
>> ser tpg stops working. If I'm not mistaken, what I did was run cam0-tpg +
>> cam1-tpg. Then I tried des tpg. Then cam0-tpg, but it gives me nothing.
>> Streaming with cam0+cam1 video "resets" things and it all works again. I've
>> seen this a few times, but there seems to be some randomness so I haven't
>> been able to pinpoint it, but feels like there's some extra state that's
>> left behind into the HW.
>>
>> All in all, the normal case (non-tpg) works ok for me:
> 
> I'd indeed either fix the TPG before merging the set or postpone adding it
> for this reason. :-)
> 

With V16 TPG deserializer and first frame serializer issues were
addressed. Also, we could not replicate ser_tpg not working with this
revision.

Thanks,
  Dumitru
