Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299B23C1D72
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702813; cv=none; b=MHavKoXOiIezHQNBmQ8R4jUigFFyHczUMPw2Iws8Vq8aScLvTsnFfweABwtQnOJ+CPvkwr3A4NJdG10cAPa3BqAnOvPvNhxf4glTrywuS7SWTBL1YCL0Te1yVEXf9mVWsqKLJZGwKZvZR/Om5INy0/CqeQOsDD0Ngzqk0I2hAKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702813; c=relaxed/simple;
	bh=KKItR8FZ9hix+/TL0aQ9eu6vPKiFhpC7kUkQVOqGo7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lfRkAbbOAsjYQSI28Qjc9d7sCmUdfx41+lCYar2o/RuSdCpG9zf2PddXzf5lIj5Kzin8YCMALsHRZhPcQM7j6RbluH4DZI7/z9k5S10NYWpVeKDdtHXgJHJxiuBpUEXgzJsnL5M9RMUHxUPXom3P7bSiEQExwZbT69Z7eWwuyO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SI0B0ema; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SI0B0ema"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed9866so2361355ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702811; x=1790307611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ubHKRJ5xVQmev0vSOqthTpsahkuZO16pcf4T5Ysx2tg=;
        b=SI0B0emaz9dnKc2Ypxl8n4Y8s0CJM55tXYONZv1Fs9rMpag7s9CQvZuz9RvJhjojFL
         VOyk+iVjWv4Ik97Iic7agVfXzh5I1uJ7m0nQ/ygg4xwS7XFOGGttuv59+YirhPszPTdf
         3ONQnPctVkHEr/sTViBWB4QiEP2gqii2fWyJSHcSIfJIQh+lKTJXoJIBaS8NGTN9jyUe
         VclpWzG/16tNlmsE9i/KA5ANhQ8mJkGi38ssT+OZP2aNknZPmuROTocgNYKI3xGpq9oA
         qhD7qXmRetCvKdy85XcbraarEybbUKT3Iw5B8dnZ1q47qaojx8kkmqYqUBs4SNiGi0BU
         OPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702811; x=1790307611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ubHKRJ5xVQmev0vSOqthTpsahkuZO16pcf4T5Ysx2tg=;
        b=s6UiuEUEzIaBmfiUB9I8ePa1q3F0U6xdCrnSmg7t52mlQoedxPKQ3Ge4RCLALHBkO2
         5XufeS/Hf4EQIZNBx0nH4aWFwyDsdPKBXhZz6gsJPJ0KXPMwnqzSyUFIFwR92N9dNB6g
         9kTB7Xom7eSShctj5mHzuaSFKJJj2+fSmcVriZ2RgW4J8k+Nal8e8uVcNA1dw4Pt0QgW
         Tv8lpB5D1DVhrq+uGvn24TXAkiqfpMWvIfW9kGUUNgV+GBPWWyHXh9WeGWuEPjb1Vo1m
         NozupCuiZSmcb0391gu/ExS9YDzWGWYBaKQuS8RC+bUHQU1UBZESU5fPUxZxk2peJxwK
         PmYw==
X-Forwarded-Encrypted: i=1; AKwUvBx2XdfAByuCID6C0B2gZvq4tT1qIqqvG1qQKubSaEQI5blu38q7b5r4WD/V7ENWsDEQY01DHFlj17tLjJo=@vger.kernel.org
X-Gm-Message-State: AFuF++knHhjmud1dA9kmHS2A9eB5jRCdHjE8KecoGq6Yjbz3OXh29i/W
	MJaBsV9evT+pH4VcSl4NX2rmGPI+5f0h90C6AC3xLpYagncqKTexztGc
X-Gm-Gg: AYBFou3fEfibCz0H5lrQBvdI5klzWC8zKJ4kDnYfnxw4dbyKAsTHOmwcnBKTUV8T+Hn
	r/Z9Hcoq6SBjMINPfthXTmq6WVBHyUuBVaaUrDPnBcPHV0rwWc8aB19rBBmlYnNOdd6Y27omuoA
	XbYuOawsButoUELnwZHhJHeqJY0LiQ/eg5J9kud6DSF2iLZ3KfFtEmvL/+7jJMk1PWtLfE4kV2I
	ZLQO7MCvUFTjoj/uJpSWyGmn/PqqtIqQq5KjHW41FvunJUdmSWDXtq3zmK+ytOTimcY8rDUn1CP
	BqaQpXJnVIC/F6OSDzyhCsfU3UnzhZWnDHtam1sSc8CFwEUVZx4J7yvYUo0wUbqoXwSZzw//vDg
	i8dqLpviEV3/WVufTP9JoqJnP6obEXXzaTa47Yc9nLX0/9jtvfZarKeh55omswGY7VZtSG8rLPX
	M0wD3bmu8DK+VXsIBzOnGDg3H/vt9Y/9sYiW2SPQrtrQIGb0aSWKpuSTAs7go+NF70VpIuUcCJQ
	9ChjeUZvleEAZ1rraZQyd0qKxFM1fY05hSQsKY=
X-Received: by 2002:a17:903:2350:b0:2dd:4168:7bd3 with SMTP id d9443c01a7336-2ddb1adec54mr28702315ad.12.1789702811157;
        Thu, 17 Sep 2026 20:40:11 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:79da:8b9b:16b2:8431])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c284a8a2asm706032eec.1.2026.09.17.20.40.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 20:40:10 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/1] wifi: mac80211: drop oversized fragments to avoid extra_len overflow
Date: Fri, 18 Sep 2026 11:40:03 +0800
Message-ID: <20260918034004.85078-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Johannes and mac80211 maintainers,

During static analysis of fragment reassembly in mac80211, we identified
a potential 16-bit integer overflow in ieee80211_rx_h_defragment() that
can be triggered by a sequence of oversized fragments, leading to an
undersized allocation in pskb_expand_head() followed by skb_over_panic()
in softirq context.

In commit 69f132236827 ("mac80211: shrink struct
ieee80211_fragment_entry"), entry->extra_len was narrowed from unsigned
int to u16. Since up to 16 fragments (frag numbers 0..15) can be received
in an IEEE 802.11 sequence, a sequence of large incoming fragments can
cause entry->extra_len to exceed 65535 bytes, wrapping around modulo
65536. When the final fragment arrives, pskb_expand_head() only allocates
tailroom for the wrapped-around extra_len, and the subsequent
skb_put_data() loop overflows the buffer, triggering skb_over_panic().

Because valid MSDUs in IEEE 802.11 are far below U16_MAX (standard MSDU
is <= 2304 bytes, and A-MSDU cannot be fragmented), we prevent this wrap
by dropping the frame and purging the queued fragments if accumulating
the incoming fragment length would exceed U16_MAX.

This approach keeps struct ieee80211_fragment_entry completely untouched,
preserving the structure memory reduction from the aforementioned commit.

Best regards,
Yuchao Zhang

Yuchao Zhang (1):
  wifi: mac80211: drop oversized fragments to avoid extra_len overflow

 net/mac80211/rx.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.53.0

