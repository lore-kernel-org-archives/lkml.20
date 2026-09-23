Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A6A372ECB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790204277; cv=none; b=K9OG/O6wyHTS4XCf48+2V4eUeKtaKS7cgU3nfKGnEGgp9bVQPrs5DsJR3ScN7N7ie0igm2kwtC8prBTan8MliVHtqUBq3zsOQbSgFU7oqvFS3NPlfaYCWWV5XmFMcZGkiu4B+srSrarI1+v6ewrI6nCXpmYqahKof4kXsyax6Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790204277; c=relaxed/simple;
	bh=R2AFbu6PkunSu3wRLU/rJSEJuyRo49aEee30ieQcmVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h4FC1qfvDWB8YEDjKvBIKztCLdklyxjYIEtHskfrp+HBBakjMtu9dklVQtsWAJya6QMp/sxnugO3VBI73mR5IgsMJ91M5wKvPGLHLOYkl78XmyfAwJYnIybTFnEUEEFK2xc96AZYY3XvbYkZZhtt5D5pxL2n5gE1zM4XlPFc+zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=VlIcOVzy; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="VlIcOVzy"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c3735125bso698170eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1790204275; x=1790809075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2AFbu6PkunSu3wRLU/rJSEJuyRo49aEee30ieQcmVQ=;
        b=VlIcOVzyiAb4U7w3kLICTtlQn5GHy7i/Gmd80Suuxc+hFhU+zNSdhZKKeGbnYgRskm
         fhhrkdK4eQ6qnxokQ4Bf4Y8XoHKL1mwFXHmzRZxIxUlbcf0lJQP54YTT3bMzBr8NpEsD
         rMdXOn4himVazGC2U6ld8UQu1AKWJhYJ5JIkPNf5uTAiyv7eh+xPxl+GH9BrOrSFIEGI
         UFcyPzZzFTqP6pne3Fzwuk/iYeP6EuMtlMDjHniYbwQSnW4x96RCobgiyod0S3ZBfMhZ
         CgZ18hPfmEuHRvAsns2s8DXrkWcZwfIPVms3Zpcij6LDfpHESdYAwdajmLen9EEgl2Su
         BgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790204275; x=1790809075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2AFbu6PkunSu3wRLU/rJSEJuyRo49aEee30ieQcmVQ=;
        b=07qzLXaCjjX6LPNkcxpLVF1CQRp5yg39H7uoEL1BJHrEJ7HRhACpD+yv9qRXecL1Gi
         9cRwxkZSbzrhKw98nUkfBri7Py07u0Qb7t/fyZ7cesGuzOPuglICaQMb2WkGrA4d4X9i
         bDJsX1AF136ap2nj//ij/RnXyQwj305+Gmvabr4mSd1v9TagX1iHx0f/xZE6FY+1zoSS
         SXplJktBXHpcA62JWfzd+iGCHjUwPRWNICpNZS0J0fPWZSh+AfeOd1JE1CAkvwABFV0h
         zOjUsvJz4I+1WRzGYgD+AYMYZm1QdwAqogU0St2CYzH9vGCdpvZpxnu5Jw+xDZiu91UO
         pBAg==
X-Forwarded-Encrypted: i=1; AKwUvBwqqBNE/rxv6GUQm1DB6yEeAsn7sHhc4WLRRGNl8iD4ZXwh9mFmaujpu8JYTjHD8H3/YsqmAD2XmTSqO6c=@vger.kernel.org
X-Gm-Message-State: AFuF++mYDuBkzhfQCa2p1AZQ7oilgUq7wHjExZrTdhK6ccmacJA3BNzp
	64qvyRrxPhmATEFr/UWA4XrpnmkoZCmxURbUe0MQaPAywA4EStdbwEjeNAxKNy6Wnq8=
X-Gm-Gg: AYBFou24/tcRfUtHpm1/jp+pYnoikTUH08/qH+g3DIJNIYtfw/oIUAvOyVhNUA5RMsR
	N0QVDCs9kOhYImUb/AyZHXPjTIE0nih2ldvWtEzvan7jvJ1rhZhcJsvY65F89c8I/1EiKumFQb7
	oZvaFjDfZnl0h3Yoa9HpwM7XYFqjElAxY9d1JkkOiElXBC2PrdiqhEye/+24SotJL0LvdBifHoM
	LQpCbhHuqU9ldeu6o5vJXL1uWg+hwY0a5f8IK3+g9KiqlJYaF92ZP615FZN9LqrKw8HNqNqcXKK
	2OXpXJggZexPR4O4wcSfJ4hu6WDZnwcI1NIOFU0kNrqEZfe9pbnF1QJ3baxcEFOgG2BVSTIj1ON
	weYvL6bf93Of4IaUnbPYKrifvDrXE3JRP3B209tpN6AjD3l+JbSJRsN6KX6Sq9nWcrmqDKz6REI
	udpOV7ptKwV0gD6HyA6GGdWRo9TWUWCYQ8UUEXr6eswTOL9KaZbo7yEbNOw/KImqoNy+sSRkfrf
	KnoFtONLapHxZSl8cfSmgUQCavWTzy9u/w=
X-Received: by 2002:a05:7301:c00f:b0:33c:1424:e57c with SMTP id 5a478bee46e88-34000c38310mr496652eec.29.1790204275252;
        Wed, 23 Sep 2026 15:57:55 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([4.7.95.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm8281568eec.2.2026.09.23.15.57.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 15:57:54 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: kbusch@kernel.org
Cc: hare@suse.de,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com,
	sjpark@crusoe.ai,
	saravanand@crusoe.ai
Subject: Re: [PATCH v3] nvme-multipath: add fail_if_no_path sysfs attribute
Date: Wed, 23 Sep 2026 15:57:53 -0700
Message-ID: <20260923225753.49224-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <arRJLL4ki-sVQnHf@kbusch-mbp>
References: <20260923004959.88440-1-kiyer@crusoe.ai> <arRJLL4ki-sVQnHf@kbusch-mbp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/23/26 2:48 PM, Keith Busch wrote:
> I agree with Hannes that we shouldn't need a new flag for this. The
> current behavior is just broken in a few ways.
>
> We just need to restrict queue_if_no_path to only if there really are no
> paths so that we actually respect the failfast_tmo.
>
> And the ANA inaccessible and persistent-loss handling you introduced
> here should just be the default without requiring a flag. But I think
> you need to add a requeue_list kick in nvme_update_ns_ana_state() too in
> case the ANA transition leaves the namespace inaccessible.

Agreed those are real problems, but fixing them still leaves no way
to cover this case. Subsystems commonly expose many volumes as
namespaces behind the same controllers, and failfast is controller
scoped and time based: a timeout fails every namespace or none, and
the trigger here is an event, not a duration one can pick up front,
while sibling namespaces should keep queueing and ride out the
outage. delayed_removal_secs does not apply either: it only governs
the window after the last path is removed (here the controllers still
exist and keep reconnecting), and its expiry removes the head disk,
where this case needs the opposite, fail the parked I/O and keep the
device. fail_if_no_path stays the only namespace scoped way to
release parked I/O.

If the direction sounds right to you, I can send a two patch series:
the default fixes you describe first, the namespace scoped attribute
on top.

Thanks,
Krishna
