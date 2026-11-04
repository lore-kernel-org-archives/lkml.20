Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830089;
	b=kvc2gqzdwv2pn5IFROBzljDXLdjzG8cMFYc7DM73NAtoe/UXl29KkaiwmxBr7jikKdEa
	 Q14dQzW+D4BWerPa9ZSPWounAiisavMukRu/lo659OUQgyiPV8ck8jy1nNsg3lTPE4/sU
	 A89BD4DueWwQp5N1i1iZHLdpcyp0+zaNqF68u08S+7wjwTxSRfh9kWZE4sbHgTJDcfbG5
	 oYmHjtczeuQHzmjm79TmvOqt3jFCP/QizLJulVGxAUO4AoyDeKM8UExyEmqOZ2AkKVE9c
	 m941Z8hllEkD5tGsADb9kWQ0POGDoXFrP5Ds6VtyDB7cbOX1koLeBp/xOE67BaaKHmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830089;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=uPpZHIHN2f+krnoJTSXhizzaZXUBHGCxVWnErBLk0sw=;
	b=v6DOTqLZNpLt6PZcUuDIKUd52rB0mRj4pbb5jIsc2DCUIXUG74I9Ds5P9YuzflWewvaE
	 5ZRFvRfsqCSqb7fcSjmt7A2LkugeIQ6GcN1X946f7lbCyLaSxD1vMq3E05o4DBTrHUbY4
	 vy/+Lc2tjfRIWgW7NLrKJGL2LDu04WjdktRAprikRHgpbrWlQVu0d51Ol8qNXTqJDro9x
	 H7rx9o09HndP1/NRo3op6Lluzab8oc9Bpg+q0sodxcFFMrz3yiVhf+9Q7Th7PnOvbGt10
	 AqKtcL/0ytGlwa98uhSODZcnH0Aw8mJMVusmgDTx+RMiThyZnd3GXKxxEbL8j2QUyUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SyA6t0X5;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4B4606E83B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA4B4606E83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SyA6t0X5
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id OiicxEALnJFmFOj9GxVGDd; Wed, 04 Nov 2026 22:08:02 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Oj9FxFGx7btpUOj9FxeOYZ; Wed, 04 Nov 2026 22:08:01 +0000
X-Authority-Analysis: v=2.4 cv=dIqmmPZb c=1 sm=1 tr=0 ts=6aebacc2
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=mpaa-ttXAAAA:8
 a=AhJusznchYkEs9MMiQMA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uPpZHIHN2f+krnoJTSXhizzaZXUBHGCxVWnErBLk0sw=; b=SyA6t0X5HCcBfATZNI8Kbb4ksm
	hTB7osa3MOtNNirjIdy8uJ8HAWGaphLEybiIZNPeTBj+JeVI80v8EElmkTd4hWBuPa/Z3+pl5092+
	g1k8ogbs00esl5aa6vfujqZm05BPnNOXAYmYbS6FjwVyliDV9z2cyOaHG4eoufGv3F7acBqjphECZ
	a83clvz33UqYtmcmVN1kGQ5M1xWyCr2hbVp50kXGgewihE3mWC+1JybQabLER4T44tNtuEGUblraT
	lHRp8qKk/AeTvLQK/pMznIjGWDG3GjfQaHKI0mbyQQ+eTJPQwxlS6gFmQctKCwhoIFmA/PrMwIFA4
	RISQ6J5g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36806 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOj9E-00000000ul0-2R7W;
	Thu, 05 Nov 2026 03:38:00 +0530
Date: Wed, 4 Nov 2026 14:07:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Zexin Wang <ot_zexin.wang@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	light.chen@mediatek.com, Fred-WY.Chen@mediatek.com,
	Yt.Hsieh@mediatek.com, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] watchdog: sbsa_gwdt: Limit the MediaTek WS0 race
 workaround to revision 0
Message-ID: <055e6366-83db-435d-af3f-4168a822a870@roeck-us.net>
References: <20261104083714.3026535-1-ot_zexin.wang@mediatek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104083714.3026535-1-ot_zexin.wang@mediatek.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOj9E-00000000ul0-2R7W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:36806
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPvgqtqWtKAwL3T/7zZMsWFLLPsst23sWwXAFDynRzNKSlFn3rJkc7aZAD6Ze+qJhoi7Z4SqmkGeCRbOjtgBTwu5yoptLIyHJbTWI9+QSM/OjyoyZ2M1
 RymkW8Mq+KzDgJL8ophkJwQQeZvNic88f7Di8qr0cTTS5os811dVf12MAQNWu/AtCi7F9V+YyyuTdQRqT29Czc9Uwa3VZR+cX6Ql9XSeks+9QGIZ8ky+Re5R

On Wed, Nov 04, 2026 at 04:37:02PM +0800, Zexin Wang wrote:
> The WS0 race workaround is currently enabled for all MediaTek SBSA
> Generic Watchdog revisions in single-stage mode. However, only
> revision 0 is affected by the race condition.
> 
> Read the revision field from W_IIDR and enable the workaround only for
> MediaTek watchdogs with revision 0 in single-stage mode. This avoids
> unnecessarily restricting the minimum timeout and adjusting the
> keepalive interval on unaffected revisions.
> 
> Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>

Applied.

Thanks,
Guenter
