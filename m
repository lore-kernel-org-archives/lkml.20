Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793661968;
	b=ccZ/fYAneUVQLUoxWxjh2HuqWe+zPI6U94QVqdlTtmCOUmnG1wOx1jqaoWc70VlhxyVT
	 P+AHq3CWSIAqOPVVnOymaLfHys+yegIkUqBknaWLg6F1z7ouSG6+XG5JI/OzMKUMCnos2
	 z3eEg5uX7SSpV/grGft+0kEWtmPLqgWo0gF05BBw51ow7hG7i+Y1HZ6SVmvQgnvnWNeIb
	 9MINKm9bquLe6KgL+iFW42RiIPYmVllm+r8roCVtCPo5YzT3KIxiuTkoUDwIo58sEkQMK
	 DTSW+xzM0Pp8GPuAcupk+Bgl88LjLMal3n+3cDIjuCX3ykO2rLKhA+VS9Nm+9ESWOnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661968;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1Ceh5hEkP+PMTYLmRWYJaMlOvd65D0wF1ivMzQFkRg0=;
	b=0Z1pcuqqzh8PopPijb9wI5/2MBrUDad3GZ0TUxZJHVfDB3Hyqc/XmrkXs8N/WqnRct6W
	 /7oUdP8wqZzTUOxm9c+PoHXrIK7PIRCUQDJUJrMvjzyAUwR0RIXDpYdUliVpRcuVE2PRL
	 hfI2EwvNH9Q91+zsePn+brjkMgLLtydFOpDCZH6MxrorQUy6OVz34LWoU+nt9C1y83dAT
	 M+VTbDGBrubMHPQzjV9k599JLpWb5NAQs9LZOEYwJa4C2x5YEFPAaMk38hBffichsbE4M
	 RZe3tm/DuKVjwChgOKPxoip1wG26XdyYUuNeURPbjH6XtpXsV714TleBh5BuNcS1vrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b="J9jpK/gv";
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31558606A326;
	Mon,  2 Nov 2026 23:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31558606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=J9jpK/gv
ARC-Seal: i=1; a=rsa-sha256; t=1793661949; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=c34WK+Bcvi+1zgRon3U6u/pljuPwGd58moArawCsQ88QiD2C2VquEGzh1qxsx/HptkaHA7ipvECcNRskN71ZSmdBC0khE27nuKQ1CtRz/G4ZJdZgiaEHrQ//2HzXO7VhLYCvuhaCgU8ZGpiuZMbQx/5dd5DU07EXh5wdD+oA6Ec=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793661949; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1Ceh5hEkP+PMTYLmRWYJaMlOvd65D0wF1ivMzQFkRg0=; 
	b=ShgTWYJTBmRfsRZeyxBwh9Zk4qdWQ136SRr1kfICqunFTrymf4TxO62bQBrXlIghtYk1y0q5INk4xaji5QhvoAIQ//hjastHMr71Qvr+3ZYAz0w+YkBt+BunYQpoDOpzsegOa0wOdj3sEwH7nkWxgRcHJdCnsLJFHj6o/zkG20U=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=J9jpK/gvraLebJuTbTO/5Nh/gtk2Fb+i6JaAMbdR8vODnsudwXswvuH7kmH29My5UOD1iELILoa1jPevRHVyqZiJp5bi5AaJ3mHsv+Ckv7TNXvsYR7NIj66Sf0xymM5UkaTCF5Vb+//3ZQkjHL2VGrP7twTdurWE2Xy5Ul9yQOc=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=1Ceh5hEkP+PMTYLmRWYJaMlOvd65D0wF1ivMzQFkRg0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793661946198328.4702496578941;
	Tue, 3 Nov 2026 00:25:46 +0100 (CET)
Date: Tue, 03 Nov 2026 01:25:45 +0200
From: Igor Velkov <iav@iav.lv>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] media: rkisp1: Depend on PM
In-Reply-To: <20261102231206.GA3559911@killaraus.ideasonboard.com>
References: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
 <20261102223316.GB3548113@killaraus.ideasonboard.com>
 <20261103005500.rkisp1-pm-reply-1@iav.lv>
 <20261102231206.GA3559911@killaraus.ideasonboard.com>
Message-ID: <20261103-rkisp1-pm-reply-2@iav.lv>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 03, 2026, Laurent Pinchart wrote:
> What does the driver bind to when running on a system that has PM=n ? On
> which platform can that happen ?

None that I can name: the nodes exist only on Rockchip and i.MX8 boards,
and those select PM. The patch came out of the rkvdec thread, where Nicolas
pointed out that with PM=n the first MMIO access can hang and asked to
check similar drivers [1]; rkisp1 and rga had the same pattern. If that
case is not worth guarding, I'll drop it.

[1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.camel@collabora.com
