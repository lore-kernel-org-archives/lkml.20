Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867732;
	b=V95bOFsxAwga7H7llqg6U6G4YES8kwfYaFye+zLOCE5eK4i1IpbZOJq+rdqcPC9M4lDH
	 EL+1QqW38H8tUhvWtW4qxEVga81+lcJrGj/CqLQX7nuNedeLU2qjkE2cpdbJEaoPROar5
	 DEARUoThucXbhp0kj55xBf8Ls7XkFwACDu0wNNPPCJg5pw7kBBBBhl7V9boleF45wfU2w
	 qaCawmzNDC+M//qdli/7IAxuYkrACTSLPPHS2lzChVfg+NAFNjSyljC3FAYoWLlvO5Yu8
	 IYdu1pv+20ntlRqHFCKN5SCVjc70GwOXiEdWGh7PcDMZHN4kucOIH7iQLNaYKo2opHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pMSexfhR541OuPmIYjYfQMR9TxRQH7Bx+m2xGYqk6uo=;
	b=rgGN5WoeYSQmW8vAaJunKJZ/fQqa4wl5Vuru506JFgn25E/QCcUGVHb7MV2cUyDOHghI
	 sdSQJDoM7IF1pPo9u9A81VP2ANIseMdCwp9xN50R9m0ThRG2BZ/BzcP3mpPys6W/EIiX7
	 d5ta16q9SeMdMNsW78V2kuGHm+TMudfKwP01XaORDn5tKDoyElb0Vn9VAPnEgq+zhtqho
	 n1mOQeuDPyL9vlGvuxYVNdPIMN0gQJ69XuSldrZdaYV5q0Kd1kmhbS73jE0FLR+YVo8Ht
	 CQ9eCev69TCTClclqGNgloYInf4bGnQlREMX2384na/RRwASyNveJp6pNefl3bLf/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2Gy8x0w;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1317606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1317606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2Gy8x0w
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so14862165e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794867730; x=1795472530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pMSexfhR541OuPmIYjYfQMR9TxRQH7Bx+m2xGYqk6uo=;
        b=E2Gy8x0wrzC0MIM4AoYyWVyIZTUFSoPodZj3PdO8OpmV1TcbgFIOt3SoxxQXkTO98k
         BYKL8cFfTORRhodtxT7jI3jdebBaXuRy8BN6SqJp5/7cog6Fmd8HbhzcU/0uKZaSYvCJ
         3tCQsrZn9AdeD/+iz6D+rAr7AaWuYhqRRLgkQZamyQrOfOU/jx44DxCRmeE90DyPyMhX
         J15FwUiiMnOx5xdnwQn+HyQ8BtUXK7zKWtFiu12nrfq8h28aWwtQ/xZSLr+h9nZK/Cao
         Eyqbu07sagw2krwlnQxGgJNrfAGDwKVfTmYnQaglei74ThH057E1pReEjQcHB/fCS6X3
         g37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867730; x=1795472530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMSexfhR541OuPmIYjYfQMR9TxRQH7Bx+m2xGYqk6uo=;
        b=XfgEBWToMnJDGZkApcUX+DiQAI0cPMJd5vZo5xsJnHi8K9vJYP+9qQ3enJtQOrS1F7
         z5uiek8mdsFlUt6eahpMIMH6i1Ou4dB2IdP1JhIjOm0ef1XVSGQQosaV702JP2rHIOCP
         6PMboAmuwCMu5wGXvP75HM8GovWgVze6Vjw6XO+TtmT4LKbwIl+Bdx5xC/aPB2x2V8nl
         y0pku6/C0GlirRf9ber5pRMs889u1viKcDe7sPAYnKG3dnoC5bjtc5iC/sq52b7dWA3b
         47ocoQSmfqaG+7ZqghwLX/cRPT9qjU/S4EZ0qxzR4bnPq5DgLA/gkaNoDVrIexrcm2fP
         06ow==
X-Forwarded-Encrypted: i=1; AL+hErHQlk8RFNGkOPDo19aqY4payvoPD0ySZ3UNTwkxH/WctlRtvEQq/k7B5e2OM7RsY9alkuL1aN12mMHUruY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OjR0ZNHUI+c51g6jV5ThpPzNmW8dJpsPLTy/vgdoHKl7jH1p+
	GS4F+rhB3ueElJTEyIuFM1aMebDRh1wE+z+ozRKRX7B2W1W8U/xuMLAK
