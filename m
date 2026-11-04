Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773635;
	b=jO+2L6uvE+eCCs7kxBBdhDL03FEzGmOp9PEuVdndCCEMHoz5qG5lsHlDm5+QTdJcmit8
	 3j12E2C2c96myaFG8LwYTSzChWOXkwkPjHpv6ngZArA7Y9dL+GK5SF9lHTixAIh9aAe/n
	 lAtuTjM50tgzoUByuek0PnPZRAcSZYK6nj82NkY15yWqy4LuaBqRRNNuw+5fWmO2dvSc3
	 5PYcrwIcECKkiZWjP5AYQuJIJNHoCX/gm0CbtRYYoDi2tT/onf/UnTig1RzIfdmYi9RBr
	 hTvINhph7UhvLsn4XLciVe7ayFRCxE1i5e/d0Y8C7NIdT1wS202mZOVaXmrdvUfeRcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NSC/0UBqsHBUxojcMDjRPSsTZlmrWmRR2YvHBxYsfFY=;
	b=TJ9ip0FW5aVgY3XGZHSR8QuyaLkICeifQpvm+5chpWblxTiZGyWy2f93r93IgokcawGX
	 GhlpfpG+U+0V6KZEyUYMOem4MrXejHgfflj2GGlmRRL0t28iBgiP5hCktbJ5feg/XjRZT
	 91Sn/uSYEN6nS7TEmK+kCKZQTNNwghVYGVjiwrVPbgOWaND8NckzFBgvbJ7GF1pB9DkYB
	 /x5UGwn8iqbiWwBtZZ+6PqSxyLsXQR/iYf5IMA046boKI7xeWOOdZejiuvl9jMKokOxyE
	 c6vjttCqBBqH8lWfO/UKEShMVaWl5TNiwjWqszCPykVlyIJS0BF+L/iYA1A6Egq2UXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="S+d/J/Wl";
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B489606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B489606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S+d/J/Wl
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so557066c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793773634; x=1794378434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSC/0UBqsHBUxojcMDjRPSsTZlmrWmRR2YvHBxYsfFY=;
        b=S+d/J/WlJRNCpBsfW4bmC6NRLzKerZngGI7ryYluGCIQicyRzYIeW0FxSQrrq6iQfs
         XpkkaTkORuL4jo/EZ71DM1RLLYBz37U6TAiRS3Kx7I1hHJNzo7u1aY0E8wTvBFuAS0kW
         51CdSq8lnp4zahUDi/eKvCJArYlROECM35fE5+1aeHTZkq+Ouxjck2ao74zDsQg+DTSg
         MDx4tQqyNcup6zzVFf0X1DNZ9a4jxW2Kkh5tWIL63roGZARTVYQ3c0iCVdZJ+0nTHdMS
         jeua6LhDQgaqKk+HGdf6ylzvFUHMCx7+eiJVsdX1IHSf0iwcCE2lzq6OgrHhnEymGMdr
         rJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773634; x=1794378434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NSC/0UBqsHBUxojcMDjRPSsTZlmrWmRR2YvHBxYsfFY=;
        b=OndzvO+WkbvGcMV/8xviKpQQlzSyx6Xi2I4juI752ly3eN+yD37Br6bosAfPfsBf2L
         Acx1BZCQG0T85hmpANnjkiedft4YLxKApl8PgcafeFXFtq9wk5Z2I2GlDdPzUgAlNYJr
         75BwVv1CbA0GCLkLp0Q/l+ikQA8yZbXRMrfwbXmi/P91f+g8dliZablhG/DcG6xgBDmS
         oRbOmyWUTm8dEXsG8m+UemzakjrXPzsVKUyJhodeVo+xyIIC0IObS4QznW8l96yTloqF
         0k8d94ewdu1yLDwVrbcW4MNzc0jHvJedpbGyZdOldjzYTXHhHtyMgqfCsnwAn8fr2xDe
         404Q==
X-Forwarded-Encrypted: i=1; AKwUvBx69ZEkLcMhr4KjDK4czuhike+CyqKOKzIlfg0cOr0+kyCVyVBUHDIoPnr1Z/4FWD2kdvZ/YZxUB90XpvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n9K9h06jy/TXvFhGSoWqm5UkQYudjQiFj95+w3K3A5YHnOnkO
	tgdCVXDTbK+woO3K0FtLP+OXdR0AK0g3Q0RDmnqqBLUB8nt7ltE5AGlIFQUb/yY4G+A=
X-Gm-Gg: AYBFou0ZyXkQRggy5MX6WhRfhmQ64ClVkiLq0IcgtF6c18NFtl/H82El25DpTAfxW69
	Paavfa/nA+JqVfxH3GnmkLjY128l+GxU8V6ZyitPCLRfrog60C9Kv6dJkOt0insxHE+IdPGrE89
	zvz6EjSfKJO48jJyrGiFxochPRCSoumvMDd1k3S9xy4LLxvM+dGYZkHuvvg0n9PHakaMrKRNXOh
	gEdE6UX/FXYW9IHTJKh0UPSQh1I+2XLYl5Pr4vteKhIncDzHGIgI6Dk4PpJlKtYZu3IKWaPXZw3
	bHRUZJCV3ehGw8w7iqYSmOMeydEjMIAcF41eoi2tH4+TFj9lURdzhjVN0kqIHQhTJdgW4mdPf9B
	BcUws+ZEYsWIbXmiCIFbIuUNoImzYtv4+gTobxw/IsV+EcH9U0PTU/O6mv7K0P8iYssw3SXC9Gw
	PylYGoZq+tQceLUssCts2rwtcmzYlsrqfH/V0kBEilTarTvAAFathXepV3/oMSObNIvFt8tcL9Z
	E69qlyLR7uWeIOIn7mhTTcFEHs36D8VkClwGS+cdpsNyh3wn9u0KxWiYhjwepqbhZjy6YG0LYsM
	PntVbNMjm13ytsHCHRnNdbGAWuXioCO6G1gpDmYOu7U4/ejuq2jIsHMts3T6aWtYwPdkQUwlg6m
	eeQZtkNxAJGPsvPgg67Eovbawb+ESqS/Yrrgn
X-Received: by 2002:a05:7022:b887:b0:143:2719:f800 with SMTP id a92af1059eb24-1ac5f742576mr20295191c88.40.1793773633660;
        Tue, 03 Nov 2026 22:27:13 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:744:cf40:a7b2:e78f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2c2f7sm4955756c88.9.2026.11.03.22.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:27:13 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: netdev-bot+sinfo@kernel.org
Cc: joshwash@google.com,
	hramamurthy@google.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	willemb@google.com,
	pkaligineedi@google.com,
	stable@vger.kernel.org
Subject: Re: [PATCH net] gve: bound the device reported rule count in the flow rules query
Date: Wed,  4 Nov 2026 15:27:03 +0900
Message-ID: <20261104062704.1882348-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179377314801.488859.9571867900418118906@kernel.org>
References: <179377314801.488859.9571867900418118906@kernel.org>
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

Hi,

Hardware: not tested on real gVNIC hardware.  The overflow was
reproduced with a KUnit harness that feeds
gve_adminq_process_flow_rules_query() crafted device replies under KASAN
(x86_64, kunit.py on QEMU); the harness is not part of the patch.

Best regards,
Yehyeong Lee
