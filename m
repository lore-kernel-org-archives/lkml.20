Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919202;
	b=ikAVs623JcLqUR6hQz6W7P8hZiRghuXy9nox8ta6iM6Fob9rknMpledti1QWKgFhU+19
	 VWNtOIH++Xk/zmIeUxAYsAgYLcTujUezJTTYllrKXeDzwDVRf4qFgP68SBZWuuF+SOUTG
	 x+RkHg3iPhmpAiSHs3YiHZ1qPcs4ZVe8naluRf1cgSSsleIZ8LWo794BANBu0NONvbzCp
	 9tozwySH3lphWxy7B2dtilupARTck9/kUtCYx8MD0cr3QISjXk1yjEguyHTpWm764Ot5t
	 vPBbsgD/b/KQpw9Hh77lfxc8kbXiyema0U1cAgTZpcuBLz1O4VXso4CqqQtMzuie6iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919202;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=R6O0+AasUEGsWlot0/xopA0+Ayx+x8bIuv2FnDici0Y=;
	b=tamvQ0+GoirDjgaRFDLhgqPKR70qls4+WWfJyLSMtgvmrNK7d1FmhRBWEEicxBDCDnmh
	 ryNV1gm9vPbt7OdmTjLcew43Wivq53bSSfk6rChtqZJx9wJFW+9cRuxud7QZhRfR4CmM9
	 8ekkzDhp8Oa3SBzcivQ4NUTgYQYErGwN6qzML68Jqc5/whlgTr84CMiBWLJvJij3TY36v
	 ss7FWimbnAdEv2o4fGyxP1zLUxeJbl33QejsrzCJJGnh2d7mw9/cyXZp9cLHeGiYIy1nk
	 HNjqWFLgUIfzgu/KNHvFANMXDmZwgoAtkJq+G218VHC2gXkJB8TIWLMTphviaTRf+CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="w71/v8V0";
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BFB60A2604;
	Tue, 17 Nov 2026 12:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BFB60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=w71/v8V0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919153;
	bh=R6O0+AasUEGsWlot0/xopA0+Ayx+x8bIuv2FnDici0Y=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=w71/v8V0o+1n84kp2AUkUNnIAOtc4T5wsyYeavJBpTDj1DvVgSsEKO4EBlQlE1DQl
	 SVFeanpa12wGV3INkjgO3vZ2MpQV17zbNl2ddUhB9NEh4478CY4feFsRNksXuGJp4M
	 IhIoAAwfE/Jrir9++OEa8T+VRyMCGoz4SJRZ7FUo=
X-QQ-mid: zesmtpsz6t1794919147tf8e03230
X-QQ-Originating-IP: 35/WEpGbzCYVuTWPtwLu0dGEX090WLJH08HOWBuCjlg=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:39:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2503803023681370946
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:47 +0800
Subject: [PATCH v5 5/9] usb: chipidea: usb2: add SpacemiT K1 support
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
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-5-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=1441;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=79iHn1d8I1hNLQPTPiPNCDeRXP1a7Ath7l467WccxHo=;
 b=Exg9Cg+V4pcazXIw42TfAzBQKAXQ6DMcQN+flNiXueJfoMBGLucI495ZdyobH75tPptawH3L3
 Rb1gKAnh8TQDmrkkJmTimi2PY6WRGWyxDxkWoylXyacE20OsWGaqe5b
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: N8MG3KPVA7/364tz+f6dCuiGisEgqpTb7N53UlBFH1bOzOvM2wVSuC66
	brdwHVprGcndaneoa0/6AQVSU/nCDCzrcED11bV9tFGHk/Kx4cee/nG6m/z0PuIsa6MVUgu
	jbfw6ihNGPK4JATKyI7L/zIcqCoWdqQ7jNiTffWI4/IqSBzsZdY/JT/7e1ImiXYeKmWQ3zm
	iCxBCDtu8vHhP0IhNImdHcf9GhRnSjy2Vpluo9zA50+qEAbQJ6L7iyZcq+6Bj3FZ9kZvQSy
	SENqOYIrnoGPbjS7qKREDAox52IPkmkRpIbbh/B8LdZXTKRI6pBw/Lf7hwUKdWGBPQmYttf
	Zgd0M8xiQkl0BFi+/k7yfD9crpZ2KnDP9ZkLuXJivgh2VX0g6WsBdRgF1HZOleC5BQExNmK
	kraw+HIFLgZamaErOU3Dv0xf+qjLgAabrHGtfl/e/YnD8h45J9U/bXQC28OPn0rpJZadeHr
	DIUHkycLqjCykZBKht2cWPi0kSB80rO9sdL2RD3dL9ijxMdodEhHdF5gUb+0mpdnA0+F5nd
	crYVlgly2wAkNnTgmbZmrFzc3Xrcmi5j65S9RGdP7fS1p7BFWNt+9/O0ZZk9YajCbatOiLQ
	8MPfWnmLXZRQFUysf8uRj/ET1PvUnkTwdR0C0SIyjDkrw8A3bjSXrt/xpSuD9Ku/j9qaMZ0
	/uRSsLoAYu/+REeb/bbtb9wqXTDpcBENZktlQoYsoDqnrtjLF1eYwqepKcE2umTlufcW8i7
	Ubq/MvVqJ7C7LFekuJdaKPh30MAOaVbd9u/fTe4V5o4+KHxX16yZTXYycUu0e6hEhIuwQKr
	kLBznwxm0q3vG3varHxB0NhJ7fyynncdq705ayOY0UdPHBG7Ka66KpzLos2y2xM4xax6fpq
	aCP+t9rd7JfrvN0lgqKTyJmIWkQp81BZ00xdzKzqPY4miabZNj6fSHewLsEpJojd0gsZ/y7
	hEx+IZS33Lbw9EPQRsKFODsBcre1HnZR5j4m2M1eO2avYdHB+oslyZERocROd1bZXa/a9Ju
	yp8akGvbF6Ea2iEXimGztmTYk2OIteAEM3wPnGxi3COiLo74CgQnK98TDU45swisHDvgMtv
	F87AghQHJG34OSimccHkrD8wqpmdA/ju2tmbuXfC2spI7nBI7dU0tdZnP89sIaFQfF8M+XI
	CXn/OXeIJ1qFEtCU0d48NdyikQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Add a compatible for SpacemiT K1, and add platform data with correct
flag since the hardware doesn't have internal otg register support.

Acked-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 8cf13f0bae3f..0572c6aac4f0 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -34,10 +34,18 @@ static const struct ci_hdrc_platform_data ci_zevio_pdata = {
 	.flags		= CI_HDRC_REGS_SHARED | CI_HDRC_FORCE_FULLSPEED,
 };
 
+static const struct ci_hdrc_platform_data ci_k1_pdata = {
+	.capoffset	= DEF_CAPOFFSET,
+	.flags		= CI_HDRC_DISABLE_STREAMING |
+			  CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS |
+			  CI_HDRC_DUAL_ROLE_NOT_OTG,
+};
+
 static const struct of_device_id ci_hdrc_usb2_of_match[] = {
 	{ .compatible = "chipidea,usb2" },
 	{ .compatible = "xlnx,zynq-usb-2.20a", .data = &ci_zynq_pdata },
 	{ .compatible = "lsi,zevio-usb", .data = &ci_zevio_pdata },
+	{ .compatible = "spacemit,k1-usb2", .data = &ci_k1_pdata },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);

-- 
2.34.1

