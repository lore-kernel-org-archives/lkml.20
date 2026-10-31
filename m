Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793419924;
	b=zArWvn37h0LW8V27lhNYKAPuNjS/2eqS1ZZ0DcR9Uv0Oxnu9hYiE/kWrk7xjZWxov0E1
	 c7JtI19njoHSvc5vLqZgudYp0Lt7Earudo2mEYOw5uB9dNV9EVKxamqXXzePF3qyZnA1b
	 w0SKPllR/t58ANGGIHqGtW91kRDCIThb6ekYhxAV/mLeGu19+QFXMfebCkeQZVJlsOLq5
	 GDvOoeVQV8nY7H2J55Hv8RZmQ55XnTZcOLElYYuJyFAyzdgINjWuarkyFgAHZ2Jt0K2Ds
	 YE2Y+5mRv0JUHrblo1ZDCwEcwqrghXPS5jlWcf+evGkDsgw+rlZhhn7IRnCDHfp/U1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793419924;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=8pLxj8cSeSR8iu9o3YKwfDXfBtYN3BKzH1Ydyp7mDiI=;
	b=ic0qDPFySpnF7bCGQjjxTZxil9PLqgOkvp4aW1f3kPBw8+PAgrWy7ePjPQ4Aau2Lfjo8
	 v1lFV4dhcLdLmjTQSqEyccNPb/ahFWC4nyBv/HTZneSXU/0IWiHxwN2lqTPDlu/dQMLAT
	 GRzsTTbpKAVjTr01gtuCS/dyJsWmcoyEfVRejZ3v+PsYQF1Zh72cqBGmhBkUi72OjDx3O
	 8PmL7QcDCZpjkcH/K/HwbENzvcpAGyjoBHYzJ4dtd88zsPCz9pEKHgZUb6bf9dfnxXBkg
	 t/BwQ7r4zfski7hVCxBYCIe8e/vYF5C2nQ8ORIucEZN3JCQye+r/BqHwuF+qQ0WBcZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b="M/76Q4Ti";
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F141606A31C;
	Sat, 31 Oct 2026 04:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F141606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=M/76Q4Ti
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=8pLxj8cSeSR8iu9o3YKwf
	DXfBtYN3BKzH1Ydyp7mDiI=; b=M/76Q4Ti/qdkeya44PhioZ0rR9ITGlLYhs1WH
	6EnTDSKfMgex3wtEhzVB+qwouELKi0qDwFLvx8YtOpHS+L+Zlml5Wi5nHUaScl9B
	YPplf3KoAIwi9xwfqESu87oCIBS2pJaP2nmDTpfdRumkI/+snakp8eIS6a0XjniA
	mdMG5M=
Received: from [127.0.1.1] (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3uDyLauVqbQFtAA--.131S2;
	Sat, 31 Oct 2026 12:11:55 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] media: camss: add SM8750 support
Date: Sat, 31 Oct 2026 12:11:55 +0800
Message-ID: <179341991564.308077.13037775977607027113@mail.ustc.edu.cn>
In-Reply-To: <fe9765cf-ef10-4068-ad43-26346d842c12@kernel.org>
References: <179325717815.489400.16602455641444097904@mail.ustc.edu.cn>
 <fe9765cf-ef10-4068-ad43-26346d842c12@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgA3uDyLauVqbQFtAA--.131S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF15ZrWUGrW5uF4kXFWDJwb_yoW8XryDpF
	WSgw15KrsFyFyvyw1kZ348X3ykurZ5tay7tan8Gry5Aw45Cr1SvFn7Kr4qgFW8Wr92q3Wj
	yr4qgas5C390qa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkI
	ecxEwVAFwVW8XwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
	Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	bFo7_UUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREQB2rk8FYCLwApsr

Hi Krzysztof,

first, the honest part: I work on this board alone, my English is not
good enough to write upstream mail unaided, so I draft with an AI assistant
and edit it myself; the content and the decisions are mine.  My previous
message in this thread was unclear and that is on me.

You asked what I was referring to.  It was the SM8750 camss series
([PATCH v2 0/9] from 28 October) and your comments about splitting the
enablement from the board DTS.  My reply quoted another thread and did not
say which question it answered, so the thread read as unrelated.  Sorry.

The state of that work now:
 - the SM8750 camss enablement is not mine to push; Bryan has said it goes
   through Hangxiang's series.  I am not resending it.
 - what remains from my side are two fixes on the existing code, sent
   separately as [PATCH v2 0/2]: the csid power-on unwind and the VFE
   stream start/stop handling.
 - I dropped the DMA-contiguity patch completely.  Bryan measured plane0
   with five physical breaks and no IOVA breaks, and it works; my check
   tested the IOVA while claiming physical contiguity, so it was wrong even
   before that measurement.  The prepare hook it added had no user.
 - Loic's shape for the streaming fix is taken: one helper for the
   subdevice walk, the remote source pad instead of pads[0], and
   v4l2_subdev_enable_streams()/disable_streams().

If you would rather see those two fixes inside Hangxiang's series instead
of standing alone, say so and I will drop them here.

Thanks for reading.

