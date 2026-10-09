Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5731C4D9562
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548703; cv=none; b=Cp9sTT8Q0jo/kP8K+w/MSZcs5FvQr+Rwe2ptOvppq6M5oKO53dPD+fnHRQYlyGfyPt7YAPqStdxr/MjFle8/fBIgLtAFP6oq/8RWVXLXPYtUsg/EPa7GMBl0TiU+tcfXabKAqMNlLBtGyqQER5nJ6zMu8C7XAEZtUbA0dE+lEe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548703; c=relaxed/simple;
	bh=8RWnBIY88AM13j6DvqP1Xg+77UY/JVZIRlFkQYtyW5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tX7yhk7UBNOjRLugYCe0sB12BPHKLc3E9nJ7dVrov6hySAN9fgB9Z6BgaUvQqDDrFhsOCSUiQl05iRKUUJhkkbfe/Gm3yRsrKfngCrTgarGNsbVkgKK3rOFLAqUEKm+BITV8Rc5EuDGKfQztlfj1fQfgGoGLrRQXPN5GQooUpL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=oBzBwAai; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="oBzBwAai"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a4c47bb6e3so2134499a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791548692; x=1792153492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjXf3zywhfYnG5TRw5ezXLQRr19gQLXq9BEDfkjxJeY=;
        b=oBzBwAaiMSdwpE29e9S84nELrAAWn1z4l6GooekDtuQX3y1Uu6La1fzvYwqvZ5HY2O
         DTbCLbqg2nZuKb50vwaOXAUlkqTdvITK61yd1eUEtcYc2VuGLjRnqG1ocObE+U1gXNCT
         OpN4AfCf+B3mkegCgunA0ZTrI3CXR9GcL2w3ESxWvnr7iR6P6LbSjncuwwrELWt8zb83
         fm/ZafD77x5SP931vPvGZXRV0wb3q+7cW679/3AWIIp+otbARYEIjlrGnXJeUYHLxTk5
         H00nkel/ufRN/8do9KVjYOAsDJJZj+1tqlBIPdP8gnhdfGq7QZVq2+41xrzfq7QdAjfr
         7yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548692; x=1792153492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjXf3zywhfYnG5TRw5ezXLQRr19gQLXq9BEDfkjxJeY=;
        b=kAQbkvWnqLEuFp2fbjbfLuyMbmPejzWlrEXQNzlEQdnBLdjVxm4EiJH46lBs9aNuao
         ctTjupoyjnn3HFDnT4S0P+Efe573T66Q4s3lXSvU6cS15yJ19l3HaKBepNiMA8m2Fjgq
         Vcz4uCxT4/NMql8TZHWlSBHfj2DHV6Go07nFsgERXOJWcEkEmL/2+sOffzjdzUjBiezH
         +XY4IH3Q72aV86qb4UeI+XoWLNWnPBE/aFfgRRBxeyRo+YF+XHz1drU5qte5xW0IazJX
         JKaXCtMPxtfBBzAPlx0oax1lkYV9U+CwloPGqwtbK5kbZA2nzqcYeTCXZ5MOG6x/n3b6
         1mwg==
X-Forwarded-Encrypted: i=1; AKwUvBzM2PoxLOdZSF3tKXnfy92bYr2KdbxpEN+61tFlcFfasGESfQfznXp001ZhHbOdEp1QC0/S3E99lXcubMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe9K7jjhBnCrFV1XJi0ai+YtLD7eTaFWlA8jiLrsgjGwi1K7UG
	TH7hSKDUVJdmcVRSUmpdfyL10j+4ARScKq3noU4iV/IH92ERP7IUfj8cLmUld6MS1io=
X-Gm-Gg: AYBFou2C7X6Qoz6QIqNXZF7IGLpaMW6awKAYTIH04PjcA/EfzJ/bsYTl3VR/YEhQY2u
	I1etpTGbbl1OYzZ2aPaNjqf7ghJtjogtKl9WRN67FtEQUs1BtlQB1IuWTKhlfqs4JKW4xy2Kc03
	21JkA24EkgQnSmivSNGw8n/pm/i4zdjbyLk2IHAqwEJMhJ1ESZZhHdx5MJKV3NM1R4JChtpQNgN
	lD/Pir9m10MJtY3qXfdxOvtIy3/64ICsg1SLxZPmK56E2CP0Li65WAH6tw2THU/8U7DZZd6KiWm
	9TFsz+uKjpRRfxnaJcTqWSahUrrJ6MeZt+RRVun6zUUMrB1Lw9dNdX1c342QvQpRJ+nGRPz9VvJ
	VqRKuDs6dwGFffiCWEb6qf+3lqDkwndRbsUvneMS5jGwqpgIvuzO9E3LPQoihg3ZdWmGUEHbi9f
	gkpCPeJ9ZNcVFpA5Lzi6XnWMJNAIsBkduc+cX6otVz4btxqqGyGH0MTd4wn1h2R0ZcjnsPXheRJ
	A201RXoc9VUMQrRgM9+/Gk6sKWaJ4GAWS1H65Xa
X-Received: by 2002:a17:90b:2687:b0:3ab:22fe:b13a with SMTP id 98e67ed59e1d1-3ab3a79a2efmr1620761a91.40.1791548692476;
        Fri, 09 Oct 2026 05:24:52 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab55e41eefsm1660502a91.10.2026.10.09.05.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:24:51 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 11/13] MAINTAINERS: amt: cover the amt headers and selftests
Date: Fri,  9 Oct 2026 12:24:24 +0000
Message-ID: <20261009122426.551178-12-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009122426.551178-1-omar@blockcast.net>
References: <20261009122426.551178-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AMT entry lists only drivers/net/amt.c, so get_maintainer.pl does
not find the AMT maintainer for changes to include/net/amt.h,
include/uapi/linux/amt.h or tools/testing/selftests/net/amt.sh, and this
series touches the first two and adds selftests next to the third. Add
the two headers, and a glob that covers amt.sh and the new amt_*.sh
scripts.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 509b35b..51799f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1461,6 +1461,9 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
 F:	drivers/net/amt.c
+F:	include/net/amt.h
+F:	include/uapi/linux/amt.h
+F:	tools/testing/selftests/net/amt*.sh
 
 ANALOG DEVICES INC AD3530R DRIVER
 M:	Kim Seer Paller <kimseer.paller@analog.com>
-- 
2.43.0

