Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842969;
	b=k1eeCTo040F9s4Iq/87yp9W9UDeccLHjBulssRQ0p0dy9ZT8X3ZjVnzpNh7kB0GPjhFZ
	 ek2waMnvzCZe/iL6JE8RZKyBrkwNQ4308+x4cqsAGRVfQkdiBGHldjWwkOPx8HqWG3HJn
	 1bWV/p0fbJuJh1yMY/7nnTQ63gYCw0905d4QtS6KRmSOl7RWmAYg8f4vedCCtB2K5o98u
	 ri8ITN8OPxUwu+ahe5dOMmbsOOS9RdGZw0nFxCuw7YZCBAK6fzNTvzmTYIhDYEx9jjC7E
	 UbkvgySRY8xBnqPNdt3h9h4tau6yBQ4BGJt5AtQAlXuAiJ6IN+JEdnQNlmZ8ZpCGx+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842969;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=mtYEepSn1MBl5J8sUupuG7BC+uwfDgGwqpEAJf4vunk=;
	b=Dx+s4ELXp3IeZFx87NySw0ILdcixhvyWIUhrYBZxFmtQED5YBUlj/5SpLIHPEtVqQX1l
	 kANhAnfvjEGIKlE8VIX/8N4NuqB0NuBraZyDEHJFf/iks7DCk/XtIXGzNECeohX8DP7ki
	 dVL02fy56o12EJ3UdlJtGiTB9F8DihkMHbpdh9P3iHH/2D9hzNvTMZTyWiz33oK7lRkQI
	 8FBzrhkIHKUD0cYuzyGb22cn2PLoT+6TCUUU9jZyHKasGyPoMKOXA6c6uClmO2dCXeyNS
	 f80hBWBlEdzfealdPMIcQapU4Rs/KaQabg3IsI9xR4YmyJ1/Tzc0lT5SvvOzSIHR5wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=QIOuPnV3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A9A606A33A;
	Mon, 16 Nov 2026 15:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A9A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=QIOuPnV3
ARC-Seal: i=1; a=rsa-sha256; t=1794842896; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BE1ddGwLNCSh0qj7dFl/JKfj0TX0k0XWYUjg1lzd9m5qtEI1mZDiajRS/+zuA8EjKB7icxrG2Z8X+K+kk2x3/etcoXXJyP55X/b6aOovOqiOWhii7v3Q0ID0VTAYKAwErmxoI2OD4f0ui/6x61TXurV6TlVFeOW+3Ao0vE0tDsk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842896; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mtYEepSn1MBl5J8sUupuG7BC+uwfDgGwqpEAJf4vunk=; 
	b=Xok9s1qhRaOZUeUzw6x9K1B1SOX+xwfQm8fqotVRLQUa/JI2kcD0nADjLknQtrXLCi8tpv20fcsd0ICZIh5YVRydEkh4IMJz9ln7eXoBXBO1cu8RCzyzf/LT07rKm7QaNKfq39s0Tkn/Vwhwqj7lS7PTG3iUINwOVT56NnTvMSI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=QIOuPnV3kFmtHb+sDoWv6fNO2HBCYWpEioZUrlimNXeU69UdgLvMpL45PwG6HBmXZjh0n3t7zNzl+wJuVoLZ/6Dq65rPZGNyj6sctnqdVFrp6sWy/L9rTjvQSqnDvZhEk9lUqJLLPPfsr6R/YJh3aec8FSNAFS1WIlCeNMTWRfPvXlzbbAJnl+Hyqj4OXvX08UK4ATzpf/dMXbKq/z/BmvlnVEclAEocUQP9d2VmbbBVXm2pf3aRPjRhjpUmU5SWI8i1X0puZnO2dvGfPLQ5btc3CDm1km0Zvt8F2NdwI4wTruKicptsDONYaxmnkeokHOWtEU1W4Ijlw047G6cBQA==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=mtYEepSn1MBl5J8sUupuG7BC+uwfDgGwqpEAJf4vunk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179484289448929.76078320578631;
	Mon, 16 Nov 2026 07:28:14 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 01/10] wifi: rtw89: avoid NULL vif dereference in rtw89_ops_tx()
Date: Mon, 16 Nov 2026 20:27:53 +0500
Message-ID: <20261116152804.781-3-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <c80463b1951045f39883136b130e20ef@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-2-owner@ph4ntom-rev.uz> <c80463b1951045f39883136b130e20ef@realtek.com>
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

On Sun, Nov 15, 2026 at 03:23:04AM +0000, Ping-Ke Shih wrote:
> > rtw89 sets IEEE80211_HW_WANT_MONITOR_VIF but not
> > IEEE80211_HW_QUEUE_CONTROL.
>
> Will this cause vif = NULL? What is their relation?

That background wasn't needed here. The practical trigger is simply
injecting on a passive monitor interface while a station or AP
interface is also up, where mac80211 has no virtual monitor vif and
passes info->control.vif == NULL. I will simplify the commit message
in v6.

> Use vif_to_rtwvif_safe().

Will use vif_to_rtwvif_safe() in v6.

Thanks,
Enver
