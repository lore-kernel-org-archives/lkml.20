Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758AF3C2775
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073924; cv=none; b=rhvdrbQh/Aq7A/bFOHg4FZfobhYTDkYP5b3CNtG2NFMbcVF48GhfBo7uHCVZObyeHcFRrVjX36cH02o4N8qUk9AvZiRkBpgFGs5M+j2ovKneMdEvOn/Aog00kGOuqDIF3tYHXCrBQnflWMBLpOSgI3XNtL8i2oCFu/GT7wmAAGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073924; c=relaxed/simple;
	bh=ylWdr8yhyOUHr5p7rV7V/FTvMFhwSjE7Fa4ndWREMxM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mXn3ZXO8TNR9EOBhkDaLC86tIsuICSV2XwAltEnq1aiXjQGx7nkwmbb645irDOkpC3xJX92Tq+RWyJD1h6QUu2k3vzSQIIibO5K6t6hY3hlwxunqKso/bKyWDM3SLpzR++Yl+QdRt3Uaunsf/A4Qy5o4aHBn3DVPk3GZZ+g0H24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=JCWIFFcL; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="JCWIFFcL"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f5934ba2a5so134488a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789073919; x=1789678719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=227EuAsNywH5Ru6uyjfcvigTr1soLZnaZRqqI+5pgxA=;
        b=JCWIFFcLxLQxXdXDZEqLRBuXsJhUNNgngvc5gWsDUDvJybqybK9yVb7iLek50ShSMZ
         /weV9JaumU1fbMQSuJRjtmii5oKcvXI7hapFyIj9WN1anPieaNLAHzzxFVkj8Ivrd/Jl
         pbN/PxTQogxvZNrlHqRZtGoAM8uAriRL0ZuTT5QF0L3VfSsLvn7cHYJWEnnsRDuATUDR
         ol3EcgyDzCYe1VdcsqdVzSFGG63cpGPsck4oVgcEVsNpWQ6wl7Imye9o2679pizPWvOH
         XPgaL+71rKMZA1s640W3tlBhJbBFo9l3PYafygM90yKbz34uCamWM5ssODooIH9n/OZG
         4SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073919; x=1789678719;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=227EuAsNywH5Ru6uyjfcvigTr1soLZnaZRqqI+5pgxA=;
        b=Wuzjo1MuEzzwmZIBtKtqcRa/Y0VX4luJi5egTbQ25A3QhkkYpghmYiuPEW1d31rosW
         +oTOQzqfWqwGbA0VVD0GqonqhPpqsAO6anrNvbuRkJD1Gox+w7uoeOF6GqF+AGM/SGKD
         KzvZ0KTjefdC7ZD8dxtXYzsaESPpIMCMNFVryt/z353Wjjx28przNgWptwnR8+1Scznm
         woJPp10FLyn2Pioidhm5neOJ44h8ozsx4pU70+OdDW0ExYuthFbbTENLxVFc1CBruoY1
         h3PVwkSb9u0HmRIB/9N4zpDb32NO4ThF/Ab255hf9MMubyoKOk5yHSJLz44K0ynpgceV
         ribA==
X-Forwarded-Encrypted: i=1; AKwUvBwP0mPDxKD0P0acSPAYkKtbC1JHC4FSbzLtq8hxy/HR+vv2z+6ZW7prJXrmTZe7evfgzEIPrOSntHKOTmU=@vger.kernel.org
X-Gm-Message-State: AFuF++lpFjdR7g58zuNHy2579W5MpF22IrCZfHooQ4Isw9dxJTKI2if6
	AqXIsrXE022SzhFqsVoTdSk1lstI2PI+R7HmmIxtw5N6r9ClnaQamEsJ5V/W/5NOF3Y=
X-Gm-Gg: AYBFou3EjO6YKn0okOfuVtvLYpeiLnJu015AiBNDgsB3FDc2J7wptFf44TydmJxUT+2
	WMsLXWgXkdCIeEQL1EfkkXBwSIAI5fsFgw+dIG591h9yk5qFJ40RrDVJJrnAgR1zhQdDmf74lnU
	dKhBzHwY5VZnKTxTk/F8BQmmYUQ1B+Vn8lOed0Q5AduoFbi49ItG+10FESWW5eR1IG0b2Ns/Bwm
	84O3X/fMtLcmwLaYYlaUzKR46dN5cGZj9Vfv8j3x5xYhEo2yJiXD9nL+6CjDDPk0cOC9YAUyO3d
	cirI+rewj8AIkC2O9rwAIbk7MxTJ4qxbqLko3q8hLGATIXKXDEYfCtyEsnNy6kBdtB/tIZBlQ3x
	Vspsu3jBZL3Q9OB/KwW5v+4UX0V8E3N/nHg9coVU4TjqKotEWgCSQmVjCVnNo2d0FDXn2IV/aUV
	uuw1PPJvr45oJA1L53OIfvU4Mt1duYVwyc45ahHRl2UYz7698DZFS5XvLvJg8/0m/bC0sBaOTN4
	Vt1ICuLT5K5cqVXZEHqKPxCYBD/7RrdiV9Cl1FgZC3Lv/H7j8RIsB+9
X-Received: by 2002:a05:6820:3411:20b0:6c0:5630:bdef with SMTP id 006d021491bc7-6c0bd97850emr353461eaf.67.1789073919642;
        Thu, 10 Sep 2026 13:58:39 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09a122443sm1108879eaf.9.2026.09.10.13.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:58:38 -0700 (PDT)
Message-ID: <eb469580-509a-4895-a819-e7f3e4fa0b0a@kernel.dk>
Date: Thu, 10 Sep 2026 14:58:36 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/16] Add dmabuf read/write via io_uring
From: Jens Axboe <axboe@kernel.dk>
To: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Pavel Begunkov <asml.silence@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Damien Le Moal <dlemoal@kernel.org>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, David Sterba <dsterba@suse.com>,
 Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev,
 nvdimm@lists.linux.dev, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
References: <cover.1785596451.git.asml.silence@gmail.com>
 <178907372259.484803.15807864431748251506.b4-ty@b4>
Content-Language: en-US
In-Reply-To: <178907372259.484803.15807864431748251506.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 2:55 PM, Jens Axboe wrote:
> 
> On Sat, 01 Aug 2026 16:46:12 +0100, Pavel Begunkov wrote:
>> The patch set allows to register a dmabuf to an io_uring instance for
>> a specified file and use it with io_uring read / write requests. The
>> infrastructure is not tied to io_uring and there could be more users
>> in the future. A similar idea was attempted some years ago by Keith [1]
>> (from where I borrowed a good number of changes). Later it was brough
>> back up to life by Tushar and Vishal.
>>
>> [...]
> 
> Applied, thanks!

Eh no it is not applied, was just looking at the series locally and I
guess it got added to the b4 ty pile.

I am, however, wondering if we'll see a v6 of this soon? I had some
comments on the nvme dma mapping, that can be improved, but I'd rather
defer that to post getting this included.

If the series is dormant, just let us know, and we can pick up the bits
and pieces.

-- 
Jens Axboe
