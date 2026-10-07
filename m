Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7203CF1EF
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365427; cv=none; b=lMWbEkE61Bwgnwd62gQftyzezs4JwRVasP77EIOzmn+hT3Flt8ZW2M638BhRcE9+C46lp2RoZLdCqzbkr/Ta+Ab2ywiuz/oqHJhaMKVvVgGrbknWFW/KLhodse/oa+qIXcX1Bn47VOjTzbV6no/uI/9blSZedpJcpPrxneCosFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365427; c=relaxed/simple;
	bh=fnREJU8RfOH4SBc/tGBqPZDLHV9OjtDiUqOdQW60m08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F7WpsvQYIGtnfxeYdIxoB0OKncuXLiwL3JNTwxmNB+iuU5cFbdAGBuuzWaz4T+E5/Nxs1j0rLi+sn8/0CuJCqmNcxQ9UUtuunbRWLKf1vWA/9h8lrHlARwWi+bGvSnDz3bZdaz1Z6EV/8ACUSU6Z4DnvLFucMgXrZKxeC0rJ8Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kiyeFulZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kiyeFulZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso34847905e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791365412; x=1791970212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwajthKf2+GbCWoqy9WGbtWnmSsX9wI1UGn45I35+Xc=;
        b=kiyeFulZHm4QlGeaDH4nyYtB25+6jxeIAwyUl1zVB1kvSrK2+CM274/WHlCaKQC+7U
         trXikVY3xoegh0E2oH+99vLrOjCB2AC6Vww7jF6FYeekXoof/d6Ji6AM7RoGyyVbQQ4p
         xfPFEXBGvgCEJDyCEXGQ4+IOzSIEZPMF/mHDGIDqRi8iT2299su5M21XvQINCaZnuW/m
         M5txF9urzGhnVhf4HwPbat3pVA+rkOdEtQx1GbosPEZ+xhd2sLyNeQ8lUc+6lXCR/M3w
         I7P8q17gyBp7LqQWiP0Oohl8xH1e08haJKKZGlBTIJNJbFfo0m8pb/YuigQctwekY8xc
         8fFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365412; x=1791970212;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwajthKf2+GbCWoqy9WGbtWnmSsX9wI1UGn45I35+Xc=;
        b=xvVWyciYBN6QfDVzwQPPFAH5i2uYtDw9vt8j1IHPHLFcU0yGUsmM6hQ1Qm3BPxeDYs
         SC6/ESoAI4xCm8TSKm5re6dCDWn65BwLEQD8TGR/02QZZl3fk3i/A0Xh0jtRQ//KmoLs
         ypGK3ET4XkySEabo4tWirN4/0iQiBtEP8oFG0tfomL5jFcuexBTJtIfkiKgX+qFtDcZj
         SeExBixDJaedOWC4afalaGhXSSnrYbHxUe4gMkwggKWl2Poa6bEgIShJiDuzPmXe0f7M
         GUlWPL9FREmSWii2hem5v2WCbCNrYGLU0+G2vA9sSfzQZZBckdpwDZKetY+J9THg6zXj
         qmww==
X-Forwarded-Encrypted: i=1; AKwUvByN39QDR/QR9sc5TewKjahqvVGGi8P72WYFJJ05comdcZpCo1jl9N+BBvC17gLRahNh+Ddylrxtl+I+nDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lNHvH+SBVChhrr+8dpHk7uCtRLqBJ/gJm3NHa/FWlwdtgJeZVe
	fOFAn/MThZs/cBFdOySMKpWkYXMsRtBaCGZ9/XLOy0w/QAx4WBgL1rI+P3507iNwoXHbhZk7FP+
	87iGLBXI=
X-Gm-Gg: AYBFou01CARAAfd3An++BZ2DvUtvnNFH6bOyH9y/scZFD1fLJ3vjJROsMFgm3o9+sOf
	o27B9ue6qh91ssE2KJ2k2Fh2ZRff1rrE0ruBXCH9+mmyyOIcWAvORDdtOfHte/VDzwBXhkjkGbm
	5+iiUr41MyoZ34Bbxsxh65jWbOyHW+ogbRAKJR+1Vg/2eaIs3fo45ELeN4Ce5Uc+LHDzxoKkufK
	OgJrKrbHCOwIN8qeQqOPw5ZQui9xuejEi6l0YR3nV+P2ZzbHvxvAn6GecJYtCgiN+YaE96Sr2c7
	6GIgCxlSXhXglenOv8HWLNNTBAR4vKbFmiO5ehLDM/biy+u1mG99TeYGGFG/prb2FDSmfA8dVBm
	1bI/ul//RlfWHlqqdz+ttpNDvwAnDbZsUeaWPmwN5X+0z26FnpzNn/iQTRz1U73BQ/MufuMq8+7
	7C3eAc1oxsGkRpYF2JmDI9Z1fawwH8mKPN2U1iNGaEhVX1+TlwVd/rKdlO7cEh4qeFLDSvgWKE9
	v6r09YzZ0UkFAU=
X-Received: by 2002:a05:600c:3b98:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-4a180422c02mr24533235e9.10.1791365411698;
        Wed, 07 Oct 2026 02:30:11 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d13a01sm4753433f8f.29.2026.10.07.02.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:30:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phucduc.bui@gmail.com
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Liam Beguin <lvb@xiphos.com>
In-Reply-To: <20261006110501.57051-1-phucduc.bui@gmail.com>
References: <20261006110501.57051-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] clk: lmk04832: Handle reset GPIO lookup errors
Message-Id: <179136541048.165493.11954789391773038389.b4-ty@b4>
Date: Wed, 07 Oct 2026 11:30:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

Applied to clk/linux.git (clk-next), thanks!

[1/1] clk: lmk04832: Handle reset GPIO lookup errors
      commit: da51c9a6f60ab1eead089c23448c9ee6a192635b

Best regards,
--
Jerome

