Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB9B3F8ECA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999857; cv=none; b=W2vTFbUqgTCjYa6F43yPdRC1RHiKKWoab5otDgJNIr6bDOoqYrl+3pWj3ivVRRKUHxrk2zm/F4huvdDjCjXmAt8bX45kKt+MlwXjZgNS8+VhVS8eqfCniyuBHwXzE81PusCnY0hCva+DmJfd7HklcIbbbku11IORm9sOEGZkQQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999857; c=relaxed/simple;
	bh=CoHlJQP/KzfSbXnVKpzC+gNmLZNnwEBzgTBhC9KY4Rs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=diCJ11OMic75pT4+48XZDccRa3L3HyK1xHwMGCcnB9bR38W97AWhUOjEAu/7YcB5LFsSRM4GBoqy6s5vF2V5AVIs95/WL6vXQAyO1SWtMeo5Eajbef6iXxZQbhCLvBktc2M1dSsUORES7AEJGTBstDDwkhnff0QbypfV9tOLHEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=dwwuOSvG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l9Gc/e0a; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="dwwuOSvG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l9Gc/e0a"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D99F07A003F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:44:14 -0400 (EDT)
Received: from ams-imap-01 ([10.64.2.21])
  by ams-compute-02.internal (MEProxy); Wed, 14 Oct 2026 13:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1791999848; x=1792086248; bh=BercXFlBwSRu2H/MI3ab3YOk8S9yexFx
	hRU4Hn+ZliA=; b=dwwuOSvGmJS38XiS39OWUbnuQRpsnTHG+YBgDcUtsvo7YJs1
	7fckRpP7WeEzD43UKiMbB+xl8kM5I8SeSpPWdEd60ZRkE8VhGmhLP/siNHTBKhUP
	v0MAEXpKAZZDGheP2NFehcOetL7rcCu1ITzgYnDXhAEtrxpkCGHHX2txYWsvm9uj
	VhQSEpNo+MaUgMLCqJbMucb3dCuVF1dlNbEU4B1Icc4oalIjkp2MfWMtwTMWdfZ1
	RpSo3QS0k/OgoIWyEa/jEQNYmmylKAsm2Oft1HpiXC8lE+gIy3FXbr3JMQP8RFpG
	m2dXOcT21ck1qtR2nmnVg4kj+ISzeLybG6btng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791999848; x=
	1792086248; bh=BercXFlBwSRu2H/MI3ab3YOk8S9yexFxhRU4Hn+ZliA=; b=l
	9Gc/e0aDo+beL9HrCKKjhNviJzparZ5TYePUk+co9h3m9t6i3fhg0CfXYbxMySwx
	DsHUq8ULhJBn9ybaBdtQjOOgwHHL5wBLtbUe/AQZ3mlHxxpXMSzsIxfvnxTkkx8Q
	dGfYSucuR+rkSJunznyX5ZraQhfOk+TBBwDlxuSvgaPwMoDN2eWnN73BU+R1Kq1O
	nsZXfXj7tkf3KitwiNpt4teSO0TX36Zjobcoorqrx4C/1luC0MFxcuDiIgark5lH
	jmUWfhNzC9PexVBH6sRlEM9x2G9cySXdSSJjoZv5GXM/3jLvfOq0SS1g5r0EDjoR
	bLimoaVNLjkQbpb0wZteA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791999848; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:CLQ+oZ3XDQTOmVaNIIw+TaKJE7xsIrJdMVBaza58HpVpIZ9
	Mcdhg9MjKfhLeIt6TW0WZ371D3KaBmNHgzju3hRHD3dXz4qScXz9s7lGECXFioUx
	nEzwzVVt5NkM8FT83v1QVBEb+K3nVYhUCflY36U1llR1uKBKyNgNtwziVeAjYSYB
	+42H5D22c0u/QJHRYj0zhcmeenbTuM04Q7lMmRo/AkI0xzEodmkKtXSVAuLvR4Kj
	+bstR19lvK5R8GYKSRHGg+egx1J5rkedvg2Ee3L4r8Lge5UXODSFcZ9Iwes7/To7
	gNb5QycQu8u7KvuO5NXMmY4aOmQwH752jPGVDxw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:F6z0Rnsxteli8wLaVjz+6nlELuhYIYLa/+HEOswQW/s=:CoHlJQP/KzfSbXnVKpzC+gNmLZNnwEBzgTBhC9KY4Rs=;
X-ME-Sender: <xms:Yr_PaklXzZFc_wFp6amZf80UpuD3XOayf9YC3igpdiJgQ7r2EZI73w>
    <xme:Yr_PauqTtDGyGNXmDAWHhIe67dk5HBt76Qpzlwge0Prd-GsIhqfbTiuK_o80R5gb2
    xqSJZ4Z5GMBhl02TKNojRmd2-XFjZZkyBkMKhF9nF46B2_oOOm6i5Zhmg>
