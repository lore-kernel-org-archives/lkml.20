Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794718616;
	b=CUFcF5Jkpxkg0M2wiPBG3EQcxtm2lOzjgOms5QpglLL6juPHFK4gjkHxnqJUzWLvZvVv
	 nzSDG4QgTfdpa6647jS5+JOw10A+JaIkddHnY2IQJLxTR+atkG5X035V8qF21Xu8JZWQr
	 ZtcmwO642sgG2oyYglkmTARA3c6aW0CwZ27HMsVhS6ya23bmjpyPOxpFB04nXUJPUd21K
	 OV9ZLfNdV3ijKAhYdeioeHG2uZ9Qbp0oD7/sXlJ62ciOOA9qpCbCJvRjqZ4HVI59rV76r
	 gvcI81aC6zkDxX0r1e0cBICkG0R0u4lCvJjOjOnztNtihtjmYnlFdP+kCQWrPn0c6EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794718616;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/fmDDtqLSG4Bq7qUyj2IQPO7WGyW7QN3QsMqxKbW2rU=;
	b=U2CIQEsVCbYZVGbxj47SQ9366KAwV3N27AfTSRCCUl9Mgcko1FXUTB3MLcUJX/BOFhu9
	 wTu3pUIy2Yl0q6lUuFVhGtb1+wVutFRi+0YgQBfooONl3EW6HXoGUI1yAgd7QW9A1hF4e
	 VWoEzUgui1bbMBikPG9c5yPpK4hyl80VSNOF4yM96wBHp7es0dnYcjRLhk42VYG0qC00V
	 NOqkZtr9I4oFjpCSiPKm8Kd9eiKMqo9m07lFlrTLk8Lcv+WXIw9LeFPePYO19C2JHE1aM
	 9lCQBNgRoq2I3OK4Fz8mahhl6CBHsYFDzCnoN5D7NXn0MfrwtuIr1khtsw835o9L3+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LIgFDQNC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB7F606A89F;
	Sun, 15 Nov 2026 04:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LIgFDQNC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FBC1F000C4;
	Sun, 15 Nov 2026 04:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794718616;
	bh=/fmDDtqLSG4Bq7qUyj2IQPO7WGyW7QN3QsMqxKbW2rU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LIgFDQNCDwCzENyuWP9mZTSbKM1WfkSuvHNEHhpLRsUPG2Yv0EO5A2E5datvG9cuL
	 j1aKD2T3wJ0ZRHoTNYC85BYEVY2yqzxKkr7Ab6AQduc6v3ZzbmnKYa+Dfl2+z18SWz
	 VWIif5+YgQ85rBGEts22Im13N0Oi80b//Q1DbV2rho4T1RcM26QzUwf4NKdo9262KG
	 1Qm8D/q9PThXUX5yZHWSKcmQ7ZCFDWszwyw61kcxD3RUUrtjbgjWqRHm9iWsEk9S6x
	 vOfRoXzyTmd5scF04OtdzBEmftkdql00HR/2Qjo3WoxUFOWWM1qlpLRZ0SsfdXfxKV
	 AHst4D/6SCRZQ==
Subject: Re: [PATCH net-next v02 3/5] hinic3: fix some checkpatchs.
From: netdev-bot+sashiko@kernel.org
To: gongfan1@huawei.com
Cc: wudi234@huawei.com, tengpeisen@huawei.com, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, andrew+netdev@lunn.ch, ioana.ciornei@nxp.com,
 maxime.chevallier@bootlin.com, mohsin.bashr@gmail.com,
 dimitri.daskalakis1@gmail.com, hramamurthy@google.com,
 larysa.zaremba@intel.com, vadim.fedorenko@linux.dev,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 zhoushuai28@huawei.com, wulike1@huawei.com
Date: Sun, 15 Nov 2026 04:56:54 +0000
Message-ID: <179471861453.2199510.9158722374869867897@kernel.org>
In-Reply-To: <a9a5d01e087f5240b514bdf878162a3f42f7291a.1794371175.git.gongfan1@huawei.com>
References: <a9a5d01e087f5240b514bdf878162a3f42f7291a.1794371175.git.gongfan1@huawei.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit "hinic3: fix some checkpatchs." changes only style,
  but it carries `Fixes: 73f37a7e1993 ("hinic3: Queue pair resource…
- [Low] The commit message is only the subject "hinic3: fix some
  checkpatchs." plus the `Fixes:` tag and sign-offs.

--

hinic3: fix some checkpatchs.

This commit renames the trxq_params parameter to q_params in
hinic3_alloc_channel_resources() and hinic3_free_channel_resources().
It also moves the return type of both functions onto its own line.
Nothing else in the code changes.

> hinic3: fix some checkpatchs.

[Severity: Low]
This isn't a bug, but the commit message has nothing besides the subject
and the tags.

It doesn't say which checkpatch warning is being fixed. The old
continuation lines were about 87 columns wide. Default checkpatch
(max_line_length=100) doesn't flag that, so only an 80 column run would
report them.

It also doesn't mention the trxq_params -> q_params rename, or that the
change has no functional effect.

Could a short description be added? checkpatch itself warns when the
commit description is missing.

> Fixes: 73f37a7e1993 ("hinic3: Queue pair resource initialization")

[Severity: Low]
Is the Fixes: tag appropriate here?

In drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c, the diff
renames trxq_params to q_params. It also re-wraps the signatures of
hinic3_alloc_channel_resources() and hinic3_free_channel_resources().

No expressions, calls, ordering or error paths change. The callers are
untouched, and the generated code should be the same.

Commit 73f37a7e1993 did add these functions, but this patch doesn't fix
a bug in them.

The other patches in this series are fixes aimed at net. Examples are
"hinic3: Solve an stall issue in hinic3_rx_poll()" and "hinic3: Avoid
concurrent updates on 32-bit systems.".

With the tag, could this cosmetic change be taken into net? Could stable
or AUTOSEL then pick it up for every tree that contains 73f37a7e1993?

Would it be better to drop this patch from the fix series, or to resend
it to net-next without the Fixes: tag?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794371175.git.gongfan1%40huawei.com
