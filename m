Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894665;
	b=O7loWiOClcOjZ6l+rNXIf3GdACjjbQLuTfUE9+lPCoNJtht/wEZlte5T3i/3dxnXNkFq
	 yeU8/VUWohYvAKaiO6VEtsyAYtmVvJXa8KE+MYPU/V1hQT4NtlGcho1nsiBt+9DCY2fnP
	 f7HNDC9k/zAAOjmRyoQUBoECUW/1bXsUeEKVmeWDhxeeiYIfh8Y8hru3EWGxcIAZYrH01
	 SQRcd8Tvb7F64itCEvL8hoTQ4MzXugYrpiWNKsK4cPC4jw25Wg/L8E3xzxfFP3gh3VOJB
	 79lyowYaHDAPG1GO4x0ZsAEjQXFC00WHV7lvQDIFPuUVObrDfdrlZi4P4PzpapJ7FxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PmU9LeRVfJIomttwTfI12hurbmJm5G5qfWSq52y0m8o=;
	b=KnMpYenkFG94HUP3SsiC3C8RdT3G8bgPpafZ4AdU5PNjwDho/JdpLg8LZ/GokcZ7tulM
	 lqFzo9jnQjdtvldkdGeab3nnS2B7JsCnzWTqVIXpxlQVsi+d+uLcwCw6GQEG7uwj9of6T
	 QNCOd7iYjvx4PYOtoXmrJAdAfskdu8DByTBSXkL9UHfIIVb9qKqdqXkASmEOCQP4CCK3O
	 Eu/wsolOc1t/xKNxIs5E450bs6+yUAeeDbh0pJVUZD/X0U93cEgzFiq3R+vOdEJ/ALo8m
	 Qtme+oqlIpICCeOouHlLxJhrUpMtdbk/FRdAUNyLYXd6MebzjGV1MxMD0qCC/m7wnWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pu6AoDu3;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D84606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D84606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pu6AoDu3
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4e4a4d77e5bso1790833b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792894664; x=1793499464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PmU9LeRVfJIomttwTfI12hurbmJm5G5qfWSq52y0m8o=;
        b=pu6AoDu3aCeUvw4nLmqGFPqbIm2HBjwQIXqoXBzY/7qK7aiKJshMUp6t4G1dpv9To4
         J7XTpNw1bEquOgVLoV0hG30OUBNjN2LrH3L8YZzk7wPfvcZ1JCcaHToB46NUK4acGvIr
         PBLviwvVhGKnsZVyHiNuL08WPjwCXCP7+PNhCeFVwqZUTd21Zyweniy9mOtrhEvFpliN
         yEx0usVMwkaNP3+tAsXA6xtOaUgfmA88F9l4TC2KF1F7To/hmIVzu/RVtKQTEofrOMXm
         JyAiCBaElEkrNGiq0iDou0wKC47yRZzjmuC6FJaydy3a3FwTl9Z+etxazyx4lxptORUI
         teKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894664; x=1793499464;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmU9LeRVfJIomttwTfI12hurbmJm5G5qfWSq52y0m8o=;
        b=H3W7obajScvXLru7DywTtvhGySAdMrqxRi8Ii0vjO473KpBikVrP5q/NYDcGj4H1LB
         9K/YvHCMtwGridDVws4aGT5pPTM5t04YUu5XidxX2cQw16znqg2j566meYjCifqvrzXn
         0/DBq4IcuolpNoAbEJlcmDf5xCbzl2TCN14Bx+dQCySYyL7KBpR23hx59hr+0Ib8UCI6
         zQxDftLWIX1JI9pdg0PeyVm7JFiaiDJ7S8bA1mg2BQFzsP5yS9O+fRdq+UrvlvevHSfD
         Z996tBG3ndSeK61EtImzV3E/T6ccUlgi5eratOhtbmRyfms/Ebu0qxKPBTkFWXBUDAlN
         FHPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSKzDdj/5PpXT9XesPtVp7eJYQoCTU6xLvHLonuxeRRjAS8GuKagjFnQa9TMWL6Tm9G5REzHDiZixGhMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEWuh+LGGIyX20UQhyyCpGudNS6ZaigOIzj4H77uoUaWLvsSCz
	Z5FR7zl7rtYvGFIyhpzmHY8UI8WYyR7uZsMi3m4fPrN8LFX96f3C8+Ry
X-Gm-Gg: AYBFou3rVT/8//MeEmlzeFRpDrtJpUi+YEx0y9DME+y3Xz8WAwXa+UlLz9liqDM8b24
	Ex7t9+YjK2KMgzLPJonswapNxerKmKTLUipGroJbSX4ZXsDQijey7SiN1Ztbf8GsLN4mQrqiJyh
	LB7Y+BQsKnElOslzKkc6xN6cfJGG70ZFLU3aIbqCKBSdhwEdxbelibr3tzR0J76OPlUXPaxYqzY
	4XUuDaxADCZfs6cug9vazeCOX/HR9LC1kxBr4jr5xKI699mxHUTyYXVx3GmqaR1CCaP+nDRkUYM
	uXwWaBO6CLm8CsZjGPtx2b8iQrAQvhp5A9OWdgkRowvRH4C7vhXp8zgFzYjDXltGRnX3JUH5Z4/
	XApIDsHYZo7w09hEEMqrXls/fkHIwh4Qov8ALvj/JLsD4EGaFVEaW/NlhWmm/Fa/rb1bJP6q3nR
	c1dfB+xyBQtA9N/7fPcAtEKm4lgDeVUkM9XINdSOr+L3fHwHMKT8uqsxtT+xCTauui9imuyfkfS
	qx+TZeKr+/XjfEXlU4gC3NNHe39NJKkwXkFqIOeGy38EUYaSPQVz+ceGZGjzhtWt+gryQ==
X-Received: by 2002:a05:6808:3196:b0:4f0:2d60:f0f4 with SMTP id 5614622812f47-55c00280f59mr1461562b6e.17.1792894663783;
        Sat, 24 Oct 2026 19:17:43 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c040806a7sm2433986b6e.2.2026.10.24.19.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:17:42 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: dhowells@redhat.com
Cc: Leizhen Zhang <lzsx618@gmail.com>,
	akpm@linux-foundation.org,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] asn1_compiler: fix heap overflows on small or token-dense grammars
Date: Sat, 24 Oct 2026 21:16:54 -0500
Message-Id: <20261025021654.519754-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008164004.3668307-1-lzsx618@gmail.com>
References: <20261008164004.3668307-1-lzsx618@gmail.com>
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

Hi David,

Please drop this one. I went back and ran an ASan build of
asn1_compiler over every .asn1 grammar in the tree, and none of the 15
gets anywhere near the token-count assumption; only hand-written inputs
like "{}" or a comment-only file do. Since the compiler only ever sees
in-tree grammars, this is not a bug a real build can hit, and I would
rather not add churn for it.

Sorry for the noise.

Thanks,
Leizhen
