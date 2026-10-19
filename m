Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.250.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450889;
	b=Pw+Lm+njAKf9vhZJseBK3yz6RMgjYqGuEGrhijjJrcekkcuXsAiRz+gwZEYlm4/Kh8NV
	 ADAEf6YukrbruOg6pMeoG7tAqR/hKEdBKvD0ZQqA1iiFHtBl7tvD9Km9RDbc+9qHcyZDr
	 m4PZOlVC1JpaBHXjVSy57rcKcCZbIiqyHC0Gz2nT4mwFUTmlLQKBulrddUxsx3tQb92Bk
	 g084Cysm/OaBYTduGLJmKn7pLzMHPL9fkjLfrstti+X/RsF5rumMedDocu585zOzONsGM
	 o7vDUydCH+cmUi9pYI3rCKhkYce5Dx0TJDxw40cfICdxOuGd8oKBt7QETcwTr0HZ4SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450889;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=emO6sEIDSkEFWkAyFtAW5uo9IdZWrTOY02AsTAB3ghg=;
	b=3gvhjHWXqskGhtb8PvkxgwLCa1efYi+CxMKahSFzS0+UuBc2mhnoVr0OBQUFTj6q4MJy
	 Q7HdLxa3ZWs1DF3k2kteXNMugANCGVXluC5+Z+6rWNdeGBHGr0eOojNdd3ovvF73PYQN7
	 g9aKs/uj1ntsAIM5w99VdK3gpAh/yYTcTzgZGuD0OiDM9uEkdEiYFA1u0yY7BRIhGLrrw
	 7CJS1LE0GS3oKXtqczpbrlWOr6/CV1SykLGKKfGJ/3FXnLnRNOCBU6SWSKZ+UJYSqy8Yw
	 soZpwMKr5jk10Hz7BasUYUhDYaL0ymVcz88fspClMhYEz+eqwuoAeZVAMs6oyvLbhQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=r-sc.ca;
	spf=pass smtp.mailfrom=r-sc.ca;
	dkim=pass header.d=r-sc.ca header.i=@r-sc.ca header.a=rsa-sha256 header.s=spacemail header.b=kbEdxGlY;
	arc=none smtp.remote-ip=63.250.43.100
Received: from out-2uec-a100.jellyfish.systems (out-2uec-a100.jellyfish.systems [63.250.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70E2606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B70E2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=r-sc.ca header.i=@r-sc.ca header.a=rsa-sha256 header.s=spacemail header.b=kbEdxGlY
Received: from DESKTOP-290OH2S (d207-6-150-133.bchsia.telus.net [207.6.150.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j7rcq5L1Gz8sWN;
	Mon, 19 Oct 2026 23:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
	s=spacemail; t=1792450860;
	bh=emO6sEIDSkEFWkAyFtAW5uo9IdZWrTOY02AsTAB3ghg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kbEdxGlY9Nlbf4rp/11jWG32FqrEyxlFiYY1zJbOTD/+utKtaYNDlVzg8jgCqtgGB
	 6K4uPO4SeNrtk47TN8NZzN8CUIGZKuZ8PNrGlGG9EtmYXQ/3Ezn7HPZGci8vPK+nhz
	 MDLzYkXQF94JKsOnSSYNr+d+5Nn9aGpEOXEi3f6d2MqQDKNdPUf0BAagTYLlubK9PJ
	 N+3fcNxexu0Cpb8BMKcdgQEgx34J17WYCDxL/F2DMviO6MtbsMGnGVSD/Pjp4fl8Xf
	 2Yjs/X7Aq2YkRdLI7I90SEVWbubj0grzDbgIxEx7TUwXB/fG2FmNLhAtxyFUcPnvrE
	 VkzOWlCdLUjzQ==
From: Ross Cawston <ross@r-sc.ca>
To: markus.stockhausen@gmx.de,
	andrew@lunn.ch
Cc: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chris.packham@alliedtelesis.co.nz,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ross Cawston <ross@r-sc.ca>
Subject: Re: [PATCH 0/3] leds: add Realtek RTL9300 port LEDs under software control
Date: Mon, 19 Oct 2026 16:00:53 -0700
Message-ID: <20261019230053.503-1-ross@r-sc.ca>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <010701dd5f94$d636ff70$82a4fe50$@gmx.de>
References: <20261018194339.132-1-ross@r-sc.ca> <59f75e7d-9b56-441d-a4b5-58ad3862267e@lunn.ch> <20261018232015.527-1-ross@r-sc.ca> <38ca5375-ecea-4361-ab26-c044f38ceadb@lunn.ch> <20261019054233.1884-1-ross@r-sc.ca> <010701dd5f94$d636ff70$82a4fe50$@gmx.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: ross@r-sc.ca

On Mon, Oct 19, 2026 at 08:41 AM +0200, Markus Stockhausen wrote:
> [...] it is currently beyond the time available.

Thanks Markus, that answers it.

Then please drop this series. The PoE LEDs of this board go to OpenWrt
with openwrt/openwrt#25341 for now, and I'll come back to the port LEDs,
in the port nodes, once there is an RTL930x switch driver upstream.

Ross
