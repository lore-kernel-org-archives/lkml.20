Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242583;
	b=buRm5OGkJ3BtrCcgDpCJOq/CfonLDUxNpmKfJHo2XNeSKBEN3PeNHzz6RtZ2G/SEZiRY
	 c4BR0wsH9E5pMADuXyKnNNhwpkSnR8En13PXkENgvZHneMHjuOL/qHnpn80PpmuNDbLhR
	 ZwwQnP4qQOhkyY1r7zjzde648stNyQLWACID7ZogzWWteKj1JwH1PQr28taJAUeOq1OM7
	 9KJDC+mmJBUGJOmTVjb30HFbca8E7+hG2Ec075hJsle/PF5QTSKfXHErLejm4PX2kNSjP
	 ONf8I+NH09+XUboCRYmIoSQKLXRtDsJoS4rbHBglqqKFNM/K/7jGfb4246aK/hNq4ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1p3sNv9U0haI1WuvGOs57nA1tjZY34nraLgEt04/CiM=;
	b=1sKOTjc5mdq6bmPqd2slGqTAgS0Etmzs7W2SIX/6N6fsoxlw0mzuPjXaqFfmwyQKQE8N
	 p2WXcksMlLO33ejkOTaOQ6SCSOpCsBmuuM4niIKOQwVtpLGcJ8wVTFEuVHvXYGbE+LGsB
	 uXKlGEfm/hst9cb4KhnGW2CjZaOrVU4eTBzkwatAdUkEovxKsFe0IGoUrR3MpYe4cjX17
	 hl23aEis54cR255gqZRtlUglVKcMxmeO/63g9RU1n4GOYvKM5YeFoQoA0HarIER91Z5w0
	 eZLuJWILN1XM9lkil9MArDTvzuSSv/jrn308/Ac73tB37k+lVBPYpCNBvwkSKB2opyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXCBCBHs;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95090606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95090606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXCBCBHs
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so8209125e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242582; x=1794847382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1p3sNv9U0haI1WuvGOs57nA1tjZY34nraLgEt04/CiM=;
        b=SXCBCBHsSo1J3DlH0uGTefaGDiNWDaEN/fnhbLD8gFE+j797GgHng4PCUXhmlz/IwZ
         Xzf0cqS65Wz1nm33DkPDkGlAXzU2rNlNPHnuqPrtbCo099yQIwByXzcd3gRqQuJMAXtC
         fKjKxOq/AX/4sfUdAzFjkNSA63Vlp5t2SJgU87Ei8z7TbTIwnaQFq2AdCrXQB1H8T6O3
         1Fq6Jeau9PjXj8VsM3fc7CDDERRxqAAQUpPqX3ueemsIE+SgEYpSj/WHycpoeb5qGBOF
         hMAWXtj6H0FIFhuLJZwLzGcchMW936rAoYj6P/6MEEkCtXEfAIYwVYljth/8G9HcYpff
         7dsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242582; x=1794847382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1p3sNv9U0haI1WuvGOs57nA1tjZY34nraLgEt04/CiM=;
        b=hf74iCJYkYowfnYdovszGb1JPNTRJghOdOwuHOIeqUxpKdZSRdyYRJWhbNOYdqi7/f
         hI2diRDMxAJEqr/SfH0PHYC5v7pBWUyHquxwI6ZDNRrSJvSF3hZyaZDJQIjdmLHgUEHk
         DD/b3vjs6fnsMxXJmaTl33jTzpe2SFfElm+nChOxEwBGz+FTk7+KiLojpt/WeJU9KNQ6
         6H0E6fJJAEqQexnFZqawsfJdNzScyYrVQTaaTZdEk9pt/3EszEA+HwjEBPRLqJi6KOCM
         YgF3F5uWMTuDM2M4rq9xltAmPHxN9zxZh/A8nVcW6gkZ69wuwBi8C/CDKP1hMhcMZh+w
         vQxQ==
X-Forwarded-Encrypted: i=1; AL+hErGWCimd9ydLg3ZSd9dBvb2XNqaZbV8ZTMe1U8t2xp12wi7UffqmU2EasngS3xHTazvsg/fBXZqrWQ4BhpA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VlJ+/KpljUvNlUPXtas9mqZ6s/rZWpo5ViSk/y73DaBXVRgio
	kFWTRCxvsDkmkRsNCE/GFd4VuXXGUCETZtUP/o0S7uwy3cB2wN41nOk=
X-Gm-Gg: AYBFou2bttOMtvinRFL6Jev3wui9iNHxyz/oIpr24XxBT+jPNqmJ5GFSm+ZTQcsvDS3
	gZvm8+bvLqztUXtuJ+4XGmU6WBxyP6c9pYVpo8bhjSXY+jgfDuzODxU6jHRrIpbtLGXMEODZnqM
	SX8Vs7cUMCoab5pEFM4pl+PtFz9UYtnnXmdiS4WkWxLGKzfORR7XF9QUDiQLDBN5x3V0ziUUNUq
	Fz4aoFYLhW5Z66Jwcc5moSAj3+S3UwkjVIkni2MLsvnapqhNUx+p866zRMO+ReMq+rh7K4QF4fX
	PBCEwA1GDWRK3x7FIP15jt8GrUhacaXL+iliWU4sOEoEm5VU+tvLTYscwKfG3m6vOwA4YzNVU4e
	GLL/pnKC3FasewtvBhdDF9Y99P7JvhG319lyrehLDwdV0oNCPxPtBCyUv1LPhOodty1ikqTBwtC
	GdYuVPImXGqXa5irMxdgaka+U6TliwVrIi4tbmQSQCyN4htjBjcTQN9RgGvkO36o0gZQ0NxNL/r
	RJK0fKlrrXjJ9XQtCn7kWiP9FSATE5e7hjbSneOuWCZ8vbwLekw8dv5uapivh1RD6G2KhHnRlom
	ZyLeou8W9KZWBUbKi9Ic+1U/HbXFEV+5p9s7UPYPu1EXgj/urMyyhsS+lrrxoyBQJa7LHoIkTyH
	bVVWtznhxqv//3RaSpXLJdZlk1uUxjxGH41AQ/MzdEDrEl4oJoYnDKqw3bDhryuDfUcCvbgediQ
	==
X-Received: by 2002:a05:600c:46d1:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4b960d9c486mr96080385e9.5.1794242581971;
        Mon, 09 Nov 2026 08:43:01 -0800 (PST)
Received: from chateau ([194.65.85.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm441798645e9.11.2026.11.09.08.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:43:01 -0800 (PST)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arpith Alexander <arpith99@gmail.com>,
	Jake Steinman <j@metarealtyinc.ca>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] ipu-bridge: HM1092 entry hides IVSC-attached OV02C10 on Dell XPS 16 9640
Date: Mon,  9 Nov 2026 16:42:49 +0000
Message-ID: <regression-followup.20261109163952.eaa256f0cc02@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com>
References: <20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com>
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

I won't send the patch I mentioned: Arpith Alexander already posted the
same change on November 4, and I've replied there with my Tested-by:
https://lore.kernel.org/r/20261103200226.100989-1-arpith99@gmail.com/

A correction to the revert option: there is no HM1092 driver in
mainline or linux-next yet, but one is under review on this list,
including ACPI enumeration for HIMX1092:
https://lore.kernel.org/r/20261106121907.42745-1-j@metarealtyinc.ca/

#regzbot monitor: https://lore.kernel.org/all/20261103200226.100989-1-arpith99@gmail.com/
#regzbot fix: media: ivsc: csi: Add sensor node in bound callback

Thanks,
Sergey
