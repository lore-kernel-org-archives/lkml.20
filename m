Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08791289E13
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330277; cv=none; b=gJp6j3CugWfZiysdhR1pkRKEBXbtlSy2Xi7+4dYnW5BVSn7+ueR0paRag/C6h63RSWUGGe6LaRY3LiA7L3ZpQ+a+MXw4OaLDiMfQLX23FjjgDPFoZFD7cpbPqTOQep08wvaJfaN9ZOH75p2TGd2kezx1IvWylmffSbk29Ec7HRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330277; c=relaxed/simple;
	bh=yrhr596mnK2dbjRLnW2TpPyTsU+lz2ODEABE+FOq7JI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZKWq1YmSowrMZjhSijru+ebKTBHq9FHRpJtyR3hxLgKmb7mRBMSt16xHyXTyapZ8tEJkmYKsb+FRVLTOss/++Hf6OoYE5yIaTQTwGV4HOokdTbWS+n+bpXSjstKKFq8xv2MbP/KLMhjc2KMbEcnd5NO4zEa+reWbE9zXtevZO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=KWEnilLG; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="KWEnilLG"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848643382fcso767443b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1788330275; x=1788935075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yrhr596mnK2dbjRLnW2TpPyTsU+lz2ODEABE+FOq7JI=;
        b=KWEnilLGqw3C/QmWLtnyU+91bynk3SUfKVKWqysuvvc9ZWOfVuuXPBbHUcZGxcf/zh
         I8l0q9kmTXI/VR9lyRvhSuQKkbkbs3qXX+KD+w+b3K4i7qxP5hcuHcSSyV1xCyJc9zIK
         yV8e41rmldj6DgQL8Yb5Cbvd3Dj8IhSSNBE7tNP2tytv5yJgxKY/dVarO/2JEa/ZLX4p
         Of07H8KuqTmimTSEzjdymEqT6SHMMT+n+gs3vO2B95fslGnEzzMDq0C98EcAPCYd+3V5
         7yTq00w2kdQeUk5ul4qayBRL1aqZt6ZqsILVTde7AHBYwlmPKbB+HZD3s40iwIWbRViN
         2zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330275; x=1788935075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yrhr596mnK2dbjRLnW2TpPyTsU+lz2ODEABE+FOq7JI=;
        b=Tis60+HqvuWW74z1Bggs/PJ92tnsDrgSyeZQsMZEW7D4YFWIVN0hB5CR7AboFKYLGb
         FwMbyRBfx4VUH2Rko360Ufj+k1al8kE3I6Kwnbwm3y1TdspcVrm0T36dEIXUlYg0f11M
         fn3+xl33BEyX2/6BQwL2IfzP13IDkliailaYhRJlmFalHhC9NJGcqGBMnsdD1jTQ4WFc
         hFxi5coyyVk3dNmMfEqVOQcjO/ETARf84q1zX925hmhY8B4uSQUbMRVU+E3NFPEA9hbs
         fKPHM9i1ScDU5xaFFRipAo+r7OTiF6WIwddDFTK1ubz/cGqoWS8wyFjvE4L1UE463XB3
         7rwg==
X-Forwarded-Encrypted: i=1; AHgh+RrVfZVxshrnVTJaqYNIHEJZoX5D7s6B6Lt5aideKxfAjtx08bmxmd7w0cZLSiU0KCTnsvP11MFKg1GL044=@vger.kernel.org
X-Gm-Message-State: AFuF++l/mKrulmYK7vEpGbi7AHOiGa/cu39JZ4l+8m1GLA73zzyzvnKk
	A9ydp2oHjkCQbN+J4zSFq6Ch0ee3MGkPvcWdD57bUdoahWPtnAb8u7C7gPJpzFXztsE=
