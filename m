Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793844592;
	b=PYdwYDPCLzShrch/Q6jW4gz3LJ0bDQcuppBLEgYMW1PdCL5URytDWbRmLX+pO4hQccWf
	 WmNBwjJuwRIIvyt+eintj1e0rwVmeqzgBhgCB1/4C71I+ecJHcPbh9gQH+5fikHJbfS13
	 FICVuhtyIAtTeKT86DbZCXKxi95japztJ43bxrz79jGPe05uVTtZ3MoechkBLYTjHvfDs
	 Y/PaE/vi5ZBhNC83Zf9XQO+8i7ARaEG210hjmghqkVGz4tTyD9gTI6lFop9dVUMCbbPCb
	 w24Hgjmf3gq5iMfPoh5Nez9zYHyHpbeDFKRpOV10Bft2lMzFn7DIXmy2Gg3mlvm/lPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QM0rqoR6TQ58XbCJMdcNU5VHlh8KBEoq/5kBhNjxofc=;
	b=LUM+wIIcBjAFvYTdI3fycWzPj7+GjwbJqUwVM5v6D39JWzE/ZT8jdPgJB5MiutuywxgL
	 P7hi7HfzdLJgbG0qXw4D9kSkpSg35IliDzrTri/B/wtaj43MK090ds/Sj3GSjlVdz9GKU
	 GTROaPP2B/nBQL5HM0Ec2/WOSq4ZhUcnsZimfEcU0K+kRsvFJJ7sx23DiRBLJGnKphI9C
	 VvyrEeyqJpR7GF8JsEfh1mhgj0EsrdbQuVk8bNWUNyqrsTqm3LKOPZ9shZIhov3ZDvTSH
	 gz5Z8FFrFZF4Q5DPIUh/moKKA0yJdk5/o7jVzccBM34l7KEEnSCqRj6vD9sqJ7pBIjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DxuLsby3;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D97606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D97606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DxuLsby3
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36661f953e4so1899305eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793844591; x=1794449391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QM0rqoR6TQ58XbCJMdcNU5VHlh8KBEoq/5kBhNjxofc=;
        b=DxuLsby3907SeCgJyDfsbvUyOXMUgxEgCBV5FRQ8BUgxz6S22WV45NryMtWseE/dpU
         sTO0+loltyFMAq8K2ZyHk9DEdMBv6TCwD/CCXK674v2QpujnLk6vXzbAtNNW7XhwBAKz
         s4HSRHr31VchGGM4KxHKI0Mz6J6gQW97JlhNvnDWUCAgUzsG9pr90/JBbtpzpA0heeZr
         h18ErhlRxD3KFO+actCD56g7O5HLVMfjVqy6JRI/pkDkl8FtfSi9m57r46R0J7fkVXHX
         ztCZ8v+Vp7Er978v+jlamn2fn9oczoenJcTndwNQg5TMjKZ8ul87Q6s2DW8vvmoshtZo
         hS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793844591; x=1794449391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QM0rqoR6TQ58XbCJMdcNU5VHlh8KBEoq/5kBhNjxofc=;
        b=xxUv17Q8/iW/afs3VMOYT/TGPUqpDPVR1tKHUQC84yQwzFY0qAoFRNAYG86N08g4Hi
         Vhu8LHMpMqPZGPsZcagUWN7YWj8HZCamq9221r3RRVRzJFvrHtn2ZamOIhgoFbEvJMHC
         Im/OWOfIXMg37gChYnSFLdMgP21p2VyUzzZrYkTafPn3BH1wu8g8RM2BPiBHW/Y0du39
         ZGMzDCh7CEpmeylEJhKpbEQiLXNjytewXBX9hIpGiC8f7LjenD8mK6qn9HVG/ki8cKxk
         tiN9BhRYkBYHgH8C3BKGr9qYComQYelz1D0UQQm62bhvzD3WzEu9zjoWmkTTiiMeJjSH
         2Wbg==
X-Forwarded-Encrypted: i=1; AKwUvBwqA66uFJERVXA1tqwCBbc2c1YUoDyBSsKphMRujGdkvucoKia25KTKT0R+IS/0eXPZlatm1vbGdqEuZg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MGpDPR3L721DUVaN1mSbi17dFiyggDzs0N66ef6u4CHAqoprI
	UX0GDJ+fdPgLrO6VmUyO8HThCNhdBzwqazYUjbndld1v51kdF7K4stq4HK0lUqNU
X-Gm-Gg: AYBFou3+u9Gj38U3k7x7VOdlCkSoou8f09aO/X1jAvxCFYFMC1xd0JpvmlntUNGRkzT
	kyZcYh8wamWl2foHvtg/JNui4ITEjLjKEojUUyrrf3nG6PsA+x5doDrQjJJIdTCqP50oYZ/NFV+
	sYqU495kMKmRH9JOQWrVa8hFGkbd9PfZDERPVm4a5zghbYQWiUiIUqP20Yc6oYP8/RFhcbhLBnR
	X0t+W46337HS5ViEk9U9MBqM6znbGWpgTqzJu0af0AxwWAqWzcxOlUF001Q5V9YwkiZlHAPAGKW
	fZ+h08FJ9rIiQ6zXTKFu4dX8uuBVgZpfrkihL07okEgFLJVmf57DfD66hOi+vzW7dynRxw+3r1I
	YKSqm47zd6+UOdSbyNqTZc7fhTe7oEj3ocGo3t6sOOyd9Kn3N61UEEvHl/baWCxgp5xMPVjxcV6
	YH8Y3tWs2EbFUA8KwT6IVVbTZOGs4uMirOUEmf+x9QdYQ6OoMnIWmDgq2HkAdjLj8h7fN29zhjX
	cZrPzLxN77BiMTU9XPCs/7ZHLZF+RIcFYOy0iazkFdsce5Hz/fQHpXqoxtZTR0NySL/o5fssxPM
	XsGylAhqFwpNZJtJT/dmNTbbvsM6koV1gz86OnVxnybpQQ==
X-Received: by 2002:a05:7300:c387:b0:36d:c2a:7964 with SMTP id 5a478bee46e88-36d0c2a7ae7mr4540508eec.21.1793844591036;
        Wed, 04 Nov 2026 18:09:51 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36d34d5960esm10630389eec.5.2026.11.04.18.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 18:09:50 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Avraham Stern <avraham.stern@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	Zhan Xusheng <zhanxusheng1024@gmail.com>
Subject: Re: [PATCH v3 0/2] wifi: iwlwifi: Fix GP2 to nanoseconds overflow on 32-bit
Date: Thu,  5 Nov 2026 10:09:45 +0800
Message-ID: <20261105020945.2683535-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012050516.3803074-1-zhanxusheng@xiaomi.com>
References: <20261012050516.3803074-1-zhanxusheng@xiaomi.com>
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

Hi Miri,

Gentle ping on this series. Both patches still apply to v7.4-rc1, and
the six multiplications are unchanged there.

One correction to 2/2: the mld/rx.c site came in later than the
sub-driver itself, so 2/2 should also carry

Fixes: f1699ad5857d ("wifi: iwlwifi: mld: add debugfs for using ptp clock time for monitor interface")

I can send a v4 with that if you prefer.

Thanks,
Zhan Xusheng
