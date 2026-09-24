Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CD3401A18
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231729; cv=none; b=Ta6OeFcIdu2xJtae4Jw7o+upEiwn5w5TH5sdkEH6qbns2hagSxBU2StAJ2eu5yWmHmR18B3heX0nQWVxtKUGvxfbqwwkADKBjV7SwcdUeJwRYlJmHfcaIIfmyAMfpI6x2dMDy/GNcqjqZKJnpyyHPHANd/sfmmz7v5XyN1wwI5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231729; c=relaxed/simple;
	bh=tJPZ6HTxNtNeAlRQ89jXZdruOuXjbaVPhr0XhYWbXqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aHs4lwg5o+budELkSxYPCB7pjjQXSIKYiPBby2wgxezDNEaLWi7PQRJBUrBWyk5FVPLhxURx66wWk+rCDrPGkM7kQ9RBGx3yAc85n19XuI7qQpMRwKFu+58AIAGY1nTsQgMIeg9183/x5933JbaLVny/h/ti2+nKEH8mx3Y31Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=LCxbR2iD; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="LCxbR2iD"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so1239817eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1790231727; x=1790836527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJPZ6HTxNtNeAlRQ89jXZdruOuXjbaVPhr0XhYWbXqI=;
        b=LCxbR2iDFF7l86qqVwIYlN9C4X6N+cUtgPm44NmKh6JiUiDST5egGksM3aEq+Tzx9P
         hXiNcOhB9zTRSLu0/9zY6PlOML1d3idRaSWy+Mm328umXA/hX9rcY7gQ7nKUo+S9nSqD
         7bcosLuKnhpIegFnujUpl0vZKSd0urtok2KnlwvZiVgUjhXLrY6jxpt4mrAXwbqCwtzy
         77lLNKlQGgwDTOVCErRepkkW+eeARBrcgWrLsGWvtPZT012rlkt7QC2REN/GnSg21U1t
         b7f8hIS2Vg4SEpYOrAdhqNyIfsj+1EgkNctgadmuVqBKhf2z2b1J3BO6dD+3MTtpx25Z
         BYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790231727; x=1790836527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJPZ6HTxNtNeAlRQ89jXZdruOuXjbaVPhr0XhYWbXqI=;
        b=UL3r1PZPaukjJz2vbZnKTGL0V/OOyHjrSL9QLMWJbiCCTueBbYI0w8NcL76JcjT3/f
         KAqnx+u0U8Xt926huAvUPmYk9xvHmvttKojc8i6oyDz++oiMby5Atj1FJ3uzRGjzQyNd
         HIgb05JTfluOzjirG9xD52g1EZqGZg/c75v3QSlHR3CRB9kE7S1HUMd2exY+36KmJyyS
         odUE/Lr28Itmd/ayK9iWi3b0vkRuIvCAbRIIr053bwv0dgIpBSHCzTDZKrSNGmSOd11F
         SXEPKfoyTEz6K0S8ad9l7lqAt0j35YiNs4dWKabibIDAI8taRlimCbZTAUQeQzcwfXll
         ID/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzz2v4VS4o2T9TM82gsYPaPx09wgB7m3/JscdXp2Hnp0lnbLSTBXYIa4mvco/Z0kmY45RVGW/ZoX+1xIzs=@vger.kernel.org
X-Gm-Message-State: AFuF++lqtl4ro3ZityRHPvMYYKr2xqu1iwMMsEYiIMPcR6RX35ew3mc8
	0Y+itRrfbmz4sv5bdMF16327zRGhSHzkyshFfcfHAiyYKCzKYwDdhF0WmJm/P3b2nv5pcsjoFAy
	wDhy7Rio=
X-Gm-Gg: AYBFou0El0CTm6kj0PE5QDhT7LL9LBShZ02J9njfGxMbwmzmnnjBUHDr2qnFfMqpU3c
	k2CYZjOcyTS9+rIeyUsX1djU1yuyuVSEAi0TehUqQH5ZoJPZdm44vuCC881Pq54zaNjcgYChsMJ
	K1CGji+Gc5/wUWN+tqn+rP6LgfiyUucf9FikvYbH7RRAXUyvb8JRwXNh9To/Jr0HC9raF4vJYBM
	f1dGrA1LcJp+YaQsxJgJ0bAo2x1nOkfZ2WjemhGPfCS1dsYUrMQTdEXegwAubXLsebq+ZdIOABx
	OgPLxKVvQ+/fhVlCJ4FbC4/oGBhUURn5MdnCUlF+vRUvaSjeQtR0KJLhQkGCdraWH+3TLP5yjXL
	PUZsHrkWVMgj9smFPT+pEqgZgxiN4rTgJd38uzewBjA5u9GSKd1R0oMWGhWIYcSrWxTroVz+s4O
	Whqtl4jVxxxZS4wvzZwxFt5gC896LsG5wbrseRpXMENNGqeahh+HE0hu6xHgTx+UfVzaNNAr0hE
	TxTp35PmP1tZBrH9YBwNizEWJKai4IdHKCoR1bL3sE+O1F3
X-Received: by 2002:a05:7301:7bc9:b0:33b:e77f:8a3c with SMTP id 5a478bee46e88-34000d3600amr1526565eec.33.1790231727245;
        Wed, 23 Sep 2026 23:35:27 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([2601:645:c68a:b830:3831:92c7:8375:9edb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7d003sm10291658eec.9.2026.09.23.23.35.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 23:35:26 -0700 (PDT)
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
Date: Wed, 23 Sep 2026 23:35:24 -0700
Message-ID: <20260924063524.26807-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <arR3zlpx3Xm2mRt-@kbusch-mbp>
References: <20260923004959.88440-1-kiyer@crusoe.ai> <arRJLL4ki-sVQnHf@kbusch-mbp> <20260923225753.49224-1-kiyer@crusoe.ai> <arR3zlpx3Xm2mRt-@kbusch-mbp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/23/26 6:07 PM, Keith Busch wrote:
> I get that failfast is at the controller scope, but that seems okay:
> when the transport is down, every namespace behind that controller is
> equally without a path. When the controller is live, the per-namespace
> inaccessible case is handled separately by the ANA state, so namespace
> heads that lose access bail and the rest can carry on.
>
> Is your intention to have some namespaces wait for reconnect longer than
> others?

Yes, exactly. Some namespaces should keep waiting out the reconnect
while others should stop waiting and fail their parked I/O, decided
by a condition only userspace can see. Here that condition is a
killed process stuck in D state on parked I/O that nothing will ever
consume (for us a SIGKILLed VM the host must reap), and it could be
any consumer known to be gone. Failing that namespace lets the
process exit, while namespaces with live users behind the same
controllers keep queueing and carry on when paths return. A
controller wide timeout cannot separate the two, and there is no
duration to pick up front since the trigger is userspace observing
the event. Reconnect itself is untouched either way. So the kernel
provides the per namespace switch and the decision stays in
userspace.

Thanks,
Krishna
