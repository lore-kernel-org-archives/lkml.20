Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329710;
	b=p0c2ZQvMrv5q+g2Xz8xq470SwNdKUYclZdZrl0l9Tqi1BUwUbVqaayNKmHHVdR6IBlgx
	 oDPZ3oeu3KZEpxrpbhYReN53MGSHN0Z47wq12BmRdIEu0kZ8VMT7cYtbNMoc+G/nPgZLd
	 ryrh+AcucN/07mMpNIICGWei5eIQFaJK4FUzFEvYSdLZncvflLZCm42KEmylJAPcYIO5D
	 lEHv7U9u1UQ+r7l57KBrS7u6blwUB1c5EhwamV6LszM7q5vlzkhfXvctw4cdyeGBqVe6/
	 zTYoFw9+mb+6loZmJnWWbZlwzCvYhmtqkMpV1rZqrDBlc2s8d4nRc1HCo4lMAaq6gNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329710;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=+p5LsXOQnB/59+iK7tE/PH15gIGyp3rLq42QFenYeJw=;
	b=j1f68ZBvZ7jnkWZ2HAfvDXq23v0WG/qXby2psKnSntDu0F1fep3GYz/fKsdACu77AMOb
	 wOv1367ZlLXlXlFPLz6ZY7UApwlkyPP9NXpaWRgKDhoKP9PvDA+SGzkVm8CQlYCZv9von
	 cBQWAWZLS7ckeL5LTN0FNk3INJ9MlCXLvS4BrC7JP4qWkgJigEk8xUKEfBtOs8d3QjSRW
	 h4HDGD1DiloojOrs0S2/H/1v+cTpGcIRSY3M/r9f+YkeYmajeCBQW53Uyc6zA10EaOeva
	 kcL809LWEpog7kIrqnsqusXW0Sd5VkLhKrLrpu5EAusyS3oYF5cZQkuqjj7IXHEWVdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE0D606D214
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE0D606D214
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMDWnmpiTPNqQ68vAA--.40291S2;
	Wed, 11 Nov 2026 00:54:58 +0800 (CST)
Received: from 51f0e866aafc.ntu.edu.sg (unknown [155.69.197.24])
	by gateway (Coremail) with SMTP id _____wBHQDdZTPNqhKI0AA--.54723S2;
	Wed, 11 Nov 2026 00:54:55 +0800 (CST)
From: Suyuan Wang <stevewong@hust.edu.cn>
To: iwona.winiarska@intel.com
Cc: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	joel@jms.id.au,
	gregkh@linuxfoundation.org,
	Suyuan Wang <stevewong@hust.edu.cn>
Subject: [PATCH 0/2] peci: Fix two use-after-free bugs in device teardown
Date: Tue, 10 Nov 2026 16:54:47 +0000
Message-Id: <20261110165449.1996921-1-stevewong@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:IAEQrMDWnmpiTPNqQ68vAA--.40291S2
Authentication-Results: app1; spf=neutral smtp.mail=stevewong@hust.edu
	.cn;
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4xJr4DGw1kZr4xCr1rWFg_yoWktrb_ur
	W2krykAwn5GFnavasIkr1rZry3AF48Z3yftFZ5tF48A3yFqr98Xr4DZrWavr10v395ur1D
	Ary5ZrWfZwnrKjkaLaAFLSUrUUUU5b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbPxYjsxI4VWkCwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2
	z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI
	0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAq
	x4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r4UJVWxJr1lYx0E74AGY7
	Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j
	6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxkIecxEwVCm-wCF04k20x
	vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jSNtsUUUUU=
X-CM-SenderInfo: jxsqimirwzmmo6kx23oohg3hdfq/


Hi,

A static analysis run over the PECI core turned up two places where a
struct device is still used after the reference keeping it alive may
be gone. I went through both by hand on next-20261109.

The first one is in unregister_controller(), which reads the fwnode
and disables runtime PM after device_unregister() has normally already
freed the controller. The second one is in the sysfs "remove" handler:
it doesn't hold a reference across device_remove_file_self() and
peci_device_destroy(), so the device can be freed under it, either by
its own device_unregister() or by a controller removal running at the
same time. For that one I followed what SCSI does in
sdev_store_delete().

Both are compile tested only, since I don't have PECI hardware. If
anyone with an AST2600 or NPCM BMC could give them a quick run, that
would be great.

Thanks,
Suyuan

Suyuan Wang (2):
  peci: Fix use-after-free in unregister_controller()
  peci: Fix use-after-free in remove_store()

 drivers/peci/core.c  |  8 +++++---
 drivers/peci/sysfs.c | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 4 deletions(-)


base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.34.1

