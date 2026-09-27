Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2682B3E2742;
	Sun, 27 Sep 2026 11:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790509291; cv=none; b=IiOrBYNB8Zi7yYUdOYERDZ0tRHf7yaRVYOooe24ctTQ5ww0auefX3w7vbV97IrkD2hZ2rrmCEB/Y/xK9ldIFRXsFYw3EO3C/2aOAh+D0VC7004jqTWh3gsh6fipdI4t1Hp9+RbSLuwIlR5M+HMGZSaOG9zZ+DKtUw3WVzQoXEAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790509291; c=relaxed/simple;
	bh=U8/fCpx/xwF8ygBxGfu0cbDRHmKfiFbEgdmW9dS/upI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OR6O3XxyGGN3upPWz5jjgpg8+eQDw4PFbEUROjbzd4zOACAtFfvBSKMEmiiEa3dAKV5w2YcchZPRvtPXC8AK0r7HaFV8ZRLEpm9buVNFRwN66SBMbnzrpsiB/vzGooDM1z/EBSDg+G2OpDMZW6wBvXx2egyf6yvs9JNwOZNrNj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=uwr6bnzc; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="uwr6bnzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790509225;
	bh=AxSkBYVSgPpuL1MDhi0QbGNCeRr0nlyN70G0ZK6JT7o=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=uwr6bnzcscW7/B5pP7RMLj/pzCNdY0fc9hH9OP7loTLJsn0d9V2oLtS/g3j7eHf+U
	 dfJPyha9Jm0QjSX+AXNxYuunF+k4aisFpsj6gLvnsJPc8BB5SIhhS8LZww1mP0QoU6
	 y47D8ettS4qM/0Ze44F/NgRe2zEVEodkY0fcTwio=
X-QQ-mid: esmtpgz12t1790509219t77f39464
X-QQ-Originating-IP: Q9Fmadj4aY05j/N8kJ39rt0dI6voa+weiCz4y/q+x7o=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Sep 2026 19:40:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11085124453979755528
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Sun, 27 Sep 2026 19:40:06 +0800
Subject: [PATCH v3 4/8] usb: chipidea: usb2: add SpacemiT K1 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-b4-spacemit-k1-usb2-v3-4-ce7095896039@linux.spacemit.com>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
In-Reply-To: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790509204; l=1399;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=U8/fCpx/xwF8ygBxGfu0cbDRHmKfiFbEgdmW9dS/upI=;
 b=ltMR5hwwy8URYFQiTt309gX0S/uTxgDcmsAjzGIb9xMJD8PfPi4t1HgoCA8sM+uXGMPHY9Lw2
 rqKXFU/Y0I7DW4/jOeQZm4Nzqz8n5fxA6LTFaWu1BFbw6CHGKtQastD
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NOWj8FKbz2OZvPyw92zxKkjmAGL5naSp3IJhRQWGkov7+OrQgjuk4VcS
	/+P5sndqSNzdpFu4oFy15wOJgWjjv65TWWlDAWm2msVb+SiFrc9DUzjygGEB7ISlfBSOY95
	TLS1ueib0dwLQ1qYR+MeT5A9pXBSPT8XA9M0Na3x5jFWMdci+Q5nAEVvCH2AZ75G6fXVSDW
	0nJGdOTIYw7UYuGdmSLmaxjWAKwdamA9F/2uEqhS+chN6iPdujaxg+qFAYu/v/plzRong11
	/VlxIhl5RvNyURDQTV44vc9S1ZcrlS5KKemoZSnFJ6vff5PQQ3FkjTIr3CHf7bqasxIB4w0
	PVBra5/F7i/p5hrBMnLgx4q5E9Z5phyGsZFE4Gr1m975OJiJrVyucNZyvaWmoRCxfw1eo5F
	t27DPTrtJ7oT/JE50tj9bTAZtDEHeerh3+Hx1r5ZyU6SlYjT/VsFmK3KVrNHzRYBL5UJs9C
	4URI78baHx23uZxVKdcUGwgXL0R9Ijnz37EsebOQ4TfM9igLHXdt+d/c+Twp+UZCarCju5x
	EyH4hDwTkZIZwIWxt+HjAGODw7+M94LZrZfZONfUlQTMEYZk4sZOu0YrBCIldFsijJPPx3l
	euqVEdu/wWGRN+dtAwX4p8xlDtVcsYewikADSV7t209wKNhQxdlr6vp5GdHqGFMi/y4apq2
	yagDJbQUSW9WB3L0p/MxbKyWPNXA42Sb8k6KJeDGpoXj8CqtseqY5P674oQ8zSESXNq1Kma
	FQA2LqX2acS6MNL/A9YD/+0X2vrG6WcQovg6NwePwKp69f+0cUHzedKqmnb1zOngh7zT2lX
	6IyLbjayADbyUiZSNCzbpVgDFzn6XINlcXuz0dFQxbeVa8EUfGj7FWgz6thZvkTjGB8RZ1D
	7oNaazkUKYVw+nRxlfXRWbpPUozNutue3tUb8cCDgRs/9nlI0lm2VtAOWTQR0UAazxF97z1
	g48X73iYEQBEDYyX6kHHm0zD1Md22nKOwu0/f8PH71Vrj1pHZjyq8kD9vB44PAZtFm26EJH
	+Y5sYFHbaqSjlBGywcHAqc4B8tR00pxx1+9ApWdnE257YktLDuwsN/mlaMk3kdZnqeVxAje
	1jSlIIFgzzA4+Aje+wHNjVZyDnmRjmRldE9k/JUisKcQWc7qJrkUthNRdW5sFueQrXCzHMQ
	BpubjpnEQRO6AlKcQw2+bPAbbmhX0RhrLhi6kyCU6G74487tkE3hY5Z7mQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Add a compatible for SpacemiT K1, and add platform data with correct
flag since the hardware doesn't have internal otg register support.

Acked-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 85244e8bbc3f..a5ed2bad5573 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -38,10 +38,18 @@ static const struct ci_hdrc_platform_data ci_zevio_pdata = {
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

