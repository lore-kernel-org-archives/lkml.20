Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524892;
	b=h7Swj7no7GN8WOQUojdKyJB9Lvde6DCAewQeySI3ZYC/0bYfTCBgILfHMhbpISQ3wJd2
	 XwiMJeEhyGnu4c7FpHF58lmH+4u8eQ9MvDIrqD9z5PIaxH/xFEEiJXFZAUD39F9COspVg
	 LUktfpXkzjfMNvrtdUX/MOsZUaov+lZz3jEKhhlRYIBwAItaHE9qpCiXDfs41NbxMMWhS
	 2F/vYFLnFpqFApWEi49HCqu4V5lhAsGw5LwA70HEhddHjWyrUjyKf2eyyT7jeV/+dnknu
	 BL141iZlPllcbmyHsX+ecrPUiFCDxwYRAEkT7BAUJISHyxr3mfR7WEB5yfogJLDN2+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524892;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=2VPT4+iVw6SddkzpbVwivnt1Uiw6pvMtqF6qQdr2wnE=;
	b=3Yy2XCXbXoBmhq8pBMtiTFy7P8vLjmW7XtsdAoUUw403GrIZr+s7L8eAQBXl5SRocLiO
	 JEkdCFK7OVPV20mJs1YleFvYnHRCOAihw1g7qmOa50vWJzyjrmjjar07ddlHiCkIlj2lH
	 pFd83ik+nW08IEcuHEUGppVKJtmtS7fAsk029cuDNX7inoSPHonPtkWLbo9j/nwR1WML+
	 vja/1xBTvgdTgMWetB1EIWA4e2vNVI8F2WR4Xx+bAlq7qGIkqEC5l0UdErQwHWoUoIV0X
	 3S4OfCM0x6db5bel5COLQsx0J5cs3nUvlBzvyA7MuFmmOj6tPDqy1AZVbuN/vd1o2sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=k8976YNp;
	arc=none smtp.remote-ip=216.40.44.16
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C468A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C468A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=k8976YNp
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id B004EC0395;
	Tue, 20 Oct 2026 19:34:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 141E118;
	Tue, 20 Oct 2026 19:34:48 +0000 (UTC)
Date: Tue, 20 Oct 2026 15:34:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Ricardo B. =?UTF-8?B?TWFybGnDqHJl?= (SUSE)" <ricardo@marliere.net>
Cc: "John Hawley" <warthog9@eaglescrag.net>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ktest: Accept quoted bad term in git bisect output
Message-ID: <20261020153447.14e63d14@gandalf.local.home>
In-Reply-To: <DM9WX3PL8BM7.EOK1U3SXH7YD@marliere.net>
References: <20261009-ktest-git-bisect-v1-1-1d1428f6cbf4@marliere.net>
	<20261020141746.187f15d5@gandalf.local.home>
	<DM9WX3PL8BM7.EOK1U3SXH7YD@marliere.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 141E118
X-Stat-Signature: 7fkxxhrhwbs9qmmq5rmsr1b4cwax1s5w
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19GnPePoLj8dFHCvOMJviAlNC2si+wkPEk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=2VPT4+iVw6SddkzpbVwivnt1Uiw6pvMtqF6qQdr2wnE=; b=k8976YNpALuGJa7Ivi8A62SDrdEikLtcdviQ47bpuKCZ/BdZMmUOBeujjFAp87I7OfaRopvozLpOgImLjO62CczZsfyBJJ6G59aceQRvhl6b//w2oMbfc9L3Snh0FyCebjX7X72eappY3Ngis4Un6HX3+af+ANF6haVLZxI98rs=
X-HE-Tag: 1792524888-427291
X-HE-Meta: U2FsdGVkX1+e6Z3RFWbb9lhJcy2PpsbhxnZb/+KQiH5Yk+0ex5oPw/mBR73stOCY2vZkCKwkiVPAYit05HbDKhA/vwibmD30+ti90RE+1sBWzUl564dqS44AOxyvPxw9BUOYq4C4vvUcn/Z6qEIrr8YxV3TQxv5lUoeAcV5ye0HtKTS/uS6wJoq1Fmq9ibqO5H8ohG683HdYoY+z5Dwxc33IXewWtxuIl0P0ZMTnW4F3gSvSUmraGvMNWnaw9AhKFnbfRu79Nz65h8Pv3NGvgw61Z8MCI3MOymIJqWnVzTPvJh7gUVamHNGL1zVQHQ86bgE4MQSl2WNKKE2cne9Yl3czlyKZXBpJQSuYVvjTFHuFZAwSK1IWw0OaW/MmAWQd

On Tue, 20 Oct 2026 16:29:04 -0300
Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net> wrote:

> Sure thing! Thank you.
> By the way, I just saw the thread on the git ML, are you planning to do a=
ny
> update to ktest?

Probably have something for git 3.0, but we still need to support older
versions of git. Thus, we still need this patch.

Thanks,

-- Steve
