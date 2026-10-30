Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793319843;
	b=3jqURfYpJbvkC04nYg7SCLBS8uBEfy9Y1mqCEJfcerFN4qM0+umh1B9FvHwkK+QQyx1H
	 4DfEjF050uCRoFWdNWpOTEdRt1Ad2d4lcilJSt55Z9fKFgTFjy2n7aFci3jd87UuplnVi
	 9UKA2Uj5KczWWyuc1eHduUHGFYndm6MgveXtkCWoc+RXQceNu7MCVRbySdANlONuZxPR9
	 MeMa+ixK67s/rKl8ONaZwHJSbrE2j/YqTh2JvyIkY9m1oVr/gNW1rNUSfaKh1WX2y+roE
	 EKNm41t7YP0XlA3YWGh63tKqJJBw8mzZzLBDAqXeozcOntvTj6pKzwcblPBgu0aae3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793319843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KkjXI6XREDZgMovozjWwMnBiOd6uNUe+5PisGTE2NV0=;
	b=2bRyJvBWC+oWJ2wRUGPzJOUPJnesa+HQq5eOGOz5+AOPPm/O4zsVspLndDTz+FjwG21j
	 mdo2XV7/1KpPCG8ZdBa+3frxxLzWMdR1imPZf+t91WUMKlcUQ9jx9+Jt9pVEOx5Ha6mxD
	 HZLRnDRKhZn9A/rM+MxNQ+4aGAS+ZwIgZOpe/VAR0itWhlUN8NiYfr28zJ1Q6jUHZKEBk
	 MhKFLk6FxO8yj0rTE5FwJMiONKEecKuM9I2TkRirYibCbC60o1zKx3qMtodwum69wndIq
	 /lcm4vYZUdoGz/jPUPB5k4pcZZ8DKu2eW0loa4KvscB124wh0IQNsGzMIMWBtxPmtVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=fepJCQ+g;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D898606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D898606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=fepJCQ+g
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso297096eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1793319842; x=1793924642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkjXI6XREDZgMovozjWwMnBiOd6uNUe+5PisGTE2NV0=;
        b=fepJCQ+gqlT0HyBElz7OVjk3QQmv0GPv5GYS8oH29ml1mT0SpKH8HwChSXag30WKxK
         iRimiOCgYS4l7xp0AMdYebg38Szg9+B7lswlzycBjqn2ocxcjLFPf5RP6TX/8GMkAJFs
         xyNdo+/cYnoxVPquuRFBqbf2L/FZBD3Aju/Gh4JAk07YWRbIBVGtBqPlQrRMi2+gmfsa
         5kw0KycMWUl2LXvDkWGVwXTGe3Vq7nasZ0uX+TR/E0CsA1k9YZoLzzyh5v9y0A/h1Ghp
         xqrjK1Il0GnyBGldC+hphae2udyO6X6GhxX/VJX/aEdmc2r4oOwqxQwl3WjB3DO16Zyx
         DCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793319842; x=1793924642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkjXI6XREDZgMovozjWwMnBiOd6uNUe+5PisGTE2NV0=;
        b=x0ICUkegJkUemXaaInnGGDTUU3T8BI0PT0b+cu1RwVMv4oI1Cbm3KmldLt+QYUgtq2
         aBJ5NVO4J/yN96nUwRT2EUl9M1JKi+pwaT47kQEO+L9GId2sMb+ZUAquH/007zYuSJAp
         ozR+GU0SxIpXUIhyYgr4EPqFM6k6DOIqyCOVpjgGxUFRTRuB+shJk+q0IgAGfNqBAb21
         nZpxuvdF8Y+z74uC+olWVFUFq8hkkkzhcSD2gXwVJQbt6UyfSr6+Oei/CmLdqp6ryKaV
         trjHRchnbUTopZjHHFzt2/8hb6nJYzIsBQk91vDBRDMq4AApQQv8iQqhqYvC9UlaBRI/
         rIyg==
X-Forwarded-Encrypted: i=1; AKwUvBwFsdvqSYpMuX9ahQFZEITDO2wHyMQQSg2fmKOFJQTd6jupgaJMOMZMMcet6hqBQ9B+7+ajBL8F6z/7MAs=@vger.kernel.org
X-Gm-Message-State: AFq9FYImNXGZTjPOHhiX9gLZ2v+YWMaO+ln/E+U9N7T3viQGroQgyGZ6
	R1FcG3qLj1QvdIDI9lX9or+552fmT+OK/SNRMjVhDhb5ldk06yF5/wUFnVVQK3MylkI=
X-Gm-Gg: AYBFou0gwFMb3JbS/P9J4pHtZSpzzODJVUzUrYsA1JM0jQ7iSbq9sqR+3WdEVwUwWpz
	OF5X6aXidtGffq34vwBSsChx9SfNGtMDHEqYf8YA9oe2lob5wM8iCJCFp5TLfP1RHfjlJ8a1w9/
	S4XEh5KQ2i4QlThmwYqUX6Q/kypvfd5/tl4L40Zh0fInpVdYgQV5m07jTBPOnts7z37/OmJTZ5m
	ne+lfIoFXn3gJeDuhxQL93OsKRCEM0Nw+tsAdIS0LLJdMZu9z/HLgSMOsK/h8bBa80hxMuwSdS2
	PmNVdtnjKgIPbLjKg7sqYt2c3ojpat6lTTxkny+nh4aYnzRT2/rFwDYkzmtvBFBoKmQW2hJlbhx
	a8/uk43DdPxpiRRvoET1Jf9DQui/54ipE6YT3kHlXfLBjhXB0VAHx5Fwhv6MJEN6cOtV0CjvMNP
	5o74joFSkup7R2nBO3bRwj923ZqImxHsUTTgKEkZiEcq6cXfogj/KRMtef5DlbGf6pBLcVR/3oV
	C7QsBwbD0VGu+AtCDE+Rvo3jyWKwhM/Pqb/GKH+TobB5IABQrTpJyqejON0PLnrU9Jaux+Zj6P0
	3RTS3nrMe+M8bw71TI/BnRevFR6B7/oqNWmMXV+p247/hQeOCp3ON3/0GcJlUU83COpa4sYzUaa
	TFBRhfaKlisKnqkijbxnB
X-Received: by 2002:a05:693c:83cf:10b0:36a:1427:3933 with SMTP id 5a478bee46e88-36a4236e7bemr1488656eec.16.1793319841432;
        Thu, 29 Oct 2026 17:24:01 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([67.208.231.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm2241458eec.26.2026.10.29.17.23.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 17:24:00 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: linux-nvme@lists.infradead.org
Cc: Saravanan D <saravanand@crusoe.ai>,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	dwagner@suse.de,
	sgogte@purestorage.com,
	hare@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai,
	bchen@crusoe.ai,
	shinichiro.kawasaki@wdc.com
Subject: Re: [PATCH v6 0/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Thu, 29 Oct 2026 17:23:40 -0700
Message-ID: <20261030002344.92839-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023230426.6425-1-saravanand@crusoe.ai>
References: <20261023230426.6425-1-saravanand@crusoe.ai>
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

A short status update on v6. The Sashiko review of v6 came back without
findings [1], and Shin'ichiro confirmed that the blktests case nvme/075
passes with the series applied [2]. The blktests patch linked v5 by
mistake, the version under review is this v6 thread.

[1] https://sashiko.dev/#/patchset/20261023230426.6425-1-saravanand%40crusoe.ai
[2] https://lore.kernel.org/linux-nvme/auMw5Gxg6toa8GD2@shinmob/

Thanks,
Saravanan D.
