Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459396;
	b=vDh57G1MDqLjmzg4XsDl9Gj5fYobEPFH85RLQjakNVPAvw59l1EKM67nNcBOecmJlUUn
	 7gRcN1xY7hu5PHIs6IcHgI/jf9cqY8YwxxYvS/XEWulR/u/dTlAMdIWm+mzp3py/89ovR
	 EUn7kU41Dd79kMxGVVEnis1ylsYINAcKHPBWezW1imYkNertcRSVqdsD5/ur0f5DbUw3j
	 3KB+Q553yzaNDCBZUKiPiLIoM4GjwPYUtsFco38pDDFoeUW16SAUo3e+uopZ0DoGIKZ6K
	 YAv29e3xY20pfwutmLRbT2LPh6bKhb6JJ5vDkPBxogLQnMyyhFPKnSqZaEsTc81h9wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=df+72LAtxdjU5yqYctiMIQug27OaJJKNFKp3UtgKQf4=;
	b=F1YSqf3c7IO9w9n6JmNQ8RfRVuOHHt1OuULNZhKDikyj+25y8kiJoH+aggzC1+P9H/5y
	 oT78c0tZaMimq5OmmWjNxYmGztF+v8zttMtNs8YYd5Du03oMdo6HRI3NORCD064Yafgm2
	 WtI9chfubJRvH5dT5IWKi4p5jeE98orsi2qV/lXD6n2KtYBEXgWQ2NKqbaAvSneI4mCvR
	 0KRBPUC+OuI/ZYj4cfjIWzjux7maeaaQ13K70aA4e3YA0ffISm78gpCvN8om9krIwMtY0
	 Q08pXFHDf2YwE1ConF2QodarjYk/H79U1tfpT5AnwV4cfWGhntEnOCCn3kjGIJgRioA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FykZU5hY;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A38606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A38606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FykZU5hY
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8198a3a54d7so213922a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792459394; x=1793064194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=df+72LAtxdjU5yqYctiMIQug27OaJJKNFKp3UtgKQf4=;
        b=FykZU5hYld6g/fiSOZubNgxx/gA0GRszrDob1YkMimN+YEkuo0ab5LnoDUVwhh+Io1
         SxxvVjbPIyf1323wDoUhd2bZ7bbR6LRZ/OgJdXDYMgwR0hVWeVil6bTIyYiwYG/xWrDJ
         oEuh1o7Fig4V/7t3QEU9YxZP7lszhI1dMcmGzN3s3D4YUis6dagcNni9D4g6R5zCjgNq
         pDAD7wA9r/+XM1RzITVGmqM9UBJL0EqPAq3K4YnYGsxIF7VrfLzAiopNWGtGuEjw/cCc
         +hO6EfpzZO0lWCSi+Ps+QWENt1jaVmyBdcjX0KRpP/tpvxgv3zFpm8IrAousTr6nE7U7
         MQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459394; x=1793064194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=df+72LAtxdjU5yqYctiMIQug27OaJJKNFKp3UtgKQf4=;
        b=PPKo4QMscSCcy0mIpK/CdO9Zm5CwjRn31znRRp5qhDq1TxtX7CbaxGuorCQC7geN7m
         OsweVz+5nfFl1CN73Zc/QJczrAtbQUgIY3RY5P2RV1ZZo0q7F/3XPX7Lacg2m8JwuLwP
         5KI7r6ELW764dPkBjySY16FHFR3pkagBGNviJOLQEkhWTfBlE0rM+dpBtWWRFW7MesTb
         sneNO6r5hCtTPTKSBrx2GG5Y+QJrYZH9ZybOLuGDC5h5b73NhPAa+P057kWHADWntO64
         uXDbMM0obZlGHA8QjKfZUybxKbN73K7ttwpxLw97/G0w8vueVrnho4TIoYmuXQrlG5+w
         qKpA==
X-Forwarded-Encrypted: i=1; AKwUvBytlRV6QnpLndz6jGMOBbshgD51rZIQ3z7HdmXTOt81bmyfIm/t2J5lEBMEIu+UdDhzjm7nrI99kKPTbvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXpgFLKU/4wrVeVVEO7u8HjQvfnseBWYgsq7ah2GFlwJKQHyCv
	crn+YSSzJI5jartcikiW+W2UPrim3MC7PZuiRhLQH7J2sGM7awUw74FpPIrUAM7r/FI=
