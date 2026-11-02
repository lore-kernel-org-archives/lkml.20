Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606449;
	b=jnDcF6Cv4Y1B39WqKzat2kBcgEMLd0JcLZ3ktReKMK5qGjMRQKr5y5u/er35va+pvnPZ
	 r0QjXRkxArOZklE7FQom+zUj0iBYxPfL0vYyPjP4KcNlzThuMeYoMUJf9A/sm1KIRHS4g
	 RXgfTAfCXbV2nAjzSKZE2stPzpaJXkgV+/furhvEHNMYU3H42e0hCfrd7xY+tARGPi0OO
	 rgpoantmWIl0EavF2j7EfpoYUkg5xLdsCVQ4N/OAeWPthDfr6Pg+rDY4J7vndrTG3wxM7
	 twaTj/6P78sn0flwz7qDMg7WNsRInyO2pAIdH3sL7MPf5zhjXUOw4jDoJ4fXJSq3QqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8kqF3ntzYW3hP6K+8Zi1mBskB8D2QgCHbNZ8Jdf9/+4=;
	b=elxxXN1SeZnCpcZ5BjDieb0gLX4Ers3uo4+9O+vvAcl7cl1zz53qU17TrGMxjKrOmRb0
	 FSbfUIgHnc5sdFMi9ugXK+FCjOOUes5bjSmFm1qIKEVKkK55KzO3ceTryZZSs8gVwPBae
	 FB4nHnX+xR6QtgrrEWjOhRX9eD5+1HxIfNzMyT4vRfyqMjCYAIvWfT948x/XclGKZm+rw
	 /tq30gJQei2MKjNfpUab6jQEHlqbte2jL1Q+00X7gRh6QzrWjbTByDDprfs/5FtqoIzVa
	 clGjBX/5MklMh2F+CAz/+ikXyH86MlpEHwIQvgOmHw2vMzJuUZEBSoKbsFkDvYKXhUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WlSZwWCi;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4835606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4835606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WlSZwWCi
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3902594eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793606448; x=1794211248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8kqF3ntzYW3hP6K+8Zi1mBskB8D2QgCHbNZ8Jdf9/+4=;
        b=WlSZwWCiq2PAF+H6oZ4EkhdoOGWWeYu7f56c319sIi8m2ToY7CTu8Y1DrLbRw5nAMi
         L/5UoU6Ivu2LXjt4JX5Ig+TwCrsCPKYiDYhYqCEA0pmOubyaR5IDeoSVVqZWWkXXErSE
         SdCJnanp2UU9nHttCa77WOscrVnwFOW2Dep+EqPNgDolIWhnjfHb5vj7ad/Sz0T6wMjH
         Zwhr6BJQBoovDKodO/hmXJfFwliqpS3zeEdgRItceAgDjcb8mjTIwza1U6Spp1L3UvEg
         o2RTw7QhM0mx0SWZPyJhv0SRjAGB4x/QqicIe62ASgt9nFNEnYTSFHRxjq6v525KWzBn
         CPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606448; x=1794211248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8kqF3ntzYW3hP6K+8Zi1mBskB8D2QgCHbNZ8Jdf9/+4=;
        b=Mbrq+Iby6/PWeIqH9BQxI4v1q0lVP4yA+e/Bd2DR4fYf/LGtABAzQcExkpJkyX3b8/
         JtiNwtV7UhetDsiJ8Xf6D6+xuqvfHicbLp0bMhFZWElx4/LGjrTa7T/hOi1WcIfsm9DY
         2YKQWQMDuMU/UZuGlLXK5bjD1G7GUaImJ8W7oU7S+p9/cg1E1URpCx0okXexfHPuEBp+
         WXdxjbZCEVXft22WB2fYfxiq9H5gfw3JtxElHhLelqr7uXEx7tdiOpgZ82ImSLpRuCuN
         DLsECPA5+49guPGTiktKL8GUjQ3R/Avs24EJDnr1jlBYu3ED07I5syObjCnrGhc/R2J7
         k9rw==
