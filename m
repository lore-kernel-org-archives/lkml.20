Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346440;
	b=JfSZa6/OoebWu2BYSCuGS1Gif6OCFc3pElTYsm7tAFOMidKsy+YFDrF64YfFlKN2cMun
	 cu+3rUYF1uulGLdXDSUq6ejtO5wEXXoNRjEu1U8ZZem6COQZ7rUSLzanX6Au5TXn/me4o
	 EuWBPvLOPx0lCDQmYy6QvW2SA3snDpZQ+4YGcQlm1pNnO4PY9e+kGLWbr4FkDawNWECfN
	 /d5V2KKoCrLtIsSqYHt6YYnY6L1ZoKY8A1pqWSaAQHJSkzPoULkFUxjoSHiDJvNGJ9YZZ
	 4svBHGxfwg0Zy8E8MdgCakflcO10AEwAAbRL9sPM8pdU4xI76yUWGDjFYyYBqsEo9CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ce4U1saSzK8KO+Il81zG7GMVbAL8Qhw8VneMXvBqZbg=;
	b=FPBxwyle7KmBm0RsscnMC60xu1jFq/H4q7hghVQppBhHa4ukrii5FperjVIDFFjgjR7p
	 JMBUjPAOzu9wru7uzKNQ4+Bm3Ol18UW3d87fXff5ruAqHmEijZmeh03YZbp/B7o6N5KaZ
	 l0y/AZFvSIy7RBO9blcvYR6xujnKfgtS7c+urFk7TrX6nzJ7iuqwYdkW7QEIa8I6EVYa/
	 Gtt1YpX+qjTppikif4nVOckB1aZo7OlxbqmvwHgPkCXeH4wJWksHU/mxxNVzBSBD7+RuW
	 I5ISIPNBXOKCiMN62tKqyAVQlWnOb4R88Xzpw7t/daP3RQ2u5J5H/iWpjeg7K6n4tiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRNyz5pt;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA3E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BA3E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRNyz5pt
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-497614c95f0so1352059f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794346438; x=1794951238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ce4U1saSzK8KO+Il81zG7GMVbAL8Qhw8VneMXvBqZbg=;
        b=JRNyz5ptAat4iX7nzgsEYlOCVAnN4M8ukPGdG0cd37vhJqxuGvgNE2KussBUEmA2hF
         h6UBdsWXv3LzWwXZ5IawaMTIoE4RLNPsszpLdKSeOFgXD96DN2vpHMqu7cv0paL6aQ/5
         KRF6x408Vkhz4mbTkJs+a3Z697oL1CNAmZbKfu2AlwzAvDnJgqVVas3yxmyCFhLYpbkp
         S5YniNA4nA/cvG9D3WmZMHacu1a0TXpXuM+mR8+1opPERZIFIJ/ji6B8Vctr4P3DBD5d
         4+VMTY/hgia7mBtJL/SOy5SrJRqC4xA/+OXyHHszPymBGIYQZsOKoVAn85vriEPoF7AE
         HLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346438; x=1794951238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ce4U1saSzK8KO+Il81zG7GMVbAL8Qhw8VneMXvBqZbg=;
        b=fplapyI61VAQTpCDV69sD1lGssTknZQGjzLSgSGDGhzXZdLU52gLDzNJq6WTK+co2G
         rbutl6ENjYQSzDMURaV4kC4P8Lvx6WeVBfLpiNvdKCHT9cc1bLQrELeVT6I4gCTCmHI3
         izd9e3gn7qxFEnTK3omZxovOxqRBVwWnQBxppLuhjWCg3UeamfevqnVGSrGv8bsYRVpJ
         hZjCBpLgPWxzLGhu674l097P1ZjAXdkdGT26TUuS8/RxTIEPOwc7yOQI+EmkEPSlzpU6
         IIc2wJwv15qvzjnXtfi/UxR3r8VwabL1sNrcLk9WIDNM6B7ZrWDdL67s2pFkm7k6zpMo
         kwxg==
X-Forwarded-Encrypted: i=1; AL+hErGRpj5OhpoxDX9696Z/1VwyNbIQ5y9Q26cwebZy9poTby4alpcU4arSRL3KqxWIVxTOsbBWWho1VpiShX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o9L4k/Gcty+S/L0mKfcsWuuwCmvvJHW0sMpSDUBGt6b+NVAnr
	G3dPl4semz9KOyoTzr+oZ7aLqXZ+/GbregbjTI2pVHKnb7bIUW7f742s
