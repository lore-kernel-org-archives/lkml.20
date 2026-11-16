Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816689;
	b=b7jHqcdCsiloz5B5iPauO91H/JuNFA7XZYK5zIDoJ/KJSRiS8Uo6Vlhiaz9QntDXuqLU
	 OPjjQKYgyXuiIT/dUg39KIV9YEJ3jjZPYMLFvzFT4H0unvqJCIMI4JYbJXvT28MCeu3oS
	 5yDdHsldcd21If/vRvlSMJd4Qk2xgtRqyZPpdvzShe/rzPlXseLwyw5GyziXBFBN+uUU+
	 Bvj31M38gplKiBYPdMm21ZzUPRapDwWASjiC1gj7MgIFiKUSC2AB8MMOXjKin+Grdcwfv
	 M2wCnuksoFZq6WbBvivMAXSbQR1hqpPcAT5Iv2NVDUrqPJu/jyfj3QbGt0nXQKv3+Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816689;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Message-Id:Received:
	 Received:X-Zmail-TransId:X-Mailer:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-MSS:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=4ZbHinStsFZ2Q0ZKVd8XlqOpxpEfGc64bTkAA6bl380=;
	b=RUMS8fqlcHRkq4V+j6JRu33N+VpjTIPBEr/abAFp7CGEQ+bElRe5JYTjHNEzSFEkEaB5
	 Pmst21DaHzklz1OsGhz1XVR2lu+bYRZdOQH+vESpCwjxewI1XgsN3NcE/ppv2okHfPGqB
	 5HRnE5nT5f+cmmxwFR2pZKURQCG9c53Lw9jP7X6JsDXZc9MXFuN+0pqJSCX5mNKUvVbT/
	 q0ALB5t4jfNjLRkHmDI0RGkM0geSD2PDfChBNwwk3B31O3mSBSqcGk5Zn+M4TS/MzHzIl
	 2vAmpMxseinH28nMIPuVCARAljZZb/iDFUJG/Kq4ujbUQMdu4/6ICJJTu8IkSnbl/jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=J84VIi6F;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661D3606A337;
	Mon, 16 Nov 2026 08:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661D3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=J84VIi6F
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jSgY84f55z5B17r;
	Mon, 16 Nov 2026 16:11:08 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794816668;
	bh=tShg1f4Y0wrs6aXeclAtYsoXU3BahhonJla1y2uT88I=;
	h=Date:From:To:Cc:Subject;
	b=J84VIi6FmFOR6u6bpGLFQm6JZLhUQO3j2ScdwfLoGZnMBiWnES4LMo0TJCtKEKXZG
	 3LQf2RVd2O2qDt+Mt4lUDrsGGy8VPVpHw01diQM65voEO1N0KQSZcd5RQLk1TcRF4n
	 dPfcgbCklfFkCmZKuX7g5ANwtq7oijcZxalbuO0Ch5X9QNXmeTeSjs2CRccmgnjtwt
	 iQK35gl9eR3chfbLiFIeqUqkqq/sh0lcI/KL0L4EHgIkf90zTmsD5bly03XVq7sF+5
	 64qF1/ep35z0bQ5R91dgLo+Awg53BTleK4ZxItSoFKnZJnd4KR5vkduqiVUyOJmW0I
	 C8sZ1ekO21fMA==
Received: (from root@localhost)
	by mse-db.zte.com.cn id 6AG8B8QM046993;
	Mon, 16 Nov 2026 16:11:08 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Message-Id: <202611160811.6AG8B8QM046993@mse-db.zte.com.cn>
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl2.zte.com.cn with SMTP id 6AG838vr028538;
	Mon, 16 Nov 2026 16:03:08 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Received: from mapi (szxl2zmapp05[null])
	by mapi (Zmail) with MAPI id mid16;
	Mon, 16 Nov 2026 16:03:10 +0800 (CST)
X-Zmail-TransId: 2b076afab8be597-cd7d6
X-Mailer: Zmail v1.0
Date: Mon, 16 Nov 2026 16:03:10 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <lv.yating@zte.com.cn>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
        <rdunlap@infradead.org>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <liu.qingtao2@zte.com.cn>, <he.yilin@zte.com.cn>,
        <ye.zhihao1@zte.com.cn>, <zhang.cheng35@zte.com.cn>,
        <hu.shengming@zte.com.cn>, <lv.yating@zte.com.cn>,
        <linux-doc@vger.kernel.org>, <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIFJFU0VORCAwLzJdIHJpc2N2OiBBZGQgQmVpamluZyBMZWFwUmlzZSBUZWNobm9sb2d5IHZlbmRvciBJRCBhbmQgdmVuZG9yIGV4dGVuc2lvbiBmcmFtZXdvcms=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-db.zte.com.cn 6AG8B8QM046993
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-TLS: YES
X-ENVELOPE-SENDER: lv.yating@zte.com.cn
X-SOURCE-IP: 10.5.228.131 unknown Mon, 16 Nov 2026 16:11:08 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFABA9C.000/4jSgY84f55z5B17r

From: Lv Yating <lv.yating@zte.com.cn>

Hi,

Beijing LeapRise Technology has been assigned a JEDEC manufacturer
identity, encoded as 0x966 in the mvendorid CSR per the JEP106
scheme (bank 0x12, final byte 0x66).

This series lays the kernel groundwork for LeapRise RISC-V cores:

Patch 1 adds the vendor ID constant (LEAPRISE_VENDOR_ID) to the
RISC-V vendor list.

Patch 2 adds the vendor extension framework support: hwprobe key
recognition (RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0) and an empty
extension probe list hooked into the common probing path. The key
reports an empty bitmask for now, allowing userspace to distinguish
it from unknown keys (reported as -1), so LeapRise userspace
libraries can be prepared ahead of the first hardware shipping
vendor extensions. The key is documented in
Documentation/arch/riscv/hwprobe.rst.

Follow-up patches will register extensions as their specifications
are finalized.

best regards,
Lv Yating

Lv Yating (2):
  riscv: Add LeapRise Technology to the vendor list
  riscv: hwprobe: Add LeapRise vendor extension framework support

 Documentation/arch/riscv/hwprobe.rst          |  4 ++++
 arch/riscv/Kconfig.vendor                     | 14 +++++++++++++
 arch/riscv/include/asm/hwprobe.h              |  1 +
 .../include/asm/vendor_extensions/leaprise.h  | 11 ++++++++++
 .../asm/vendor_extensions/leaprise_hwprobe.h  | 20 +++++++++++++++++++
 arch/riscv/include/asm/vendorid_list.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/include/uapi/asm/vendor/leaprise.h |  3 +++
 arch/riscv/kernel/sys_hwprobe.c               |  4 ++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  2 ++
 .../riscv/kernel/vendor_extensions/leaprise.c |  7 +++++++
 .../vendor_extensions/leaprise_hwprobe.c      | 18 +++++++++++++++++
 12 files changed, 86 insertions(+)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/leaprise.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/leaprise.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/leaprise.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c

-- 
2.27.0
