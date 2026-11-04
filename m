Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773336;
	b=gGQ01rS95oCA2YLQExhCpVqp/nFfESmHOTyVHtlBL+IVrBhpHtjD7N4h91zkzLKjrOxT
	 w3f0FMS5shH2KXbVGHbZ49VDL+diDUux4OxTtioo3V++qrBfcGAN+RHGfnnatIKsml1gk
	 3qjMR0TplMSUO6Fmojp4WcEt2nIj6+x2fXeoBz7ibtmvMDxSu6WehTDOEPoFkd0oaqOW4
	 LMf/I8egFzUFe3xZ/piNAo5dgsWhht7nXRK4ZO2qKHk+TFK0CV0w3Qy5S3rf+bkKNDa3j
	 z7EXLVrNVzzPwxnd8jFEUfAUWeEu2eMYH8I+N6Ju1eEPIctrw5/ll5/8J2KSQv6WfRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773336;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=3e7+Hhln6FlsUG4lOrO8gQQ4QR4kAprqaH3c6bbIIdo=;
	b=w3FIk8pVW7KSh5tSAevQP4+OQujrIOl/kbSW7GsIU5Kp9Oowwy+oQZY0r1Aw5ynyzRgz
	 uv0vqnvd9SenWwGCyYqRJDExFvSRw7oo+a/h01l6gO3UGa4zJjQSR3SKq2YEZKJ9jiSi2
	 ScZQZOcRRUI1aq4CAMxhl/VRzpkfhu64fu2klaBIHYytqoblWXlLZ4p7bWeh0agjQ5Yci
	 WbbEVEIZbPcrcSaS4f+dXM6N/IKNo21zAS1YXHgNMxtQcsbq3k8j0cUOQJLXgQPOmIAMT
	 xbEx++fnbH/vCWpB35iPT8c1QIFP4wtnPlT67GvrDWLWZLaUGu/Yfb7t8/p0IZCDW+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="ToyicpK/";
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2195606A32F;
	Wed,  4 Nov 2026 06:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2195606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ToyicpK/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793773321;
	bh=3e7+Hhln6FlsUG4lOrO8gQQ4QR4kAprqaH3c6bbIIdo=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=ToyicpK/guk3tEy+bJgHjdB1GDC+doZ5C2iq99BFjXO5uJEeHAW2/ta+w1BslHPoZ
	 VZfvmm++b73fWFH4ioiyO3UXAPsyeBV/yZic8ut7Ts9IW2DuJtkUjFLSBoGdnuS/Fz
	 6DRREo414zlZBcE3ulMBtZHGgLyyPTfhS38HKdIg=
X-QQ-mid: esmtpsz21t1793773319t077b6b8f
X-QQ-Originating-IP: UbTdAw6IsnjA8fB7/tidvUEPpAu5a2tQesr5FK86Hv0=
Received: from = ( [183.48.245.66])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Nov 2026 14:21:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14544746940952886182
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/2] spacemit: k3: Add support for BS01DCMA board
Date: Wed, 04 Nov 2026 06:21:49 +0000
Message-Id: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA0kMaTgVcSFjqMdxSgZW4Tg3
 Rvr8i3+TyAUmQTqIkGkLwtvIcOUBeC7CxMpHrLBauuN0U4tlepFmwHXTjn/Gsl6dN4i5GKPNPL
 5vzXtY/n0M+FxL+C6fiSwbdZvAAAA
X-Change-ID: 20261104-k3-bs01dcma-467fe26c462c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=R+ytypgJjwtCuLK4OPXu2LlirewZmyB9gvazMxLCYrk=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmvzrNc+tZwb/O74n81zy1OOT6ZuJuZvTQm/5W2/hTu5
 2vmxu207ihlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZjIvfMM/7SmPJh1736hT+7/
 C+HprtZF8ayPY56kOeQv2/37IK9U5W5GhluJc5bq6EzRPbTMRuZ3yNJve02Ng9QtHV85dRSHTO9
 dzgUA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MJT0PMbMWKKuZadX2u+a0L711uPldo/vXDPKBORV8flcI4Iq8JTaU0DU
	3cTGlM7ybIsHTKyWItyhkDnmTMAjO3z+SLFod/CR7W0fQyAB4Zk+xDFetgY0H20+mKOQUdp
	vI3HdXPIQWc7fXGsEzIrl/VY/3unvJ2LJ32qmtisEgevJGvqH9IxnATgJY86gpxO31fobZw
	9MasDzSUWOHjqGWZ3XMnlIMhzLywtP/Czj+/kjBO+GL2Z5xvSGaLp4LnfB7FiwQS5c1XaLo
	o4MLWqJg8mDA8ODvxyykHdpJxWzGRbz5d/GT4nlsslyPvmeKEmh0eykQIj+an03YrbSppq/
	OeX4IP3+SX9w+AyDKWILuvf497uYDBVB8qWBKePlFNzykeWERTYwZaUDC3fw3oOth1AyVvA
	qkVk0NNeNMxuwldeCfsw9ykZFruFkzLJxu2mkjHrVspjUSWyqCIGAhgkWQZXLZmAxlQcIXg
	i8mm4U2B8SIH4PlYFesSygAnuNXhZphF71SZRpwSyWQBwFWXf3jADWFkIOVazLKpYcKAsBy
	NNOWEefqhkgk/GQd3Oo1pZ5SXp05dhIy1yUf6itLJ2lq0bTUx5w5u7DfpzOVCWb1LQ0Kpc4
	JPTP371ZQeiU3hzlE6/P2+KCCNkovpm0TCb+CwwMUkKBflKJZulyyoXXolWrLHDvR+M8plh
	yo8P1Kg6u9ZPAFafK18M1q3geBRJS8j2nIrw3lzJu9pDJvuaFOvjc6vGtwreOV6/+se/oTT
	eYwclpL9oSu9S3RNRixBp5lbJKCAn/LJZF9iVC1j4QpCk2sGxFVXdkrML8fVdcZ04EZpIGb
	8lj9MxjvFTg0uXjt7O7MA7HklVXn5OXxT4fovX/g8G9Wv9IsOtYUjNkz5soxEb3onEpMbzT
	CEv5J1CMPEHrlHv0U4pjsteSXsvz8cSW2tuxVpmb7oaK83i5OBcR3HdN9lhUKjyHzXWyxkd
	vWgCJjKRsxceqxbta/xD56c4tJq2AclVXbmkTLsxtYYSR/kcY8m9sfnPaocQ90faQ+VUi9K
	1ZfEYtN9xltO+saQ4rV2cEJrcb91VjnyKRqesELt+XiQ6Zeq35WiQWlxd0aVRnsZkt2HiMN
	WJ1EOLztiSl
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

This patch series adds initial support for the SpacemiT K3 BS01DCMA
board, which is equipped with a K3 SoC, 16 GiB of LPDDR5 memory, a P1
PMIC, an EEPROM and QSPI NOR flash.

Enable support for the serial console, EEPROM, PMIC and QSPI NOR flash.

---
Troy Mitchell (2):
      dt-bindings: riscv: spacemit: Add K3 BS01DCMA
      riscv: dts: spacemit: Add K3 BS01DCMA support

 .../devicetree/bindings/riscv/spacemit.yaml        |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts       | 266 +++++++++++++++++++++
 3 files changed, 268 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-k3-bs01dcma-467fe26c462c

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