X-Gm-Gg: AYBFou3hw4no1O+duLz0FtSO7pp6d7O7yPEiWoI0zKDUBLrs0GVBfyDK2E46bfv5SVI
	CEwlaNcmlCDXDxDsqO4ZTEdWFbCyqAU6+eLQQuV7/Sq8J4iq1WkAQypaEzKBJuBzA5vIWTOuENu
	/v4hZjfufBtdJ48s0vLwSNM7AXVPTaoB6ltszQyjoleINjxjQiojvSjn7C3nEn+AYwpxDngRJ+W
	5kyIqBPwCwzOdCm2rJNsaZDUBH8XwiKPj0fraSPUNmBHVzL52qbo8+avjGZi4ZFl2FDZkFs3HtU
	zB9ZiDotHQ17owuNBqAlsm+YF91oS9wXCco4ghhDIqjjXnm0QqTGqArmHqcBkAsAeXhPKHdG6Z2
	a2rfqIdQNyZJm3m0SU+MQwcNTYAYjTDjUtyvdhoSx+a6vh2Z4/vBTiLtIFBz12hhZW9U/KMijph
	J4z7ltQ6Y1pNpcWuYCoObKinVyxORiHfxux/ZmNc5Y2ZnRFfUF3RJarSXlvVyDiBxpi/03Wd67w
	Y90JnCb+2lVr5SsY3y8rXp5jVYP9QHkb2qEARMRODZeKu6/roHqtxYUt8Qo0TJFox7a2khSNzXE
	MFeNy6Td5tx2mMyhRlNpxbtyq0FoEuc4IaMMTQ9xwWclX6UkLCFxd1korTx73zJ/2NDeYw==
X-Received: by 2002:a05:600c:548e:b0:4bb:6a5a:782d with SMTP id 5b1f17b1804b1-4bb6a5a78demr119774955e9.17.1794867729993;
        Mon, 16 Nov 2026 14:22:09 -0800 (PST)
Received: from lima-fedora ([185.184.13.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783862d6sm17255175e9.2.2026.11.16.14.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:22:09 -0800 (PST)
Date: Mon, 16 Nov 2026 23:22:07 +0100
From: Mihail Mihov <mihovmihailp@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, longman@redhat.com, chenridong@huaweicloud.com, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jstultz@google.com, kprateek.nayak@amd.com, qyousef@layalina.io, 
	regressions@lists.linux.dev
Subject: [REGRESSION] core scheduling latency with idle load
Message-ID: <avt_mdiPQ5gwAisa@lima-fedora>
References: <20260605105513.354837583@infradead.org>
 <20260605124052.227463677@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605124052.227463677@infradead.org>

Hi Peter,

I was running some experiments that co-locate a latency-sensitive
service with SCHED_IDLE batch work in a cpu.idle=1 cgroup, with the
service in its own core-scheduling cookie. After updating to 7.3 its
tail latency got much worse. With the help of an LLM I bisected it to
85570f10a4c6 ("sched/eevdf: Move to a single runqueue") and reduced it
to the script below. It is still present in v7.4-rc3.

Reproducer (root, SMT machine, CONFIG_SCHED_CORE, cyclictest):

#!/bin/sh
set -e
mkdir -p /sys/fs/cgroup/be
echo 1 > /sys/fs/cgroup/be/cpu.idle
trap 'echo 1 > /sys/fs/cgroup/be/cgroup.kill; sleep 1; rmdir /sys/fs/cgroup/be' EXIT
# one SCHED_IDLE spinner per CPU in the cpu.idle=1 cgroup
chrt -i 0 sh -c 'echo $$ > /sys/fs/cgroup/be/cgroup.procs; for i in $(seq $(nproc)); do while :; do :; done & done'
sleep 1
# p99 from cyclictest's 1 us histogram, overflows (> 1 s) included
p99() { awk '/^[0-9]/ { h[$1+0] = $2; n += $2 } /Overflows/ { o = $4 } END { n += o; for (i = 0; c < n * 0.99; i++) c += h[i]; print "p99", i - 1, "us" }'; }
printf 'no cookie: '; cyclictest -q -m -i 1000 -D 10 -h 1000000 | p99
printf 'cookie:    '; coresched new -- cyclictest -q -m -i 1000 -D 10 -h 1000000 | p99

i7-1185G7 (4C/8T), vanilla kernels built with the same config (Gentoo's
distribution kernel config, HZ=300, PREEMPT_LAZY). p99 in us:

  kernel            no cookie  cookie
  85570f10a4c6^     54         59
  85570f10a4c6      53         3695
  v7.3.4            54         3276
  v7.4-rc3          53         3290

I also tried the two cpu.idle preemption fixes under discussion [1][2]
on v7.3.4; the cookie p99 stayed around 3.1 ms with both.

Changing cgroup_mode (up, smp, concur, max, tasks) on v7.4-rc3 did not
fix it.

On Fri, Jun 05, 2026 at 02:40:20PM +0200, Peter Zijlstra wrote:
> @@ -14893,30 +14803,8 @@ bool cfs_prio_less(const struct task_str
[...]
> -     se_fi_update(sea, rq->core->core_forceidle_seq, in_fi);
> -     se_fi_update(seb, rq->core->core_forceidle_seq, in_fi);

In case it helps: adding these two calls back on v7.3.4 brought the
cookie p99 back to 55 us. I don't know whether that is the right thing
to do, only that it changes this result.

Thanks,
Mihail

[1] https://lore.kernel.org/all/20261019182622.1584454-1-vincent.guittot@linaro.org/
[2] https://lore.kernel.org/all/20261105165525.011876858@infradead.org/

#regzbot introduced: 85570f10a4c6
