Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246315;
	b=GbGMBW9wjOm4cRNMiOgYzYGeHstp7jSmht5/717+OR4wFf69sZz6u4HFzgyAhfUkgEKa
	 L7msRKnJh5XH3hUOzIocuHvDM4oTe2CdItk7EhBBAoIDigUXzGrQy7U3TKfWGUylU52ks
	 nm1lY2JOWenbAM/7NjHGlcxhdAlYVO/kvkNAs7HGhv5Qa2geFbBISFAgX1uJM8+5LJDke
	 aijt8mp2Wzx5EATPBuY7y7zM3p+trHi0CeRqrCfN6I/pi+cDIyrlVlLNMW32F8JZTXdTt
	 uL9MS0njm1uoX0xe254Wg99Vwzar29U9WcZpMOtw3B3QYUuDi7OU+cG9IVZvhwHk1lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246315;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=rKWWlLamxsX6C+wWQ3RjHbZhUn4fZF4PoHH6nfAH94E=;
	b=0IPp8k/M6RTI06cxCLpnFSzBjCRCM9EahhmyyEZgvbPd8/+aR+o+QRWey+kQb8wDu/go
	 xaU0lDM1+ZJXptKzAQXswp/vih/SIW9fez6cOkRkPDVrbm7UD4ZsiCDSY6wLc/ZMJbXIa
	 mE1xj8w7J+BKK1kbzYllO/jCX1yFDF8t6qFEBch6hf0s93qsBPMvt8Z3HBmPEQuXxrv2w
	 hKdwYaD/5Q9TG4gj9vyoe47o5NIGcxTQM+qOgE9xo//b/fGqoFB7PanAkOJgCw+Mzqi1h
	 bvIj4wvG5poa5hdBXfsWjHtFCPRYTjclb1tY6gwVFZgUWYREJDUIovxks6a48/ogeAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D35606A31A;
	Thu, 29 Oct 2026 03:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D35606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1793246292t02f385cd
X-QQ-Originating-IP: rULgPPENo6ArHONBhIWMKTzJXA2vLyYppYXaz9Xwn9A=
Received: from [192.168.30.244] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 11:58:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11119534971111730702
EX-QQ-RecipientCnt: 17
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH 0/5] media: iris: HFI gen2 features and fixes for VA-API
Date: Thu, 29 Oct 2026 11:58:05 +0800
Message-Id: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrE3SdkG5ilgUg7Eo6SCSxt0Vy
 y8v/4sgFJgE6ixCoJOFV5+g8wz62fmJkIdkMMoUWpkKObDg6XDkiwSttqRUUTpnLKRmC/QNKWn
 a33J0C/X7ewL3/QAZkAkUcQAAAA==
X-Change-ID: 20261029-iris-va-fixes-818e0067aa28
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 dragon@radxa.com, Chris Obbard <chris.obbard@oss.qualcomm.com>, 
 Deepak Sikri <sikrid@qti.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Loic Minier <loic.minier@oss.qualcomm.com>, 
 Jason Pettit <jason.pettit@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726; i=sophon@radxa.com;
 h=from:subject:message-id; bh=2pUM++6EuMSmkspbChFs2KGAGKrtuCEl/obXrPZ7zqU=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFmPjgQq7Z9UvHJvimDKuRcT57wTV8vheMt78u8HfqvIB
 FN/8aj5HaUsDGJcDLJiiiwK8Qxz2Stzrz0VK9WDmcPKBDKEgYtTACYy6TzDP+X+7vu5Fk1+yxJD
 WiKbqhWXB8Up3uY815x7T3GxnmGJNcNfifq4BTZr/F83fxRKY2oSyzOTdhBtvMqkqhlzS/aa2gx
 WAA==
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NN51gi9eLBwaCQCmDAt14waHv10ZhQy/mjdaYMzlggCxF8Dmdq7bi5z+
	E74k6kE6cz6Br0vh59UCszXyVT1T4KaMHLf/ZJnsK+qcB40dJVRFkPXsLLPOKInZMNIFI4Z
	ixvko1UVlOk+tKQgD5h/SZPVjasUmhxxymVKl3Y2oxpR7e7QsYG4Yiv+Dvv4Viw2oCCy/Vo
	1adJCOuAIr+qp8QSzASUoz2EWfOh7mGaye8E3o3T48K29fGtF+k5enH4vDJN61pINua6zca
	8Su8hYAnFXDYOLptS8gFX5kVbf6cXXbP/b063vUvfQbH+5gAaOMRI8gwOuzYHHgyXn+nBub
	zAd7Tzpw5InbdGOSm7W8BCWpvpNIsypIEc7+anfpPvBJN+9G/Cx0GCaF/ap62kwwioJ/b5a
	w3a27+jovTk02Rwa966Ik60n73PJgIs1eRUWu47Q9aBjqUFkfH2gdn4nrYgvEl0cjs4uzfS
	n9vqs9RNjJn/uBDGYOSDpNi7ITdwfyqBlYhSv1CnmktHLAULQkuSVVzlKn9tC1N3J0Ouvb6
	TxbAX9qfY0wk/JPW9NSbKbFkumImb1hSnIw6hIE33HF8jOSXOT2VoW7MeEfUpnj8hZXJpPT
	l9zEbOvfuPEzUh+Cevnoc9PK8S71MhAp7jujy59CYpdouRDgnEAzKB0V3TNCXxwBdUhICNY
	xC73bH8JeWslddl6BpnrBc8WZmnwDHmYyEAef1K4sKP807ocATKPsVTTfv1J6+CT3h+pW5u
	7/fvOzuSS8GBuWPhhM3YoxdCAlqJinHZ4y3inwlUkh26lO2uMBnboea8u6bsNSj7zQo6Cem
	k3/g2488L0G1tSnhsi4bIJcEmxVlXoUFYjyAUfv0MKGIHlYaPWxOsZfWyLGGN0h1MDuYXVI
	lHvBURjnOmnPHD7OAKnCnoBO2l83Uy1//MSTUeoBwv20/eLkLpN5TBC1B05fe4mWSZOvQ5r
	wKVTzRdfSza9s0Z8ncoBssEyUcp3Mv1QVQ+oDKFih0+XZVPztyLWZnkBHeZV4fV0YrKr3mZ
	rZIdpLEosp9fADU2QXCtj9yLZI5/safbYgUE0Hqb0CigkykrpT
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

This series adds features and fixes to Iris HFI gen2 to support
qcom-va-driver [1], a userspace VA-API backend for the V4L2 stateful codec
interface.

It enables decode-order output and larger CAPTURE buffer pools for VA-API
clients, and exposes encoder deblocking controls. It also fixes
error-buffer timestamps and handling of non-display AV1 and VP9 pictures,
which affect both VA-API and direct V4L2 clients.

[1] https://github.com/radxa-pkg/qcom-va-driver

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Xilin Wu (5):
      media: iris: support decode-order output on HFI gen2
      media: iris: allow larger capture buffer pools on HFI gen2
      media: iris: Add deblocking filter controls for HFI gen2
      media: iris: Preserve timestamps on error buffers
      media: iris: Recycle decoder buffers for non-display pictures

 drivers/media/platform/qcom/iris/iris_buffer.c     |   3 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  93 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 136 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   2 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  29 ++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 ++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  47 ++++++-
 .../platform/qcom/iris/iris_platform_common.h      |   8 ++
 drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
 10 files changed, 325 insertions(+), 6 deletions(-)
---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261029-iris-va-fixes-818e0067aa28

Best regards,
--  
Xilin Wu <sophon@radxa.com>

