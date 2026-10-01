Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559CD51A73A;
	Thu,  1 Oct 2026 14:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864468; cv=pass; b=Eq95UTmTxhBhxvjlB18Xm4K/Ue1mAPzXTNHt05DA2/oEfdAe0zVL24cke6d5X/yAI8MNsM31+FLPi5TFn0qpja6CM0uXxQKUOIQS8w3C4kjow1oxVAGiR6U/iZF9GDuJW+vAe+H99upa7rpjA/0afAcqfpywnXavsdtz4A9fzCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864468; c=relaxed/simple;
	bh=fh3mHGVp2bOdCQOsMBmhI2ZiToofIndaNbGggmqwne0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FWODV/53DoInkb1U2yE5QnSubzVY0jUT+0VGZ36MK5/IRWDRcg0wGNq+m+tWy4AZGmoQna6+at44i4X64eOJwL+ZjQzff4hIAF8U/rx39X7FZ/629fkuVvLcuvxSwMx2wHQF2R5tYg8HJcYTADWm7DyHYdoi3+Lstsfr3xxQcjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=DpzvqErd; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="DpzvqErd"
Received: from fauth-c2-smtp.messagingengine.com (fauth-c2-smtp.messagingengine.com [204.75.18.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hwYx01JfzzySy;
	Thu, 01 Oct 2026 17:20:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1790864453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fh3mHGVp2bOdCQOsMBmhI2ZiToofIndaNbGggmqwne0=;
	b=DpzvqErdiWc2K5YIF+OzDN15s8j+bsrE5SOtT7KCvFo8PosXQizB++XGKcP2imKHUaBgpf
	otkvTovY0Us1wC+X7e9sIppuE45eGeOZVo1JGMmHXDTcbCQMEUwWv+Nw+7G4FZByDPtDew
	f+3HfLRTfU7FR4iRAbkP0ESTNxcWJoE=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1790864453;
	b=jJy7xXxWEp2UCahsaxJ5BRPNv9KMChG+ayUOCpVG9aWFX0eHd7cypjuVMd4GLk20kyyjzq
	InnaSVek3NEqSy3teFleM39Bt5agGaWm6C2Ote0oD2DHGT5V3asYcsKHgbMgpfnyANCX8q
	KcbObU06tx6HdJfpT+vbntdcwBm6DFU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1790864453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fh3mHGVp2bOdCQOsMBmhI2ZiToofIndaNbGggmqwne0=;
	b=rJcf50jmOzRdsQGm/H53R1upeTvfAbJ7y1AbhTKLJ9VkOlROJXDNdtu5JjgaqhA+xr9fu0
	hScwrE61Svp1Ql0VoWalOITdhtJlRSr7ZsqdTaL1fwVkzCmqfI0G7nHvmdYEXPFHNLB7Cv
	8+DjMc7EvWnj7SbXH92Khp3OdhOOQeo=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id C25A9198003A;
	Thu,  1 Oct 2026 10:20:49 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Thu, 01 Oct 2026 10:20:49 -0400
X-ME-Sender: <xms:P2y-at5Sq2K2YBXmoamxP3_aegmdBY88kcXAEm3CjsS37unnNGaOlA>
    <xme:P2y-av1xmuX4fZgneKrDgZobXyMcQT5ZiuMNAFLouu1tO96A7GKWAXw-67NYUQPk9
    7F0sk3hc8OKxye5MB_nEWthdVolyvKtGtY2D9nN_o37r6Ag0fIBN68s>
X-ME-Proxy-Cause: dmFkZTEalv8rOj2Uj3+4YFCUjdY/jYEb/+9gtNNrCuYEzSg/QJULIbYWKJ1VzCB/eCjHp6
    kfyShI04ct/CIcgZMVclZs6vAFYUtJQiVdI09AQwptSTRrOuR88rxCE6cQxvjs8rTz/v+T
    mnEMYXmbDqWqQNsxamR7ByALCwVQ780Vapo8pwgxZ38PmYyLc/lkFKJ9hMnlJ+grHwGGHI
    FGMvYeL/D0s8RH/kvjcilPzTiLhDB4XxarKa/426kQ2ek9K5MLJXPouMuiX8WK8RZu+l9I
    GVTWdqZaq0T/2A1/yYQGikTFvz3vyNJ2LkT3mXtTThp5+4jMPTjGl2Q2OOx9oeQN3ud0uA
    wUxl1jw6ut4i+cic/zrSufGHZGBkHi2d9Dkh0/uqVzLdUPhnqYOh+Hpg0XDwmdthr4Qtwz
    o2JyQsQ7mGssAQLe/XweruY/GYqcDOqxIz4kIjmPOaO5ARMZEi4k8iuo/QjQphqW3PxiAZ
    7kXs/OxmDe4kWuMGzzRC2a780ta6UscrViCOcspVNUy5w2TEEvXxzoCiDS/PVSIQ863PUR
    nIh/zqdLtXjXi6Cc2+BkfNUUn1xj7tpCxsrGPGc8CdvsCi1uWBRgDgWsiy+OJHn8at3/a7
    iZWEvMJhoVtyDiuYQhhot+otiBduMBtyee/dtPcCz4ISZHtCjNOusIxmy0+w
X-ME-Proxy: <xmx:QWy-aiFkC4gpk_Pl-MUOTzG8-khCCwSXOcQgAdbxIqi0EEoxEs_Vfw>
    <xmx:QWy-ajze2VroZWdrYm6Q8u3cYVzfql40lsa5gJbClFHuNVwDYRePmA>
    <xmx:QWy-ajDKjy4Vko2m8TDkF3lF7_3ridpKXSC8Bu5OLUkS4BH6n6vOeQ>
    <xmx:QWy-aiWmM15F7kbqvcJIIMJqfzwy0MNDozQSvEHpWU2AH2GfZuBgyg>
    <xmx:QWy-ali2M8V1ecKfKNxSBx0bQieQpAQS6KVM3mqmPcZiKMRdz2NblIfr>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2DCD6F80094; Thu,  1 Oct 2026 10:20:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0G5p0OZ_htJ
Date: Thu, 01 Oct 2026 17:20:27 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: "Marcel Holtmann" <marcel@holtmann.org>
Cc: "Manivannan Sadhasivam" <mani@kernel.org>,
 "Deepak Kumar Singh" <deepak.singh@oss.qualcomm.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Jeff Johnson" <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, "Bjorn Andersson" <andersson@kernel.org>,
 "Chris Lew" <christopher.lew@oss.qualcomm.com>,
 "Raj Kumar Bhagat" <raj.bhagat@oss.qualcomm.com>,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>
Message-Id: <19433f85-4cf1-4ec1-a26f-0eab7df062df@app.fastmail.com>
In-Reply-To: <0A4EB216-06E0-4A7D-A0FD-821DD371773B@holtmann.org>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
 <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
 <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
 <m657dtesuagn7vdajsuzjb4mfysf5xabsu3s6n6lujj7yb3z4p@m2e7e3n4zyev>
 <10091679-7567-42C2-B77E-EFD95CEDD649@holtmann.org>
 <6e0ed085-07d0-46f0-97dd-b8d942842e1f@app.fastmail.com>
 <0A4EB216-06E0-4A7D-A0FD-821DD371773B@holtmann.org>
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026, at 17:33, Marcel Holtmann wrote:
> > Well, in defense of Manivannan's patchset it currently works for PCI=
+AHB
> > setups better than the last version of that by Denis/Mihai/me (altho=
ugh=20
> > I could easily fix that), and it may be simpler for userspace to
> > continue using nid than having to bind to an endpoint, which requires
> > more changes in userspace code.
> >=20
> > The userspace just needs to know the nid.
>=20
> and existing userspace? You can _NOT_ break existing userspace.
>=20
> Don=E2=80=99t you need to re-write all existing QRTRIPC packets to act=
ually even make this work?

Well, from what I understand this rewriting is the plan.

It is true that if someone has a single card, the nid changes, thus
maybe breaking userspace if the userspace has hardcoded nid.

But if someone has multiple cards, the breakage to userspace is less
with this patch, since userspace can keep on using the same code and
just change the nid, whereas with the endpoint_id patch, the userspace
needs code changes to bind to an endpoint.

BR, Juha-Matti
