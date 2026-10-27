Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.116.240.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113104;
	b=YG4ogbL9zNp1JcD+q/xEa2H0E09SmVBMgnorkq5cB3hZ++WtBPknNjZuwhmU68RaF//d
	 DZ3k0rtPGeWzGSLF23PW4tEWOubdak9zW9jd56sU+Dx5iNGe0WxhvHirZQDVZWVroVXVc
	 AHCAGDsxOaxclOGSQb6GaZmL83GPYmmUz85sgmg6IqbcIrXlYB2tuxaGEK9ozXYndu10F
	 sktQBR6y1zbZOlcMokDRw3FnsAcyyhjDSB5GCqaLQWXfbldQLnImleubZWudcqFM0/csY
	 dxN8PEpfUk9iL7u5faF/QmpFG3OXRGrfbrJznpTcW102/qMDB954XCEHf4f1ZrlBmew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113104;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=aeISGMF7jo9ZmnnYzu9dhnDsLHoHiUMKZzLNzlMaEfw=;
	b=YG350QSK55lCkF2PeA+gDJDiO92vWiD6PndioWqQeMxJG6HW60l8Q+BUdKLizYG1D+w3
	 pX4lRE1crmdaeFH/FJ+nBQwn0v57ZpTMKu4HcbqsM7MxtpFrKzFVVP7Euh4ngZ6mYdhpt
	 HXq6zsX26gSAG51MaEXmqtDHrcxDLq4Sz0aIZg5t3BRoy7UOP1RcKxbH5vyqcmMxCvBgS
	 GmA5pk2C2bPXENcRvt+0sxAFVF3x+O9fpQ2HmIsIDUhlVaMFrn3jT0WNMZ/7UYbiii6im
	 cbaoyESyiTDFhyvM1pBNKk7enAhRO+l6IP4Mt5D7DySGyN6Hb3DWQBmydJ1mgnNWksQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arkamax.eu;
	spf=pass smtp.mailfrom=arkamax.eu;
	dkim=pass header.d=arkamax.eu header.i=@arkamax.eu header.a=rsa-sha256 header.s=mail1 header.b=CifpoE6L;
	arc=none smtp.remote-ip=128.116.240.228
Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860EC60A2622
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 860EC60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arkamax.eu header.i=@arkamax.eu header.a=rsa-sha256 header.s=mail1 header.b=CifpoE6L
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=vcL4CwE+6VhO2v
	sCn7jTRwjlRR9TRbNKFbpG7UoqFVU=; h=in-reply-to:references:to:from:
	subject:cc:date; d=arkamax.eu; b=CifpoE6L8xS0T53UnwHyO+KDD4oCWlMQWfQZE
	L84vyp01h4x1ScFl5eT4l56GeY2Nc08TM6kvs6foCa95zkwwMmveCU8xPYdld82+i2tW9L
	9+EuOKz7KF4H4yVS6Jm8xS1riYwM0vDzOlRNR2tAK+mSA70wTY13/spUSZsE/+12LfNPDp
	Xxa05SIJpPWsM/Be5sEuu1PpUD9tiexmixIG305of3PjPqhdAU5MsXLWcIY2CZ1xE5SYvb
	VWPucZuAjvQq+jbofGLRIExLeEWyadv1VnUCprlacKcHh9dyqhNttHLCeOhkoFQdsj9O/9
	QsuxMtcVzbnV3JncMxhnI0iHQ==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id eef2211e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 27 Oct 2026 15:58:14 +0100 (CET)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 15:58:13 +0100
Message-Id: <DMFPJJEAQDER.1LTPXDFP8FYUG@arkamax.eu>
Cc: <justin.tee@broadcom.com>, <nareshgottumukkala83@gmail.com>,
 <paul.ely@broadcom.com>, <hch@lst.de>, <sagi@grimberg.me>,
 <kch@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <syzbot+df0058a8d0bdce7c4059@syzkaller.appspotmail.com>, "Paritosh
 Potukuchi" <paritosh.potukuchi@amd.com>, "Ravi Kumar" <ravi.kumar3@amd.com>
Subject: Re: [PATCH] nvmet-fc: extend critical section in
 nvmet_fc_remove_port()
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
To: <paritoshpotukuchi@gmail.com>, <linux-nvme@lists.infradead.org>
X-Mailer: aerc 0.22.0
References: <20261027144304.1177203-1-paritoshpotukuchi@gmail.com>
In-Reply-To: <20261027144304.1177203-1-paritoshpotukuchi@gmail.com>

On Tue Oct 27, 2026 at 3:43 PM CET, paritoshpotukuchi wrote:
> @@ -2932,6 +2927,8 @@ nvmet_fc_remove_port(struct nvmet_port *port)
>  		nvmet_fc_tgtport_put(tgtport);
>  	}
> =20
> +	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
> +
>  	kfree(pe);
>  }
>

I don't think this safe.
nvmet_fc_tgtport_put() can end up calling fcloop_targetport_delete()
which calls flush_work(), therefore you call a blocking function while
in atomic context

Maurizio

