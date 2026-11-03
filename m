Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.205.69.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740550;
	b=eyq6kmJnC+kNwh0ZaREs3EkDQ8eWFAjys5Ih5E+rRms9LSUlDzGnltvX2j/lkg6RTgjP
	 9cpf+CM+fAzC3YQXkCLTd7Zs1e34ic+y4KyiTJdcB024Eum2SFW5qOKOlWzjlH02UO4MR
	 FNlxCyVm6iDb02/WzY8O0t6XRUWjFDeAcMkq9Bsl9kNBZBlOkIoiYixHoK8Q/uVBD1VQF
	 Z4LMlW0IoW9ljsg4dgJMxUPLr7DLiChiPEDMwIENQ7t//wX2RzNFuJKP7+b6V1djqGpR0
	 hn8MW8j5EX4ESobL9IGQd85BQonvM34qBYI2xHpKGTRUY8BaTjNAztC9NLKRESpp66g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740550;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Feedback-ID;
	bh=9QvwDe2pbK2HA+wOCAGGL4tpUQfzlDWgHgHLwpHl2Ak=;
	b=Id9N3bAzq6aMvEpMxwyDYRKbesocpYMtqIoXQmZprLrWq8mHXXXU90xWcYeXiBk/pob5
	 k2+e36+LPQpwe9AG9Hd6KRgpTKEB1kOWiNfd0VpYS2DjZLSeJSWGHGQamOiAUlfWF/t/X
	 Y8dSoDWqpnOQh2ONwke3cFrjU5Abu3If51q580Oshaeiuh4NGyh29sFldIghSL3QL0Kwq
	 Ls1pnJ+Du4HIRVJd2eD+NSZOeM4R6txXuJB0T3Gp4AO9pNRgyw5/oe5kQv+tv5jt+G0FI
	 ac4Ci+3nBNBDxsm78H4jClcXag/b3BBXC4btixT7fTidlun34Yd+gpGqfVrdkkGHn+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuta.io;
	spf=pass smtp.mailfrom=tuta.io;
	dkim=pass header.d=tuta.io header.i=@tuta.io header.a=rsa-sha256 header.s=s1 header.b=eWcphyh7;
	arc=none smtp.remote-ip=185.205.69.214
Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE168606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE168606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tuta.io header.i=@tuta.io header.a=rsa-sha256 header.s=s1 header.b=eWcphyh7
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 2B1F91A204540
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:15:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1793740547;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=9QvwDe2pbK2HA+wOCAGGL4tpUQfzlDWgHgHLwpHl2Ak=;
	b=eWcphyh7WZcLHAGVZAm75BZVL0A2H2ksutEhOj4bomchIho4/mwz1C2Zyhmee3KO
	G26rDhC1CJQTlfoqDUm9HItd19jcGmt7nGOJhnFTb8gZONSQl9O50itX8sGl8bTAUu8
	2/mvEdi69qfTAUAGXxq5gYrHtjDk9XbcYyxfNtDiCsektUSgeiP5VjigeDS338/YaHV
	ORt3X4z+ojuelqsO+9FO8CDsB8YlHnmZ3Xy0LzS3erIv2fEurVvu5gVEWH2zvISlbAD
	/DAod7A+aeGNp8D1oUFqCmZgSZ3/SVtSQ8rg/bUKZBxcv4JxIjSEV/JbYE7P/7uhSe9
	bGRuvuwDtw==
Date: Tue, 3 Nov 2026 22:15:47 +0100 (CET)
From: Edvard Conrad <edvard@tuta.io>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Edvard Conrad <edvard@tuta.io>
Message-ID: <P5YG9Nx--N-9@tuta.io>
In-Reply-To: <CAOQ4uxjYX+A_xRBmfj40hmAcuQXwW4JPUmhJ9bx5ymSr0QoDnw@mail.gmail.com>
References: <P58Wrer--F-9@tuta.io> <20261030-welpen-anbinden-nullen-b2432cee1d10@brauner> <CAOQ4uxjm=cGPnug18VuhKqiMvkWwLPNLO_TE3KxO8iLZG+veYQ@mail.gmail.com> <P5Qu3co--N-9@tuta.io> <CAOQ4uxh67+vs0mr-Lxmwz9-N+F8m29WUNz+8qFLLDpOVYB7=vg@mail.gmail.com> <P5WV0VL--F-9@tuta.io> <CAOQ4uxjYX+A_xRBmfj40hmAcuQXwW4JPUmhJ9bx5ymSr0QoDnw@mail.gmail.com>
Subject: Re: [PATCH v3] fs: let backing files inherit FMODE_NONOTIFY from
 the user file
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
Feedback-ID: 0127f977f5e13e8051b46c6e7f57d0f95a0470d24b79d7c31d07fdf611cc427ab823e0f4692a810119c92d8768973a9281:TurnOnPrivacy!:tutamail

On Tue, Nov 3, 2026 at 3:46 PM Amir Goldstein <amir73il@gmail.com> wrote:
> Right, I was being sloppy.
> Thanks for the fixes.
> I added Co-developed-by to attribute your contributions to this fix.

Cool!

Signed-off-by: Edvard Conrad <edvard@tuta.io>
