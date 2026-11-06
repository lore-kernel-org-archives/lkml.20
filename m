Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977344;
	b=18i84WchOH9q0Db9/mpPplDzojxVPw9OXKdgI60all7quzWzGtnMIsdXKbOtbCfZjj6Z
	 Ch6Pu49hU/0U5l0Gqj6lSUkBWL75AnwvPdg09DV8M1/IPFZUV4rVup4MinFE+iTW+9myA
	 UspzdB33joNjc4Y0fJN5JP4+kpBLPffjwx1xjJCT5C2v28Abzv1C+m4soUsuabZqvCTnl
	 zTkzJ9gDx42FLTmBft7GzPai6gqk/f5hdBqHF0Z63Ry4EsyomWW2Wb1m+yrT2FNxsEb7W
	 fGbBt20g6g5H2IXVPGihRF1bt4oWezI+IEXpM3WjaONGcYY0g9RtRB7HqnWgIi2dckQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7TtPrQ9Bg1ashGXbzDbz4fIf6+H9qB3vHmh8Bznvg68=;
	b=Ot7XhLHNnh8N0RJyn8xfL6iKj9+BW2+/SXjqiYy/w5UhMtwBpx1GwSD3cmoNXBZo0CLx
	 9aqgLYT2bs/5l+iJQLRkDCpeSdCIzc4rAfTY1844NbiC7hvWtmvwudvI+ZULG7qM+A4Uy
	 fiPYyrgBmlqULFQoXs7/md6s+6q8O77sYjTnUEkuYmugTjvGQ6kNcueW/8d0XlX6JJY2b
	 qY6AkBbwGVZtPRfpNZf/lMR4AOsAI9inNB+i3cZzRyiDj4ZH5S9UgsPcIdg+4f0XnIz7i
	 8s62UO21HrsmziN9KCkpQkgq+9lh0ahgxrF4cy+B0bGEIebjY5VH1G+Z5HsVAmaz+bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3d3LxOm;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD746606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD746606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3d3LxOm
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c45551fa84eso106000966b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977342; x=1794582142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7TtPrQ9Bg1ashGXbzDbz4fIf6+H9qB3vHmh8Bznvg68=;
        b=v3d3LxOmbmLV3oeMndwwf0G59Th727hprEWpBhAUqDprLmS3KRhbvWYnoEHI1vfmrM
         heNUOx83bERl4AumWpLD7S3dtqq+u5u+//2azM2w/GtZn4XURumfF8Txp/RBiE/VsnPM
         fK8Mc1j6UrRA5SdY29JSqrgwy+3nASoNFmU/mWMxt/2QRprqEbkAiRqL/+ldxwZU82rD
         rDJk4QHukdvkVgJkij9xHYF1HxCm2/uD1eBzk+wJYPyO/fcMYnIHCifDimeYlfm0FW8J
         KcApHVZga08igvrgIqpsIKMAQPvPrHn3UPbxk2mgTzy+Kd69/rfB6YnM9qOc2zTcJmld
         99yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977342; x=1794582142;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TtPrQ9Bg1ashGXbzDbz4fIf6+H9qB3vHmh8Bznvg68=;
        b=Sh6ATtPPxfcIKGSYMNWVNS9aFWR1za8v/auw8NbEA9ZN+rDhpha65xMFmctESn+yQ+
         pFkH+yHDalzAbZ9lahbxIw9GpMD7crBb49ESoYH+sPBaCnlWfYgTgTAHw9y8pq7QgZUY
         bLI477YbSFpU18DGhoej9QipjH0y4ZG/npGHZbbNRCK9XLUaab1wMtVwRv1cwli4BQpU
         U0J0mc9hVl8ZQN8VpHeigGXyJ6D+zQybp5fNkEmMJgw8vlDWkwjVMAnXCuIluwNAHnCF
         BoECjBS3qtnQYTmR0k3ZgBVsMmdM9zXFy0UfwlUECbRSLuGbuAf1lDhQ/uDbLwiLPVB4
         /9Ig==
X-Forwarded-Encrypted: i=1; AKwUvBwtizDskfD7YYV8N5qnUnrC4LMMLjC4Ved1iZUdGMva9Lx9OgeD+mf6mGq6hf2dDKiyonhLAlbXqmyJ9Mo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZZnH5o26GQ0tw8cjBoDfSN5KXKZ7y+61X7EYEQI96vXfkD/MX
	m0v5j09H8ahYUuhzrliOjvwHUOLV0q6qApG1o1tu2vm08eXUZvPxqoqd
