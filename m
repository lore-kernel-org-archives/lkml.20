Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713789;
	b=KC9QCOkkK6MnRkGY1U4JAEDnHMn3VLCJsPEpDiAxrX64ntCjl4s/V117V1Lst6K/Jep9
	 Az85NAFdOge3YYY7QguTnhk5ncquGxcYLhIgV8dIcDoETqLHv23zL3sakNxnrGarqy88L
	 HlMSVs59GszdGpZ/52DIr2uVlRbHoRck7eQwDBGgy+ZHIZ0ShA9uAwQcZQDpaMpbxvyAD
	 KJ8Cq5YOykO+zLrzOkObOUU/jBABtnhbc/lyYP6eXo7oF7kC7gRxK9Gk7EsLfPlV0GdEi
	 AfnmMHR6+2H3rLXH+yVmFRY9ZTkWRjVzg4xmMY10eeETep24WrfywjWGcqV+b7tCDpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NiTHky/qrLqHb3kl55Ue+tJp0FqEUYQu+BGLrGjyymA=;
	b=bao+HjO+Qrb/cCoun0FtfnB6iu7hRM/rr4bKOudkXFVN8y3u7Sbmtag/p0i6pLXdOwze
	 GWU3x3hLk0KboooZC+flgtRG25Qc2Ms2lzT/KoTt91fcqGF78UWp3/SZer69JvNB6Y3R5
	 ipPLitm92sC622suG8JtJUneeguxN0yBHxplLE7FF2qU7fOr6dVn7dFwsTMgJoPKFH2Ei
	 H1idKAIK5TUTKSIsq1R7YRkxdi0w8ffMVU2yo7dwUhMlD2xWFUvVrxcDNbJPLZoYvN/0r
	 P0pYHjj1oe/lZQN3pnPgDG5+nSUDg7UzcUl7ltM1AandrSSX8iKRvaGTQxCtLrzkt7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4yaRCoY;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CED606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1CED606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4yaRCoY
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a064dcfcfdso1494606b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713788; x=1794318588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiTHky/qrLqHb3kl55Ue+tJp0FqEUYQu+BGLrGjyymA=;
        b=S4yaRCoYEDIdQx9nd6MUMVyTgQ3qjcEUxTHHScdNekTUOEs49FJUebRnufc4CA0UfB
         i7VitCm15MSdNwcMNksQK0QvjqUYVkkYlVncknLcA07egs+zeTVEfXE1NtRR8C4Rmwe/
         59e38cdM5NFOiGuDV80fmbH2/2EcpFpNNYCnNsD8RlFpvSi9QEqn/BNMOG25RZbdiKzL
         nwgZBDetxUxC+AGwv/eMcJTCjKXZxosq4tRZkao88Q0YR5PIIrcjyTxKOYIp9G8Yg7Lr
         ichja6cJTKLXLq+hstuadyHfGXBIFc2bnYzaPc5K4FMhCQqDTfAe8HhC5gFbMTWcqqBO
         W3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713788; x=1794318588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiTHky/qrLqHb3kl55Ue+tJp0FqEUYQu+BGLrGjyymA=;
        b=eVqSBfFfb4PHJG6TmYszwlUxY2kl2uBakdDvXCAWKfUny41u26z8LspJOK/kcNd15C
         rV2BoZOi5BMjFRK2ZxUMMdNHJ2bEg+q2HnVAKyyTpw018xpgGrrTMh2TG9X065fZnFp8
         wVfOEQsQDxf1taz9Cg9t+gjhYv7gDZKmc8bXHzzes52feO65QuVN7tz/b+ZEqzraBSl7
         fCY9gKRmxL5V2WJlYfqR8lorR1m0RiyDhhxFIw48No15dG2goEcdZjM9nIMj0U8IdiCA
         UohMUhlfJDHLYL8U1ZNXzjh3dzI7Y6ap3CqFIx7AAUKnTnG1NwzpA+TYIbmhDwfoaUvy
         s0vA==
X-Forwarded-Encrypted: i=1; AKwUvByNfSvj7XPOfkeF3cBYuSB6g+n9C4MBIG/SN8JI90AbccN5DGjRZdVIwLD3W6uhHqBcTc2BMbubKyvuqR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z88DsbtRwk+OkpZfAyrtp/nuzeLOhWxMdbmjX6WELX56KzmfZGZ
	fkn6tqdeCxfxewCvf/HcE0xIvEHQnDpXumdyqM5WOksRBxySvZrgtJl8