X-Forwarded-Encrypted: i=1; AKwUvBwxd33Aru+iOR2Tz9hbyS9m70lQZtmYPFJlKVzW4Lmh8mZBGTKIxEZa8Qz1OZ+uNjXqQfK6E0nOGvQYJHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IgSPotbGGXlL+w2uGu0uM2XIYqzxbbsr/ELsvc2EDxbhop+ba
	XsW/2oTtPvkd0JDrkyBoiTrBe6xN7WE69BrG6ntRctpmkUnNbjiXwJui
X-Gm-Gg: AYBFou2dDbMmDQ7UHSD8DkGe6KhrV1aigM9nBmOjq/dlP+/7keiySXv50sr6vktSFs9
	xnApCfiS6b45Ew3tYD3yRRxCLEQN8ez8r3uzRMxYwdkbWUKN4EbtoygoqSEWcATVAzqCJPm2SAE
	xN9w3lshGRVO5k0KxmVJdAc1Cd7aw+qUg+X7BYhh1LM/OzhlKh+CuumBhw+ltFZ5NRaN1dMoy0d
	1aWou6opwI2o3H91IkFH6u0gGef7q3G3vMiNWTwn+OsDRcjvqOIpNTNAkzjBvlu7iyhicxifQFE
	sLH1e8yCjO3IbI71pGvBbY9UTKt6bMNzCPR8/h6OAWzz8yn6/tRbZwfMOkBF9/LCaetvvFYrmu1
	R5I7NiM6keGTZO9/pkyMFzhr4dM2Y3QN7cqmd1v1/6trEOzZ1OISuJG/uodWk5du23JRr6pXh3s
	RNd+NMtSBmCgNXINW2Rd65Luh+vNGylpQfZFQDkxZeZ7Uy9BRNr6sIwzCecCi33KrrrWzwHxJEC
	4WLjfSFp7jT6Tb0ItwZqc7wRAOeO1wK2qkMPo6y+kkMBHRjHdeGFysiYxskRVylsRDQ7z38rg5b
	ahRMdVTekxLBvlDMWCtS
X-Received: by 2002:a05:693c:4152:20b0:36a:1807:75a4 with SMTP id 5a478bee46e88-36a423cacb4mr16532556eec.20.1793606447377;
        Mon, 02 Nov 2026 00:00:47 -0800 (PST)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm36371585eec.9.2026.11.02.00.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:00:46 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Hannes Reinecke <hare@suse.de>
Cc: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	Ming Lei <tom.leiming@gmail.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: Re: [PATCH 1/2] nvme: remove namespaces in parallel
Date: Mon,  2 Nov 2026 03:00:41 -0500
Message-ID: <20261102080041.1269654-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6e9e6f78-4bd7-46f0-bf57-5c227a65a69e@suse.de>
References: <20261102-bug-nvme-remove-ns-async-v1-0-61780fee111c@gmail.com> <20261102-bug-nvme-remove-ns-async-v1-1-61780fee111c@gmail.com> <6e9e6f78-4bd7-46f0-bf57-5c227a65a69e@suse.de>
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

On Mon, 2 Nov 2026 08:26:57 +0100, Hannes Reinecke wrote:
> On 11/2/26 7:14 AM, Qiliang Yuan wrote:
>> nvme_remove_namespaces() removes the namespaces of a controller one
>> after another. Each removal waits for RCU grace periods in
>> del_gendisk() for the namespace and for its multipath head, about
>> 20 ms in all.
>>
> But that isn't changed by calling async_schedule_domain, isn't it?

Right, each removal still waits about 20 ms. What changes is that the
waits overlap. A grace period is system-wide, so removals that wait at
the same time are released by the same grace periods instead of each
needing its own. Disconnect time over tcp, from the table in the
patch:

  namespaces  before              after
           8   170 /  171 ms       85 /  91 ms
          32   628 /  628 ms      294 / 293 ms
          64  1201 / 1308 ms      533 / 550 ms

> Other than that it looks fine.

Thanks for the review.

Qiliang
