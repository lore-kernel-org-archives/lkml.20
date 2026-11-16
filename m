Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794843004;
	b=YDPgds5Kv+ZGtGqC611fbFhBrbcioOWq74M3uHX7mg4jzqBkgQannWt5ST8dtmCoMg9a
	 Po1blPM4WQBSGTMkNaFMHIZc9RYN1k7LyqLtA9Xn1PyT6ta1E2dvS1CS6QBap6zOPepmo
	 DXU4tTsduoI3WAIZwqd9Xgxvv4bzh0x9kPq7WyapC5JKpj/lAUx/l0auEhHhAQFBplUCx
	 Cn7IkLmsFisAIf7Ke9zQzHI/ioU7JTJXk6fnjNT+qwN7r0/OROF3Ncq1zl8qDEWb7pPkk
	 IKuiBwpBC3HeQ+P36TtDe3fF/S1C16BhsruaoQpKhQ6kdahGRRVV0gv7gSIszvBbGAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843004;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=pd8U06eUw+1HWtdQkORNDo0MflL2oeiIAo0Kf0tX3hA=;
	b=QRPPvq6WeUw96vsc8BxIuzA5Exnln8tK4dpchQgj8br0FuVl0gJ/yrjyfUF9LWW1Xd86
	 eX8Z5nhYiaae4+C14EtBHX4Fs9S7orrDXUCziU/Oh/SkX7BTroSFr4cNFLpQH8aKZp+FS
	 +k5t1v2L9UVtTcd4SAOgshMdU7cZXDjob/o9oC30LVTGCw33Dh7EPfcTFQ0oUf5ggWa0l
	 I1mdNDBlohchbBC3UyhhkbQWVca3wmsoK289daVzbGqS0g8dF9Y/uCVfy33Rw6NPJd42v
	 TXN0wt+FlW9W+ExLRJgH6ekM69TVLbTtqDk3pJNBHC69EvUxkbhi1/dc8oizh501RbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=GtHVOSoW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D5606A33E;
	Mon, 16 Nov 2026 15:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 149D5606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=GtHVOSoW
ARC-Seal: i=1; a=rsa-sha256; t=1794842898; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ADRmvMX0RKZlSlBVrxJpPBZVYgTz1eKf8ZZW6anhG5nXlWfSpmOyforg3SLBkK0TPfgNSby2hORc0SM1sV0KxD7NZdSBSQqEFtnBYROZ8K03yyZI1TbglU1ozTUQgxBwq6LfSkww8XPWPV1hMisp8MzT1lukts5LYYSJKFGgJF4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842898; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pd8U06eUw+1HWtdQkORNDo0MflL2oeiIAo0Kf0tX3hA=; 
	b=Geub8yoc1Hy/G31Bh6eghj4bGjRORwhp2+L0B+Zvvg8zlkdB0g+nL+HnDzJsZqlbqru2AiharI8teEm5mOGlkvHmCK3jZq5nlryqhPozZJ2dQBeMe6wZVRsxLkR2iV8txZQimvJH3XRlJhM47o8YepJ6fobFyQ0peVG9MyInBIU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=GtHVOSoWmD8Fk+Ca/0VlgqOCFYezkPizE1/Wo4p+FOIu5UAbWnhu/h9PTzNiQoDvb+53LfKg0+PwaB0HFvefUoo7yLwXXGnGyUHqLL3YdS17arIMGU5zX4oAvZ2LTOTnZv6HZ3tcNa8dzQzuZDLIJh54sjvVlSK7IQIw1EuvkhCG0oAM/8wbAfMMH57T4gWQsm2WUtiAJLOXtZcsjMd5CCKH08rquAuorhOO2U1OuiyROcEixoe1a2We26IZtsg2XPePWeFwVw2BqFHx5SoISGgdax64cJ29fkYUSkTNsvzhDvAafYSJGNoOpZYB93O5Wyrx82MluX32vCQgCutQIQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=pd8U06eUw+1HWtdQkORNDo0MflL2oeiIAo0Kf0tX3hA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17948428966531023.8792753174885;
	Mon, 16 Nov 2026 07:28:16 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 02/10] wifi: rtw89: handle negative rate index for injected frames
Date: Mon, 16 Nov 2026 20:27:54 +0500
Message-ID: <20261116152804.781-4-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <5360bf7242ef43c995f09d161486a330@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-3-owner@ph4ntom-rev.uz> <5360bf7242ef43c995f09d161486a330@realtek.com>
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
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Sun, Nov 15, 2026 at 03:38:45AM +0000, Ping-Ke Shih wrote:
> I don't prefer to describe function name in commit message. Just
> describe the problem you encountered and how to fix it.
> [...]
> How about just set idx = 0 if idx < 0? The existing code can select valid rate,
> since any rate is well for the case idx < 0.

Agreed, clamping negative idx to 0 with max_t(s8, ..., 0) selects 1M
on 2.4 GHz and 6M on 5/6 GHz via the existing path. Tested on RTL8852AE
across 2.4 GHz and 5 GHz. I will also rewrite all commit messages in v6
to be short and direct without function-level flow.

Thanks,
Enver
