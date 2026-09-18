Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8FC282F0C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789773503; cv=none; b=VJ/Rd25L6u7EU7hCTG5ZcH3V36WeiB+KTa5TBpi8zf3693fOR7OOziV4eTD0HZK/tb5QMyIQps6x0uRONVjPCwAizkn3c3F0b30Wyw5cGnrzARR3xm4aofKsDXRrQmLk1qmWrpQIOvp6R9IzsVhU3UlvK8VHzYO/K3JEXP3Wvx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789773503; c=relaxed/simple;
	bh=OcqNsRsL0+dU7rzgIhBDO5yZjfscv0UQWa7PlymLARA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wu0ohU/+wVLWbY4PM0qhnxG3XXNDPoHOTogjXtGHTrgHreQ81Jbc2LVR3AQvgnrtUiIFqPzQrVjeVfKbQRNiivoNNxJFoNzxuqQF3+awfR44KWTmXYLp9DoCiDBaRIxN0yaHc2YKsB/vhJJ6Q6YB4zF36T/dyTENIyZ2TxuiS9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=dFGEOgbu; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="dFGEOgbu"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398c066106cso1098430a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1789773501; x=1790378301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dATcnoYMonNxmEj8m95cM7akpILvaBmnE82ibKmB9T0=;
        b=dFGEOgbuYwVJEkcFfPWAZHRsu/0djpgI/WiBDH0DoLvtFNvsMOwbMNbOYYHJrhWiVL
         fiTnEf1d5C6okmOHWl/wq/sdSK3RFp6lg1JNS+yNvV92em4E5+BP+NNg22z28D3az/Gu
         afe0TAPXjemQtqj9kucS0ZeTYMQ8dRlZoEshy4uFOjnxF9+bN16+jW/dLMDcJXh83D0n
         5BY+l1P/hGIsKexqzf8lfrv0Fcoj9vgfX4Y/ITNdYI0whfvY8dEukH1L/s+BD8E569Hi
         +uKXtLPsEY9NUNCHrJ5woqQHL5TMcx0pucWM6IBpNUdkR8Fdj7V3FKPaI2Y8COwMMPLl
         h24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789773501; x=1790378301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dATcnoYMonNxmEj8m95cM7akpILvaBmnE82ibKmB9T0=;
        b=LkO4RRFHAaGV8KNYmokIjiRBwSw9FVTwuTPuZAU25WQe8GoakLI3W6Oqp9qefPCS1M
         oP+f6+CNmJRPLB7CwPE6APqQN6PN+hmv6z4AUjVXq9PVvBDqCenu7NY6wjDUNU0Dfdsb
         rWqKUkLjUdYl1DoTeX+y0kKK+AsSolTLaP/AtjOJDOp/Z/efwH6qdvYXLR0iOiqIXtje
         QguRG5+NDTE3MgpaRNkWJUNuTjtBLzEFv1ZQfF21Ok1a2VHZOVLPHoCGdnaGc7ZILiH/
         bURbecZ+fuMyCLZPjZTx0UUyMQIAZmcsmo2PpmmJuy9y6GU/28ibLALllUjeeMhh0VUG
         zbjA==
X-Forwarded-Encrypted: i=1; AKwUvBxGJOuEKDdBFo4bqFLbQzFC4e5YmtllRDUnw/WTA7No/nW2aYmB/t+YBTBEVoViq2su7y4a2CCT/fTEURc=@vger.kernel.org
X-Gm-Message-State: AFuF++lnwwx/zN5IQSQ4dLoJVd9osRfpreOlNynVriVdnZFgN9Y44P0o
	cxnFq4YLao1qGanDwhSaRL3rn+cDVhQRT9sfMjssKc1Wr20Qn5yEQqZoZiOV2z/x9HE=
X-Gm-Gg: AYBFou2obGC87d9/7LU1D9TSXhdkwr6T8L99dmfeGcvMqbNPwkhM35hLTxCNkXHEGnb
	MJvYSMDOyN89SpiiBenVNLgQsb1s5Zq74xnomqrEy6U1PE5jb3bb7jXlgikv3+CHfOdl7jNZ71e
	1H7t9wn1xcq39DO3dUR8Z1IPdsPHniQFf6GbDQuP6PbSShbVYywFfl0lEImBWxG5ay+8H8rcF5w
	t8lromcjHxQrKtyCeCvk5u7zvX8G8NLbUGTsY5Nn9TZ/f0yzEh/pB7s2en5JZhd2u0vmuSobpz3
	K1BdwvRZJpXQ7jdrYRsXfrlilV/6iHSCi8dAk4+K1HB/qV5k6Jrr+qywXjn981Of9vfli7SP3SI
	X22CBMfOT5yGld8OxHlMXJdm2ljjGLXw5l9zhFmP9TcOX2kdoX536EGWP488ol9xkRiHCSnkUnq
	SYxAuctSkpAT6xteUE0ohLXy9YM5Va1OnhOg6Aygdc2s8s0yOZRyEN23nyD0yApvTL+8Oy1UbBN
	MGlYDMS8bFirRW2yr5PDpFU+GQfRWsp8w==
X-Received: by 2002:a17:90b:3bcb:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39e54eab3e6mr14592787a91.12.1789773501145;
        Fri, 18 Sep 2026 16:18:21 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([4.7.95.218])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55e8954sm2274358c88.14.2026.09.18.16.18.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Sep 2026 16:18:20 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Krishna Iyer <kiyer@crusoe.ai>,
	linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>,
	SeongJae Park <sj@kernel.org>,
	Saravanan D <saravanand@crusoe.ai>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvme-multipath: add fail_if_no_path sysfs attribute
Date: Fri, 18 Sep 2026 16:18:18 -0700
Message-ID: <20260918231818.42832-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <7b9e6dc8-6d44-4bfa-9c3c-9e51a5ba643f@linux.ibm.com>
References: <20260917231647.79956-1-kiyer@crusoe.ai> <7b9e6dc8-6d44-4bfa-9c3c-9e51a5ba643f@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/18/26 1:58 AM, Nilay Shroff wrote:
>>   		switch (nvme_ctrl_state(ns->ctrl)) {
>>   		case NVME_CTRL_LIVE:
>> +			if (fail_if_no_path &&
>> +			    (ns->ana_state == NVME_ANA_INACCESSIBLE ||
>> +			     ns->ana_state == NVME_ANA_PERSISTENT_LOSS))
>> +				continue;
> I think we have helper nvme_state_is_live() which could be used here.

Will use it in v3. One note: !nvme_state_is_live() alone would also
cover NVME_ANA_CHANGE, which v2 deliberately keeps queueing since it
is transient and bounded by ANATT. So I'll keep an explicit
NVME_ANA_CHANGE check alongside the helper:

		if (fail_if_no_path &&
		    !nvme_state_is_live(ns->ana_state) &&
		    ns->ana_state != NVME_ANA_CHANGE)
			continue;

This also means moving nvme_state_is_live() above
nvme_available_path().

>> +	if (enable)
>> +		set_bit(NVME_NSHEAD_FAIL_IF_NO_PATH, &head->flags);
>> +	else
>> +		clear_bit(NVME_NSHEAD_FAIL_IF_NO_PATH, &head->flags);
> If the user stores the same value as the current setting, we could
> return immediately instead of waiting for synchronize_srcu() and
> scheduling the requeue work.

Good point, will fix in v3 using test_and_set_bit()/
test_and_clear_bit() and returning early when the value is unchanged.

> Otherwise changes look good.

Thanks for the review! I'll send v3 addressing both in the next few
days.

Thanks,
Krishna
