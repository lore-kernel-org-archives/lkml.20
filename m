Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFA4493D38
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055898; cv=none; b=OEGnhOjI1VWDrnzgM1brwRT4w3WP2C7+RlPM4cC2z5iYH9ViEJNlblRCx/yK9dHlslLA7gw1j1RHdO4rky4v6WEaPXMRazYYDmlD7Dj8JfH6haD35XlBZGdTw2bqOYmOMgTEG1GwSfnqizmg+j6UajevC7Q5Oj2reCWNONi1G/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055898; c=relaxed/simple;
	bh=lXXn5TnrFsvI2/Jg+EC17kq4hFlsBRSeCkj7ola1KRo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cl3T57+ltXzYaFFYhQ/6WqKBmvjGQ/uMFwsL7+GEEiu2iY0cteFSl82TTN5ZLCzBcdjMJsDM5hHLh4g6E53q1aT+1S52uJV8yex7EKTMilLzU3EIYB3IR8KJLqju13cs7p8pPjxcMfAux3NKVPlzRIgQI7k+y4XdxTjfhKdWIjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gMqRNITG; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gMqRNITG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=ShBXiOQAd5iNbJHGsvsICLBrb6rH8R/rc7VKP2kL1Tk=;
	b=gMqRNITGldb7vLFOL96Zulvif3U0TgAkVOhPdJIdVxsMBDw9lhOYLlvaqYRQa+
	R08oQPQbfOa6WKyAAGW15xk3cV4N4gIhHkfCKQMkXRWEWe/HnwFy9xsD1G94/Mi/
	SaLkwq66Ak+k8utVQvvY68dZdZxayxd/37bjXrhTb06nU=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3hg8z06JqvIV5Bw--.21388S2;
	Thu, 10 Sep 2026 23:56:36 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: vincent.guittot@linaro.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	jackzxcui1989@163.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vschneid@redhat.com
Subject: Re: [RFC PATCH RESEND 05/10] sched/fair: Introduce select_task_rq_fair_thin() to select rq when LB_PROMOTE
Date: Thu, 10 Sep 2026 23:56:35 +0800
Message-Id: <20260910155635.2101399-1-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKfTPtD1NZ=AOdW7z5KyVHqaoEPso-7yqsicj=9t4zM20qJ_eQ@mail.gmail.com>
References: <CAKfTPtD1NZ=AOdW7z5KyVHqaoEPso-7yqsicj=9t4zM20qJ_eQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3hg8z06JqvIV5Bw--.21388S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWfXw1kZw13uw43Kr4fuFg_yoW5Jryfp3
	95K3W0yws7Xw18J3s2vr1xWF45Cw1rG3y5AF45CryUCrs8u3Z29r13Krs0vFy7Grn2ya1j
	va1qgw1DCasIvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU0NtsUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbCvxRFT2qi0zSLtgAA3z

On Thu, 10 Sep 2026 17:31:43 +0200 Vincent Guittot <vincent.guittot@linaro.org> wrote:

> > Adding such a function to the mainline code is indeed not a good idea. What I
> > actually want is to prioritize selecting idle CPUs within the LLC first, and
> > then select idle CPUs outside the LLC. However, once the fast path taken, if
> > I’m not mistaken, it only selects CPUs within the LLC, which is not very
> > friendly for machines on embedded platforms, as it becomes difficult to bind
> > tasks without crossing LLC boundaries when the number of CPUs is small.
> 
> Ok, I didn't notice that you were looking at all CPUs, not only the
> last LLC. Do you have more details about your cpu topology to share
> with us?
> 
> we have sched_balance_find_dst_cpu() which looks wider but needs
> SD_BALANCE_WAKE to be set in your sched domain topology

Our system has a two-level scheduling hierarchy with 18 CPUs and 4 clusters:
0-1, 2-5, 6-9, 10-13, and 14-17. Each cluster is LLC (Last Level Cache), and
there are no finer levels of hierarchy.

I did overlook the detail regarding the SD_BALANCE_WAKE flag; our project did
not change the default state of the SD_BALANCE_WAKE flag, which is set to 0
Moreover, as far as I know, most embedded Linux projects have real-time
requirements and generally do not modify this SD_BALANCE_WAKE flag.

Given this situation, is it necessary to create a new branch for such a "_thin"
select_task_rq_fair() variant when enabling LB_PROMOTE?


> > BTW,
> > Regarding nr_idle_scan, I have derived some data and the analysis is as follows:
> >
> > If nr_idle_scan is 2, then: y must be at least 512, tmp must be <=512, and tmp
> > must be <= 512 * 10000 * 1024. This leads to tmp <= sqrt(512 * 10000 * 1024 / 117 / 117),
> > which is the square of 382,999.488, resulting in approximately 618.8695 after
> > taking the square root.
> >
> > Multiplying this by 4 gives us 2476, so if the estimated utilization of CFS
> > tasks exceeds 60.54%,nr_idle_scan` must be less than 3 and becomes 2, which
> > may result in missing idle CPUs within the LLC.
> 
> nr_idle_scan has been design with large llc in mind where scanning
> hundreds of CPU is significant but when you have only few cores, we
> could be more relax in the number of cpu to scan

I can understand that the logic related to nr_idle_scan is very necessary when
there are a large number of CPUs. I realize that many x86 machines, even personal
PCs, have a considerable number of CPUs in their LLC.


--
Xin Zhao