X-Gm-Gg: AYBFou0xbdyQ/Tuafu+y0tnUCOLy0LE+vVc/2UpLheqik1XdnU/HfXFQz6xGShLIJ8l
	sorECAnJ4eGm+BdRK8fs4iXBtrXqiz8oM4QZVQeOhltiL75bODL5gxtjBjTFsCGeTHrdIE1L1wu
	k8NKd9yVAk34C7HOzCLNuCfu3sOWyfoRp/XTEpFVXk672qmUR6EDqoiVoEFzfLsm/cxTGlgsve/
	WMlv45D1Q5JVG6fRJTbYby62D3uY5umXmihj1niXohKo3GPfIW7s+ir158gt4NX68++/O2MG9uD
	ej1jDH8FFXcMAdaV3o7E4YdP1Pv3fuAoX81jm/zDSls3P6kNqir+QY32qJAncyE/THSgGUU5P+w
	xgB3Ch6Og4xZ1rIX8B9BlN5nlZuTLLFfqZByECS5DIpW+4vFcnDGa/Sv2DIg4fo/BBwgHPoGRQq
	HhmFtW/giSD2yuAcQXHaiDrAO2O2fKAoZdh9X5IeI7SgmHrAuqcEqIFIqAQDZXWuxLC58cnUD3W
	aoj0ZkeKbUuFUBZ5/F5xY4wn/7v2X4JvvwnOpysb7Gy82+9r2oNVv9t5sqmTUXNGbO4nCBqivql
	cq0JVLLqvXJfCF1gYXsnfDOVafwhxv8dIDM1po8SdwCm0WJRfuJxJiBDTdzIbmcpAxCJ9st7Mqi
	14jSWxO66ldHRvTjen2N5AQbNxZkBXapXKj+EiZQOanDBdkalu30CExFqpkDQt08eRZXKtryhFp
	iX
X-Received: by 2002:a05:6938:a013:10b0:c3f:dce3:20d5 with SMTP id a640c23a62f3a-c4d354e39c4mr186808566b.22.1793977342099;
        Fri, 06 Nov 2026 07:02:22 -0800 (PST)
Received: from desktop.home.arpa (2a02-1810-1e16-ac80-898e-1938-27eb-b890.ip6.access.telenet.be. [2a02:1810:1e16:ac80:898e:1938:27eb:b890])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664aff32dsm873989a12.25.2026.11.06.07.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:15 -0800 (PST)
From: Stijn Cleynhens <stijncleynhens@gmail.com>
To: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: netdev@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: dsa: realtek: rtl8365mb: keep the neutral PVID in VLAN-unaware bridges
Date: Fri,  6 Nov 2026 16:02:09 +0100
Message-ID: <20261106150209.3659653-1-stijncleynhens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <autRCms7HolT2-au@analog.com>
References: <autRCms7HolT2-au@analog.com>
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

On Wed, Nov 04, 2026 at 04:57:44PM +0100, Alvin Šipraga wrote:
> This part threw me off a bit. What do you mean by "VID of the bridge
> entries"? If the neutral PVID is programmed on the port of a
> VLAN-unaware bridge, I would expect all untagged frames to be classified
> VID=0. And with IVL this should be classified local to the bridge. Is
> that what you want to say, or am I missing something?

Yes, that is what I meant: untagged frames go to VID 0, the VID that DSA
uses for the FDB and MDB entries of a VLAN-unaware bridge. One detail:
it is the per-bridge EFID that keeps the lookup local to the bridge; IVL
makes the VID part of the key. I reworded it in v2.

> Please separate the variables on their own lines.
> I think an else { pvid = 0; } would be more explicit than setting it
> upstairs, but it's a nitpick.

Both done in v2.

> Can we unify _set and _clear somehow? The code gets quite confusing with
> the two variants, and it seems now that with the vlan_filtering
> argument, you can unify the logic.

Agreed. v2 replaces both with rtl8365mb_vlan_pvid_port_commit(), which
takes the target VID (0 for the neutral PVID) and the filtering state,
and is the only place that sets the frame filter, so
rtl8365mb_port_vlan_filtering() no longer touches it. Tested again on an
RTL8367S and an RTL8367S-VB.

Thanks for the review,
Stijn
