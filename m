Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3F141D119
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 23:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788046433; cv=none; b=bP2mh/pds4v3fAv973Zcjpty2jGUzYkF0dC8hxw+6q50DeD6KM31681AcU0IHdsEX+SYeLX5J7nVol/iBByGvs0LEL+1N14KwxEIjGF/keiqP0LoG+e5nyWqzZexZ6N7uXGZlbG3XFfklrFaGHYylvTwl7NuZSdgRj17F3fKIpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788046433; c=relaxed/simple;
	bh=DGyYAJcM0wvIjEDeeLs8Pb3A309zSMQnKq0ZsY2Akrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=FJ0p4dg0CxVVJWILkO5enp8Hu60nOmmc7QmKGMBFgWVGDBONkZJN2mO9HnrXoI+xSizF+5zCfEqJ0CuVoAOzRm9TFrDh04Sa6r7RqcUOQBF8xb2EY47HVuEiyp2Z6AQm9ofr0RT5sLsHk1iid23HN76wQihNkkHH+rpXSQ+edcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=JgfgJ4X/; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="JgfgJ4X/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788046425; bh=DGyYAJcM0wvIjEDeeLs8Pb3A309zSMQnKq0ZsY2Akrw=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To;
	b=JgfgJ4X//0xWZ9UY2a6MVs31kE6tJLLA0X24jHu65K+sxSYutGucaa14fyqYxzXIC
	 YhfjwCtvBu8aNFcnbEuDtzvyOfDP85fJVSWi6/j7mXcN5Ea3RQBJ7SkgzMLFpdmn9V
	 5UDXZrHH9UclADGJk0d5XWgydx94cziKfNwJdB7w=
Received: from [IPV6:2409:8a00:7894:a160:a9d9:18ac:f58e:29ec] ([2409:8a00:7894:a160:a9d9:18ac:f58e:29ec])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 86B98EC8; Sun, 30 Aug 2026 07:33:43 +0800
X-QQ-mid: xmsmtpt1788046423t5klk1e3w
Message-ID: <tencent_064F2A4EB6AD178B9865289537C859DA0C06@qq.com>
X-QQ-XMAILINFO: OOO9dHjlsLs7iIfk7wHMrseLEgqjz19q5PwGNyu58Oudt6rdJRhWhrMKlA4Zau
	 4E3jtSHdHmMMaPXvQ55QZ3N1aM6qM2/81HJAxiKW1GSGZRpbtAUYlXps7tmlWVEHB1P6DUuP98HG
	 KDnwK6riikT2c0fe3ewbqz5UCLltzHflPKqO1QWknd4Y4cna7PprPMISZT7SwGf61CdcoTD+ZWB3
	 +h66OxB6KahoUb6Q8YSS7os9/Y2XnacAG+pLHWEa1YnneEOlkHlHwRiRGcxmZ8lNrit8wEAmokQk
	 KhGHfpoK/UauJlFoHmyvUjpVkYLNhTtxjl+he4rTL7dy89/XHTXdS5FQ4+CNxFiA91B+MifrcI+5
	 71cbGyNt/1xOz1jdmSSBYRgT6H6BquJ3/AqfMikIvzxz6XrzOSbgl5S6xSz3Q+Iuk0nGmlXtovzH
	 96wWzjhIpeotQbzNOM2NLwtG4VxPeMz8PvLG4z91UUNYABy2e1WleGyWNxSHkJ23+PYwnVEUSgpF
	 dcP1KV18GaYiF1W79ERoz1KHcj4Up9HpX8dt+5K3n63BGMXUfZ4scZjzubFhRRgXEQHSsiHRpe3C
	 xtf4hG/rVYtm1AFEKzhK0NMJiA53hi7v9i2/l4Sz9hvHYGAwe+F5nmts2BuCw8IE1UCnfTcSxNtK
	 1QyqMfoTi8kQND6OxESq4wrDS9KvWc/fWI93W1NuQvAZ1vzOZyruHleLhwRzwYT681bdX3WeP9PL
	 TJ70WtL89UtHZ5OhRubqwl6YpyhjRyGZg1I7EiB8rodpKef9ZfP6oybns/23fBbV/OosKv//hhoY
	 mjHd9u8MxcrDh0OoqK0KpjMEpM+HmoE1Vh65CCp7YD3bPV7gtgi1P2dN70eftwtIXbaNnVKkvgqt
	 ZfxfOFcEie4t48BoElHbd61XbwjdvetABbYf6+gBCcpZNk+7fSK6i9uj+tgFQttHxPYEa0Tn7TFZ
	 /8I1Dd2QZPGaw5iiAtaDGUC70S3UCd3ajcsLvLHDSydowqRq4GXqcPiGCf8cayAx9WWNT9iwQbj2
	 NcAI3ZNK2TFDHsKcZRfT8tklDOahdZGVXhItvsJvXgMO+VUWUP
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-OQ-MSGID: <e65bdc66-5bb1-4952-a420-81fb27b9c816@qq.com>
Date: Sun, 30 Aug 2026 07:33:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] greybus: operation: Fix NULL pointer dereference in
 gb_operation_message_alloc()
To: Johan Hovold <johan@kernel.org>
References: <tencent_1CB189506DEFA4B38099D654FE6C2A2F2E07@qq.com>
 <apF9UD-3HNG3z8d-@hovoldconsulting.com>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
From: Yang Zi <2959243019@qq.com>
In-Reply-To: <apF9UD-3HNG3z8d-@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks, I’ll address these comments and send v3.

Yang Zi

