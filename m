Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794843180;
	b=D7ZOwHV+2ReIdbyNmzcr91Jm/jSbjkg1bNUpOsUbOzqY0adEg5ZWbqKMbB+1hWTNy3L+
	 b35TRcSy4BZN2IBqSugPY7XLKtTOulCUYEnrNVWkJz3NSZ1z5mF3UvGHUESHHghZntBtv
	 144TNOjvU5dgCgk7+oSy+V7KU5dB/b2KUQQQcHwcv/Alle0OzMwmVKrYYIuwVjrpYRx67
	 QTi82g7PwVGdafCdc/2aYp+6aoZee0CoB/3pAqJcyURoGLaGKn2F0LK650xccnHX3OSue
	 610hDGKAHVv395gsqXnb9PfeL+1fqNmGLQWC7Mnfmeh8qeJ15BpKhGh3dH7P/VWG7Tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843180;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=wnAjq1uguLq+6OvOyFVP26dzXyMwH1TvCniD3Y5sAEI=;
	b=WhkluhFPEDSxGQoGg/J/CaRfNo0OpIl2MfARVNuMPoLE4Wwdm7qzC3GJY8FEhUQlE26m
	 5OoLODeAaEmyFCp3ILXII9QsUe8CujBfYxJELa5tGwxBa501ROcxpVs7OgTm4NADTHT6g
	 bsynYsJejW3+b1OPXd2XWvzLWZ4joLhMcUZ9WE7YBcnDWJjEjA13f3FtNijyAsJFSh9Hy
	 JpMBR/gI3AwKaZUc3hSXTQ0tJXmaMT26wiFp6vuE2ftvTyeNV2KHmXC3zNNqEFQvOCLcw
	 KsDf+4VjzpIHo9gZBqpMSBizAKndX6S+dkDDqzblP4bVUTVJgVxiz6o0y1W5wT3zB1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=uGddCVG7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDEB606A32C;
	Mon, 16 Nov 2026 15:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EDEB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=uGddCVG7
ARC-Seal: i=1; a=rsa-sha256; t=1794842910; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hKrPojceiSuhrPDifINXqjLPmMsXkBJtU++IjbjOaVOMGAucw1nhfqnl+EVSb8I8BW2jtnqnmJNz11eKmPoeTtx3cmDy3gWgCbaMJOCMm6O3smIXZ61Bfxucm9QnCAn+mWdxGgkZAgyHUIOUgPRS/HBIylcg/fueYkXttauxVdc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842910; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wnAjq1uguLq+6OvOyFVP26dzXyMwH1TvCniD3Y5sAEI=; 
	b=ftdoU5xngsUc0A3rzqQAm7I0XP/+S0n6QENF10xJK/IcSoradoDOsW/u1qQh3X+YftuyF9MRDrSoBE7v2Us9pqDYWtOqA+XJDmTHtccgZvihZJHveCPjBIbtHFbzuM8wHesFXbt9XXdk93ZjJZFkApRkf1GZqdz3XLz15tozuEk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=uGddCVG7TJLLTyo8FmXLRZoaay2+tCgO6o3EtP+pNPjAxzNtK82NIHPn0IPHwUUcomEhBAmNHhP73vI8Ipp35lTKfdCmWWZyeETeNfOTFHY0u0g0cdLmyduiypawPrVDX62qza1zE3vxBVmaBQ5ZRyv5m1uQ8Kr2i/zvzZSunqDtgJCmWbSVhgiOwwBCzJ+KdNN2asZOSY+OaRQcLkZXzDjfYv4L5mOvaI55IH5+lIuQQu6K30qRxNltBBPysf1d5WYAok/8Tdi0756j78ZT/eOllR3jfzEu0nMcJEleVYvtwJZE7WSRs+xvxvaKHWP9mQTJh89lB7L0jeMiwHsYdQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=wnAjq1uguLq+6OvOyFVP26dzXyMwH1TvCniD3Y5sAEI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794842907554590.3151237487023;
	Mon, 16 Nov 2026 07:28:27 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 07/10] wifi: rtw89: send injected control frames through the management path
Date: Mon, 16 Nov 2026 20:27:59 +0500
Message-ID: <20261116152804.781-9-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <0a32e2d1a6d745a88f1a814c5bf145cc@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-8-owner@ph4ntom-rev.uz> <0a32e2d1a6d745a88f1a814c5bf145cc@realtek.com>
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

On Mon, Nov 16, 2026 at 02:14:36AM +0000, Ping-Ke Shih wrote:
> Did you encounter real problem if CTS/RST goes via AC queue?
> I just don't want much conditions in data path.

I tested injecting 16-byte RTS (checking live over-the-air CTS replies
from an AP) as well as 10-byte ACK and 10-byte CTS via the AC queue
without changing rtw89_core_get_tx_type(): it works identically to the
management queue (23/25 CTS replies on 2.4 GHz and 25/25 on 5 GHz, with
no errors). So routing control frames to the management path is not
needed.

> Did you actually see driver sends control frames generated by mac80211?
> If so, when and how?

Only via ieee80211_send_bar() (BlockAckReq when a TX BA session flushes
or tears down).

> If my thought is correct, here can just
>
> 	if (ieee80211_is_ctl(hdr->frame_control))
> 		seq = 0;
> 	else
> 		seq = (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;

Agreed, I will drop the rtw89_core_get_tx_type() change and keep only
this 4-line seq = 0 check in v6.

Thanks,
Enver
