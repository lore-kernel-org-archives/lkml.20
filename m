Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517342FE057
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790137709; cv=none; b=He64vMzaDRZH+tzm2vcG/dYBw80aFLdRjlIBvWwsBd2DtmNWeI7x9Ub3RqfXXnTkwp854U0e1pvnDXmCfzZHknj68KCffy5alrBYwqKXor9wPav9h4D6F8r0cOnSg3pQzcIf1QP0OQUFaI/CojAxb/KH5M5QFQFaNsHpQIjJYF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790137709; c=relaxed/simple;
	bh=IqV1Sr0fSrDMt47qWNQ+9YAMvUWzYdiSXARmQmR1aMs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OSaicYWXebfbYo73UkcpFdRAgUUGjQlz+Fjd1mhvbxxItX/zgnEwy6vyZ7zFJlCBpmVFVSCfRaHcaPA6x/JtlqWeyJeEdk8QycKRybGpyfUaQ7joxdsThv14dsbaL10+gTNh+rERC/43tXjanPxk/l7SVlcovOU9S3acdX+67U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YEkbdkaw; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YEkbdkaw"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so654837a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790137708; x=1790742508; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ngy4XhNxX90C6pR7bGxz/LIb3bO/nvGfahStoZKtl5Q=;
        b=YEkbdkawAy/a8+2S4ylWed96ck+j1g+9bGox3XZ935krOO8g48/lUGl8Sx9OmuQPJR
         AV/szlby6OWJKuV02BqVeC6yQUbSc226IgiC+BcbuVtd/b4i5Tze+/WFKpbaXFzQegea
         /2xIi6JdvR2U3Y57zMe2n9QmxzRoCtks2CR2D4mTi2XztUs2M5eCmelpGI3HeV6F2f6m
         DdtAzSn3OoBUw6D/pdqtzPk57/WmLQVlR0VLYQU3SoguJefm5nkCqbzWTG5qcH3leFzt
         coruBivqCIr4YQK9fbDRK4btcq5VfreJTZWDdEt18ONv9SPz04mRvxv2u+oMAcLNdzLZ
         hm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790137708; x=1790742508;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngy4XhNxX90C6pR7bGxz/LIb3bO/nvGfahStoZKtl5Q=;
        b=gL1SRhJDmvso66lMNTSB5GQNJVOMEe8HpF9kGOOeXmv44CZSXxo3tRVASU/v1gqala
         cRpJL7nyGMqzhMQG2AcowagZFcPnDkZTVmF+vBYkFvboqHFuHCUKdRJ4y4V7oIf+VVLz
         ggR4EWEJMbLeVDJHelt5ICKUb1uYnZLpxRrVd2vNIyqxnuP/V7iJTOI7fhi9xmkvQm2d
         JCgCTbUTkjXhzsr4p14VCkNZaG83OBS/RtJq8TYK31fwwuPtH9mz0g9FvLM9wpn8tebD
         J93PlyfAjff3bkPQ/0vhqtNsgGRWIlabyxwRK3Fh1F8gt1mPmNUzlGwyWqUIXKb31aDl
         v48g==
X-Forwarded-Encrypted: i=1; AKwUvByeyPCPSbAzmMnT1jUkYOKJdVUvXYIADs/82k/pv9rWwyfg26Yocy47kH4djtbQzHmMf+55pdKUlIo2Ft8=@vger.kernel.org
X-Gm-Message-State: AFuF++klNcWB02TTE+nGTCbTFL9ATEP6HcAF5s6BXKxnrw3+yb51kDR5
	DzMAxLeIPHHtIgn1aZjIF60EJpgwlEdEcz/+ueIP8S3FhLJBSwucrXgcegGy7V+EKD4byBHI5in
	A
X-Received: from pjbkr5.prod.google.com ([2002:a17:90b:4905:b0:3a0:7de0:6fac])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4f8a:b0:3a0:42a9:9c81
 with SMTP id 98e67ed59e1d1-3a07e65d0d7mr1242952a91.17.1790137707448; Tue, 22
 Sep 2026 21:28:27 -0700 (PDT)
Date: Wed, 23 Sep 2026 04:28:25 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923042825.2558762-1-morbo@google.com>
Subject: [PATCH] iio: add __counted_by_ptr attribute to channels in struct iio_dev
From: Bill Wendling <morbo@google.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, "=?UTF-8?q?Nuno=20S=C3=A1?=" <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

In 'struct iio_dev', the 'channels' pointer refers to an array of IIO
channel specifications ('struct iio_chan_spec const'), and the size of
this array is tracked by the 'num_channels' field within the same
struct.

Applying the '__counted_by_ptr' attribute to 'channels' allows KASAN
and compiler-based bounds checkers to verify that accesses to 'channels'
remain within bounds at runtime.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/iio/iio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 711c00f67371..20505139a61b 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -648,7 +648,7 @@ struct iio_dev {
 	struct iio_poll_func		*pollfunc;
 	struct iio_poll_func		*pollfunc_event;
 
-	struct iio_chan_spec const	*channels;
+	struct iio_chan_spec const	*channels __counted_by_ptr(num_channels);
 	int				num_channels;
 
 	const char			*name;
-- 
2.55.0.1082.g2b9226bbc0-goog

