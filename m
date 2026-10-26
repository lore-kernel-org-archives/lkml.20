Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023342;
	b=sm5IOqB0peBkI/egbON6lbFFcQsM2Gy2G26mMZZjPwQBxQAlS5ykW00sM9fyhQThhN6X
	 JnClX7CiSkxFCiMztHvJtaVyPtJjhdHz7eVpjlZQA96VPOScd8zP3kStC+ihDEuX3Phs7
	 VZ5HKIOxz/+bFKY+KUTy4ZqvzLBRCPTFF1uUMX1D1FnSeuggiamdqbELvS/P9WnYsPC0W
	 sZ2fb4FMrPIeCM7+xAkkQP6e/ZfA05ShlfZVE8c4KwnN1GiQnZu1zo4yyLNh331+rEw1D
	 EdRuQC+LHGgiaBP0f82jKfOXeDFlurFVO9qb12xxtAKzo0y5twBL5MTV/xv0f5hdjJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023342;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Nn2OMO4AikgJA6fkHisZmr1067bLG0yqvIW+IjNCZUY=;
	b=tnYSqMwfl+LmhnC+XTFIJt3hfblOLiWqIMpYla3Y1O+CB2VePIABnmS1lqws/N8N36WM
	 z4R+uhRv8d3iofP80VgC4PPBIpaO6XnV4pb0UnQaNy7TrwDSW8JPldt6PgyooYQyBeKI6
	 jK6khuH3sa96UgiK2OXWqXW3jJ8INrNChcPAumqRj8aq2A/hiKQqgmu4BaDGgAVhM25fV
	 XIl+pZxq3wjBr0kbARQyKeP9zCJ8P+EUh7R0eG2S2TyeawsKwIwzESDrt9k/BAqXxkp5p
	 RPR1uDyoYQ9T16WOBqEhAOpFuUDcIqKSZPXKFUKpPFbAUabT+yfvbDFqv78OwzLudeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=t7q7GT9g;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCDA606A31A;
	Mon, 26 Oct 2026 14:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFCDA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=t7q7GT9g
Received: from pb-laptop.local (185.221.143.99.nat.pool.zt.hu [185.221.143.99])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A787D0;
	Mon, 26 Oct 2026 15:00:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793023208;
	bh=a1bokJYiNKVpjUCuTru97XmOs+tcjmh1tWAg6PLofas=;
	h=From:To:Cc:Subject:Date:From;
	b=t7q7GT9gNo7l1P0EYDhXdGr6mdrIz95w5sBf9tOd8IygAEUE20cqLCsEG9+lZeqHY
	 KlHN1gP6D2sbct83LUbe2cvFnKdbFFsFy/dENCWbqBGwYzKcRlns1BkrXe66egn/yc
	 lvRovKaft9xGkWLmjTe5tUyHMd4RsB7EEhvwwsUU=
From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Subject: [PATCH v1] media: rppx1: wbmeas: Fix uapi documentation
Date: Mon, 26 Oct 2026 15:02:15 +0100
Message-ID: <20261026140215.603906-1-barnabas.pocze+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.56.0
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

The format is Q4.12 as already mentioned earlier in the documentation.

Fixes: 884d6794a816 ("media: rppx1: wbmeas: Add support for white balance measurement")
Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
---
 include/uapi/linux/media/dreamchip/rppx1-config.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 3507a9ab03dfd..f7c5a88922444 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -154,7 +154,7 @@ enum rppx1_wbmeas_mode {
  *	   @ymax_cmp is set to enabled, 24 bits
  * @max_csum: chrominance sum maximum value, 24 bits
  * @min_c: chrominance minimum value, 24 bits
- * @ccor_coeff: coefficients for color conversion matrix, signed 16 bits Q4.6
+ * @ccor_coeff: coefficients for color conversion matrix, signed 16 bits Q4.12
  * @reserved2: padding
  * @ccor_offs: R-G-B color conversion coefficients, signed 25 bits 2's complement
  * @reserved3: padding
-- 
2.56.0

