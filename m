Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673528;
	b=ub2bfbCzliVOUrlv/wjA60mxL9E8s5lhl97C3KSuoh/PzL4QSt3zstvgfQC8/ylLyYaV
	 wwLmopgWCH4OpCh7+7wuoJsHH3G5Mn1dApFcgaCjkAHT96SUDNxUEY9Irra6zCLyICqQv
	 IwhXzpJafr8DfnO1GDNus/8svnH0ITgoTogCrtY4vazoWubH3TzT4JMpIyga6ylO9aFf8
	 4YiQda8YvPGKrt1uyurZKPU43nA0qyOn4+28fxZmzcqpqe8/pKThis5FHzrmx2exhW3OX
	 oVESv6Qw5bn3GDy3VDY47vKzI/3tgpglGt5UhXxRs6QFKkhOKhFyT1ajz2OzcItmz0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=lXPkYWUZ3Udi9LVDqQlr22wZnWQhsRh3Camx7qJwyCk=;
	b=QB+JSvkUgQG6xB0Un8llp1DVKBShyzn7R9gTyCneYlB1vZyRqiDyeStwWce0uSiFiLYz
	 ta5kF09JNAHAyGGaUCN0i8jDSuop9WbF1ry2VcSXEuS3BUo19B3q7mZPztFdeqqmRRp1s
	 y0CgfnME4TnzdghX9jde7WZ9pPb8Ua9udgKNiGCVpBpcvTSW1NR/Ax21NfG6O1R/WKNiH
	 MBk9bb4waXfDXDirj/VcpiOt3BkCAOOwnrku1DIS6TkWs9d18qS14kUSxro/MTBTqL1+4
	 /QynWtgI4u5Tobyum2g1IHGOtOUkJwvSR2jfhj+QeIpg9PeR7rI/Tq+CrwpURpNJ/3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UwHxAxpw;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8525606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8525606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UwHxAxpw
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2646170eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794673527; x=1795278327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lXPkYWUZ3Udi9LVDqQlr22wZnWQhsRh3Camx7qJwyCk=;
        b=UwHxAxpwSIdnK8weihpuCIPRARd8lIXdmrk4RMTzPo7FqEDIHoCoZ+ISoJ8YfR8l24
         ScqJ12d/FrAQwQMdoUOq6QrqbNGSpeMYLcNTvRX2yx0pjox3FmBLvEKSROIowZijSq62
         xWii4o46mSD1Q1tM7SYtW33WaoEuLtsfdVoJtmTtboA6q72gPrJ/7KZxPCvxQTayNNTs
         dyU8HFDMMBxJeXsK5PP/K3wzsB80QDkuLpbmguyUfgJn5yH2p+70gTZPgE6oCO9IIji4
         FHSpBlSUVNFi/LD3k1oX8BO3ZsRJpXP9bRVkFVnbWz45v1ab8ZtLbmZSnMTNdkWRdC9O
         oyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673527; x=1795278327;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXPkYWUZ3Udi9LVDqQlr22wZnWQhsRh3Camx7qJwyCk=;
        b=SK3WQnR1CnyIozfkZgCEk4/ZXhsrw5XlgJI3YsqgRsSr3BV5VufhyMKzuV0wQwVyQ8
         C+4Swk40dBN8LV1xJebvTM7MDsOTPo7DAp193WJB0HUBFwCZo8T2qzEbqVdXRTCmK/hm
         OjHlxZ+9CNziUSjBXMLqVyQ6hJ/b89v1NWlghK7xBYSSvaRcpdJo4UQWMchq3UbLZKDz
         j4lgnD3NnaTDlSTr0VnVJHysLHdKpTvb/hGsUTQPRykIvzqUzk44+bnF/XYEnmflh5Kd
         YTX9N28J9c6YjyJPKF+ldQXiidxMbCsZcPys6OrBWNnLqvKfTd8Y3QNgOCaqdU7SlgIZ
         bCqw==
X-Forwarded-Encrypted: i=1; AL+hErE/SYOQ60R1cx7rsPkCCYesuziLFcNKR61COqcppyyipSkfY7boNX8sCBnbkwKJL3TrhNsu6y1c/fUfMeY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y+vQa32/cswlia1PMT2B9quzzH+t6LLrcjQ6u4vtARaiKESGN
	lXe8nsZ/exEWm9gXrSbq+L8AHdnZQjcQ3ZoTyCuTwHi03AJiqJGQ22SkdhmQsNv0/HdIvBbmSJT
	9JVp9EEI=
