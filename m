Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424042;
	b=R2SQ8VrsTXCQ1yrfnTJZ46WpGrYAYhYBSkunNcqxFxESZAS9SNbw+PddocJgOF3s8Fth
	 Q5Mnj9jNcwAEPzrSwt2g4WoefvdZYbIE5BfWW7PeNRP6sdKtHf0Tr0TPU0+p37CZp97h5
	 ggpS7339SGACJ2FC1+udvYLIX8lBg4cyIy3mt6SKXZmBfYUKkY3JTD9upvkoQ/Udk28E8
	 AQbsipuKpr2BVJN4ggmPKql2bK1nZJqC1HydfLb00Fp3s8/CW33Nldrrge1ZUPwo1v33P
	 8fwMw7uYufR+TN2zzfZffUhQ3gwsTU2s2UQsh3CF5CWPEHzhZ2H66iewuwhRD3d8b8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424042;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=kEMhpSnyUJcN6zPpGuUAXkRpvTYHPvaXByMhUhh7emE=;
	b=xshszLPXmlTQm//u7aNA9cNmHHf95HvcBNDoZH/1+VMLPazwNE7sxWHvGiKnyY0k5G2/
	 OwXVX3qt4IC68E9Uj90qS+9vIOkMs9WH2t92IE7doTARNvQHcgA7oFhzWpO8MX1zpGZID
	 td1KUwge8ySr+FAEFugRic71VuA1HGQvt6tpUFjg2vF9hHf2CRR6V2XgyviWkauEz07oG
	 /+aWXgzv4ycsO1HIcF1Z08Uem8SeU+ojyys+CGDcLgldjiz+1PmziG63xD6IiDp/kqV/g
	 +0CuwgSJJbQlEkyS6pZXqw7rZbbclYyN3fcSu9H5nCxk179i+Ev9oOMbIYGh78Oqr+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=icDzLyLN;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679CA606A326;
	Wed, 11 Nov 2026 19:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 679CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=icDzLyLN
Date: Wed, 11 Nov 2026 20:07:14 +0100
X-Lima-ML-UUID: c7202bc6-b325-4afe-8b21-39fb8ebf3832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794424037;
	bh=o0OX3SHkKhAUq23lk9BnJx+Lgm52SOLeCweYfFxZi1E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=icDzLyLNc83NAtorSOw3Et5eebXCGlipuA873U0S2gnCvHu0I/ppzZ4CXCwhBfpXn
	 Y8JkGzKOR/PXd/KN6GCkTgmKJb31KaeOrZ/kifT07Wcb2a3QrBHdIJtjl9hWyb9XJh
	 icZp0BzIhIvKIEm/duQSJcfEk3GOLwlmrvJTTukUCQFE6bRfVLIMKBNhvFmgV9099G
	 qPyA102hHx05eQ3NJil1vP3hwT8/cx9Afilg4BnfLh6hTwWZ5Lk3ujLRktGsza2W+/
	 bjj8VuXhtxQyIinphGIN1xvdUa9ul3l2/SCFKxWMb0HCoOP1eDTxbYJThlxQegzUSx
	 FzzOnLSFJf6ag==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
Cc: arend.vanspriel@broadcom.com, asahi@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 j@jannau.net, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 marcan@marcan.st, michael.reeves077@gmail.com,
 sebastian.reichel@collabora.com
Subject: Re: [PATCH 4/4] wifi: brcmfmac: msgbuf: send the flowring delete
 without waiting for tx status
Message-ID: <20261111200714.7897345f@kait2en-mbp15-1>
In-Reply-To: <20261110231248.206892-1-kudzo51@gmail.com>
References: <20261107154810.89780-5-dev@deq.rocks>
	<20261110231248.206892-1-kudzo51@gmail.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 00:12:47 +0100
"Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com> wrote:

>  Do you know how the
> firmware orders them? In my tree each tx pktid keeps the generation of
> its flowring for that case; I can send it on top of your patch if it
> turns out to be needed.

Hi Kordian, 

On the BCM4377 I have a trace of a disconnect with debug output. The
status messages are processed before both delete responses. But they
come on the complete ring and the responses on the control complete
ring. And brcmf_proto_msgbuf_rx_trigger() always drains the tx complete
ring first. So that only shows the order within one interrupt.

Please send your generation patch on top. That should close it
independent of firmware ordering.

Andre
