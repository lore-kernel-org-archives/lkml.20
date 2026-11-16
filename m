Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794805878;
	b=tFXr1Oa2oIjSiiA12VsDZeH2jYUPCyXtG9MU23JpIUZmStIV9J6JV+s/mB36cuaVBfA1
	 /DxRVxltZ5w+4V2CRbbbXsxKS2kZhSeSd8CIxe/vrZMLaNqOMcvznqaGIb6GqupG92JYW
	 NBzilU7jqkCxPJD+O3pPjPF96qmVSV0rHZdgBcyR11YAKgZB5rIHzo0UN/VbTLcxd4wcU
	 h+0SjCduNdB5wnmkm0bNDU1F0WMkOeqKqZdxc3sY/m8V38jTic2zAM0lm20KAhvGsETeK
	 IzyNKMT8zabnwkpp3VxXQNgmdbSC2GAoSKWlTdBX+Xzhb18Xi7XKJimAHg3QYQ0qn9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794805878;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=2MyjIRfi8z8RD48BoqVWnOUyixWR1EC3tpo47dRq6No=;
	b=c6Un2X0fYsX/FWYEh0jkCENlS90xYu3/635igB49VUx7MqlRAGLjBjBXx8Z8Ml/bqNHq
	 6421uSbZLrkIlGlpXtuSn6QfRtiqMNIG8x3BNyE4J5Qs/SM4hBMqdaWu9gBmwO3SDNUFu
	 wLux/P1nkDnEewUps6gK9EtpFPhCoZzyFxIkzTtugA7MzwKtKnj0fLIi/I13GInSnMPfU
	 vlU0mAG8ClUeuPBCiRUkGmePt5YxTJqz1ALx0HiZqcUDnHy667wvd/ax00fNenCOgi7m3
	 QTTl+6KtJZOPatp3FHnpB3rVXp0HZ/BW84AQ2PELZyEAGEt0tAgggi/avzw9Cag4G1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=da3iuxpe;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD5C606A323;
	Mon, 16 Nov 2026 05:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD5C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=da3iuxpe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794805844;
	bh=2MyjIRfi8z8RD48BoqVWnOUyixWR1EC3tpo47dRq6No=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=da3iuxpeQ/mJf6tTr8CFVYM0VgaWxhIJLE9CgIS9L7CsKXrS2Q0UCIqiw73znOSCH
	 H2Iyer6wuO/21HVr/5zGSWD1lz2gbmg0MI7aIgstOgTSnBwm9r0GqvjzaiNuvPaLH1
	 BVwfZO/iD/54GhDVSFpnJqwjCv7KtqGIR/K2qqxI=
X-QQ-mid: zesmtpgz6t1794805829t3795d196
X-QQ-Originating-IP: Exuulxv9Ar1wwgtGnmY9munrK+3o1/siuMbcGE7Yh38=
Received: from PEC004119 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 13:10:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11562387596637447636
EX-QQ-RecipientCnt: 5
From: Haowen Tu <tuhaowen@uniontech.com>
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH] USB: serial: f81232: drain work on failed open
Date: Mon, 16 Nov 2026 13:10:24 +0800
Message-ID: <B2303336BB3BED22+20261116051024.3330549-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.50.1
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
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MpvVxjO9l39xyLjowYcC1HVamBcKJfUHUDbnRE1e7MeYAZI17ApDXKGv
	fGTte3833lgQrOcd3E0gf+705+wrZiOyBrYTzOB1e7S1HWrEWmhSFCOQSJZWtjZPL16AifG
	MPFVV09iITK2zze+2ugphyVnDh1epAWaKnm1svEl382VUzivgBlvWLNpyca7awAWR4vWu3B
	ZoRq8St3zAKhsmsjWzM91Da1lZh2boHvdSbvkOsReFPDH9ztlw+BboclSVR85RSWD8crKxR
	Y3mAdo7XxpC2R2N5Jee4qfEWdSTCESSIZo23wRdGJ5/J0jtIpXrTzisQZxc2wSD5eUQa5aD
	yYeKKMKZtmUKmrnEkaLkNPx3nhFA7kkM4aiUcLZpxTUMcHEchIQBYtJAd5Cp77qib+5Vwai
	Xk4ZWL7wD0UrRVlfTzY2ccwJjMbbw0Syfkp1IzO5erWmRlWuI4qPCIw3uHwnrfNeqC9bw4T
	OGVUifdIs7uzr7rwVahs1/9PNi1Um5k2lofNprVx3//OLHUqwKZ6eTtgqxzqDsUK0zkAvc8
	/qdGd29jpxIAw2bc4hiRhBqaPZ5WnI90jqRbq4jh/q3D1F81vAFcQI6Wv7pfyyO29CGOsEm
	+1TNAILHp3/LmvdLFptjv0+3+RSC7R7663z8p3Co4IDYDE9UzFiqhDnim+mJKOV1fowAme8
	sQJVnn3cXIYXk2n/NwXD9lGiZhAThl41Darf3hs5z4wk0UImZuLrYsIHjOSHgRVYyIhlUMg
	cNV9SUBHHOuFz3oEuX0abXyirV1wrBC4y4QS6JByTcq6y+RFQy6RoStTLgvrL5hP2YS+ww0
	3iQcwD1u881FJxaK7k8mAq11Q3bxZTh/1HAOJl9nIw6g/rowair/4DKQSw//HHih8U52TRQ
	zeVo0pna9c3+gLgcp0GWiwwFSMPR3JhyOEH1jiHlDeVpLvvg39lrqTlqp/+kzxI8IIX4kEM
	E6+X2E+gBmBxYqijIDpzOBEMnTcUYW/IgucpEBNVFiK9x3av1aaUBmvbuu9hlgsWwrhT+tr
	DrdFFOh/zrKBX3gzrF2K9yLKST3ohirWyjSzA7sQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The interrupt URB is submitted before usb_serial_generic_open() starts
the bulk read URBs. A modem-status notification can therefore queue
interrupt_work before a bulk read submission fails. A bulk read that
completes before a later submission fails can also queue lsr_work.

The error path kills the interrupt URB but does not drain either work
item. The tty port is not initialized after a failed open, so the close
callback, which normally flushes this work, is not called. If the device
is then disconnected, the work can outlive the port private data it uses.

Flush both work items after killing the interrupt URB. The generic open
error path has already killed any submitted bulk read URBs, so neither
source can queue more work at this point.

Fixes: 87fe5adcd8de ("USB: f81232: implement read IIR/MSR with endpoint")
Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 drivers/usb/serial/f81232.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/f81232.c b/drivers/usb/serial/f81232.c
index 9a3ede35a3d9..b62e93e7612c 100644
--- a/drivers/usb/serial/f81232.c
+++ b/drivers/usb/serial/f81232.c
@@ -695,6 +695,7 @@ static int f81232_tiocmset(struct tty_struct *tty,
 
 static int f81232_open(struct tty_struct *tty, struct usb_serial_port *port)
 {
+	struct f81232_private *priv = usb_get_serial_port_data(port);
 	int result;
 
 	result = f81232_port_enable(port);
@@ -715,6 +716,8 @@ static int f81232_open(struct tty_struct *tty, struct usb_serial_port *port)
 	result = usb_serial_generic_open(tty, port);
 	if (result) {
 		usb_kill_urb(port->interrupt_in_urb);
+		flush_work(&priv->interrupt_work);
+		flush_work(&priv->lsr_work);
 		return result;
 	}
 
-- 
2.50.1

