Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203069;
	b=SNRppv0Nv8UcfICm4fXipIMTVUsHTtBOil91D9q1LpSgFH2NXDpPMe311oZowhIPnrKx
	 PAtdRYmu+x0cGTuZ6r2cDzemCIv71g4HdAN0RB3YTITL7cJPLzQ2DetXYnyBDJ/ye3V6O
	 GfpYNYZGAzyKNYj0W4dHMhwduL3yl5fjmmMzXI2kBmI3ioNDieSLwQyXSjh8QQmufMXhT
	 MXyrOC5k5N8M4Mf1RyDGx1bPg7kSuWxFcgYHn2XSTvllZW5iek4N4vIDn68DmLAJBMoXi
	 BqPZh/Phm0/is8yALuZLVVDHMzoxJlApKUq7ghZtEjEnN6/yaTVVX0povvpstZw+EGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bIUJn5v0noI0Ozp78hAN6qBHnECEjw+ZHdq5PwPXe6o=;
	b=2oP5J4C9P+XG69ovVBL3EhVSsaadc+xhdEif8uB3zgBGWBt2WXuH7Ey8sq77OqofoFwn
	 YpqoOfkx065VYL4BR3tOUCFpO7AfNk+gqDpI23e7Z87k1/CY7/rlC0/OUML2Frw+j7rUB
	 G98qpL527V4scVRXmyZWY5p33EkZCVSZDYkYU2jM21A5/cG5IZjv/sw71Y3EMIG2cTEf+
	 KC8XmLw8f381S734yrcNwF194Ezqw+w2vjVOPCmCN7WH3nFd4eIOVCNliPIP1b6U1mzIx
	 OC3HBBv21HCRpoSzBGz9Gh9wOESH9ZQvY2E+203qjSLG043tHu4hm1+Mls1JRJ7NtIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ljK0kzZc;
	arc=none smtp.remote-ip=74.125.228.5
