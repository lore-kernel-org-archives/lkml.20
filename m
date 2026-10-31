Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793471806;
	b=NtiHLBdSAiUfr3Rac7cR/SbRdFl14fKRoYoESVjoZCWGDKCNFBHJDF1+Ao/tLBrLD19J
	 gUpOqxbICCL26/M0hvBFKgSOBHGNRb2J+IW//jKp/+3ixi/R20xgEo4NH6XCFS/NMFAbz
	 UY7RkISS/9aRs6XQtEZuyd2c1it1nPTS3ibgmAcrMrFJ4yVkkb2px5Ady1K79y+lGUjTr
	 VlBGiWkX2te1qDXD7z6gVCOqf7nqXkZ1pdSWatrUN9FWC8lvlLvIv1Syo5tXQ6OegMBW2
	 GALwuTGaKaPCwOwvBuN82IRq34aZUK8uZGUBDs+SScDHOgtzIDNulwxn7UcxcOMK7sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793471806;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6nzAVwFzrriiPAkOBNvkvTODQ7DAYj7j6hOeNHJihso=;
	b=RbnmL9YK5LYyu5JLXby/3mG5U1eufyHqD6nrqrlQx/IQvOQlZe8+c5MSTG4atxpHYlvQ
	 EDLjPrNKmsVbzlbMsWSi9y22Hg5m20Cp6KK0SMsom5a24NjZB7b7dutiOMCXskD14HEGR
	 jn5gAR4gErrVKOrfkkl5iemkTVW8ke8yEfrXrNQpZ4iwcQqDuQ6TAMhjVmBiQgh8QbCrc
	 CWRkaT5D9qo0ZIX7YE/xiyEY8f300/sEeA0sV+Jb+l7eyTfE/qqyFElrzIPlR/m3/6NPc
	 HG3147KztMBYYNd6jSB6wIeR3iydddJAQcdiyJTnZQYN+WsGZDwIUFp1KkWEJldIGcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=g6+ioPth;
	arc=none smtp.remote-ip=43.163.128.47
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.47])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D7B606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7D7B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=g6+ioPth
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793471790; bh=6nzAVwFzrriiPAkOBNvkvTODQ7DAYj7j6hOeNHJihso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g6+ioPth9/Ch5VVkZD9fDOIoMHGcnPKceN37F/9KmVKD3xCXsa1cJlVb1Yd+rGAx8
	 quKW0JNOmrXqvKQ3xmUpgm+mz/Z3I1Legky5tscP7uVCxg/MItF+NtjPvmw3WYyB7M
	 Y9genKZ9Dj/dNXrslO6NQvH2OZy0GirTaFWhuITM=
Received: from kernel-lab.tail5e91bb.ts.net ([2409:8950:57d:63:6833:326:ef1e:ba71])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 91B946ED; Sun, 01 Nov 2026 02:36:27 +0800
X-QQ-mid: xmsmtpt1793471787taxbxfhij
Message-ID: <tencent_49563D9E7F44599779272CFF719F54418F08@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25Gtq/EWKSesU26xD36uVauzBeVFPnWMnWv/iRjbKWL1KrzocJ/nQ
	 nell1/cXYisi/mj9LVuBVdp0xUjF9BL9Qlz+ZPm6TjMTjbxyloMUSmLo3om4nJPc5RgYItbmEuaF
	 8CCCc3P4X6xMTHGcn2zG95voma0otrqVhzoDISRaMeTfstS0BuhaimEbKk/hj/mqDse4KwsduBUi
	 xKRyzXewW8GkeW+EFjE9oj+uYV1OceGMuExFycyXii2p6xm05CDg1KiMsDKRHsIJrSje2RjH9cLL
	 q/LMwHUwXSoQD4GZenHOGDuJhEpbJGvIWfehPgKKcpyrJL4zM4vdAJJYpbQTa9SMB9DSieslRKY9
	 +8Q95sPG1Dc+nxazVVYPoYVuXKV4+fJRU0NR3XtzC2Sat6yn3IG4HFB7wrwjD16sCQI+0aQD/WV5
	 VQpS32jW2x7rELn1OGlVKToEBh8Is/ATmK3ggI6rN+ftVwKxuEAsbBad6o7k6qeaasfBazogjUeR
	 Glv6N1ftAYazUDkB662XtvbcQ4Nt0reO9O3+iIEnM9EYA03msxhfuHoQGaz7VcCfjG4T+74bklt1
	 PJDo22ZnZ0QYBrA7AsQJ/QyZiLFgyLhrsTycQgbBmak93aDzs2UsUukU1oQCtjSUywiHS0fBvU4n
	 ACQLN7xmVO9aQeEae7P7HE5umNWVC++kK+8uH8NGx1U4TpyrQAaR4QrUW1eyiAUNUB0Iz3q9zfSE
	 A/WDvaiOqpo6yJnovBH2tJLZX+iwp/hYhc0iml4wiJ7dXeG/LvYOUbhf6dc1+cFE+Spx8Z2wX/m8
	 zaOw1d8piMbOC0ILTJJE9Mpt0f5zpq/2DOShgOm+mp5Nf8aavS0g7GJi+Uv4mInSlIS29Xp2IuHV
	 KdAmdDirFmKgs8PyLiqFAhfFkJ+XLQm/sluFue21QocFFNRMGunHzuZF2MOS4CDGac8FUlfVAyv4
	 LSxUSAhND6aCIfLFPVQQmTgpzXNzmMK9iGJqnHu2MVCVTV7lyVrnm7fYp49v/kLWyLVBnt3RESaZ
	 k3Ih6SJxMh+gDzDvEO9uuiZRJu8tjr9c/227G/oNI8BpvCg1uOzL8rnorRu9oOvJ0dleE8/aibj2
	 2BZickih197+IytAEw1A5hshGdMQ==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Yingjie Wang <1075151112@qq.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alex Henrie <alexhenrie24@gmail.com>,
	linux-kernel@vger.kernel.org,
	yana06070@163.com
Subject: Re: [PATCH net v3] ipv6: reject wrapped temporary address preferred lifetimes
Date: Sun,  1 Nov 2026 02:36:27 +0800
X-OQ-MSGID: <20261031183627.3756897-1-1075151112@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179344707641.114606.12665582704521593779@cmss.chinamobile.com>
References: <tencent_C2E4FE9B7C0A05615861782611715EAA9C0A@qq.com> <tencent_7A270291DDE5CD89DAFFE8A745D094D5BD06@qq.com> <179344707641.114606.12665582704521593779@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Xia,

Agreed, this is separate from the wrapped or truncated lifetime handled
by this patch. In the case you describe, the stored preferred lifetime
does not wrap, so the new check is not intended to reject it.

I have not tested that case or established whether the repeated
regeneration is intended. Thanks for the detailed analysis.

Thanks,
Yingjie

