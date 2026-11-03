Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696862;
	b=U9qk8b1Vm1n77IAWb/iDfnKdfD8zmel83iiwuoWnOcgy0rX5Qr5TK0ya5tzwrTTUxssu
	 VsbxFkWFjWxTZxEMwiETDk89BJU2FyBP65zq998M+EBMWqyKtQs9xyklzzkWN1hz5NozK
	 WDURe13Ngjmxa9DX4mtgKGhpV3aLcz1rmEKC901MoGkVRD77gRTm9WfH8Vbb92bKWUw6p
	 Iz9JCBsfOzC8yJ5fzu6a1wylPM2o/d4wA6cGeG8bhAn+lINKCJDWEDuyPj/28m0sYFzRO
	 APhleq1NUra3gcxa5gloTbPmks0E4yAMX49ZlOMncGuTEUhxWXderWjWasxmVfdSNWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696862;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=cKF0+HpLP1A7piOY3Wv2dmLuWeKB0x/Iye5avhiY2LU=;
	b=Mkp0ftRXdkeENyzPfTIbouF7oqaJz98NMyyYZYd+GCPOYn/qi6ILTy6QYLsx3rvgP5oj
	 SL8pySgBuRVCfNTF7ZoItEZxe7B1JWZK6Ymbqi3lua0nQWsSbtlCtkaUoM6RwqsfFA2My
	 eTwk6RKbVZjWIZY5z6scLucpo0NmnH0PsPO439UFEN4lSXqhi/5+FydnXaNOV7WW2RtHm
	 Qh3Nr6L8JY22esMUI/LQpoMXsnPBrFTHCXN828egAH28+KDoY4OiAi2Okl8LOTQsdVoi1
	 RZSPyI5lqa70VkfqP7qldT9voeyzA7u/VrkGNsA0WczsbyvXEtkU2kfcZwoewHVstXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=j8QHfpT6;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E19D606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E19D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=j8QHfpT6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793696856; bh=cKF0+HpLP1A7piOY3Wv2dmLuWeKB0x/Iye5avhiY2LU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j8QHfpT6tz9L5s9BhyFe755uqUvnib0ZrZe1UfNI9bwALSGkj1QRm6rm5VO17EhsS
	 l6cWVjQec4J0czt6wE2Ah6VxR0RJ57DYQrKyj2lSuEH7V6atUc5BLdO4P4BqLQjIC3
	 hufjLwThZEUeWl1H71tm0bKdPst1dmTt7vVAhZ9g=
Received: from [127.0.0.1] ([113.208.112.234])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 1E02346B; Tue, 03 Nov 2026 17:07:32 +0800
X-QQ-mid: xmsmtpt1793696852t8adls48h
Message-ID: <tencent_E8CAFFD197F2AE80A6A7C8C9A83A14131D06@qq.com>
X-QQ-XMAILINFO: MvivV3k42cV+2n7iqV259t7CFZwWcv0MoyspDuw7t27dqAVEt6Sx7+gy+B9xv6
	 F33zicWsnd644b/X3gZTHb09MQsjg/FDO8UTjU5qramwmPRcZMXhkMLiMfPxD7V3ykOLGQVTDtYN
	 /G68u162gs/jtI0kUMZ/oNe7IF6xixgO0RtuvN+BLzYExqazkRrdtbZo3Cw5HGlFP1RGpFJ1m5i6
	 HMxosV7b0K+GZBiuorgy6s6WAeAKJdKoXQGEfmlRW4hr+ETdcl44BpPLXNK8q7taTrcWnjcDB7Li
	 PgYt9zvW2IvZ62ewFPbaBJSGl64AsTb/VVMruuPTStppzLmwmlN6L0q/tjSv7mA1ORTzIYlzinQT
	 TO3Fk5QLZ09wOb3gDMKU7m0+75PIjNfhdnnDfAjwT8+1p5vVro1Sg9nC0SjKmHQr7Kprp8UAC5KI
	 O4dmaVVnncUX0KMw3sd1zhQF27VpR/tfMyxoGxaw2V+gNuJRpdcdXHzHoeMdzuzM8bojFkwUKp9w
	 mJcFVe0TCKVyCJyLAyW51feXGyhFYEHukL6bARKMgwq4n4VCVOjrucxs8jVRJPucdMVI6VXuJF1v
	 7/PX6MlFUMd7Fhf2NZYxDvnd4Tb1LDvBXV3t76XMtuxORYznwrC2GWUEoj3/OjbpcOirUhBRkksm
	 ZRXg5TgJ8gZ2g+CJdb+9gCCsvvpLOfDcPvvP0weJPFHLDZd4KAT+yEavICPlFbz9g0TD/EdaUz+0
	 7iupOccuJIlqdd8cO2ByR6n6D0USYbXvD8sR3C+qEeQ2OgguI5gppcQcsSPkhOTfyzT9jfkVRwpv
	 EBNlb8RqScOL6KMsQQ4Hs9upUKhlz3zaHaqDR/jF9+Jv5GZjKkp44efBj4O+z0T3F3445xkx+7Aw
	 Yl0eWZcCFYavq4t+/R9LxKz9HxvDRDpnpHMwiyPRlIiWKDyoT5JdO/Q2VqAGLFLVtyob6TTZ44pC
	 QzmuafYpzZKNMeNZ9eyB2ElYVx9SRCAmxgWAxgaSgv7YQC+cYuUw48k5cGCXuysE8UTWALJepy1A
	 jEpzn0cYu9aWNSEMHoyHrPfUS4bjfg85maW2U9K0cQSBqCzCh6C1xrawRLCWA=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Jie Du <806144828@qq.com>
To: Peter Zijlstra <peterz@infradead.org>,
 Christian Loehle <christian.loehle@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Balbir Singh <bsingharora@gmail.com>, Yang Yang <yang.yang29@zte.com.cn>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] delayacct: Record blkio start on the correct task
Date: Tue, 03 Nov 2026 17:07:32 +0800
X-OQ-MSGID: <179369685203.1070812.11732820920377544174@qq.com>
In-Reply-To: <tencent_9E9A8D222CA35E50E674E9FF795FD9BB8108@qq.com>
References: <tencent_6CFB6E9B26A308DC2800D4059DF93FEC9706@qq.com>
 <tencent_9E9A8D222CA35E50E674E9FF795FD9BB8108@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

Please disregard this patch. As Christian pointed out in the report
thread, 5d010dd27be9 ("sched: Account I/O waits independently of delayed
dequeue") in peterz/queue sched/urgent already fixes this, and goes
further: it takes the blkio timestamp in try_to_block_task(), while the
task is still current, and covers nr_iowait too. I missed it before
sending, sorry for the noise.

I gave 5d010dd27be9 a try on top of v7.4-rc1 with the reproducer from
my patch, under QEMU (TCG, 2 vCPUs), 4 rounds of 60s each. Threads whose
blkio delay is larger than their age:

                      v7.4-rc1           v7.4-rc1 + 5d010dd27be9
  DELAY_DEQUEUE       20 of 14718        0 of 19122
  NO_DELAY_DEQUEUE     0 of 15766        0 of 20713

I also booted it with x86_debug.config and ran the reproducer for
2 rounds of 30s with no warnings in the log, and getdelays on a thread
doing 1000 O_DIRECT reads shows 1000 IO delays, one per read, averaging
0.715ms (min 0.54ms, max 1.59ms), so normal accounting looks fine.

Tested-by: Jie Du <806144828@qq.com>

Thanks,
Jie