X-Gm-Gg: AR+sD12JvLxW8H8J7Ri1a1dj6YY8R6NyfVevvoD4EirhSzKwqaMZTXYg5m0OKIlercK
	qXvuo3phF3cXFkeVxZ1qNdcv2P1fx7aTdQgOmKmbhpiYpVNapGfC/JV8QIHC8Ccy5LhulQibZ1J
	6XaOPrzZwsBga67hcNaainlrIOlLtw1klmeARfNH+vRs0TeQ++/4fBhbasl2p68gv4NKfzqy5vL
	faiD7DvwP65JEnri/oF8nQqye3Rti3yL1QfPGBn3ckfIJUsNEVvI/IlVhagMqejKJl6GgXzsAGc
	3A2DLMvKNH5rm+BDJWqGtbf3vLkrGa+aO8lMbSMChI1C84yPQfVcyUvWe+IhOc8oZTnTRwUsLG4
	vS5mmSbMrfsz6blXkEf+ycbNv4491Av51cCSXY/t5heqD8OzZwCtqf2dK8yPOtNlhQ1DFhDjmRi
	ciGjYlfnbMAW5k3mnLqXIJ2KZrB4jobnohE9Y234pY8rn995amd/tLB4SBAoB711HnVBHLuxgY6
	c3V1nBUPBE6aJa7EotU3A/6JDY+oKDuJhigUMEEDg+i0M4n/MFaNQ==
X-Received: by 2002:a05:6a20:2cf:b0:3bf:b182:94e with SMTP id adf61e73a8af0-3d9acb3e963mr4580612637.5.1788330275276;
        Tue, 01 Sep 2026 23:24:35 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([2601:647:4380:3400:3036:5ac8:3cef:cf51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f7d77sm3390670eec.12.2026.09.01.23.24.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 23:24:34 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Saravanan D <saravanand@crusoe.ai>,
	linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org,
	Nilay Shroff <nilay@linux.ibm.com>,
	Daniel Wagner <dwagner@suse.de>
Subject: Re: [PATCH v2] nvme-tcp: pin io_cpu to submitter cpu
Date: Tue,  1 Sep 2026 23:24:28 -0700
Message-ID: <20260902062431.61412-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <1d56144d-6987-40c1-ac02-b15333db121e@grimberg.me>
References: <20260820083634.71689-1-saravanand@crusoe.ai> <20260823174348.40236-1-saravanand@crusoe.ai> <1d56144d-6987-40c1-ac02-b15333db121e@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 01:30:08 +0300 Sagi Grimberg <sagi@grimberg.me> wrote:
> I just think that the adoption approach has downsides in many other
> workloads. I wouldn't categorize your use-case as the common use-case.
> Not to say that it shouldn't be solved.

Adoption in v2 is opt in per controller through the io_cpu_adopt
connect option, so every workload that does not enable it
keeps today's behavior unchanged. The downsides would only be borne by
deployments that choose it. I concur with the broader point. Adoption
makes the driver itself decide where socket work belongs, through a
fixed rule that cannot fit every deployment, while a writable io_cpu
is very flexible and leaves the decision to the control plane.

> I agree with you that queue io_cpu selection at connection time is too
> limiting. Perhaps we can have each nvme-tcp queue expose a sysfs entry
> to set the io_cpu?
>
> Something like:
> echo $CPU > /sys/class/nvme/nvme0/tcp_queues/$QUEUE/io_cpu
>
> I am just trying to think of a way that will allow some control plane
> to set it exactly as it wants, without the guessing part...

The per queue sysfs io_cpu works for us, and in one respect it works
better than a connect option because a sysfs attribute can be set after
the fact on any existing connection. The control plane already knows each
VM's cpuset and can read the queue to cpu grouping from mq/*/cpu_list,
so it can nail the socket work placement.

Two questions before I spin the next version around this.

1. On reconnect the queues come back with the connect time io_cpu, so
the control plane has to notice and reapply its placement. Is relying
on the existing nvme udev events for controller state the intended
signal, or would you want a dedicated notification ?

2. What should the write path enforce ? I would validate the cpu is
online, rebalance the nvme_tcp_cpu_queues accounting, and let the new
value take effect from the next queued io_work. I intend to restrict the
value to the queue's map group.

If this direction sounds right I will drop the adoption heuristic and
send the next version v3 exposing each queue's io_cpu as a writeable
sysfs attribute.

Thanks,
Saravanan D.
