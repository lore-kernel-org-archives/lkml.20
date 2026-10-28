Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189068;
	b=cBj3+j1yASR2BBq5V2OArc0uDapZEM+iKyAZy9Epjw1bcdYPXs0b1k5rvZYYn8GzeSJ0
	 PZHNgVuKUhJA0ENqwINj1ApnpeMGsVqNX4xBzU+4Kvke9cIplem7/OXNFQ/SDBgs0w+08
	 WjhiLRVdg/Xcws87x32T/88LUgvEJVkOjeUAAavxc9VLQ2JS9a0n48qsYNzI7LXWuAOA+
	 9NY+btPbdhMPgnl/ld3FBrcxDd0xBhyOsib2m5h6+jgWgRSg1g3FiH91sWtEb9m5ZKCHM
	 JuS2OMlvxvsyGyggYHV+/EbIpGhzmdQm1gTvjPHbLjuR0DeSmUq3ivYoyhOYDguHbMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189068;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=+mIiS0rCDtmZSjPzsf+g5DSNjmJfGirhpYUlV0xKhHg=;
	b=UoZK4FvR72itWJBvcexAbG1ZLy1kBRG+JNn3KJrukrB1EgTLyk2Mg3lTJ49bV3I1eoyK
	 OIh6953woYtbh4/hpTmwY/HTrAdmxOSyQr1kfjOgMJCJSDtK/wpYaXhTzdDox5rCb6Xtw
	 2kinK78qpi0TBCxOMXAg6odlnLisivKXwvfZQfrn8HMxCk8jt77peab1S+ZGQdRCXzulr
	 yV4CSsvDQDdGls3y9fF9KV87exGC4alIEdZLKuuCwxUSDe4hlFnAbnGcjE103KBMVtXiF
	 AjYspnye5Uo8j2tRfl1B5WAujeMg/CJ5HMeukcKhMCL4cmuZAKhRARJ/jeBQ8490hKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ZCLoiELm;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F09606A324;
	Wed, 28 Oct 2026 12:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36F09606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ZCLoiELm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=+mIiS0rCDtmZSjPzsf+g5DSNjmJfGirhpY
	UlV0xKhHg=; b=ZCLoiELmACSZTKzrRBSmhq4XA7KzIzseLtW5/oDgMmLvR/OxPH
	XyUhkvzzHhppE899R1BZxPkhQoDZ5bohZrQC1yPct7tg2t3z7GhNBMJHtQ3US7Yf
	+K1K3iNghj5SawK9Gd4ojpiq0QMrYxr+ir9juAjrM/9mLbsvHr0I8sv5Q=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.180.23])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBX40fH5OFq19ZYAA--.868S2;
	Wed, 28 Oct 2026 20:04:23 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: regulator: add Will Semiconductor WL2868C PMIC
Date: Wed, 28 Oct 2026 20:04:23 +0800
Message-ID: <20261028120423.99034-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c8e6c0e7-397c-4692-a478-d9778b312886@kernel.org>
References: <20261027051055.213301-1-xiaqinghuan@mail.ustc.edu.cn> <c8e6c0e7-397c-4692-a478-d9778b312886@kernel.org>
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
X-CM-TRANSID:3pYKCgBX40fH5OFq19ZYAA--.868S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWUCF4fZr17ZFWUuFW3Wrg_yoW8Ww45pF
	4DKrnxJrsxAr1FvwsrZw4xta4F9wn5Ja45ZFyY9r40v3W5XFyFgF9aga1a9a4UCFn5G3Wa
	qr90kryFkFWDCa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyT
	uYvjxUgZmRDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2rg+9ZksQAIsj

On Tue, Oct 27, 2026 at 07:04:55PM +0100, Krzysztof Kozlowski wrote:
> Looks like broken patch. Please use git or b4 to generate patches.

You are right, and I found what happened.  The patch was not produced by
git format-patch on a commit: the diffstat was typed into the commit
message body, so the mail carried two of them - one pasted directly under
the Signed-off-by (no blank line), and one appended by format-patch.  I
reproduced it locally by git am'ing the sent patch onto pristine 7.3-rc7
and reading back the resulting commit message, which contains the pasted
stat.

The v2 I am sending right after this mail is a real commit in a pristine
7.3-rc7 worktree exported with git format-patch, so the body has exactly
one diffstat.  The diff itself was never the problem - git apply --check
passed all along, which is why my local checkpatch run did not catch it.

> Anyway, where is any user of this? Why do we want this binding?

The user is the camera stack on the Lenovo Legion Tab (TB322FC), an SM8750
tablet.  The WL2868C sits on i2c10 at 0x2f and feeds both camera sensors:

  - rear sensor:  dovdd <- ldo7, dvdd <- ldo1, avdd <- ldo4
  - front sensor: dovdd <- ldo7, dvdd <- ldo2, avdd <- ldo3

and ldo5 supplies the VCM actuator.  These are the *-supply references
in the board DTS; without a binding for the PMIC they dangle, so the
camera nodes cannot be described at all.  The regulator driver itself is a
separate patch I will send to the regulator list - I held it back so this
binding could be reviewed on its own, but that left the binding looking
like it had no consumer, which is a fair objection and I have now put the
consumer information into the commit message.

Sorry for the noise.

Qianhui

