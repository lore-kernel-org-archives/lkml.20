Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371239;
	b=xSH7kCiEoSpq16h2IuNU8LIHnz1QJUHNCPzmCHCqoV5rX349kuFoe2KOukdvMERfan/x
	 uJwEp8hWiGl2cgB0tu3/PB4P0/L96k1JEiapr1QdCGYdPHR3d+6LpO/mPeRU7mW7ooy5a
	 MLQl1lo9gnb2icrrMJ5Wn13GPQ1c/05WBlwalOtscYZ7qhe4Ui2SRMZHokBuT8mFlIy9H
	 f324rKRnn0LMFYJfKrjspePiCpwSIGEAOVFhcXTChPME0esH/MKJ5Y9OCNJXFamgc5aJF
	 jG8G/mD7y8yqUaMVlFVldvR2UlEs0Xj6X4VjLhtYRi5Tm3hlhEZu2h55BP0LE6CT4/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371239;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=teh1xlXsx1Mj02Z3mta+x5vLotB3TB7zFvCFKh59hgI=;
	b=iSyXBPfh/8zFlU1AbzoOgjyDpBZ3XyZ7DSLmDPzOPNDJkjWpa3RjYF1EKMSyOsD7KEVw
	 NzW7475rTClTa1I7pZK2HfTg7RcohGLjztxgOt4erQBTrPdbc8rDv/i5ZQJp8MF5XvDE3
	 xsDdyBtAp7lP+ZHVXsPvAR71quuv4ntMN6Cj73h3BC4H/eCVXXzlGm/RQdiSKcwH/8i/M
	 6Q/cClI1VOFQ/QTMqxOGqhltMWpzboJCb5UooVkvFcG70iVq0wc7G4ayG29QBhlxtXjrO
	 mE0duEAm2oLuvaft2UOvA/0p9tw55mJq2ZOzV1hSqVI8EQymVH87kYo8pGkYWFSi45g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237BB60A2611;
	Wed, 11 Nov 2026 04:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 237BB60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=teh1xlXsx1Mj02Z3mta+x5vLotB3TB7zFv
	CFKh59hgI=; b=J/IO5lPZP1Iyb/v+gDcuPnYrZWrH/u23ElNpXm5S33/gxkbwPf
	TrVg7Sz0qSh7fAde7IwhY+8Nn4uhT2jplwRio9KBkyT4x/19N17/QcWMQ0Vitl/H
	XOT5zwMynQjljwwirvFebQIOIONKv0ddbW5zb6dSn+DI4hq2cAZdKgGL4=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.33])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkAmRfuX7vNq1x5zAQ--.13394S2;
	Wed, 11 Nov 2026 12:27:05 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] usb: usbfs: Require claiming a hub interface for hub class requests
Date: Wed, 11 Nov 2026 12:27:03 +0800
Message-Id: <20261111042703.4784-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106105056.4601f826.michal.pecio@gmail.com>
References: <0aa5c25e-465f-4168-8833-387acced222f@rowland.harvard.edu> <20261106091048.4056-1-25031212351@stu.xidian.edu.cn> <20261106105056.4601f826.michal.pecio@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BrQMCkAmRfuX7vNq1x5zAQ--.13394S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4rKw4kGr48Gr4ftFyfCrg_yoW8GrW7pa
	yrtFZrtrn8CrWUur47tF48CFyrZrsrCFs8Zrn8Aws8urW5ArWFqFyfK3y3CFWUArZ5ZFsI
	yrWjgr93Ga4qyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9vb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r
	17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vI
	r41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0zVbDUUUUU==
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAQUOD2rzM1aSBwABst

Hi Michal,

> Does this really belong in devio.c?
>
> If anyone thinks that the trivial "bDeviceClass == USB_CLASS_HUB" isn't
> enough (Alan seemed to believe that it is, but hub_id_table has matches
> for interface class too), then perhaps this should be placed in hub.c
> near the ID table, so that it's more likely to be kept in sync?

> Seems overly specific to this case.  It isn't safe in general: it could
> confuse the hub driver itself, disrupt functioning of child devices and
> their drivers, or break HCDs relying on core serializing any actions.

Both fair.

I'll fix the comment.  The general reason for the check is that OUT
requests change state the hub driver owns: they can confuse the hub
driver, disrupt the devices behind the ports and their drivers, or
break an HCD that expects the core to serialize; the suspend/release
race is one way that goes wrong, not the reason for the check.

On placement, the simplest answer may be to drop the interface class
test altogether.  Alan already said it is more than is needed, and the
spec does not allow a hub to be a composite device, so bDeviceClass is
enough and there is no helper left to place.  I kept the interface
match only because hub_id_table has one.  If you would rather keep it
for hubs that declare the class at the interface level, then hub.c next
to hub_id_table is the right home and I will move it there.

YuanZhe

