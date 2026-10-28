Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185974;
	b=PIe2pTSENlv12C27z/XRExMtRQvcRyadEatsic6f6u9FvGdfEHvp3smQhaZ4IhPQRxy7
	 0vEdXwBAKk6V22E2bZ2/x8vFqn+W2OeiXBhZRQuMF7tcdOUCn1N0ZFGCz0N/C7BZQUVCj
	 dJx4AeRm2JhFnnee9Vytf5KDEGdx3Af2J3C3quuITsoppPeZolec+//Txytq7hjgKlaMS
	 7DyJTA0Ak6U1tehFNQImXL+BwxEXO+mhDlsNiNR9wUWAINltvB17YI/yoV/Kxh6KL2j7/
	 4AI4yZFSbeI7cFqWvUOg5oEFtUNGlLL24b/RmoeJRukuyQtJBV5EgRPpOW+T3dud5Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=C6b3HlHSh45GSMrApP2ePO11fAuQf3Nps6CKLurWryM=;
	b=IcFup7oCerhp9awj+DQWngEvsa62jT8N3PJ3txpib54HIYC94WBYRYlbmfIMWeiHIKKV
	 fwshMqZ/rpSnyJS/DWq30r8aKq3K5MPb3Z6weMWEPJRyr1WHFQokHDaH0EdsKR/bPEGo0
	 +85eGiNKdGXe0S0IHv/PoifqyDPvm2TIahsGpq5pLIaS8SmgLf2tb/nc9iUK5jLvEwW2S
	 l0q1v8nMw2shk+eJx/oV6475i0ijpwucIz2rzHdGJh8JKEzbkrF6nxrVlGtiPuPv1wzOj
	 CJt1avCkZxHZyKvZjqcW/IRHMuqGJAJmP20iRB1uuQTeEtCzI+ZTtAj+8nww5Y+cXBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mrHL+Kfs;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EF5606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03EF5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mrHL+Kfs
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1264993f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793185972; x=1793790772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6b3HlHSh45GSMrApP2ePO11fAuQf3Nps6CKLurWryM=;
        b=mrHL+KfsejggAaHGvD+6Y4am7FVYgEA8QRAj3U8yYM6XBJVnHAoMeNtjDsqQPqKDrF
         ToT8mafFA3pJm727IHetAOFYa/RSvRopSfnPAEa6f2rk6fnNU2hC4NsFG6SstNWlB4Mh
         NlYD3zqoiW4jyupHCckItRNKrT+uhb7BP9ae4+rKHuzhggS5g8i9nbrS+gHu/T9y2mp3
         uwusnh98YiZggtXXZvycRmCtZvNfKqMqv+qM5+l0CC0GjQDnKLqfm9BwOon8LZfXP3Fh
         dnezqOE2p6YqupWQ51u/nMriNMjckDJZpoVwhZ9k8N0qH5aNTxwMDrAqtPs3jT3iqGhx
         mz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185972; x=1793790772;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6b3HlHSh45GSMrApP2ePO11fAuQf3Nps6CKLurWryM=;
        b=THtzCJwbRjnv6MnD5oW8dnSgI9exX8rPYEwPLlhPgqI6edlB7lt5F2gWdaQMpHdmjo
         G0sYs5PLzwIX7EeXh/40kzG0/o43S/zlPgLPcXbftJjhATbLlr4rQ3JZ7bJaKQjayuMO
         6Xfd4To5a7zJHbmMtQmXc5UNmZ6UWm0cAEr7kuO29Ze4GdX+KLIjuvzG89bQJ0RADM5g
         vnDV2SOHRwm9RHBtpqqNCCTIuU9P1nXj+EGxnhtTI76wppRRe5n6cdku8mvv1+ySLlf+
         oJD9RTAH050M/y1LC5DMDWATbgIbd9GHwwHj9QwVnbRZtnc2GPT/V1Dbflkhf3sUFgg2
         gaEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzditX5sxQzMRNyzQK5POu4PzjbwaNzYXd/Umei8wzeFlNBWkdf0Bsk2ovxwXS3tOGJJ+bwHFTQx/G1xu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7OTcClfanHH/dxl27Z35WNV28fUOng24uPOIJPrfZV9VYmKb7
	lN+0ufqjEhbrWlCgjjf0+bNSR16Ts1GT76w3oLml0WhhCQc0iO9ybJUqKc9AW0MZyPITFewt4AZ
	w7Qcq