Received: from mail-pz2-f5.google.com (mail-pz2-f5.google.com [74.125.228.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE098606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE098606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ljK0kzZc
Received: by mail-pz2-f5.google.com with SMTP id 41be03b00d2f7-cc7c286026aso635833a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793203068; x=1793807868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bIUJn5v0noI0Ozp78hAN6qBHnECEjw+ZHdq5PwPXe6o=;
        b=ljK0kzZc7OIyosJ7wtQFMgv9t4jBsM6ffPauulC3pXY1M7Uo3sQTlPAIuHZE7gbyFf
         bun0E+OttUZck8IKPE01oLJeHGP3SE8CLliMRa6yeodozKQT7iCBpdvryQnmRj02EJg3
         fd3PT3KSgpTCNaQLcTHP0p1S5CaUrDkmepEOB0R5PgcoebLDwOibI/e+A4t3fgi+7BBX
         I67SoJI+UC4wqpLQUVgGqiTHXvwUbDA8yckRpISy54uZHbl//QLdfgtU4HDqnK8Po73b
         ylXpIfIj5ezA1aObz8m3IFxxn7n5AJ6pJd8UgGKsizsN7jApUGTCiGNqk18t0eUD8GkP
         LnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203068; x=1793807868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIUJn5v0noI0Ozp78hAN6qBHnECEjw+ZHdq5PwPXe6o=;
        b=w8PhO4EEyQXoh+pT0d2AfanTdxuAq4AVjhNkydJsgjCu6v7J7dgDxx+8h10zI7B1EX
         Rqxta4fceUgj/hmhtwsgR7drBpJime0/lQ5QKTKCLNeKSvVaPw1kxHyAGY5AxibHOAis
         b/vIK29FnxaEVBWbs1oM+i+ZEPF4sgPCT+iMlJEdhgxFy/BERYfCWzLtcwczyiloeIYl
         U87a34fG/CXdQvHScddI/e4n9fCdPWbKTj6Uv6Fkjc0NhzICj3UrXsyr/8gaxDBf4lkD
         LVczftHaMQyAYm0CaNHvJ1olvwqeH7OG3tYnkn0a/bUpKUkD8GmBQYtRpnRkruj9sE9d
         y0Bg==
X-Forwarded-Encrypted: i=1; AKwUvBz/TJVg19+6JmFMTTebD7TaSwhku/BFkDgw97AXDykEj8twA9q/0qjSBfMZa30IysU9/47m99nU8gt2PsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRtaj19R+ldaniri0lzevi0q9mlljYcubQRQFYQF0XSEzkjRSH
	6Uxt802G6+0MUmGdrLV3gG9v/nugmd7CgbziNerd74BXBFKD5BT5ReiK
X-Gm-Gg: AYBFou0/n48uiodrq263Z94jpoyCvElmkoHUrWk/ClX8UQWTF2aQTVLwKuPVUD5CnKU
	6Pqg2QuEbjEEDvM3snoR3TIsThoXqErOHi+ucs6D8J3z/faqJ30m+qJTWs1iLqm3tNgZCWHaFUU
	3pMb/kTXvCkW+lJSZCiRfP5S4NgfJYpZlYqvJq8aSnj1D16NRghXyfaAKhbrmE76WO/6lYfG90S
	NBYx2rHjEk8fu9qgJR7ZFZzs3oM8bLDbYAc5o7X8+KM4xdvxPdVzT5Q33JhAxGBMjr1xkPHL3/G
	OZD785NrldphVLLi8VyLnN6gD6CWIdZmv78YLOEU4w+ypNwb74mowJo9I9u7YAwI0216cUfovXr
	0QDjG8SXxUgasdW9z/MeLC3rFhIqKTxHYg637oUcUe2zDjh0jwtUP/rBAumxoltaoKw+AmNjReS
	QrchPmEQoClG0JXyuC52zpesAl606Ll3KsDBi/GpMZoxpC5U/hDneF+m2d2InioJeJQGeSYrHwN
	4yGY4NeFs9ru0RzN4+0zi+62Cq5/uVoUaa5tVC8uD6jC1ncaWeStLoUZUOGn/2K66jQMbAdfhkH
	Lz2QhVt+/KkmBycrIr+hhkQ=
X-Received: by 2002:a05:6a00:181e:b0:89d:e6e2:b2a6 with SMTP id d2e1a72fcca58-8a6e7bc7a49mr2518493b3a.45.1793203068030;
        Wed, 28 Oct 2026 08:57:48 -0700 (PDT)
Received: from localhost ([2a03:2880:9ff:69::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a5f66bcesm1390538b3a.15.2026.10.28.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:57:47 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:57:42 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Rongzheng Wang <testwrzwrz@gmail.com>
Cc: netdev@vger.kernel.org, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Stanislav Fomichev <sdf@google.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, stable@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 1/2] xsk: defer software checksum until the skb is
 complete
Message-ID: <auIbb0qeWoJ_eKw0@devvm16445.scu0.facebook.com>
References: <20261028025026.11401-1-testwrzwrz@gmail.com>
 <20261028025026.11401-2-testwrzwrz@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261028025026.11401-2-testwrzwrz@gmail.com>

On 10/28, Rongzheng Wang wrote:
> When XDP_UMEM_TX_SW_CSUM is used with multi-buffer TX, xsk_skb_metadata()
> calls skb_checksum_help() while only the first descriptor has been added to
> the skb. The checksum therefore covers just the first fragment, and
> skb_checksum_help() sets ip_summed to CHECKSUM_NONE, so the remaining
> fragments are never included in the checksum.
> 
> Move the software checksum calculation to the point where the last
> descriptor has been added to the skb.
> 
> On a checksum failure the packet is now dropped instead of being returned
> to the application for a retry. This path is not reachable with the
> existing metadata validation, but the behavior change is intentional.
> 
> Fixes: 11614723af26 ("xsk: Add option to calculate TX checksum in SW")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rongzheng Wang <testwrzwrz@gmail.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
