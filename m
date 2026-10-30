Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340080;
	b=Jed9vN/D2vQrIzc+Rp732G1m8zoQUoXt6zoDccxGlTSIqE+v+49OmTt//dAELn05j8Al
	 nbxTgDlcDZRgMJn7MlWywP0y6Sqrb94jfaK25tgqGNozmn6521UgW/SW83JeerDpFjhE0
	 ar+tl7sB9D3CIcbZixLkjt1XElqVUkFY++hzIpGC9uR16gJ86LujqLLbsuMi+xFcanX4c
	 h0CVWRvij/PFN7PmP5loValXoCW1vJQx8Kn2tE+gKYcwjEfRA6VvpWqFwKC8CQc7zOOc9
	 MHK+X11GNRAilQOJWRdM+hbD7DIS3srpLrp5U+4INeAgIyT9g1ZtDb7w4oclNbt3pqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340080;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=/0wABQplNRq1vMon05+F+g46Efn36e5OhWzbuktaEkU=;
	b=qFpaXp0gZnSvXF9G/weM7pvKMjrjpISYfw4IiRgvEW386aS0V96Cw8+ZRjonBlPtECQ3
	 12YNLtiUcdDW+WqqaaGaKZ6SEuQ6dl5k1sjY8gvVZdclM7jCso9T+0XCOJCWs7jHbnyZe
	 /M0zOG+8v5Gt+F/v7PndNuGNKNL6nXYrCCkOmcux5Pi5yjkzVRmPYc5Byut6PfBW98qYr
	 yPFSTRl3QWZ+MYl2qpfKVC+GhxTCa5E6E/VzEBGYykt83bxISpAqwKIR7LC3ZiNnLyaR1
	 zjx5m5MY6raAH7SWUYLwD9/pJ0rj0refStNCS8e0q3/qND7N5mQm/ZCpoaBVgWDsPHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A27606A322;
	Fri, 30 Oct 2026 06:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05A27606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:MIME-Version:
	Content-Transfer-Encoding; bh=/0wABQplNRq1vMon05+F+g46Efn36e5OhW
	zbuktaEkU=; b=diBTEYAdDgrQFNTn9zApygJDwmZMAyq6MM348of9+mu0hAOk1f
	Y9WdWmpipfK7l97DO7gzgUtZ3/Y/3iVoHRkAAF6ro73gcXzNb1te9sTwVhDYZbWZ
	kDa3zCi9vjTlcPLdQ2J5M1YNyhSF8JdpS7lqvecv2VuoCVmDjX0GRHDY4=
Received: from localhost.localdomain (unknown [223.160.172.89])
	by hzbj-edu-front-2.icoremail.net (Coremail) with UTF8SMTPA id BLQMCkBGif6nMuRqk1MHAQ--.30038S2;
	Fri, 30 Oct 2026 14:01:12 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	David =?utf-8?q?H=C3=A4rdeman?= <david@hardeman.nu>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2] media: rc: fix use-after-free of rc_map.name on
 register error path
Date: Fri, 30 Oct 2026 14:00:57 +0800
Message-ID: <20261030.pref-04.ec83d43911ee476d@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261027021718.14264-1-25031212351@stu.xidian.edu.cn>
References: <20261027014144.9144-1-25031212351@stu.xidian.edu.cn>
 <20261027021718.14264-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset="utf-8"
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
X-CM-TRANSID:BLQMCkBGif6nMuRqk1MHAQ--.30038S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XrWxArW8AF15Gw4DXFWfGrg_yoWxuwcEk3
	y8GryF9wn5Cr4fCw18KFsFvr4q9FW8Kr9ayr10gryay340vFsF9Fs3uF1FqwnFq3Z7XF4k
	XFsxAwnxXry7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-xYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8I
	j28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF
	1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxG
	rwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxU4y89DUUUU
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUCD2rjY8F8yQABsV

Hi Mauro,

I am copying this address for visibility.

  [PATCH v2] media: rc: fix use-after-free of rc_map.name on register
  error path

The remaining issue is a uevent racing with keymap cleanup while
registered is still true. The proposed approach is to clear registered
before freeing the keymap.

The follow-up linked below describes the remaining issue and the changes
needed for the current tree. I'd appreciate your feedback on the
proposed approach.

Discussion:
https://lore.kernel.org/r/20261027021718.14264-1-25031212351@stu.xidian.edu.cn

Original submission:
https://lore.kernel.org/r/20261027014144.9144-1-25031212351@stu.xidian.edu.cn

Thanks,
YuanZhe