X-Gm-Gg: AYBFou0YuEchPOWqK9v/4cBo3bk1bsVvPhYiIk/uSqYC/UojmB42Sr3PckpQ4lsU3lQ
	RqHVJNdMk0O/D/jlQBcwV9qxuMayBMF/RTryFD4kavTHwuU5FwqSFLh/ku9PdYHH7mi8CbA04+p
	gTIKcs7oFlA0TtK3opgcczxGdI/JZ5rIKQ8oHWhsTyosq6n3PqBJ4Q90KS7R+0qvuouwWt6Mjb7
	KK23xaUAqDPpcxokA6G5shJ0km/uKl7yk5afFS6HN0sMxmH+ItyZc53aLpwy9W15GBCNPv9mB0s
	IFB00bsfqGd3i6sDN4o7cT3jGaDrjAg2uSWgv6S3c8Ql3OiNeNUcT4Ft/38gG3K4z53IvHHGxyH
	NeXX50zLuMzmr/5NNemB7zUoND7JP45YFrp9DN5g7T75OMuxTbncWmSwtrklyV9LGgoLoJG/jpt
	Rld/zgG3bzzy8hIpkswU4YD0JvSy461KNLTJsIy+8WcdyYMYUy60A5bMj1nx1MDLFcsqH/nyA7y
	VWGeC5L67KODUCKMJMLXt2jzZRF9yZ4SUdDeu85u5Obw3W91y2w2veXv9eMQXGg5aqHWXNveDS/
	HUzGTLw8Xi63T6vaNJWBcuQebikRmZ6RKlM/rc6iQ1TQgjT5WGB7x0NFiuyv2EIL7u5oQtqYbKH
	n
X-Received: by 2002:a05:6000:240a:b0:492:820d:1e with SMTP id ffacd0b85a97d-499c7552585mr356605f8f.11.1794346438211;
        Tue, 10 Nov 2026 13:33:58 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc8fsm6675504f8f.30.2026.11.10.13.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:33:57 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [PATCH] clk: qcom: gcc-sm8750: Use retention for USB power domains
Date: Tue, 10 Nov 2026 23:33:46 +0200
Message-ID: <20261110213346.1359-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
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

The USB controller does not expect to lose its state in system suspend.
The controller node is a wakeup source, so in host mode dwc3 keeps the
core initialized across suspend, while genpd still powers the USB GDSCs
off. With a USB stick on the port, the xHCI comes back from s2idle with
an SMMU fault and is given up:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x669fd3200, fsynr=0x370011, cbfrsynra=0x40, cb=5
  xhci-hcd xhci-hcd.3.auto: WARNING: Host System Error
  xhci-hcd xhci-hcd.3.auto: xHCI host not responding to stop endpoint command
  xhci-hcd xhci-hcd.3.auto: xHCI host controller not responding, assume dead
  xhci-hcd xhci-hcd.3.auto: HC died; cleaning up

After that the port is dead in device mode as well, until a reboot.

Keep the controller and PHY GDSCs in retention, as SM8650 and X1E80100
do.

Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
Tested on OnePlus Pad 3 (SM8750; the board DT is not upstream yet),
v7.3-rc5 plus board patches, 150 s of s2idle ended by an RTC alarm,
with a USB stick on the Type-C port in host mode:

                                    without    with this patch
  stick left in during suspend      1/1 died   2/2 fine
  stick unplugged during suspend    2/2 died   3/3 fine

Two more 25 s cycles with the stick left in were fine with the patch.

Without the patch and with power/wakeup of the controller set to
"disabled" (one boot, two 25 s cycles) the first resume still hit the
SMMU fault and "Host System Error" and lost the stick; the second one
ended in "xHC error in resume, USBSTS 0x101d, Reinit" and the stick
came back.

Device mode (NCM gadget) suspends and resumes with the patch as it
did without it. I did not measure the suspend current.

I used an AI assistant (Claude) for the analysis and to draft this
patch and its description; I reviewed the result and ran the tests on
my device.

 drivers/clk/qcom/gcc-sm8750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index 80b8ec119c55..080f2fde53a1 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -2940,7 +2940,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -2952,7 +2952,7 @@ static struct gdsc gcc_usb3_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb3_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

base-commit: 14825c9204bad7f4e0bd3a528cbf4a7e24e757d0
-- 
2.43.0