X-Gm-Gg: AYBFou1e6uE1dI70A8hUG/pE0OCvigafN74PEqMyJ+6XrZPLk48eMTPqCr3d0sRj/dZ
	/+oVyk7pcUoKklQSLEy76P+1dguOVmdDP0v8njV5IMcT384379XXdRFuUzNZi7aIJShJ6BUdFpz
	z0Gbjhj33LTHHuAfz30kT+1W24FOfEwL+k7UDPGcJgZamfsIJyVmlleoQammsUJ4YsF2EQtC3Y4
	etuh2aCmcEBIUmGpDXoc9OMLL8gfo4rEpp9I8h3CSlwyiBn23sCN74xx2fWHZOsRVliLBHnHxiH
	lrNcnJ0bKsA/28JnCzF2b0CPanwakiS+2vRXrSEI6wKGz2riebym9gvmsuJhvUetRECq3oM7OuG
	q4BxA2To5lb1JVaG9cirKZXCzIaXhfEPs7Vs9kZYYJSLLP+qbuGAoRYNFDatVJnb85M6m2Z3VrZ
	BpdBhMOhwKckFgetRWxwSDq7LRA5BDCPKaBMbC0Sp8pSMxoQR3/jbB39b9ZOsRpzGxjbhKgJ1cV
	jifHn3V1q3ZJ2fx2UvN3+2giiAlIqq1cYFfQbdoFnxmYOBHUVaVU1u4zQ==
X-Received: by 2002:a05:6830:3352:b0:818:a1fb:8fbf with SMTP id 46e09a7af769-84b7878b574mr435399a34.29.1792459393990;
        Mon, 19 Oct 2026 18:23:13 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-849859184easm3988307a34.23.2026.10.19.18.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 18:23:13 -0700 (PDT)
Message-ID: <3ede4588-ffac-42ec-8058-b37c241b6830@kernel.dk>
Date: Mon, 19 Oct 2026 19:23:12 -0600
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
Subject: Re: [PATCH v2 0/2] loop, nbd: drop partitions left behind by the
 GD_NEED_PART_SCAN removal
To: Cyril Brulebois <kibi@debian.org>, daan@amutable.com
Cc: Christian Brauner <brauner@kernel.org>, Josef Bacik
 <josef@toxicpanda.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, nbd@other.debian.org,
 Christoph Hellwig <hch@infradead.org>, Bart Van Assche <bvanassche@acm.org>,
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, stable@vger.kernel.org
References: <20260824-b4-loop-nbd-stale-partitions-v2-0-9815a577cebd@amutable.com>
 <20261019233109.55q3cd266dfmkpa2@mraw.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261019233109.55q3cd266dfmkpa2@mraw.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 5:31 PM, Cyril Brulebois wrote:
> Hi,
> 
> Daan De Meyer via B4 Relay <devnull+daan.amutable.com@kernel.org> (2026-08-24):
>> Commit 267ec4d7223a ("loop: fix partition scan race between udev and
>> loop_reread_partitions()") stopped disk_force_media_change() from setting
>> GD_NEED_PART_SCAN. The caller audit in that commit only considered the bit
>> as a request to rescan partitions, but it did more than that:
>> bdev_disk_changed() drops every entry in disk->part_tbl before it consults
>> disk_has_partscan(), and only the re-adding half is gated on partition
>> scanning being enabled. The lazy scan on the next open was therefore also
>> the only thing removing partitions from a device that has partitions but
>> no partition scanning.
>>
>> Loop devices without LO_FLAGS_PARTSCAN are exactly such devices, and they
>> are not unusual. bdev_add_partition() only rejects GENHD_FL_NO_PART disks,
>> so BLKPG_ADD_PARTITION works while GD_SUPPRESS_PART_SCAN is set, and
>> parted, libfdisk and systemd all fall back to BLKPG when BLKRRPART fails
>> with -EINVAL, which is what a loop device without LO_FLAGS_PARTSCAN
>> returns.
>>
>> Commit c4f4c0fc551c ("loop: remove manually added partitions on detach")
>> fixed the detach path after this was reported as loop devices picking up
>> partition devices from a previously built image:
>>
>>   https://bugs.debian.org/1141434
>>
>> These two patches fix the two remaining places that relied on the same
>> lazy cleanup, LOOP_CHANGE_FD and NBD_CLEAR_SOCK.
>>
>> Regression tests for both paths have been submitted to blktests:
>>
>>   https://github.com/linux-blktests/blktests/pull/259
>>   https://github.com/linux-blktests/blktests/pull/260
>>
>> Signed-off-by: Daan De Meyer <daan@amutable.com>
>> ---
>> Changes in v2:
>> - Rewrap the comments added by both patches so they fit in 80 columns
>>   (Christoph Hellwig).
>> - No functional change, so the review and test tags from v1 were carried
>>   over.
>> - Link to v1: https://patch.msgid.link/20260806-b4-loop-nbd-stale-partitions-v1-0-67bb75a8d7be@amutable.com
> 
> It would be nice if those fixes could get picked up eventually. They
> received a few Reviewed-by and Tested-by already, and that v2 is only
> about line wrapping anyway.

They need a respin.

-- 
Jens Axboe