X-ME-Proxy-Cause: dmFkZTEppuuOqHje8/dIR/9URgqURIxSGWuCRc0gG2qoVj0u6oQihbwEcHLdOKIq79CDTv
    6oA9EIEEJgPwGXVsMjXfcP0BYIXhcztsZeWhjoyb7Zbaz26AWkeknNO3xFeHq3l7KcCk19
    vJNdbAu9psY/8Fn0Rva55Q5heHBzjQMT62wXe5LGNWELPYCVtlJQaIN4hyfkCyplTFBvQx
    4f908qF3iZZDFYKioCn3yqteolYafpg5ZFJYHqIO3pXtHwTSQskoAX2wGlxVI/QWL3tQPG
    XaToDWMxgU2ZEKxjcuoHXgaLWYp6MZFT0fnQHFlUh0dMPl2+4CFTU20Iaj4XuhRcL9h6MN
    /wy2Uqvu3NgS1WMzRQfealtGbTfb0OrODXqk60ShpLlmVOx53yRXxqC3jxXBvik3EpnzxI
    GnZtSAxSSxb/7R7UXRn2KyxZr+MC87LaNhhP/z2Z2FGSu0kFfZLS4/VilMfO/nti28eCRa
    ZfwvtyrjJ2KmLwXjssWQA+tSkwy6629lK1XVHmYEtnDNdNb1a2JkjJ2fOHZvR2If8I14L4
    5uKgXp0mwuoiw7gSU4eVsNDRplkLejO695YwvQeDBDc500XgN8FhoMIznNAg1gx1U8VB8k
    JdvlBYlGvhKVzxSg7+Vv36bx9C8t+CdKSr9AGIXyplIiF2z0OK1dq9erLctQ
X-ME-Proxy: <xmx:Zb_PalR8ZUl1nXEaWCtMWRRgEp90aDxQeOp-Mqr5S0anBu3krFZqkg>
    <xmx:Zb_PatDt0UWoJoOJtkNe7sLBHS6wQxi0KLBFa2IbpvtCjyET_qLCIQ>
    <xmx:Zb_PakJlGemjSTdcYz3kaqtKOouNoWKfSs2afngWPFIP-KrJNZMKIQ>
    <xmx:Zb_PagA8hpwBsBzFDupxr9y69deF0TqvxQtXUuKzu8RgLXefUUiNaQ>
    <xmx:aL_PaooDcvLzLJnmKdXlsN93EJCnVDaKn4ByfomRXIZN6khXpF_mqvYt>
Feedback-ID: ie3994620:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9B6C9FA0096; Wed, 14 Oct 2026 13:44:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 18:43:42 +0100
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Pedro Falcato" <pfalcato@suse.de>
Cc: "Harry Yoo" <harry@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 "Ilya Gladyshev" <ilya.gladyshev@linux.dev>,
 "Matthew Wilcox" <willy@infradead.org>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, "Paul E. McKenney" <paulmck@kernel.org>
Message-Id: <3c613725-406a-4506-b788-987a337b9771@app.fastmail.com>
In-Reply-To: 
 <CAHk-=whzkNzkBmCspHYd80D1Z=krDc4SgVC32=pJ5PtEgqSDrw@mail.gmail.com>
References: 
 <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as690Xcu7FxIDYjf@thinkpad>
 <CAHk-=wiak+h+d2tZ5W_MwRzatUP=hJKn7cpGjDxArG-gwgHLXg@mail.gmail.com>
 <as9-2cIuGuXwE2Oa@pedro-suse.tail5790ac.ts.net>
 <CAHk-=wgkoAuxNXga29nQ8w7GxdqR+4vPAUhPsbfp+gzKrb9EgA@mail.gmail.com>
 <CAHk-=whzkNzkBmCspHYd80D1Z=krDc4SgVC32=pJ5PtEgqSDrw@mail.gmail.com>
Subject: Re: Improve page refcount scalability
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Oct 14, 2026, at 17:59, Linus Torvalds wrote:
> That actually makes me think I should go back and clear PG_rcu_free on
> unlink - at that point the folio can no longer be read. I used to
> treat unlink differently from truncate/hole punch because of this, but
> that was in my first version where I marked the pages for freeing when
> removing them from the address space. Now that I mark them at read
> time when they are 'hot', unlink() is still going to pointlessly
> rcu-delay their freeing.

I already have it:
https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git/commit/?id=9d731267fdfeceae023449a768884ee8c66f309d


-- 
Kiryl Shutsemau / Kirill A. Shutemov
