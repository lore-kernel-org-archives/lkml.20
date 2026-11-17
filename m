Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908788;
	b=m/0+L9CMJEad5+ogjwD1lWQuUWfSwQu+z54hEavXQKrqIQL5prKwIC4uywv2w7cE8GDe
	 D3L5gecgSoebHGpWHZ3OZCDsa0G0Re98FuNmR+pucbrPOBE3RhMJCLq5MK5FEK87nTF7b
	 6FCn9Jwbh0rYB2OOADDtsZ5GOYZCxWEh4FSlzGtfOZUpLmTVzXJVGyNct5j91G5Yn5JkJ
	 nC1zOsdKyMq3afAmZuUuTgXFsOTkF8+hBa5IC/eoqgIUn3TS39A4p0GSfLRtFFV+69HSB
	 gPJ4aQ5fcn0V0WovjMc+GcxwscUau82SHzdeEEDNSa02YOU9l3MmMs3j8DKR329/mhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908788;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=k/qijytVFIsC4oBmo7E3xWvc1VpP3rElv6FAFcCDtSk=;
	b=Uy+5aWXPeRGoe2EJgfe0TSyRnUL7n6dhIFqYbejyG6AjrBFisiW5Ef0RZSuJdWDDQDAY
	 /mApOc8cysVAH40dQxLPwd6hxuR7WPTENkCCXwyv5dndwDFGa8spcjeXYVb758qyOBEuQ
	 dx50zb1w03UY3/rxS5jiUklbx0hqQCP3KLZi8cg6VYMta+lEbtcsy68fITKY7lqFRQ7ZL
	 B5HOUd8tiE+MQqHYvOxeHOjAxUapbByJ7fx6cOU2yiFyLXBYSDN8Z23mLDg7yP9pf5Ekb
	 a2DSwGFEu7b7yY+mwi9iq8jRB0T7cas6um9Kf8WhFJB6Qy4LATlMEvBKqM+0EUjhMJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NsksbYKC;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB8A606A333;
	Tue, 17 Nov 2026 09:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB8A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NsksbYKC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794908739;
	bh=k/qijytVFIsC4oBmo7E3xWvc1VpP3rElv6FAFcCDtSk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=NsksbYKCBbf74CXbp2CoijNV8Dy1YKY68Y3OD5vpZ4xqBPeseV+A2smdYkpKwm3oz
	 cf/9Y70ZBs5onXwxoV+x0Gn7VnhzxqmFjTZf3zfx+IbYilO5k5E4ULJIfEOLL4qblm
	 o0LdQ1/eXTVvoYtqUW6udiX2KDxKbssYJSKRux+E=
X-QQ-mid: zesmtpgz5t1794908738tf1d2ced2
X-QQ-Originating-IP: bsaj2xLaLCWn3mXT6bX46pVkGuckt9dXFHuXA9E85Rs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 17:45:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3879609612317059501
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Nov 2026 09:45:13 +0000
Subject: [PATCH v2 5/5] MAINTAINERS: Add entry for SpacemiT timer
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
Message-Id: <20261117-spacemit-soc-timer-v2-5-9264d0ea7755@linux.spacemit.com>
References: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
In-Reply-To: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=iHFUNkL4vpfnAkYRawlVPY3gFssiqBgZcrn/XNSsq1c=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/lNRtbkluXflVoUdQXUcwpN49M7TdsfTwioXmPAuZJ
 DcJ9bN1lLIwiHExyIopsnQ/4NlW4BNlWyBQ6Aszh5UJZAgDF6cATOTdBEaG20sSJhw60S1U+35G
 NFNfVzqf1oE44YSF1rJqP5e+e7pwHyPDR0nHMpaV5Wdrd7c+l311UKgnVK9kwtk7bUabNRezaV7
 nAwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NWth7vBa++GdiEWg+kbht02EjRzlnCDl34zyGu2pijraIMxYEHq7WB59
	J2IE4ul84CkxVsebT9N0GJGeT9Co2Y3z1giSzUgkhVU9Wtu/bGffCVlV75moc81PeWbcvNu
	eLro0Wi440L0++LUFuFUhsYD784o+IH2+K38SWTeGK5OPjDb4ULyEPyNcYWld3rwHXVGQEJ
	FImUMLkyvwqEFqw7kAZOCx+skPtRgSpgzvDxRMV6fAGoniApnFZ5NUmHuB/OHpXDSdlNhtR
	QFsoW85WVpGXxz2U8ocNTHB0abWdBcKLtaq06J3Hr2HzT5Z4fjMgOodnFDmST60wU7hmTFz
	NxfBDFi6HU8amLrPIc8wx5yq+8ybudPvFY3B/Udg1+355+sh8Qv5Qluz68jb9UHWXKjhJ9t
	QLG28la39f0571H2089Y0Dno/U3HAhYFxIoBSwjKnLcU1W7pzlQd1IhNfY+fBhcTsb4UTQ1
	VMyWp+xEkbwdgbte3MmuHay4tnRgsN19mIi+4nsdWUJlkWqB58xQZE+dVLwCqso0Ngt+YbM
	gfMol8WsbZJQND6qCX3m8lXQsIQFPiWHDL9Gx9WNk4k7C8Lg/j4FfTqisBYuwrBE5o5q1EW
	//lB6tqvVfIpOP3bODtjACdXohxiob2tRDi/mVSAJjKZPAI1tQsB45F5nbs7KAM/7H57KxX
	RVTzwug4wzkw7+QuJtxI8mGuJKtDTA+vXBQ5cWXIqJsNXEbbhwNdk3fbc4Ogs2hLl0cAep3
	rHb8ecF4MvKfLypN0X9XHOOMLErI0Wz3ubT1df+vupwbe18UCZjRSPG/Pt1V0l3a90PqkAH
	ymNNTmtGBqqrGUFy2JVjlP/zkiN0Csh48APucRjCzI29VPrH4wxyJL+LurYz1z6900LoYzO
	x48ho5AA8dJTABWUc+tJYWmCVTYA/bJbrcR+QI5nWjYY5DGnvz/E/B8ebB6C2eGWUbw8Vkd
	VFtV+6cC2QbJzLXBNiUSEQLm6A4A1Q0SKHKSxUnxIIduYIwZ+CjxhYt16hqFhPSl6TH/S3H
	b/WX2hoCnj3U1kOakbSZtzlMqzR7G0rRkEJBxmpZZx3EWCl0Yn/eqvsetssTJHJvjxtJ+IZ
	XIAdfeFOEHX
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Add a maintainer entry for the SpacemiT K1/K3 timer binding and
clocksource driver.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..e607e9cb07a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26372,6 +26372,12 @@ S:	Maintained
 F:	drivers/reset/spacemit/
 F:	include/dt-bindings/reset/spacemit,k3-resets.h
 
+SPACEMIT TIMER DRIVER
+M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml
+F:	drivers/clocksource/timer-spacemit.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

-- 
2.56.0