X-Gm-Gg: AYBFou2omnwN4HjF2vlHEkcwmEIFZgZB195W6YBmu4/ekZqLJBn0HnuKLo86UGC9wTv
	goV8sdDesJd2kwjtbyxdSlIt81TNsmWC313pPUZyLqrMdjC+RJI0maIKbjAIRQPwpEWD4LPCZ8U
	wR/BIMUia1GqPPy7gzjqM/0GXzo3FYwivrraRAJYNKmj8IaEYhRBjOvyrzpCyXI5G855fsH9gOT
	HOHucpIQ727Owv/tebBjvBrEb5wKmeGdR6dreK2O1g07cDvmu1fIs7rV/aH3Lv5FtDuoEfRl/fN
	w3TTAfoJTtEdT9TGOXRPOvPdFINlbelGvcV0j19S7viDSxef9AnE2kfE8dG8Wj8vYaNZpwGTndc
	VR1gC6JDUcvgGzPpTjP6qMRxSXJca0LxtcFE3+IQ3vWtsC5CFvJrD3esQViUB8MmcZDIZDkpUO0
	mVMxwQfcwVAWqncagJvdwqRJsKTt39WeY9TQsM61/nnUfEetW48quUrIfKIrqoEdBElubV9pfdm
	ko2WCEwSd68SxYGIZQ4HgBDdyAx0l+Big2eq9Qu80Us1MAgCsGJmEmgOFx59pM163WkWS1306dU
	P3l8/TvYzZ5VZ3IF3HddVUqH6cjr9AdlJilAJB1lB4C7OQjgMg/Ytk/IcCT+1aL5BQ1Oyt6ZYKm
	0RKitMmyLkNSN
X-Received: by 2002:a05:693c:4007:b0:379:730d:db52 with SMTP id 5a478bee46e88-379730de704mr5172270eec.32.1794673526554;
        Sat, 14 Nov 2026 08:25:26 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm18414414eec.5.2026.11.14.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:25:25 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261114031621.2924144-1-csander@purestorage.com>
References: <20261114031621.2924144-1-csander@purestorage.com>
Subject: Re: [PATCH 0/4] io_uring: avoid req->flags store-to-load
 forwarding failures
Message-Id: <179467352548.51068.17443816757303265088.b4-ty@b4>
Date: Sat, 14 Nov 2026 09:25:25 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 13 Nov 2026 20:16:17 -0700, Caleb Sander Mateos wrote:
> clang likes to set/clear req->flags bits using the narrowest possible or/and
> instructions (e.g. an 8-bit or if all flag bits are in the same byte). This
> causes store-to-load forwarding failures on subsequent wider req->flags loads.
> 
> For example, clang compiles the req->flags |= REQ_F_ASYNC_DATA in
> io_uring_cmd_prep() -> io_uring_alloc_cached_async_data() on x86_64 into an
> orb $0x40, 0x4a(%rdi) instruction, since REQ_F_ASYNC_DATA = 0x40 << 16 and
> offsetof(struct io_kiocb, flags) = 0x48. The subsequent 64-bit req->flags load
> for unlikely(req->flags & (IO_REQ_LINK_FLAGS | REQ_F_FORCE_ASYNC | REQ_F_FAIL))
> in io_submit_sqe() is extremely hot because it can't be served from the store
> buffer and must wait for the REQ_F_ASYNC_DATA set to hit the L1 cache. On a
> thread issuing ublk and NVMe passthrough commands, that one req->flags load
> consumes around 1% of all CPU cycles.
> 
> [...]

Applied, thanks!

[1/4] io_uring: return io_req_flags_t from io_slot_flags()
      commit: 4d81c9390d0a326f2beadea2503d3e3929c739e1
[2/4] io_uring: add multishot_flags constant in io_wq_submit_work()
      commit: 91801f8eab5e5963befb1358efa6832e9aa78499
[3/4] io_uring: add io_req_{set,clear,switch}_flags()
      commit: 3e5dd5a145214bd8996744e8a828ceb249570301
[4/4] io_uring: use io_req_{set,clear,switch}_flags()
      commit: 33e97a6c608064795dc5e36643a9cc66d98bfa99

Best regards,
-- 
Jens Axboe



