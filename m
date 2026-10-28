Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153574;
	b=xzPCeu0F/vN4HeIhkOxCNaLanswelf47sJGjFBnU5p/8LZuGlNxfyNDRFOSCEeRsEmi+
	 h502cf1nDqPHIgMBvbJUBVFVs+ZsPwkI+4YEljPIvDvGrHwvyHqv+bfxIYujRX4BaBbfS
	 U+U3s3F1Hih9Q/XJpLxxgQJcFx08Y8+u4DS4iIB5q3xnOJIbQPu2MpimMRzpNCk/dh7Mv
	 wXA8nw5ti8HaEHPZo5xFj44UHnJWn2NVZFPHadQi7PSS7gFxMJY29rE6B3JlIIBfCSE0e
	 ylbqemwQkqVd5/9OKn7nw6CcOmYa20N8mz35EhjfZhoRIvFeGP4t+d2zBWnAYULjI9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153574;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=wU4Ia8fV3iTsBzSrNt4mi0K7wxY3KqFiaUETYiyiMPw=;
	b=s7aNbaA0efwCN86i8DozWXWEPdZUEeBgyONVdtIlC8zJG+P3QDLhA8Xcf/Q6Y8sv9K0+
	 DewpmO1H7rfegZC71KSKO3jUTuveEYxvn1cKlFaI5OzqOXJ6p9YMkEpVyEFMUg35M841b
	 bH7sF0MIlEoXIIaX2mBZE1ZVzWOx8sOiKiXX47YbLA8SdrB/VWkOyerozXWhoWjnmp5Wp
	 FqjTJxuFpf1+AKla97PdxQhEskGMINWbUakGR9ssYrtl0UIO8B3sDjC1OueCXKVwl118w
	 hz52Rag30duzgIKpWvy9wRi/+hMuIRxL4mPh7d84Wm2Ik4sk5g7pa1E4PKIXhZAyPYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ugreen.com;
	spf=pass smtp.mailfrom=ugreen.com;
	dkim=pass header.d=ugreen.com header.i=@ugreen.com header.a=rsa-sha256 header.s=pkvm2402 header.b=UoLhDi+L;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4F7606A31A;
	Wed, 28 Oct 2026 02:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B4F7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ugreen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ugreen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ugreen.com header.i=@ugreen.com header.a=rsa-sha256 header.s=pkvm2402 header.b=UoLhDi+L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ugreen.com;
	s=pkvm2402; t=1793153550;
	bh=wU4Ia8fV3iTsBzSrNt4mi0K7wxY3KqFiaUETYiyiMPw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=UoLhDi+LkuxHktmuDnsAuADWO0LFdoRzQniOvb9VYBDOyRhl/pZfJ+tREIQKnMOUo
	 LvEtfFW+Ft3JgEUST09an6JsOEx7ELYKOQHjd3isKWTkbOaSIT8zXuNQnvHkktAx0K
	 7G1buVKxNt8Wjlmk8pI8WImG06wK1mQGL72IlKKU=
X-QQ-mid: zesmtpsz2t1793153546t308e49b2
X-QQ-Originating-IP: Tv1/oI+L0nH1S7ph0/goJW2q6W48rguru+lqloQGJhs=
Received: from localhost.localdomain ( [14.153.244.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Oct 2026 10:12:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2123676553908216664
EX-QQ-RecipientCnt: 5
From: Haowen Bai <calvin.bai@ugreen.com>
To: gregkh@linuxfoundation.org
Cc: mathias.nyman@linux.intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Bai <calvin.bai@ugreen.com>
Subject: Re: [PATCH v2] usb: pci-quirks: abort xHCI handoff if MMIO is inaccessible
Date: Wed, 28 Oct 2026 10:12:26 +0800
Message-Id: <20261028021226.1314753-1-calvin.bai@ugreen.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <2026102749-spender-coke-2fc1@gregkh>
References: <2026102749-spender-coke-2fc1@gregkh>
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:ugreen.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: NiWQQk7XjMbnOrX8TaOxcbBrEFrfw493m6pV3EDynwJwyFG8or2BlSmM
	rT2wEv99QyYpAt/yy4WzUHsoOAvFD07SFOct4SRzTsSwvsVb8gpVlC5LH04eJxtXZtuKcua
	ym6lFuagPQRMbc76bd0E0ESdRgAP5W4G9jqRlcOKZDPMgF8iDJTWxDjh7KEMkGXefBslGlV
	cdVgv4XzFcyLXtcaQ8CkUSlJYSbKt58ayXEq/BmKV9ErhXoHD1WSUiPrj6Z2VYY1JbzdIU1
	i+mkv3+uAPbitWZJY3Gzk6dV4VTx+npsTNFtqC1d2Qh6752Oi2iiCG5ijn3MDbLBgvs4oSk
	M+AbO9ZA0oPhRd2mmT1h94PAIpSYm+Iec89V/50DjFO1h/vc2wzOO4nVuOX75IIN3cNYsQy
	4a36nj8TxQvdtru83GW9Y1muFyMRN24h3Kg0ms2ovPoPjpujTDcxIEmUMBZ5zDP+A0xH8lE
	7VCGPNs8uRptS0uqUT71wKVF9kzFdIexi1y3UJMvmLrz4iOX+UdGqDDDEDGW9fHY25XDnB3
	3bzlAGOdnN4o7zKQ5PSJ4RtUBtTW4BEZvGfpRs4nlAyZDXxzpcQ7d8/8MSlU0hcjbu7Ofll
	/lHVj/9KKvNtLalYNvUbLbU3jxSAmEWKGVY4j7NbdBnqSW1XHrO+rx603HwPVywAE/jG/LY
	kTJdaPZ8bjcttIVeBxMgcVpUi+a89WKMczuiNw6hjKdD3+JhQ2gsybmXrwiFGcwqSVIUBCn
	whmk/zrFn89fKQgQez0xd1J2zjjSzV/NhmLcGf54LblM0HO/u13OJdztTgICktTd4PCXdRn
	/0/2H8cf/bGR7i2ljSNtSM8g93roxjZnZvL0ppjRrf/twEw4Mft/ctCyrWbtsCqht78FBkB
	jvJtmsfQYTz37alXItW7P1SNx7bno1MKNIrCTNVvR8J8a25jBAfB4Gox6bInyrrtEHoyeDo
	m3WD9JDjYo0bkOOzUj5liM6HoqH/JbGvqYa4dD1VOFAm5d1BVs38TTAXh
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Hi Greg,

> Sorry, but I see no context here at all :(

Sorry for the missing context. The v2 patch is here:

https://patchew.org/linux/02C44DCEA968C75D%2B20260914022743.30852-1-calvin.bai%40ugreen.com/

It makes the xHCI early handoff abort when MMIO reads return all ones,
avoiding prolonged polling and soft lockups during PCI hotplug.

The v2 incorporates Lukas's suggestion to use PCI_POSSIBLE_ERROR()
and carries Mathias's Acked-by.

Could you please take this through your USB tree, or should it go
through Mathias's xHCI tree? I can resend the full patch if needed.

Thanks,
Haowen