X-Gm-Gg: AYBFou20BfQ868APF6WjsXFQnEG4X/m33zFLHXcMiOpDLl907sAVIvF88AELCxp6pZJ
	AOn1U+Q7pHrdvOnxSX3/AnynU9otZVxFzspF+I2H1I79YZJjNBqJZld2Zxd4PHUp8JG0xv62Uzi
	Ly7f9RQDW0UbIb/Wiw7w6Oa6dwOdAbZ58XyU1dY43gyRLKV/eKEuxCxD3mq1UgEaiwRAsoHHcMl
	hUdyR/0VrNe1ZQm2WAc/tjESxJmlQAJX/iaETBGzadprZaYm/RQTBnZMsJK0jNmY/Xyg3L0F/B6
	O/E3pSIj46mNrG8UgGqL/S6aSEg0XIMs668DFnA/XCPAypHa0GwmlrALXe/Iz9nPFibn5TSj7fG
	FOsRfYGrLY6t2DiJHQkTPJeZGJWqUcYzg4R4h5aVx7zy2G4lgalBxDg4rQr270wtJYZf8t1cvTH
	IiBmmL00umy13ZXqoVt9DRCBoClyofLtrh2+8wpCqqknCtd14S0rwG2ba9Bu3L9i7TUlmsEpW87
	AucpCuDu5ei3EX6mu1V8HSrI/f+Ad6/Gs86iFvlun/jkvj/FGafuUu1HICkJV6aNkKjTPLX45Jn
	QF31h/xkgAg7Dz6DKu6K0nWDnnMtiePeyud+JNo=
X-Received: by 2002:a05:600c:83c4:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a996f75149mr33002735e9.10.1793185972152;
        Wed, 28 Oct 2026 04:12:52 -0700 (PDT)
Received: from ehlo.thunderbird.net ([185.253.98.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cfb3da6sm39572075e9.14.2026.10.28.04.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 04:12:51 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:12:50 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Wei Wang <wvw@google.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_1/2=5D_sched/uclamp=3A_Fix_race?=
 =?US-ASCII?Q?_condition_leading_to_imbalanced_uclamp=5Frq?=
In-Reply-To: <20261028105336.GI2668804@noisy.programming.kicks-ass.net>
References: <20261028020512.10245-1-qyousef@layalina.io> <20261028020512.10245-2-qyousef@layalina.io> <20261028105336.GI2668804@noisy.programming.kicks-ass.net>
Message-ID: <D9CDF31B-CEAA-4747-B261-63381F4A2872@layalina.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 28, 2026 10:53:36 AM UTC, Peter Zijlstra <peterz@infradead=2Eorg=
> wrote:
>On Wed, Oct 28, 2026 at 02:05:11AM +0000, Qais Yousef wrote:
>
>> --- a/kernel/sched/idle=2Ec
>> +++ b/kernel/sched/idle=2Ec
>> @@ -502,6 +502,23 @@ static void set_next_task_idle(struct rq *rq, stru=
ct task_struct *next, enum snt
>>  	 * lost_idle_time of clock_pelt
>>  	 */
>>  	update_idle_rq_clock_pelt(rq);
>> +
>> +	/*
>> +	 * Due to a race condition when enabling sched_uclamp_used static key=
,
>> +	 * we can end up with imbalance where uclamp_rq_inc_id() has happened
>> +	 * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't see=
n
>> +	 * the static key flipped=2E The race condition is unlikely, but ensu=
re
>> +	 * the uclamp_rq() state is set properly on each entry to idle=2E
>> +	 *
>> +	 * The reset will cause the uclamp_max from uclamp_idle_value() to be
>> +	 * lost=2E Since we are imbalanced, hard to know what is right=2E So =
just
>> +	 * cleanup=2E This should be a transient error state once we recover
>> +	 * everything should work as expected=2E
>> +	 */
>> +	if (uclamp_is_used()) {
>> +		if (unlikely(!uclamp_rq_is_idle(rq)))
>> +			init_uclamp_rq(rq);
>> +	}
>>  }
>
>Much nicer! Would you mind terribly if I make that:
>
>	if (unlikely(uclamp_is_used() && !uclamp_rq_is_idle(rq)))
>		init_uclamp_rq(rq);
>
>?

Not at all, it just evolved organically :)

Thanks!

--
Qais Yousef
