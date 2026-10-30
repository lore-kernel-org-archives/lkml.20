Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381853;
	b=2VWhVLXpTbg36+CEtMeYFU8d8N1l9sWwkB80Nh9G9C05HrE1gvIUB8eBk1HSrsj4bbnd
	 sUnxwUy287uNNyCGIGP6rK0YE5iW81iU5kKBtuQ3nslMQfpyHfodT5FiK1zy6kiW5GZAm
	 lWgGgFdeHtzoY8/UUbqi91cavKl16S2C5kqI8qyLK7gkBuURVXBNa59y2LouIdeupEL33
	 0FsODyQKD+Adve97usxdfFYG0pGv7ECiPL/KFLsL6Az6P9jve9QrSbPXCj8zXrPmzt+7C
	 xaOOcomhJYxi8MSLb0KWHDgjQewyaHS0wTe17Y0tmCW0qh2HiR0ds+x/KDz4GUcSthQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381853;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=QqQ6C0OE9LFPex0ZEg7+EJqcM4gEV2iwMcWf019X7J0=;
	b=HNAxn5FZbz1WBzRuSEmN+oLbXSBeYr9Hza49hx9gG5R2m4vgqvoXs8Ye68QQ2kpPVJaJ
	 6d7QXrsyYa3Tc51psM269N4vLaEI9Gha+WLQ/3SmXYy4GFmyH+oVK0pAG2yzYQDJnHaPZ
	 Gq1gQaT2uW+0dtdLmhQ2y1Lec3UaQY7QJ9OFQ2iAGSthQk26uSC2HVutcfFsZpZ8oOcIr
	 poF9Q2ZVlXyGrSNy66ZJiVTd7Xbi1VYUU6jViHB9SRVGcC0Piyqgmonzd91Q28bLEGCVB
	 NJA50QmJdoEeVRIRwhrsY0Fwy8wohks8wB0yA0RGzVkMOMWHQSI1Nf0e9tq4lDmBhmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51103606A31D;
	Fri, 30 Oct 2026 17:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51103606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:MIME-Version:
	Content-Transfer-Encoding; bh=QqQ6C0OE9LFPex0ZEg7+EJqcM4gEV2iwMc
	Wf019X7J0=; b=Tw8liSFyGgZYmC/kh8AFfQvnXt1FG6L9iWBF68cnwZDIUKKngA
	Uc1bystzF7cwKEHGCS/XQDJ8+Q8QlQ7uuKWDzAbPFBcbTds6mx0Gppu1xStO9kQP
	NL/hG/HZ5u2QFlT0uXHAZt2MV13BcvbeM/l08jqTWNRcWX2y759a8M/LI=
Received: from localhost.localdomain (unknown [113.200.174.17])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkDW_ALR1eRqG6cMAQ--.60485S2;
	Sat, 31 Oct 2026 01:37:22 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] ALSA: bcd2000: fix use-after-free of MIDI URBs on disconnect
Date: Sat, 31 Oct 2026 01:37:13 +0800
Message-ID: <20261030.pref-21.8c455f52f06f402f@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20260923103116.1666-1-25031212351@stu.xidian.edu.cn>
References: <20260923103116.1666-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset="utf-8"
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
X-CM-TRANSID:BrQMCkDW_ALR1eRqG6cMAQ--.60485S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr1DtFy3ArW5Ar13AryDGFg_yoW3XrbE9F
	yDCFWDJ3Z8Aw4UXa1fGFnxCr47Ka95tr9xtrWUGry3A3s8Ar13uayrWF1Yyr1rJ3ZYvry3
	ZrnxtwnY939FgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVW8JVW8Jr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
	cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx
	0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY
	1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x07jVSoXUUUUU=
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUCD2rktUISygAAsr

Hi Takashi,

Could you please advise on the status of this series and whether any
further work is needed, considering the related upstream fixes?

  [PATCH 0/1] ALSA: bcd2000: fix use-after-free of MIDI URBs on
  disconnect

The series addresses MIDI URB lifetime on BCD2000 disconnect. I noticed
the related upstream commit below and would appreciate your guidance on
whether this series is still needed.

Related upstream fix:
https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux/+/459d3a64766f5ca2f1886daeaf24582831a5f5ab

I am copying this address for visibility.

Original submission:
https://lore.landau.one/lkml/20260923103116.1666-1-25031212351@stu.xidian.edu.cn/T/

Thanks,
YuanZhe