X-Gm-Gg: AYBFou3HK4PUtYXzjAJndjpQUfa1Bws9CV4ujOERO9AqSJbg2fFSVKSYUZWP3QyGmMK
	wGFRIgNHxY3A7GbCI9y6ArZh12XWLBE6HGFgD/Q/xyHfv78/BGnYy1GoPx4j6U+ZwUcUlhLhJnk
	JFGvuLAG6Igyt1Skv0CjRLe7Nz+LwFx4KL2S6mHtLGbzlyaai3Of6C0PiKDAR0ZUBK6DpyEWvKk
	mFMA1ksZzSl4YTIYmXTiPBhoKOM0VJO0/o1iJ5cysC8rcmyRDN42uh6wATEM+32Px4h0DLiBrE/
	D+So6cbN9zLY3i+D9b7GkNN84vpPzrMoYDxG9keRrrf2nFpeMmOI7lOgTiOG0KIo85sE7Ozkjk+
	QUupzsgt5mS2w1JfPpGtnLeJxS8lzXKtWXjXk+t/gpdie0MMadPn5qrSk/waDzHBpEYWgICw68r
	/eWUSNsdVbjBHPAGc+ibV0i9ybogPQX3fftyWLfieIhEKYKqKqVlAkmD6wYTIZvFG6m+gJW5Htw
	QyNqk41WiUKT/25592GzCbTvyDmyYD85wuD6L8kTVTARVrFIPoZafGB1zdtqbFDxgbmfm5XxMfP
	C6p4M18VcuI7JIBS8Vd+h2HsUPUlPi5n5vtIyS/V/Ek8t3EAwJFm1a+2D26XWv29
X-Received: by 2002:a05:6a21:b88:b0:3e1:c6e6:d101 with SMTP id adf61e73a8af0-3e928da40d0mr11428618637.29.1793713787841;
        Tue, 03 Nov 2026 05:49:47 -0800 (PST)
Received: from localhost.localdomain ([2400:d802:dd7:8000:314f:4575:be3:a064])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb36449db7sm1446391a12.8.2026.11.03.05.49.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 05:49:47 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: leon@kernel.org
Cc: haris.iqbal@ionos.com,
	jinpu.wang@ionos.com,
	jgg@ziepe.ca,
	guoqing.jiang@linux.dev,
	lgs201920130244@gmail.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] RDMA/rtrs-srv: Do not free the path on path file creation failure
Date: Tue,  3 Nov 2026 21:49:39 +0800
Message-ID: <20261103134939.55513-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103122024.GG264423@unreal>
References: <20261103122024.GG264423@unreal>
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

On Tue, Nov 03, 2026 at 02:20:24PM +0200, Leon Romanovsky wrote:
> Interesting claim. How did you trigger the KASAN warning in the RDMA ULP?

With soft-RoCE in a KVM guest, with both ends of rtrs in the same guest,
and failslab standing in for an allocation failure:

- Kernel: rdma for-next c3e8e9451e6f, x86_64, with KASAN, RDMA_RXE,
  INFINIBAND_RTRS_CLIENT/SERVER, BLK_DEV_RNBD_CLIENT/SERVER, BLK_DEV_RAM,
  FAILSLAB and FAULT_INJECTION_STACKTRACE_FILTER, all built in.
- In the guest: "rdma link add rxe0 type rxe netdev eth0", then failslab
  is limited to call stacks through rtrs_srv_create_path_files()
  (require-start/require-end set to its range from /proc/kallsyms,
  stacktrace-depth 32, probability 100, times 1, interval N), and /dev/ram0
  is mapped through the rnbd client:
  echo "sessname=s1 path=ip:10.0.2.15 device_path=/dev/ram0" \
       > /sys/class/rnbd-client/ctl/map_device
- The server handles the client's info request in its completion worker,
  in rtrs_srv_info_req_done(). With N chosen so that the failing
  allocation is the one in kobject_init_and_add() of srv_path->kobj,
  rtrs_srv_create_path_files() fails, its kobject_put() frees srv_path
  through rtrs_srv_release(), and process_info_req() and
  rtrs_srv_info_req_done() go on using it: that is the KASAN report in
  the changelog, followed by more in rtrs_srv_close_work() and a general
  protection fault. Failing the stats kobject instead gives reports of
  the same kind.

The steps in the guest, after boot:

  ip link set eth0 up
  ip addr add 10.0.2.15/24 dev eth0
  rdma link add rxe0 type rxe netdev eth0
  f=rtrs_srv_create_path_files
  start=$(awk -v f=$f '$3 == f {print $1; exit}' /proc/kallsyms)
  end=$(sort /proc/kallsyms |
        awk -v s=$start 'found && $1 != s {print $1; exit} $1 == s {found=1}')
  F=/sys/kernel/debug/failslab
  echo 0x$start > $F/require-start
  echo 0x$end > $F/require-end
  echo 32 > $F/stacktrace-depth
  echo N > $F/task-filter
  echo N > $F/ignore-gfp-wait
  echo $N > $F/interval
  echo 1 > $F/times
  echo 2 > $F/verbose
  echo 100 > $F/probability
  echo "sessname=s1 path=ip:10.0.2.15 device_path=/dev/ram0" \
       > /sys/class/rnbd-client/ctl/map_device

With verbose=2 failslab prints the stack of the allocation it fails, so
N is found by trying N=1, 2, ... until it is the one in
kobject_init_and_add() for srv_path->kobj (21 in our build).

So it needs an allocation failure while a client connects; nothing else
is unusual. I can send the full KASAN log, the init script and the
kernel config if that helps. The client that triggers patch 2's
use-after-free from the network by sending an empty pathname (fixed by
patch 3) is not public; I can send it to you privately if you want it.

Thanks,
Yuqiang
